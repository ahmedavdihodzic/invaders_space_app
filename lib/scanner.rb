class Scanner
  def initialize(radar, invader, threshold: 80)
    @radar = radar
    @invader = invader
    @threshold = threshold
  end

  def scan
    results = []
    y_range = (-@invader.height + 1)...@radar.height
    x_range = (-@invader.width + 1)...@radar.width
    #defines the range that includes every possible overlap of the invader and the radar

    y_range.each do |y|
      x_range.each do |x|
        on_edge = false
        top = [0, y].max
        left = [0, x].max
        #determines the start of the window (always non-negative)

        bottom = [@radar.height, y + @invader.height].min
        right  = [@radar.width, x + @invader.width].min
        #determines the end of the window (must not exceed radar size)

        on_edge = y < 0 || x < 0 || ((y + @invader.height) > @radar.height) || 
                                    ((x + @invader.width) > @radar.width)
        #sets on_edge to true if the invader is partially outside the radar

        h = bottom - top
        w = right - left
        #determines the window's height and width

        next if h <= 0 || w <= 0

        visible_cells = h * w
        total_cells   = @invader.height * @invader.width

        if on_edge && visible_cells < total_cells * 0.5
          next
        end
        #skips records if more than half of the window is outside the radar

        window = @radar.window(left, top, w, h)
        inv_slice = @invader.pattern[top - y, h].map { |r| r[left - x, w] }
        #cuts out the radar and invader windows to the required dimensions

        confidence = ConfidenceChecker.match(window, inv_slice)
        #compares the two windows

        if confidence >= @threshold
          results.push(ScanResult.new(@invader, x, y, confidence.to_i.to_s, on_edge))
        end
        #if threshold is met, pushes the record
      end
    end

    results
  end
end

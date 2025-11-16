
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

    y_range.each do |y|
      x_range.each do |x|
        on_edge = false
        top = [0, y].max
        left = [0, x].max

        bottom = [@radar.height, y + @invader.height].min
        right  = [@radar.width, x + @invader.width].min

        on_edge = y < 0 || x < 0 || ((y + @invader.height) > @radar.height) || 
                                    ((x + @invader.width) > @radar.width)

        h = bottom - top
        w = right - left
        next if h <= 0 || w <= 0

        visible_cells = h * w
        total_cells   = @invader.height * @invader.width

        if on_edge && visible_cells < total_cells * 0.5
          next
        end

        window = @radar.window(left, top, w, h)

        inv_slice = @invader.pattern[top - y, h].map { |r| r[left - x, w] }

        confidence = ConfidenceChecker.match(window, inv_slice)
        if confidence >= @threshold
          results.push(ScanResult.new(@invader, x, y, confidence.to_i.to_s, on_edge))
        end
      end
    end

    results
  end
end

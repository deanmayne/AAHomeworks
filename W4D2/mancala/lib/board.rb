class Board
  attr_accessor :cups, :name1, :name2

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14){[]}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup,i|
        if i != 6 && i != 13
            4.times do 
                cup << :stone
            end
        end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos > 14 || start_pos < 0
    raise "Starting cup is empty" if @cups[start_pos].empty?
    return true
  end

  def make_move(start_pos, current_player_name)
    pickup = @cups[start_pos]
    @cups[start_pos] = []
    i = start_pos
        until pickup.empty?
            i += 1
            i = 0 if i > 13
            if i == 6 && current_player_name == name1
                @cups[6] << pickup.pop
            elsif i == 13 && current_player_name == name2
                @cups[13] << pickup.pop
            else
                @cups[i] << pickup.pop
            end
        end
        render
        next_turn(i)
 end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
        :prompt
    end
    if @cups[ending_cup_idx].count == 1
        :switch
    end
    ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all? {|cup| cup.empty?} || @cups[6..14].all?{|cup| cup.empty?}
  end

  def winner
    if @cups[6].count == @cups[13].count
        :draw
    end

    @cups[6].count > @cups[13].count ? @name1 : @name2

  end
end

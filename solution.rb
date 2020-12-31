# a is array to be passed
def solution(a)
  if a.eql?(a.sort)
    -1
  else
    original_arr = a.clone
    no_cuts = 0
    if cut_required? a
      (0..original_arr.length).map{ |i| 
        a.delete_at(i)
        no_cuts+= 1 unless cut_required? a
        a = original_arr.clone
      }
      no_cuts
    else
      0
    end
  end
end

def cut_required? a
  prev_el , next_el = 0,0
  cut_required = true
    a.each_with_index do |element,index|
      break if index.eql?(a.length - 1)
      next_el = a[index + 1]
      prev_el = a[index - 1] unless index.eql?(0)
      if index.eql?(0)
        prev_el = element
      elsif index.odd? && element > prev_el && element > next_el
        cut_required = false
      elsif index.even? && element < prev_el && element < next_el
        cut_required = false
      else
        cut_required = true
      end
    end
    cut_required
end

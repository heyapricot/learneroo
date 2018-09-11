def build_pairs(points_array)
  points_array.each_slice(2).map{|i,j| [i,j]}
end

def distance_between_points(pair)
  Math.hypot((pair[0][0] - pair[1][0]),(pair[0][1] - pair[1][1]))
end

def closest_pairs_brute_force(points)
  min = Float::MAX
  point_max_idx = points.length - 1
  points.each_with_index do |sample, idx|
    points[idx+1..point_max_idx].each do |point|
      d = distance_between_points([sample,point])
      min = d if min > d
    end
  end
  return min
end
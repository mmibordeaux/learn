class Note
  def self.make score, slices
    note = 0
    slice_index = 0
    max_note_in_last_slice = 0
    puts "score #{score}"
    loop do 
      current_slice = slices[slice_index]
      max_score_in_slice = current_slice[0]
      max_note_in_slice = current_slice[1]
      puts "slice #{slice_index} [#{max_score_in_slice}, #{max_note_in_slice}]"
      score_in_slice = [score, max_score_in_slice].min
      points_in_slice = 1.0 * score_in_slice * (max_note_in_slice-max_note_in_last_slice) / max_score_in_slice
      puts "#{score_in_slice} score in slice becomes #{points_in_slice} points in slice"
      note += points_in_slice
      puts "note becomes #{note}"
      slice_index += 1
      no_more_slices = slice_index >= slices.count
      break if no_more_slices
      score -= score_in_slice
      no_more_score = score <= 0
      break if no_more_score
      max_note_in_last_slice = max_note_in_slice
    end
    note.round 2
  end
end
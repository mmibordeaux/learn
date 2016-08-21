module StudentsHelper
  def item_in_li title, text, note, note_max
    check = note > 0 ? '<i class="fa fa-check-circle-o correct"></i>' : '<i class="fa fa-circle-o"></i>'
    raw '
      <li class="row">
        <div class="row">
          <div class="col-md-1 is-done">
            <p>' + check + '</p>
          </div>
          <div class="col-md-9">
            <h2>' + title + '</h2>
            <p>' + text + '</p>
          </div>
          <div class="col-md-1 note">' + note.to_s + '/' + note_max.to_s + '</div>
        </div>
      </li>'
  end
end

class Admin::AchievementNotesController < Admin::ApplicationController
  def update
    @note = Achievement::Note.find params[:id]
    @note.update achievement_note_params
  end

  def achievement_note_params
    params.require(:achievement_note).permit(:value)
  end
end
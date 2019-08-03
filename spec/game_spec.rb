require 'game'

describe 'Game' do
  it 'will return win game' do
    game = Game.new('день')

    expect(game.word).to eq 'день'

    expect(game.status).to eq :in_progress

    game.check_user_letter('о')
    game.check_user_letter('д')
    game.check_user_letter('е')
    game.check_user_letter('н')
    game.check_user_letter('ь')

    expect(game.errors).to eq 1

    expect(game.status).to eq :win
  end

  it 'will return win game' do
    game = Game.new('йогурт')

    expect(game.word).to eq 'йогурт'

    expect(game.status).to eq :in_progress

    game.check_user_letter('и')
    game.check_user_letter('о')
    game.check_user_letter('ц')
    game.check_user_letter('к')
    game.check_user_letter('е')
    game.check_user_letter('т')
    game.check_user_letter('н')
    game.check_user_letter('ш')
    game.check_user_letter('щ')
    game.check_user_letter('з')

    expect(game.errors).to eq 7

    expect(game.status).to eq :loose
  end
end

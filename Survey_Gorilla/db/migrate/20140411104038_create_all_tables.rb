class CreateAllTables < ActiveRecord::Migration
  def change

    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest

      t.timestamps
    end

    create_table :surveys do |t|
      t.string :name
      t.integer :creator_id

      t.timestamps
    end

    create_table :responses do |t|
      t.integer :round_id
      t.text :choice_id

      t.timestamps
    end

    create_table :questions do |t|
      t.integer :survey_id
      t.text :question

      t.timestamps
    end

    create_table :choices do |t|
      t.integer :question_id
      t.text :choice

      t.timestamps
    end

    create_table :rounds do |t|
      t.integer :taker_id
      t.integer :survey_id
      t.boolean :taken
    end

  end
end

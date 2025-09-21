import SwiftUI

struct FlagImage: View {
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .clipShape(Rectangle())
            .cornerRadius(10)
            .shadow(radius: 15)
    }
}

struct GuessTheFlag: View {
    @State private var showingScore = false
    @State private var gameOver = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var lastScore = 0
    @State private var guessCount = 0
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
        
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .topTrailing, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)

                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Text("Guess Count: \(guessCount)")
                    .foregroundStyle(.white)

                Spacer()
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.white)
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                            .foregroundStyle(.white)
                    }
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagImage(imageName: countries[number])
                        }
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(Color.black.opacity(0.2))
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
            }
            .padding(.horizontal, 20)
        }
        
        .alert(isPresented: $showingScore) {
            switch gameOver {
                case true:
                    resetGame()
                case false:
                    askQuestion()
            }
            return Alert(title: Text("\(scoreTitle)"),
            message: Text("Your Score is \(lastScore)."))
        }
    }
    

    func flagTapped(_ number: Int) {
        
        guessCount += 1
        
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            lastScore = score
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
        }
        askQuestion()
        showingScore = true
        
        if guessCount == 8 {
            resetGame()
        }
   }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func resetGame() {
        gameOver = true
        scoreTitle = "Game Over!"
        score = 0
        guessCount = 0
    }
    
}

#Preview {
    GuessTheFlag()
}

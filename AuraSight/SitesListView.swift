import SwiftUI

// MARK: - Modello Dati
struct SiteItem: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let imageName: String
}

// MARK: - Vista Principale
struct ContentView: View {
    // Dati di esempio basati sull'immagine fornita
    let sites = [
        SiteItem(title: "Avella's castle", subtitle: "Medieval fortress", imageName: "avella_image"),
        SiteItem(title: "Frigento's civic and archaeological museum", subtitle: "Archaeological treasures", imageName: "frigento_image"),
        SiteItem(title: "Santa Maria delle Grazie's church", subtitle: "Sacred baroque art", imageName: "santamaria_image"),
        SiteItem(title: "Gesualdo's castle", subtitle: "Renaissance court", imageName: "gesualdo_image")
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Colore di sfondo azzurro chiaro
            Color(red: 0.89, green: 0.94, blue: 0.99)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Indicatore di trascinamento superiore
                Capsule()
                    .fill(Color.gray.opacity(0.4))
                    .frame(width: 40, height: 4)
                    .padding(.top, 12)
                
                // Intestazione
                HStack {
                    Spacer()
                    Text("Sites")
                        .font(.system(size: 20, weight: .bold))
                        .padding(.leading, 44) // Bilancia visivamente l'icona a destra
                    Spacer()
                    
                    Button(action: {
                        // Azione per il profilo
                    }) {
                        Image(systemName: "person.fill")
                            .font(.system(size: 16))
                            .foregroundColor(.white)
                            .frame(width: 40, height: 40)
                            .background(Color.blue)
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 16)
                
                // Lista scrollabile
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        ForEach(sites) { site in
                            SiteCardView(site: site)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 24)
                    .padding(.bottom, 110) // Spazio per non coprire i contenuti con la Tab Bar
                }
            }
            
            // Barra di navigazione inferiore personalizzata
            CustomTabBar()
        }
    }
}

// MARK: - Componente Card Singola
struct SiteCardView: View {
    let site: SiteItem
    
    var body: some View {
        HStack(spacing: 16) {
            // Immagine circolare
            // Nota: Sostituire con l'immagine reale presente negli Assets
            Color.gray.opacity(0.3) // Placeholder in attesa dell'asset
                .overlay(
                    Image(site.imageName) // Rimuovere l'overlay se l'immagine non è disponibile per testare il layout
                        .resizable()
                        .scaledToFill()
                )
                .frame(width: 80, height: 80)
                .clipShape(Circle())
            
            // Testo
            VStack(alignment: .leading, spacing: 4) {
                Text(site.title)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.black)
                    .fixedSize(horizontal: false, vertical: true)
                
                Text(site.subtitle)
                    .font(.system(size: 15, weight: .regular))
                    .foregroundColor(.black)
            }
            Spacer()
        }
        .padding(16)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 4)
    }
}

// MARK: - Componente Tab Bar Personalizzata
struct CustomTabBar: View {
    var body: some View {
        HStack {
            TabBarButton(title: "Sites", icon: "mappin.circle.fill", isSelected: true)
            Spacer()
            TabBarButton(title: "Quiz", icon: "gamecontroller", isSelected: false)
            Spacer()
            TabBarButton(title: "Diary", icon: "text.book.closed", isSelected: false)
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 12)
        .background(Color.white)
        .cornerRadius(40)
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: -2)
        .padding(.horizontal, 24)
        .padding(.bottom, 16)
    }
}

// MARK: - Componente Bottone Tab Bar
struct TabBarButton: View {
    let title: String
    let icon: String
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.system(size: 20, weight: isSelected ? .bold : .regular))
                .foregroundColor(isSelected ? .blue : .black)
            
            Text(title)
                .font(.system(size: 12, weight: isSelected ? .bold : .medium))
                .foregroundColor(isSelected ? .blue : .black)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 24)
        // Sfondo a pillola per l'elemento selezionato
        .background(isSelected ? Color.blue.opacity(0.1) : Color.clear)
        .cornerRadius(20)
    }
}

#Preview {
    ContentView()
}

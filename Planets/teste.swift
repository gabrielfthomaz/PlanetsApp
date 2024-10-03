
import SwiftUI

struct teste: View {
  
    let timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
    
   
    @State private var selectedImageIndex: Int = 0
    @StateObject var vm = ViewModel()
    @State  var aux: Astros?
    var body: some View {
        ZStack {
            
            Color.secondary
                .ignoresSafeArea()

           
            TabView(selection: $selectedImageIndex) {
                
                ForEach(vm.chars.sorted(by: { $0.eleVem < $1.eleVem }), id: \.self) { index in
                    VStack{
                        VStack{
                            ZStack(alignment: .topLeading) {
                                
                                AsyncImage(url: URL(string: index.image_url)) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                } placeholder: {
                                    Color.gray
                                }
                                .frame(width: 250, height: 250)
                                
                                Text(index.name)
                            }
//                            }.onAppear(){
//                                aux = index
//                            }
                        }
                        .shadow(radius: 20)
                        HStack{
                            Capsule()
                                .fill(Color.white.opacity(selectedImageIndex == Int(index.eleVem) ?? -1 ? 1 : 0.33))
                                .frame(width: 35, height: 8)
                                .onTapGesture {
                                    if let indexAsInt = Int(index.eleVem) {
                                        selectedImageIndex = indexAsInt
                                    } else {
                                        // Lida com o caso em que a conversão falha (opcional)
                                        print("Erro ao converter eleVem para Int")
                                    }
                                }
                        }            .offset(y: 130)
                    }
                }
            }
            .frame(height: 300)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea()

           
//            HStack {
//                ForEach(vm.chars, id: \.self) { index2 in
//                    Capsule()
//                        .fill(Color.white.opacity(selectedImageIndex == Int(aux!.eleVem) ?? -1 ? 1 : 0.33))
//                        .frame(width: 35, height: 8)
//                        .onTapGesture {
//                            if let indexAsInt = Int(aux!.eleVem) {
//                                selectedImageIndex = indexAsInt
//                            } else {
//                                // Lida com o caso em que a conversão falha (opcional)
//                                print("Erro ao converter eleVem para Int")
//                            }
//                        }
//                }
//                .offset(y: 130)
//
//            }
        }
        .onReceive(timer) { _ in
            withAnimation(.default) {
                if let eleVemInt = Int(aux?.eleVem ?? "0") { // Converte a String para Int
                    selectedImageIndex = (eleVemInt + 1) % (aux?.image_url.count ?? 1)
                } else {
                    print("eleVem não é um número válido")
                }
            }
        }


        .onAppear(){
            vm.fetch()
        }
    }
}

#Preview {
    teste()
}


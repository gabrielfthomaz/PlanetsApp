import SwiftUI
import Combine


// View do Carrossel Circular
struct teste: View {
  //  let images: [ImageModel]
    @State private var currentIndex: Int = 0

    @StateObject var vm = ViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(vm.chars, id: \.self) { index in
                    AsyncImage(url: URL(string: index.image_url)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .rotationEffect(.degrees(Double(index) * (360 / Double(vm.chars.count))) - Double(currentIndex) * (360 / Double(vm.chars.count)))
                                .offset(y: -geometry.size.width / 2 + 50)
                        case .failure:
                            Image(systemName: "exclamationmark.triangle")
                        }
                    }
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .onAppear {
                startCarousel()
            }
        }
    }

    private func startCarousel() {
        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
            withAnimation {
                currentIndex = (currentIndex + 1) % vm.chars.count
            }
        }
    }
}

// View principal
//struct teste: View {
//    @StateObject var viewModel = ImageViewModel()
//
//    var body: some View {
//        VStack {
//            if viewModel.images.isEmpty {
//                ProgressView("Carregando...")
//            } else {
//                CircularCarouselView(images: viewModel.images)
//                    .frame(width: 300, height: 300)
//            }
//        }
//        .onAppear {
//            viewModel.fetchImages()
//        }
//    }
//}

#Preview{
    teste()
}

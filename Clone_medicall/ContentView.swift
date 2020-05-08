import SwiftUI

struct ContentView: View { //ContentView: 메인
    var body: some View {
        VStack(spacing: 0) {
            Home()
        }
    }
}

struct ContentView_Previews: PreviewProvider { //ContentView로딩
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {// Home: 모든 구성요소의 집합체
    
    @State var isPresented: Bool = false
    @State var index = 1
    @State var offset : CGFloat = UIScreen.main.bounds.width //yh
    var width = UIScreen.main.bounds.width //yh
    
    var body: some View {
        VStack(spacing: 0) {
            
            AppBar(isPresented: $isPresented, index: $index, offset: $offset) //offset: self.$offset
            
            GeometryReader {g in
                HStack(spacing: 0) {
                    First() //스크롤뷰
                        .frame(width: g.frame(in : .global).width)

                    Scnd()
                        .frame(width: g.frame(in : .global).width)
                    
                    Third()
                        .frame(width: g.frame(in : .global).width)
                }
                .offset(x: self.offset)
            .highPriorityGesture(DragGesture()
            .onEnded({ (value) in
                
                if value.translation.width > 50 { // minimun drag...
                    print("right")
                    self.changeView(left: false)
                }
                if -value.translation.width > 50 {
                    self.changeView(left: true)
                }
            }))
            
                
            }
            
        }
        .animation(.default)
        .edgesIgnoringSafeArea(.all)
    }
    
    func  changeView(left: Bool){
        if left {
            if self.index != 3 {
                self.index += 1
            }
        }
        else {
            if self.index != 0 {
                self.index -= 1
            }
        }
        if self.index == 1 {
            self.offset = self.width
        }
        else if self.index == 2 {
            self.offset = 0
        }
        else {
            self.offset = -self.width
        }
        // change the width based on the sisze of the tabs...
    }
}

struct AppBar : View { //버튼을 담고있는 바
    
    @Binding var isPresented: Bool
    @Binding var index : Int
    @Binding var offset : CGFloat
    var width = UIScreen.main.bounds.width
    
    
    var body: some View {
        VStack(alignment: .leading, content: {
            HStack {
                Text("메디콜 공중전화")
                    .frame(height: 40)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.leading)
                    .padding(.top, 45.0)
                    .padding(.horizontal)
            Spacer()
                
                NavigationView {
                    
                    Text("")
                    .navigationBarItems(trailing:
                        Button(action: {
                            
                        }) {
                            Image(systemName: "bell.circle.fill")
                                .font(Font.system(.title))
                                .frame(minWidth: 10, maxWidth: 10)
                        }
                    )
                }                .background(Color.black)
                .frame(width: 50, height: 50)
            }
//                NavigationView {
//                    ListViews()
//
//                    DetailViews()
//                }
            
//                NavigationView {
//                    Button(action: {
//                        withAnimation {
//                            self.isPresented.toggle()
//                        }
//                    }, label: {
//                        Image(systemName: "magnifyingglass.circle.fill")
//                            .imageScale(.large)
//                            .foregroundColor(Color.green)
//                        })
////            .frame(width: 100, height: 80)
//                }
            
            HStack     {
                Button (action: {
                    self.index = 1
                    self.offset = self.width
                }) {
                    VStack(spacing: 8) {
                        HStack(spacing: 12) {
                            Text("홈")
                                .foregroundColor(self.index == 1 ? .white : Color.white.opacity(0.6))
                        }
                        Capsule()
                            .fill(self.index == 1 ? Color.yellow : Color.clear)
                            .frame(height: 4)
                    }
                }
                
                Button (action: {
                    self.index = 2
                    self.offset = 0
                }) {
                    VStack(spacing: 8) {
                        HStack(spacing: 12) {
                            Text("통화목록")
                                .foregroundColor(self.index == 2 ? .white : Color.white.opacity(0.6))
                        }
                        Capsule()
                            .fill(self.index == 2 ? Color.yellow : Color.clear)
                            .frame(height: 4)
                    }
                }
            }
        })
        .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)!) //yh
//        .padding(.horizontal)
            .background(Color("배경0"))
    }
}

struct First : View { //첫번째 뷰
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 0) {
                ForEach(0..<1) {i in
                    Image("imgSmartphone\(i)")
                        .frame(width: 420.0, height: 300.0)
                        .padding(.top, 80.0)
                    .background(Color("배경0"))
                }
            }
        }
        .padding(.bottom, 18) //보이지않는 화면 아래로 스크롤이 내려감
    }
}

struct Scnd : View { //두번째 뷰
    var body: some View {
        GeometryReader {_ in
            VStack {
                Text("Second View")
            }
        }
        .background(Color.white)
    }
}

struct Third : View { //세번째 뷰
    var body: some View {
        GeometryReader {_ in
            VStack {
                Text("Third View")
            }
        }
        .background(Color.white)
    }
}

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }
}

struct ListViews: View {
    var body: some View {
        List(0 ..< 1) { item in
            NavigationLink(destination: DetailView()) {
            Text("Tap to see more!")
            }
        }
//        .navigationBarTitle("hello, List")
    }
}

struct DetailViews: View {
    var body: some View {
        Text("hello ⚙︎")
    }
}

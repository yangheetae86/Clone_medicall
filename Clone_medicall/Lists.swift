import SwiftUI

struct Lists: View {
    var body: some View {
        NavigationView {
            ListView()
            
            DetailView()
        }
    }
}

struct Lists_Previews: PreviewProvider {
    static var previews: some View {
        Lists()
    }
}

struct ListView: View {
    var body: some View {
        List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
            NavigationLink(destination: DetailView()) {
            Text("Tap to see more!")
            }
        }
        .navigationBarTitle("hello, List")
    }
}

struct DetailView: View {
    var body: some View {
        Text("hello ⚙︎")
    }
}

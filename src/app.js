App = {
    load: async () => {
        await App.loadWeb3()
    },

    loadWeb3: async () => {
        if (window.ethereum) {
            const web3 = new Web3(window.ethereum);
            // Request the user to connect accounts (Metamask will prompt)
            await window.ethereum.request({ method: 'eth_requestAccounts' });
        
            // Get the connected accounts
            const accounts = await web3.eth.getAccounts();
        
            // Display the connected account
            document.getElementById('connectedAccount').innerText = accounts[0];
          } else {
            // Alert the user to download Metamask
            alert('Please download Metamask');
          }
    },

}

$(() => {
    $(window).load(() => {
        App.load()
    })
})
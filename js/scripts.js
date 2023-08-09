const textassets = document.querySelectorAll('.textasset');
Array.from(textassets).forEach((element, index) => {
    let textAssetName = element.getAttribute('text-asset-name');
    if (textAssetName == null) {
        element.innerHTML = `[Missing attribute 'text-asset-name']`
    } else {
        let url = `/assets/txt/${textAssetName}`
        fetch(url)
            .then(function(response) {
                if (response.ok) {
                    response.text()
                        .then(function(fetchedText) {
                            let innerHTML = fetchedText;
                            let postScripts = element.getAttribute("text-asset-postscripts");
                            if (postScripts != null) {
                                let scriptList = postScripts.split(';');
                                if (scriptList.includes('markdown')) {
                                    innerHTML = marked.parse(fetchedText);
                                }
                                // if (scriptList.includes('custom')) {
                                //     /* ... */
                                // }
                            } else {
                                innerHTML = fetchedText;
                            }
                            element.innerHTML = innerHTML;
                        })
                        .catch(function(error) {
                            element.innerHTML = `[Failed to unwrap text from "${url}" - ${error}]`;
                        })
                } else {
                    element.innerHTML = `[Failed to fetch content from "${url}" - ${response.status}]`;
                }
            })
            .catch(function(error) {
                element.innerHTML = `[Failed to fetch content from "${url}" - ${error}]`;
            })
    }
});
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944A456474;
	Mon, 11 Dec 2023 23:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tc0IIbB+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEA3AC433C7;
	Mon, 11 Dec 2023 23:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702337449;
	bh=AcOevYbz6iZkeAtHeOCevOBVVzhXykiP9TQBCZ3O6pU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tc0IIbB+kSDfsAzQedwPmbNah/vPGS0lHybypx1lJIq65IThM/AMDA6V3wwtwjFMI
	 0eGFv5KI3QOhJZxmPVxKtmfEwqnPIcGI0t8Fi14ZsBMYmkR9UKv93kCEaLKM2tHo64
	 nrtuUotQB11diqdI1Pm1MSNK+yX8tPyqGde2W0b1Xr/Tl/lAFVVtAQzcM3M7+DV7bv
	 JsM42BQbXZmeTt1TOSQTXxZ+MVa4IJYgi1Arkd3PO9u9MUV4FKkCv50Q5jsHEWiDzy
	 qgR08z5IRcNkZB1xq15YY0HMF2JYXTxBtJRtdkN/WK8DIWB6scmNpcmau/brGjOXzj
	 3ozaoMUE1itiQ==
Date: Mon, 11 Dec 2023 15:30:47 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Donald Hunter <donald.hunter@gmail.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Jonathan
 Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Jacob Keller
 <jacob.e.keller@intel.com>, donald.hunter@redhat.com
Subject: Re: [PATCH net-next v2 04/11] tools/net/ynl: Use consistent array
 index expression formatting
Message-ID: <20231211153047.43ecdef1@kernel.org>
In-Reply-To: <20231211164039.83034-5-donald.hunter@gmail.com>
References: <20231211164039.83034-1-donald.hunter@gmail.com>
	<20231211164039.83034-5-donald.hunter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 11 Dec 2023 16:40:32 +0000 Donald Hunter wrote:
> Use expression formatting that conforms to the python style guide.
> 
> Signed-off-by: Donald Hunter <donald.hunter@gmail.com>

Reviewed-by: Jakub Kicinski <kuba@kernel.org>

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D13156474;
	Mon, 11 Dec 2023 23:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aYe8sHkA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DC98C433C7;
	Mon, 11 Dec 2023 23:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702337287;
	bh=Td2tksWNEZTsFePt2Goqq++ee9OiHD3nprCtzBPchV0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aYe8sHkAHkKmE6Nzo4YoxVCaKNfd6hqk/HKlglrqDprNNZEChuYmNURL74xric7zO
	 ux0e/uYux8/ZRTllWd1+veKhJruRDri1OrVmhOL63uHDXZ5+2vGFIXX4nrVgFppuex
	 4XCchECV+VTt49xs/iZAiQixU4afkI4OZ8OpTWc/Cjo9rDPnrnatZPRb2OMPh1VfRJ
	 EU7AlAxoqUXPADdBfxCol0NBa+GkH1/OtbZGptj4DiFQQV1oaJ+pHZwD7Jis1VSfbU
	 kLP3loJAqGFgj1VW+G+k6s6pI7gBjvCPvoeGs1pOOA8jZIlAzXdSDEKxYGIN7sY/n6
	 M8gza4g0aoBLQ==
Date: Mon, 11 Dec 2023 15:28:06 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Donald Hunter <donald.hunter@gmail.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Jonathan
 Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Jacob Keller
 <jacob.e.keller@intel.com>, donald.hunter@redhat.com
Subject: Re: [PATCH net-next v2 01/11] tools/net/ynl-gen-rst: Use bullet
 lists for attribute-set entries
Message-ID: <20231211152806.42a5323b@kernel.org>
In-Reply-To: <20231211164039.83034-2-donald.hunter@gmail.com>
References: <20231211164039.83034-1-donald.hunter@gmail.com>
	<20231211164039.83034-2-donald.hunter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 11 Dec 2023 16:40:29 +0000 Donald Hunter wrote:
> The generated .rst for attribute-sets currently uses a sub-sub-heading
> for each individual attribute. Change this to use a bullet list the
> attributes in an attribute-set. It is more compact and readable.

This is on purpose, we want to be able to link to the attributes.
And AFAIU we can only link to headings.

The documentation for attrs is currently a bit sparse so the docs 
end up looking awkward. But that's a problem with people not writing
enough doc comments, not with the render, innit? :(

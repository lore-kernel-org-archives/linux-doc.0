Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AB22FC22;
	Mon,  4 Dec 2023 18:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eyjuCXnb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A9F8C433C8;
	Mon,  4 Dec 2023 18:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701714768;
	bh=FtUcn7SRQYfjfckqaWgd8rWFZjW7ZqdX1dw+LKg0zlA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eyjuCXnbu316mloUX3tTrLj0vzPaHjtyfxRoIcFi+G6a/1V40TnEZpIEnArYorpU2
	 iEj7Xu6n9FDqEbD9csIMplbWtsCARYwxdhvF7KFIPkoeCeEdnbSj9y/GqNdgwT5rXw
	 9k4Ja1I8mjg3KIZ07MY/BXqAVkoxKdLZlIq10oufVBcPHibcWZ86OC0HRl3MIx/r72
	 XKfqXpgiL5Kn6TuyZEzAdKKrSsy88Y6+hlXSV1W+4NoTd1B/Fq/Qb+1LYergmLhhZP
	 Xm0MiD4t37y2bdpes8CATSst38x5xxrTqq8O7zBx2nADJv0COi+cmBL6k3XDXezAzQ
	 aET+HuQHKyzEw==
Date: Mon, 4 Dec 2023 10:32:47 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Donald Hunter <donald.hunter@gmail.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Jonathan
 Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Jacob Keller
 <jacob.e.keller@intel.com>, donald.hunter@redhat.com
Subject: Re: [PATCH net-next v1 6/6] doc/netlink/specs: Add a spec for tc
Message-ID: <20231204103247.6476f4b4@kernel.org>
In-Reply-To: <m2zfyq53wz.fsf@gmail.com>
References: <20231130214959.27377-1-donald.hunter@gmail.com>
	<20231130214959.27377-7-donald.hunter@gmail.com>
	<20231201181325.4a12e03b@kernel.org>
	<m2zfyq53wz.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 04 Dec 2023 16:27:24 +0000 Donald Hunter wrote:
> > Ugh. Meaning the selector is at a "previous" level of nesting?  
> 
> That's right. I wonder if we should use a relative syntax like "../kind"
> for the selector. Will either need to pass the known attrs to nest
> parsing, or pass a resolver instead?

../kind is my first thought, too.

But on reflection I reckon it may make the codegen and Python parser
quite a bit more complex. :S

Passing in known selector attrs to nests sounds good. Assuming we never
have to do something like: "../other-nest/attr". 
Or perhaps in that case we can support passing in nested attrs, just
not backtracking? Backtracking is the hard part, really. Yeah, that
sounds simplest, at least at the "thought exercise level" :)

What would "resolver" look like?

BTW how do we deal with ordering. Do we require that selector attr 
must be present in the message before the submsg? I think in practice
is should always be the case, but we should document that.

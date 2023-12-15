Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271EA3BB36
	for <linux-doc@vger.kernel.org>; Fri, 15 Dec 2023 16:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="LSVTWPjI"
Received: from localhost (unknown [IPv6:2601:280:5e00:7e19::646])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 66FDC46A;
	Fri, 15 Dec 2023 16:14:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 66FDC46A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1702656840; bh=RnKt6c1jxgL8XT3bOhnksO5kRSFwJIZskt9kDs2ha8w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LSVTWPjIJyPdETw9sywVtbi4CgzD+tSuPdWmkkc/FjSoHi0ygiXa0TQRyH+7hWcEd
	 5lBZEJz9SGnatm8PtUqJkP0oYYCw3WbA0Scw1IvDrOoaIVQozOGhCCFSsyQgDHoSPj
	 +20PnUOYgI3ItQ9T96ecyVFSWpQTncRbg4XoDxluOhbrKNHnvp/7jO4XqFuM4e+1D2
	 k6sn/8VyjEsPRRBlx9hioOyb3g0Sg1CE12s+G499UzuIVMfY3DmXD/VdxX/7Nr+wH+
	 NCUPH43yFAV8mwE29Ect/pnlq3kZlDi5NwT+Cf9imx7x4WYlNoBsI1yZi90FUF5+T3
	 p6nWKsa1F/uBg==
From: Jonathan Corbet <corbet@lwn.net>
To: Donald Hunter <donald.hunter@gmail.com>, linux-doc@vger.kernel.org,
 David Gow <davidgow@google.com>, Akira Yokosawa <akiyks@gmail.com>
Cc: Donald Hunter <donald.hunter@gmail.com>
Subject: Re: [PATCH net-next] docs: Change <h4> style to use smaller font
 size than <h3>
In-Reply-To: <20231212213137.98453-1-donald.hunter@gmail.com>
References: <20231212213137.98453-1-donald.hunter@gmail.com>
Date: Fri, 15 Dec 2023 09:13:59 -0700
Message-ID: <87edfnqw8o.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Donald Hunter <donald.hunter@gmail.com> writes:

> The docs currently have <h3> and <h4> set to the same font size which
> makes headings hard to distinguish. <h1> to <h3> already have entries in
> sphinx-static/custom.css to shrink their size a bit from the alabaster
> theme.
>
> Add <h4> to custom.css and set it to be smaller than <h3>.
>
> Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
> ---
>  Documentation/sphinx-static/custom.css | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
> index 084a884f6fb7..a0ae9e90eeb6 100644
> --- a/Documentation/sphinx-static/custom.css
> +++ b/Documentation/sphinx-static/custom.css
> @@ -7,6 +7,7 @@
>  div.body h1 { font-size: 180%; }
>  div.body h2 { font-size: 150%; }
>  div.body h3 { font-size: 130%; }
> +div.body h4 { font-size: 110%; }

This didn't apply to docs-next; it looks like you built it against
something like 6.6?

I've done the merge and applied the patch, but it would make life easier
if future patches were done against the docs tree.

Thanks,

jon

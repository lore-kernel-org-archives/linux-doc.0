Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0225A0E9
	for <linux-doc@vger.kernel.org>; Thu, 11 Jan 2024 23:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fItaAYuk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=4iND/Bk03fPA0N7XwRSZdKJCtGYBKJlkhWN0FdiOAfI=; b=fItaAYukW+QV+nadDh8cxA7GzX
	FLaX9Sdwhcz8L0d54FatNl+LbsRva/+gSI3xgNAtmhcMsz62aljHU0dOFmf/MWvoiHtfb0LAWlu6L
	NGkA5hdxLl0+7t36M0zNJZHdfMyFmBUOBP9f3VWYCKojvig2rjx212luxlPmq1hOmppql/qYtL6QZ
	VlJIhiJXxaINkrs2kiUhtuEojDvBYPdyKB9gWm0x+njuTLzmwFiW/Mm60yPSAx4jX8YtCLETmtqvh
	GES0eXuAkWNJy47bP9cxFrUY0mDEoXkOQfyKNT32NwsVDFYDa+bHoG9Fm10b3puGPsgIgola/c9To
	y4r+Vogw==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rO4TU-001RFC-1H;
	Thu, 11 Jan 2024 23:28:36 +0000
Message-ID: <2149384e-8c90-4309-8f51-cd82973f52f3@infradead.org>
Date: Thu, 11 Jan 2024 15:28:36 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] docs: add blurb about target audience to
 maintainer-profile
Content-Language: en-US
To: Vegard Nossum <vegard.nossum@oracle.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
References: <20240111094838.3695697-1-vegard.nossum@oracle.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240111094838.3695697-1-vegard.nossum@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/11/24 01:48, Vegard Nossum wrote:
> It's good to be clear about who the intended target audience for any
> given piece of documentation is, as this will help us put new text in
> the correct place. Let's encourage submitters to state it explicitly
> rather than relying on where they placed it in the directory hierarchy
> as there isn't necessarily a one-to-one correspondence between them.
> 
> Target audience: documentation contributors and reviewers.
> 
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/doc-guide/maintainer-profile.rst | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/doc-guide/maintainer-profile.rst b/Documentation/doc-guide/maintainer-profile.rst
> index 755d39f0d407..db3636d0d71d 100644
> --- a/Documentation/doc-guide/maintainer-profile.rst
> +++ b/Documentation/doc-guide/maintainer-profile.rst
> @@ -27,6 +27,13 @@ documentation and ensure that no new errors or warnings have been
>  introduced.  Generating HTML documents and looking at the result will help
>  to avoid unsightly misunderstandings about how things will be rendered.
>  
> +All new documentation (including additions to existing documents) should
> +ideally justify who the intended target audience is somewhere in the
> +changelog; this way, we ensure that the documentation ends up in the correct
> +place.  Some possible categories are: kernel developers (experts or
> +beginners), userspace programmers, end users and/or system administrators,
> +and distributors.
> +
>  Key cycle dates
>  ---------------
>  

-- 
#Randy

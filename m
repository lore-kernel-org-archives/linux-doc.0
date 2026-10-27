Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793119267;
	b=yeIDE9VhJi06sKPg2NWS9scsnoyoWNRzkD4sOHoZw7+VNjlrsV0yhWPKnb5Vup+de0do
	 aA5oGLOeWNFxAZ4rT2iXeMCJbcTsoJVpW3XWcW0UIGlh3BUzjccaxDZjHvru6EpyCrUpz
	 GYJ374D+NKrq64n4qtRCJgcZd4L/QsN0SQjPA2OLNzCOWgNBZG4/+qJvFmgRUF+kRrN3w
	 dxszyfnSqcW5mO6JFY2q3rqkY6aCQ99Yv41XU+DvI2eb+1WOa6ipIEGBtNt90YoN5e8t4
	 PAa5lke6p16WjTrNX56UIX0usL24+KeMMZsUwljnjzOHbjK7/HVH2sB+AfR8zoLtojA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119267;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=HERcsqZd7vd4V9bxBla9XhKK3+UdB0XxSFvxN89NPRE=;
	b=zZmTKYb0GyrDu8s7IgjQ+MW4uSfY7b97HVfQb1m436+QXev1pnwLAcwVnjVyw9qaDILT
	 VgnZyB8TJppn9FA2cuioKw580epRNk+aM29VuLbFpEEscejIzEmWY0DOnz1v31BB1/x3h
	 rhGN7pDSwFf6JEe/2A2kuN29PMwU8qyQqRat3sRsSFkik+dZOq0EgpAnsCErLAFJ60jR5
	 +HNKaaZ0RYEQZ/BAREqhacNqrCd3pV5HTvCoBJDU1qOAER7bz3k0t60ZaePOHUA/KZ1FU
	 MZBID2CxIk1z6KUv3+EnGjuD90vR7hGrT68s2dkIIe/qdFlFJV4eE1AUY2D+ztC49Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F2B8Ypbt;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F09606A32E
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 16:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07F09606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F2B8Ypbt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=HERcsqZd7vd4V9bxBla9XhKK3+UdB0XxSFvxN89NPRE=; b=F2B8YpbtKlwLUvgvYuKbHC6Po0
	M8fepObn88GLfE3Sa6TyYGriGf0rHxsOsKOKMOyu9J5RZi2aaWH9Sv+6kc6WjBuo4Y7YWzGWHK61H
	8rmbKQ29AbTEtySNLig3SUSa54WpjZK4xdhIKbbX+WPrASl9Lb/+fCQcZu5YK1IZO9fStrUnrytQa
	gv8TjY2hALuJGNbsI9E8Jf9TRwt96Q4hfhothxEsMirzqw2duQRNNOqEjJWld+SdLBEuxv60V83Dx
	hLj+WoCAyo2QdNOmHcmLF/0aUrOu44ecgyocZkVLp1iCeT0oCEEJakybi1QiozNG0VvmhqY95immU
	OmQL23dw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLkEU-00000005Oe0-2678;
	Tue, 27 Oct 2026 16:41:06 +0000
Message-ID: <924f3b3c-a5e4-4686-abf8-0d4e23183a2e@infradead.org>
Date: Tue, 27 Oct 2026 09:41:05 -0700
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: make admin guide version-neutral
To: f1rul4yx <vargasgomezderequenadiego@gmail.com>, corbet@lwn.net
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org
References: <20261027102202.28218-1-vargasgomezderequenadiego@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20261027102202.28218-1-vargasgomezderequenadiego@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 10/27/26 3:22 AM, f1rul4yx wrote:
> Replace references to the 6.x series with version-neutral wording.
> Clarify that normal stable patches apply to the base release and that
> incremental stable patches are also available.
> 
> This change was prepared with AI assistance (OpenCode), which helped
> identify the outdated references and draft replacement text. The
> htmldocs build could not complete because Sphinx and documentation
> dependencies are missing; checkpatch.pl and git diff --check pass.
> 
> Signed-off-by: f1rul4yx <vargasgomezderequenadiego@gmail.com>
> ---
>  Documentation/admin-guide/README.rst | 41 ++++++++++++++--------------
>  1 file changed, 20 insertions(+), 21 deletions(-)

Did you test this change?

I get:

Documentation/admin-guide/README.rst:4: WARNING: Title underline too short.

Linux kernel release <http://kernel.org/>
======================================== [docutils]


> diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
> index 77fec1de6dc8..17c533fb0bba 100644
> --- a/Documentation/admin-guide/README.rst
> +++ b/Documentation/admin-guide/README.rst
> @@ -1,9 +1,9 @@
>  .. _readme:
>  
> -Linux kernel release 6.x <http://kernel.org/>
> -=============================================
> +Linux kernel release <http://kernel.org/>

I prefer:
   Linux kernel release notes ...
(with the underline extended even more)

> +========================================
>  
> -These are the release notes for Linux version 6.  Read them carefully,
> +These are the release notes for Linux.  Read them carefully,
>  as they tell you what this is all about, explain how to install the
>  kernel, and what to do if something goes wrong.
>  

The rest of the changes LGTM.
I had a personal note to do this so now I can delete it. :)

thanks.
-- 
~Randy


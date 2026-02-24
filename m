Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1200833EC;
	Tue, 24 Feb 2026 04:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771909028; cv=none; b=QZ775monPczAaGph2/oNLoyWJMIkt0t3MFsK6ML1cqw/8rNX6THIo1HHbYrytxRy0uYJ+Uu5lPSrdjzw6/YAM0c0ZPL49ngkKByQzMXkMvCfHIe47c5wklWj6FUDw5oyg0l1bT8wHTrWKVuLEKMP+GXnL6koKTVaRK/PYlLV0rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771909028; c=relaxed/simple;
	bh=AhhjjOASLbIaeW/z8zkeDg7A7hCTrNC0/vi9OGt4C6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uHobSVJKIbFm5ISVJEjfKD8c+nD/bCHlwHqBFZ20Ehcy37TdvQiXHfCxFaiDyzFk5r1bGCWRTvRDnK/d1hB89uL6XjBMN5d/fvorTqb9PuDBuO49G227DnWnMjApsn3jD07xw+lcrkokSzR44Z+eED6udmR5XTc7E6DkAOJ1jkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=GWspiLXh; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="GWspiLXh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KfsVo9a4VPe2XxpUgmbkc2AGH7Q08m0DArfgjXTC13U=; b=GWspiLXhxAjlUadKUnUUInIdo7
	M4ERPRZ7o/JlWfgt+T5LPbp8gF/By1NnwgmDJfZxWkn0q4EOqP94hHG5r3n8298ghmuqarTY2Bj1j
	wSpqQpPwiV9Sq2sAtod2oA5Xe/4fDEWeJwf2ZcNNiwl5gsSHwpn2kNljIn70J4Tal0P951M9q+tbh
	VpVQo4SkWslsvZEVXihDct3llEYFR7OLL2OIXp6TI5wf2oCOPsp/EFo14gKBwbRzQRtKIHGuV177L
	F09EXFHCDN0AGlj4N9xqmo7lccRfoMVAE1NP+KhJrrEW9rowRQwz43XdW52BFFfL+mB2GiQJb6N+i
	X69LTTgg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1vukWH-00000008LKO-0yQJ;
	Tue, 24 Feb 2026 04:59:37 +0000
Date: Tue, 24 Feb 2026 04:59:37 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: reflect equal support for gcc and clang
Message-ID: <20260224045937.GA1762976@ZenIV>
References: <20260224031132.14478-1-islamarifulshoikat@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224031132.14478-1-islamarifulshoikat@gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Tue, Feb 24, 2026 at 09:09:06AM +0600, Ariful Islam Shoikot wrote:
> Update the programming language documentation to reflect that both
> gcc and clang are fully supported compilers.
> 
> Signed-off-by: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
> ---
>  Documentation/process/programming-language.rst | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/process/programming-language.rst b/Documentation/process/programming-language.rst
> index c18e307ccb56..491138ae17cb 100644
> --- a/Documentation/process/programming-language.rst
> +++ b/Documentation/process/programming-language.rst
> @@ -4,10 +4,11 @@ Programming Language
>  ====================
>  
>  The Linux kernel is written in the C programming language [c-language]_.
> -More precisely, it is typically compiled with ``gcc`` [gcc]_
> -under ``-std=gnu11`` [gcc-c-dialect-options]_: the GNU dialect of ISO C11.
> -``clang`` [clang]_ is also supported; see documentation on
> -:ref:`Building Linux with Clang/LLVM <kbuild_llvm>`.
> +More precisely, it is compiled with either ``gcc`` [gcc]_ or
> +``clang`` [clang]_, both of which are fully supported, using

"Fully" is a bit of stretch.  Realistically, if you have x86,
arm/arm64, riscv or s390, it should work.  Beyond that... 

Quite a few architectures are in the "hopefully the resulting kernel
will work" state (ppc, mips) and it runs all the way through "if you
are lucky, it builds" (sparc64, IIRC), some requiring a fork of clang
(openrisc, for example), to "you are SOL, this target doesn't have
even an attempted out-of-tree support" (alpha and parisc, at least).

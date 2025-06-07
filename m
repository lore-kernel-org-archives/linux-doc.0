Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1779F20DD42
	for <linux-doc@vger.kernel.org>; Sat,  7 Jun 2025 12:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749298870; cv=none; b=mELGImyd5uvZ9AVH1aTAKGe/HrmfhYCFOzoPkVEw5HwmloxeU6jvq0+uA33+Oc5WMEmsmPAzam3k2AwZ5ud3cJw/jHYaNNV9HTdWIbMhSz1BbZwRFf5ri6/GoNnb7Nypn6ffjS7s8re8LILBem4ZwbHR+0vmtVJdFL2FH3DQXpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749298870; c=relaxed/simple;
	bh=XvJI5UClyerlsaGHeIyQRx39N1RfL/ZwBA5uVNroaWc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sJ5aVufKKXLangJXRXcFPbHJRscL5yDRGIVAPEccWdNDitASDNmfixI6BgT5US4wYGGoll9zY0scLh9p3pgKBhsR1cvbU1WBDoMzDO1MfqaibuTKvZ2pWwJHfoPJwyC66jYsw/WdfmxuV3cULazqTV2MD96Ys9GKZoZkZa29NIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B3Li0Gvl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B3Li0Gvl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEA65C4CEE4;
	Sat,  7 Jun 2025 12:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749298870;
	bh=XvJI5UClyerlsaGHeIyQRx39N1RfL/ZwBA5uVNroaWc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=B3Li0Gvl0AUUj3fBtNWwwBZOgV1X7DXh8hdqC6nl3QCC+WyWCXkYP+JI6Ltdjphk1
	 y3yM6m55hmpVGLwgsayXPK5ddYbR6SSUxYivPATzMlk4Jvv9ERKKOvdyI1XCJNTqCR
	 MxFQyHPszxZqFo+H2rxBae3+/aXnQUtV29RYEUvFU+Az6AjeqomHq2e1axqVxbwlV1
	 FbGl81XFiFXf9xFIRsjL57M/LoaFWPyd2KjNMPAmV4ldHpZ+3H1yFCsqn9u/EiRRvZ
	 FargVXbUW0GBZBT+9B4QzLcJgBmFDqzl0t8v45uauw38jNANPx3+a1o/MPAW15NAt+
	 boypjbbSFNLyQ==
Date: Sat, 7 Jun 2025 14:21:05 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] kernel-doc: Fix symbol matching for dropped suffixes
Message-ID: <20250607142105.2e768300@foz.lan>
In-Reply-To: <20250606141543.1285671-1-willy@infradead.org>
References: <20250606141543.1285671-1-willy@infradead.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri,  6 Jun 2025 15:15:42 +0100
"Matthew Wilcox (Oracle)" <willy@infradead.org> escreveu:

> The support for dropping "_noprof" missed dropping the suffix from
> exported symbols.  That meant that using the :export: feature would
> look for kernel-doc for (eg) krealloc_noprof() and not find the
> kernel-doc for krealloc().
> 
> Fixes: 51a7bf0238c2 (scripts/kernel-doc: drop "_noprof" on function prototypes)
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  scripts/lib/kdoc/kdoc_parser.py | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
> index 062453eefc7a..2c6143f7ca0f 100644
> --- a/scripts/lib/kdoc/kdoc_parser.py
> +++ b/scripts/lib/kdoc/kdoc_parser.py
> @@ -1171,16 +1171,24 @@ class KernelDoc:
>          with a staticmethod decorator.
>          """
>  
> +        # We support documenting some exported symbols with different
> +        # names.  A horrible hack.
> +        suffixes = [ '_noprof' ]
> +
>          # Note: it accepts only one EXPORT_SYMBOL* per line, as having
>          # multiple export lines would violate Kernel coding style.
>  
>          if export_symbol.search(line):
>              symbol = export_symbol.group(2)
> +            for suffix in suffixes:
> +                symbol = symbol.removesuffix(suffix)
>              function_set.add(symbol)
>              return
>  
>          if export_symbol_ns.search(line):
>              symbol = export_symbol_ns.group(2)
> +            for suffix in suffixes:
> +                symbol = symbol.removesuffix(suffix)
>              function_set.add(symbol)

For now, this sounds ok to me.

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

>  
>      def process_normal(self, ln, line):



Thanks,
Mauro

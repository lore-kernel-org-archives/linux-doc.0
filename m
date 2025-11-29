Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0E71EB1AA;
	Sat, 29 Nov 2025 15:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764429469; cv=none; b=UfSKfpVUfzHaz3Svj+V5sOdsT3ZClCDRTG9HHcmx5fe+RyT6YyOsVLZVkhpnNPtW4AWPuA7uH6Dti6z2ZHsRJ/s6Ld6uDfNgjiIxKKf4/SRci1Op7PwK3MLpEkiUXJZTSZaC5olohNibw9nKaeSpk4Ei9RQkpn5lb3/mdT1awQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764429469; c=relaxed/simple;
	bh=tHxIWZr6ihcN6PcfPj0aN//1fX6rfrbZGL31Nru2RDw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LAfu7Le9kk8ZdYq704NrBLg8Dcei/YUuc83/5F6Ck20/o2AdxOdwKLq16XSZCElIstKL5L6CJ5z1VYozkhZZ4xqkFqq8mqUhIgkF4Ewh9xfWTb/W4wi7kXm2oRND+nNwZxDPICXff4nNdS8hhhZVuojVU9nwQSqKTVMLVpZdPyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=dAU2g6vg; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="dAU2g6vg"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net AD0B1406FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1764429466; bh=JDvcAAbCCv089a2kpHS7taex3gPF8mPLjR/vV0hu0hA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dAU2g6vg3PF3UJMlaU2JFWMoKkJ/aI7jd/rx71rIgmWebX/4JHhS0qtN6qYqLqZQh
	 5I/LyIOv2EiTF8lqfU9ji3LeRwL3oRxiEO2hGheWJ+czG3k34OXmiy8RgouiheaEOC
	 L5ZaIqj6F1CfNqtKZRFMYcJ5IsgtkwooYTngxlrLMZ3nIqym25SjfoTsiLme3/bW4z
	 rrjzo5npvqUxDninp7lJuNhw0V6lpVgg21havk1Qj0tpNWoLrN46CFuTxQIQg+E4h5
	 nUyMl43cGQ0CAd2yKideLb3Iy8bQJgVYlKA4Yikm+GGaTmRfz7oEkC8fO7dNBlFY6C
	 hBKQcZ/cR6bVw==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id AD0B1406FB;
	Sat, 29 Nov 2025 15:17:46 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: MAINTAINERS: update Mauro's files/paths
In-Reply-To: <20251127063125.150441-1-rdunlap@infradead.org>
References: <20251127063125.150441-1-rdunlap@infradead.org>
Date: Sat, 29 Nov 2025 08:17:45 -0700
Message-ID: <87a504rhpi.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

> Update Mauro's F: (files/paths) entry for docs scripts so that
> get_maintainer.pl will report these correctly.
>
> This is copied from Jon's entries for these paths.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-doc@vger.kernel.org
> ---
>  MAINTAINERS |    2 ++
>  1 file changed, 2 insertions(+)
>
> --- linux-next-20251127.orig/MAINTAINERS
> +++ linux-next-20251127/MAINTAINERS
> @@ -7559,6 +7559,8 @@ M:	Mauro Carvalho Chehab <mchehab@kernel
>  L:	linux-doc@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/sphinx/
> +F:	scripts/kernel-doc*
> +F:	tools/lib/python/*
>  F:	tools/docs/

Applied, thanks.

jon

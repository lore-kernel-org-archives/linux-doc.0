Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B891991D8
	for <linux-doc@vger.kernel.org>; Tue, 13 Aug 2024 17:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723570369; cv=none; b=AeKDYTWbUZ56k+WbVUKbC4CaZ1Udt5Z99oO656wPm2CeXB7ifQ4bw8eaSGc+j91pd+QGFy2A1EFdYtJQ7Ggw3cCSVHCrCK6Z1e5m9hwKouTcDUOHR13M2zW3IocIRgr7KE93SkoFDRGt92JncXoNBeFzaHwUy7VMH9UML//EGHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723570369; c=relaxed/simple;
	bh=iRNF+QPCZBHMqifr4sIb/86ehrGMMYQFlj3XbMWlpiE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VR0OsqMZhcOnYX8KC84PX8ylnVo2Z75GNVRHwbJ4xavadCkxtcqViEm6sdx+30JC2ncGXeMyLaipwxfLhF4fgRFkvfA0smkrqRNSsCNQ9SWQXAcaQdJtcNfbnqynt8ghXfEzVDrCPMqkEZMjo8pbWkoSEXWnKtsjdWdzkpqmg3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=CCrj76UL; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="CCrj76UL"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A7AB341A88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1723570359; bh=QsBiBot+YA8Ztv4pv81Lvb2bm1tiBfhDUhmsdX54Gf4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CCrj76ULIL+Lw6R14fy+/R59XZTdTY7Lz/lDcY4NjmqNX1pDw5/cH8injVd56NH44
	 R9pFN+hFfXR00Umb7zXgXPxpsxY+o4jSyTD7OWT79y1roDp8ZiqygndIiNsPkWSjkX
	 0rI4fT+wv7jAB4siXS3/XrvO7oKASTCo+qLtSLAoZ8A25itD0TjTfCK2KaM8oNXgVf
	 HtA+o67qd2j7HBEehDi3+bvSr61iT/x2msfLMm1DFiuestLWpY2hLNuj2JpGw9xW0q
	 zMErGKX/EkQDt3HOPj3Jt/dXwqhOkdAwIuHOssBnlY7qM7UpTpNOsmYT9X97XtergI
	 ORkybYNF96v6Q==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A7AB341A88;
	Tue, 13 Aug 2024 17:32:39 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: surajsonawane0215@gmail.com, linux-doc@vger.kernel.org
Cc: Suraj Sonawane <surajsonawane0215@gmail.com>, Thorsten Leemhuis
 <linux@leemhuis.info>
Subject: Re: [PATCH] LFX Task: Fix grammar and spelling errors in
 reporting-issues.rst files
In-Reply-To: <20240813012457.388-1-surajsonawane0215@gmail.com>
References: <20240813012457.388-1-surajsonawane0215@gmail.com>
Date: Tue, 13 Aug 2024 11:32:38 -0600
Message-ID: <8734n88h1l.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thank you for working to improve our documentation!  I have a few
comments on this patch, though.

Please use scripts/get_maintainer.pl to generate the proper recipient
list for a patch.  I have added Thorsten, the author of the document you
are modifying, to the CC list here.  I am curious as to what led you to
add trivial@kernel.org?  We have not encouraged use of that address for
some years.

Please also consider your subject line; "LFX Task" is not meaningful to
anybody else, and will help nobody in the kernel change history.

> From: SurajSonawane2415 <sonawanesr2012@gmail.com>
>
>     1. Corrected the sentence structure in several places for clarity and=
 readability:
>         Original: "those are described below the step-by-step guide"
>         Corrected: "those are described below in the step-by-step guide"
>
>     2. Fixed grammatical errors:
>         Original: "That why your might need to uninstall the packages wit=
h such software to get rid of any 3rd party kernel module."
>         Corrected: "That=E2=80=99s why you might need to uninstall the pa=
ckages with such software to get rid of any 3rd party kernel module."
>
>     3. Improved phrasing:
>         Original: "might not what you want."
>         Corrected: "might not be what you want."
>
>     4. Clarified instructions:
>         Original: "Instead try search terms like the model line"
>         Corrected: "Instead, try searching terms like the model line."
>
> These changes ensure that the documentation is more readable and accurate.

There is no need to repeat all of the changes here - we can see those in
the patch itself.

> Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
> ---
>  Documentation/admin-guide/reporting-issues.rst | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/admin-guide/reporting-issues.rst b/Documentati=
on/admin-guide/reporting-issues.rst
> index 2fd5a0302..e68c1f8f1 100644
> --- a/Documentation/admin-guide/reporting-issues.rst
> +++ b/Documentation/admin-guide/reporting-issues.rst
> @@ -56,7 +56,7 @@ developers. It might be all that's needed for people al=
ready familiar with
>  reporting issues to Free/Libre & Open Source Software (FLOSS) projects. =
For
>  everyone else there is this section. It is more detailed and uses a
>  step-by-step approach. It still tries to be brief for readability and le=
aves
> -out a lot of details; those are described below the step-by-step guide i=
n a
> +out a lot of details; those are described below in the step-by-step guid=
e in a
>  reference section, which explains each of the steps in more detail.
>=20=20
>  Note: this section covers a few more aspects than the TL;DR and does thi=
ngs in
> @@ -299,7 +299,7 @@ face, even if they look small or totally unrelated. T=
hat's why you should report
>  issues with these kernels to the vendor. Its developers should look into=
 the
>  report and, in case it turns out to be an upstream issue, fix it directly
>  upstream or forward the report there. In practice that often does not wo=
rk out
> -or might not what you want. You thus might want to consider circumventin=
g the
> +or might not be what you want. You thus might want to consider circumven=
ting the
>  vendor by installing the very latest Linux kernel core yourself. If that=
's an
>  option for you move ahead in this process, as a later step in this guide=
 will
>  explain how to do that once it rules out other potential causes for your=
 issue.
> @@ -353,7 +353,7 @@ come up with other words to use as search terms. Also=
 make sure not to use too
>  many search terms at once. Remember to search with and without informati=
on like
>  the name of the kernel driver or the name of the affected hardware compo=
nent.
>  But its exact brand name (say 'ASUS Red Devil Radeon RX 5700 XT Gaming O=
C')
> -often is not much helpful, as it is too specific. Instead try search ter=
ms like
> +often is not much helpful, as it is too specific. Instead, try searching=
 terms like

I am not convinced this change improves things; the document is
suggesting the sort of search terms that might be useful.

>  the model line (Radeon 5700 or Radeon 5000) and the code name of the mai=
n chip
>  ('Navi' or 'Navi10') with and without its manufacturer ('AMD').
>=20=20
> @@ -472,7 +472,7 @@ before proceeding.
>  Note, you might not be aware that your system is using one of these solu=
tions:
>  they often get set up silently when you install Nvidia's proprietary gra=
phics
>  driver, VirtualBox, or other software that requires a some support from a
> -module not part of the Linux kernel. That why your might need to uninsta=
ll the
> +module not part of the Linux kernel. That's why you might be need to uni=
nstall the
>  packages with such software to get rid of any 3rd party kernel module.

Otherwise the actual changes look good.

Thanks,

jon

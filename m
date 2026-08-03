Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2243C2BEFEB;
	Mon,  3 Aug 2026 19:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785784435; cv=none; b=lIaLRlN5f5HrTFQej5A66Ygp2hXPypSp5tEDnpZaWXoIB4cMr2jMXxb/XoRGWmiVPAlZ9iTXisByYft25n2bJl4p88wyCgkRqbPLoKMWJxE+3kqzlOKZPc5s1gj+fW1qmfnW0KS3Q+To22C5RWhyaNMOtFUT9FKOr9MuoElD/Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785784435; c=relaxed/simple;
	bh=78iJK9wsUz90nMebuKNEtFGDgTTwdlsd4TCNrHdVW8o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lGPhU7zD8mqtzquuVxUAfHpa2c2BdX8o++trmZUu1W63goDF1iKbvUqOCoeblpWxWEKqETDpafWpPLGeVSyx/pK4UOHjZq5UFG1V1hbBe2s7BP7KtJMD+q6dkeP7cPC54AEhx1ZOB/iVwhfrPEwOBkixpXlPJ/olrumBm9rxnBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=MCPX2i7X; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="MCPX2i7X"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5EFB8408D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1785784433; bh=FgrmkpfJNn1cPt+5yH+u/2Ck428emW5X8GlyaMqXMGY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MCPX2i7XnVkHgt+TFkfH0uuDfRtHTQN0u64ZRPHPoxjWEyKcWW93CEOcVK8iyd3jg
	 4LQVwehbhy9iezQJmceVzOLItOp5QPuwtfC8swk5Ifu9nDTWsq2ub6xnQEv1vBiAW7
	 AGPXehXaKYHLF1C1q4NseETaRpLAvsWygUcOdT/GqNzAGDP88UFHKU7w0Gjtvw1SNA
	 ubJ8LBLBYClCcmZOdOZ8gDSAPRC9cPnJAY7zzPufvL/bQIcTn9PmoXJhD5OpOdWko6
	 RcHp7WNtu17xFJrpEhoAkc1MWjPMu6HlzbHr2mvxGYeQXn2TSibFJatSTC/Rc3LR+y
	 5XUJ1OYBWLGAw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5EFB8408D2;
	Mon,  3 Aug 2026 19:13:53 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Antonin Godard <antonin.godard@bootlin.com>, Shuah Khan
 <skhan@linuxfoundation.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Antonin Godard
 <antonin.godard@bootlin.com>
Subject: Re: [PATCH 0/2] Documentation: html: show sections in the sidebar
In-Reply-To: <20260803-show-sections-in-sidebar-v1-0-b4fdc847525d@bootlin.com>
References: <20260803-show-sections-in-sidebar-v1-0-b4fdc847525d@bootlin.com>
Date: Mon, 03 Aug 2026 13:13:52 -0600
Message-ID: <87cxvzxbin.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Antonin Godard <antonin.godard@bootlin.com> writes:

> The current sidebar in the HTML version of the documentation does not
> display the section titles because the toctree directives in the
> top-level index.rst document do not contain ":caption:" properties.
> Replacing the current section titles by ":caption:" properties would not
> allow having text between those and the table of contents.
>
> To workaround this issue, add the ":caption:"=C2=A0properties in the toct=
ree
> calls which makes them show up in the sidenbar, but hide them from the
> index page with a custom CSS addition.
>
> Additionally, make the section titles in the sidebar bold to make them
> stand-out.
>
> This makes the overall structure of the documentation clearer from the
> sidebar directly.
>
> PS: This is how I've implemented this in the Yocto Project
> documentation[1] where I faced the same issue. See also the index.rst
> file[2] (which was by the way inspired by the kernel's own index.rst)
> and CSS addition[3].
>
> [1]: https://docs.yoctoproject.org/dev/
> [2]: https://git.yoctoproject.org/yocto-docs/tree/documentation/index.rst
> [3]: https://git.yoctoproject.org/yocto-docs/tree/documentation/sphinx-st=
atic/theme_overrides.css#n106
>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
> Antonin Godard (2):
>       Documentation: html: show sections in the sidebar
>       Documentation: html: make sidebar section titles bold
>
>  Documentation/index.rst                |  8 ++++++++
>  Documentation/sphinx-static/custom.css | 11 +++++++++++
>  2 files changed, 19 insertions(+)

This looks like it could be a nice improvement, but I have a couple of
thoughts...

- Did you check the PDF build to be sure that the captions don't intrude
  in some sort of obnoxious ways?

- I'd tweak the CSS to remove the white space below the section
  headings, just to bind them to their subsections properly.

Thanks,

jon

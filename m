Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79B13CF662;
	Wed,  5 Aug 2026 19:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785958879; cv=none; b=WS6r10KGgZqMqc8Aym2K3HRTOrxSgYvI/y5w414z7eXI4tITJmsp/CHSAlEfLdgVYgJN6aXPkua3a/BEs70aw0wXN8o1w388uKiBJLlvQZzWn/JMFfjOnVU0ysKi3eBTzvpYnvNVUotIZM1omPr/OjDSn5CNKYRmGPWJbWCRYp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785958879; c=relaxed/simple;
	bh=7eCUHjqf10Sfide+DcRAXtZm6UFBFtGzPMhSRet/uDE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=j/qZwMRXVICWwpoLS7Z5GZbnIYtgegpDGeb+XrXxIjAN8VNW1XSlFEKjJ47FBpORLMmeb2xPFuoJXdrXWqA7ObNd6dSOFRqXN9gzPOxyYJBrWgEloxnsdkdU6Yh/p7KU2335zQZhONeqdRPYsI/gExb14rIrmLXC6cm0JRigoKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=IpwKtDo9; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="IpwKtDo9"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net ED176408B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1785958877; bh=j3Vj3P+TQ7ZmiAhCA3sfHlfJ1Tg4S/64aLu0GQtvO9g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=IpwKtDo91KG+n/+Z4X8x3/tHatKZ/hq0zW2+O0K0xrQVJqK242RMG7y/kTR31dDBi
	 86/yLsKTm222zY+lTgRonfoWS5TVGsMiACGAdrWexgde7G6/JJNmUm8Q3PZFjRpeGO
	 F46MY8WXw0J0mFevD1+a88ZMBWmCS5DNRv293/uPwwWZiHiVI/LWZu6b/X38hnhNzb
	 YYcfeFgqEASkDiSWdYNPe8hZuzMdlwAAmE8vw+FcNm+z/dqIV5tb1KODfnHwVJlRlj
	 UloCcdtbB/C70spOIm6uuuJczZW8CESwgeqdyNyV4NcuOrjgEAxRHzwzzbqVdityaq
	 9zhvvrD1f0YOQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id ED176408B2;
	Wed,  5 Aug 2026 19:41:16 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Antonin Godard <antonin.godard@bootlin.com>, Shuah Khan
 <skhan@linuxfoundation.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Antonin Godard
 <antonin.godard@bootlin.com>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2 0/2] Documentation: html: show sections in the sidebar
In-Reply-To: <20260804-show-sections-in-sidebar-v2-0-a68d23bbc79d@bootlin.com>
References: <20260804-show-sections-in-sidebar-v2-0-a68d23bbc79d@bootlin.com>
Date: Wed, 05 Aug 2026 13:41:16 -0600
Message-ID: <87tsp8nyn7.fsf@trenco.lwn.net>
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
> calls which makes them show up in the sidebar, but hide them from the
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
> Changes in v2:
> - Apply RB and TB from Randy on patch 1/2.
> - Remove whitespace before section title and first subsection.
> - Link to v1: https://patch.msgid.link/20260803-show-sections-in-sidebar-=
v1-0-b4fdc847525d@bootlin.com

You didn't answer my question about the PDF build.  It's easy to break
that build, and easy to forget to check it...trust me, I know.  I did
check it, and it all seems fine.

So the patches are applied, thanks.  I did tweak the CSS slightly:

diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-=
static/custom.css
index 34aaa424a75c..6c03dca44c82 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -87,7 +87,8 @@ section#the-linux-kernel-documentation p.caption { displa=
y: none; }
  * Make section titles bold in the sidebar, and decrease their bottom marg=
in to
  * group them with their subsections.
  */
-div.sphinxsidebar p.caption { font-weight: bold; margin-bottom: -10px; }
+div.sphinxsidebar p.caption { font-weight: bold; margin-bottom: 0; }
+div.sphinxsidebar p.caption + ul { margin-top: 0; }
=20
 /*
  * The CSS magic to toggle the contents on small screens.

This way more directly expresses the intent, and will (hopefully) cause
things to continue to work properly in the face of an Alabaster version
that changes the margins.

Thanks,

jon

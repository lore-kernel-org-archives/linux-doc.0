Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58AF3EBF1E;
	Sat, 24 Jan 2026 07:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769240545; cv=none; b=uvMym5fQfIplbWzPTvBiTjknfASLnqM3UEBIRmp2gsvhxDJPEvgu4wLXRnmriTB31MCXwy1YUnbvRWEvhT0t9nxp7LsMbEi0AGlzY7BmFVuos8shyrAYmPXAX0249IsBWhI0137Vw3XLambaHgZiYQI0tq6DLFe6vlsfQuWMpiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769240545; c=relaxed/simple;
	bh=VHm6IrccGhvfukP9WjQsMeGsBanBTm7F6UyQJtIwu9w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jf7GPGlKON9jAwFCIHaxR0gY+8vEZSnXYOg1ysRw7ux07uU8oKvaO4/VaRktXXd5qXPbzd9BaoGJ9+xtUiE5QjZMPem2ghmCO/+84zbkjdaHSbineXpT2LARScdwBdYsyP5oca78avH0CcVSngd4US8Gbyr9Orf9at4mz/o9FiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CDAOf3gz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CDAOf3gz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C235DC116D0;
	Sat, 24 Jan 2026 07:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769240545;
	bh=VHm6IrccGhvfukP9WjQsMeGsBanBTm7F6UyQJtIwu9w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CDAOf3gzMID0hFd0622CfcOdwQGhOMfcRUEsciSD9wxswvbJ1c6W0Kwktki//IdCT
	 7WfD129ITnrVmXrfZ1V/tqgRWxEguxDj8Uhj/dVx+vg83iC2rQ51CASEUYVxPLA0Op
	 MdDYqZHO3a67LCmSuct9Yv96LGzOpTYm71WdeGz3CSLtb7pbOcwWfsptqtx6zCXLzM
	 v8MUtXm10EUmFcb4Gqjuy6D96Y87wBe5Mg1hOZ/NXQqUk8ZoA5GWN/IV7arWTQj+HM
	 FqCJ4LDG6Pau0VbzjQzheQJ7v58gCU9VLnHdmjgkdIHgd3cZT7ShKQGk+aPT8UxcyG
	 2cKwjpCZsravw==
Date: Sat, 24 Jan 2026 08:42:21 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] docs: kdoc: Fix pdfdocs build for tools
Message-ID: <20260124084221.1d400384@foz.lan>
In-Reply-To: <281c27c9-1c0a-4cdc-9250-b1fb6388c14e@gmail.com>
References: <1a60aea3155a2e7c5e7bb004952739652407fb8c.1769233717.git.mchehab+huawei@kernel.org>
	<281c27c9-1c0a-4cdc-9250-b1fb6388c14e@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 24 Jan 2026 15:56:46 +0900
Akira Yokosawa <akiyks@gmail.com> wrote:

> On Sat, 24 Jan 2026 06:48:41 +0100, Mauro Carvalho Chehab wrote:
> > the "\1" inside a docstring requires proper scaping to not be
> > considered a hex character and break the build.
> >=20
> > Reported-by: Akira Yokosawa <akiyks@gmail.com>
> > Closes: https://lore.kernel.org/linux-doc/63e99049-cc72-4156-83af-414fd=
de34312@gmail.com/ =20
>=20
> This doesn't look like working as expected.
>=20
> I see:
>=20
>     if r=E2=80=991=E2=80=99 is used ...
>=20
> in both the HTML and PDF outputs.  I think what you expect is:
>=20
>     if r=E2=80=99\1=E2=80=99 is used ...
>=20
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  tools/lib/python/kdoc/kdoc_re.py | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/tools/lib/python/kdoc/kdoc_re.py b/tools/lib/python/kdoc/k=
doc_re.py
> > index 2816bd9f90f8..dae5a9136fbf 100644
> > --- a/tools/lib/python/kdoc/kdoc_re.py
> > +++ b/tools/lib/python/kdoc/kdoc_re.py
> > @@ -228,7 +228,7 @@ class NestedMatch:
> >              yield line[t[0]:t[2]]
> > =20
> >      def sub(self, regex, sub, line, count=3D0):
> > -        """
> > +        r"""
> >          This is similar to re.sub:
> > =20
> >          It matches a regex that it is followed by a delimiter, =20
>=20
> To get the expected "\1", I guess you also need:
>=20
> @@ -234,7 +234,7 @@ class NestedMatch:
>          It matches a regex that it is followed by a delimiter,
>          replacing occurrences only if all delimiters are paired.
> =20
> -        if r'\1' is used, it works just like re: it places there the
> +        if r'\\1' is used, it works just like re: it places there the
>          matched paired data with the delimiter stripped.
> =20
>          If count is different than zero, it will replace at most count
>=20
> as well.  No?

True, but this makes it harder for people reading the code to understand=20
what it means. I wish Python regex would support "$1" also
as a replacement for "\1" like Perl, but it doesn't.

Sent a v2 using a code-block instead.


Thanks,
Mauro

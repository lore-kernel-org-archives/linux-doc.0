Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2473C76BD
	for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 13:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781703853; cv=none; b=s59GRHXrN2sRiv+UFAQKvzwD2J9j+4KPaGWkXadx29lVVl2cICRn9JNs3yga1Um2a0/cHq6wt/yWklscvaqlJ7/RI6GttFZRCRiTcUbG4dAhBNRg7EirunI8r7u7VxmyqwY+2uahkoWryRsRaAZJhaM75PbRaoa6Zjgiic+kBmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781703853; c=relaxed/simple;
	bh=wkM9FZHFLEON1BczZ+eN3JGO5wBLXPVubKTEg3A3bNE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f/xrTGCwDqAcKVgtcIsN8EYN6tHNp1cvzHUBXvR7XV/KKzfwEYw3Sox1TBmFMihhIPrsH+6bdW4MV7m8fjsvPHgMHcjbnUBjVBfxl/4N7rFAW5Z27rUooLEFwKbOsSeF1Syw6pZq0YRxOku2sOrrtQixcqAKg2/jNggtGs0iYjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vaga.pv.it; spf=pass smtp.mailfrom=vaga.pv.it; dkim=pass (2048-bit key) header.d=vaga.pv.it header.i=@vaga.pv.it header.b=Gjg4YeM7; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vaga.pv.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaga.pv.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaga.pv.it header.i=@vaga.pv.it header.b="Gjg4YeM7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaga.pv.it;
	s=protonmail; t=1781703832; x=1781963032;
	bh=EoxA47SmotnRmpFZ1j7bSFQM+MWj54nxS+0MrEFLnOs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Gjg4YeM7SOMMSHXaqLIeTV45OssNM5tiM+Te9StxgY57MpZ3k0QfaIBveexj+0Ezp
	 7I60zAIHzoOGdI30rPKtGRb1cHIGigUs7oN0RA0hZveKiaj+uDh2JKsksMZB248lUa
	 QCMAT38D6G4zqkTlt+tO9WMm2LsLQXcsy+NwrMiFudmPzvtWf/cERjZMHw8S45iRqY
	 ka2NO/sy/BInG3UfU98tS3G41wJ1FIrkCA0RlD5a5eXbQfKg8+MaxzSSgykkfP+LOi
	 /bdiYPR9TCCtYf0iStOJOFX6pTYJSk5/AHIXmGX4urORf1VNxo+BlhD99QmRDRElX+
	 UgGVpL2X0eiNg==
Date: Wed, 17 Jun 2026 13:43:10 +0000
To: Doehyun Baek <doehyunbaek@gmail.com>
From: Federico Vaga <federico.vaga@vaga.pv.it>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH] Docs/translations/it_IT: update current minimal requirements
Message-ID: <zJRp95X2zpOwl0JF9O3s_dQfHMeozA4ondxH1RSqBj9KK4jYkV3pWJpNwavq6WlYNbGv3BVBxK8jyc-VhlU62IlfBVhFnGQqnkz71efYe2w=@vaga.pv.it>
In-Reply-To: <20260617085305.3205822-1-doehyunbaek@gmail.com>
References: <20260617085305.3205822-1-doehyunbaek@gmail.com>
Feedback-ID: 124726690:user:proton
X-Pm-Message-ID: d32c9680cc7bd470a2ce6994bfeed45c624ffd8d
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi and thank you Doehyun.

It looks all good to me.


Federico Vaga


mercoled=C3=AC 17 giugno 2026 10:53, Doehyun Baek <doehyunbaek@gmail.com> h=
a scritto:

> Update the Italian translation of the current minimal requirements table =
to
> match Documentation/process/changes.rst.  The translated table still list=
ed
> older versions for Rust, bindgen, pahole, Sphinx, and Python.
>=20
> Signed-off-by: Doehyun Baek <doehyunbaek@gmail.com>
> Cc: Federico Vaga <federico.vaga@vaga.pv.it>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> ---
>  Documentation/translations/it_IT/process/changes.rst | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/translations/it_IT/process/changes.rst b/Docum=
entation/translations/it_IT/process/changes.rst
> index 7ee54c972418..1f89bae7b6c2 100644
> --- a/Documentation/translations/it_IT/process/changes.rst
> +++ b/Documentation/translations/it_IT/process/changes.rst
> @@ -34,14 +34,14 @@ PC Card, per esempio, probabilmente non dovreste preo=
ccuparvi di pcmciautils.
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>  GNU C                  8.1                gcc --version
>  Clang/LLVM (optional)  17.0.1             clang --version
> -Rust (opzionale)       1.78.0             rustc --version
> -bindgen (opzionale)    0.65.1             bindgen --version
> +Rust (opzionale)       1.85.0             rustc --version
> +bindgen (opzionale)    0.71.1             bindgen --version
>  GNU make               4.0                make --version
>  bash                   4.2                bash --version
>  binutils               2.30               ld -v
>  flex                   2.5.35             flex --version
>  bison                  2.0                bison --version
> -pahole                 1.16               pahole --version
> +pahole                 1.26               pahole --version
>  util-linux             2.10o              mount --version
>  kmod                   13                 depmod -V
>  e2fsprogs              1.41.4             e2fsck -V
> @@ -60,12 +60,12 @@ mcelog                 0.6                mcelog --ve=
rsion
>  iptables               1.4.2              iptables -V
>  openssl & libcrypto    1.0.0              openssl version
>  bc                     1.06.95            bc --version
> -Sphinx\ [#f1]_         2.4.4              sphinx-build --version
> +Sphinx\ [#f1]_         3.4.3              sphinx-build --version
>  cpio                   any                cpio --version
>  GNU tar                1.28               tar --version
>  gtags (opzionale)      6.6.5              gtags --version
>  mkimage (opzionale)    2017.01            mkimage --version
> -Python (opzionale)     3.5.x              python3 --version
> +Python (opzionale)     3.9.x              python3 --version
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>=20
>  .. [#f1] Sphinx =C3=A8 necessario solo per produrre la documentazione de=
l Kernel
> --
> 2.43.0
>=20
> 

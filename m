Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6A74D58A
	for <linux-doc@vger.kernel.org>; Wed,  1 May 2024 07:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714549800; cv=none; b=rt7qsmdgy/x/UJcrEw8LyjNB+C6IuB/MgEY7HkqJiTIpnB/VZKwUU0LIYSfEOKMx9udpXHdAyLMfEtrWnlHL2AasSQzqqw41GP4AB/V4gh/k2YGXeb+34EcSFozIQP/yg9r4TlyZ8gQW3FZnLBl4rKog8F2/M+Q+cd4R3he8nqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714549800; c=relaxed/simple;
	bh=oeD98aa6nZC3GHQ4F2QupEm5uFuAx1L+MtY/bk6xP2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F955Rch3PwpfuysiaU4UQAkepkGVbkoXwv8V+2NXY500FV6rWO9neRe0ScaXfDzXYVCZMI84p4ahMLRFlBcd5vCc2Rajt8qDrejunQihKcJAMo8wNdJ0r+jcPnp4i5K4WAsXqgFFNClHCbHhHQcAZsyyosnhBDDV2CZ1rE7ca0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U3z16Por; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U3z16Por"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5aa2551d33dso4366036eaf.0
        for <linux-doc@vger.kernel.org>; Wed, 01 May 2024 00:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714549797; x=1715154597; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r5ES/1fo0+YQ2s0s2n1hJlTL6WCq1v2GBEvIHKIXAiU=;
        b=U3z16PorDK34Eld6lpQoqJnhAXoOGgDI2uxBQi+fr9M3e5rMaTQu1R21K96ZLhPOlx
         hMQx4VezD5NzcF9tYmWilyq+Jic+RJhtkLT9Fi5gjDNXAaQXzHYJ4n+VL4lTC5kKl7CD
         KH/RUKCrAWJtUgXIG25GID7uJbaabbwU5XqxJPPy7pgtyAuDqz7V94FsHcxXgWy7zE/W
         PfTbSRFcR51GVy9PIz0kZieRV3BPQdmPwoMAcJGa6PiKGZQKB5KyQWMjlUgVXQbskKt/
         0nznWghoILbDX9lghBXTtJ0G6DK7Rt8BRqe/ut+WLlCkaAZYJJBPaSDeyahtLLnUPOyL
         NLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714549797; x=1715154597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r5ES/1fo0+YQ2s0s2n1hJlTL6WCq1v2GBEvIHKIXAiU=;
        b=ASuDAku/+AcA/bVmvAsjz97lI70wENslGb1zrFZ9pSBNFLPfdVdXL7g2FDlC1YL7tU
         5svDNON/AN1kmrz39Vlfmi/1Cy+hrls12LGAWo9RPi4JqypG9Rv3f210hQjfgzkF7vPX
         SXluA44az39yujOmv2iMeDZswVlpIxOWoWK8yyoRP9qKSiqY9nrRPpzxbPcY6p1yg781
         24Ooi1bY8Ae+P16Izp4fc0HiLArRj0YkXVBgQkMuhG08Wf2GQuOAn4FXJ4291+ZS3JWa
         Lrc/x1pU1EoTpUxGRfeuWHRLKZtCDrLhRl58d1gCqQLWfES0YI2pbZgY5XU/N4YiPhQT
         iCQQ==
X-Gm-Message-State: AOJu0YzyeI/Pq0T0Jz80OqML0i4z09sxWxkenIu7ZhI/LUQABLG8dLbW
	ZYDowB6LnVz6WndIyD3HQguFhyxWAt+MqJFEB3+lL131a3nLvVAa
X-Google-Smtp-Source: AGHT+IFMqbgrVm6MjPLsd7XyvtWxZPNquYJtiNkjSTuoKYbKJIHttE9StSSCarRDSP1diagijtkkCw==
X-Received: by 2002:a05:6359:a115:b0:18a:634a:6cfc with SMTP id kl21-20020a056359a11500b0018a634a6cfcmr2383141rwc.22.1714549797302;
        Wed, 01 May 2024 00:49:57 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 9-20020a630b09000000b005dbed0ffb10sm22135611pgl.83.2024.05.01.00.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 00:49:56 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id A962118462B23; Wed, 01 May 2024 14:49:54 +0700 (WIB)
Date: Wed, 1 May 2024 14:49:54 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: kernel_include.py: Cope with docutils 0.21
Message-ID: <ZjH0IgP-X62924N5@archie.me>
References: <faf5fa45-2a9d-4573-9d2e-3930bdc1ed65@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="boTE1sbGc0ojQHI4"
Content-Disposition: inline
In-Reply-To: <faf5fa45-2a9d-4573-9d2e-3930bdc1ed65@gmail.com>


--boTE1sbGc0ojQHI4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 01, 2024 at 12:16:11PM +0900, Akira Yokosawa wrote:
> Running "make htmldocs" on a newly installed Sphinx 7.3.7 ends up in
> a build error:
>=20
>     Sphinx parallel build error:
>     AttributeError: module 'docutils.nodes' has no attribute 'reprunicode'
>=20
> docutils 0.21 has removed nodes.reprunicode, quote from release note [1]:
>=20
>   * Removed objects:
>=20
>     docutils.nodes.reprunicode, docutils.nodes.ensure_str()
>         Python 2 compatibility hacks
>=20
> Sphinx 7.3.0 supports docutils 0.21 [2]:
>=20
> kernel_include.py, whose origin is misc.py of docutils, uses reprunicode.
>=20
> Upstream docutils removed the offending line from the corresponding file
> (docutils/docutils/parsers/rst/directives/misc.py) in January 2022.
> Quoting the changelog [3]:
>=20
>     Deprecate `nodes.reprunicode` and `nodes.ensure_str()`.
>=20
>     Drop uses of the deprecated constructs (not required with Python 3).
>=20
> Do the same for kernel_include.py.
>=20
> Tested against:
>   - Sphinx 2.4.5 (docutils 0.17.1)
>   - Sphinx 3.4.3 (docutils 0.17.1)
>   - Sphinx 5.3.0 (docutils 0.18.1)
>   - Sphinx 6.2.1 (docutils 0.19)
>   - Sphinx 7.2.6 (docutils 0.20.1)
>   - Sphinx 7.3.7 (docutils 0.21.2)
>=20
> Link: http://www.docutils.org/RELEASE-NOTES.html#release-0-21-2024-04-09 =
[1]
> Link: https://www.sphinx-doc.org/en/master/changes.html#release-7-3-0-rel=
eased-apr-16-2024 [2]
> Link: https://github.com/docutils/docutils/commit/c8471ce47a24 [3]
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

No htmldocs regressions on Sphinx 5.0.1.

Tested-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--boTE1sbGc0ojQHI4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZjH0IgAKCRD2uYlJVVFO
o+0BAPkBo1VT9zV+BVc7e/IplMAPT3HVJFhl+1VLDpeHTzyiagEAs52jwKQVD2eF
j8mikk8IgY9VDQ3twLObnbU57LQJMgc=
=R3hn
-----END PGP SIGNATURE-----

--boTE1sbGc0ojQHI4--

Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0CE152518
	for <linux-doc@vger.kernel.org>; Fri,  3 May 2024 12:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714740955; cv=none; b=EgOqUqVfnj5YPiorHO+131p54ysXKcou6K9oE6efA6DYgPHVw4MtvY8g23ffsfh/QrxxRquWWXBMBja0WyekTZwjvkt/A52/hr4gNYq13yOSHK07J8uGHWw9Wn1eLyOVvZgvLJZqllkAqpDoNR++7CbcHLbgQFgjf57UXDGlqk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714740955; c=relaxed/simple;
	bh=yDCs1IOwgSZEBuPh9KrQrh9PLU6LgBnc85lm6xpmwCg=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i4XfM7ZrN2EJVlYZ47+y23lZUTf99fB5XDoOXEwQQgHtGvPyXRQtJeg9C9j6MQ3oDFlClfTmhZXoHnUrNicaH9drDozzw+nh9LnHzXj708ooGy46Im9JJIMJcDG47/yu97+zCMGgfk/LEac8hSiJmqSoZMp7/KOkXtAl+ghvmYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Scx3+sVw; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Scx3+sVw"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5d8b887bb0cso7383540a12.2
        for <linux-doc@vger.kernel.org>; Fri, 03 May 2024 05:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714740953; x=1715345753; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/ESrqmngHPjQv/bFDV5jRARmxIyaUe46s5NEVkN2y6Q=;
        b=Scx3+sVwubXHmO8O0SjzqqAKdABa+ley/OCFkK/iraVGUXKWoEUE5vdT4xF4EHlVWK
         I9dAxoVILTiK7D0pj4z5HOz5DZSOzyAXcM/O/x8qkOFIhskvQzYDTXHgQVGxoOgOBsDP
         hfdNfnTa8yhIFSPZZvFkITErTLDDuxCoGv8oUBpjfIglDKpkGFxij6d5TOZtkM9uMqBr
         aXOeTwLmeOrhPGC8HMPq9Axlg/aRXGCD1/UU9IueikfeuAvoTe+iH9ZAAVIKthmRY3nn
         SmsnDTedeW5xGMHN1xFG1bmyOVMOTKY94Hro+DXnhM8WYX4QpFu0LPvd91xHQ0gxrjfs
         cQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714740953; x=1715345753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ESrqmngHPjQv/bFDV5jRARmxIyaUe46s5NEVkN2y6Q=;
        b=BHGC3bNDDP91ZmyfCvmoGOsz6e63rlhWGdk/rAuV7Brc3OaBapZnFqKdNsA7Pr2cL4
         FMsAy4jHLUw7BDf36WpSvhYPdtgVOmBDAd60WI2nxVLDB0kfNzYOiXUZuXC8/QUNzSGH
         d4sJgY1kJc3u1q52UoU4vLAo+PER/KcA8G66cldFAoVlXeVr+WFOI/YP1Q72j9TcDyp3
         Olj0laCOvGXIhJQsb5cErMZ30GuEFdA+ngdnz02ivS99fPxWeryVh+WsliwvNerp0oRo
         zRLD1FFLIAysVEN81TDJFtAGIf++/nCMcnTNob704avk20hi4seiSqAaYQDCmVU6Adkq
         eMIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYUe587dAujBv9E3Yw8zHV/gyvlNg5Pwnqnf+wlmVx/INTSvUKJGdkvHOqIA+Ro65nOdyDFNRZ2k4yCgTcbCJXzkCS//RyHbJV
X-Gm-Message-State: AOJu0YwabQclnkgXmhzzSs+oXiQZyAgWc3g119WJqnKyUapmO+MCyQX4
	TIXFTuj6Fe1M7qS35MWkAN9DaTRG+1EHGR9f+LDqjjZG+I+7LWNx2PbIbA==
X-Google-Smtp-Source: AGHT+IFdbjSR92Vino7vWgbxB7205l4hVBFVO6rnPka5pFgEMmwHNWYStoWyJJOlnAVq3eK5BU3zJw==
X-Received: by 2002:a17:90a:9a2:b0:2b4:32ae:7123 with SMTP id 31-20020a17090a09a200b002b432ae7123mr1888313pjo.32.1714740953034;
        Fri, 03 May 2024 05:55:53 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id sn7-20020a17090b2e8700b002a610ef880bsm5058782pjb.6.2024.05.03.05.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 05:55:52 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id BC1DE18462B27; Fri, 03 May 2024 19:55:49 +0700 (WIB)
Date: Fri, 3 May 2024 19:55:49 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Diederik de Haas <didi.debian@cknow.org>,
	Linux Documentation <linux-doc@vger.kernel.org>
Subject: Re: checkpatch doc suggestion
Message-ID: <ZjTe1STECXg2mmmJ@archie.me>
References: <8090211.0vHzs8tI1a@bagend>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GmRdiJGKVrvLOWim"
Content-Disposition: inline
In-Reply-To: <8090211.0vHzs8tI1a@bagend>


--GmRdiJGKVrvLOWim
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2024 at 12:56:30PM +0200, Diederik de Haas wrote:
> Hi,
>=20
> I think it would be really useful if (f.e.) the following URL
> https://docs.kernel.org/dev-tools/checkpatch.html#BAD_FIXES_TAG
>=20
> would lead me straight to the BAD_FIXES_TAG explanation.

So to add link to arbitrary location in the docs, you have to explicitly add
target (anchor) to desired location. Then you can reference it using the
target's name. For example, to accomplish your suggestion above:

```
diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-too=
ls/checkpatch.rst
index 12796899584739..002b0aa68b8022 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -612,6 +612,8 @@ Commit message
=20
     See: https://www.kernel.org/doc/html/latest/process/submitting-patches=
=2Ehtml#describe-your-changes
=20
+.. _bad_fixes_tag:
+
   **BAD_FIXES_TAG**
     The Fixes: tag is malformed or does not follow the community conventio=
ns.
     This can occur if the tag have been split into multiple lines (e.g., w=
hen
@@ -1254,3 +1256,4 @@ Others
=20
   **TYPO_SPELLING**
     Some words may have been misspelled.  Consider reviewing them.
+    But have you :ref:`check this? <bad_fixes_tag>`

```

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--GmRdiJGKVrvLOWim
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZjTezgAKCRD2uYlJVVFO
o1yUAP40Y4Mv6lEf/X9VmnVYuLJU0qjkoWPGAweZD22vq9vfmwEA2vDqUYXgzi2Z
YR1LX+Ugow0Pe+6zSxczdzinb61ojQ8=
=S3Sd
-----END PGP SIGNATURE-----

--GmRdiJGKVrvLOWim--

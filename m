Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451702264A3
	for <linux-doc@vger.kernel.org>; Wed,  8 Oct 2025 23:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759965568; cv=none; b=I+g/5PV3uJ4aObaiP4hNUxUslf2ihYEIPPOnwpYSj49LItpuXPfNAj/pdxkzIg86B8zOphoaSaWSM4LpWH13DgbsU/Boh0MIdhbeqG+wb/pIztCxK1afNVuWqqOC4dADjAuil8fhKhlnWhjMoQHvT7UmqYCoTiJA7jkCF+1pRmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759965568; c=relaxed/simple;
	bh=CuUPOtIUJzTkfPFw0WgfFvYdrpTftUfYNdMNY5bK4H8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FnpMwRv4v1J0K+J14C+3zmXuMqK5Jlp4SKIpqZ3iAgdcJG1e9eI7WysHWBm5bxQ+y6pgsnrxhfl5tdgoUXKeG4+JKxZsR9PLtp2jQWzRguBghMkTofOPPUEyyAaPOd3fNkT4mxuupl50iMlHpsMc7AKwooG51BOEwYXCvaeNb/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D/ASQpGE; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D/ASQpGE"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-33274fcf5c1so458628a91.1
        for <linux-doc@vger.kernel.org>; Wed, 08 Oct 2025 16:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759965566; x=1760570366; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CuUPOtIUJzTkfPFw0WgfFvYdrpTftUfYNdMNY5bK4H8=;
        b=D/ASQpGEh+CWc07gNlNa6TM3YTzwAOKp2sdR9JqJMl9W/lntdHMxp6zYboDBQCAG9g
         27R76uTqp3dMDb0VvQ9bdDO0z6vg6cUuNi0S2Xb8nv3D77RrgzeQxbUqywNZ0CX9S6IG
         +lq9WB+4/EfxPbOqKPmK5pJ3Yo4NShkQIQzbn+sy8TXUWulW9KFwzE1+3ex+4xUKS7mw
         ojb1SRtj9bKCDu6NQ2lJe8U7RLSuHPc2yw1IrZ3brMFjXLDttoDPEvXRBf1vQ7et10ST
         ish4aWcZEZTqatnVRrYqEh9JC9J1CMso89QLK6TiC3Rat3gKnAPon2m4SjuwMSNLo6Iq
         vxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759965566; x=1760570366;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CuUPOtIUJzTkfPFw0WgfFvYdrpTftUfYNdMNY5bK4H8=;
        b=vh3HMYtZyxUuLmhyF1Zc/z1RfDZRPFedRuKf2xMKsdUO+6oD4Cu3Q5exLZRVGc8fk2
         z3ILLdSlZ6bXY19iD9a/Q0KIiEyjEFUEYgojC4Pyopbadvrjy2mrqlHfiWorwxXmlASK
         qhtYJ3IL5YoKxRkM2mJHBeCCaq3Rdh8QlA+ql5DgdQNrnacW2WMNygPKAnsp+ZK1EcQT
         /njoRfdtGMC51DsJpauknSK+999CzfvD0KI/I5NGUQzeXWhIoEHTUwDC/8kme95JHwzW
         z8WscVGsXbRdfzGSXpQihbDhacaj5+Bv4f3/2ZotKwr9FhrYDZWk+tyRhSkJMuMIkqIb
         MPSA==
X-Forwarded-Encrypted: i=1; AJvYcCXz6+fMw1OgRCb6JeHXNw94IQr5Fi8Hy8nrk8cf2HP3lekRzeuG2SrN4gdKWRfAAKL+0VrxdwUYZFI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9t+C1J74GYtUhL7AsLgd6GPJR+kXvTlUHfJkcvR25LzH8nVg0
	BuscY6loOReMZ3WbaeEqunBL5vHFVP7nu18ctYpvci2NPEFMy2r0I8ch
X-Gm-Gg: ASbGnctgzaVBedZFumF89Qo6Du0nW3wxWoprflC/Wgc5BTtmM6I2Ia6yaQDm8Otioj/
	0od53+XRXpfSB+cVwGpLqblotI711f6nfxujGeTCaJisHcr7VBM8HuNgUnmcgPwtwjRqz0vznZ7
	cclfKpqgtyb7m21O6rZYhQynME6D6xu21GJXyBRXge2JJFRsJErWsm9RycHyauouTKk2/wTWHE0
	kRQqrDOVnBmJmL3S8dhuFOdxbwaCZaFpJXfEw09bfFF8O1Q/XKoOcomnfoKLbjG6VQiZIAmRhOr
	/0buG5LFd7UVGqD9EQxsY91zQ/s1pQLiGO9mwM02z4nseOZkhoqDMXUStipyH7JLcpDh1zoHh/C
	yejr3KEvUft30haCKSkRPZ+O5NUwL3wDEMRI2iw1e4cE/HIHgGg==
X-Google-Smtp-Source: AGHT+IEqQwohh35D8DAkh9yjSUR0i5+iZzIj3lrkntQw2k0Ckim3fwA3XU6urWopN5QyOgXBfW7pSQ==
X-Received: by 2002:a17:90b:4b8c:b0:32b:6cf2:a2cf with SMTP id 98e67ed59e1d1-33b5111895amr7030812a91.14.1759965566295;
        Wed, 08 Oct 2025 16:19:26 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b631e32a56bsm6005356a12.6.2025.10.08.16.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 16:19:25 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 5B7904233432; Thu, 09 Oct 2025 06:19:22 +0700 (WIB)
Date: Thu, 9 Oct 2025 06:19:22 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Gopi Krishna Menon <krishnagopi487@gmail.com>, rostedt@goodmis.org,
	corbet@lwn.net, tglozar@redhat.com
Cc: linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com, khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev, crwood@redhat.com,
	costa.shul@redhat.com, jkacur@redhat.com
Subject: Re: [PATCH v2] Documentation/rtla: rename common_xxx.rst files to
 common_xxx.txt
Message-ID: <aObxeg12WxHtNu7B@archie.me>
References: <CAP4=nvTjauRawBPTnGEztZpdDSNhGpgSJtjoTFuq+cCQHP5oEg@mail.gmail.com>
 <20251008184522.13201-1-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="laywoOT544AkU5an"
Content-Disposition: inline
In-Reply-To: <20251008184522.13201-1-krishnagopi487@gmail.com>


--laywoOT544AkU5an
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 09, 2025 at 12:14:27AM +0530, Gopi Krishna Menon wrote:
> Running "make htmldocs" reports the following build errors for
> common_options.rst:
>=20
> Documentation/tools/rtla/common_options.rst:58: ERROR: Undefined substitu=
tion referenced: "threshold".
> Documentation/tools/rtla/common_options.rst:88: ERROR: Undefined substitu=
tion referenced: "tool".
> Documentation/tools/rtla/common_options.rst:88: ERROR: Undefined substitu=
tion referenced: "thresharg".
> Documentation/tools/rtla/common_options.rst:88: ERROR: Undefined substitu=
tion referenced: "tracer".
> Documentation/tools/rtla/common_options.rst:92: ERROR: Undefined substitu=
tion referenced: "tracer".
> Documentation/tools/rtla/common_options.rst:98: ERROR: Undefined substitu=
tion referenced: "actionsperf".
> Documentation/tools/rtla/common_options.rst:113: ERROR: Undefined substit=
ution referenced: "tool".
>=20
> common_*.rst files are intended to be included by other rtla documents
> and are not meant to be built as a standalone document.
> common_options.rst in particular contains substitutions that are only
> resolved by other documents, so building it independently results in
> 'undefined substitution referenced' errors.
>=20
> Rename all common_*.rst files to common_*.txt to prevent Sphinx from
> building them as standalone documents and update all include references
> accordingly.
>=20

Much better, thanks!

Fixes: 05b7e10687c6 ("tools/rtla: Add remaining support for osnoise actions=
")
Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--laywoOT544AkU5an
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaObxegAKCRD2uYlJVVFO
o/fiAQC0qRxBu2mn9qrpCb4+e9qDwMwy95k1B/6YiM0z2onj6gD/QV8GsID6JvYc
EgEDoO4HFiznrFm+/0AEfEHho52DDQI=
=oGsZ
-----END PGP SIGNATURE-----

--laywoOT544AkU5an--

Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657C9244186
	for <linux-doc@vger.kernel.org>; Thu,  4 Dec 2025 08:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764837598; cv=none; b=If3hk2gscaGm732KTC/CSLc0hvtcT5VTRGN55qUaaY07n7KFFPHvuQKSRIfs6ejNle2EWJmH/ZdvYp46Mr8kFhhkDZxP7pV0wdohO/eRQojr7qm2ALpoaw/00ZesXZaocm52B+t0XkPNhk5skx3w1lRlU3SphDm1nHMO+JhN3F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764837598; c=relaxed/simple;
	bh=OxJcYZ/t0IbTZeUHzN5FgPnszKPCjA/MF1pi2URYe70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X7Xl0TRT1P3oSkvpukoucRYe0Mq159wg0BEUcwlWdNNHHGOgdytW0EzAN2Bp+Erwbh2EqYdjbNZ3eoyFLKDOiXEqP1nb7e4L5Knp6VN3qV4JFxjoK8wTL5B3N1Nf36QJnHXVSzODkhQ7fixbVENq/CbhjKqOK9X2zR7c+bIJ4wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HcCcaUCC; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HcCcaUCC"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-29806bd47b5so4081935ad.3
        for <linux-doc@vger.kernel.org>; Thu, 04 Dec 2025 00:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764837597; x=1765442397; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d1JNxOjk33nzB6A4jXH2tWSnqUE8y1O3Ojrn7T5hKfk=;
        b=HcCcaUCCbqAA33sVDeBCMW0GkkrUhshu1xxcut1k2Gex9hiO27fl9QeaPqoOwn7wHb
         aQzrqlPnepzwvlj6O7W91UEy82eM6lKPnI6bUT4QFU+/0Jwkc5T4HI7KNDJZIyeyuGTY
         Idj2rOD2n5yR8jPnocufiwTuupak/1DT1X6vxHYCB23j/OXSNtjEudTBqsFqtUiSVny8
         Z/5SkJEc6lIhRajNunOHdpknFTcvgD9i8BWkH9POckDxIBiS6i7SpN6y4DDHSy12omM+
         ++zhRruPdmQOKfPPYhd45/ntoSym5UVqvb2cNyWYU9C2CVhHFEHHAd4ULs1KXVMeWA6A
         M/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764837597; x=1765442397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d1JNxOjk33nzB6A4jXH2tWSnqUE8y1O3Ojrn7T5hKfk=;
        b=I0rm1y790ImAvh2KvfXAtPNG1bzPZiKLAtaDdqznO0UJfH04qa5wiQlMCplg+CRzs5
         yLTpTSGAubzHO+z6xB8H7XmYO3kUzsifoRwbZQ6NmLjFeED/fSmh6vTX9ZczAtcAdDJR
         fGNKQR1ptMAseoPrTnSkfHeiE5OaCcBWvB9p/09b+hFMliY6c4yI/cnZEVR5GemMgrLA
         DdxFkK+z/mXYoLy8LZQwmphqMy0gGsoL3ux1+P45CCm60kH7IjycQmX39CyXARwc0m60
         ms4RcJmcrW8l1HHn9V+TM94vrRaOx1aQDNRI9rq77CCJ5nM31O8+Hbeavk9czgOcsANx
         MjfA==
X-Forwarded-Encrypted: i=1; AJvYcCUhAXk+MI3z4VkyQepS/IepKUn1tN4TGfaRojRTpG6aQijMeyoyxnhHzhbYPtFYNp8eAADqh7lS7UQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZDEv1OqD0Rt1aHeimGWv6CRNfkLQ+bBBdLAqx/j/L0P+wtXyJ
	/XndjmNWsamzcFoTsksgmf36nLjLR5DH3/14nS+LgQY7oekAGPYGcFRf
X-Gm-Gg: ASbGncvqbSDpqxqenZoH+T0T04LUqi1/otJ6SkcPUV6jeSm1mIU3z+ooP5rHv+1rOda
	WyYkpSUwuIuCIMigIt7JSe8lEjXek3hfpvcNzfk3xZwejzsizJoWMBmA4G/V4fvYQsQ/ElSjfpx
	RH7xMDKGhxr1knFuMWF2b6ScLLcq2V43Zc/eiETP2XxT6JqBVXK6gma70sB1DaRWnwUHwIuIcoD
	X9DAGsEwV0a9XoSzcPP/6s+TpW7IfwvKvbOPu8TssgtlOopp6nXx4wVohJY07rY+tPQ5GQi36dj
	M7c/SKqh16pYWwsny1RFqKR9f3g35HQ9EPFGQ1beRxodfStJd0PH9J6FYRcarVDuLKujAaDo2XU
	BC4VnHMSvLPZ1tO+7XwDQRJthIO91tIql/p1dR9gDk+GNZ6DZmybKr/uXInAnjfMEDg6JcUvUKY
	2HwnbFRi71YTA=
X-Google-Smtp-Source: AGHT+IGPazSTtY6VVQpikAdMDTf95Vk0b10d8Tb5c077iSAqlm03M0R68qba9fqHpOhAjsCCk1ni5A==
X-Received: by 2002:a17:903:246:b0:295:7453:b580 with SMTP id d9443c01a7336-29d683f077dmr69081945ad.58.1764837596595;
        Thu, 04 Dec 2025 00:39:56 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf6a14f40f5sm1096665a12.21.2025.12.04.00.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 00:39:55 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id C893441E4822; Thu, 04 Dec 2025 15:39:52 +0700 (WIB)
Date: Thu, 4 Dec 2025 15:39:52 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Soham Metha <sohammetha01@gmail.com>,
	linux-kernel-mentees@lists.linuxfoundation.org
Cc: shuah@kernel.org, skhan@linuxfoundation.org, rostedt@goodmis.org,
	namcao@linutronix.de, gmonaco@redhat.com,
	mathieu.desnoyers@efficios.com, mhiramat@kernel.org,
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3] Documentation/rv: Fix dead link to
 monitor_synthesis.rst
Message-ID: <aTFI2LDNLmC1osiG@archie.me>
References: <20251204032452.9523-1-sohammetha01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Aa2dCrHsQWzPoz9c"
Content-Disposition: inline
In-Reply-To: <20251204032452.9523-1-sohammetha01@gmail.com>


--Aa2dCrHsQWzPoz9c
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 04, 2025 at 08:54:52AM +0530, Soham Metha wrote:
> diff --git a/Documentation/trace/rv/da_monitor_instrumentation.rst b/Docu=
mentation/trace/rv/da_monitor_instrumentation.rst
> index 6c67c7b57811..9eff38a4ad1f 100644
> --- a/Documentation/trace/rv/da_monitor_instrumentation.rst
> +++ b/Documentation/trace/rv/da_monitor_instrumentation.rst
> @@ -162,10 +162,10 @@ For example, from the wip sample model::
> =20
>  The probes then need to be detached at the disable phase.
> =20
> -[1] The wip model is presented in::
> +[1] The wip model is presented in:
> =20
>    Documentation/trace/rv/deterministic_automata.rst
> =20
> -The wip monitor is presented in::
> +The wip monitor is presented in:
> =20
> -  Documentation/trace/rv/da_monitor_synthesis.rst
> +  Documentation/trace/rv/monitor_synthesis.rst

Looks good, thanks!

Fixes: f40a7c06020709 ("Documentation/rv: Prepare monitor synthesis documen=
t for LTL inclusion")
Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--Aa2dCrHsQWzPoz9c
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaTFI1AAKCRD2uYlJVVFO
owDWAPsFTN02CmAMNm5Y8waldi4Tx2eTHjk62BbuOuMDQZvphwD/eRHkMXjpOZM0
s9c3nDzj2FIK8I2TpfDNUaAhIJ6fpwo=
=/qR7
-----END PGP SIGNATURE-----

--Aa2dCrHsQWzPoz9c--

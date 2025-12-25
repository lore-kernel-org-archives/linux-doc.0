Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D8120CCCA
	for <linux-doc@vger.kernel.org>; Thu, 25 Dec 2025 00:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766624398; cv=none; b=W1H2uBnwHB04b5od8Ys+oMkXeSHNYAnGGnxSggZcbwzoVwou8Nhg4zkropuq5CDDt8YEgFLgp2IFHySwA1Ru6Yf5lObe80MFNHQOyvCvciWne8Y1ewn0LbLcRP7yK/adtzvXUa4idqDVSiBzkeS6txYyEUd1o5HZX5861j4rVW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766624398; c=relaxed/simple;
	bh=Eqe2WJv6YPrOjxU7AiFyPr7lm8osTKtgSomhmeio+h8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rWdJlUAfF4RKKZqnAGiSNz7RchAH1qmPbFWrFs3Yz+T7JcycbomXNEpcCcaphR4fz1Sq0j/k6kUm7Y80tOlJvPiwKgcgTurN6DYaNmhGUrSZouhRMabnupZDD6L3tAXB9nzy4p92q5ou1ej6DZwfeIciNV1hAas4tfp9jWh4Srw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fQqkJSfg; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQqkJSfg"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-29f102b013fso77672925ad.2
        for <linux-doc@vger.kernel.org>; Wed, 24 Dec 2025 16:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766624396; x=1767229196; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=34ZWGlKeYAoBKfcSWnnSht52B70l+ENf2ADFK5Dgfo0=;
        b=fQqkJSfgVk1JGZf7GaIqwLc/z2OYAuJeznqFdiq73I6oPeXCszBdkcCpipzfuTq7UH
         skHfbjPQEr6HSJpPfpCJ6lGDOuizovhhozIS4TdHXRHMEqxtp/23JxnYbQRJpwyNTJCJ
         L1RELuFIX7WIb4sq6gDmUTKyRQdaT7nDkDpWJXtMWO40l5uPrfvyIYdKLC+U70vV00Bx
         S3izrXizwv4XbeFw4YfVfR9NIvAQWwp2EUf2ziAkn98FZwD27KBd2znx+JdPSE+Aj8+W
         IIYCK5LId6LOtdwn5irXiINL3qOMRL93yP0rn8VEdfc8kZJnCENZ+b5qe4DMtvqj9As5
         zVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766624396; x=1767229196;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=34ZWGlKeYAoBKfcSWnnSht52B70l+ENf2ADFK5Dgfo0=;
        b=eTN+kn3M24u7QcjnBX0N+qJ3kr8oppSKDyRBTPfzDcCSMFhY01QbG73M9RukaJCFh2
         8LyWnNzRUh9xCwkdkzGPXPTSwHzMfwbUsXkMjpFdfQ8dIOnuuLLYM30qpqGhHBTunpBG
         61+bZL00CyImWUkFKII2gHbjzq7jn6dPFzSY27O9FjwrtcYuVqSJdKnltMruXICK0jM3
         x8Y3P9XPSf1Yygbod9urGrX9I/lQrBbr8KB5sVw6QEsPzatWeOshs/P8rgjUXQEW5xWl
         NhwMHt/vLTrdZMbjF+XyqZZlrJgc39eHbvnIYuRJT/1I1EyRGm8p32llmryinQXlPW9u
         dunA==
X-Forwarded-Encrypted: i=1; AJvYcCXfz2OCLiJ5BPCWdefcsMU8iBqsVHjpFTGCmu4U1Y73xzY88gdMnUehIMl6BnOxMRoFiEjs5KI2ZUY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVGWszNRrgS2MB2seXJ2hACDARMU2OBf639Om1MdJ7kZPlc7i+
	PEm83V+HvCD0BX0FDcfFGR0I0fJDER16rx1wh/yuzxykS5bHjki9Ci98
X-Gm-Gg: AY/fxX7fNTow7mFau/2Q5gz4VFSxCHlVl+GlrNNme9onudM0XLbdFx51aWlB8haSE3s
	3lQOuOhUs0BE1xspTqm2JGNbwDhWkgGEuz+85VuDziX6xRZhb4QYe1r9HYi1sk8JyCsTrqxoDQZ
	1+WbzNCm4MT69oW51NzfA+KEjqqenxSlZWXxuO2p8DM+8/vOnUNAouIbRbWZV3Bg/+/ZYMy2ZAq
	qHtKaP669/ng17t8dlhuynCvwGx3AvqJz0Upgelgr82FOplAN0rk7usoKRd80aubYCEPA0Suab3
	GLF4Oh/jN51ii59Tr5f36/ECmSM4e2Am9dVnGoh+f3dsxT5U7ho3TNlQcr3IwePABiTo1thp/M+
	H1vtPFnHxZf6ILsDPwCGUVsfqG0zZCmOrbiQ3iNkB+r21EcUv4FVHqbu2lG3lmxDZvm0x7ZNRgg
	iThzfyOnSpPgQ=
X-Google-Smtp-Source: AGHT+IEkf9bcd4whUdPLA/3V9jA2iSPhImg4fMLlgrzr1cD29215lcKLqIOKPcjSlC6FRmStwRjSuQ==
X-Received: by 2002:a17:903:22c8:b0:295:425a:350e with SMTP id d9443c01a7336-2a2f220d13dmr169983355ad.8.1766624395785;
        Wed, 24 Dec 2025 16:59:55 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3560ad15dsm26772225ad.86.2025.12.24.16.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 16:59:54 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 6F72C420B572; Thu, 25 Dec 2025 07:59:52 +0700 (WIB)
Date: Thu, 25 Dec 2025 07:59:52 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com,
	Jonathan Corbet <corbet@lwn.net>
Cc: victoria@system76.com, sebastian.wick@redhat.com,
	thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 18/33] drm/vkms: Introduce configfs for plane format
Message-ID: <aUyMiJvJX1KhffVb@archie.me>
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
 <20251222-vkms-all-config-v3-18-ba42dc3fb9ff@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jUhjHASxm1xFu7uC"
Content-Disposition: inline
In-Reply-To: <20251222-vkms-all-config-v3-18-ba42dc3fb9ff@bootlin.com>


--jUhjHASxm1xFu7uC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 22, 2025 at 11:11:20AM +0100, Louis Chauvet wrote:
> +What:		/sys/kernel/config/vkms/<device>/planes/<plane>/supported_formats
> +Date:		Nov 2025
> +Contact:	dri-devel@lists.freedesktop.org
> +Description:
> +        List of supported formats for this plane. To add a new
> +        item, write its fourcc code prefixed with '+'. To remove,
> +        use '-' prefix. Use '+*' to add all formats, '-*' to
> +        remove all.
> +

Sphinx reports htmldocs warning:

Documentation/ABI/testing/configfs-vkms:199: WARNING: Inline emphasis start=
-string without end-string. [docutils]

I have to escape the wildcard:

---- >8 ----
diff --git a/Documentation/ABI/testing/configfs-vkms b/Documentation/ABI/te=
sting/configfs-vkms
index a7fce35fcf91d1..3839b6e3c9c935 100644
--- a/Documentation/ABI/testing/configfs-vkms
+++ b/Documentation/ABI/testing/configfs-vkms
@@ -202,7 +202,7 @@ Contact:	dri-devel@lists.freedesktop.org
 Description:
         List of supported formats for this plane. To add a new
         item, write its fourcc code prefixed with '+'. To remove,
-        use '-' prefix. Use '+*' to add all formats, '-*' to
+        use '-' prefix. Use '+*' to add all formats, '-\*' to
         remove all.
=20
 What:		/sys/kernel/config/vkms/<device>/planes/<plane>/zpos_enabled

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--jUhjHASxm1xFu7uC
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaUyMfwAKCRD2uYlJVVFO
ozZlAP9YzRS40bCbfXPH7OLewcsoN37fmZDIvxUWn17lwEDbdgEA+teKlutf5NRD
Ys2mASkyMQn/jubNeBeoNtuOzTQmEAY=
=bshF
-----END PGP SIGNATURE-----

--jUhjHASxm1xFu7uC--

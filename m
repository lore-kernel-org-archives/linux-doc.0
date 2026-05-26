Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99ABB3D2FF5
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 08:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779785934; cv=none; b=PnPSq38+yUNTSAdt00+2sC1OweJlFbWKaCJJ+ebh3dyTLdB+kaNGffyr+9WJrYa6Mwb7HhDHGQYkihJK/oQEGN3jqixHnfnULONIVrI0OMjEf8aQ59UiKzc14TJDPgkj66FQvPwVgeasSKuTOdLHVvVocrrundFQ5dddoOT5/lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779785934; c=relaxed/simple;
	bh=zynMhOEQ6GgglnDivlhgjp4GeLDYEi75meNetmtTFFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kMyCDfHsFjiW2nP3gMzaS2mQAAXxqSq7QXpjd/tjKyLIXyHfsN9NSUETOb3R3vnYeV70/zOFlPklDYYBl+nRc0qPygbHsjIsSdkGl1S5exPtP/ltHtXuARuZ8xC73Kzb+HdTaKZBcsTW6WJwVSFCXbY3WcBB1GiydJ06swYvDQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=No68TrMu; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="No68TrMu"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4905529b933so19949385e9.0
        for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 01:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779785928; x=1780390728; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Oik2LsJqVBPuGcGjV5Ma+3vEUKfmkhyynM2jzK69ui0=;
        b=No68TrMuTWE300uG1jmv3I8bJNvMT4a/NI/SnhjZiAi76Q11dac76XA1+zog/TJKn9
         puYuAgfN4Nwa8y8Ypq9ZwlT058xZrA4TuEOIEfhIFWxyewYDMKngTWdczUNqsoO5nnvQ
         QO96tfMe6IM0KZszfj4/pvTNngxan0nFDHMbcfDgrNKGoB4ADl+UNIefNWrdjI4BlqNk
         k7WIiz+lweEN1W0veODUhz6v3bOQGmBf2vF8MVtOZZgfqLWZhoAwjH6bbjvH5zUWjEXs
         4P7V8dslI1vSA8W61FH2grgftWwLbnQGu89o1dPrd0t00DX/kkp4LJkg2y+iwlae2paE
         O5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779785928; x=1780390728;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oik2LsJqVBPuGcGjV5Ma+3vEUKfmkhyynM2jzK69ui0=;
        b=Y5NSkqql+vnDUQMDe/ngxUjOYvESHtlhIGdqdTvIfCSFQVx6RbErFVPe/CO2RJwlcw
         Hic4dWD7VzoZ2WrBEp0Tf+ugXgRkGgGxVFEToF+5f6NYpnBuSW+dyVBw4W3Y6PUGm9gL
         a5ShmeHt0I6yPVmiX3xO8OTglul16Y4pXMtcXT5Whes3GkChZ17C8dJ9KVQ9t6vau5MP
         oaJx7YeeR7lS9jpAzSANpBsPdjdg/LRBaDzsvSdbSbsJGOY+P/KZeKCghvZvT0K2JChb
         8bN6OHnXAgND5h2a6Hh7r9sDKbKI8xb910clDVZC5ACGvTGDbGDfW2GyBsvK+AZw7ZJv
         56ew==
X-Forwarded-Encrypted: i=1; AFNElJ8njgggKLm7pUXG40eGDBajZoSQmFO9L31cwJBWq2KwIyyGLMzf77XGm3o1CCGCeskwHBq3Nm/A6tw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHdYzxDt9z2gTl5zGL9UW7aCqzOXy6JJ1r62zyoYoUhuye3ZS+
	1QEPiBqwUBeoxbH0Ldq1pZvLajLMCqAdrwwSI0Ki6JPko8/7RFPBN844
X-Gm-Gg: Acq92OEC/ovSc3tvBWSpa8UbCQD9jjGeZEQH0wRtGwUXrKtzjUFaM+68NiCAW0nGQew
	a9P2M+9CtHxptL/SufZynxSVk5X6oo7Fr3NOEx1JX8Oy6pTlw+sYPVf6nMTK/GBuSMSCYT79zE0
	VR1IUKMhY2+VKTKeO9IN4EJCkWflGtIw2WSmL/wvPIcIlHKAAfSAk9bHSubpyvkCP7lHOWAMDM5
	F1M3jS3rTt9Pz08eEsor3X8EJ28N0ktQWTtXMrtoFra33+nPNyAYAm0ulrBp7owe7vykA83GUiA
	BGrtUtxji1QuAP3/68/YqZtlgNabB0qyBueYaFwelE5b+ZzgOb+hO8+jzAqmbWapMcgHU6L0tDT
	jCNwrQ9zHRoGmquPOmL/831ze1Wd90FKDy6lpr5pxYYbdHo5lx5MyM+h0d4VFUZvVj1S1WF23+P
	oPuntduYt6tyDxz03Y2JbOcIBkSWjfHvEouv0=
X-Received: by 2002:a05:600c:5254:b0:490:484b:bf41 with SMTP id 5b1f17b1804b1-490484bbf7amr281384845e9.6.1779785927558;
        Tue, 26 May 2026 01:58:47 -0700 (PDT)
Received: from strix.localnet ([197.250.51.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490452580dfsm160876075e9.1.2026.05.26.01.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 01:58:46 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] ARM: zte: clean up zx297520v3 doc. warnings
Date: Tue, 26 May 2026 11:58:35 +0300
Message-ID: <12903636.O9o76ZdvQC@strix>
In-Reply-To: <ca29c0fe-8725-4cc2-8f4f-db3f80ccafed@infradead.org>
References:
 <20260521191458.177046-1-rdunlap@infradead.org> <6270885.lOV4Wx5bFT@strix>
 <ca29c0fe-8725-4cc2-8f4f-db3f80ccafed@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5999182.DvuYhMxLoT";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart5999182.DvuYhMxLoT
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Subject: Re: [PATCH] ARM: zte: clean up zx297520v3 doc. warnings
Date: Tue, 26 May 2026 11:58:35 +0300
Message-ID: <12903636.O9o76ZdvQC@strix>
In-Reply-To: <ca29c0fe-8725-4cc2-8f4f-db3f80ccafed@infradead.org>
MIME-Version: 1.0

Am Samstag, 23. Mai 2026, 00:20:35 Ostafrikanische Zeit schrieb Randy Dunla=
p:

> The same way that this commit was merged:
> commit 220ae5d36dba
> Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>
> Date:   Tue Jan 27 20:52:08 2026 +0300
>     ARM: zte: Add zx297520v3 platform support
>=20
> I guess to the soc list.

I sent it to the SoC list with my SoB: https://lore.kernel.org/soc/
1991560.tdWV9SEqCh@strix/T/#u . I hope that's what you had in mind.

Cheers,
Stefan

--nextPart5999182.DvuYhMxLoT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmoVYLsbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiW5wQALE6jwe7vYvUC+gtdqXV
k7xUCRl0FvEBUWoV+SL78Qil7kXSzKQXJEiX+Riu03dVbr0t74HRLZyhFxHalg7T
kRyBtwAeQb7S/RJJo78U4y/qmmaKHx5meRgI/skxVie8JC/rzsW1VbmB/59ziB8c
pXm9jwwGF61sm5ZZS3FafG/RXJWIdpDXd9qk/ZUBGOv3XcYcU07Jc/DGku4Q/o4g
bQGpgxq4plYK4RB7JE15jrNBUr7UUKAQilCG7WScXReDku4HApsF5NY2riEW/5PK
OnIhZXc4HT3xl6V2zOAxOhyB3AGACNH9yeottg4xQrW3f4jUsQjtz/1o2hRmCOGS
0QOqcN/vZVhJOANDNb7OAJGd0aK5XC74Rz591jx3ohzlRmDy/h6Pv7NiOlumzEyG
+cjwHdKD1qvSipO5x34gqClfvWUTHX5v/kgxHhRaSKAq8y8+FKUb4AlrIzPG8JAf
n248mSk5JxB4zG46yqlYB0E18bPI+0Sc71c4hsQYQUC+7PExJ8MEs6pgQlGZBAyU
aEw2m3S9MH2QW6fqVHijWiBtC4xdEpvvGAy/uaSQ6Oh07Ov0zUubAS/ATAuORWaD
ewlBYuLMOfZsg+sQD+Hga31dwXQ2wGRdRupCcl4OuF5BmdtXbx98cgJ8MadSPf2F
Kblk2tTWqqVq1SMhZc6MF3fv
=9qjW
-----END PGP SIGNATURE-----

--nextPart5999182.DvuYhMxLoT--




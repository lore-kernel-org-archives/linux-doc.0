Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C716363C7F
	for <linux-doc@vger.kernel.org>; Fri, 17 Apr 2026 17:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776446669; cv=none; b=Q8s8AGMLJSiaWd9/tv1vobeZD+nhevPIqfGNwAtRGBWYIQ+y5HjqV6mWAMPJh+DR6d4+9i+Fd2sZvKXBOiJM9ipLGPOMera6ZOIlbebE3W4TchwhkdYJ4ckFvinQh7HafuS+TeOHVug3N0UP++uG0hLyOb++Usxys8GbkEhToko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776446669; c=relaxed/simple;
	bh=KVxkAo6OaK7ElY1yVtpbpwz5EsN+i4mdWUQboHKutek=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=agiigv7AVwyXFGLH0pHfzc/c6loDDlpp5gkOo6qMPNvk0shCwZjHZXYPw+RoqYafQLbJwE3/RjeCaqa7Cj7F7dPuGbVUMW2rZ8nlTl13lfpdUNC38Q224iXDIaZw61gpMht6t5wm4AXSH5HbFMJveeEvF3RDYyEIqNp/SxmsMC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lsgTwCI0; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lsgTwCI0"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-671fe205535so1772480a12.2
        for <linux-doc@vger.kernel.org>; Fri, 17 Apr 2026 10:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776446665; x=1777051465; darn=vger.kernel.org;
        h=to:references:message-id:cc:date:in-reply-to:from:subject
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q6tVQ0pUQqp8YvBCfgccdHLoTS042A6J2tPjUSrHHQY=;
        b=lsgTwCI0Z8SDi0FYU6LYZaL/NeDcf291HghT3EKpwg8JCMYn7tZYbt4Ntxu6HbnZqx
         Rrwk1I1ArIbolgdaVIWaCDblPfjHKvzPN/gRL3XDxg0rymkbrhX4A7ryUQhmU6LuI+Xv
         hF0AuP4H2Ah7JN+D2md9Q/kD5s4s6FP+/DK37sHxIJ2F1FlXRB4hPype7PbS2+xVbqhv
         S2iJE8CHiPiGOx+UR4SNCvj0BFVmMKxs9E6d79szxFsI6yqkWkJSoyinm3YvG/+cgs6B
         ngbnDSZiQ/2gGucK1rbqxHeCSuaF9wnI23BV6aLogkZtiKVMx36IMiMmVQTe6awqsGM6
         F6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776446665; x=1777051465;
        h=to:references:message-id:cc:date:in-reply-to:from:subject
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q6tVQ0pUQqp8YvBCfgccdHLoTS042A6J2tPjUSrHHQY=;
        b=bT2AGriw2QCY9fRB2LMc/gNlqgK72ST4jzh2tHuI9cq17qZPvE/w1BlrlDR0/DlYai
         z0z0/7HveR1PiOiApG0rRXe5uycWJQYwAtzECBcNzc7j3nnmy2JjBGOhObk0WilWyxnk
         entEn5FZXO39P18yG9nvzepSZkGdoUV4qg5vOe6VbJ+IeyunLr5uF5diowOAuZLA5/2C
         E3Z7gHJqf7t/S/bD3ooJtlqUDlbXi1Ki5k3AUKVz3Yu3r0u+OQwoYV4Iy8CD1nTnnEUn
         N0rfi9sVvbkwUSzcyE8AtRcGal9l0+4hB9fdZXYeDczN/Gq17S8gczwhoUovn+cU7x5l
         wcYA==
X-Forwarded-Encrypted: i=1; AFNElJ8IX7ali2grCv4G+q9DIpPRVC/ZfzLfqQDOhymRi6np5dG4GrSo9IxpoLw761PbtReahk4sg1YzryI=@vger.kernel.org
X-Gm-Message-State: AOJu0YygCGdSUeftfuZblQv57zBfQyaEzT84vMdFijatFIpu9Aj84GX1
	wugU7vAhg3qZjoINqtu1bA0ZHlJrEs9VlsJCJee/4LtbG5cjiBgD54tb
X-Gm-Gg: AeBDiev4/SoJ+gb3Y3CN5bTHKAUNf8wKCTnmWxD03kWNdsyq1rMUk3k1TjPBvMaDfVj
	XHurGj6Ep/z+ngi2LrXc/+1Ft0xLKcEj2qzMtjZ2bgLYgjKp8L09grpyTZXr1sztg3MAuLBZWXz
	1mI8ghy7KvtOhFqxwlrCw9hbBXk3nDLK3W8GnJosL+iZEe4NMsDsnoQY0pb5fL5WRXAuBxMec4A
	5zF5LlERTasT9PEMrtV+wivw/K6a4/pGYoYiBvq8DJd22AxIclCwqmpbD4EKfxYcz5nIUQ+NXM/
	Wob/5Zd1B4YrH4ZVKmSHFUm0P+Tfc2U3K4O8BZSH+JN+5FmbZaa6KuFzJeGEXpNSF3cqI34Iz39
	yHxnCv1Oxt/wYR6aXTPSucsjnVpAHFNLVVhx7v/8NN81MRTWk88MNH342UUw4JhREshVuUmVCXc
	o6RNFlrc+M8I+f3iaF7pltjU8CAWQk9x7mijH9CTbOJ3bj1WXcLa2HC/NDqA6yZ8eX
X-Received: by 2002:a17:907:9495:b0:ba2:48d:a95c with SMTP id a640c23a62f3a-ba41a04cdccmr206095866b.29.1776446664275;
        Fri, 17 Apr 2026 10:24:24 -0700 (PDT)
Received: from smtpclient.apple ([197.250.227.196])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45503c435sm75465166b.43.2026.04.17.10.24.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Apr 2026 10:24:23 -0700 (PDT)
Content-Type: multipart/signed;
	boundary="Apple-Mail=_6363C69E-ACB3-474B-9473-521CD530D032";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.500.181\))
Subject: Re: [PATCH v4 7/8] ARM: dts: Declare UART1 on zx297520v3 boards
From: =?utf-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
In-Reply-To: <0d80dcbe-cb46-45e5-821a-de5299d6a663@app.fastmail.com>
Date: Fri, 17 Apr 2026 20:24:05 +0300
Cc: Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Russell King <linux@armlinux.org.uk>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linusw@kernel.org>,
 Drew Fustini <fustini@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org,
 soc@lists.linux.dev,
 linux-serial@vger.kernel.org
Message-Id: <D3228B7D-0C11-4087-9547-0D1F7D5FB628@gmail.com>
References: <20260416-send-v4-0-e19d02b944ec@gmail.com>
 <20260416-send-v4-7-e19d02b944ec@gmail.com>
 <0d80dcbe-cb46-45e5-821a-de5299d6a663@app.fastmail.com>
To: Arnd Bergmann <arnd@arndb.de>
X-Mailer: Apple Mail (2.3864.500.181)


--Apple-Mail=_6363C69E-ACB3-474B-9473-521CD530D032
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi Arnd,

Thanks for your comments.

> Am 17.04.2026 um 11:59 schrieb Arnd Bergmann <arnd@arndb.de>:
>=20
> On Thu, Apr 16, 2026, at 22:19, Stefan D=C3=B6singer wrote:
>>=20
>> The reason why I add the serial1=3Duart1 alias is to keep =
console=3DttyAMA1
>> stable regardless of the other enabled UARTs. UART0, as the name
>> implies, has a lower MMIO address, but uart1 is the one that usually =
has
>> the boot output and console.
>=20
> I'm not sure I'm following here. You generally want to either make
> sure the alias matches whatever number is printed on the product
> if there are multiple numbered ports, or you just use 'serial0'
> as the only alias if there is only one port.

Not all boards have their uart pins labeled, but those that do have the =
pins that connect to the UART at 0x01408000 named UART1RX/UART1TX. Most =
boards have only one though. I have seen a picture of only one that has =
UART0 and UART1. I could not test that board myself yet.

My original reason is one of developer convenience: If I have

uart0=3Dserial@131000{
    reg =3D <0x00131000 0x1000>;
    ...
    status =3D "disabled";
};
uart1=3Dserial@1408000{
    reg =3D <0x01408000 0x1000>;
    ...
    status =3D "okay";
};

cmdline=3D"... console=3DttyAMA{0/1} ..."

changing uart0.status between disabled and okay (e.g. to experiment with =
uart0 and pinctrl) required changing the command line to match. I found =
that pretty annoying and the aliases seemed like the best way to avoid =
this.

Either way I am open to do whatever. I can keep the current naming for =
the reasons stated above, I can name serial@1408000 "uart0" and leave =
the others without an alias or I can drop the alias altogether.

> Either way, the alias should go into the board specific file, not
> the general SoC file, as a board might be using a different
> set of UARTs.

That works for me, I'll move them. The aliases will most likely be the =
same for all boards based on this chipset, meaning duplicate code, but =
matching the alias to the board labels makes sense to me.

> Since you know the addresses of the other uart instances, I would
> suggest you add all of them at the same time.

Will do.

I'll hold off for a bit before I resend the patches to see if some other =
comments come up.

Cheers,
Stefan=

--Apple-Mail=_6363C69E-ACB3-474B-9473-521CD530D032
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmnibLUACgkQPRO8yFRP
GiIKTQ/+NaGjhii1hGtfVI27m5B7xvrO45mnvMkcV0ceIDc63OvWS4qRsBlOJnwF
9pjaplL2Kbm4sf/uPfQnAE0BviBly1d/14riJjJmEr4G4re2+Q/c9BeCxazBDbDJ
tjODl+Ajwiu273EcwTN4ZU28p/80oJjmuEEAHsL8crw7d8rhnOjrwY/Ige9HgcBl
BYlJRjunX6SxHxGNH/eEfrwrABGjHVD1ya8YjQ9NIZnkEEub9lRZO4v3gr3mU0F1
tjATbZV1BL1SQ3/Zld3BNzYkj7JzCmiEH601T3RZittY4yZBDefYMFantWcrq8Ug
nVM3or6OxSiKoLQ6vak5XVW9ks1iX1k+jU19AUN71/VIvWQ+zTVnO9c1wJae/eEe
SMeyP/Kt4bOGDi1Bq22aD+nv2lJ8wo/4l3k9vDv8vJDECg6UxjLFgYPbtJyEV/wr
mTaODzo1XDfo4PXQD5x0bpgYrguK4X0wVM5Yu/+x/kZLKrm+TWfXN4exCwO6WJPW
sZ7mj6ksI03MTxB5XpBKeoaruf//hQe3lhLDJ837SaDq8xCekCsldXyMop/qQ92a
HBwMG6hD3kLzxRjClYksypijVruKHNcHshp0imqt1Hhs5wXNbaEsTQOqRUgSWj08
Yb2Veu9YNoQcnrIK0Kh0YtoHMDb29uagvWkRg63fyD40m56GPyA=
=CzCY
-----END PGP SIGNATURE-----

--Apple-Mail=_6363C69E-ACB3-474B-9473-521CD530D032--

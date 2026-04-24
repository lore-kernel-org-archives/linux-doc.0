Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB093AEF54
	for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2026 11:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777029831; cv=none; b=GMSrhR/CVhCO+425I7I/KLjOlK2qzS5n5Myzjn+83IF8PwtHHa0cT8j0J2mo/a20q7MQ0kk8cVa8BG0Ee2wwv0p/BngN8mWjy8ASFikoNphqF1rOCY5C7TbQ9pqbOps1CnORZwftF1el2uN0lvYSQ1g4Uhmyd1Gy1FlVbIZKTKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777029831; c=relaxed/simple;
	bh=CRAdYzX9+jNsTYs4h8ctNWZTdaCBBbrpEXxcu4w9zCQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=GoAPLrys1r/EM7KolvZZx96+tGQ7BKjGzEZCs4buWkdyTzVP3OvkdIArrNpwOc7VO12852ELN1AQ+oys0tq5bAlEP3tj+Cfk65dXp/5YV5ZDMDpUjn2ouYKcRbCcjceCJXvGFb9FBCw1VNa3z6g/S8P29sug94fUFZOYnKDF190=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hobNOn+j; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hobNOn+j"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so7009999f8f.2
        for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2026 04:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777029828; x=1777634628; darn=vger.kernel.org;
        h=to:references:message-id:cc:date:in-reply-to:from:subject
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+t+DJdjmBiSqlx1/PpjPe0tKhCBDYlA3fqYW1n4w00o=;
        b=hobNOn+jNnkILFM0B2lWuWoYhwhZrFxY9Geg77nhWKIxfnXfF8/kdCXUqF3IAH6N85
         +MnXX+X/ryx3Bsb6GDGsnU+E7gsrj0IJK8lZwR8RlhREjSRMJ/+Qt3zcDdkIFIWaTjFD
         2KBPkIHZyxjw8xEjD+3KFJm4otmxlu+Dn1hPLmAPSw7NNGBzdT7P3K0buEHgORui9RC5
         fBO+PBMgPIhhQCJ8Yay1I9UptXXghC2VGHRzgaS9ncV7xSj+i+cSKniM8nvvEqnLqnDp
         CxNPHUOaxAc63WJRXFxdlW/xuJ9/fDR33uXVXIiqCTPauSSSLmEoEGo/B+t28aL6Yc5r
         zAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777029828; x=1777634628;
        h=to:references:message-id:cc:date:in-reply-to:from:subject
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+t+DJdjmBiSqlx1/PpjPe0tKhCBDYlA3fqYW1n4w00o=;
        b=cQJmHobmt9AGwHagHrjSdfD50cLZeLiqHUunXidz1XOoQuCYCWcgQ4V5Wh/NEjGK3I
         sEY1g7Z7FlxyWuWYo2rbA4aeGz6Dc3LzBX6N2ZBryUuvBmt7glDMtX4UH9iNyVgg0Cb+
         5wh00/dV3uDfCCmOiJgmR3M20ZHZQTAhLNjZCFvPWE3xHDFiFPfbbAci5QT1zL9a5BhC
         yddKKQ9AW1kMOd73hKQ+PzAAHSr4m+sos+MikgerP3vkvJKZkOfZ6RYOTdctvMev0u3t
         MX8uvG/zcV0mWvb7e/N9KelV26+oigx4haTBUAxbIlrUqTyjeC9/cbh2YlDTwpO3LVJZ
         gYcg==
X-Forwarded-Encrypted: i=1; AFNElJ/thdUJkSph5OgvtjFc5t5nsOdrKvPU0DJCOFDeVzkwla5Iy78k2Pzz+zE/WcFRKCpsHdle92lkXWE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4PRm3hzVkv1OAHOYbCm5FyD1BhJHH9th0WV74a3PyWYSFaKYP
	ntn0x7jmiNTBIRoKJq4UH69npEwy9SbRTQEbCW4gCNV7iVc6zQ+MPlU2
X-Gm-Gg: AeBDietNHHELu9zmfsTnkm4BJV125/Ot5H2BI+NUan2bqbAQiDz9HqNF7m9YOp8/9MS
	zsq0T2jPpbFryY3thFRZHyVLsut67f+DS4Sy4dtHG6oD0/tX1B4z68UksVhGuWie/WkS9QIA1l/
	adB/KLAlVaTFo4JNyXI8i0ARcOn/OTR0wIPc3O6YmE76018znjvJ915x7EowgErNOvoh7aMWpkg
	8qp5D1YobZAzMlrSE1jZ8RNt/0u5szvknYAfSf4F6oGaZA3raE2l5iBOFSNyax2MmswTPO5YwXy
	s2Q90yyLtchV+CDL9olFje6EDxOtR574wMOMsbRf4TFAT2r7h+SrJnoGDBhas7IRnPscquw3RSo
	cF9S5MdGe3wTYuScsFtC3eU3ntQaUsO1hKfh33ewguxTkxDARIhxSsNEUCVM8yDOXQSkArNfiYM
	JQ9Mmu361DfslW0dv/u6SxF0eLbfeSCY7CF4kyxxjj8Eaf
X-Received: by 2002:a05:6000:240e:b0:439:ae2a:755e with SMTP id ffacd0b85a97d-43fe3e0b606mr48159269f8f.23.1777029828055;
        Fri, 24 Apr 2026 04:23:48 -0700 (PDT)
Received: from smtpclient.apple ([197.250.51.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb1365sm63645843f8f.7.2026.04.24.04.23.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Apr 2026 04:23:47 -0700 (PDT)
Content-Type: multipart/signed;
	boundary="Apple-Mail=_EE2E18C8-0A52-4302-9DA1-BBDF2F1ACD26";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.500.181\))
Subject: Re: [PATCH v5 1/8] ARM: zte: Add zx297520v3 platform support
From: =?utf-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
In-Reply-To: <CAD++jL=am0f+sgBSFYQCdcFOvFWgPETn_pSgVdzETJ3_yUNqgw@mail.gmail.com>
Date: Fri, 24 Apr 2026 14:23:29 +0300
Cc: Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Russell King <linux@armlinux.org.uk>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Drew Fustini <fustini@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org,
 soc@lists.linux.dev,
 linux-serial@vger.kernel.org
Message-Id: <BF5EABA2-3168-48A2-AE2D-D8EE2CF88E9F@gmail.com>
References: <20260421-send-v5-0-ace038e63515@gmail.com>
 <20260421-send-v5-1-ace038e63515@gmail.com>
 <CAD++jL=am0f+sgBSFYQCdcFOvFWgPETn_pSgVdzETJ3_yUNqgw@mail.gmail.com>
To: Linus Walleij <linusw@kernel.org>
X-Mailer: Apple Mail (2.3864.500.181)


--Apple-Mail=_EE2E18C8-0A52-4302-9DA1-BBDF2F1ACD26
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> Am 24.04.2026 um 10:06 schrieb Linus Walleij <linusw@kernel.org>:
>=20
> On Tue, Apr 21, 2026 at 10:24=E2=80=AFPM Stefan D=C3=B6singer
> <stefandoesinger@gmail.com> wrote:
>=20
>> This SoC is used in low end LTE-to-WiFi routers, for example some =
D-Link
>> DWR 932 revisions, ZTE K10, ZLT S10 4G, but also models that are =
branded
>> and sold by ISPs themselves. They are widespread in Africa, China,
>> Russia and Eastern Europe.
>>=20
>> This SoC is a relative of the zx296702 and zx296718 that had some
>> upstream support until commit 89d4f98ae90d ("ARM: remove zte zx
>> platform"). My eventual goal is to enable OpenWRT to run on these
>> devices.
>>=20
>> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>
>=20
> Didn't I review this already? I don't remember, anyway:
> Reviewed-by: Linus Walleij <linusw@kernel.org>

Yes, you did, but the previous version, and after I sent this one.

And if I understand the b4 docs correctly, the Reviewed-by tags are sort =
of handled client side: I have to tell b4 to fetch trailers, and then it =
will add it when I send my v6 with Krzysztof's request to squash =
patches.


--Apple-Mail=_EE2E18C8-0A52-4302-9DA1-BBDF2F1ACD26
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmnrUrEACgkQPRO8yFRP
GiKRrQ//d0i3JtN4eqnwGJS0KDoAetBNQXiNUwHJGszPaUlMzi1beDOdsTFk7Who
t8GNv9VvwjuR7Agxy+B9vNltnZanU6djJKQhm1+Qd7AvlC86ueKD2tGZUxpmuipl
37Poxi+E1zUTG68RTaJz1p0utLhaZkiCjVJzmTQgJJq3mAfYp8ycFI29IgdGHJCN
612a3nSFm1l6vz8a+qSX9kQG1UnTYQjsavu1ACxQp9Kk1Xga1G+atLgfXTTY3Aav
LjzHpAl+B0szQ84Zb05ZpJ1jiZYnMrDrIlNu1hv9/PTddXHyL2ISI+0um5OCvJ6n
61iXnVpyJlrscV1Iqs23VwxKx+y3rnV1JIlf/j4n1nwkJ5LQLxRWuYUpmK71uwKt
8WtiK3AD9VxnQvfVtAn2ltUaCLeeE+pZpSwnOvI31AOrwwZQ3ckSqkYRYVwnxVZZ
hkYMk1IfqjRPdMgMjyAqKEPZ5hOqYC5eqd68uM0HAXpYnUT/FNxGw/+sV7oX3qyY
eVho0WqhoeBEAezLTQ+GeCNlLirDpHwT2Y8NHYxSTlIQuwhwClwRPjdXCyS9adcF
eCz32rEZFS75z0LG701LB+MlMhblYEkGiAm3DEsFo4778ft7kfWC5N3GJLbu31SX
1/xC0sqkBY5zF5gvLXwtw0kEniW7PzEgc3oc2N3T37x4mk/WGfo=
=+4QJ
-----END PGP SIGNATURE-----

--Apple-Mail=_EE2E18C8-0A52-4302-9DA1-BBDF2F1ACD26--

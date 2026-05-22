Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9391D360EE2
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 07:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779433786; cv=none; b=bg7ctcTuQTUIz6PyYXNObKWn40qW7Ft4LHs1l59pWD0WZCqy31l51DXqlkE+RMI6neJAFlg80d9zQhZ5ypQIAMjs5zOG/Yy7yozWAwxsFea0yfQf33EP8LuMg7HsVFZg9yh//SzfuqcEWHAtizkWoWMaUDXWcYP7Xmx/FcP6TBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779433786; c=relaxed/simple;
	bh=ITud2w1YmfwAO2VG3810GZ12MSpFc0lANmn3XqSQLCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UTXeUna4rOVpoBXuiA9nFB1zsBeVyHrgCa0WFTgq7jNAKnYhlO2DCZyCZBbnP8oxltXMtTf+pZCbw5SoxojI2KrHazPsms0b/wZrBqGgrWgL/uNzg/m1kgDXSwQ6dxh8Xw2nnOLInRrBbXLeCPQv6ibc7rm6N65dsX0etfIu6d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fF3US9QS; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fF3US9QS"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43d7e23defbso3889632f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 00:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779433783; x=1780038583; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ITud2w1YmfwAO2VG3810GZ12MSpFc0lANmn3XqSQLCI=;
        b=fF3US9QSOg0jR7mg8bVvFDg4FAOM/oeby6dPHfhzLlsMYMDQTeVnksFjWi+hiQQOHN
         YnKstYwJWBPMR9G7j3jGc8lXB+426si++WGQW5pH1NE57mfbhG/Qqx1V9Ekz+5iJ7y+2
         cX6+aJ4b0IyCAs72cKGRhxjb7LVAdCQrGEGXasQTJen5+Q0pBQeySpGUqPdBgtRjA78w
         G80VTfGsFjBlVxUTzCGQwV+geZqsjwTK/oU7ADUp7x9EBp+XZ3fGnmVGuFwGZ3aMNoDQ
         IX1TT94x+oE5PxW+JhIa5JNNxTIsmm3hGCMtsJnG7seAEMQBhS+sw7BUsr/w2oy7DOnR
         LOYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779433783; x=1780038583;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ITud2w1YmfwAO2VG3810GZ12MSpFc0lANmn3XqSQLCI=;
        b=GJSF42NECg9MTGGR78AjMrPRO7UzqrA+CZHzBRfQj64G1fHjwEaIKU5vOiYsVMeSIV
         PuyDQ/0+PY9KrF99PvJ47FfFVj+FR229yb7EV6AhzibSE8MbMBjemWHJBtIJ6WMDy2Zl
         P7Jk3CTXoU+FPYPI0mDdMMmK4P9oHKAjheK70+QD7E1b+qkKqG0/3FUtbXdVUrVg+6DH
         uUH+6cr4eXaXdrv1gBE3XTjAwB6L1IylEJKrnlTHBgOYAz+a12i5hvv19nUFiD+JMYqm
         X1BhyVI8Rfi72eJ3hbFYQ+qvLQMBRVFcnnLH+cG2exIFGZBLit8evEDBD0C84we8kdc9
         LvVA==
X-Forwarded-Encrypted: i=1; AFNElJ9HP7RLVYoPEeS7uMNZ1BdDAiuCe5BWwDhRYlCFnpY7l7JaPOyyjGEiiwGAcjKlMcWjIjQ41T3JPos=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSEq0c5YUcZWWJTp+QcnBmQV0CaL86ty6QPxHhWpLm5Ji1Fzni
	8LHCbvKPILeB+YjJ+jjB2zivrioqHcd5YwcUoDEoCgQ5uNrm/u7r89kR
X-Gm-Gg: Acq92OFal0kesN7DMnELBD1zA3oIVRvsQWqTTa9R9buzaVWADQ18NkiU0GKsJ1JAHCC
	eZj/rdAt4d363MIthTjtYfXpyJsx4iUgc9DDzg1oVn2Kolg5mlgZ24wuPOAzeYbaxdmV4RJYdHk
	Tvj5PkrzwmR2hihDHwMGwSGoCte0x4F45mZLj+SZJV34oyrGkkusycXxvzCFx+FvLaKpsOznaGJ
	NpkQcIuu9HK17ssUG/GayXMb2i0Q/G2C9pLqF2a51ZAdtS8Zd2/wsbKpEa936nvQdaJvqWe8ZKR
	+DCsP6JywAqjCHs+6T9zOqm1/l7ciEEqlxSuvxocslKb2T5Vc520uWNTR+EyvxMMiYZUqz88Wgn
	tKZl3HfI3Ojnoz3AbQj98Lkujm6AJSlvresvg0vhlf9nT5R7Q0BeBm9syLCS4aQGDMV+XzrU5ri
	RWvdxGhBTHRHGX7Y/NmfmM1BbHBphQn/A=
X-Received: by 2002:a05:6000:290c:b0:455:d927:1b30 with SMTP id ffacd0b85a97d-45eb38af531mr3150303f8f.28.1779433782717;
        Fri, 22 May 2026 00:09:42 -0700 (PDT)
Received: from strix.localnet ([197.250.51.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6ccd211sm2307866f8f.10.2026.05.22.00.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 00:09:41 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Linus Walleij <linusw@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] ARM: zte: clean up zx297520v3 doc. warnings
Date: Fri, 22 May 2026 10:09:31 +0300
Message-ID: <13240501.O9o76ZdvQC@strix>
In-Reply-To: <20260521191458.177046-1-rdunlap@infradead.org>
References: <20260521191458.177046-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6337413.DvuYhMxLoT";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart6337413.DvuYhMxLoT
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] ARM: zte: clean up zx297520v3 doc. warnings
Date: Fri, 22 May 2026 10:09:31 +0300
Message-ID: <13240501.O9o76ZdvQC@strix>
In-Reply-To: <20260521191458.177046-1-rdunlap@infradead.org>
References: <20260521191458.177046-1-rdunlap@infradead.org>
MIME-Version: 1.0

Hi,

Am Donnerstag, 21. Mai 2026, 22:14:57 Ostafrikanische Zeit schrieben Sie:
> Fix multiple documentation build warnings.
> Improve punctuation and formatting of the rendered output.
>=20
> Documentation/arch/arm/zte/zx297520v3.rst:66: WARNING: Title underline too
> short. 3. Building for built-in U-Boot

I am sorry for the mess. I'll look into doc building before I send clock=20
documentation...

Reviewed-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

--nextPart6337413.DvuYhMxLoT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmoQASsbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoi9S8P/0ouABngGtPJ84cmw4RC
cbqM4oJrW6XF5yNOG46jKfbkPVNxVF38uLq9j1Cs/A3pMEjSVZTw6TaD+Hy9KQyz
aav5x5GvppMQZsKkN450SjSQ7XMPs6oME4/a+EWjxoHkI5U6WqHmCFs2U0c4kDsE
rvAc7fjpHKmhwJDcju8G6vDLM5kROmPTOjUSF6XVlCh7Tv3JkIyTTEmc3nmeuOtO
dN6SQFL7CfIFDjDGD47YCd70ULmdQEO3JA1Dk9+/svi1TzT+ChofOUWiv+MVLLxr
yfPFVwAln76gKjl72l9I5Z+nT66iyAZaKbVEXWHLoIluN9A3HcvTvu038WksdrF9
9pwMl2HGWHmjkKap5gvNliNO9vCLoP6a3PZQ2dKi+StACqwPcr5aSmjZ0Se5jaoP
QBSNuUKuymsgfmMxXm5LpBA2jo5TO69zpzVS1z/q0Qo5f0de+WYlCgORFR/NWgbN
yijb3xgCbQvGdjWneTakUmwJ9YnTXhxo5rHGnSOLOQl8PVDljl19nCF9eKvyWT0o
1YkP1K4zl35l1pM9Bfl03xeCKxGXxv13vXmsUEkpJ+wLjahSB7qgq0o1IT1Sto0b
2GOk33H1rDPuOtaWFm+GGQlIF8ePYD3pj35T0qmibb1emFFg2M+rxgRpo8L+gJJ+
P+clcDXhcoEhSIUTevSmqOiS
=kFBP
-----END PGP SIGNATURE-----

--nextPart6337413.DvuYhMxLoT--




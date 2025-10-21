Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60702F0C74
	for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 08:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761035866; cv=none; b=H5xLqTQjp+jL1UzABzES5pGR8ON/+JSFg1BPRUBWHopinoqpHj4VSxMqbsxe0gC8xo7H5B+E5XiB25DeEyHdwHzgjrtEFZWW7sLOJS1+wObqSFXv/WY4Mtg1SYEXjsGuKyJi2fDYxLx2+pOii/W5L8NMuZG6Qc0x72QbuUyk0i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761035866; c=relaxed/simple;
	bh=QjyCWM2eaOA0G4njqmL1QXzj7R90sfd0dteSirTsca4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ExEqzVYp5QUknQvsmHqXfcZKwPQw8zJlOKfJDLCdntEL8w2cYdc9e4PIdKr6GEnpC64Is14bOlWWgZXQ8YKil8dTzGZbIq96CEGMzS1gjauuDFWGckRIwTRb37sxp1XFY7f5UM9Dp7y+0/xCa53Sm0tzdNPske8VTvz2HXyUUM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gx36LVtm; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gx36LVtm"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b48d8deafaeso1189142566b.1
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 01:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761035863; x=1761640663; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QjyCWM2eaOA0G4njqmL1QXzj7R90sfd0dteSirTsca4=;
        b=Gx36LVtmNIzqM8hPLu5g2RBt9sKc3Xr8z4YXyajQafsm8z+85hYTIcZUHC4o0qHgzw
         Kmj4C2v6qaauSPZnF1wYOt78WB9dJvsiwmXjHEkLP76V45M/cpZdTyu4wAXkPHR6YJGB
         KQ1Ab2eZp5Pl1oUxuF5xZdR64/uQNax2P4tEs0gM9s9m4wGfUAX9ZQnWzf8G9kIARh/3
         Jmd7yHDN5Ipy5P1irI+lgmGQYYyYwUfZYj2+Vjg9JcD4lBIVMoGlQtYWC4JBfgiu7fUU
         w+hY+fNdmrx3FAr54JWk/0CPr52x3/qktPr6h6nbJf4R2wP+R1pBQrU8wxnuS/1lz28L
         UeTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761035863; x=1761640663;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QjyCWM2eaOA0G4njqmL1QXzj7R90sfd0dteSirTsca4=;
        b=E+xvXnxQT4i9hnzoPW8DcQEPVRkjSSXdWKBFLY6qwkL27domS46/ukY22554nrEGlk
         iCF9FUXmjxEWFPMSEJK4DjonZkT4Z5S5U9lr+FEZiqhPbQ6EyiGmKoM+EwJptMkF7r0O
         ZdFU2l7cZQgHrc4YjPbiWF6Q2ckc9QJnhHOWbjYCAhbDiq/Eapl71QqWTw+CF73AqaNw
         NjdUf8xmMGOc3S3EqMNkhP0PQpQ7y6cyS94l8OoLXRy32n6FUz40MT48wOAHgERX04Lq
         FK826jIoe4vl76fR3tJx5Dxp9/94ZjGj9T4F3KmukULdamOfSN4CpxGsr3/2hbMI2Txl
         pyYw==
X-Forwarded-Encrypted: i=1; AJvYcCXxhjWuZCck0R1+re+VcBzL+NyAPcKIhc68HY6udVDFhIdbK3UPuGOfvNHkcdvCBATUutApilgHMi0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvqUm3aJgDuje8L+O+DhLNFDLpiLzeJ1OIhzNp1ijZW9kUVjzG
	vT+fxvlq8kUsvmT66rsMdAsZ0NuH+e9DdCNiKydlYzf7S6ugQ2FKLDIlPNl3ijaolg+jop8vdBd
	6B0TLG2xPDO2PwibMJlcsuuRxMlIUZvGRG8WZZw==
X-Gm-Gg: ASbGncsvxt4lkOI+per5Mx6yPxtk7DjF36XptfuOshs6VDs2zCZvBXT3QPFKucfqdZd
	L+DNBKM/+WsShGq8Xcc3GrpUt4YO8CkrgSLi+buiorjSxOVNMBYDpeGhMBEYov+ahWoq70qZf0f
	CCn93N20KIZsRdHg66Ylbm/gorab1vO4FJy6EcTYKd4eUXm9LxcBtrtpAuXtwA8EiBap7sZWk5A
	gpC8XCqfM7kr/yahrtiWIqtV+JhgI2AOgXyRxRUIOx17W2oikpqBh1yVQ==
X-Google-Smtp-Source: AGHT+IEtZxUVPjSc2WqOyAjA7Fte4RrVXHEh4i2Gbt2zB79A/SDrGDESaIChW2EoFUntYRwCfCiMlt+Yi0KqlqbopSU=
X-Received: by 2002:a17:907:3dac:b0:b45:8370:ef10 with SMTP id
 a640c23a62f3a-b647245845bmr1951550566b.22.1761035862848; Tue, 21 Oct 2025
 01:37:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251016103609.33897-2-bagasdotme@gmail.com> <aa388d29-b83b-454e-a686-638c80c6a7bf@infradead.org>
 <CAH2-hc+XQR7v9Z28yH_CTWZ4ieaF5eQFKBVut1idULP=4w03fQ@mail.gmail.com> <6b8e7935-6b80-4f00-9a44-7003071d1a21@infradead.org>
In-Reply-To: <6b8e7935-6b80-4f00-9a44-7003071d1a21@infradead.org>
From: =?UTF-8?B?VG9tw6HFoSBNdWRydcWIa2E=?= <tomas.mudrunka@gmail.com>
Date: Tue, 21 Oct 2025 10:37:30 +0200
X-Gm-Features: AS18NWAkzMEdIZQ7IEi0fFSxQKz8uPinwHCWF-5cnXsFVeY8YpgVfIMAZOdWQSE
Message-ID: <CAH2-hc+M-CyXL1HtHkD9o_Q_8PP_OkYLvjqhdBiCnHVBQspedQ@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: sysrq: Rewrite /proc/sysrq-trigger usage
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Documentation <linux-doc@vger.kernel.org>, Linux Serial <linux-serial@vger.kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Cengiz Can <cengiz@kernel.wtf>, Jiri Slaby <jirislaby@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Anselm_Sch=C3=BCler?= <mail@anselmschueler.com>
Content-Type: text/plain; charset="UTF-8"

In that case, can we use some short form? Something like
"extra characters are ignored for now, which might change in future".

Thing is that i wanted to add handling of extra characters, but
maintainer said it cannot be done because people might currently rely
on characters being ignored as written in documentation.

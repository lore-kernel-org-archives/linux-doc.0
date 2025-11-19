Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE39F2D97BA
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 19:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763582162; cv=none; b=Khk7c30OEYIGvowD/WhDn85Wy/I8CUJMt2DWA+F6Zej70oyi7AmPT6vlkhdtkY4uI8Ex78usKzlLRDTP60MCpIBjAE9yGr7cW5yH2ijh6utygkjI+ISlLA1eQzuYaHMwE3VIIiteNC078qUav87Jrg/b5vjH8XXXyBWdWdoQuX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763582162; c=relaxed/simple;
	bh=DN/DzA6q+86ev6MGPfAT+dLF+J2Uxfsbiqindp3jA1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PCmsqTry4CcXaodqNtA8aX+zIYnWbranfMKWG16tIJiKBqbo9RuADV5NVSl/plLpwD7SirGAf6SC/9VnPFKk7kVBe5MSKH5l2JPCfmie8pn49VsdBorf8+dJNZFRnch48sN1QNBUTIhTJ6dTN24swtdMo4R8vvDG60S/ANBIx1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=b+5LHHKo; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="b+5LHHKo"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-295548467c7so1401425ad.2
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 11:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1763582159; x=1764186959; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DN/DzA6q+86ev6MGPfAT+dLF+J2Uxfsbiqindp3jA1o=;
        b=b+5LHHKo2uZFLgJwzREuY9gs6Zw+2e6wzfSVyCM6Eis7Crav0/UquXBkt3eWPsDkr1
         zumaiIjnYOrQCagOg1M2UzdnVGm3MhCL43iRsDPC336Q2WCxQBcvPSe5leC4gw2poj7s
         KsOFzixapMh3zBZemmBMkB2vuw8fEux8tQwtslZ2bLQ3n2gaiOIK1Uu0J9TWwaRmPCA+
         pt6Y0hN/mNSTc+o/bby86XwRBgkwB+PebYDHdrqrwjXs9A5Hinsb/r9fsAi6ZI/yH2hl
         sdlkuhJF03Ne6XEcF+wR8x9Cg5D3Y3iaZenTQdNJuE9JeHIAuVTfHPQjXHX1SWWjwTId
         norw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763582159; x=1764186959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DN/DzA6q+86ev6MGPfAT+dLF+J2Uxfsbiqindp3jA1o=;
        b=Gqjh2rbQVN2xGaLwCZ8p25Bi1rftzaB8sycFyEnELeYe5+/bGr8TcR556M6wqcSy5E
         fvttQ/pBsXXL1lSWATmQo2esLRMkxA2n74V0D9g6q+hqRNOXMaYqeuBPS6nwCnW2N/NE
         nzsgQgy8/sNVs7jMm1NCxfDzeOZtioGr+ws6FtS8YKUZ6LV4lnjcfXKTw4r+dapglb6j
         +t519RT5LdrS/q7kDcn9Vn3pI7vDli0zxwLa67DBK9BVtGV1aBqOBF3lEGw0B4HIdjex
         jMQSL0N2kQklJ2XX7CfzPMbcWj+HkwKfCTwMVNv1TWFdLemdoGhu5VJHZgHI+nrrpi54
         QsMw==
X-Forwarded-Encrypted: i=1; AJvYcCXj9ZAo9NSm4X3eKD+Bb/LLgKkc8yFHogbDRmf2x+R/4b8RMChK+jqF9hgNykL583zuALFlVci94JI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4u5XbSzZdAtJ4hArifSujf61YjMbQqJG1hpPv5hPtks0C8Tks
	BdbMpRFPyABIVvKrRzm5DXi9qbOrhmvuYfVWvfjXf0D3T+tkxeFQN9OEx4oSz94ZzDGJSZnqfhW
	Oz/HvuZfk+C7+t1AuYxJQLEDW00htvwQ7ygY7Bgtr
X-Gm-Gg: ASbGnctfZ2pVoqo6OAqijanxn93pOK1s0USxOMDQywcSt9/FdcQoOR7iQf5UT4IIZsT
	eUOVwFdzTXOoPDR/+gXQRzD6G8p3RTAvFRyqfIgpc8oDjG3KcorQYSl+ndadleVHB10Y0Mh6ryq
	LFNV7O0VP95thkUZ8cNteeg7LRIhMeraPgIe2stsLq3MEQaszqiYhBvBbN+Yw2Tpjfmc7rq5MD1
	AdGp3rG6EnODO5hvF49/ZGIC9i1933S3iDIFO2ebxx4eopfK662JYac5GCOpv5iaeI/Mls=
X-Google-Smtp-Source: AGHT+IFH9MSHfJWp6YXFB42UsuMhoLOkEWsFTDtMBAdcLCsEfu9ycctu3VPOXdyMN2njeOgrz0I5tCYbRs8o2VLROfk=
X-Received: by 2002:a17:903:19cd:b0:295:a1a5:baf7 with SMTP id
 d9443c01a7336-29b5b0d7f17mr6451945ad.37.1763582159025; Wed, 19 Nov 2025
 11:55:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-module-hashes-v3-0-00e9258def9e@weissschuh.net>
 <20250429-module-hashes-v3-7-00e9258def9e@weissschuh.net> <20251119112055.W1l5FOxc@linutronix.de>
In-Reply-To: <20251119112055.W1l5FOxc@linutronix.de>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 19 Nov 2025 14:55:47 -0500
X-Gm-Features: AWmQ_bn1L21n_pWrZnJvXRwL1Z-01d6qlYWdrkllcBBpENXLHykDJ3f6oq3wlNk
Message-ID: <CAHC9VhTuf1u4B3uybZxdojcmz5sFG+_JHUCC=C0N=9gFDmurHg@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] module: Move lockdown check into generic module loader
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Jonathan Corbet <corbet@lwn.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>, 
	Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
	Eric Snowberg <eric.snowberg@oracle.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	=?UTF-8?Q?Fabian_Gr=C3=BCnbichler?= <f.gruenbichler@proxmox.com>, 
	Arnout Engelen <arnout@bzzt.net>, Mattia Rizzolo <mattia@mapreri.org>, kpcyrd <kpcyrd@archlinux.org>, 
	Christian Heusel <christian@heusel.eu>, =?UTF-8?Q?C=C3=A2ju_Mihai=2DDrosi?= <mcaju95@gmail.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 6:20=E2=80=AFAM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
> On 2025-04-29 15:04:34 [+0200], Thomas Wei=C3=9Fschuh wrote:
> > The lockdown check buried in module_sig_check() will not compose well
> > with the introduction of hash-based module validation.
>
> An explanation of why would be nice.

/me shrugs

I thought the explanation was sufficient.

> > Move it into module_integrity_check() which will work better.
> >
> > Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

--=20
paul-moore.com

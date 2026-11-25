Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795602420;
	b=ikXdi/ixNCrXm/o8mggzCJvz27qjtI/GN28yhTfBPNCKBtxoGSPhUchs07HJH4qgv/9N
	 KiRgJCZ5mz0UG6fbGeRoVFSPzcEpg4MdxwCQY3w9w2kr/xXpmEaZfRv3xvnU/KndT84yB
	 p8AmN5F/3KJKvq6X2wjoqBhb6FYo66dIVYYff/oL5qCFlaaXJbQMBxvZPM+NlpmlkC2cu
	 9lqZgZ0T8FkQiY3fZSOrsFoEbqDPcYKDvd6CdmNGubFzlSblAjmu8JhMBG+oW3p3UxMXY
	 lfBURilmwNawwPefPVNbtvPi6d/MUKKQWdSqbIfmyolo1O9k+XwxXlZY+7SfnL9SZAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602420;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=usb6Z06Hk8KYQV8odRZafo7lcqGHFhPDFCx6kFOexg8=;
	b=hhJlpiZ6j5ixnZ1vFE7ZHc6v7FIhcZ8ePYc9nnUTtUazscP5vVjRiigXf7cUOwh/x8WA
	 upL5DAcSdo2EHSnRccj3Kg8DQGBdfyTEZsemEnnUG7gIVuTxqF5kG4CXgCA0awndeztxk
	 ojSgtwAehqmCOlH4LCoZZht4DAzBxRPPk/I4eRvibCl2Egy89/NP8u3B4hrvZHkq9sysv
	 30EzP0or5wU90CwYAiX0QGPkMCsOcKiCoiUSHg9uUqahu+sGjpCzKYA6Vx/w/yLPi/P49
	 jQFDLnXddfymI0AStUU6IfiKf4aQ/j9I0gJu0jD5DC240M+1NfvilI4uG6fUfs70sGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O4uHgzXP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAD5606A31E
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 10:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O4uHgzXP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03F311F000EC
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 10:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795602420;
	bh=usb6Z06Hk8KYQV8odRZafo7lcqGHFhPDFCx6kFOexg8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=O4uHgzXPpddrs5gBqi8u9B2aC0SyE1KCf5EIAftXmQf0Yz2Bd+cgo1AM8A56/XQ9b
	 QsOVezx8SE9qn+lvrJWJL1PlTp4gI/ODzeAfNUdCBjt4Yzly+8YEdh5lAto1BeiBtW
	 /7CFZIny7BW8SPGrIJQECs6/L+Gmln25txeh1jerNuB2R5ZuT5WsODPt16jq9ZSXN1
	 TAdyxky7rcl0q80azCDqg0LQDzoEB1/CSIuA4WL/UAjvZTNT3qWM2GLj5N0aZvZz1R
	 L8ZFxRiK9+1MKiLQyRnSM6v7F5pPkCH2LHiOaGB1sMe/Gxk8SHMRpzsNCp05SnHtNB
	 EfR1nLIQmF2Pg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5c0a520df2eso5584779e87.0
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 02:26:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF3CQ0skXFDl9nt2987IbBMf8670aabfZtpHugM+TL+ijPGTwSGhwi9E2v5joxuT4drWZQU8y+ozaQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3VsEM5FpYM8iTrAjhUCXT5r1m+F+7NB5Sz2Qcvre8C/5wCfFf
	GKo4dNF66fYgqEq3yVOh92l6OOSjcvCJiAUf4vtMub85Lsska54W+vVUl8ohYeuzQ8kHzUilFO1
	/QEoisCR9lEKUXeK5kwuLeiz06plehPs=
X-Received: by 2002:a05:6512:104d:b0:5c1:5a83:2fd7 with SMTP id
 2adb3069b0e04-5c1bc907072mr5199313e87.66.1795602418769; Wed, 25 Nov 2026
 02:26:58 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015142552.4128028-1-ryan.roberts@arm.com>
In-Reply-To: <20261015142552.4128028-1-ryan.roberts@arm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 11:26:46 +0100
X-Gmail-Original-Message-ID: <CAD++jLm6VvPYB5UQS8Zm73pYifr7Oi=xX3S4Wt5c3WE7uMv+fQ@mail.gmail.com>
X-Gm-Features: Aa3M54rtYXT0tNMww-_rAs-DbnpD3x58pzG3L6crqferpf2a4MJ3rhFXSlspZ40
Message-ID: <CAD++jLm6VvPYB5UQS8Zm73pYifr7Oi=xX3S4Wt5c3WE7uMv+fQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/15] Arm Core Local Accelerator Driver
To: Ryan Roberts <ryan.roberts@arm.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Alex Williamson <alex@shazbot.org>, Jason Gunthorpe <jgg@nvidia.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean-Philippe Brucker <jpb@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ryan, Jean-Philippe,

regarding this patch set I looked into historical precursors and
ongoing developments that could benefit from the same infrastructure.

1. Apple AMX: there is no ongoing effort for this accelerator but it
exists in all Apple silicon. This accelerator appears to be synchronous
using extended instructions and is just "some different SVE" and would
be handled the same way as these.

2. The PowerPC Cell SPU (Playstation 3)

This is more interesting: the Cell has accelerator cores that execute
entire litte programs (shaders?) on behalf of the CPU. These are
however not poilled like the CLA, but signal completion using a
mailbox interrupt. The accelerators are

What is interesting with the SPU is that it communicates by creating
a custom filesystem (spufs) mounted at /spu, so this is apparently
another design venue to consider.

I think Arnd Bergmann has worked extensively on the SPU so he will
likely be able to provide input on lessons learned, do's and dont's
when it comes to this and other accelerators.

My superficial appraisal is that the CLA is probably executing smaller
jobs, snippets of work rather than entire little programs/shaders like
the SPU does, so it is conceptually different, but may provide
additional ideas anyway. Arnd?

Yours,
Linus Walleij

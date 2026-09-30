Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E7144E67E
	for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 16:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790785730; cv=none; b=DU3FSCf+gsCHk5e5RS8DCaaLGHYqsmPLNUBTfUOAoFPBjvfdICNU5h4ZMXUH+VaesAKjaU8tpkBl0kHKikupq3x5JUp9Dk2TuH1Icf37XmOpcaHw9UsyVTv2lJKGd0AIbyyyDlC/E8Vhsfoa9Fnly1IVRmOtXq2GiZLDfLYNCoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790785730; c=relaxed/simple;
	bh=wWPQGvFCRmooTy19kDcLAJie4vdq6nA3AQDscGDqXK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NeVqAUL2NeI6oe6w7YKcZ6rBs/o/VeBg1+K8kKei+7w2sJ2v+Jb3erVUu09qUmI5TpfyX5l0PQqaKnj3FK1TmyGBqWU8Pow/HjjA+zU2qNJ/3Mu2EGfHlCxfTKcjXmYigYpXeUkyYkZShEkhve15zOdkEpOgoqHnsPqGONQRT50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mSdGnX/r; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSdGnX/r"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e66390995so32114695e9.2
        for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 09:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790785727; x=1791390527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wWPQGvFCRmooTy19kDcLAJie4vdq6nA3AQDscGDqXK0=;
        b=mSdGnX/rO/fDniw159ICr4YHJ23/JxI4zuDcKxjQAbH2kBGsGKJqkZcnp35ILhkUeO
         G9V1Vreco85mdtPq0NbKWyxWV5NLoXhvnZSy38Ha6osW4xWiH0cekXnQuz+EbdJc7Cyr
         MPbBH/+VYeg+TGFfqNcUgBRL4bt4KPTSP6dxWeAgKTmAwmZYd75f7cTfAqRM+TSt+SFM
         5SNDGVZHFdEEZe8kUvWUwme8EJj0we06jRv+EI/+ZPOCaoW3iapJqpD2ozhrjqGAF2LM
         kRQ44WUQ87jdvf9TcHviewHnltaIKGiN5nwdAYHYSdHWqnKjGqAAWkXSVvViKOnve29I
         lPzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785727; x=1791390527;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wWPQGvFCRmooTy19kDcLAJie4vdq6nA3AQDscGDqXK0=;
        b=WGHUw+de7Wl4w1AIJ9djPKfl4XXWMw4g0k5jBV+4w9x5zpeXJR3XuYhpBiBkRbXnuK
         R2m6mvPYlDRVLehR4soFtd9hiJAzOWL24yhiZo55hW+rgEwpkR6lM+DwEgDQbiLe1F+j
         LY7aASwE/qfOeOWXJAEqH0+jONVNVSaVWddE74iZDb4HwqbhyeaUn7rUw4TI339zW866
         hbElmFlhmYs5DQ8aJ8UhRAfN9Iltdt9ie+5vxaL86iGMEIIupwmBytEqRVQGKrYqEbY1
         8pXFkt+qE7drzM+fEhL/mEEO/M5ywIpjX4HNILqfdCciARQoKDFD3BgfP6gCaO19ihQR
         Xrvw==
X-Forwarded-Encrypted: i=1; AKwUvBwvs1AVXasPW4MbcAnk1oVpkD2SO+qjd5lnHzTZzPPjHyue3JdSXgQZyEoEr2N2ypuH/1wHKtAplaE=@vger.kernel.org
X-Gm-Message-State: AFuF++lunb/oIfXHfINlFofuq4IwBnCYPgplegv45Ptyzv3EKhpHtEvQ
	aGUQX/FKs658WZlILllm7q2g363AnAYEzFTq11k0+g1xsTXhk0rJn+8=
X-Gm-Gg: AYBFou3JZ62KvIvgqFfnaJAOjn5JvdxcUbAhz3eNrcTNsuobn0gQq2ss2Z8AseOOlsr
	dp7v2dMU4s7UCULkVnQhjwG3dpdCUzK7WmSG/JXfol7Cm7GN4+ZE8vyqXFQ98TWiVlcpsskuRSG
	Eu2wNYaCe2/9Vr/S0VQN4uWj5gKW7nl+hJFguEOpqcBsCkTlJgNYYYhLEmPiXlJOFKdutvtqE0f
	Y+hjvGcxHe49VtSoSU7ExDsfuMOjOsK4DlvbPoBgqdfq1EH0HV9tXc6wJG2gUIv76sI2Hvl6E2J
	aOl032310ncJ/hw4HHV3j7DN2HdFAaBivvsB6LBsgEBYYHfDLRFOhYCjRoHzr8qe1pYkAlGvwUX
	EmnMeMHld7uSenyRM9jB+aqv3RTUVCA5ex1qcAU5PvtAcelKJJ6AFQkmYJgOBdOM06u3CQPimJj
	s1ga73oLJAXHHT3yAaffEW4CLdG8614iNIQc/ZcTbkGqfbVyn+OIdKxbntxl2e2CVLt5dD2v14o
	2M8EE+vt37ipZvSfe3iXq9yO/pf/VfLM8qJN/YfxhA8Pk9fzm9xFXF5bYH4jA==
X-Received: by 2002:a05:600c:c3db:20b0:4a0:1ea1:477a with SMTP id 5b1f17b1804b1-4a01ea147d9mr4823005e9.27.1790785727060;
        Wed, 30 Sep 2026 09:28:47 -0700 (PDT)
Received: from localhost.localdomain ([31.223.26.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01eb5ef77sm2595265e9.1.2026.09.30.09.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 09:28:46 -0700 (PDT)
From: "=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?=" <habilerenturker@gmail.com>
X-Google-Original-From: =?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
To: corbet@lwn.net
Cc: anna-maria@linutronix.de,
	clemens@ladisch.de,
	frederic@kernel.org,
	habilenterenturker@gmail.com,
	habilerenturker@hotmail.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	tglx@kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v3 0/2] docs: timers: hpet: Modernize and document API
Date: Wed, 30 Sep 2026 19:28:39 +0300
Message-ID: <20260930162840.6623-1-habilerenturker@hotmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <87tsn7wtqm.fsf@trenco.lwn.net>
References: <87tsn7wtqm.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jon,

Thank you for applying the patches and for the detailed feedback. I will make
sure to send new versions as separate threads, use the correct Assisted-by
tag, and avoid trailing whitespace in the future.

Regards,
Türker

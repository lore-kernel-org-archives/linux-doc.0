Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853276;
	b=tBELzFfNr4At9eepGt61iMi9fuwupc6YfAc/PeHq9B7vKCo524vsBm1V9G6wXR+9nmxX
	 L6GRKYUw9lzWCtoqG1Mp749RiGqzqnPhvQ1P7atQE7ltbCCGUpuTF5rEGqVhe/lSohzYh
	 TvBcFd5pgQby7/3MCQz8nwsJqjCsLXj0DHSO4z3nYSqzZAhK2soGyUvks6HCKLRQy/Fmr
	 dED9OKTuPOMzvSnWOqBJ/67tGmBe0n/fDiPtDaw/dxb3fgvD8nM84NAk3I2y9HXvE3quz
	 EK19D1NM/DtZiCtjHr2KB6s6Oc+rS57TVfeMDztFxB45k9cXYcEhVqqEOXvFQVXobeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FuJbvNF0FrPMLXejiqbdViekL7UXyCU2votoGhiD3Qk=;
	b=lmw6+eT8p3omaJBHiOe4K/qiDT7qH5a+XexI6C71CvY7KXNPZG10KPiN2YWVjNReXdHw
	 qkiVflsf5wn7yAgwNkXSIQgR+3BRxSzGm6S785SyZgmQgYiJYN8iVZJg50Fc9JtIJsFwW
	 ZUnWK7vZWfTon70MATxfwrbbGirzSeQQaYZmrKk3OW8AciObHvkDvuq23V5fR0dUGFIGm
	 vOFl6c4/PKXEZe1yAQ5p+D10xHkfrbNQfDxFiA4isObtAyN9jn0l94yN9yI+2TAECiIx/
	 x+xf3jDvDqWS+7+/69eb/H6YWMv8NnKtVkJIxSDCxORgPXHXkCuTgobwCPJRoLse3sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v3JkZ1RQ;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAA7606A885
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 18:21:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CAA7606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v3JkZ1RQ
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so2041570b3a.2
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 10:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794853275; x=1795458075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FuJbvNF0FrPMLXejiqbdViekL7UXyCU2votoGhiD3Qk=;
        b=v3JkZ1RQEG58gy+eqpxPbxT4r2sOGl+3RM02Ofi2whSprgoglF1t5NJzEdx8sfFa6V
         Y/CwvO/WJHi2dcQl7L143L1IovUE6y9/goX7nZbdD6HmXrv71AVVxOLcPGHccKnPvbpw
         g9BsGkaBia1RGG1iffaOjrKO7wzfmlrR0pUWwnQiBAnk7bOtcngrh7hZW4orFLM+GXyh
         oFR7OnXSA1Kyk1Jk8SaztfuO/ien8ulpHEGVKgVjc9S1Eh3vycBMe/pE7M9U6X9TQUTI
         HJ+l5hcSm27NIv9Pf778NMmhtrIdiGGD9nqKGM3QEisGswQ2XaP2JWerPGeh5agfIAlL
         A89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853275; x=1795458075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FuJbvNF0FrPMLXejiqbdViekL7UXyCU2votoGhiD3Qk=;
        b=cXC0FA5ibfjDqotYBIY+par8SN9uEj0FWuEMfh/y2RzROluy1mm27tbABsMwjZJF6z
         Ad9XftYGEa3AeiyErWEoGrOIhFPnbE/HFcZaiV1qCDVwcGvUfoHASLbrVXuQsai3jFda
         ARgxxb517kCxJnDKQyZ5xWRpv2Jv1bPJCQPsU4tKztH4ZvHOiyiH3HWajegGpODpaA8x
         C77vZZx0DvRBOBNRucAnQoIMzdunLRomdFlORgBcKT3L0p+P7fv7NkBUlR1OykigOTSh
         mbm7EjuQcRJjANJye0P3gtQbPTIBLULbzzQua9eMZ9CSukntYu0rB9Rf+RWk6wnX4KoB
         zjAw==
X-Forwarded-Encrypted: i=1; AL+hErEEEj4qdYT9DXiawu4D+cz/zHLY6u+BcB37e1KkOr24efooUOmevBUYnuJdSWwJTzwCW1hu2vWXIaA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4EKhWHtxvMkP9vYyhET3QiEgE2KvU4wJiTebuAy61LgE1NjsM
	Vs0S8xfrPpagJDOktOYBHyRXEtZrtRFmp2P0qIoxUvrOCVNYZpNUVcRh
X-Gm-Gg: AYBFou0YvsbSJx+li4ktbv9qMBohQIv9OIIit4FLV+fpyKyLKaZtQM1qweHrgZkC+X5
	nUHFr7M+pPpyqIgPxKR+I32eJ+MPFXEK3XmuSgZOLax+3ElOsIJhtJAc2jDLryJXfWeU7Oeq8RS
	uGhAGDrqWudmO4RpNPeAHkwFMc+SpmKkjw2FaxTrfkWDvbqkcjjpAS2l8w4bp4z5o9cGcoE2KEc
	CqH/F61P9fXauU5PEEIbESZHixKSfluHGLchC/wYw65rTYDQ7npho6P8eQoQ1lEEe8osoa7rVbX
	9vR0ayBnhqEcbREdD33YFgl8wS1DCcIJvNcYERHMqtqKApG/s+qZAC8eBlyX+XTmcOflETTd32V
	oOcLUCkiXglfGG45CvPF6jxkTTu3q+6bN6WpIbe+m8Hpy9vIr27xkNOwat1RUvhPMLr1tm/J95F
	KkMmaDEIoIHB0gj4gPiPnCiwwanV5/MFIvtF2/dUZQk+lqjhCYemuHnY4are1gcvEZw4vDM0bnY
	7UTG3edCkPKN8my2V1tWGLJwn/giHogaVrIBS2J5Ur3+wlh13Vvny1oZYkd+OjvYpkVI6QWIs5Q
	HlRvvnOa94Lqqh2G8W7MaqMg6bbEmtb0qoe46Ysrqj0zfesqPH7gBjywxdE4VPfOTM8RFlyOOQe
	NGl6ogxxh+L2NTEev/7B5Gd0Rd/ovbei6zUOX
X-Received: by 2002:a05:6a21:8cc3:b0:3e2:ad2b:8f69 with SMTP id adf61e73a8af0-3f7a7ec1f78mr9948935637.67.1794853275248;
        Mon, 16 Nov 2026 10:21:15 -0800 (PST)
Received: from localhost.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde0f3f4c7bsm236378a12.22.2026.11.16.10.21.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 10:21:13 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: andi.shyti@kernel.org,
	andrew+netdev@lunn.ch,
	corbet@lwn.net,
	davem@davemloft.net,
	edumazet@kernel.org,
	horms@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	rdunlap@infradead.org,
	richardcochran@gmail.com,
	skhan@linuxfoundation.org,
	vadim.fedorenko@linux.dev
Subject: Re: [PATCH net-next 1/3] i2c: xiic: allow platforms to require 32-bit register accesses
Date: Mon, 16 Nov 2026 10:21:10 -0800
Message-ID: <20261116-wiwi-v3-87afa10a8-r4-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179456531820.2199510.7014507677375597007@kernel.org>
References: <20261111041904.48916-2-ahmadexp@gmail.com> <179456531820.2199510.7014507677375597007@kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 3 is the first consumer of patch 1's flag. It sets
force_32bit_access in the typed platform data for WiWi's XIIC child. Patch
1's proposed commit message now identifies that dependency. Other boards
retain their existing access mode.

v3:
https://lore.kernel.org/r/20261116-wiwi-v3-87afa10a8-0-ahmadexp@gmail.com

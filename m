Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794953064;
	b=ju7ObmFHzEOq/PqL+cRJKthJo2qlZI9JS1TbGJC1vAtPPWxxcvv5y+BgBXTRqjVfRrfU
	 ELgGCElCWI9cu2+OOBF86PDbTUq9ft8olybLoaRHpzQRWFQKdVqXy6iNl0AKGZDfuVFlH
	 k34el0gMcU7/in5Dqkx4ehMAFdzNN/rgvNGnZUU9jLqL0pyKKd7nzUYpQlL6fvtdG+CMl
	 PS0YMC+ytfd5MROF6FYYtcd4wdGJ8ebnFsj017m/b5Jg2RuhfhC1+qwHj0ATdn6RJaVhA
	 vhzvKYNiI02p5pEcVphVbDAmBLgckg9FMrWAvLrRYKGkjU6Rg3Cq/9C81vxKcCD9ICw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953064;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version;
	bh=F0h8eziyjQaKcApZn3rXwi6/D2KTrjlf79mLv/zsAlo=;
	b=mbk4uIv2hKnyPe3xN2IxO8V5DjZvqgnH1ZX3qUBNiDifr1/hbhlWcw5dztC+a++7uL0W
	 HCWs0NjM4JsrC5o/xDzzOeTgbPf3gb8vn15RVTTpVICA1UxZt/epz78kWvyXkGTot52SX
	 GGRMc25/uJ2mwZhAmCeSXvAwzs8K0/GEQaR45/YPFTKP3C206enKhmY6ZDnay0WDjQRGm
	 hVjxjLBo2gxuerDmQ7vwCF4NAfR/3dFfweNimYdh1aqroKUSY5bQhCFTnNXeDXZ9yTLOF
	 PLp+abexzwvjex7BHxa6Ga3/5sn3p+F5fSEc/iIhbaqgY0k6q7SNKrs6tv84H/xxaew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=l7uGjHqQ;
	arc=fail smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC23606A32F
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 22:04:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CC23606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=l7uGjHqQ
Received: from pps.filterd (m0528007.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHM1w1d2806965
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 14:04:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=F0h8eziyjQa
	KcApZn3rXwi6/D2KTrjlf79mLv/zsAlo=; b=l7uGjHqQiohs5ekfiARvjRSqonZ
	vfWTdNRDAMTgYbwgHd2DiCaSQiby1P8w8eUQPRR+TIo9nRLlBQFNdDnVag4VjV5v
	zrbZw23J8ETzA0nATXP0IVDkySa05zQZtoRlDwRuy1a2ZoxUH4Pp1yJR43RsCUgv
	tl+xcJlH6woyek733bANbYzH8HReXmgA4za22Txg6BnnOkOdLsXPCv3qcCky4PEl
	oTyV9zDt2xSDfhUpHFVmZaywQ69nMGDlbBxkhLjsgqHBVVkUhwg+7DJBMhDNzWHE
	pFQ8H/gSSYpsYTJQrKrhs1zeRTZ+DY87ItQdcFZRO3NzTPrKdYV1xdB2t8g==
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j0y9502tj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 14:04:22 -0800 (PST)
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-499ca65ae87so83350f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 14:04:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794953061; cv=none;
        d=google.com; s=arc-20260327;
        b=E7kMxKheCEaFA3B0i4hnmQ6d0UFTTkVijNZymV1GPAPTN3qClkLdSS9zs8c6mkzEBL
         ZwS2XuEkLNQKVCO9nz1Jhox7XP3rqrep0LOK6C22doNS+Hprj5cCul8DQ6u8V7eqDnqh
         od3SnqTeK5CxWFtrGGRsTLzHuTNvg/FyiFaca0LLwV3Gur4s+8bpZVLGQUIVHMxwZTPH
         IgeveYNSjA5Nn5Qhl/aAViH0syVOq4mS0U8siW5yNUNPRic9Mmrw5OHP5uG5+X+4xRv4
         eXANazDBNEa6mf/uu3DSoH2Y/ivq4tH7G2mxysJb6D90NtenY8yrMEL7+CvU3SsvR/tp
         yiPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=F0h8eziyjQaKcApZn3rXwi6/D2KTrjlf79mLv/zsAlo=;
        fh=+IIbogHS1OK5qDcw1REmwKyVLUg/rmIntT1RyJSk5tY=;
        b=KoulUwD7Ug1Av2qOqK3xK43g4Csj7WXbtjgAa8ZVa8x+KnD5Sljr+wbDWvr0SboaH3
         VylYA0fR8TPCEZUC6N64dS9hvlpIyABY2Y2AscpmQvvlb9Hx4Iku1RWfLBJcuV4zkRGx
         3jkIG0bV1GGo32Y/fvZeVY0uJt2e8yScma2KyFrH7yLZtwohGmY3XLhKVUhyi4zHcqPM
         BuJLZSGlUY2sXkfQHoK7OWQfQamvEy1lmOP9AbZqVkf8YQEvePD5/F5sUPyrXZDYfXTy
         k0jcCyRZwN4AUQOv2bNpt8VUuHim0/QRFf/B1/qH0QUxY72D2BwCupiiwr2AnP9Aq5KE
         rf0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953061; x=1795557861;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F0h8eziyjQaKcApZn3rXwi6/D2KTrjlf79mLv/zsAlo=;
        b=YhIspBaSxLyMZXTrHr1pBCLOZ/TDY+uqD9Lziqeb5IUVaDCWINpj2yBKzBwz6/md6h
         tc6SDFtF2HPso6g3n1phGAndKpn4a/5x0JEA7IJz76wXmLbIapf/sxqAN8O526tLYpU/
         5nyj8+/fhqi4Lc0UUXRie1mGso2Ih4dEMHLB7Hkz7peZcQxtmFrEZgjst+fgG/AS20PK
         DX6//yEwTeiauaHco62sb2T/7eTP5rtSC3Cr1onpmtf7lI55dcOa3y2YDPBuSB1R14K5
         zX9RedAc6ugYg+PDJKT2eATFnly+erQHYLZjofp6eKNuUf7qSyko4mqdWlbH+35xyC1R
         5Q0Q==
X-Forwarded-Encrypted: i=1; AL+hErGqoVzaclQGgOnfCA/fEwS747xhwANfpct4ZsNuvjJ4Glk+EfJ/BRY2BDlFYy042pDtXNzOLHC0wbk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xnVf39pWNQojLZB9iPHaZLgk23a4Ix3ygEBl4KV/QyypUM6eC
	quzBtdTRyYqcWN2C5LC8RqkLftVEPStSQDAR21aTViKPGj3T3jST8KqyLr6T/kLEpQLEAjibLeq
	pj9/695/hPm1LBUSGFQa3bW1zVvJNkexeqCZqGHh8FffvBTE32omnHQ/kCUGuO5+ARsOjcQi3yf
	/AQNgy2VqLb29uqQZhjB3NfcFvKXA6lmh33Pc=
X-Gm-Gg: AZFdTZfyzoM7CMUYy9XTwh21uTeNHU2u59APvU0xEM+nGXMM1mH+cMe3aygJHEGivpK
	QIhFIZ6zh5pHyka3dlSIP4i1Z7a9SUEqmoZ9MM3FYW9icNYRoC9HgWEUeR4vyUarhqg89hGDJ9A
	7/r6JNss1Wdx7TzWZaQ5lJYwVQ0H1VFq4KRJFYAhewrlL6fD5eYhnusm8Zup66ESOR72UYMQGTj
	AMvUGcpLJESXjCvFV/fER2Im++h41Gqd4ZReelzUzTSFPfdhEk=
X-Received: by 2002:a05:6000:4213:b0:49a:94e6:378d with SMTP id ffacd0b85a97d-4a377f4f68bmr8136042f8f.30.1794953061562;
        Tue, 17 Nov 2026 14:04:21 -0800 (PST)
X-Received: by 2002:a05:6000:4213:b0:49a:94e6:378d with SMTP id
 ffacd0b85a97d-4a377f4f68bmr8135992f8f.30.1794953061161; Tue, 17 Nov 2026
 14:04:21 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-9-toddfreed@meta.com> <179471270271.2199510.4403404984222798506@kernel.org>
In-Reply-To: <179471270271.2199510.4403404984222798506@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Tue, 17 Nov 2026 14:04:09 -0800
X-Gm-Features: Aa3M54r8wXLJNYnHzeKDYLuWuEkGFgDFBdsvsZ-D9Jbgov-qnF9vSIAxOghmZf8
Message-ID: <CADh2yMyL_SSJqD4=H4zkzmUCJCL4OwxeY+iPq5FQrBZyCb8+tg@mail.gmail.com>
Subject: Re: [PATCH net-next v1 08/15] psp: only give time-wait sockets of psp
 connections a validator
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
        bjorn@kernel.org, bpf@vger.kernel.org, daniel@iogearbox.net,
        daniel.zahka@gmail.com, donald.hunter@gmail.com, edumazet@kernel.org,
        kuba@kernel.org, jhs@mojatatu.com, jiri@resnulli.us,
        john.fastabend@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, martin.lau@linux.dev, pabeni@redhat.com,
        saeedm@nvidia.com, horms@kernel.org, tariqt@nvidia.com,
        weiwan@google.com, willemdebruijn.kernel@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=Ts5zFzXh c=1 sm=1 tr=0 ts=6afccf67 cx=c_pps
 a=C8Sa+zVB7PeSwznsLr31Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=4h92JMTCafKA-fb_NiOh:22
 a=kH2YsCX8xyqK-3fOXDQA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=eYhU8IiCvE_ms1W8Tcak:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA4NyBTYWx0ZWRfX7myafJP+Y28Z
 erj3M140j0U3dzRqnLxksnULzKkvlk/x2kzepTpZbADh6Ei5+I+jv2go3IYwLUkYPvEY3RsKs/G
 XBS+ynHU23yTGCxOnisBGXL7yYKKVt+OxUPY5OFBVKFf3zohP32YtMQ2aOOK/N/nYquhRZxTiZ8
 cpK3vkgZlQX72FmBkkob1bnNgT/qM12wglxeTMEzeoqLN2hSzXy/VzIEDIEE2RhQA0jPnc5Xot8
 OHZdlLsgvlU1iZaPELiCnp0muNNeelLca3mfVnaOWdw9Mf0PAp+LfcHyQhHVtiwqyHXK5EgbZdk
 z0Y45ftOK3lSQubURJxVrTmilF/unFpsdUAn3jsBspk651X7ZgDsP8QZ1na/7DtxqphaXyBwQ6a
 mg3/VA3XmrS4ATau3xUt38Ll6NtlLoCAjghdXUv2B/hNBv3WZ3jh8HsZGhKisiyxmA7eWIVFwcq
 yWyC5aXJfRtnC6vASiA==
X-Proofpoint-ORIG-GUID: hzta2XndvxmAToafTVcfG4DHgAHZcL4z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA4NyBTYWx0ZWRfX6pO1cqTfntxj
 ROBVdBWhei8wqeb14RNLyZ323PPj1kQDKSinWeVqc3Jt+I4AS6XYp8HopjUord9ApXFcF/eN/Ca
 eSpnrDkn3HGKnl7aWbiRx8mUr53ueNE=
X-Proofpoint-GUID: hzta2XndvxmAToafTVcfG4DHgAHZcL4z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01

> [Severity: High]
> Should this also check pas->tx.spi? As written, an Rx-only association
> (pas->tx.spi == 0) also gets the validator here.

This patch has been re-posted to net, as patch 3 in the series "net: don't
redirect decrypted skbs to ingress, psp time-wait validator".

It is now checking pas->tx.spi, as suggested here.

-Todd

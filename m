Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794030044;
	b=2wsuaiXsptrVEWEcjevS47oQYP7ZkZQciYSH5CV5qitC/uH1Uy5KK5QmyAN8XvkYw/o7
	 fe4Xi6LooQuciaE+SBOufz6x29IcpgPRqu0eea3e+hyp0m5htvpcOe0pSU06Rr/K36yIO
	 TCJkJmcIRza4YqIAzLwa+IiDHCfOy42gMyOjj8h+k88FLeJvpu79PKIgUaiD0PX/xdPhZ
	 mQhyqqLV8Il6yL47D7y3gOpojH8j0FTOa/MhY5sJNVFKg8M+RkpwTnARaG6PqoXZep55m
	 O75YWfGGg2EXFxPvKwXgSbEAUO5K9Uew49r4Bf3Psx9p1gO8Td4O+49vcy+/piY/UhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794030044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=U+0pTkB3+MWRLSYz9PVlpdTWCZvpDF7n5p0vN/UixaA=;
	b=uD0Hu51t0Q0xpepxafPVJ6IuZVO6IPZgGgaSo3Y3SIMvHRQ/PeTSYBdNNXlPLZ+HwCiG
	 glTQBMW70+G/3VckbvHwelcLpr+8gDl67Xep/IJGSiQOkJfbySxzoKWru2mw65p1ly0vA
	 kP4EIf/ZiJRcIxWPePD7N3IN5zRuqkaOGJYGdlvZjlhRXDmCLRan6bMnDEiEGVmW7oQNB
	 olRFsZ2Iagi2y+cwdibOB720Da6FlSIWRunz1Noacs23UQL5cpmWvjYQh+9cdQh9qNSZp
	 A/aOcf8Hpzx5tVBEUmSMBl65A/jWdGk//jO+QkBQ98Nr5X1A3xB1U0twwoaC9BUZR8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MKKfBy8c;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F841606A32D
	for <linux-doc@vger.kernel.org>; Sat,  7 Nov 2026 05:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F841606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MKKfBy8c
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ada8bc2380so735002a91.3
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 21:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794030043; x=1794634843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U+0pTkB3+MWRLSYz9PVlpdTWCZvpDF7n5p0vN/UixaA=;
        b=MKKfBy8cKXapsmlYd8GOwL/ZTCcezrUbWwB0OqF5FjEPGS3PRmlqS61fHiccoL9MGR
         jQiwSHoSjQrFn5Wj/D4vDaOSjN/+4kzY5aGKTHsXJqNOVuCf03zIoqsNt9WbLv4rdHTd
         af9JsvxOc8J/50gWAu624GSz6J2egf1JjB4hMsOt9wW2cZvQ67Hp1a58eo5GzX60furA
         R67LX83ZH5EEqS1hlkhpAoYzV0Yh+WmEQoOV/jYt9vxhervEObCUCHCwDg/CizKShOv9
         jhlKU4eegdoUpRYmGeZW78IIsijX8MRJgyxUiRaL4SJBukmYR7PaBr7bhkiOZ3veavyJ
         IZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794030043; x=1794634843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U+0pTkB3+MWRLSYz9PVlpdTWCZvpDF7n5p0vN/UixaA=;
        b=U+J7BCLZxqlEf0ZP4GYj/UAEj4b1SiW5SidEf8ZLfSizbVbegJ0Z6dynoTXf1D3twc
         63SJ03Ipbde7BCSMdALh6yVB6sx/71RRKy86zg9VpCu3PJsUmNcfNwXpKjgt0o72S9G7
         TKcLDjPMvtb5DI7w/hA0SVsJXUbIkgDDN41C2yjCBQY7GgNcW5NA/lWsIkw6HnmTr2cZ
         kRtP9Zl1pwPI0+/9xwRqfrmWp5PsuwjGWAi+GeKtIIka0NF4qb777iZ7DrRXngZRTuLx
         yTCLoVaYp20FTeudOBF+PyAc2X7x36Hw7W/8ccBPDpaG0HcqHUm7d0oykPQ97zY+iM2J
         OmDw==
X-Forwarded-Encrypted: i=1; AL+hErFtYUkj7BAlPMPXGd8R7JbzeiBvxqHKe+j7TRtrQjUCjidsvS/pfQ2lnECCEZSqJr7upMviKBPrFvw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AwR01rYpJryD+qwOf4cIo8itOu7q/CxyYAGrHXC//WUVR4+sD
	cdAUrUSsQ/zvNOEnXJjWhFx+AfYB16dwfUDwkeLFX+kDsSB0OGlC6KLO
X-Gm-Gg: AYBFou32+zUWUUVEwbvC/kx8qde/I4wQEjzcqCi1VPFXegwVrWQM+29cVgqCEIaqEPX
	Bhxm4yAQYopOv9QWDlpntATbrnzAtBMQ8RBoM/9n15qAgksuVzpi4uxj+T1HAevI6ajSzKBVxYx
	ZsnS58nHMLDYPLPHJvyIg+QwwIejwAa2Ga2+nZ0gCcoHGXSd58jmoGSVuRvEBA/WJa6bjYJx+ZD
	Fze8jkMJbbEyLUzxv37rlPEnkVTcZP0PnosnxLW+JGI6SD1PxpQvm9FOkpFxMuueFGgfuPowbmy
	IshqINC94VqrXKoZVD2WthgZmfgu22f7TCC9oFbD+QHHvaoBjrVPhW5GUpEARQckuyBXXV5pgEO
	D0oZqeWC9JwMMQrtQM5ysJjBvJL8MJGR9tOx4c1cWecHi98wmesohyOLb5vwNFNz7GY7G8/2HUQ
	2w7UJnFiJdV5DpYjiqd6zmN9BxdrnXMyhs88H/qM66+NBXrNU1rRKpgsG8r2bfkrsLfoT9VBd1A
	HuHP9aqPai3+z0kfdTMU+E+dt0/Os7MoLHtNaSXU1+dDYnEMks9dduwht6y7IJF/lUyfWi1dPw9
	sQgHwJ84kX1c1nt8Qfn4RG7Jz8iG8pzUru/8Yh7YjWXDIgrj2ydRTQUPdvBZiNeeh0w11g==
X-Received: by 2002:a17:90b:39b0:b0:3b0:a757:e372 with SMTP id 98e67ed59e1d1-3b0db71a88amr4553467a91.47.1794030042944;
        Fri, 06 Nov 2026 21:40:42 -0800 (PST)
Received: from lipengfei28-ThinkStation-P368.mioffice.cn ([2408:8607:1b00:8:a1a:7bc2:20ba:a479])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1054a0475sm1847682a91.0.2026.11.06.21.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 21:40:41 -0800 (PST)
From: Li Pengfei <ljdlns1987@gmail.com>
X-Google-Original-From: Li Pengfei <lipengfei28@xiaomi.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org
Cc: mathieu.desnoyers@efficios.com,
	mark.rutland@arm.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhangbo56@xiaomi.com,
	lipengfei28@xiaomi.com
Subject: Re: [RFC PATCH v7 00/10] trace: stack trace deduplication for ftrace ring buffer
Date: Sat,  7 Nov 2026 13:40:23 +0800
Message-Id: <20261107054023.3077908-1-lipengfei28@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103194429.739feafc@gandalf.local.home>
References: <20260912083753.3426176-1-lipengfei28@xiaomi.com> <20261013020321.1898006-1-lipengfei28@xiaomi.com> <20261103194429.739feafc@gandalf.local.home>
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

From: Pengfei Li <lipengfei28@xiaomi.com>

On Tue, 3 Nov 2026 19:44:29 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> Yeah, the cookie + generation looks like the best way forward.

Thanks, v8 uses that format.

v8 will be the core, the hookup into the stack recording path, the
statistics file, the documentation and the basic selftest, with your
comments on 01-03 addressed. The binary export will carry the generation
in its header, so I would like the core and the cookie format to settle
first; the binary export, its parser and the capacity boot parameter
will follow as a separate series. If you would rather have them in the
same series, I can include them.

So there is no need to look at 04-10 of v7.

Thanks,
Pengfei Li

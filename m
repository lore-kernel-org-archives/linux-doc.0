Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794032916;
	b=MT55dtfItv25kRu/j86A4xJmvpcp/8fLlEX6396F4A+3+UxUdZPDgcb1qoUC51ZqW9Zu
	 oKDzgHXmyugQERuQDy7XjPbCzZ12LdidB4NGsZXzrIl9lQd8/5L5ddm6bzfeEtf0OIgGW
	 WRSLG3TFQuxbPud307fxx0uAthrzArKiL2s2RO41QDEOLyV2xV/6eHxMqqTEjajzfhyqw
	 kJgNfEcWBcBGfEQKZzQJcbY5zFKdgKMg0L6gIsOHK2nXWid1BsM5RdtPVqtgLUlbTOzqX
	 dzKP9hjOLukiAIY/Fr0rp4UHDHC6hz+HdEm8zN3S4/z6MuxPeJyKB4aWJ/mCkz0ndfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794032916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=y3fAM8CU6fD90S4RyczeRFzjWR9lUGI2XBHnFrKKF58=;
	b=f+F31lW/yoP7Pgrhs/TR5zH9k115oR+IwV7JFULYP6URTKkU5kaeiuWIf4w5gUsStvD0
	 +8/CcIj5PlrmecRnjautx6g/3fkEhkPwodGi2KmzWFDpOVMkJ393zqxBGaksllA2HnSkK
	 P2Ot81+u9Fhe41xBnY3dHtJhVOsaz4xoKCTeSp8dod8agHcPKPi/t8i6pV6/SxR01wn3+
	 N/t6MuRFh2/nNHq4gr8os0KE0rpOflIDPyzlx3w5rU5jW/fNHIxvnQL9QtF4MR103pZZu
	 W1QZH7suhowBzKM52Cze4K5RksnUWhS6HO8vBZdD8YeQH9qtr0BgahLpCvM/XcqTSoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q7zAdbIM;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67E3606A32C
	for <linux-doc@vger.kernel.org>; Sat,  7 Nov 2026 06:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B67E3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q7zAdbIM
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ed0890476fso7206405ad.0
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 22:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794032915; x=1794637715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y3fAM8CU6fD90S4RyczeRFzjWR9lUGI2XBHnFrKKF58=;
        b=q7zAdbIMkptkkFDlti+X0Wa3Z7jrU9yPPQq01Q6EArrGJ2FUruaEi2/1Hp2EAL3kxQ
         wlCSarsWFfQBdr+E/M1M2GuzcHs3bSNPxaVNvjVtR8liPd94qpR9QNhpXCPMp6f09303
         R1vvI+zoW1cfUaINREvos2TpRr/2Z7V1KU384BWTN06fRKzaHhyvoafscuu1BhDADMzV
         OpvtKi8Jp2w2059j2Y6IosLTQ/VNsRZBTzo+3IRLAl9f00RVaPEwifvmkr2GGinN7cBF
         xI+Am02u0eh/k+AL7FOB7AaXury6qLrh+eqASjK6cEYk/PrVXeZ1Hp1a2d6iB61RWoSW
         uH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794032915; x=1794637715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y3fAM8CU6fD90S4RyczeRFzjWR9lUGI2XBHnFrKKF58=;
        b=F0hUNUI6RA3vqCSgcl6h4xrvsCZto2E05P2YQiHAn8BmeBBULKnLiI+pRsBBf3xjJM
         safqEd2ioGR4u4ATEWuPKCEkiiOtvDRk6AC82UtwR9Dic+pr5vzka0G5aBBNu8eme8Va
         goOXoWrySoINMesP73MAJ6IwON2nU983ZaRPZ97rEJgSTXeMAkl+1GE/dYN96VzrD254
         huXBy7ObTusSk6zCe08Z8FCMl6/cRGbJhAyDH1akHko2dILyEjatmNIDMmmRu/bwi8/A
         unZ2h9jVKRGMqxUfE8qyGOhiA+3iDpjbls8vMTH0Slg9o3x6QkV2MGBJJUVLxDLBld6Z
         FMvw==
X-Forwarded-Encrypted: i=1; AL+hErHSUTg+XlXWpvb1FppgwCZ/lwu00Rht71thxB9unE8/CbGRLDgEK4kRmrk3vZJpk+wt+HxptaBv1cY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gVnB2p3Kmy+7x/u4/EksRiDjkOKuaDt/r1MjD55ymw5WUQ8xA
	Elqmzh5rdAalhWkdrlWEcREIAmqFKOHrDwcq+hUK59ir+fW2ulmwxH6Y
X-Gm-Gg: AYBFou2q7TPE5xc1Vh3KZBzWR4JZdyvRV84z069yzncAKjXkpZ3JujeGsHIcTlQBiYN
	TDHsTqzm+51cv36FVWlgzLZO2XbeKFwezNtBBZTyVThViiTbIQM4Tflp7YFb4x656kYpjXG2Bp+
	camhmN1OOliomsE4A72GEdJohQ5FUeM2cVenTPIZFK2OonbWkTYUH9qTCaPoAbKFXBOVe5Ad0hH
	f4e59uKmGZAG4QyuhLy506o6mVoHn2ctc4gq1NdjgFzNQ6knMf3pnv8m9OOHeREX2p7hm5JQt0a
	bxXSE6QeH5MHDGDTqkcDPXqVdXWGdSrDAwq+RX2FbNdi/xjg7sGZ6AmU8eqVX5LnWWYoRONb/ah
	uI3WVGrzgDLSN4cKWpt8LvcybgY+dgbw3dwmRC51SvjaBN7Cdgj1WpElEIS1e1dK6C9BXLJ5MFz
	btG8Gja3rxCczAEnF05xiHODl6EoS3H6KW4MppHlbA11EV7u9SV1mVCoLDVg4stvsCQljQaz21G
	HtUwAvbEh3dI+LXHiBFO6c4rYT4mhQtC/RuxPQDXr95HTfNGk5S66M6gekNsZ5QQ/ZzJlM4glfT
	5M8eqeg375Df795mZhot4iPSKAIUYoEmh363gIHenrpsf0JcFa5pSeSTeupkJXlfuL9LRg==
X-Received: by 2002:a17:902:e80f:b0:2ed:3ca1:848d with SMTP id d9443c01a7336-2ed40c17e5emr56027075ad.25.1794032915018;
        Fri, 06 Nov 2026 22:28:35 -0800 (PST)
Received: from lipengfei28-ThinkStation-P368.mioffice.cn ([2408:8607:1b00:8:a1a:7bc2:20ba:a479])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47da3e33sm11176045ad.76.2026.11.06.22.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 22:28:34 -0800 (PST)
From: Li Pengfei <ljdlns1987@gmail.com>
X-Google-Original-From: Li Pengfei <lipengfei28@xiaomi.com>
To: sashiko-bot@kernel.org
Cc: rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	mark.rutland@arm.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhangbo56@xiaomi.com,
	lipengfei28@xiaomi.com
Subject: Re: [PATCH v8 3/5] tracing: Add stackmap statistics interface
Date: Sat,  7 Nov 2026 14:28:05 +0800
Message-Id: <20261107062805.3361142-1-lipengfei28@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <sashiko-outbox-202646@kernel.org>
References: <20261107055139.3138633-1-lipengfei28@xiaomi.com> <20261107055139.3138633-4-lipengfei28@xiaomi.com> <sashiko-outbox-202646@kernel.org>
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

On Sat, 07 Nov 2026 06:04:59 +0000, sashiko-bot@kernel.org wrote:

> Can ftrace_stackmap_get_cookie() undercount smap->fallbacks when the
> element pool runs out during a concurrent insert?

Yes. The slot left without an element makes later lookups of that stack
take the "insert in progress" exit, so they are recorded in full but not
counted. It only happens once the pool is exhausted, when fallbacks is
already non-zero, so the counter still shows that the map is full; it
just reads low. The next version counts that case as a fallback.

Thanks,
Pengfei Li

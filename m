Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794029974;
	b=4F9jRTv5YUZyX67X1MyDLexZeqIPl2umD3KMidx7pS6o0DeQ4MQJ+jPDRXpVO9qck2Go
	 hv8KGrBrWcPCWO/bwin9qPnAc8px5jI9MzJghjqFPB3F6FViaygXLHveQMrhLn+fns7t6
	 XDNI+m+oseKN5oxjMl22dGyZXeUXmppCsiALl1u70TiowBmn9bS5mb7ZYwPYRgSs6YSoD
	 N9bj5ets5kRFsQrqd5+gx5tKtJq5hItGoZSSvSwee98dGD4MRO50SAClcWhFihqn3+MCy
	 EM6muzV7tGnYm4YY3QDx9ObSxtFYzIT8A9EQiFyTXwoRkeTZ2Vvt7NK+G4pY5er8wPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794029974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=mf4ZlSzQK0A1YfaXfnQYSWywPw9KHcmgJ0Zlx/5jJks=;
	b=z7soNNiDXKabckzp5Rg99gQGr+RQGKjTsQh+UfxmSoZ14Wrm9dNjeszkC0goHLhVgBjD
	 eLuXV04cA3b69A8X+0tsJbK3G+j789eJFilNM4NsMzdECHW3PKeY+I8lLY1uLK7BBaZX0
	 mF/NoL1Wx4mV4X5iv9c9DZpndTfi3vZL8EcpgWbdv5hlwz+e30ishVg6rUf0Xqt8Fcx5/
	 K/9Bzfla9wxoMaqZXmPWofSnDT+/RwKM4AvBbjUXSNKoXRuIo4/vikkh2xW1GCuN/gzZc
	 ygxeWRQQbqOI3xTVFDz93F2AIXtyPR/PPOEQHiihvdOKe/WmVr90/jrqcl55SGXt+dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qYxxEQoA;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2CA606A326
	for <linux-doc@vger.kernel.org>; Sat,  7 Nov 2026 05:39:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B2CA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qYxxEQoA
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b0d0b80fb9so815273a91.1
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 21:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794029974; x=1794634774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mf4ZlSzQK0A1YfaXfnQYSWywPw9KHcmgJ0Zlx/5jJks=;
        b=qYxxEQoAgeRTjMwaQDC2fAV485jTtyVXXUh6AN8P3ryYgsUwS7AzrM/L9YOTmUktBL
         GrmxIh+aph7bmf1AxySbrEQwF1kVvNaiFABat9MAI0HWL4TvDQAeVqzgzJuqtoEuw6eQ
         lXAm0ibaN7snVWedEdSBLO15ROieRTahbPsvyOWVseeXVlO35wemXKH3VSUJhQ0Lx4V7
         yrTBrej7U/w/9xOobPcuIsCY53gGXyWvz1TUQHwH3AJNJsnHoe5Esl5h88vkgrjdYMVK
         1usU1L8rLYsy61hnyX/H7fDmdOaYfPzLbXxMCOOAnoSzAfkb1XYCAlLKarUsU5kGF+KS
         +3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794029974; x=1794634774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mf4ZlSzQK0A1YfaXfnQYSWywPw9KHcmgJ0Zlx/5jJks=;
        b=INqE6loYlgdg0ifcTf5/nxgKQ58u6S/i+ZVSLsju8WoafmECZx0xeNqljnq2W192SO
         ThOJhPrMsxKIs7J8s6Yc1mjK79eOLFX4DaU7w6RSId/TSd3826/ZZi3xOGt0YpT4ILIB
         +PH+ePw6jCTLFTVZJIJUXubR/nvlH179amd98pjUIkqAvVW/3ihVOgdW85X7a3xUyPoe
         gwu8DbUMSTUtmzLyLx+7FvZVs4FiyIf/qxBgW0fEHlf3xHr+v5G094KhxlsdBuTDxZc6
         +SXJ501WrqMDk+4bVcTDvHoQ3VAf7UzIrciU9GgnkP6KU4m8n/TcWd+3xf3uoSszLwam
         91gQ==
X-Forwarded-Encrypted: i=1; AL+hErFe79h5Q9EogSEh55iiAkFEly2jO+YvthB6P+Dl5O4mOVpqQF6tYxAqp+7KtROSfdjiSUIlUCXVcYs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+otq7w8pQRnqdaDmWdxuX5kfUIEGDrGS/Exjohi656kNEWnDNH
	gcdf+hkImok/98szRo6daWVB38UAc+S6tMJa29Q8aYYwLGOBmEPFHJmR
X-Gm-Gg: AYBFou22PL20/JHaXiwhJ0qgKNs2K1cyQ1uJe3KiPeshyH+La0UwvRw7c4TTzRchOHy
	M0Vtrru0LHro2DewBvAbJxr8xYEX4Wbg+grpOaPlkqrq667jPXyCu3RL1DiwA+kg/kGbqx+dpC1
	cV9+PV1Qhq1u0wNWWtEZP4IgFxH0o3slHqpgy3zY/BOasOYxVyE8bDveDK8TFbkBI8dSy3Kzvrt
	TvNmdeiJv9VF2s6LMLw75FesDBpZKDyPaa74WFIk6kpyuJO5LUO0Ju2WsorqCuv4DeoatN/T1yA
	HExLD8dxcdudjwcdIfc6HIe/dqWtzI743IWH5M5YEThg0yRdRm0nQlxdr3t+O4ok0MeBkXjHAX0
	nYns7lmSpE0pop1dib89tTKLekJiAaJUK6r4qsG3TX6eybXRTr0OtfNLBnALo1OGH2rPvLvjgJ7
	7Dp/Kq9LwWkrUg6hqzGdyiPf8SQDTXxCTXhCxcMpUBwTof4tziW44cDOn7V4RxpH3SiDf2R3Vei
	dfQusntQasyOiUeErxX4UAyX1ZQq2SvXPr0c8dvUcLlT7HrcGBwYMwzSo3vca0WvSJAoIHmFkos
	1AWs27f97NaRtMpvWyjo2aqnCKpwvk1Y7uCSHpOgvahjwJw9hYTU8ARctEeoTL2yBncrgg==
X-Received: by 2002:a17:90b:3950:b0:3b0:92b2:2e74 with SMTP id 98e67ed59e1d1-3b0db6f6c35mr4733562a91.62.1794029973785;
        Fri, 06 Nov 2026 21:39:33 -0800 (PST)
Received: from lipengfei28-ThinkStation-P368.mioffice.cn ([2408:8607:1b00:8:a1a:7bc2:20ba:a479])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1057b17f8sm1838127a91.1.2026.11.06.21.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 21:39:33 -0800 (PST)
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
Subject: Re: [RFC PATCH v7 02/10] trace: use the stackmap from the ftrace stack recording path
Date: Sat,  7 Nov 2026 13:38:58 +0800
Message-Id: <20261107053858.3070072-1-lipengfei28@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103193421.63f4454a@gandalf.local.home>
References: <20260912083753.3426176-1-lipengfei28@xiaomi.com> <20260912083753.3426176-3-lipengfei28@xiaomi.com> <20261103193421.63f4454a@gandalf.local.home>
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

On Tue, 3 Nov 2026 19:34:21 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> FYI, the tracing subsystem requires starting subjects with capital letters:
> 
>   trace: Use the stackmap from the ftrace stack recording path

Will fix for all patches, and use the "tracing:" prefix that the rest of
kernel/trace uses.

> Also, did you use AI for this? Most of the comments are useless, and sound
> like they come from AI.

Yes. I used an AI assistant to help draft a substantial portion of the
code, nearly all of the comments and changelogs, and most of the test
programs. The design decisions are mine, and I checked the test results
and went through every version, but I should have trimmed the comments
myself before sending. Many of them were added in response to automated
review findings rather than to explain the code, and they stayed. I
should also have stated the AI use from the first version.

For v8 I am going through every comment in the series, removing the ones
that only restate the code or the review history, and keeping only what
the code cannot say. v8 carries Assisted-by tags, and the cover letter
says what the assistant was used for.

The rest of your comments on this patch will be in v8: a record_stackmap()
helper with a stub, the depth check before loading the map, a named enum,
the tracefs setup moved into a helper, a stub for
stackmap_mark_init_failed() so the #ifdef goes away, and the comments you
pointed out removed.

Thanks,
Pengfei Li

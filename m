Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794032950;
	b=v1dIrK3z7kfhVhWGRPoUrjLwahsWv4qBlQhegagK60PWmJlqYLm+VOWaK8EI+aQ8B89s
	 My537mZ2uEtZAnpIqTmgSEWlV0Eg1cPCfq7ahXnKxIGv/YePAmr24Kh1J114Jae/IfuNN
	 ad54PZ420l5PRN5WJAgOkFQ7h+s/yPZ7GA9khr/kLBOcJkcxU6oQyrCGVdPEbuHXHZHtP
	 mCGU210kV5/SbUF/4v8OYeDFJlRhXSRY6cgxpndRuFhhVJHKZsk6C/qt3yWyujPytNt4J
	 Jbxe1W5nXvjkupk2NckrOhrX+S3huPdN6QAAi+4j9trOIeFZYybe8TzjnWUfiSfc92A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794032950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=8O/YtBbFAPp5NwvDGteEcyHryQg3K8JIIIYVXGE7IUc=;
	b=hyrOnNYPx0dBGQC2jbEEhb4n28oMiEtB/ySjNmyH2fqmxc57cyaYA0fdjeN/DB4AfTIi
	 8rk+e4m08+dMEOdWxaJaZMfjfxrEaucGZaou26shC0TUXai4W4jgv6nKka8ROKYAyKtts
	 lzOlXozF4nDrZDBlNyeijRD+X2xEhsFZqxeHtszecBdFakqs86xpTb4QDEYVH4zOHX6LX
	 FN5PsgX08xwfEtKyVSR7Wxu3YJlYm8sTBobAWja+Fcmmy3lDqxgV7bVRIdjdC7v8UwiGs
	 6NQCmMFKGlSlMNGEArLihrVka9WLNmvNKV7ftPpZ3G9+Q0+0qxloy0Sx50PFCjDmZVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zYaIXDeD;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48829606A32D
	for <linux-doc@vger.kernel.org>; Sat,  7 Nov 2026 06:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48829606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zYaIXDeD
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e95bd1c14cso12278125ad.2
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 22:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794032949; x=1794637749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8O/YtBbFAPp5NwvDGteEcyHryQg3K8JIIIYVXGE7IUc=;
        b=zYaIXDeD/ZWt27eZTb/FXR1Ei54NEXBrfYk0lGFzIrK04hqXvJbt4RY/udaYZwsuRF
         pMyL/ZYTBPrqyXZl0w51+VFcTtZ7uZpQXL/b1ngiI/AoXN62k2G2D4uwv/4WozQ5OREN
         uMUaMC/JE6irPYbMNmnLX/LBYefPbWV9imrAw7tL2WDIdrjnQM/gQRovFQUfj3D5AWRT
         PrAPoKzlbCKwQtN7ic3//ml8lfhdnvvt5VJJr/aMLo2YwyuB/glDtPWfRS/irwaFqocl
         7K4+eq4WN+t8Ve16MInu8F8YDxxrJRXhmShoMOifWYu6yg8Lee/oeY94kvUKfax0iZh1
         hIGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794032949; x=1794637749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8O/YtBbFAPp5NwvDGteEcyHryQg3K8JIIIYVXGE7IUc=;
        b=MG1uiKtyV/2LIh9yMHpwzf7YdwSwKMEOzQ70/LiFoytwpBAlIedgMMswJylSb3wsoQ
         sE6k7VKjf4ATTHfWwbfEDWKoTwyZ06Ww+IQGsxRj0c9YhBGM8r13tkXdtc1BX7LfI77X
         8BPFyLA1cm6V62TZuXs1k25NYXYzXOrmljoY1P1rXhFJ2dai812WQRgm5sxm0uvkKMJ4
         JZfK/bP79Xhb4eT8h0wJqwX3UVtXhf6aFatzf/pE7bvgcI53sRVpJ/qvEtRXN078bxWb
         nXfUdUyS/nilSElQfCjl9VCQ1A4mhM2Mcf2rhx+DR3Y2UjcZyDK80LxQzhs+CC7KFM5K
         xGig==
X-Forwarded-Encrypted: i=1; AL+hErFy/wgegCn9CTLAfDMlCV4qSWUAP4GBY//ekx6jUHmJUxzlxqUR0c1J/46E7sd7mb8WIyom2bKI4to=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QHqBdFGYR6XMIEA2IWoXB/9vfiOf0SRIR1v7j8dmr87P9pUE0
	BG0+nvNkJvHVsRYM53UI07AM5Fla/hzKoIpda29ytvp2pZ0qI0g7AHsg
X-Gm-Gg: AYBFou0DjXovhOAAYsT71yXrK9luYGnmNOO00KO8/TKwU5ovv9RxU6UjLlZbs/19lDn
	f5Zf4wh61NWaFmj1n4hBT6gTZYdMMJcueVEDb9FOlBRksG1vpbD9DzfR0rOUO6OUCL4iKtDTuG2
	7ZgFXHVLxQPcRdlhfHDMJkoUkNnHmdUAo4fyVezzlt3TaSHabSXvjKZUZ/7C+K7ljUNC2jjIXZt
	hJVuu4RdJdhMQqYW/oop4pOGfS87GJOjtHsbaQrr46IBH0aTCnU8c/VsnseTJJepHvTOOmATwKH
	j3WuHE4pK+y4hgAdvULhfACX5Fa/85j7371Li/DAXh3rf7E/rxf/aGCspMRpWFD0LBTusW6b7Gj
	dsxqZhVxDoHiKP/PMDKnFTvRiDZo7+lFN7DNsf/pvQberJYNC5nwB/P5iGDEk2M4keBOJJRoqFS
	99QxpN14NniEGXnMZNXK6R92pr6tOAjAzbP2zHtEL5kfsoyaTN9P5Vd2SqbfjGnMgEcce4IiYyK
	vqDA8QjsYwLPHv7js1qFqzGVnFUM+UAVGPc60c+ouqGrDHyrC6/PyguCv3dD1YHnOBkd3rsgwFt
	EiWx52hPwXcIXS19ztUMjjQyDAL6uS2gT7S3GNQhuSK9F/2snkubLOxzaOfnHPCjmY6nwEY=
X-Received: by 2002:a17:90b:4a89:b0:3ab:27f0:c90b with SMTP id 98e67ed59e1d1-3b0db6fbf17mr4900373a91.53.1794032949623;
        Fri, 06 Nov 2026 22:29:09 -0800 (PST)
Received: from lipengfei28-ThinkStation-P368.mioffice.cn ([2408:8607:1b00:8:a1a:7bc2:20ba:a479])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b105854fa9sm2307453a91.15.2026.11.06.22.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 22:29:09 -0800 (PST)
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
Subject: Re: [PATCH v8 5/5] selftests/ftrace: Add a stackmap basic functionality test
Date: Sat,  7 Nov 2026 14:28:51 +0800
Message-Id: <20261107062851.3367923-1-lipengfei28@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <sashiko-outbox-202648@kernel.org>
References: <20261107055139.3138633-1-lipengfei28@xiaomi.com> <20261107055139.3138633-6-lipengfei28@xiaomi.com> <sashiko-outbox-202648@kernel.org>
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

On Sat, 07 Nov 2026 06:07:50 +0000, sashiko-bot@kernel.org wrote:

> Can clear_trace race with the resumed worker and leave the trace ring
> buffer empty when max_ref reaches 2?

Yes. Hits recorded between enable_tracing and clear_trace raise ref but
their cookies are cleared. The worker switches every 10 ms, so in
practice more events follow before tracing is disabled, but the test
should not depend on that. The next version clears the trace while the
worker is stopped and tracing is off, before resuming it on the last
iteration.

Thanks,
Pengfei Li

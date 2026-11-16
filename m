Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853271;
	b=nBnhvgObI1j3ZEcyFhq8IGYcwswtvErk6U+bG3LgCQYUSRmTKAZ2GtMhtrJrte8WzR61
	 kdNOlfsp0nrU8LN5e70DRzuCbU3aBkBh3agSBlsWKKXHA9K0Sxqf9ts4g8tzh2pflXdWs
	 YHN6jVbeboGU0hFqDodLROAcjZuUBXtHIKteROHsDhmp0pal0CuxkvFo+CyXL5XV6e4S9
	 H3ZioOpyHt6qDQfCl/jEam0rNUkCiwUJEwlMgPbmclyqKe/VZAQIiH24hT1HGOCx+41RH
	 ulW0/mPzC1Nrcbw/CW17zWlE0IEhjfpPMjyj4GC+2VLGh3gVS9p5nQlqbuxKTOcAA3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853271;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WPqbI4E7aPhF78xzJBa631u/COojzZ+RvMgbm6UKZ2I=;
	b=u6ITc30AjqVRKfu7aYllwWejBuq7XGmShNapSR+VRE+YBTqgcRouqKiIMM+P+NsTiY81
	 +UdhZkkcQHNgB3jaYvItq/YqznnEUWnKOEIQyH4rMUb2qMiGMC46sEw+YI9Nsah3ACQn4
	 WvEu9oihi8SRIjzodmJK+COhE25+HXzl8IPIim26zalOqnx8AbzHGCoospvI6yrPptK0+
	 iwORRsFF4rB6y5ezI4M/xkYanu+da4Nq9hKe2G8kZSRM1b4H1Q8P/1iyaPJf/X7atiUgq
	 dOSjbv3aag/mv5LdEEt0VsFcCMVoSO4uDy09ZnkoWW6SoGU/gdqJ0lkY9oq/2dp+vCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="PbHWy/OO";
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C86606A31C
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 18:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05C86606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PbHWy/OO
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e9995ce866so36703635ad.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 10:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794853270; x=1795458070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WPqbI4E7aPhF78xzJBa631u/COojzZ+RvMgbm6UKZ2I=;
        b=PbHWy/OO/p6lbs9pGg3i2CMxwEbrtuKliGLYdedBT6TXPPbt31Hgd/M6eFVsm2cldq
         h/4UZo4BITMQgH9DqV475AKu2iBD4n5ShUSaey4NSQy1MBq6O9ic96YTyTn1naEhZ3Q/
         CHS3RIQLxlzHcMGTdN5QRK1+ct/dvIuqAIJcQImStiZ2WNSLAF0ThwL7iCbiywDeptYg
         rDUzR60dRlDSBJk3QmV87gRKa//yp4ipS6/WIzFogO1wVoWwDpPqUvQlqhOEdP6tOI4J
         FVNihNhKN5WkszEhxRgVRTq3i/gIDCjWjzwu9ue0EyPPGAnGaxngVKAQa4xAAf0tkueb
         +GKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853270; x=1795458070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WPqbI4E7aPhF78xzJBa631u/COojzZ+RvMgbm6UKZ2I=;
        b=p+52cuQth8b0zwjjqNuqFhUUk4nH5VnVxBU72xpWM0F9h8JUQUeVAjuPKrqfuNBWwf
         Il5b8JkE/9LUewmVnCnwGjNmOkuItie+XxwmEtOcxrSOQ+rfzxoefdHg9CDrTN1WL7Pb
         V9uNhm7iePxEjxeQaJXicrhrsYxrbgYg80C2fPu3ocmeLiCuDOOaYdhpsu/osixtQIvG
         RuZZwSl44JlXSstLSGr6Gd3X3mun0D/aNlrE1AQMxG+nJ9gjkD0GP1+1lJ8OZT1D/f+f
         RLh0KeZTrSWEYrRvTmai3r64sRYhJZwcO+ceVLx4gMHRvhPFMlajmkWpj5g08/8rXGrc
         J0mA==
X-Forwarded-Encrypted: i=1; AL+hErGte1iI67WLJ8U0YB2F9LvlHu+csR31ODnBbSppoguFFN7FnCTYzkbHETuB+FebBV1KYy0ly1C74i8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zZxSi5Gf/Z29qaw7q5OUeOP4o3Y9bIEicHAg/krLkXr2VVuXP
	dGNOjOlPIWjy3fLECKVwKirM+XFPbdJrKgcigFS5UzVO2rCX+ErJ1kIF
X-Gm-Gg: AZFdTZfVnbKAMzZPDeZvAxcqbe/VBNL1lsuSWnTaAWj4zEFJKdkiS5CyERHfY7BDKfS
	B2HpYvKnVBMCs7169qu9Cb5irE84G+n6eFKem+p77ddHymCj0thQgpcFP3gEpoLgRWN7EMYNDwZ
	72I7FRMkErQFHzbsHSpe6agCbHL2xDBDTwM3dSsijtLet9t/vSJxhvbxh2vyNRMS4fhGJMFc0ZE
	7e1vYHC10joc3/qfDugbcCQtve8KGLMftKNshW0wo7fo2Hmn7wQyvvhjlUctK+yNSHoJ4yKfj/M
	02kP+gzC30tdegiKoLzPgDQUQpAj7S72ies6bXPgOz7T5Hkpn2Xysp6CBtWwQIeStEQMNJeEB0r
	SybMbuqQc3Il+B1Q49U9/NwuV/90INQv2K8sDkHKvaSDpsTsxP0LHQbGIuFGeWhdUeej27Ozgbi
	7Y6b3ZRxAtXr6v3yVKHQ6lUc7rejVJCrmrzQ24Zdicw5LcpI5reS65U4drf0loXg+6zYnmdqz3m
	ynFqrb0rFvAWf4GYJ8jxJFpzn3vH2DHKlJMetPqpCXPwwVYuDKuSFNJExkUdj+LHhDVhz9jvGN0
	tQM3uHyhgbpYvH9oVYDw0nXshChyYMCRvAAYpfIV/uiK2U5uncVTbOhQgJJjuf1S55evZHoAJRQ
	luzb1PWfrr5sLcZmbvy5pv1AD5XxKsLiS1SGHuV62lE///PZnJDqkfYc9+g==
X-Received: by 2002:a17:903:41c4:b0:2ed:cab:e977 with SMTP id d9443c01a7336-2ee0da966e7mr123690405ad.12.1794853270245;
        Mon, 16 Nov 2026 10:21:10 -0800 (PST)
Received: from localhost.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a161a3sm2885265ad.18.2026.11.16.10.21.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 10:21:09 -0800 (PST)
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
Subject: Re: [PATCH net-next 3/3] ptp: ocp: add WiWi Time Card production image support
Date: Mon, 16 Nov 2026 10:21:06 -0800
Message-ID: <20261116-wiwi-v3-87afa10a8-r3-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179456532138.2199510.9610534349392524646@kernel.org>
References: <20261111041904.48916-4-ahmadexp@gmail.com> <179456532138.2199510.9610534349392524646@kernel.org>
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

WiWi shares the peripheral layout, not the PCI transport, with the legacy
Celestica entry. Only the WiWi match uses these offsets, vector mapping
and gate.

I have not verified whether this FPGA replays a masked event. Instead, the
proposed change refuses requests to arm a timestamp, PPS or generator
until probe reads back the open gate. A request made too early gets
-EAGAIN and can be retried. Disable remains available for cleanup. There
is no speculative acknowledgement after opening the gate. The mock-MMIO
test covers early refusal and a successful retry; it is not an MSI-X
delivery test.

v3:
https://lore.kernel.org/r/20261116-wiwi-v3-87afa10a8-0-ahmadexp@gmail.com

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793252672;
	b=MoLKC0bivbQKv8u4bRxrEw+N//X1+AUeEyH35wdftPY0LHn+hug+OGb7tnWBQ9OCx9ht
	 IHsTikkVeLYEdYSQu5Ac2uLZnNw725AWoH10Jt5s8SyUsprER3085oVad0FG5C1P5WCup
	 HcZygXly1x1jozRss1+z5258OCLHDZ5ISItL29JVDJ3QhGFO2yyaCzfVefi76SvWDotTH
	 //JvXeilyB0B+oRJeVMSVwBT5Kv6smAzlTbdCCmAxY+LpwrsFfsyeZNezef7JMicMflfM
	 TAI65M/Atdjncvo7FBRfM+Wd5BNLjszFw+ToZn/MsAgm+GWr/F0tbrEhgwRl0Shi6CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1CqVlBSvwYPpTYL33mCW1+ANjaMpjIs5jzRD0wJXE90=;
	b=u3Q4hgVjt0Uk1aIlc9+kY5QG4lm/hZjagUmPfEp7UOzy6fbEWfegI3iovxt/221yQzud
	 u8g2PfxdjpJwHmarorvMoUeszTHjo9YB/ZIUyzD0AnrAS/LPFbHNDJStSsFItqGugMBOv
	 xHC3Ct9hxV8rDPf9VmNmkZwLZVXyphZ7iGukFSKc0OmEmNhSS5FhxJn7Jo1915pkkF+oH
	 Vj6+s/ykSuPfbuLn/QfHwhZCc2e9Vn5eTpbefLx+kujpxl8xV0LCIUOAdHpLklJDc9wT3
	 c3VI+MOnXacgplnFYfxOjA6RjBnh4AfLdXAW+GS56/ajRqCUnCW6ZOM9M5O0YHB3LsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h++Z4L5T;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DD3606A327
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 05:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87DD3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h++Z4L5T
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a070781f63so913485b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 22:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793252672; x=1793857472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1CqVlBSvwYPpTYL33mCW1+ANjaMpjIs5jzRD0wJXE90=;
        b=h++Z4L5TTcsGx7eTj1KcAyXeC3kBONYMwk6Szxknge1HwE4yiWmmcpT47uBUXVwDIr
         M2wmP3XnFHB8IpO4k0ql/PSfaxq7UkQlEsb9Hxw0ANBavFSdyYjHL6cDdlvc2HDssTCP
         hPPM4JcUpjsUMb1Wm2tXnbH0yeVmnxKnSpAu3p/EojrfEiXNPuMG4RCGhoQjxoRUCNLP
         Z29i/uJ/QXHfYizyvK6VvgricLlxGzuUwShIahB73XfnWjgSzaSK08kw9EE4nlJckbgA
         YUZ5CPMrl+MUUAcpJVbvqLwBD1DHKF5NVEtq9tE+TuvuBXfpSFfDMa7GVh5b+Xh/DJrt
         La1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793252672; x=1793857472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1CqVlBSvwYPpTYL33mCW1+ANjaMpjIs5jzRD0wJXE90=;
        b=wmve8On2ixHY0gffA0Xa87VLX3q84oUq9G6RsaYMtDVLT/gW26Jn9HDTgHq1kthInv
         bcAmfWuiGWQoMTfWTIXzYiReMueLIfxiyC9dNV0pDwn1b2KG128fUc1hDSe+yfIO3BMo
         zhRYzqLTjU7AoKzkJpItPLMGBMsMeDT5zWJ+ZD3HosdvESO4c2+j4v1hQcMwcEhHeGbb
         6EbCRSj8yg7UZt67nPbPubXjrCkmHAtbC7zPyHdfuU8Z/7aZsvFijGME+JCORe+VmMvI
         xTuEDWiCs0Vp++k08aA4SH13NtMHsSqMoIucFWaSMN4agwTKKSNtJa/0niadDyayiplK
         UpcA==
X-Forwarded-Encrypted: i=1; AKwUvByBpXnP/HxfWU3IKaoyj/GNdrf2dp/7WwpVwDX9IwVg42Ijuon3ut8M2dKS5ESfLrcOR/RMRrl/t8w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfJwPJR0SEkke4WUDxG2Jy69yFeZHt4yecXGQIED08lxdcqg40
	IEUac4yeD8n/4O6HtnmF44EdfYQ+Bw4/yyuuPcwzdxu0oEHe8Rc2JONF
X-Gm-Gg: AYBFou1SViB0C0PDgAgdn+GT2QYH8UyLdRw1xNy5tyVeUJxyrP0pNDkjyGgBhiXCZEB
	aCBT31jH+TP9bfZbRdEbS2GXWtWdChCmhnwUybiDtfdCpXOzVGIYCtn/FYhK1xI71o1zlxwG6qR
	SIuPS6Hv6xXyKSuVZZjpMb/yK6tGGL/OPtw2ugNZgldtsODczxMvRUzJHvyRrsFPaUKAL1myNrb
	TCrY40zCnaq+lZeUlguYE6lBzaYE/oZE/VOWgGQJwa8KeXBjP7bsF6ER4IrkqFKQ0y1MZB2oH2d
	cuSoBjqgT2fUK6TiiTR54qGsXSrxGXpu4oqnTtdH7pAwO6DG9dMnfv5sgzYIHqflWPFtWVGVAVo
	39w9x6Sto/gvgjTQXPnob/gHI3oEJgUO0eJ4XFYU62+y0x/VOGoIWjJSm78wcW1vka9l5jvTjET
	n+b7TXQbFtbpAnh4eVrH3eABL2n407Zx4J83KALvGSVqPiVVPZ0iAUJOFZ0FOOme9IBcl4CuVB5
	4fPTOwb0/LZxRU+bmcxqp69YQGVpetyiPA0gFq/W27KeBEdB9q0gRcyrVNn0datF3/UD+77ZPfh
	stPx28Fap44Gd1Kg2s83wy4sw4znBDIkCTdF+b5JRfu5HKEK1cAUaNn07lLWrZhaWw1W7EWeH1m
	vKmTW8S9ti5XC6RqxqVOiGUbBuB2Ms2gJy9nsHcWH36scxLY=
X-Received: by 2002:a17:90b:4c81:b0:3ac:9a03:20bb with SMTP id 98e67ed59e1d1-3ae57f9b35emr3665083a91.18.1793252671816;
        Wed, 28 Oct 2026 22:44:31 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e83127csm2433520a91.10.2026.10.28.22.44.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 22:44:31 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v8 08/14] ALSA: pcm: stop paused streams before synchronizing teardown
Date: Thu, 29 Oct 2026 14:43:48 +0900
Message-ID: <20261029054354.2931-9-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029054354.2931-1-mynameisjune111@gmail.com>
References: <20261029054354.2931-1-mynameisjune111@gmail.com>
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

A paused stream can retain outstanding driver requests. Moving it out of
PAUSED without the STOP trigger leaves device state paused, and skipping
stop_operating prevents the following sync_stop from cleaning it up.

Run the existing STOP and stop_operating path for PAUSED as well as
running streams. This replaces the earlier v7 proposal which only marked
stop_operating. Drivers now receive STOP when a paused stream is dropped
or stopped by an error. The change affects all PCM drivers.

Playback pause/drop/prepare/write and capture lifecycle tests exercise the
change. Physical drivers beyond virtio-snd still need review and testing.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1607,7 +1607,8 @@
 			   snd_pcm_state_t state)
 {
 	if (substream->runtime->trigger_master == substream &&
-	    snd_pcm_running(substream)) {
+	    (snd_pcm_running(substream) ||
+	     substream->runtime->state == SNDRV_PCM_STATE_PAUSED)) {
 		substream->ops->trigger(substream, SNDRV_PCM_TRIGGER_STOP);
 		substream->runtime->stop_operating = true;
 	}

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793845949;
	b=Htc/CwlGTjDuDj/s/rb5GvKYCqTFUfVCMHANYQjlVm7xn7jEuuqyY0xP1Xm9n+8HJdna
	 W8CGHsK3077VrMeNokB6Zds/oQk1qmHczUDovIrQEFGOqbqypC0qT02xUHXCEww+v+8K8
	 hqcJNSzTV4LUIAcSYeVl2uMBN778p60Hf5Ryin2HBg3kGzkQZymP12invtQ6lIzwgbkmm
	 PFB7sALPDF8/yAD+v0hZfAclN1WjaT7mOt8uTiwj2IrQHDTO9xhr4IP62dskSwixE7ao5
	 lIJKyuSk4lOEL4Uw0lYXP7aB0cVqC4coK+exTAkAtHaR4Ivto0drLNaw0JjReXxJFtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793845949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ND/K4UdIV95I9PJFcgncTwO/Ff+v0DFt7H1UGo6AynY=;
	b=U1+QLsd09+X7eOT4Ae5A/mLuQVLwU7evrY29wcMJY39el8+ZRszztF6C8QrUVExe2bS7
	 2sMvL7hjEgQCo1tccoa/1zdvpJuEI+ZgVKA+SwzauXrIn1VMPISYpMdP8dM09bLe3L6OQ
	 mnDgwuTciET/yXb30fEFhhq2RQF34aTFjUAwDYGhWWDK//rPlZgIQcXcVhCGc7zaFI9yV
	 xTttQ5d/OjvyQMhOzW8rmF4ZyJZowyWYnhI9bFbk80kek0Tex8BxN0xBVYudOgs71rkXj
	 jndE/w82BxAmQ0TxxCh3S5eTl9dk88Os/oiDk7LQxNBW7B8AyAhyCmSqNHoz+4dJufw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h4MG+WAU;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08ACE606EEB2
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 02:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08ACE606EEB2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h4MG+WAU
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ccca948203aso607749a12.3
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 18:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793845948; x=1794450748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ND/K4UdIV95I9PJFcgncTwO/Ff+v0DFt7H1UGo6AynY=;
        b=h4MG+WAUIg17ayp2jqseAit3lnCAASZn9oBrxo06jUVEVyzrP5pajRT4SgFbgwFahs
         lXUbg+ClgfxJ0b4rxjD4sgcXczw+CjE4jDyOfjurh+Acyeq2RVQHm5Kj+KElr+b2Gzd8
         b0C/+AmK7AxNxWEn8uwASsIY66kpWBlAdk/emVZ0sQOWPc/9lV8zw2wUPLWIqdMa/7MB
         hRDsX4seWw7aJb0TvSYSjJdCoj/hB0pQe1oW8sXseYkUWAhjyNu9iyf8IFa5EjylSNQR
         aJQ9BmlepHHi53X8jtJ1TCS+au64Ukr9u77j3ZpyAjRCPshnOwQ217OtHO4Mfz12zXRH
         wgew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793845948; x=1794450748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ND/K4UdIV95I9PJFcgncTwO/Ff+v0DFt7H1UGo6AynY=;
        b=MqnyKTE9fedfEDdtxMhNc0Ue4ZPtuuhyqJih83tHCBIGwXc6QFfdgQcuMUsHIIs1do
         OSLRaSEtxqr4DZPfbb5zTvMtCVgpA2oxIUTKQrl/WPUp0j/0j6heuZZJkJSIt8boyoBb
         1noJbBL/2Lk1P9x9uev1Zx5arEm8lQxOjRattjE9Urb9Fh/vRQbNCqVWbSqtJi32LHaj
         UOVrvbQ78XCq+r8Kb6in3IQexJOV4bDyM6AI+eD1ezUvS1VcXJRT7ziV4EGQAWzRqP+K
         Blcu9pU9uTVQPVIDHaQ8DIKpV8Os9Xw5LvEZt0wvO2LdVRfpV3qUCwc9woNegTRnQ8ca
         MnUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxCJ7e2jImFj8LcB44KlCbvc1z6R06f4V5xhCEuQsABOBaDlkbkXUrkaJ884ucJr39rEvmlDlu66NQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vgbft/J/gkie6Ens8dEIZZf0dFzutv3NIyOCeps4nWzqFq3Yf
	QbKwPNtw+zWAqgtLvm8IsnR/B/FoHXgrUGa2fNqbH9GW2M+qWs3AmWj3
X-Gm-Gg: AYBFou1NZBuAAxsiPN/Kh1BWQnIwMtDjfrFlhvwOfJ792UuOyozvizexISmJclVIMBJ
	DEcem6Oi2KyuBcfZ2qYbxCwkIquWW8JSoyPViRYSXpXQmujF9Lee+eURbbE31L5PHSih13UQ/lI
	m3Bc+gccdEw5a8WyC7CG/U4CIa29BCIUuCdsiy5wCJwcDQ8w9rBVM+z7Y7EMiJtACsBUgfwRnDN
	18asepx5Il7e0pCjFG7G2wzQz4h5WZYLpT680NLTOdUnutivG+93pNhhmiSxbkfp3PjJGsHMpFJ
	Sdvgybu0n9DkVTDjIHL2ZosQsYhdWgbc1sB6fy4pKs00GTHb5Cpa3QA+daH5TarkRsstXxsdHPL
	3rmFQ9bvVroqWj2VFlFoz5LlnqHLYuQXdkr80e3Bn0uHfB6R6MXakRQO+fC4B+j9ksxTG1nbWv2
	CTb1ubq7vgJD7y665TFnnsX0sHOSsfciRYr1ipnV66GbHlpIQpm5+seVPo+vU7yrh9ptw+nRqAM
	aP3wOb8ow8/fbc3KxZDCu4ozsQz+6D5sCnwaN3S4i418ull3I6l7bY/jE2NL9wrrP+2WQytZZtE
	g5pgvQ4iMM6iik+8bYHpUk+NC+rFtR0r0hjZK4oNN2+5cLE+2FD4RIK7D6Df0vQB+VTxTrKszUy
	KnNB3HrTH2AL8E2n33LpyP3bhS2QNQdzbyNFzMYismdJrlY4=
X-Received: by 2002:a17:90b:3148:b0:3a8:13d6:f740 with SMTP id 98e67ed59e1d1-3ae897364c0mr14242904a91.22.1793845948373;
        Wed, 04 Nov 2026 18:32:28 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323cd3csm1292775a91.3.2026.11.04.18.32.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 18:32:27 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
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
Subject: [PATCH v16 11/12] ALSA: virtio: prioritize staged capture period work
Date: Thu,  5 Nov 2026 11:31:39 +0900
Message-ID: <20261105023140.18373-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105023140.18373-1-mynameisjune111@gmail.com>
References: <20261105023140.18373-1-mynameisjune111@gmail.com>
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

Queue staged capture period notifications on system_highpri_wq through
the common scheduling helper. This allows capture notifications to make
progress when ordinary workqueue workers are delayed by CPU contention.
Playback and ordinary capture keep schedule_work().

This preserves the existing priority proposal without mixing RESET or
lifecycle changes into it. It provides no hard real-time deadline and
cannot prevent a userspace reader from overrunning its buffer.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm.h |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -169,6 +169,10 @@
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+	    vss->capture_staging)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 

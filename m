Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458168;
	b=eX+5d9gqgRg9eqX0iAiysd19pToeQXPaZqBhHz8hvAjUEz4XjAKzu9ZwpmFKj0ldAhw6
	 a3sBIMgq6wmr3bLOLABxXbnEo5EgNyB77XLsV0CaJzjjpZ7fTW09iuDyoMPfsRwyZ6Hfy
	 7e19tDiAKYHPeHtIC8+9+5FGkxPs+Bbt9cLQ72e5wi/d0edYdofgGB17FYwR5b9vyQO1V
	 LXvxEAxGurS10gn7g9W8MroueiW09QBA9dCA7bwm6zwHgNGoG8RchYuzKwEmhS3Epj8yL
	 UgqpMsX5Ie18xTPVWqT7SVv+C0GVl5Fb+nX+QPw33sYOf884Ll6GvNSJR1rBaok/Y2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458168;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
	b=jiLKHlbdty/cDRwW3UTezryjs2/rhJ+gcWRVkL53+SWNm/W0tJ6mXTN7gVhdZ+NPSMqJ
	 6bK3Utwe4rrt6ztviTASqg+OTuCPjopS582DJxwsREnZBxJxdcSo3Xv7NeJ4CxgYxfl3x
	 U1kbQT5KYnBrAy4+yI81Dv9+NOFEO7ehrTj7o+E5RVuN5HkKBzRjPoSfDKAlRGp+l42x+
	 ZUHMqMcdDLg537m1EiTI7xh+Kj+Nd36WMsUzfO317DM8Gy6JboTzJ8XrlNE1s39qFxVTa
	 sKV6iEzYU2SdD2QoLAMKmL5heAiuZHvLsUajElwG2v4JcRVe325tM/VHhmFjDURWNaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rj1OkUdt;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A868460A2608
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 04:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A868460A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rj1OkUdt
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so3055600a91.3
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 20:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458167; x=1795062967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
        b=Rj1OkUdtmbxGEVuEwq3gv1vxTpCakSmGThRFYjHRytKFYrE87uT05b5Ts+d5PMxEEE
         0NHFjqH681W2ACMe50OI6nvf0QDDgwVDeqFplhLZIFL1EldDU+TP9Sr9tdWPfu6G3Xj4
         a5pFxBIqg8jD+TRXi/Kil0qBj0BOQ1kU9JxjbYOuuDzoAY121UtZ7AsOKRMf/EzCzlo1
         UlEbZxJagD/5fxQ87QB1yFhk+GBi+JipQZ7QleLsf+WQcg2D0QGVnrdHKigu2ekxrOe6
         GDYcnlXJcyFw/9aB9/F4ZYNFkMApFNCJR2Loqb1grYZY+ids78ShmfH3CSdDhx9bn9e5
         A6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458167; x=1795062967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
        b=a431Hf/D6xnGanQA2LPk08uXyAZKStaaEz7+Qx1cswldgXvB/TtE+JiZwGpx1Yl/nG
         h7FK7h2wwAivlo4eS/SXUKim3vhetULJfVNcqk02YkHUEeMhVcVF65dkywGytBZSlMKV
         GZGyD90qQTw77NzqJbFD7+FrP960KRUeiQlX1Tq0JoFV4DoPF1mFYH5zDOHfB6o3VteB
         NnMs5WoEPY8zJ+jh+J4BYDVP6j4Go2ckxa/E3dUG/9rIxyJmXMU+dOrw/YYV7uIXwCuC
         xCZ9A9sQNW/pHjzwCmLZ8f8Kuon4KaGwXCwUZNJNpwFJrinaGHIe5hDylR/PzRJpIHlb
         Uu7g==
X-Forwarded-Encrypted: i=1; AL+hErEH9ClGDRll427H7BSGMZ5FBP/Z1NPYgXh4F39M3oWUMPEjwg/Sfs7waewAeYL2OOV4M4mUzz0UU5g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aR72eyMAixyPkCrexWqybj7tPDtq6dEDhwPcY7mKA0JUBoDl3
	0dMnEkD2Cxblo7LrlrNfqePRbznulSsgmMs7mFRNZp4HKn7q4jZGo6Ee
X-Gm-Gg: AYBFou0tdnzEowwtZbMl4p/K25gP1esGP+u3opx+jUy5RdUM7wP1Zvi79mmXT+BfQ9F
	1N3VyBHH/lfZtQZcQ1rnXqbv0kUzqmNRgrHkv7RC7C/Zk1DJI68D8i9hfG0EhXzTukUQFJgHdGN
	ZYSI30jWi/kRgOiE9EjpVISs4wlHgU6VF/RUDn2t+TYSJ0RGw6tdpWY0tHmXc3G9+7Yo3yDQNFv
	MbCEDNuH23cF5i8xmw+8ZFmP/NuLX8u42S8kFo0mgGpcTmEE/wq6J5LnxUYke4G/vogk1MsT9mk
	7r048dPkpBk6Wc1GwrFUfz82TNFZuEcasrXn2XYTLDJzSdhhi1as63qGbBA2vTrX//3/KahXcbO
	lsvrjoP2pEedUiZpDJgp/uFa+YnQCdNr+zM6D5qkDxH99zDH9atIbB5UHJEVbaofvL2hwUZ+LwL
	4+FucedTQiy1aavv2GPaVXWZrE/eDc9y8yliqOB//EARwOT1/0ruLJZaym/D6BZ7f2q+bcXvZwh
	Z4UutfNs5xEsrA2ztnJa3T8z6PeU0VR+ANOz7M/xSofA6tHS6ok4glz2boQ92DgBAe2qFEDwCGI
	olbzER9cfbW7ZAUCfixHuFBQI4TwHQmqvPUDTkbBaeKNz7fSXoAy3Yqt9iqgbI8G/RLLvJJjHdo
	U1omOhj/dSbtbuPeIU+6N7ZjeXydJy4AOZqaP3paB/vmLNBk=
X-Received: by 2002:a17:90b:3b8c:b0:3b0:9a0d:b825 with SMTP id 98e67ed59e1d1-3b182ee6991mr4517896a91.45.1794458167001;
        Wed, 11 Nov 2026 20:36:07 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c8b287sm2470466a91.15.2026.11.11.20.36.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 20:36:06 -0800 (PST)
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
Subject: [PATCH v28 13/17] ALSA: virtio: prioritize capture period work
Date: Thu, 12 Nov 2026 13:35:12 +0900
Message-ID: <20261112043516.37010-14-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112043516.37010-1-mynameisjune111@gmail.com>
References: <20261112043516.37010-1-mynameisjune111@gmail.com>
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

Use system_highpri_wq for capture progress notifications. Capture now
always uses request-owned storage. Playback keeps the ordinary
workqueue. This preserves the priority proposal separately from recovery
and accounting. It provides no hard real-time guarantee and cannot
prevent reader overruns.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm.h |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -173,6 +173,9 @@
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 

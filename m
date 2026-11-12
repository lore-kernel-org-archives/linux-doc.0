Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464742;
	b=SPNhtRewHhUkWYQD10JrQF0a+ZYz/0yKKpRZ0ETGGOxdn04VE2lNKq3/d4mE8Qh9d+uU
	 ji6lLAKGVzwmuhFeT5Raz7L1uCC1V/PllNC27OPuL72PiYOdv+xIHG1BlAlITDkzKH87Z
	 AIwXeyT8A9IJhlNOPtD1wtgoYvDmpncHfqSGFenoWYXxv7pmn9KbIOjfNQ6RoVGskB5pP
	 lYdhKYgXvN1/2TbZw3Yew9TRbJMfQqMtwWejrUeTHV6N2g8IoQxxW6TzUIl/77vk/fpBQ
	 EFv3p3Mrsvody1gS26XjxwMZ28+JBSVKQaPXkqWUbdf8CG7BaCR08pElKm/zIdDrFUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
	b=gMiZ1d3NHEpGpUnJ7hLjM074pnfeaKzWIGFAwzsLK+HNr3mc9safXPvf4AccaG4ErlNB
	 HjEi6RTrwASrtK7AkcbRvBNBkn28LBj4R7/vLtRqAjTdLl166XyuO4WumbxRbfU41vmVB
	 lzFMNw/Bir+eW0QLbZrfBDXbBs9M0nGsO1P5dymmS8wWoaCvCse4JuZpHcnz15lSg5ZSN
	 kYQA23RTBImNAzL43HzhWwCzmI0GnUtFN0IPA7IHMK2zgFHhWBTCjOZUjNBBkDzHKEFPC
	 tFDxXp0ZcozrmJLU30N5lGlpU0LZvSjVmEIs/zOTYeWHthVoF4RMvy5YMgWQbPcLiHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JTbBGbcJ;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC4360A3820
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 06:25:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBC4360A3820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JTbBGbcJ
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdb2dfcca94so1770461a12.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 22:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464741; x=1795069541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
        b=JTbBGbcJO/s+0la+hClvUtJHOkPAWnT7Rfbu8jLitnm8KlLxPiG/2QycBde2UwGlZz
         +qY52ev1PS8o7b5AViL4Lr1rIdWjWa6pvlHOP7Rw5/U3pDBWqQPSP6q1TItOc4ccLjX8
         8E64tW+JdSOytO/EXp9Iw/nKbDRfwDYTPvpCHD0bl6DKE/CHlqQtOOwPgxVz0DCQHLmB
         Pgubcjvcq49YPdlRc2lmvW5Iet+ShqflACQmU4FtOEuqnLsOnCIKy5e+O4sYtV+N5Een
         H9YV1fgDxqTgzmbMkCS5UqKwKGQMd0+61sbvqcvK8wPy8+ogZ2KhsNUT8klzYSc1Dd99
         E3kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464741; x=1795069541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
        b=c0L9ppdvCnw+7ixQ8fm93SDs+7m0ah8GLeNOEub8vjpFracMywq0UNhMO9hlP0SG4o
         n0xXd8+xs/o02ZvzsMOInQIYHj4mgLBzmGj4NKwDBb/2mD/cUB7J3GZ/nF4IwhYYk46f
         38vBXbKeXbycCzygxcRik5lEK2TR4WPpcVXdWaNqiFAdTqxESwBGm5ibMLxGaKvwqGJ2
         ze2Wma0ws0GgPsdnRqYe4bYyWIwypdCgiD4qkVYJSXJdfFzz1kuUFaDpOS0rGd35tEXR
         qaxRJyf4QVDHdLD61akMxKS3LqjPkWj3yMJaO3+4iUKRd8Q+Un91PhgUkKYen0pb0U+y
         Rf8g==
X-Forwarded-Encrypted: i=1; AL+hErHO8yzrI1bgu5m5JSfnLDg0fILlz1zWadqCIau+7erFSKV4NjV1EoRApeXOWcGsmZqvALLzGQ/PU4w=@vger.kernel.org
X-Gm-Message-State: APuU4Z91cJn/HwmyMLz4w5DfvOsOdvF78YV72j99cFXf9aEjayMed+IM
	5ZcWauOQPk7jQ6CU00gG6lsax/tGnkRxlUKSe0p5wd5bYDPUiHkWlqjm/wDGhw==
X-Gm-Gg: AYBFou2GKzCcVm1F1O3ff6AWwllmmkh97+Mtdx3MvAWL+SPc+4V2ewOu3g0oeSKXS4f
	lrDhhNhoT9XSwsjClxq97WCrb31S+RuaeJnspvm9esyw35ASNESGJgzJ59nzrvH1ATuS2A34w0O
	2MK7yE6zgFAsoB/X+nY1a16fzA+P2+cX30lh29q8RFe1gLltFLejTobedADDaifaC52BdKpxjVe
	Ni+vyq16NQuaOhcbYZv3YLng5tX9c3xdhO25b2urmqXj7IBH+NUDfz7RlB47Z8HdEBb+9UweldF
	Gyv5ATEKT5OJLUG2RFdK+W0Mlezxs1WUbzXOIwvBoHUlDk4ZMB2nKgbb6NdFLJcUZhIgC1nDf0v
	KD+D9+PfMt7yIxxcc9r04z3UjJ4ujdl1uX17Ztg4O5utdOV/WhajE85lOcHg/tYeZaJeAJynBHV
	OujI08ScT63WKQVnmlhHXX39iv8uYafQd3dCibxraEE2f+ZX9p+0j/E+rFQbZd4lOgz26hl9nII
	eHm+3C5huD0REm5xcHkO9fprOg0WPS1xtqSgfHoJcMd4ec9WQSjeXOwCa7f+WpXCU7yYXoGsABT
	ZRBus3Iqf4etB7CN8Q5w7qIayFKeGA+LiXAqmbpWXQEc0RDtA6UanqazTIOGUqwfUixO92B6gK3
	6WvPpFPQa1Isn3raAo/2dJA9GGGcg0rxHoJ2IyeUejoP8uNMxsR2mRxisnju24b8O3Dqc
X-Received: by 2002:a17:90b:224c:b0:3a2:b16d:928b with SMTP id 98e67ed59e1d1-3b182f86a71mr4580741a91.46.1794464741228;
        Wed, 11 Nov 2026 22:25:41 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6a3e61bsm26979965ad.11.2026.11.11.22.25.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:25:40 -0800 (PST)
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
Subject: [PATCH v30 13/17] ALSA: virtio: prioritize capture period work
Date: Thu, 12 Nov 2026 15:24:42 +0900
Message-ID: <20261112062446.159-14-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112062446.159-1-mynameisjune111@gmail.com>
References: <20261112062446.159-1-mynameisjune111@gmail.com>
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
 

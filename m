Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464753;
	b=0PxuRFdWB+H9Ao9ZMKXO3q+8z9P5z3TvPcDIfFyzR4tXOmKMkd9VSDqs6zaeDhdsB5Bj
	 u/L45hNFDgzn09DLayhJGSHsiAliSqdIGwJZnTJGhBHioai5JZrQkqhtMZfzzJNjDAS0D
	 g5ILx236sE5QSpJOCeZBchSswcCHu/HlvMCo5YG0k/JEDPf8NF9EPTr5yiLo/BOoaSEro
	 Zd/Q7mjKT+PdTX5YOufFLp8JXvj5yD39Qf2KC0R0pvx1MKu5UQrSzh0gwwZi5Eb9LquVg
	 n3WA81tYrwGx0dkQfvIhzd8MnW3fGEIMy5JTYbKchJRflalMZQ/6EE0Pg4dohNaiBAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
	b=p5SnWfpkmHfFwFzqRdlUm2h56SM68DwkI5ldpaNOoR4VMiRv4MODUvGktAwCX3dMuit7
	 7WAZxSLAOqMwqZDKBXjraGKpFkZ0pZDDXriX5HVUq5GKord7swmapCMXr2ktnnYngiwfv
	 oAO5HWuiMmoPqLGxpQw1mU7T9kkTaR6odV28k/sO0NqWfohgTtKvmfwYU6FJ46H4qsf96
	 fjMjPG5UwcgZrT7lkmr2wm1i9XNGrpp1dkzyPBlerNEb4Uw07WWwUunzViClbFKX7qxaF
	 8SjVaGfC9I2zclUjIT8QelsVjhaCZeSot/2lKkluHT1z2c4PO/bgA+mqB9M/u/Kz9XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AG4NX0ko;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDBF60A5BD4
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 06:25:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFDBF60A5BD4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AG4NX0ko
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso24734885ad.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 22:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464752; x=1795069552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
        b=AG4NX0kofxyTGWkr7ZMsHsHJMtcdFPkZT3aA4nGIL5e/N2nyEbZ6jN4euwhkSZs6fT
         yCbeX8SacyNQ9bFadQ9anb/qkHtHPdVD6GxC8TmPe+Y4S1RBP3oZIvwJ70dLYE+zJLru
         6SgykBvc9O/2rJsll2pFG8PTdplmiQsV0f23VBLOlXWLaih2FVqsZxHVzV+B4NPPWGAV
         DTYArBAGm1ismZfucfAJKs2+J0GJxkI85Ma3krHNELWR7ybpBJN3rSlzE4Y/vNxf/iCs
         VikcK6FD7SxFAyWMv/4Up2VfWjhUA87KWJULtPkKcLUqQzPwy0LBPNuVOzQ2WHebwVuj
         Yl1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464752; x=1795069552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
        b=wuGG1HWyBuhe6dJBzqPqVuFNwFyApFuX/JxbOLfkwpE3ZoKlt6t+wKFYJeJvESkggS
         qc5ufmUXCGhn/ICm0HEVvOVC57XIZrDa7jPU7Ar5zOQTobPHy0bayxBhlWzpmeuqziZL
         ChjwEe0PuYgoYzUjJdz1gXuerxg7MB8LjBwFrwkdnU6ItJv7674QFFI3EUYDZzwlMZhW
         yTsI2E0PCvtdb7C3IdkSmNJilMal7byekpZ17xXyV6BwXXA2XKNj4KllA8ICD1809NDc
         sYHvuJazUCjjzKwHtqqphffEvrDQhEWH3sAj/01bVc88tKPzDNCk7I9lvUaNKqeNY2UV
         jKWw==
X-Forwarded-Encrypted: i=1; AL+hErF48pdmr7qnG1+fnhT6/firRxp2iA3UyhAynWxvAJbFVwd0kYJIlXMSlJOoQhZefHLUqibPYCB6kVk=@vger.kernel.org
X-Gm-Message-State: APuU4Z97T69rb+TSpykn9KphlMUQJoQJez/GUvzqVqG59Xk6or71f4vx
	EFlYjZSGtYQe/UD3bcvrtrNZwZciJXvjj5exUpEtK0lbZxt+ZSgC0iCqWUaSfA==
X-Gm-Gg: AYBFou1JMhC2JUf17mix3hrGnAoXbS9cG8NtHLOi1/SQxi/wu2c57ZYHx1fhoxMjcrN
	BtL1PyrjGuK+QF6Wh48+Ilc8nbIHci6D8SRvw4Pm2+ZMH20wHq42EC3eINmvcOB/1r42aP0Echs
	mJi6fuacjFopaEreyuIs9vqJPOCnzBDvVDnAPsmAtTYRErz2yDqpOE0K/y167hbdGUR+gu0P5fv
	dTeRP1++ujtQ/zwXlRm5xtrCMWblhvwuHXACqHHYYFTx12f3LRI3mt1UCrNsEgjK9p2Rpr2LKo7
	RWrbyU7dBfibBLYUaiytcsDrGMPBMSLEtgiqGVPFPFm3q22cI9NiZFjH+/Aghg9Ir5zXoszuh4l
	orkW7u1syx3bYUnupJ/ZvL+GiaAUHRrRbTYR4gYwsmRr6egLnXXe426MjYWOU7vgaE6WF643EsJ
	1OjIe4QNkSwKuIUSGnsyDQp98hdmFBvvNI9ZBQlPqEZPppCDgY7H2K6k+GEi+KM1e09xoZ3tjeA
	g3U4cj5C6QPHpJSzNuC2tdhGHpinsXwReofVWBRAxPPf3/kW45BIzEyaNWTSKHAw/8W2/KfgvIx
	O3yGByGgmt5C0tgYpiOdKNDtBOMCRHw6WIgFmwaKT0oshPKEcWZkcA/j4BU08tBHuO/k5SeEocS
	w8oHVHIqBfYSQodz8J5lxELkzF+HzcwMqi/CkNnrRO1GiJf4=
X-Received: by 2002:a17:902:f546:b0:2e7:e73e:7091 with SMTP id d9443c01a7336-2edd7a20edemr51204535ad.31.1794464752290;
        Wed, 11 Nov 2026 22:25:52 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6a3e61bsm26979965ad.11.2026.11.11.22.25.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:25:51 -0800 (PST)
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
Subject: [PATCH v30 16/17] ALSA: pcm: add an explicit application pointer to indirect playback transfer
Date: Thu, 12 Nov 2026 15:24:45 +0900
Message-ID: <20261112062446.159-17-mynameisjune111@gmail.com>
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

The indirect playback transfer helper samples runtime->control->appl_ptr
internally. A driver that needs to refill already committed data from a
pointer callback cannot pass the application-pointer snapshot used for
ACK validation.

Add snd_pcm_indirect_playback_transfer_appl_ptr() so callers can supply
that snapshot. Keep snd_pcm_indirect_playback_transfer() as a wrapper
that samples the runtime pointer as before, preserving existing callers.

The explicit-pointer form lets virtio refill accepted data without
accepting new application progress while the ALSA buffer-access gate is
closed.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
include/sound/pcm-indirect.h |   24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/include/sound/pcm-indirect.h b/include/sound/pcm-indirect.h
--- a/include/sound/pcm-indirect.h
+++ b/include/sound/pcm-indirect.h
@@ -28,15 +28,17 @@
 					struct snd_pcm_indirect *rec, size_t bytes);
 
 /*
- * helper function for playback ack callback
+ * Playback transfer using a caller-supplied application pointer snapshot.
+ * Passing rec->appl_ptr refills previously accepted data without accepting
+ * additional application progress.
  */
 static inline int
-snd_pcm_indirect_playback_transfer(struct snd_pcm_substream *substream,
-				   struct snd_pcm_indirect *rec,
-				   snd_pcm_indirect_copy_t copy)
+snd_pcm_indirect_playback_transfer_appl_ptr(struct snd_pcm_substream *substream,
+					    struct snd_pcm_indirect *rec,
+					    snd_pcm_indirect_copy_t copy,
+					    snd_pcm_uframes_t appl_ptr)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	snd_pcm_uframes_t appl_ptr = runtime->control->appl_ptr;
 	snd_pcm_sframes_t diff = appl_ptr - rec->appl_ptr;
 	int qsize;
 
@@ -72,6 +74,18 @@
 		rec->sw_ready -= bytes;
 	}
 	return 0;
+}
+
+/* Preserve the application pointer sampling of the ordinary ACK helper. */
+static inline int
+snd_pcm_indirect_playback_transfer(struct snd_pcm_substream *substream,
+				   struct snd_pcm_indirect *rec,
+				   snd_pcm_indirect_copy_t copy)
+{
+	snd_pcm_uframes_t appl_ptr = substream->runtime->control->appl_ptr;
+
+	return snd_pcm_indirect_playback_transfer_appl_ptr(substream, rec, copy,
+							  appl_ptr);
 }
 
 /*

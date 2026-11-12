Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458178;
	b=vCcwRvyHabR7kKP92bbS9AVOZvZpOJsdl7ZPZtFdm5AwseOp1u0QKPvRlOqcaE62D4je
	 Mk6zUIKZ1vygjN0HqO/TR3IgG3Jb0bBrn2gRCOmy7lkcYXvngu9exw28EXzILucrN9i0U
	 LkAavaQvYDNSoeBoJ2AyLHl3+v12ZVcgO9Fw7gPj6xc4zgss/Q5AQwk8uqq5YwrXMXdjd
	 W7xZ5ANZMUz/N7j9IEdzElgQWInSBEfDshUWm6VYbyQ1E4HSd23aXnH42wtxqKHMUoQi8
	 r8khxRL7B/DcaTYGPJghxZXWKfZvTgqzsd2/gm1FR0eBoYwKs2FyFpz0zlCSrRsnu/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
	b=vkqa9FS5oPC71YqHTcaD6oaoMLqzp71V4uDdylXkHjJA42QSIBwvYCn2YVIriTQLd1mN
	 G+sp8GgPwOE26tKUhEvYMvz5EhrGvkVlKmkWoSbGaUIYLXA4e2XxusLeeEhiNd4TogN6i
	 zIBibRhocVgFZjlBYWUANyv6Ye07qETqrcqdO2hTfhC74GHa5Z3yeBAEMzxwcslVY4/Fe
	 9M2zW+qPodSiw3TsElMHBf4bIftN/hwZrRSz07DojWyUPYnzoTxCbeHVd6F+/K1UqoS/C
	 ZUx849itJRoA+KhEB0xh/pPGxUmCOiHkKJbORxVmt4zWec6/dGfNfVIkhT3p2owVCkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=crZtx5ZT;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6211060A6F6D
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 04:36:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6211060A6F6D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=crZtx5ZT
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cd8ba7c2694so1522671a12.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 20:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458178; x=1795062978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
        b=crZtx5ZTQgcPeDXZ+R8/o2W277g/LUCjuNTzoT5mRh3cLStZo1r5VA/Ba/69acTfxP
         gnEu7oIEDGLZUqVFHHXQu+ZRh/GFKFmy4B5qAP9eCDbmhbiPnOcF9rSTH9H0qx5s7oOb
         ObeXGweaHsD2oc29782z6CRxsnOR/7ltZwb5+ErkP5yHpCMxj9+YGNwWmJ3A/iwwXP/v
         0+CaJiXT1GTHK+VGq3Zz2iFugdGfVjm0od2Hvnd6vIDNcMn4p7/e9YVbHQJrsvzU5UVc
         dTnPqH+15U6uTn4zY2qdr8jdNB0VX5F94XTS+HQOCfi6sJnwoRZc+6Ljgsi8MDIJeiWJ
         tFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458178; x=1795062978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
        b=2cII9uzf4q+KslVVT9JyPAYpKMsGUSXaxeqaIy7WLq+lzjfb/1x3CNxIl1jLbs60qB
         6+Alg9qlO+8etbTuQ5oVUQn1Snaueyq1n6EYdm+yr33Op5yU+Owx/PPOHG1VZyNa5lUF
         2Tp7aEIQE3oZYViyMxLjtECIJQnSMe5K1ISORAHN+b2I2tZ0liDx/05rx2aX6meD1Y+V
         6ZiKWw3jyH3s57Ll2OysiQ5quu85lP6Wh2prv4YrwYUjrNWvgTKRrkCxCNPjfu5yJFid
         3QXq6NGblEPUhjKJU5IENU4yfL3YVnEhFAUrhMgQDY3XZ8sIRQQkJ73ch1IlxqAdqc4z
         MpOQ==
X-Forwarded-Encrypted: i=1; AL+hErF/Q/fv1b2TidQM/XAw9+bx0GAFTx0NOLpk2lVsvRerBNoLDSR6uM1J/0CB0awMNpd258VVTb3vlxc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sVtX8rB6AwBkdnKleR9CDfwyPOwC9wqgMrmSZlsFgCIA0fH4a
	+454evrtv80ULsr7/75BCzpMDn5QWa68cRG0dqVG6dkMYGSvvkzweXy0
X-Gm-Gg: AYBFou0894/HZI1nIjLJxXTO5JhJiF1R406fqMxMxql05CwzuQW9xkKYTh/5J6aMoDb
	kkZ2jYe8c0muIu0S4cjKr1NdIeaDWF41w7/t1SB3qaOwSys+gokDAu/v3sDt+4bV/V7YHXs4FYb
	f5E2mCiftfdijRG9cxwaN1jOIPSFNJ/1Rl+Qo5b7uAwquz9DOnqDZoXdofg+h7lxOkPbl9g0jEw
	C2stGOWyOsCVMPL9e1tXjJYFqyKzQ2YIonx61tPRh8lS+xQAoaDOc2ZQ/bo2W6OX1FEvT8rB0xY
	RxGj6DQU+oqCV2O0E6TpRZ20tqK13BOQh9jv2S8EcBLdZZL84f4pZK6AWpQtsO5Bfo0Gq9oTEXg
	U1WYvBVX8DqXOwkUlEQPEg91ltbZ45Uenf/nrbg4uwtyJoDvchMJnPo50p5WAUpgwMAT6hcfOu8
	vXLlUcnyXBNFwMdrx7A7PU2M0kVZCsTNMLCw0zUBOJbkuHtChasLxDMWYMyDzLvdNSeV0dxDC9G
	AjdC+xhinuWqA8jyyqvXV6bch4Nr14VlupO+T9Z4DMeWClhTy+UPSt/amhgK+XCDAieYQWOjiRw
	kTkLo8PGTVCEL9fI2y8uvkEpU7pjCrVt4GJqpTQYeQS35IwfhK6OEeFgZibDzfzRGOTlYf8aTI2
	eKEOTEx2HkwCOHVwtHkqxdILxLXTAVTx6IzWX7HBHoezi8rk=
X-Received: by 2002:a17:90b:4f81:b0:3b0:9e2c:9b5f with SMTP id 98e67ed59e1d1-3b182df3369mr4529123a91.2.1794458177488;
        Wed, 11 Nov 2026 20:36:17 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c8b287sm2470466a91.15.2026.11.11.20.36.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 20:36:17 -0800 (PST)
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
Subject: [PATCH v28 16/17] ALSA: pcm: add an explicit application pointer to indirect playback transfer
Date: Thu, 12 Nov 2026 13:35:15 +0900
Message-ID: <20261112043516.37010-17-mynameisjune111@gmail.com>
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

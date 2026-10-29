Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793252685;
	b=3nJHFEvem3fMNodxori6+Q2n5D8GZmb249/B8FquBEDUuxA5oN8bSlNzbvgCtu8D92vV
	 4XYMekC7tgubJCJXww0M1xuKNFypwIolG7IttYxlUDcPonJZEqpqtbLWIpo112Qk0cz7H
	 ZYaVEZBTqLNpU8rjRmEK6UCtWUVlriv/8UrrV8I0V1kYj2O2iYP12fnHe+9W7CQr/BtIT
	 IppI3wrCw/G7qMHXGxEUqDWyiqqOU8OaYVVW54EIh9z0M1dQ+JCYsoWdwaJgBaCXFtYIA
	 eY19z6NqcmaXENgr3ohHyYhd9c4TVo/OfdXCaLjtOrcIAnldgcF67DUTy0pIs2GA7Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Z/l4dD/5O5m6RU90kbEhUZI1etATEz4+8y2FIjERE5k=;
	b=DXzf3JHiF0dbwMc0hSbZTmJYHsL2IFFmMpn6sJHNqTs8/xbRax4puuhf17EPEw0g/0XS
	 on5vZcQK40l62ubr/3x7hNN/wYbArQARTThNl5re6YrahMGrPE0BL8qYdXJeA7m8t3bpU
	 G9aY6Tw6cJHesTdV7/KIerlI/BwAmWZO0flFWzyv8AnQR47zQZUoxIgu2cDJIjvYKrfcp
	 dMat68pHozis1Dos2mFLCsrM3YhfXpTcOIGJJUbTKCxgErg2uk+pewgE5dC1hn7uS4oy5
	 TBWku+WbvH1kXfcnjRxF+C4jEqxo4b/TbO+QZkaob5v9Eprvv1APIH6ZDA9jTCeW1ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m5LmMDWr;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD70606A32A
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 05:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AD70606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m5LmMDWr
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so193423a91.1
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 22:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793252680; x=1793857480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z/l4dD/5O5m6RU90kbEhUZI1etATEz4+8y2FIjERE5k=;
        b=m5LmMDWr+lmuQPV0kt4U9ZIwpIoJlXLOh5g8jZKrwbtU120DE8Aq/3Ly2bk9gwfCT8
         B3vtBQ/Jmi92vaT9EYbs6ZoifELrAilDDP97lLN7U6tcrg2hJOAfM4nI2B1cdRZP83Nu
         55jIgfFx4ajlbt2shZ9M4liRCVwwbVXzxvXJvxc+StesB3Mshg6g7LdvTy8vOkfRWQkW
         AbjNzMniweYZckUj1XChiphsWy+1zO6Wzhrr6nIRqGog0VeGlEuEOJqIgxGY/pN7LO8j
         AE21jMY79c7oLQ+fDHw4vBP8CXE/4HAkypSBWsRiAAm9SBMdJa31s5/wOemC6JUa0JnB
         Fygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793252680; x=1793857480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z/l4dD/5O5m6RU90kbEhUZI1etATEz4+8y2FIjERE5k=;
        b=TzsxIwt3moznSRzBV+KYQUwX6/LKgr7YfzFULJW5C0EIE0EmVGofuWR+Y7e+2ZxyRd
         /bgSzkYZaGsYxBuQWIKNMI7I09gN8vYGyaS4Ukon/htyLBngupugrPVnlK/qanDnsRjN
         n2UgO3CFbsHroDs7WuJ8fUASpCcFp0eowjdSk4jWF2HNiKWypyIqd0mtz41RtafyF0S+
         H4vdIyy80jHsba2nFuPw3bjMCrqQrAmpinrWoL0KbGfdYA2GQKbTTnHeVQNm/pPQ55eR
         OY40dXdef/+7evx5MsRj2ly9vjHi3AS53eG1omH17iBLfouL4kIU6nTFpr0wDDjEQfD7
         CcaQ==
X-Forwarded-Encrypted: i=1; AKwUvBz82DEvb/3Yecc85eO2ZrhSFXBOurwLGQe3NhtUzCtpDsW+9675kGcCoHsj0fXZln4eXaSaLdd3BJ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyOS7/+PV1Fy+u9XH1JdLefRHF7bAFvXifPbAqtzsC6gTf7gNr
	B7QO9VtZJDKhlciAVWjZ4HMYB2f3oyG/KtV9Moii+tOEHc87X15rsVFS
X-Gm-Gg: AYBFou1sWpLV4dxZltymIAlCf0mqnvHYxp04A2PePujFePQa+rczZDO7I4DuuKpWA8F
	9UAczEd/Ol+7fQyEguGC0bvBs4MEgqJZKTQbdAd9eVssrerswBjZzDkcnFTZpYrViTRpOvMNB79
	SmhAYlIvlhEKwvHfcypbTj9XKB7hcIrZ7tUT27dqfhbWflKNu8A1UO4gVMr3dKNZU8jxdQJaEee
	ni8A+JOZlAF2GSaOMvbwFXahDY3zXnnt/uUmUAs/GQOzeiNqIedU9TpUdCGzeLFfvtASm8+sCA+
	5vqtWf1N4BQrElEl/JryopVWbJFn6aq6jDwQjvVSHTYYD5T0urJmSbb6WkUuLc5AOBEFFete0QE
	igVcQszDf1js+YPsYY/eRhakFI8GAuVXXvFkDT77UP3UyRSohAh4lIxLcy0aJaW5WhLcLXcmlX3
	wLTgFeFXyo/BqskmbXdaaGLJ5niDcRr4DBPX2YZhnc9SQ2pjG0/nWD4zSS0KdY075KINWp70FBp
	Xvt8cD5c4xvzcF7reVfURLb6NTrSAvE6k9Qtf1JNFk4YoanwojWXm2nV8+7Ki/JHR1mzb3BhJlb
	/TQJzeyBjdnTriR4r4fR88NGiqzJHCB2ihQO0e0+VLWA86yRlgurMUt9cXkInnnQvfcARv6DqUf
	V5nZjRZlZ9ukN0iPQOLwFxF6vYrfZ6LR2Uj5mbzaLVXgXD98=
X-Received: by 2002:a17:90b:3d83:b0:3ae:3e9b:5265 with SMTP id 98e67ed59e1d1-3ae6ed4d633mr905165a91.26.1793252679788;
        Wed, 28 Oct 2026 22:44:39 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e83127csm2433520a91.10.2026.10.28.22.44.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 22:44:39 -0700 (PDT)
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
Subject: [PATCH v8 10/14] ALSA: virtio: prioritize staged capture period work
Date: Thu, 29 Oct 2026 14:43:50 +0900
Message-ID: <20261029054354.2931-11-mynameisjune111@gmail.com>
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
diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -146,10 +146,14 @@
 	runtime->stop_operating = true;
 }
 
-/* Use one notification helper for all producers. */
+/* Keep non-staged PCM notifications on schedule_work()'s normal queue. */
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+	    vss->capture_staging)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 

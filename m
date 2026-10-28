Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180522;
	b=dMElSvAapT384zhjHw7R3ETcFwx4h2nC9dd7Y8fafqEL0ExqOJQ6PUcJeXT4AYosaEDd
	 jX29T7TLWPrkFjD7+w2aMH+zlkXz9r9T2kMHQ/bR3PfRPK6mZyFg+WZq8DazucQCpRKqR
	 jes8ZpZ83s6wg4d9iC3JSSa5H3tiy69S/d7235yhL8GyQIl3DhmgFxCt2U8j+z13Wi1FZ
	 xWOMPGtmt+Nlp28XCOoqeGERXSNM6Wu5ovf/rSh8TMd+GQ5zQZyso3VxW+U6iGnSS0niD
	 bN8PQtgEtK/1EIylJpKTSm/7aa4wtvSoeObDoIKozPq6Bj0MnBoriPo62as9ja8KbAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=THGvSriruXU51ZqrJHmjnjtWkdka3P5vgj19t9/O78M=;
	b=bMQn/5hH94ts8/FSISgVmGn1s1U8kOg7GOTlrCftRTGWzhL0p/FCrSVMfO+RgazIcr0P
	 hhpktF90p8PWaylDVVHgL2lqOwBfZTAyzDJhPirHrzNJLjMj9CPtIhCZyZnO/v0dwZIr3
	 sPJ32PADYeIjZTn8F+0Znunc3rGYDygFhojouz3xzvD6z3Rhu1q/BYUrOLJMXEMztIKWz
	 rwJQPrwtinLlpm+8d4SSCUN6+x8U9k4nRuau/7d2r5zXKPZeZdkGHXAw3q9E7iLm468aj
	 pfd2XH4qkgX+3Cr6bPbGoVfVG5caJdGawI7ptbEcnDRNHfekwsXUdf6gzMHcGvDSVHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YOC1+36r;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE4A606A320
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 09:42:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DE4A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YOC1+36r
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ae0852df46so621693a91.0
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 02:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180522; x=1793785322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=THGvSriruXU51ZqrJHmjnjtWkdka3P5vgj19t9/O78M=;
        b=YOC1+36rLFXWQFrgkKLVR4jlr7TSIxKvYgHs5ks7+5SfPdxLWveh0kPrL70Y6G74uh
         tuCBHFUDBEhEcPY8MA4TVpDn48sFxRCwbTgiNEptJ+0xpqhmWIffllbO3BQXPT/kfjdV
         CzXbgEF1RK6AkVs99JZiyegORsNjCFTpR3qFUuFbDRg28Wic83Z/HHzzlbv9JcMlxM21
         QAvDVz8tllJO8soY5MfmtphfTmkuYO6FrZgyYAmfjldFw/nFVIp1prUNoKktPMXMzlBa
         3r8kolQwsKgabFFd7Q3cAhXGrxrCJrCMSHbpKVLfX7AgI+MlRDBYEeE4dDJvcs4tLweR
         5Ipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180522; x=1793785322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=THGvSriruXU51ZqrJHmjnjtWkdka3P5vgj19t9/O78M=;
        b=pmi0iZL4zmb85ClKkXGCQF8fl2CLXo6H27W9gu+1jGD8P2r5Eq1pgu22omEkjXktqD
         aSKw0HLD3eyWFW0kaclbu7+spKh/1WbyS7rF9e3BD5meovMkLbh+DfvxLJmkFts8HrUD
         J6ryd8NETnC542106DTGlPgh1xnhA77RMuECcSU82zCuzbG8lCtXkUpuJVRIXOPGHuO3
         QDdVjjFhV2uXc1Mq9D4CUg+vXRL9e8kR8ISC/TMgXeDWSb1fwXo7TMOxGEz5YrDkyHOa
         K7xqWUs+xPGZxlAQg8c9569841xmxsgMoZ4gCVxr9lAhH1Q2oNxAr/UJILxl0l+vDKmt
         w4hg==
X-Forwarded-Encrypted: i=1; AKwUvBzyBSONN0MPKXsL/H3AZvhuiHX6vVcfm+EhUWnRoF5+RSAj/16fEtGJ9ly0qgXfKVsNoDtWEaGIlQA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVdbK7csyKfztULcMZAlhbZAHqgSH+oYY2bb8sqpZ6YAb0uuKH
	JpWWj9w47kyI9l/sIO/mOtFd3ABFxeSLTGLd/KZWmbXZASeq1JF7mbRr
X-Gm-Gg: AYBFou0Y10/vTP5HLlsDM7cSbnC2b3w95TlT+cQ8uWPYfX2UaW81M/P0lIZ4L0RG569
	V4dka05M4wbXm59XwUCsqWXEyX5WVrWx7wEGT16vmde/UO9hK7Tsw+Wu4httIQWlnTe1HFFjElQ
	h8BUFLI28+U/7eAF//+ClYzPnZ7MabxfelGZOrZApBBaDdpuz/T5OIRvnFL+VarbzrVdGtruKdF
	Gy8JXgoJhIK+yEmsnpMfFA03Nvajalqxn+K0PYo+wc9I99EIgdtc4/+yi5XwnSrOhrY6cE/TrhP
	q6nlpXYOJIqSBLxxT+HtR3cqXeJ/WSzZzdUsEgJuA+qVSOY+p0gRB/w14BPLb7M+m5fnECgsQrW
	P/0DhZyBAMhpIlbf0/pLEvqo4KhmL7gVxkMCM2jyllA1yOkM8/qjp/K1SyKhg7tGjnyT0bVFyEu
	Xty9RwDI/vh0GhU3boXk1WO8YVdl/o846bdkCvyscqS59vm8mt5BIFC7wTBpEuaPlgBbhoAeMyK
	9lzGe299ys6OMEfluMv+2p8SOktzD3LqhdgokEret5viMivI2kXqKnjcHunn+nr25G1OsPqMZF1
	i0paVhPRue9xPjVCkW6Dh+svYW8RPvDP8mZvkopi4rq3rpoqOMuV3SyYzv61XhPqVjoRdvfcDFX
	RkkIaO1IaOS8pkOnS2AQ5JbbJIWwwdIXt5OcFHnPiH4eO1wo=
X-Received: by 2002:a17:90b:2587:b0:3a6:d850:bf16 with SMTP id 98e67ed59e1d1-3ae5c86a185mr502672a91.23.1793180521633;
        Wed, 28 Oct 2026 02:42:01 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a93b3f5sm2242377a91.5.2026.10.28.02.41.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 02:42:01 -0700 (PDT)
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
Subject: [PATCH v7 06/16] ALSA: virtio: wait through signals for PCM teardown
Date: Wed, 28 Oct 2026 18:41:22 +0900
Message-ID: <20261028094132.20364-7-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261028094132.20364-1-mynameisjune111@gmail.com>
References: <20261028094132.20364-1-mynameisjune111@gmail.com>
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

A signal can end the interruptible wait while a STOP or RELEASE request is
still pending. A later teardown may then submit another RELEASE before the
first request completes.

Keep both waits non-interruptible and use the existing message timeout.
Other control requests remain interruptible. Device reset still cancels the
pending request and wakes the waiter.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>
---
 sound/virtio/virtio_ctl_msg.c | 15 ++++++++++++++-
 sound/virtio/virtio_ctl_msg.h |  3 +++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/sound/virtio/virtio_ctl_msg.c b/sound/virtio/virtio_ctl_msg.c
index 2e0ff15e729d..e50e6c7f3b8d 100644
--- a/sound/virtio/virtio_ctl_msg.c
+++ b/sound/virtio/virtio_ctl_msg.c
@@ -314,7 +314,20 @@ int virtsnd_ctl_msg_send(struct virtio_snd *snd, struct virtio_snd_msg *msg,
 		 */
 		virtsnd_ctl_msg_unref(msg);
 	} else if (!nowait) {
-		rc = wait_for_completion_interruptible_timeout(&msg->notify, js);
+		/*
+		 * Teardown must observe completion even with a pending signal.
+		 * Otherwise a subsequent open can retry RELEASE while the device
+		 * is still processing the previous teardown request.
+		 */
+		switch (le32_to_cpu(request->code)) {
+		case VIRTIO_SND_R_PCM_STOP:
+		case VIRTIO_SND_R_PCM_RELEASE:
+			rc = wait_for_completion_timeout(&msg->notify, js);
+			break;
+		default:
+			rc = wait_for_completion_interruptible_timeout(&msg->notify, js);
+			break;
+		}
 		if (!rc) {
 			dev_err(&vdev->dev,
 				"control message (0x%08x) timeout\n",
diff --git a/sound/virtio/virtio_ctl_msg.h b/sound/virtio/virtio_ctl_msg.h
index f867b9b9233d..d84f0740fcb0 100644
--- a/sound/virtio/virtio_ctl_msg.h
+++ b/sound/virtio/virtio_ctl_msg.h
@@ -47,6 +47,9 @@ int virtsnd_ctl_msg_send(struct virtio_snd *snd, struct virtio_snd_msg *msg,
  * The msg_timeout_ms module parameter defines the message completion timeout.
  * If the message is not completed within this time, the function will return an
  * error.
+ * PCM STOP and RELEASE wait through pending signals within this timeout.
+ * Other requests remain interruptible. Device reset cancels and wakes either
+ * kind of waiter.
  *
  * Context: Any context that permits to sleep.
  * Return: 0 on success, -errno on failure.

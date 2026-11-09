Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794201417;
	b=IqSBvPz/6wzJOQs7dKUqA0eUkFMEmTF0BgBBMyhfaBD8qxPMLYN8bObfxQYY/eXTH+2G
	 G0VASiHXaQwlXsqM2B8M6s/VWu9VAVT+CdTBJReTtwudwTGCMFz7rEd548iEB3GS72M4R
	 Qqy/lwPIgaz5AGsEcsiroPctpyaHKEhF0a8BNnHYhoNU0pbZPdsg9TWrfAPT0+yK6I7Gk
	 X4ciOCsy9YgvC9V+S1cX6vbwNy/DdQMJoMplyZMFD1U6cplG1kpvha+8Nd32oKD871qzM
	 dkJ/vZLhORlfOo89PR/kJz6roDNcLco7+Vrl1W1yEcA+l5lzc2D6z/MpZi6j+XEVI7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201417;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wxebC5D/9DcGBbKajYZQRzTUBj4jQz6fe23p0qiGvhA=;
	b=UARrhdxlgLEwomtkcsS1DZ/+iPcatOdCgLtRifR1UE5GrMT2h0t6Du98IJ/YyXIW+zfn
	 BJHMwXBr0CHpxlyEoz0qtvThTgCf7FsEgegPbKbp66VpTHDSNqU+ivaiKzPXeUMlTLaEg
	 U/2dzkb0W5BB+VGiLHFapFtJgKeZ3oiyphgj07cJY54q0MK3miz7Bg7+HTaO7bsR7Jcfq
	 YJDSeRatGYpC6eO0lA0u/EEVgJ/cCYKnsBNf+PITc1pE2Q1Hh3+eB+zSwX4Xtah/HpaX2
	 /1tQvYrYWQrKmLoTHQT8fOI2DJcqIZOvN6MFwQuCcmRJd5fhlt6bnwkPdr0lPRMBngQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="QmlIWKE/";
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E60606A326
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 05:16:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14E60606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QmlIWKE/
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1ae18eb9b69so468240c88.0
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2026 21:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201416; x=1794806216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wxebC5D/9DcGBbKajYZQRzTUBj4jQz6fe23p0qiGvhA=;
        b=QmlIWKE/KiOoO4VxE6U+/XATGisTdRR/q/GHzwnMuIH5egNt5M4foLdye/4jF4e8+g
         6kB1p137nCTsnyMJSOmMO8j6YqqIGTYPBFnHhYR3q+ptLfG8yTU6xxD+Jh1gDR4Rfbqe
         pllqITACdCPYwLx4KpHUty/l4wjiWrB1i/csA+KyJDqz4NY16XtIRXMr/vb+EqEcxDzp
         O5PALlbRW7UJy6n8rKY9fIMNQ1lJ6eo7ogsDgCmt3QcdshZxa1wCvN1+YSsrmQQ9Hm6q
         FWwMwS0Ax/VPqTyCrpNBIv6ItkGwQxxB33H5N8IKOp26LxTddOwv8TsEQGou3vshrczE
         3+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201416; x=1794806216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wxebC5D/9DcGBbKajYZQRzTUBj4jQz6fe23p0qiGvhA=;
        b=n/1zJ6ZRwxf9mVjyud83URoFJ51fnBM53nCa2mNYPWgUbWqtRmBRNlhJXLA0LvZ1c8
         XgIM6bk5RjSs1MlfsZqJAtPNkSuCmPAanGdvKYKXNnVMxC3wFGOwlh53yOb2JLeLXhI2
         BA11vcNSLTCPsqgW6MlwtF4OBt1TVqagO3JWWJYk2qoPKfVa8NfkeILzazjuDFLE/cGd
         cRd8NS+k+VG870/NUrzrT7dw5ZcqbhUji8QHle9q9b6zg9HYxEH43dx/v7KbXQeBwY8S
         BPO6N3KeUZJeeCgePBNCoXGKIOD8rOvS/9U3xWUI45ZOsrd1v1kgqkya6nSZ6b0jaGF/
         YmQg==
X-Forwarded-Encrypted: i=1; AL+hErEMlSn8SU4u9MQppxP0yyelcjjxhmjXpH18ogArIgaxorJQutAUr+fYmCoudbQzPgKHic77Za3FoHo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JE8K+MC2mH+QMGYcKypj3sN71z1hwXIzpx4VqOhCYd2rJ21IR
	guoiw3xMH+s83+eISehw8vjKt0WYwEuy+Aiu3/8pQo1mcZtKgivVRZOU
X-Gm-Gg: AYBFou3jqmxbI2qJ9fFfgyD+AZcgDRuVGcbQXiP3cBdAqdPU/AGAGT4ygcYVYhfna5d
	4kq5P1XYcSA/tnsluH+3zBwqCEQkhPaLex9wK6mlcOsymuVJP2QXtJVZ2hjRgIAgize0P4XykTZ
	mxar6BB0AinK4Bi8uuHaPWsKEpG5KYD9KyvJ7+uJwOyL0hUQIi7fsbMIfkSTQNWZMujMshlUMth
	0DwILFl8Nx1CWVtvTdrRlRqwIobwVGlGN4/DQ1GkqPeINGePzpRQPFwgIBkXacT2s41kxC4pQNo
	NskhGnM42wTTIpQOKZdoPUTVs6XxDUsWo67affwFf13oKKmzTFmS6UdHDC9XcNZh+pNQrg7BAt/
	BjPFjlxqV/+qtMDsgs0aoTZm7+Qg7pG6ODex9G9OWtbJ35BOD/eruckfACGZaqsgYTfMObTX4/r
	l7oqtJTMK8nD69CKWHJdM6T5rH6VpoixfJEkA4vOmnWVN1WjQs/PINqfJw1rQvJMXIY9B+16W0L
	BRLz62UNMdaaNHYye/9b4/P9MF5elgvV/jZPp6XSh9MsRFpYL9OxOc0c6FCowE4HKCW+pAzvBUI
	5u1zvGSXFSjkKbYZzk3K4VC5GQXQ5Es/EjV/BKApTE/uhevqKPNCZHd/U+QueJWqN4wjSjXd3or
	BN9WcLRock+g99NCcDKBzGFou7ZhwZczu12pk2//x8VU1JarkfOkc0cgHes+2i1wz0Vvv
X-Received: by 2002:a05:7022:ec17:b0:19a:ace1:793b with SMTP id a92af1059eb24-1b39fed0700mr6138711c88.18.1794201416127;
        Sun, 08 Nov 2026 21:16:56 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37314826asm11395635c88.3.2026.11.08.21.16.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 21:16:55 -0800 (PST)
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
Subject: [PATCH v22 10/13] ALSA: virtio: wait through signals for PCM teardown
Date: Mon,  9 Nov 2026 14:16:15 +0900
Message-ID: <20261109051618.22506-11-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109051618.22506-1-mynameisjune111@gmail.com>
References: <20261108235457.12688-1-mynameisjune111@gmail.com>
 <20261109051618.22506-1-mynameisjune111@gmail.com>
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

A signal can end the interruptible wait while a STOP or RELEASE request
is still pending. A later teardown may then submit another RELEASE
before the first request completes.

Keep both waits non-interruptible and use the existing message timeout.
Other control requests remain interruptible. Device reset still cancels
the pending request and wakes the waiter.

Keep timeout and wait results in the types returned by the kernel wait
APIs.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_ctl_msg.c |   19 ++++++++++++++++---
 sound/virtio/virtio_ctl_msg.h |    3 +++
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/sound/virtio/virtio_ctl_msg.c b/sound/virtio/virtio_ctl_msg.c
--- a/sound/virtio/virtio_ctl_msg.c
+++ b/sound/virtio/virtio_ctl_msg.c
@@ -265,7 +265,7 @@
 {
 	struct virtio_device *vdev = snd->vdev;
 	struct virtio_snd_queue *queue = virtsnd_control_queue(snd);
-	unsigned int js = msecs_to_jiffies(virtsnd_msg_timeout_ms);
+	unsigned long js = msecs_to_jiffies(virtsnd_msg_timeout_ms);
 	struct virtio_snd_hdr *request = virtsnd_ctl_msg_request(msg);
 	struct virtio_snd_hdr *response = virtsnd_ctl_msg_response(msg);
 	unsigned int nouts = 0;
@@ -273,7 +273,7 @@
 	struct scatterlist *psgs[4];
 	bool notify = false;
 	unsigned long flags;
-	int rc;
+	long rc;
 
 	virtsnd_ctl_msg_ref(msg);
 	/* This reference stays with the queue until completion or teardown. */
@@ -314,7 +314,20 @@
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
--- a/sound/virtio/virtio_ctl_msg.h
+++ b/sound/virtio/virtio_ctl_msg.h
@@ -47,6 +47,9 @@
  * The msg_timeout_ms module parameter defines the message completion timeout.
  * If the message is not completed within this time, the function will return an
  * error.
+ * PCM STOP and RELEASE wait through pending signals within this timeout.
+ * Other requests remain interruptible. Device reset cancels and wakes either
+ * kind of waiter.
  *
  * Context: Any context that permits to sleep.
  * Return: 0 on success, -errno on failure.

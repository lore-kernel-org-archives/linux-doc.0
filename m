Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793412560;
	b=Jw2uXqLM84hrfXkbr733ahQoiiJtkRFXieUpBS7YMCXS+49aiuVI87JBPTopZaJCFvTp
	 xLR1K8CneVES59uJ3VSgMwkWMJJo8VnAQfndw/QoDKf/dQ5iJxyRE9JOWQ06qEnvF/3gw
	 aAMkCTGI8y0rkM9SAABRXjPBHC7aFtandgEdeU33mI5emXI9scr+vwyrlmXckq1hpwt1h
	 mYEXsjlhGluIXmTsCGfSpQRqXbJHhdKM4MCQVqbpS5UnuvUHhMJMUzIJlmC/eS9+pDwtf
	 aBxllwg/EUR1KcPQoTwtZ74t4STb6W9oM7p1L38poL0afg4hoCvQGjRQ1DyqoA9MRTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793412560;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xyRi7XDKpXV1gU6ovNhxbTiviMkA7YCbmNrm8NAAe74=;
	b=CJtcLfJE87y4UctwBs33OaB58dJnXJ0PJFNUO+aJPY7ZUR+nw7DirEh0KvjZxUSBJ5vl
	 TAk0jGAX5exmYsH22jlyyOl5oJaHZguH/oZmTaIA3QGhR6JP92rYGpkXYiwAIzl/Oo3U9
	 ScWL/yQRjXVhuNhw9mFCZo5TfpR6vZ2u4NR8+/YIpD/YyouKyNUacRU1AyXS4NnLRjjdm
	 hp3LtylyxRiVtGJWEI6PP4mTk0MEKyB3cnRvNPL9iys8Oc55E/G2swkcDSvE+OKStjI12
	 fhVUZnQ4KCiUXRp2v1dtcIJNbQNBy0RnrFsM505zESIeKAw1gPb+XuMCunNvCM3x6xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dmTwQp7a;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D95606A334
	for <linux-doc@vger.kernel.org>; Sat, 31 Oct 2026 02:09:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7D95606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dmTwQp7a
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3550c917fd3so1778107eec.0
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 19:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793412559; x=1794017359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xyRi7XDKpXV1gU6ovNhxbTiviMkA7YCbmNrm8NAAe74=;
        b=dmTwQp7aiqyVd7bNSgrF+/uwK+P1zjMYPazTAa4kJCYS3k4gI/gRFwHSuLk8hCcNcD
         wSu70bJS0p2rRCcduRnTdrF4tp2QdiPhDny/RDfjIQ9x7ZP6BJ3SEGV5qqxttLKAuquH
         GQU4Wr3+DAQPNJmkxRkp/+AFenfMsAI8A4ZNxC98oda2XCQHfjtMO9QPVmFkFFA8xJCg
         Xgwjr3JnPms38N58bzty9R/uLeZsz1S5dCwEHbS+n+sJbkKNO0d0gBcqdo7Y+5T/ZSuF
         VI7AKHdwKIqovLGZMZIncKxrypk1Vy+8yA6bCcX1oQky3/0kVGMXLDfRQElFYXwBoA9D
         9u5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793412559; x=1794017359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xyRi7XDKpXV1gU6ovNhxbTiviMkA7YCbmNrm8NAAe74=;
        b=AsBQRTg1BHVCKpKAG5IQQwUl321Py6TdnN8zkejARQW8hnEd2KWWJgR6bJrvILQWVd
         FQ6Tq3XyB/bkHiKLsIRpBV7qNyyc9c5NzoCKUdVrRBk/3OLtnRPoCufnDlQ3F1iae6mG
         G3wtjiGSevniWMGxVr5rXBGuCSxdZCD3jFJ6IiCCbiHM0P+QRuM4F369wk32lh9EJuLI
         jFaKSBoV+nlGu+NJJ/x2dx3/Q+8RjPQhV93L59uJnIS5b514NCJcGKYmylApe5Zt5ECz
         5yTfVMbqGm/HdoRQDi5apfA5N4Jyg5bi0B1VcPkA9QYqaI/7Abgo3U2/hWMHv5RsODUa
         DRCA==
X-Forwarded-Encrypted: i=1; AKwUvBwmJxE36dsEMc/e9HN28G4ZHse8J30IzZxhBwy7REdMl+TFmqgs07agDh35aMMgeKszTU+iYx9jgfA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXO/s8yqxG3VV32N9Oif4FrsvM+RgzT2EZcwiY5Idr+w4acyuM
	itPzrXySkz+fn4bvlT2fs0HC7RGB0tF0sySOUhUH5jqFF9rQobANBiB/
X-Gm-Gg: AYBFou0jrHbCSVxwbb/ObN9r7Ontt0SSWqUbJIz8zXmB6+CsF/37R48HzwOfJpRmX05
	7wWXuS6ssY5ib7fDO0CIfVAZmOjlRNPpCJBMx35cvpwjGLDVnDHcgTvoN8ma5o/8xmbFrDJ0qwZ
	25nQ8x1B4Fqutui/Eav8szwXScTkBDPSqNpfEmjcFRNpUnHzzHWAQLCU9ZjNqhZH162Zi+JqRAZ
	N3rE6Ufl2l637EtVCbSnPiTjt3ovtvKujZR+HyLGifNMYLqOjgncHs8nAY6STUdXqN4rRKBg4Za
	Vyu5BZvH5JA+WbwHGon4psVdfojnHcbSsDyWMlYNuhscOVEzvthrLLQOTa0HWONOTzq+gT/PYki
	QFWMObSOcJ2i3M5Jjcj34ccGOeGFIromE+B4gOqMZksh3j2VAoyDaEYJ1vwtZe/T4m/9xN60I6o
	DkjOtsyZP0RkZDRmqVgRItwojGQtU1rR82iBXs1EjQa0RBtk8ubzjVUajOmdemQf5oLW6ZMAzC7
	hKgpaiMvLr/xl42egt96/zS2rRvuYijfzQNDrRbFxRd+8ZWX/zmmyyCWJ1cbGUxTPohCxB5JgKD
	D3aMuSHSwRUSxskdXgXqvra6RjdTvwUdwfoEYhVsvE5Ys2tO72mz0CAvZWyKpHRRWYj10l2d6YP
	EKg16cEwlIkABT+LuYhsX9PLt5hMRM7ZfkLO5fiRwUnbkDg==
X-Received: by 2002:a05:7300:6d22:b0:36a:13e1:c889 with SMTP id 5a478bee46e88-36a425e10f8mr8691655eec.36.1793412558707;
        Fri, 30 Oct 2026 19:09:18 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm13214096eec.26.2026.10.30.19.09.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 Oct 2026 19:09:18 -0700 (PDT)
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
Subject: [PATCH v11 06/14] ALSA: virtio: wait through signals for PCM teardown
Date: Sat, 31 Oct 2026 11:08:47 +0900
Message-ID: <20261031020855.2402-7-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261031020855.2402-1-mynameisjune111@gmail.com>
References: <20261031020855.2402-1-mynameisjune111@gmail.com>
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
diff --git a/sound/virtio/virtio_ctl_msg.c b/sound/virtio/virtio_ctl_msg.c
--- a/sound/virtio/virtio_ctl_msg.c
+++ b/sound/virtio/virtio_ctl_msg.c
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

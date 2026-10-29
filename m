Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793252665;
	b=Sm1OU7AMJDUbx0exwWsDc/KZQh8xI2XLz8UhqrnP+4yKkAY3V6M+KO/DNtDO58lgWi8B
	 JTBM3WPSexlOxL7o3dQhOrf4gHkqRec52OYVFA232pOviSphp4BkmQPa4yuq+FP7tLzfI
	 cZ5jRXAbq1nsKQ3fLxpjFmxe0rwT3ejmIJY7CsBKD/33qQW7aw57+8VOV4MYPhrVgJ5OU
	 UoUSWoCpksR4nDiktOE2qoR6OVk8TDXhZ4mIq1McWm/+CyCqa7XLtqXmG9/2Eo4aaVXKM
	 XGVhvAeSdgjzdkiZUHDpEFABB7nRK7Z2Dpmhe2KZHCYXkMltrLnveAN8296JnSWZhcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=F5Cda1iTEohKGqJz5gtxJbapFh8jTgiZxocpRrDCK1w=;
	b=GjR6vncLPYYfpbBGodO2PgCpyc68g/7bGPedM1kFOV8TQHeBIrDGRsfD7jP/yEKFR6Tf
	 j7BOtvrvxuetq+Wpza3H2PJKQltdF65hkYFdRmhQiAQE/AtoDeXEtLzgisgl8wvMid3f7
	 pxxikWMF3t51BNsDLjLxXqhF7+gczRarrvnrJs7hapicDd5XUtwHesoRjoEobhxuie+NV
	 cS+PleOWl4+7+ea6uK2vD3yBQSn5rNmhgkFxHroUOZVG4SYFg0ReWnqOFaw1hwVpRZD1T
	 5aTnN2Y/cMWGk7ttQa2DtQnbOqBMx5c4TBZI6dfKIhbzktrvTgJUYYAcXyE4fRpoVDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h+uDPZoN;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C845606A325
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 05:44:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C845606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h+uDPZoN
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ccce6d9abfeso1272559a12.1
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 22:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793252664; x=1793857464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F5Cda1iTEohKGqJz5gtxJbapFh8jTgiZxocpRrDCK1w=;
        b=h+uDPZoNulg1nGEEyP6wT/3jB+xLA453W61UTEusvi6ID01P4Y+OqREwSAQtuOiSGK
         FOLZPTqtwD4GcVLIJgRmWUcHYVmRbvqy/HUSBK3CJ1FkVq1IThSmsG5efZtXrTjZA346
         FvkEOdsKwYHKP9w+TKHb9ZWvWcngFmcC5boy5J2ftExRuF/7cO8mECbnUbWly0oYDusS
         2r6EAKVIOTLHSszgosQYSuAaFJJzkighPfmnLUG8UfeOWhF0txOLcDzrJ3l/GF0iZSrQ
         ek5xWSiPKT15ZDmVxWzFw1gSAmXImNU370CqpJRhcLlHBNyfW9BOMbX1OMm4/oX4BvIB
         byMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793252664; x=1793857464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F5Cda1iTEohKGqJz5gtxJbapFh8jTgiZxocpRrDCK1w=;
        b=xTi37NsNMlu0F2wmIEnKJDSbh6/dlIiPt7byPZhe9SVC7CJ7tPrczNWq/w+Rd/fL/u
         Zba3GBIjxjs6m8703wpGfGOsCbdO8gaqQghPeOBffFbX+0Qwt6P1/9Pdnt6LPGG4HK02
         fWXVgml3JXFlI6fENk5aKctkza9xvIAYbj6ppO1CwQuuDpmwRfQTs9tQX4E7ulug5yYj
         gazmc4VEA7wfy8H33+95MFagI/ngU0XffwSXno5cf7BlDpVr1buEzv1wMq86iMdOP+15
         v0sP6q7dOyLy6qB+2u2GM9BsFaETXNIRhypNaMnPUg+A440NkiOlWFClpjuaK6fy4Qkg
         HMQA==
X-Forwarded-Encrypted: i=1; AKwUvBznnhPAPZNEOl7wgPCy+29jpB1LCmgoKjEHSHB3twK5Ms/lnKuCzlkrzQ0vtOO2H3MIh+w3oSQ97fg=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5UZnzf4lyf3MoaFLVVO1FZuvBcx8He3qbVdK9sAcezBNjX9Md
	NvdNMxavW88AGwyb+wQGvDusoWozz9qxgPatG3EQSngd7xdjAClE9fWC
X-Gm-Gg: AYBFou1Zm6PWdkj56K0q4LZqILk2YUViSrPmNErl2B8PkkXAFZAfdpxNFLuef+NymXa
	ZsxuOQHfHuV2BejRJ/JvlAQ0yKkCzlLbwNUgMgu9IsfXrp4+x2hgzzMbMNbHnd8JbJGgXBmbPWj
	EibCu7ETaFTHgPDn8WyWps3XFz6XouvRi6mItBeXlqAr/IrPpjAgy95BQj1E7Y64xBmAJGlfFbh
	4EUU5FLye3JE0fCmQQ/vd/j1c22tUTO4c1vRj+z8uS6f2OyXe0d55Zbh4mXN4xreZ8dDgktJcOD
	rc0A7/H+CnP1wiAKDX5bZXmAq/F5CtwyBArdylo2IIW8VNXZ4oQBXZtzefsdgRC44aZiOx0qIlR
	WIvmDmISx5dzu/fJYPB7sfbaiAOT6Ea8NaaKT1/t8nfKPbfVjV1SNKVe194Kiw/hDIbOAye0/Jt
	cA5JoqpcpQOcLaBqHqqp0C52U8pDnYsXQCX70g91uKXR6I5Yn7Gvn3nn08Y0uUlee9QgALzZF8q
	PiTgWe5lsQr8hL92NV8dowrHtWk5He2LVoH3C4FtO+bBM4uWVunb0KUQMMTi4vdy9G2kePLQibG
	L6jwIFs6GQXFRFf9a1pfo5FE/DPDilzexxNylqo8cDP7UeNS9Y1EFE/GDCWWnlXgvORop1UQDJY
	jhrFzFe9YM5qLZHTMJ0Wl91QyVXdFQltQHnre/N9+uV6dWUo=
X-Received: by 2002:a17:90b:2745:b0:3ae:5525:dc25 with SMTP id 98e67ed59e1d1-3ae5830a184mr3504844a91.51.1793252664007;
        Wed, 28 Oct 2026 22:44:24 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e83127csm2433520a91.10.2026.10.28.22.44.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 22:44:23 -0700 (PDT)
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
Subject: [PATCH v8 06/14] ALSA: virtio: wait through signals for PCM teardown
Date: Thu, 29 Oct 2026 14:43:46 +0900
Message-ID: <20261029054354.2931-7-mynameisjune111@gmail.com>
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


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793338016;
	b=q/7KQpCiZ4V0jbvnhnni9C1P7Qtxp2boI9kv5Tg3YFepkwMlwqNOFjyDV1VzezbcXIFj
	 HXAGFMgyVKPVj2r+Pcybx/j/s3r3OaxOQaq+0Lu8OehjBYp/J79oG8Lmz2MudPf3bazgK
	 gJC3Mg+GK/J+3sqRD1nlYY9F22ByOagjNpCE94NBFujk2bcdqRyEFSO+R4g+ON7QTJbvn
	 IQtpV8n6t1aKVi1yhYujDdG+Fw6r3/5Z42SKj015v7gWgYnzATmxL15I2ZN4LD3UJldf/
	 9N/MHcyRGuLVFJFW2+o1g6JNYDfYzsGuhx+/u6hYYlXF9bwr36Z+caggXVMeL/xcYFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793338016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xyRi7XDKpXV1gU6ovNhxbTiviMkA7YCbmNrm8NAAe74=;
	b=TPfkEURaMea699WCuDylN6TGXCMcxqd5+wy2kFtyJq6jUl/bhCxLxbpSdwYLl32rlpCE
	 K7Cc7PH/RcfbpOE2OPM8C5vDGUrtRyEfzPy1dQr6NACobxnCS+Zfr+3ODb62sp+Z5sJva
	 nb6zAVvyryhFuetpsW5CfDwfjt53E6bqYhisuQUDVnrUxhlRauHAka8bx5cMStpr8dS6N
	 vwH10KJSfB1q2vsMkOYuZHyGbmfmfjFftdWdRdJnP/gQJf6VJ2f9Uz9Cn71cereYSk/Ml
	 M3lzYkPG2hslV43q6dO2+CUJV2oO3cbRFRj6K8+Dg2LnBAEjDNbZ04TH3aNShQgmGWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d+bxHsU+;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2710C606A332
	for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 05:26:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2710C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d+bxHsU+
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cd67cc518a6so194764a12.1
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 22:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793338015; x=1793942815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xyRi7XDKpXV1gU6ovNhxbTiviMkA7YCbmNrm8NAAe74=;
        b=d+bxHsU+DaLE5VVrgkliIB4ayMjVY+RpWtD7z/NIoM/o+TsvaUBRzUMgZhUdq6kRwd
         voWJcAcY6FoodTYsDMBAZk0oXXP7IIO+khO1dOARJu5PDmPa1szbHzpnswezgnnhcvaf
         reH7UMuhhcK0GTyQz5Dofti5nIYrEZyGYvMlbWQ/IN6NNANQJHbJ+fP3ygHyUueGzjVb
         QJPdLI9TQOIFxnjVCW2Xrd3wmj3UqDld/eS2yZEbjGDDQdZYl3RsLtLECskewmzhjywd
         xepQTfqij0cXM8dmK9OHZ0/TkSfQok8VT2viqG2iwEJmavJHzbdfuHPojpmkc1qDNaAk
         dCcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793338015; x=1793942815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xyRi7XDKpXV1gU6ovNhxbTiviMkA7YCbmNrm8NAAe74=;
        b=BsE0o04AfXoD8xd1WhEsi7BPMC/aTyliMt1WJQKaJoK/I3Kz1qUs6yYJRiAn4LfW+W
         S8yieC+eMz/tevdRRZ0Kd8d1sO4N5BQaf20UBAUFHUlH8zpa2H+6ES1lTg18ei3xXRPH
         uOan5R1aKAtkpviBYjmG2XZpKJFBkhU0yRDk5FXGVAeCKFuTizv4qHCnLNoANAZ6W9IK
         j990buBAdGG+HBw6/YqCYIIwFFuJzBdzSn+7lTowOFBqBwdd81Dye1MxPICH5iQtANCW
         3mQdEtQKtPQisDWvwxhq34R/f/kjJG2mggXwu6ZB0wCGPuE5sN/Ba/Ttq5AMpDX+sdCL
         CCCg==
X-Forwarded-Encrypted: i=1; AKwUvBxfwsn5trrsl9/GNPmVnwClrki/954IsRcIV4IiXpFdzDCOKLwYX2iNvHd7ShvnOZIBcz2ut0u89fg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXiUHWwmOD/UqewVpfGaJ8UIvIcBl1zN2Q30jd7vssKMydNcC8
	ZCszxLgTIbO4vKav/SRyng8z6AYDR7vEUsjKWst5LuwwBoYmm040nh4I
X-Gm-Gg: AYBFou1Zb/pfc2Wz2XF0YOGQ0n2YqM9kSrIlPLaNA4OSPgQ2vaKQXH/Nww+1y34+deo
	RCBBHX1vbbQ8/ZBq0LRIKORK8W0Pn6T3syOnMXjVF+E6eBVRCi3du1rQLX6STWKrEVxZwen7DgQ
	QmuXyx1gp9lPN2L/jbsUavYQDRy/MQkyf2ZcUvPfzBrfYUjylvi3aqRSbBgmyiMdKAjj9/dFVUu
	sHsGTjRTCMlJ8YXHB9SaSHES9Gw3Tk3jjEn/SJCqfHDwKArJMTET8aoKFFebBKVKpazJnDQ6IhL
	otfG6jypbiQkL15oR6JU+XlFbUY5V0mDJmCutcBW3yWvkTihtZLb9qhcpPdua/HmGYswoXtDOA/
	4sMoipRP1OMfFsYkjBxms8msjDLrbPOZmkSOQzyQEIB9z/NJb+bJrpKJDFVCVFCF+j4RNttmnVu
	ZdS+J6IJLXRUa+AWgBcZw+Rxl+JPjPkHcPZzl6ozTTcOWBx+aK2wy0+xGcApg5/rF70M96pLziH
	w9+CbHT8Q32xwalO0B5Wm7cHOXkgyUNToifsJE048k5RWE4JfYf4RcP66wq4mCLkouqMcmHI8PR
	E5PSe3qBflrqcPhUHGUwWzncfPGpRuG0EZXjhVDzJLGKyNpq/HFO1vFH/cbUcg0EAIWotLbkaXA
	pgBhNPXyJviqo4PMZIJ8OUCD3PUF7l6oVtz4CADbCsDfUyJ4=
X-Received: by 2002:a17:90b:57cb:b0:3ac:b2e6:317d with SMTP id 98e67ed59e1d1-3ae89776ad0mr997346a91.35.1793338015580;
        Thu, 29 Oct 2026 22:26:55 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845429e6sm2421027a91.6.2026.10.29.22.26.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 22:26:55 -0700 (PDT)
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
Subject: [PATCH v10 06/14] ALSA: virtio: wait through signals for PCM teardown
Date: Fri, 30 Oct 2026 14:26:21 +0900
Message-ID: <20261030052629.27742-7-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261030052629.27742-1-mynameisjune111@gmail.com>
References: <20261030052629.27742-1-mynameisjune111@gmail.com>
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

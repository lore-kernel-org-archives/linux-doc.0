Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862566;
	b=k6hWFWe3oySngS1FX+p96Yw4K8/0gaoCSjbU5tMEMtaZ8Llhsu1Y6vB9HT7/dfVv4OJe
	 EJIj9VNASGxXTV0Fyv5PzhF/aSm1suOXQyLoCI2fpIeoTXzqnYiTjBd/vYv4+fMEKDM6s
	 Lt/TDOJ9aUJbeGmsInK/XjVYr3vS2HFSrRYiQKOk5NoNUuZ59sW7+G3GoGnFo2Tg+6Kzx
	 WnH/WQSnBF09Xp+CIpiGAMW2ch0bXuul7VyIRaz/741qnLZc+FsGC5wLfmzeuZhgxS9+z
	 zTMciIEdYTFvzgmnFGazrMbW0Xb69UNJdkAXXQEngwgg8nVKPPzf6+uKHUxyB3rlbqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uAb7bK+oRWXf9bD+sbQ9BK8EE9xp2VcjvnyDo4nUrT0=;
	b=ipGH8d7M+Fk4SbllyTitrDEZUy+j2FbTvOw0Du4mH93y5MqjPpQLG48vtvElfoaun9O/
	 KiIXY8ZiVm4aHGF1YuAS5VuQP2TmiYlry4mNmn/kiWNIJz/wd0fSzwdIiHZ7xQ4EmoA/p
	 NEg+P1PF1MPce2ETAYrS9krlmrwXCl/bIYkwqCPM8Pgrm5vPXT0XBQRBayDeoxI/DiZ87
	 15l7LMcjWwBRB6fpx/e+Y094AoIh0YiSB2w1stSt/2AsQf49RoPSyBcrsecnHYn9jyERJ
	 Nd2AIglYGN7BPd3sqmOss0U0AReBiTxLqTi/XBnHB6e1Uuy9RX7Caoex0slI9HaV/UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="VoN/PEsd";
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB083606D825
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 07:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB083606D825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VoN/PEsd
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33fb4680717so2793481eec.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 23:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793862565; x=1794467365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uAb7bK+oRWXf9bD+sbQ9BK8EE9xp2VcjvnyDo4nUrT0=;
        b=VoN/PEsdJpiWRA1ncgCpX/2JoQUoG8TuaRp+iKG7TtcNUAsCf54u9QixqdCVsOkJpv
         3MulJH4YjMxjZQ1tY5KbwymqR/NzoHd2jQXmCG5NecyJ06nvLXzNdR6jevfX7Tsw60Ug
         JbQUCVEv4FA+O/wLf9Xh03e6Tovxj67lAHAjMIedyDgWp4wVQUpdHWO0YB3vOvODIFgj
         dMNd0UArWzMKC10Z1RRWFQB1soXRN8cZza1pbtUiyxlvOHOw20hXVQAwd94A+5Z9BDc5
         FY9agZc2XM8YU1P9DwMCu3uHThWUwc0TFLDPzRWs7OGDNUmHK2w9pRWML6947dWrJI3F
         2HAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793862565; x=1794467365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uAb7bK+oRWXf9bD+sbQ9BK8EE9xp2VcjvnyDo4nUrT0=;
        b=JG+Auj6eiWk78onDxV+r7qYOvXspa0cGC6cvYtj4yihdm7y/1qYhQD4AxdDKkVgbIG
         UoTTkRmcihgIXjx1NDmBPEW2JLggCYzszT1riY0geJLgm3FcTlGVeAOXgTZPq5zuwpJc
         wJImX5g9TPJ2ZIUQ64BP03ioMV6c96tJhRngG78Y/bpTpR7JxvNriIlFelLIj8Xp+5w0
         wBCaTApkAHQrQfqk/v9a8opT9DfZtEh53AbsDdA8PYw496CZS5hgXhhOJvU7mw7UME9H
         6OKS6Jy3rFYFP2o8JLWj8Eu2H2aDQXdoVlnT7fGWaEJZnj9ThnZIlqp7NK9yc6YD5cO1
         M5Og==
X-Forwarded-Encrypted: i=1; AKwUvBxhTGCqG9ktQOKG2gCye7xFvnZeuL4d4qUEu5ncQJ96R2gYuFgn6JUoGtVHm7A2FEiR98hiWF+HVyg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cLh5CTBlGYKo4iT3YwEWyYIB2VU4GT7JKI8aTgDCcBGrBnaKI
	4ZTpO5ZsxDvqZZJMIIaCqUMXArzIxcD6PzOfZ6UPbdndPaXiRmNsRW2swv2naQ==
X-Gm-Gg: AYBFou3H26X7ab7fY7FP8FRdI+P5FzoOQ2ijxOULrEUWDIdwB0pzkAmJRheTD0kot6k
	hFbWqKp6mczS7m1MrqcawHM5PSaagqKWUOPQWdGY3N+HsA+eNnvRkR90135z0cVIbQk6DR5TKfs
	5r/ilNnlbCz6TzpXq5M/W6qnRxB2bfIsf+aEMnVpI8SB9JScfpbrpSIuQt7Jz/K0erybkb7SjUA
	n+3K1SaoNuvG9P13rdhuzFNBDtoyFCPYA+oout/QyMeEO29XQuDhfoKJcNBCHxuBLx6k4fQGGnm
	MoBDllnJH/rtjk2vzr/PEa6FVLwzSEc/n/dL28Gkp/nvCnK64En+W+A3ydEu2yYQN/fPb/x1Z+t
	MGur3eOwiQLUSKOii7eopkwnBGnoBii4+NJ3uK0oQZ17uabIdwPoPSUHsltee2mRpRi3K+Z9Jrq
	bc6HTwHWhWwYxg/aGw9eNKx7S0OMmhsX2HFFB0CvGejoO9v14pqPr5CKO1OrTSJhlze5kZ28hJi
	6kt6l0nxF+LXX8p0fzzE5OpCwInWMezXLExLdeyL+CmWI1GW/0JP5PvysnjK0fxtnSxMIirF8fK
	2NnA9NRC1pShDtZh5yBK1HYfhtuyNVmz5wcG/6Yf5jJ+UyYBeBuBXSd1Tk68ES+K6Vj7bG5dDv3
	DFiMuJfZjgFCmiCz2OvLxS/7cGuhg3qWwU0WS924Bfhofl5o=
X-Received: by 2002:a05:693c:6391:20b0:36a:21b8:b6c4 with SMTP id 5a478bee46e88-36a423408a1mr27278440eec.8.1793862564710;
        Wed, 04 Nov 2026 23:09:24 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3981ff0sm16812286eec.24.2026.11.04.23.09.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 23:09:24 -0800 (PST)
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
Subject: [PATCH v17 09/12] ALSA: virtio: wait through signals for PCM teardown
Date: Thu,  5 Nov 2026 16:08:42 +0900
Message-ID: <20261105070845.6449-10-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105070845.6449-1-mynameisjune111@gmail.com>
References: <20261105070845.6449-1-mynameisjune111@gmail.com>
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

Keep completion timeout and wait return values wide enough for the full timeout range on 32-bit and HZ=1000 builds.
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

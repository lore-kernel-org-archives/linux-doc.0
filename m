Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794182154;
	b=X5tokIeV+XpWW0e0iTCSw6syy78XP0NiEz29cT/ERHwy7KLXlvlXjAIgMUbw6x357aDh
	 jK09RyeurwbvpfYMEl8gv3DxuDlEhZgRi3oWxytdXlMELBKuLCLt8+vP1bOVfm337vWqj
	 mlYxXlIosiUuBj7a7d1thONpZSRL71uALgQkilKck+Fmw+m1Lm3yM3nP93/p6toNkLp8r
	 9CZGmmqWDrao3KDtZod3IZiIb4NAqgMz1SYPGL1yofbpotZ4P0slvAXDBkyuby8ZepcBS
	 gOl5ssvf64U+BddQiuUoNVDIOMecc2bNyrQBEXhCBB0tZmkhC1YQ1mU6OkjBe55Cw2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794182154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XF2VmCDJnpXIgiFaGUBtPdUTCN/KhchAk0nVPRL7Ydc=;
	b=wCplP6Ptv+0rvFbb+Wn+FY5OFkkn64XTAvx2QTiXHKerqlMyUkDt8aIir7cGqv1ipM3R
	 8QQb9v+12M4i4KeaZ39wSeUWkk5qqd/gTBdTW7sx+FA6rvGF1ZucJ/Sn4uIOv+sj/t8/a
	 CLihMw221xDRApcx/PMnooc/qBz+ewx7V/S2g35zak+u0l95FUuguWn0QHZjfaaulNRKR
	 yyFC957E/zYDWy4hPYIlI9ywuDbQtLPNU0Wq2sgO0CYtHD7axS70kMGhyPhp1pMYZcTSk
	 BdyQrX6bBSNvSecC4y4W12wQoECG8lQ76R9JDdifaaNlhJRcHOtGxgL976GphTchwTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w2p80ylO;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC3E606A326
	for <linux-doc@vger.kernel.org>; Sun,  8 Nov 2026 23:55:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEC3E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w2p80ylO
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso1555195ad.3
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2026 15:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794182153; x=1794786953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XF2VmCDJnpXIgiFaGUBtPdUTCN/KhchAk0nVPRL7Ydc=;
        b=w2p80ylOEaBMw434BJFvCPDMg98dd4/DQ5426B3pgyCPzrvJCZZq5XfDM4D1EYm3AO
         Yo8ypKw1nDDQVYS/0mzyr9P3iBtcowSaFo0ph/NssdcIsf0Q2+bsDEuqpaJrTPkU75L3
         u0eYIy2k/xzAxbpXtLfUqj3nO8pxOtWGlJDcuY95UaqyMMJPlQx4mQW4qqJWKOs0t5q7
         fQl/1BlWN/Ek3tEAp+TQA1trWYOyU1UAyjQZbeZpw6DZDJcRwCn2dPayTdp2tYpZOoTR
         lg6Ptt1F8lQWS2GOonuYyQMPKAOpYexpjuNn6o9Zd66pOXaM9Zr8PYIW/0EvbpOpjruN
         aNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794182153; x=1794786953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XF2VmCDJnpXIgiFaGUBtPdUTCN/KhchAk0nVPRL7Ydc=;
        b=hdke9VxsLZotAAb+RN+ajltfmGFpoBFzxMYqMAiW1CYu5jDVj9fM1RUNR2scoQ5HZ5
         U7gldDI8gakzbZY/j3k7+Ge1l+Z+JOdt4D5Ltm7VMZmQadK/dc5vHrwYeUXmpOPC5Vhr
         3nRot6SpFg6O/66YouzKiKxpEtqVQMkU35aODSFPOTbpi7nGOAs7earK9h4BvwOcMVLG
         yLPNnhvLahvotUDux+lXhuhkKJXW4CXIhxlMkvMx6rS1S63GrjI1O9zSLb9yc2xw3xX+
         EufRs/rrrbEFcSvt7Uo1LFsdYKbD3HLK0nwGHdLX41fsB39NuuIRC7PXJpuUETnJCUAQ
         BFBg==
X-Forwarded-Encrypted: i=1; AL+hErFv/MdNSKAqOZ8snfaUyBxpdeupTtewGxgY8fheUXDEQEsPKmGrZUCrtQ+YlFslexEvNQwpNI1bw9A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JOEv3cFNHjh0EJuPkXrnDbki8Tks6EQHyGFV1EhfoGrAfBTE8
	0cAyDdROvFauPoKYNXS59yYzogHQ7aWKtWTH1S1d8TEAu1WEmNCLCK3/
X-Gm-Gg: AYBFou2WpI53//FW6sGm1RyzFGQFZtXGKrKoWgBgJtBVFkQoM1Run9IKS4rPsDljy9f
	eOXyHkPDZUpthvHiehNnXk2ZM/rQiEB+UJowEd3aB64rXWCSKwpxBGDtZbl+MsqJ9lF3azgOGJJ
	PzVJ40yaSzF1BTX+U8lXrJdkHSBBvSvgsE+s3YtpeQTWAzPsWws48f+4lUGKq/Y8dfbTk3wWthh
	R9zOe4Upc8mZbE8zFlZTvrlf5dkUUU309CyWRcY2TqUWs2MbMWhhCQHt2R1C2OOPeS66Dl+OZf2
	VPI9//o94Ti7Ccl5Qg5JSxYfjbgXygJ7H+lziXR1tFhZrcx1KWhzUD8WFaa3LOS7siWtMs8fGyI
	wkhOT6ky7xFb7sUm1n84kwlrjNdiIVNvzzM/hR2jcTgkWgF9RuIsX7aEvRLZl2LXG7OEtLevea4
	W690WMYIhSvCwzolOr20OaWD68IEh8zW2aod+oJKioDERGrQm8ZHwG8mJoxVS1iAkkqhJ3btDKT
	WC2vlO9hsFn2GXUTaYX4JnfotS6hJO3EfPPwvGVSKtVsUM6VJFYb44PCkwVIRyX9Fj7R67/c8bv
	6mDqzJgp4ZZA66Dw6RMciv6P2STIg5jIDHQCzkKq63cVYs6XJpkyvNDrD1V8djwMuJhr5eXaVVM
	O8uAa0CE3v6zY3ROxLKWYpabLiOn1U1WPu/4S1PzwWEpo5T0=
X-Received: by 2002:a17:903:1b07:b0:2e9:79db:449c with SMTP id d9443c01a7336-2ed83784c99mr24187015ad.47.1794182153315;
        Sun, 08 Nov 2026 15:55:53 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81722edesm6095215ad.55.2026.11.08.15.55.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 15:55:52 -0800 (PST)
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
Subject: [PATCH v21 09/12] ALSA: virtio: wait through signals for PCM teardown
Date: Mon,  9 Nov 2026 08:54:54 +0900
Message-ID: <20261108235457.12688-10-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261108235457.12688-1-mynameisjune111@gmail.com>
References: <20261108235457.12688-1-mynameisjune111@gmail.com>
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

Keep timeout and wait results in the types returned by the kernel wait APIs.
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

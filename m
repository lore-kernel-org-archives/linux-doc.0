Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793923640;
	b=UTywwE1xCotCQkvYHf6CLR3WdeA62KZTf/t0431Ar3sUG5zTLpPiRsy1D3NSp6M6QdQX
	 I6klFgtkcNrlbXR5h0kkCGvwpu74hdNfTOkRxeF+AL/5O7aRwr0f+6NYumGstCAAiaEws
	 5fuuhXRx15ZxKtYyV7ooJ8RFW3Mcys/g6UxnS7+F8kO0KeB+vUqmyuoNBkcWY0CBpXXKq
	 wKbxxMStyWfXnbqrM7lEuXCybDAUHV5dkTkp0XU0izsaLOVS7gwHomOUASbo/MY6v1mGS
	 i3ItYC/jwKnE2NqoFAH5Gk7Y6bSEP11MLXgAMQ38Oj7BdDkcjAr7Rw7M767OqzR8XhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793923640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XF2VmCDJnpXIgiFaGUBtPdUTCN/KhchAk0nVPRL7Ydc=;
	b=NBTnaxDYCE3SoEro6dlucuGqAurFFCmf35MBUG7aHRtqXFQBCwJfVHkzF4oU3UTodK9q
	 0cSD9mBezjm4m7U7uJE1BmQCNxOVWctSc54p/eYb6YOV6unlfjrNfgj90k9L1u/LZR9Cp
	 bSQeUyB5FZq7by1mLnb6S+j8MroxVQUd44s5AhqqvtDNoaLnRvya8ECAGxJLFfbWLvBtt
	 DbmECShfZBkaYAVv+impqWgvXCMJAgxN2V4LDFkmzqhUEYk/bEy7Xiq+9AJNgqvENDVgH
	 Vkx3JjKnXz/7eleG40cd2r4fD7SbE6Z3qXfaYYBaAdWlNksl34lmrChXiiuA49KjGxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sRK9sY3D;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BA1606A32F
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 00:07:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56BA1606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sRK9sY3D
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a2af4c8d00so282038c88.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 16:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793923639; x=1794528439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XF2VmCDJnpXIgiFaGUBtPdUTCN/KhchAk0nVPRL7Ydc=;
        b=sRK9sY3DSDgmEYhTYAcHjTmIoyRJNRfdhaKjdwt9pHcvS6j01bgZH17FFdULdq6jW5
         hg4HG0W0zcezriedl16bcdhogjI2hiO0Peh7ckuaSrORiayKlcHIV2X/0fqqE7EY3sl6
         pjB1m4wb7G82KnoDCKBuJS1mf6mdnXqho5gqT2RKVSFGpUH08mdzfE3vMM1WeEuwi8hx
         9VXCwQKFyEx7dkDGWvX9TzxH9dZbDngSpt7QEGdvV38ctMm4Yd7nMfvqakddDMesQs4G
         +w5RSNsMiVUqycUn0KF+l1QueLBsFntbUzYAtse8Ifkum7mJH4ljAzzz+eMV9/gsmOCZ
         Wo3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793923639; x=1794528439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XF2VmCDJnpXIgiFaGUBtPdUTCN/KhchAk0nVPRL7Ydc=;
        b=dtHt/jp53Z3BaaYMeivAv/9YNqHRPZsRA4vaBLp8MAg7rZHVSDwCOLfUpcjKJ50tcn
         0CKlbEr6MfZKMpxQbNcm/a44bYcbdd9jtz+2T/D2K31Gz3hsqla9EK9p0pR+r5AFnYh2
         Phlc1BY1px608+qvuT19AVXS3iutY/dS6W22IJsPVNJmm9+XRvETCha13Ocd7/LcNqBV
         6AqHQ4RdHva1ZvjbTYkBT3R02m2hZHM85VUJj4D0eVNqOZyRYH8F1lwJwvjegiaH+Jk6
         2NtDypqY+iaSdxgVs5aRb9dUNB95RDqMMqQYNeWXw0JAEOJpVPW01aqVWqb5bCjQP1qB
         5CcA==
X-Forwarded-Encrypted: i=1; AKwUvBx6U+/rS/gkBsxrOC+fAl8cH1LkD/gJH1EjgAKTaAAwUyDFYOrt0w/4MYypyXK8Ph2ookaXcf10fWY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iv7Hz8HnBC4hUFj0hbacDTh43RY0OCKSKUHQRXRt1X9V9DxPL
	NRtxVwIBN1keR439V9VrSRtYZ9Q5XTNisfpz8C1nMKEJOQaMggjLqU8G
X-Gm-Gg: AYBFou1nd56cmdH9pttKLTA7kZnO5OiknooyqSpKsE56xCpYyNsCJiGyYXj19GY90Pa
	/V7QZrya3NJPeCFQ3nDBCcxW2deXYUFV7wmUGgILciS8ECIxME87UMxMokQtmLWsO7EvIpDoUq4
	uY4HJzSLl0fvUM4m80qlJ9RtCNQW03g3UYVMlZk1fFPg2rC93qRCNcuQqKT7RWLxKFWLvYyVlOv
	NZnpQKkxT1Np47J4BzHTPi7xKASkgUh4VS82tsF/vMsKlDVi66U7Qx72R6M45l3GPL1GkGKLfL9
	Ha3jwtXYL+6kBCInwsuN3l1HZLV/+BRWTf09js0SrblxaY0KtBkBnzB3n0xe6kz9BujtpylHnJc
	t2/HvYXZzMflUmEP7iw4sY29Nxwz/1bHmN1qIQ9WeWUOv6YDj3TleDysXaUIGdGyDGxm8k5SwWW
	2et1QTQYbXawqu9sfWgLucmoHr2MNSPJNlPY2uVlG4vqWj3p8oEKZBBoN5SnN8qziHm0rE9rf4l
	DfLBeGBAAKS2fS+GQvxF+UNemZO2FSYJDEDQmGyVwZYDHepcNQTSgPF3lFZCiNpFv9SPXEiUC8y
	za9jv/c7k0WmucWN1fSvUronLY2xAOFMiAVlDDg0gCatCBhT3as6qvnZOniCySp3fmZjdMgvX9C
	fth0xoFrU+JtfgU5ayeLM9d+YoNQqk/Gev8WCpXQrFmVqYPs=
X-Received: by 2002:a05:7022:6983:b0:14d:baf5:c415 with SMTP id a92af1059eb24-1b25d30ad8dmr1158836c88.7.1793923639260;
        Thu, 05 Nov 2026 16:07:19 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4e079esm371165c88.19.2026.11.05.16.07.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 16:07:18 -0800 (PST)
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
Subject: [PATCH v18 09/12] ALSA: virtio: wait through signals for PCM teardown
Date: Fri,  6 Nov 2026 09:06:41 +0900
Message-ID: <20261106000644.20460-10-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106000644.20460-1-mynameisjune111@gmail.com>
References: <20261106000644.20460-1-mynameisjune111@gmail.com>
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

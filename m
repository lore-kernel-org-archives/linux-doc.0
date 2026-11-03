Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664270;
	b=KeFCqARzNs/IK77i1mYNwgK1+msfHvn4QuiILmdJEUjX9zxOYlkBUA/j622KLcju8LHu
	 /MJ19CQuqJG+zJKGu7/g3R4KKutfYE9DRnd6XAbScEb4pg2MmKt1kI7H1LFt53BIzv9Xm
	 TkHTidXt0SUkFrtD8u82X4zD6XAllXksLLzXkeoScU6Jk582nPR3H65Xw2oZpP5VcMvqx
	 pPOs8X+Ct47oG7ofZOh+HLo6SQGYs6EvjiS2jaGbjALE3wqTFu+jrtnegmXONWrezfVhl
	 RG3jxXU3IKYsTngJTqhcDXvn2/3nky89ji8GQ1SdZbmZuxSwS1hNuLXizBwCh1+ZYdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xyRi7XDKpXV1gU6ovNhxbTiviMkA7YCbmNrm8NAAe74=;
	b=p177VRb1PU5I0YmoP2/zSNHZ/e4NtPEV3trVyFgtiBZ8jlq2ewCP8WSgqjsze3W1QC4j
	 +BRqeyWpyIyUUbVbJDLgI7/2MoiZHLJ5/oCzic9rRw/4JaoH4QlpEVLClFt3W9lEJGIrG
	 x6gnw70jc3Jr1/uTlUdRw8xeFjVwqn/7EfSSdTs30hJOFntLKlE3SL1Vg3SIWT7vHHloI
	 /8g75BEstojTUpR5q/cM9Q7Eacv1KUlN1pqOT15JGYdr7yCTL19N3xzREwTnmReVa+mWS
	 V86cQ7bmp4WWBkIX2uoHjuvLOb7IvXNzzBVnTKvINuii/ZBplZo1l2dm7SQL7JzaZqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wOeKq7m1;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CFC606EE86
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 00:04:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14CFC606EE86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wOeKq7m1
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso2123386a91.3
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 16:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793664269; x=1794269069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xyRi7XDKpXV1gU6ovNhxbTiviMkA7YCbmNrm8NAAe74=;
        b=wOeKq7m1cbAxaY5QEufLB6DkHrsCdHAvNkLj5yF7gMkIpLHlSx/ziMJqqcvu7dxbJM
         Yib3p0Th43UH37324d2EN4Z8KO/1+ZRKtST0NFaxmf2yXYVtbGYvhO4961888jc8Akce
         ZxKclR/HRspBJidN+Yb9O1Sg4d7LjwdvrunsGvgyJ6+Wl2FASE7B0+h3uQJ0THHytn3O
         zH26Ub8GMy5VIcPgSXRIlI6mLV5x0tZBut20+q4MamqL4zzw32kKNW6Avdm6ukGCWc91
         VSLyX2kbKiXonuDlb4uDghjscQ9KhlABU8Zqs85cjRmq1b1iFy5A1ew2PKhT7Vihzcu0
         cTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793664269; x=1794269069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xyRi7XDKpXV1gU6ovNhxbTiviMkA7YCbmNrm8NAAe74=;
        b=pTBZFo65Vg64RwKd72eCdBAkh82rNgM7SpDqRUV0q+Dv11lfUz8cq9y+RH+eUkB0+U
         RADxf5igyZbSMonDTzdUybFD1flonsjg2owYqfBBrP6yKP4Zoy4rhPrf/s7MBcjjQNlD
         59Mx9uTxBCOlf3Pjg92lCDfiRm7SPRPFlJClHSNtS7BQd0O6xLDT8J3K6DSDVf0JENjD
         w/K47PbHckHOvI/VkeiX6hzJ/np8JAbONT/Rb3OpUhCl5iGoiTqa9QTVNsPhaQ+/XvT1
         N81yQDWVIGEKa20X4fs8R318VxIbsDg/GArwV7Jocut5Pyp5ENf/CJ2t+eyqPJ9bURka
         9eBQ==
X-Forwarded-Encrypted: i=1; AKwUvBy1hiCqCgUjbNm9U5BZ6jmigDrrKbrzHD1HUHc5vI/TkKlLFzEuGbLM1mxEq58HSVU3eMV5sxtf2uo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Kt24DOVINEe2X2PPOD2NWBNGnP8NzhAx4KixQozx0PXVyFr+F
	KvS+x5qde4JOJ/qpR0a5bsAesnhormpBOqBU3Vt3zBQC8DnAturp8G+K
X-Gm-Gg: AYBFou0VjxQa8cqNEeWpl3VEYBLlInaZiMSOgZ15oxyB4f1UeVwHuqdtiKBVARflfeP
	hA2oFawKn2NUZWZZAb2jps9dUHVKMfbzDv1/UGULDxZrJ+q7JieRP/iNW0FYFr6+OeaVYHgqHbV
	gq1UAayg4TQoJJ40yjPhjgd7LflZzNwrvIiQTQUnPohDI6ukn0RXeD2HEZ1VOFUxjjkApf4Kfuu
	FhmNPK+FeDqkJyC/TmQNKq1NbBSaBjQeY/yfVdOpyvOaVkJ6jWoropw30eKj/xsmjjnjvAvTFaU
	X1oE05AGUQlw/oAFQAIPGSPiUhd0sLB94J9Nk9SbP3OIbCbWTotowKwORUPcSOZuyLP+hLboBjf
	pkXJzziySfCssl0EyNaDDDsJIaW2S1lsnxBx6ghOC11G9ghLKzamU2/D0Hu2gRh5C64CVACtyoX
	utWwfESq4fSuyVmyEyIDXEUK7WyiCBiEpgwMyJO/IFyaJ8o7T/De/sajxlER8Y57XCCmXgkxSgT
	NExwZ1Z8uYtLKNTsxA8YtI1CKObn0tl0AWdIEDUUQM1UC7ziCGGFPmObqFMAnxUCqdHQMq2IPU0
	9hzwCB1htN1cSH8A3sDSlgiMvw46oFfbDXMrL6ilGX4NN9g3T/4z1/VcKjHnNrgrS/vKf5enhb9
	IHb/vzDNnnoIoZ8jgSceUhpkhHrYt++fbJSEBVaUpk7Tj8gIkMgZKi+feGSPR/Xoygkno
X-Received: by 2002:a17:90b:2b47:b0:3a2:b16d:928b with SMTP id 98e67ed59e1d1-3ae897a5c58mr9348377a91.46.1793664269378;
        Mon, 02 Nov 2026 16:04:29 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6b3493sm1339225a91.13.2026.11.02.16.04.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 16:04:28 -0800 (PST)
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
Subject: [PATCH v12 06/12] ALSA: virtio: wait through signals for PCM teardown
Date: Tue,  3 Nov 2026 09:03:57 +0900
Message-ID: <20261103000403.67106-7-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103000403.67106-1-mynameisjune111@gmail.com>
References: <20261103000403.67106-1-mynameisjune111@gmail.com>
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

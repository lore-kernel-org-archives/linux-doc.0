Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793845941;
	b=jwplsspxmNzpAFXE9hMCDQoAnoqBTev7lNFrOCxxpodfR3BDpZF3hQ5DLYlDi8LS7D6q
	 tMbtG3MQvX3yvHfHyDARsk+6ESjB497O5qbROWX4py7oGRpCFK4K719G9NgdfMdCPPaAD
	 LS6UjBOPhpp8wg0K1PM8hf/JQBrFIIcpOdjG+iBgQViJmfSeyTXi13N9pSFzkVkSGmvOP
	 bnIBovX8ezWZQh+csMHE93kS25YX+MexiKVlQ+Q7Bm8nuxiXeCTgsv2mdw6cJJV4yyX3z
	 4rNn+2dqxilWWK6JPVSMRo++lYI+8YgmFuMIg50lm15nR6dq37z90r26Fg5H0zWFxlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793845941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+MrFgURXGVOlsfMgOcHhXpqYFBlUXyLFf4QG/xpHN8w=;
	b=QY/TCCg7b9JGZkAnlx2xWUuhJDCzwYk09hxvk9S7iTB+9QGBxS+2Lu5g5aR6zpJXhNbh
	 +RgQCn1zK1yR+0HenqS3zLJhdV8qW8uMfU7A7auHxalDC4/Ak6rP7uqEgPxuAbz15EsLq
	 qQB8MwJ17lhmvj8HGLzYefVpAndN4hy92VcZOMxv+fUvBwuahuZiKpXKSDsgkkSTprXXt
	 Vv2pVua4s/TLN1t5LjXkaHx7P/oRVNZ5falNGlruA+yBEZvDwZTL3sKod3eCTfV9HKBtD
	 W0WuVC0d6upZ83FwUHRt+Z5SUsKA8MR1hwFk9Q70eM+eKoihpFSDvqzRR4UhsEoI5hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vv9lVfIq;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66391606EE8E
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 02:32:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66391606EE8E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vv9lVfIq
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso296024a91.2
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 18:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793845940; x=1794450740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+MrFgURXGVOlsfMgOcHhXpqYFBlUXyLFf4QG/xpHN8w=;
        b=Vv9lVfIq/uGJ92iz3/mvZUy3hIePG5UElXuauRlR+iqCnP1sx89GAXQrx8D/iWJip2
         kgeN5AR6Liz5URIgTLQAdRyX1C1KnS0LuPPef9+gy28JTiTIKb1MARzID0UUJHPtOi+v
         8oJGsVAedydWXl7xRsaokKjNL0+fAxnMU6+YRgLomvXnaFvwdMlRDCYrztExIUp5fUXB
         m/yyffdRUaxVA36XvGjx/gNHck3rnE7vj8e8CU+kIvJPZnuSsuCzP3vw8PIb9FdPhjMa
         Aw3dCk5rUz8ViMTwH2xCdMS6gRGCr7VhnelEvinwourcZhIdLf280N9xO0ZSzRTt9TEd
         WnDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793845940; x=1794450740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+MrFgURXGVOlsfMgOcHhXpqYFBlUXyLFf4QG/xpHN8w=;
        b=YO+//l3hcE0ZtDwXivluhBkMxNJjHSAa6iHarE3Y8t2tmGP0gKFmfzamOC72Jsc8Sr
         fTiJGQOxqTqRX8ip57HpUJrsGCm0m+nMeAel+lx7mzbV4utzotpn4VbibJVeZ/8wK5vn
         tJHys/6h/xgIjs0E1uGX/ONST3GardDCNRd8TYVL0ChxxT4opxPCKzN16RITmFQxBNlu
         /AwWzWRvdf6hRy2D5MfvaKIj8/8R8/UnAHBxLY/esAZ0hjo877o0EoqyrIQUqWLt7Cuv
         0ZrkeYt5Fb3FkzyAEE1+NaA00OC4z/wgyCTgI09QH+Kss+bNkr0JuzgDVslwbtQOEwQw
         xOzw==
X-Forwarded-Encrypted: i=1; AKwUvBytHvGTI1qTUvPr2HL13dEFaRUKnRMRMtwsGXlw9CAZSK/x2dK8+HXPoz8yRO0yFjLQOONHwzdUAgw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8l1GdoKvyVZggcVKQGA9xAGNdUBvMt6bMqTiqV7BLCQ7tA6tF
	p+xpcMMVNKovLfEO/ZF7x3Xi7r2NqyOreab4TH8dmpFrjwK9kH6ArSND
X-Gm-Gg: AYBFou2YNQcpKt/YDjoXVKVF4kzq4PsjD4Z9vapYU4z2LU2rFxrFXgHy30ZAXapB6n+
	rGXOL8rDmiGUOMcceu0jH+q1NVPODrXobEl+3cpjwmBPSvJ7rwGSXQnOKs3DqEFAxgYGRj6QRYo
	PLWyNKknaa4FNEHpjrD/clehSS6obiZH4AoZmvo8BdAwiCVX78MxPg7SvluOHOyAaEEhHa2qMSF
	6gN+nVYZAQ3igTlxJTUsobV13lfVVtwO8EFrwRbf5TEjHygPhlzYupL9OBq7R6jsmsVdChLnigO
	AzRyxQklj3C6nyW07vPftxOEpHV1asRCzmPrHGLAFUT8DLlaNLj+auvveikGyp/FpGji6Pk0Wux
	rXCvKCyuwWjup730zZw0YN9lV4/VMcbNQZWyRxCDyADfFKg/SPiYzDqxykGELEV2IsAHB5KPts2
	nNZJ8PeFtCUm7hCCAHLWMEECqnGwFYWpPqFRdb7SYd1+HWnBkt8sq9Hps/8lQeaYngvN55ywvqT
	0ETV+OAuirxY61jyB2+5rlGlxFU16GJpOUuASXF1w0CmiCN1By300Jda/KR1RUzpvOYNh2mDZj+
	FimylmkbdS8a+3wctqYuXUIYUZQel2e9TLDB80wLvLMGW0Vcrz7XPQ+pOgwWsx8sUQrQ4D7pL8A
	q1Ry5ipa/QGMsf5B2KO8RW/SyESjHqjXAsyACIgs5pbryvleswQ/k3qI5z4nOoOfYuSll
X-Received: by 2002:a17:90b:35c8:b0:3ac:9a5e:9ce7 with SMTP id 98e67ed59e1d1-3ae897aa7aemr15044527a91.49.1793845939762;
        Wed, 04 Nov 2026 18:32:19 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323cd3csm1292775a91.3.2026.11.04.18.32.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 18:32:19 -0800 (PST)
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
Subject: [PATCH v16 09/12] ALSA: virtio: wait through signals for PCM teardown
Date: Thu,  5 Nov 2026 11:31:37 +0900
Message-ID: <20261105023140.18373-10-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105023140.18373-1-mynameisjune111@gmail.com>
References: <20261105023140.18373-1-mynameisjune111@gmail.com>
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

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_ctl_msg.c |   15 ++++++++++++++-
 sound/virtio/virtio_ctl_msg.h |    3 +++
 2 files changed, 17 insertions(+), 1 deletion(-)

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

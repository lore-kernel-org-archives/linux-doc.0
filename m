Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693329;
	b=ZgIWmVrL3MRiZ98nh4tSXBKsBy3BRZ34o4Ij6teM57qqFCv5FvRmylsfYci5QS30Cklt
	 ab2g8vqW7ELzOkAAc5bP4nJm25IyYFwhkZq0YFk7XYITVjic5Zv912RCuvJAaiihqWApG
	 e2OcBr77mjt2J4nZZ4Ni1dczdAohckqNInIU4lN1XXuSo6Fr1rBDElD1l/ewVc8jJLkE3
	 mCnYSJYKPPSsXP6P2ehe2dcMcpnohVRHvureUU7C+zSc6YGbS6qrb1vqrrfVURnQZ8039
	 Z1tZX6w5Y8J85+2UF4dE/XMVoKW3HdVJBBG/Rsp/04qTthpdIQ9/9kj1b//WNjiwpQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=v+nhGD2zjLwLi9y1syT+X5YMbxWrSCy0fEer5oAGFXI=;
	b=IpxlN68d6mUCNLOKWSJnUO5u4iR7PgaemFTi+7OKltuojSyAuvB4h5FMCGtcnANiJe93
	 8yPTAmdyP0yMYH3PPQEogd57xDaw2nvOjUb8Sq9Xxl8P+HDeP2bDb1yiRAhKzHS9uml+8
	 TInxY5bApU71e4tpiSB+vprBlyvP5L8u6ctidXqyzr4BAnyiqfEMTF8XiQ03AHuf9470y
	 8d56LyOcfrPcrq7s50tLQsTQ0SDjJioVJDQmTlMh5vA7EWofQHiGBjx7mFl7HJvuHXlCP
	 Fcvn/jmmbnBKgk2AeQu0R4jN2afI3BzXKSo7hgupvxxSCznSlFEWMrR7rixI2HcCGFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fU+h7AQt;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC4C606D80D
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 08:08:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDC4C606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fU+h7AQt
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-369f33df08eso7513470eec.0
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 00:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793693328; x=1794298128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v+nhGD2zjLwLi9y1syT+X5YMbxWrSCy0fEer5oAGFXI=;
        b=fU+h7AQtUyRV1ThAByL+bP/n5fuwlvQYIwDXUWYtZ6M0BetJBhhWF56TlPkk7IWmNU
         lMAPg2puy8Qlf+C5qqSrs+Ls3/8kML0KW85DtbH74QcAGL6jikXnPJMHdswQ0M2Q/Mzq
         kUpYy8GRAuVtN1EHR4sFGhKwkgDYSpiMKNjBmMuygQASLvSalTzIacJ5zb29G3OrjAIt
         nBdm6RJIwHShgZzPHJe1d3tafcryWlfKk2OJE1ZYOGsEXtV73/Z8S3ruwW9dzMbqXwZP
         VGI8xMGc+loKhZIkV7+K5xD+6UKoihNKYzYSYrre3CYKFTJ/g0wF2ym3LznnkFtC1FA7
         VbgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793693328; x=1794298128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v+nhGD2zjLwLi9y1syT+X5YMbxWrSCy0fEer5oAGFXI=;
        b=eu6zBbmoRn0OuVTYqw8AXRyYAX2Se8xA4DjHQ38k7xVHRuHWjm5AFWpE/NjRJ12rrS
         ZcjlQhz+toOB0/MyMJVxUeCX5OiYE/a4KUa4hK8U7hQwn3DuGrYPRMOeZPsCUEqbg6g9
         CKsIFC8714WTpQ8Vu5fdqFHZCAMpW+O4q1eUNjgmFJ1fC9AteQCQB58Obre/2IP/SPNt
         IZMrDxWv3/FOBe7GkIfBRxtoQ1cwAuH1Yy8YGq6zXhG8xU6eIlW9nB8G7weGo2zgErjH
         5Kr+9Yck+Y5+rboyJoVzFBpTZTPqUJNPdAUvQS1LiBWo5C7MG4U69S+zhKgKNPpoHAj+
         Xdvg==
X-Forwarded-Encrypted: i=1; AKwUvBw9ymtxJRBJNDnxS7hscDUVRz5cH9fHt1YWfIw2HTsTD5VVyfRK14xCV46bY5o01V7AonVYjDpyj+I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/S7reHK4IcCWnFm+qF43iXiiY23AHS0lJIVQ8nTNStAY05c47B
	Onn+DmQQePbm+ZeVyxLBxi6ccOSeK3xZ1ReoGKa0zAYqJ02BFbpRBwvG
X-Gm-Gg: AYBFou3LoE+46Aj2HSrW2Veil4kDQRQbzE7KVxruYX0Sz+Osrc0aKyfAre3suj8iwUl
	HsHb6QyhOOd969s8/UaWDzmqMOmlfGCdUdqL+Bh9/Zl1s6GCJQQgbePMx6BDQ0NCTvyppRTjrT4
	yUEdcU/Wmu28TsTwXT5jG7gYuSSbJYp2riqSErEKuIgEw7pKIZQWpKqnT2mN5OK6o5IhVGhMj6Q
	5i3EdT8SjuWSkumFYdYJ08IBHSqntVtcLxOkepvQrb47yb+/RdKx7kBLs+HiUs24N9GOHfpe+bu
	DLcC5c+vrtp37OK63XfZm2kLo2OUZ3PMwdylt7JxmcHEzmbvGj1qzu4s6q+bNvpAo0GYy1suMph
	y7tpwO7zaBqgLdtvUpY1CNfdgVcDcUGs9fLSZ9LMXsSOWJiRjzImr7YUpWd3NUnXPLO8Ts8lFu3
	fRgvMNz/RO+n16PXo7A39LS8Imccs1NcOT3A9g7x0YdhJ1MoSVHI8MTuLXb2IPjowaUaF3D2yb2
	M4h1IpC4iD9jLOMQcaepu9Khyg83Zz53jsEBZUn1VynpitL/BvU9KCw9qQp35idkgCkz2naJdhG
	Db6Dn5POqO9hSYUfLHa7AsAdpX92U8MRzKgBXQtD/HwdMpH+Pr8M2iBNT3gFghnK8+qJZxLeM30
	zYyewn5TnzMaGHArV9P+/kgjgX+HxGoOSQhhiNWwABUaUcWIrfP1oEyGtuw+ccDfI/ree
X-Received: by 2002:a05:7301:fa4:b0:36a:713:a76b with SMTP id 5a478bee46e88-36a4236a5c5mr20255970eec.6.1793693327465;
        Tue, 03 Nov 2026 00:08:47 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm41468466eec.12.2026.11.03.00.08.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 00:08:46 -0800 (PST)
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
Subject: [PATCH v13 06/12] ALSA: virtio: wait through signals for PCM teardown
Date: Tue,  3 Nov 2026 17:08:15 +0900
Message-ID: <20261103080821.16983-7-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103080821.16983-1-mynameisjune111@gmail.com>
References: <20261103080821.16983-1-mynameisjune111@gmail.com>
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

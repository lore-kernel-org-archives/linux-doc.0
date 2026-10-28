Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793156023;
	b=jCnC/D2dP3yyQzceQDmQIRidRVoRPrZwFThwLraOXIo4pC8UAm8tYo3j3UqNXCQ2DomD
	 y7R3g3PUROTLdep8uapp373srgFEVYCr0SqSfY5QWj9wxVhGj0keAfuOGctoO7tw+tCmU
	 TFF58vQCRG24zEvbrAGYugc2YkheOuXDXHEk1omz2BqC7dWIKlXv+iJy3/JqULF3atSu/
	 jxsaLu+4b7g0Xd0Sogme+Y6YhF2n2zG6iOdt2BQ6tRXnry2nciaNM7dMKJpAXtJWkhFX3
	 MfM+ynTKft6ofKk23u60wPpEWrP5nr6IeG4OaRetVeBCUDntAs0r0erKyga9bbZYmIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=THGvSriruXU51ZqrJHmjnjtWkdka3P5vgj19t9/O78M=;
	b=kB2Vl++6pd/M5X9glzj2xfHUTgTFeJkYaN7GyHeowGo/y+6cd3h5IpCQCWdy1XD/EHuM
	 Y1+5QJN3bNxr5TKTCPpg9U+mPcWoMSwovTW7VnoNYfwHlVPgjZjV0DSAy/ak0mKhWSeVm
	 0DLJv86kQM240NmrC8SHKwZPZ5LYW8VYDsY54yyJO4c3qn5tb0mxFSGF8hKdJUyhd8sbp
	 lyFkIHqTg9A0UlyzuccrsHAAkBEmmok4KOonHSUPneklCZUffHJtM0WhED305RLgp+1sA
	 1av1QKkf9YRP9ZLU+AUsBKOokKVEvtd4iANyFO3DKCBFxI9kOYlrlREjDmCLJiq755g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sCIW0JxQ;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB6C60A261B
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 02:53:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEB6C60A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sCIW0JxQ
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3514b90bb89so985343eec.1
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 19:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793156022; x=1793760822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=THGvSriruXU51ZqrJHmjnjtWkdka3P5vgj19t9/O78M=;
        b=sCIW0JxQupG1G0xdyWEWEm2lrNOPf4/+dB4oaUSL4wL2QUbgv5w6oVzYYr6H5Myg7j
         4c6e84hcIFdCN2UmV+GJQQcjztEJcMXQm7z19o6hJ7jqca0Pf4KO5ZymbPDrcIVFFwrH
         WBdrtbPh0uR5DuTMN1DSJ/+F0Zr19G76ws4R8J3P3xaEgRoelyH+uWndzr6qQQrERhqh
         y22KCkL2lgddUAAYxFpLu3qkxvESN11eX2pslooVoqXO0B3ZFnG0xZ2z//RhvenKND4G
         L8V6xnbagJ/ebZKBkWY6w6LBtCB7DgLgsDnITwfvQIcoOYgzh88kDqaI6FxSaNhiQxfj
         +nsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793156022; x=1793760822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=THGvSriruXU51ZqrJHmjnjtWkdka3P5vgj19t9/O78M=;
        b=qP/GP5gEjzZoUCOlMIX7EQJHKB3gode5Hc/QKWJJCui9gTabliFLzbjnFcRIYLCCdM
         BBVVxyRTjmWPReCf1trc8b14XMNC9iWT1G73pgN4xUnNh9joxR+Fn/4I8EKE622mmOJs
         801XSlfcLsh07JPujrj+M/1yLVIfgMx2ZbmEpnC6/Mc85+rUF36Y1FOWr+oDjs4zPz0S
         jSNIrkN2jv2aKh0yBygRRjW21fWUe/yxa+qZhsXZTZncqRZ8QTVf9gJjA3d0abwc5XGV
         kh5HuPBrMcVMdGXTIAzWoSv0mzkIZJ8W6CGOAiSH8UUr642fgVqnev7JlhLcUOZPqZRT
         oBlg==
X-Forwarded-Encrypted: i=1; AKwUvBzSuB1Dh+R7XKSuxddoZFED6wnndgz9dANBu/g+Jxz9cfuoD6HJ5wnt2GUT68jyBjxj6SOQWYOsS0Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRT+03Ksg806R5PrbyU8RjjGCJkuxx3g/whKR7U6GUocfn4en3
	Ig4ap0lNfJdkwxOnPUcn0YCjSTQAsK+Hvbu687AdAdr+6AD8mRzswk76
X-Gm-Gg: AYBFou3Dr3El74z6XrKfKxX+fyjR4TKHYmb5wgHc3g+5JUXzO2Z1k8uWoBJhlGwwv89
	KpKXraKrZIr859dtLAV50A1EQydJ3Hqi2Rr2SAPYBDRe/00Pr46ztwFlozhDdDiVSRetIYF7bqT
	FoeiOuWLw/Y+W+rZEAm/ELvQ6ZfKC/EdWngq8TLKRwHoNIUdCnooV6O1AUBj0euFxSdrMnZrPw4
	Ww8Gt3yJPTkSWc5Qn/mYzHDgYGvmxyVo/oN0PrjiCu7zl0jfRkZ/M/TuZ0AAfB/ySJrruPYYShV
	SdYcJwOEECjZdF1tMTqHCWC/+QHQXQFqG+D4CgJqHsM+LZn7zsy81FfBfO8ZxKcG5aw9aB6f+vt
	K6jK72nG/iVxWju2l5TiCi9+Yz2WDHLapcBqlHuL4vASxSY1LdM1OPqkpkgSfvACpH021qm8TqL
	VSdsre6EBFF1YlW6S8eid3qhjs6g/ulXdovroOiALpibfFT3r+YC1aM8UnfvGoHBbCc5xqM1cew
	ErW+vtpmWznZUDoQ9MH0ze4ngkw0gtDYD0K218GrT0Kn8kbqAabq7w1RcmDFhQBdizagUTcZGjv
	KXxV0YlsL6xfjVNyPbtqTM8DwwsQTXqjaOqDcPtK/dZoCd885A979rbe1/acjYKGSaM3i1zRlEU
	adJsUO182Rza87mAQaYux8qz7sve4A9Fu4ZDy3gGDRSnsZy0=
X-Received: by 2002:a05:7300:a95:b0:34d:7ae5:8d78 with SMTP id 5a478bee46e88-36a200febf0mr1531973eec.31.1793156021726;
        Tue, 27 Oct 2026 19:53:41 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239644efsm1711914eec.23.2026.10.27.19.53.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 19:53:41 -0700 (PDT)
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
Subject: [PATCH v6 06/14] ALSA: virtio: wait through signals for PCM teardown
Date: Wed, 28 Oct 2026 11:53:09 +0900
Message-ID: <20261028025317.92450-7-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261028025317.92450-1-mynameisjune111@gmail.com>
References: <20261028025317.92450-1-mynameisjune111@gmail.com>
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
 sound/virtio/virtio_ctl_msg.c | 15 ++++++++++++++-
 sound/virtio/virtio_ctl_msg.h |  3 +++
 2 files changed, 17 insertions(+), 1 deletion(-)

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

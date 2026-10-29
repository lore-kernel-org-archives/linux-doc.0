Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263868;
	b=i9E2rCnudiX85bxXXQGFYHcfBcATPYUcgkTeJBvQKp1GN4NDzSGVmYwBeMNNQ2wCvLdo
	 h+Po1BFopq1bfHARutlzejvrrf6I5wSGoaqx9Z+eOqK2V6nHwg0sIenrAuz77k52CqVsZ
	 lBRwL0JUl9RO5V+t8kau5XLX3WBdF0rNkOXmCJUMU3Ut45+FweYGYqCPxFmUCl3vjGO+b
	 NmANwVk9sTxQC9MPkRHYY9pLoa+Cs55OwQbGotZ/TKoVp1jn2gbNWn7NJkK6Ljxm6pA6X
	 IQMBwrdoGsMzSZZDwgwMmThJGglxMQxx1y5qna/Yq8gXtCOPO3CqskKfzIbt3J5AoAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263868;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xyRi7XDKpXV1gU6ovNhxbTiviMkA7YCbmNrm8NAAe74=;
	b=pi91QfQ/VUQUXQhUyw3BkgPkPSBfqfBzfRb3WwuMWiQJyYbc8m8vXhWKQIWigSbcMI6j
	 xSuPmYNFReaPSAH8tHNQwQHDVGAFhoXTFudBFXtSfp9nljVVBMR8AFKRb7GBBil9RywWv
	 2UZ8dupQ8AJ4AU3OkxI4Iwfzz+2z5qPbxUOnTl0ZauTdPgzB4DtVZ8/KShvafYp7RCqjr
	 QQXOL9LGUDVHDJlmu5mYFBJilIzdDOezhXv+Q5dx7Ww1aEY+v2BZdCxpaCZJH0o497lC4
	 hHe3KHy3RbaJok4fTLA3c+PpYzKdyaWa7Q+KPU+UYP6RvLBHezFymzOteXD5b+uZrzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EoPtuCuV;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87880606A32C
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 08:51:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87880606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EoPtuCuV
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e9ae391a05so3608425ad.1
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 01:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793263867; x=1793868667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xyRi7XDKpXV1gU6ovNhxbTiviMkA7YCbmNrm8NAAe74=;
        b=EoPtuCuVkfVEiBcmunJ45fuIy4+1yyA1LEtvJifv2/kFEP8VQIvH3laK3v3A1m+Viw
         f/oDeJoJU3I1toYw1EmhQOHFwJkv09LhcX1hqcTvTso1fFfWIjONvGBQRgdXcLKmBKYL
         YVR8A2EZbAhSqC5WruSRkpC+o7Bp9b1uEDbV+JDCQKMiqQ9m7cRSNdfx8WJPg60zbI8f
         ZIFb1hzCj2szq0nC8QvpAEmHgqWWKVc+2BTYA7Z3qiw1n2fCIp7NzVj+wKy3uhKI69bU
         CVsY1U5x9ogqoUlH+I7eac644zJGH6jtXVNYhtF7zw+kJnPOvE8h1SbAv8VIlGqp+umh
         phpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263867; x=1793868667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xyRi7XDKpXV1gU6ovNhxbTiviMkA7YCbmNrm8NAAe74=;
        b=vEDa0dM3XZhGgUrokUX3EWpKqNxDN0dsXwjYPQQSyIiPVPOUil2RNyTGAPGf5DXZyw
         lPrUcx7Q8sAfzGSv7YNZASXfjcSbKEZiA2kz+ca9r0WPe5K2xkvK56UgngKDZVrl3nx/
         SabNpuvc0R2rHNf4V8Hsg54sc3yLb6Ka4iMA9V0CUk2OLMTiAyJUxcaxb4QWcIGH06zd
         osO9iUHYMvfcaqMr1HxKvBMaifo/InywHBnewQY8Rt+STHJrdEHyxlvCz4lBNTbbAok/
         SaH28bGNZjvOhV0ghO0pPsRYXcG4KvlESgPB93H4kgL0h4FMYRACWlQDKn2Y5juEch+x
         okTA==
X-Forwarded-Encrypted: i=1; AKwUvBzqSh0A22HhAd3t32b/R56c3pLD+WtFb51xscERXoB9979AZ6yaoOWaIEshaAa+wLtbgYC2KHhLEU4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVHzScjW5iNhBCtkF7oGNY6FdtQNXLoh1VofCvDy1pOalU4jBp
	mC5zhtTNXdxYE1tFFMORuEsOCkKnh+Zj5iyrwhdBd2BK2s8Z/iDpY693
X-Gm-Gg: AYBFou1+rLwb799QuufGwNWaD/u2LpSFOE9g2l7LkH5HcDWgRBGHdXjERXkvc4/QHnJ
	Va1njRBX70MBytbRtD5AWu+PQxTFRef/zzlxJ9167jBYev7/1JjqIoyZdXUzRkoQlPczqXf3f8S
	3Gerzkr6tsFbwUIpzvbNqmEWWecXV5+lLu7M3yi9NiPlOgRNQGMm3WVaQPvrrVdAifHTaGKm0uI
	ZYMRBYqZi3cnN/PnKtCkxyvqIP+y4luilKWWvBaecj4fnSu1ne2DMxkniEYAQKkdH8dw9WDSALB
	4b55KVlo2RnWVyEwNtPFKmqTqsErw7XFh9iHrSy7O+Hv5yEY/VUXCwzk5vSAa2+j1Q2FslRGikV
	zwbd5x7jnVyGdyK6mIbeUAGMFXiW9LP4Ub77DnX9rSpA1kSWz+NERKkIVLskBI2DI1CvdSFLqgU
	DI9tR2czPmlgThxsKiyqj1ua6FtpKNagqra/RLjI+7pMAU3a9eElQMG42RRf69jYZFuDMeHEQhJ
	0JquG7GdA7vB1qUuFeOJTtHShpQkuaG/cKCgvd7UPQvQdxJccfh99xkZVUnqHsrwNek+f91P7I+
	5TAx9K+vtEtoE+KJyuWyoIJy6fwRTeNrHlHrOi9DTf1Rs6TXG3SHgZinc6bUNcXYthLnVjvlSaS
	JRgTTgQGHtM3AXIX9VCmXI1lGc42SHl+E0V3HjQ0L3A==
X-Received: by 2002:a17:902:dac7:b0:2e8:7a31:58f3 with SMTP id d9443c01a7336-2eb1ab12bd7mr13690405ad.19.1793263866673;
        Thu, 29 Oct 2026 01:51:06 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bddae0sm29991205ad.35.2026.10.29.01.51.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 01:51:06 -0700 (PDT)
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
Subject: [PATCH v9 06/14] ALSA: virtio: wait through signals for PCM teardown
Date: Thu, 29 Oct 2026 17:50:24 +0900
Message-ID: <20261029085032.70689-7-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029085032.70689-1-mynameisjune111@gmail.com>
References: <20261029085032.70689-1-mynameisjune111@gmail.com>
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

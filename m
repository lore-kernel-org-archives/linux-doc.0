Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793981954;
	b=SoKtupRXE1vHBDpLSlClZe3Boav4agBT0Py2YSBZo2w+a0FSIV6EYdNE2gjWkaCTxRbW
	 Y+sXXIj81LPE6FjxlQ/1M07npHnF+q3qD0DT0vM3ZgBySTaf8NwkRljHjyoCVKmcRB+hD
	 JZF9z2jwel4JziZNmR7EZi8cQReMbZvdrPsI5axPWWpOuQUcpwS6lx5ju9rDv+QM3AlYw
	 OzlUNs9rg7+almtnS7jo0iuaEhiMG4NWVQLZDnSf2UBfnQrBuIGm5sI9dQqKbLHLafQsc
	 W8eg4rqgpm5UQP7uIhZeGC+Ve44OqTPJlXu0xuCWNOFiNXcTZjjYdpCd2CfIv2xnKsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XF2VmCDJnpXIgiFaGUBtPdUTCN/KhchAk0nVPRL7Ydc=;
	b=xHlOVIMza9K0VBjrCwuu8wlOhGTLON1mNG+f3xbjo+Ejy5ua3oQ6JsvZuwjyuKyWoVGt
	 0xP1X44h09zGyNjOI9hq9bPh/m+rYuI9xYKATgmF3cMbAlZ069W5DHjKJ5DV5ykgjh+DL
	 hw+zWsLQiNx/9w6X7o1teW29wrQBqmedKNB2qIaqScR9CSzaBSwX68DL1EHg5OevxNc29
	 m01qIKgUTJ26V7emX7NH1ofGyFNkSIdfcJjG0owTA1sk27WJ5L2KkGMY0DjCbYUAK1UHX
	 1B+YgRFyQ3thdFfiEw3sFmx32aIEegkEUhV/Ftceb37Om5/k9jvrOqj2cChWCU+jQ3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v+aig4mo;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B136083604
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 16:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2B136083604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v+aig4mo
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-170135e43c7so1486271c88.0
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 08:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793981953; x=1794586753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XF2VmCDJnpXIgiFaGUBtPdUTCN/KhchAk0nVPRL7Ydc=;
        b=v+aig4moJcdIx7gDTwAhrxMwazrjkxVHCyv+1D631KGVqEJOBnq163hvsMMehOLr8G
         h+Qcgr0+CxRmVkfNxIevdEjAzrTVSco+NLyYvQC8FaRxbDQGqD8Xk14prTmoaF5USwFE
         Kj6Y0Y9sJzbx5jUYaxJ/e5KBYD0OtcGBquXkkFxup/wO7DmUVXPhEM1VltHPdTB7xKDO
         M6FpgXsP8RjWMHf2r+TpW9b96qm1qfK8xPigz+oHbb+rKmBVsCiPyhF4lkFWJU0f+g0L
         gzrrlfl5wbQcj1qCuaK+stG/35m2W4w4oSVgElZzFK2HsUmXkes2g0TWSgdmjgfowuRR
         QaQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793981953; x=1794586753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XF2VmCDJnpXIgiFaGUBtPdUTCN/KhchAk0nVPRL7Ydc=;
        b=N5qpi+AlyXZOBPX14H43DACBqJM02C303aHGleD70EQJ3l/aPr6bETvQlLvCo6ZxsC
         nyp1AcXd/eCg6nfsa5iDRTiXHd/TIcXsXBb7A/Lzo49A6uYxD3QbpAHjuNTX9reMYvgG
         FaQGp1jBAyi/WIu7/1PH48KEmBrOSiGGoMDtLxoQ1MlgnTcdyumd4U+nwWBoTAtLMgWF
         OsuHZlU03oBuaOmCSj4jtGsa5vogbmJVNC6pe7SLmIsg5i4Q00M35o+pFNVwXZJSh/V0
         WAKEYxgcpCTZsbz1tPaX3Tgy5YOTdXo+WL/Qsrxbd4G3THexn07CgbKqW+bCI/B3qgNC
         BJDg==
X-Forwarded-Encrypted: i=1; AKwUvBxoaoZFgo1+VuwqzRbz5nwoaf/4AfU+lmYLebo98fK8jJGje7R1NWs1uAHGHawa3vX45extpa7b8HI=@vger.kernel.org
X-Gm-Message-State: APuU4Z824eHrgkUjIQNBUPU8O7+7c0UGRAe7erRIEQTXQki3uQVplhYk
	seUjzHfKUbQ32JUCeqL1xLdxBCE0PA3waZxX27rLwxG/lnql1n+oyiUM
X-Gm-Gg: AYBFou1Ep2HLnXBHCba/2Vx/ySyA+2+AUJBMST1Zy7/5MM/nUTc9ZZHw6iInOD5V/vW
	PvjA+zsvLIrU0ATr/hUocFOyO3GkL6EGLe0v88mw1IznIqnHu3qbMMMcJxAitzi1gpAH3V/Dl6E
	lf00hDdGzn0BRGnTtRP16d4aF9EQEpvI+9JMylgpd0b48bEpNGVBki9GOzWiM8RaLCAuaZDI/5x
	z0AsEhsi1USA8ws4SnusoTFAN7e5Vvanny0gZR2RoISlGibfo2RCXvUe2RF7kwYDEdAVQsD6cjJ
	eVIoXea33r4znuCBqgiFSQt20KHCFIttMas9d1sbnv6XVbuw1hs35KKHr1n8IfRqyTRN05vqyWy
	MN0Xdr9Y9xuS9/a7Wa8INxwh5i6ZtRxPO2Y7jKPAwSgVbiYKCKOF7nJAUlEuPnZrxgwOab4dBUR
	wdq10ZBzgCnYCRDvOxX/6ywBQoKNzdImYmPAC005d0+Qapu6YxIeVzBjn1YI9WMZ/EhcvBwK9mr
	dJtbqXuxqjURGDJti6LclKUD3scpCfmDhdH490/nnUC7GPnAh5fLIYyewpVTrkNhlIM4yNER7Kz
	DKB+4OaQNM3P2F/8+ZOqaVHbcUAwioZKX/5ot+ByXlV+E6oYS1lVsAf/s/nIXaU1H/mWbOJkVAB
	AYPxGzIPe70QwzAGeHGp67BTdVYt/VN0WxoQE5lfE9uBl1w==
X-Received: by 2002:a05:7022:ef07:b0:194:9e7a:3ba2 with SMTP id a92af1059eb24-1b25d29407bmr4211846c88.2.1793981952881;
        Fri, 06 Nov 2026 08:19:12 -0800 (PST)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4840f3sm13139526c88.5.2026.11.06.08.19.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 08:19:12 -0800 (PST)
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
Subject: [PATCH v19 09/12] ALSA: virtio: wait through signals for PCM teardown
Date: Sat,  7 Nov 2026 01:18:35 +0900
Message-ID: <20261106161838.94308-10-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106161838.94308-1-mynameisjune111@gmail.com>
References: <20261106161838.94308-1-mynameisjune111@gmail.com>
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

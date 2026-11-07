Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794062099;
	b=Jj4jRCcPKCgdxSkLy66tG920EXU4SnNien7yo++rgB3yIWzqt8zNuN9IVa7y9dZYMIz2
	 VIVX7BV0eOW65cWZwrtlFg4x8E7wAyHg/p+fvN/+o/MiFsYqj6mmq+KfArlEdYOpZScwU
	 8kuYMV6aDGxvQpm4RS9/cMAKxXmhNggvrrOTay8ocsGLVS40egFugO1Gvonk7b7vYhDpQ
	 wt82QAU0saG9Nyv2WZtiWxWnI22bobKPUUvP+r7+rwEtLnkcHVUC1PLWeZylEY69464J+
	 EbteGp86VxYwLrkwS4hvqsTgmGUws6O8bCW9VFFYpeURZPw4NTDofib0uOiNoe+SYfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794062099;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XF2VmCDJnpXIgiFaGUBtPdUTCN/KhchAk0nVPRL7Ydc=;
	b=3836Pt3a+Es3qdauvmNAgJDa7b6Rs1vSxrMBYEW0JItGKqvz9rMV5T0vdXUqc4GU+yi7
	 CcdchPudXhNwMx26+VPopdxJ2RYfTU/7GRiYbl/PhXa/VjQc3vihCFUeiJ1uW4V+iwKgR
	 Ee4ymo3nxh3WeR8YVTCXw47oM48x/uKhY0ZkfWranzmCqAKReZVXSqIAgHkiGlJ7sGl6c
	 pCvJduXcik7n3itc4WjPbgkAVL+sm0H0CwrRy2jRStEl6ExEvkoPOVz/cXsYPo57x4B43
	 6IkO0pd6atDuiAYJh8Z4RQIOXrLnlELhjX87C8WctemUYoqwk3R0jw+WWke1phNCjnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="0ChFYZb/";
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756F660A2616
	for <linux-doc@vger.kernel.org>; Sat,  7 Nov 2026 14:34:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 756F660A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ChFYZb/
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-37071c0f42aso2156330eec.0
        for <linux-doc@vger.kernel.org>; Sat, 07 Nov 2026 06:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794062099; x=1794666899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XF2VmCDJnpXIgiFaGUBtPdUTCN/KhchAk0nVPRL7Ydc=;
        b=0ChFYZb/ar2yjXHgRksBmagp3HbaVabr2QfVW9adIQnbO39hQg1kWHUAefGnan6qsh
         F0Qt/9pNqleGjL0mNL43iM+/IQ1IBAO73gDVyCsF+awUX+yRrtM4QH4ktzRyUAdtm+Ki
         wI3jZV4J0W2Fe5udlO5T+KC6heSjlaI9c3TBa4351BhrRk6Jo2x7sGqyw+4qNY01NtII
         vXQvJ/djxAjYHISKMqthnAtg569lEscKC1DpMlsPP0EIcvAV2BfB9lQZpUKDVSwDX0W6
         mNJXRUv6Pm3ltnkL00YPGjN6F8X5NX9BhjQmLCTB1pqhKqJrIgEBaPowbwvoTJ0Fh9nS
         oAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794062099; x=1794666899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XF2VmCDJnpXIgiFaGUBtPdUTCN/KhchAk0nVPRL7Ydc=;
        b=fZHk7jjhtO/L8rygrDTS7e/+/bhlGBVw3I7T3ZE74tUa0B5wPphoYbHbGI6odfuBX/
         25lWXkjWapzDiRVITdKRFI3jpxYG1gGNhVZEY9zZ6QBnR5M4azvZKvi0J35R5XBpgkLd
         WKGLVzRIv6QNM8Kd1V4g5b5OHnCnRuBoxvE0nCkapNLYGetOhNDYzmHhr0GpTOz5CgWI
         pmGDkbwmHN2+m+rtn3HcNtVyGQ/gQQbRAbDKdQ3ePOxOy1KpRrRN3uNdRY5qZHDYzaJk
         aoKpIqbdTLIjx/o4nxHx8rmS5zwHkyXR2xOYWRuwmfNzFrYHTFp6FRlFImijNdYHp/Ah
         OkOA==
X-Forwarded-Encrypted: i=1; AKwUvBxXQzjiY0gKa2XlkkdkCe/mgSC5uip7lTLrHumzdE6Uhbo/b+H2i0ZCuivdH8+hqlZbHEVyZVaMeBU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DkcDlqoH0Cjti6bbDc8n2+l2rJdEeUA6ysKTl8dK8GECJ8CGU
	+JwJK9Irec4meU1xucDIXja5gEELmQ7CvozeOeTQAsovYFWEmwlwb3TD
X-Gm-Gg: AYBFou0c7OEgVR0dNH22x6ZdPW7MgNCw6HOqHIgnKX02ouF5oQn7hbfLROWszrQkpqu
	bFOalKQ9iXAkcCLQR84iniYa8ZxqN4rIzQF3uPXnu1Dmp7hB76YYZ//M4p+Ejnv/x5IsDCYTZip
	mHc7bqiQJP7aC5mJ+gszQEdtPB0CozQTYYhtScBW5wG3Smhahl4jcp+mdNGo+B7GxaeDeCZc8Nj
	cxwFvnBGUSlQrBK8QVT7Bnf2jqUaMVZwKI5zm3U9rl+LK3otqzNFp8P9lxCc6INcS++ORvz+zad
	NhdNgZ9/Idj3ZzDjloHJXZV74xHL6Bb/GtMfax1pnAYdpIKPnAXyH9z623aQktEkCUAU4FLf/nz
	mzUp9V3kqlXJtqZ0C1A67RDGJR8bTt3SqeeZZMCiMseSf/tD+0Z6O27nzWVZHCcnNMcj8vpbyJW
	Lp2IcsHAEQf+FBCFLZL1XyHT8oFRJWFYz+7GditYCfy2OSxLLTlczPwrdxjKtKQda74Q52fMVkt
	nwsdpXSo8HEEsDiinKBMB+rqq8jZxelU98jyldzroVumU4O9QAiNI+GdviSqolZxwb/w2sAE7gn
	YWHebzWRuk4HN8K2nzM2Z0qn+SntsUXUeYJdIHLOwCLlxGwi8gsPfHAEkPjHNvk3Sxdmt3PUJgC
	gFzIR4eQzlhB4fOHybRqjRZWLispBNRc5WJpqdCLca30ysg==
X-Received: by 2002:a05:7301:d808:b0:36c:9af3:2309 with SMTP id 5a478bee46e88-36f6f2a4632mr7502669eec.0.1794062098568;
        Sat, 07 Nov 2026 06:34:58 -0800 (PST)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea75fsm27881873eec.15.2026.11.07.06.34.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 06:34:57 -0800 (PST)
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
Subject: [PATCH v20 09/12] ALSA: virtio: wait through signals for PCM teardown
Date: Sat,  7 Nov 2026 23:34:19 +0900
Message-ID: <20261107143422.29319-10-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261107143422.29319-1-mynameisjune111@gmail.com>
References: <20261107143422.29319-1-mynameisjune111@gmail.com>
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

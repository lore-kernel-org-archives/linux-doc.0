Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794267691;
	b=uUvxFPDIJPjAyC+tQwAcLpR3o966oJdX8V54GLmczHnJI0SVNTd1dZHAqb7a8fYWivTz
	 c/zr/DYrUeFwi2L12kSLXlVqZFRW1Zv6jerdRP84LvUxW0kZI+sSe4DChW5siBJSNTTqy
	 OeHJDE4rBOdBEJCHLZTbOyy1t+ZXFVsV94LsNoNOEk1+XI7m75WWuLE95HkeqrcTQpfdc
	 6jAwNSjct7kPe57GiaCsUZk2vGOcqP+saTL585jdB65gT+f1gf+v2ZmT1NEy/Nflk5BRW
	 OK8gNM70qosQp9bIPvJmYBsguPq0FBRQaR9LVL57XACFR3Z+Z+jYYJE1vcjJmrZwZsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794267691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Da9OCm5N+tM292Jb1wkFobEcv5XsLraXLlVZUfX2Yhg=;
	b=anLdBolRcjWxNL0JiOQYM5t7opt7VSrscdAgDflPcTPGY9Jv7ycBdng1zuIlGHR3KzDO
	 9vDeF4MD2vN6gvrQwV1fH21niY9R+dZAuQzLx4MulLwCT8z/EPFQKFHj8VVHCGr79DjPE
	 sPASciGfq9D1EtMRIsLGd8I6OFaKXTNQTOYk9L8cKaxHinZ3Crut5UHjEklPGNPnqme0w
	 kTMBO0zny/Meh80ItlI6L6tIihmqNOvW1GwkaXLq2xSdWJCbjXADCRSyprlvZhoeHSSuJ
	 NbdE/q0imxXqnpI6kEPX5hDQZ2kf+3lnZuaQIFj8olwOV9C4v6+j1R8QHnWeOkyXLHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="TGg3a/t6";
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E34360A2602
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 23:41:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E34360A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TGg3a/t6
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1931ff67a29so293838c88.1
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 15:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794267691; x=1794872491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Da9OCm5N+tM292Jb1wkFobEcv5XsLraXLlVZUfX2Yhg=;
        b=TGg3a/t6Pyhz5ZdX3BaHKb9bSxFcvLef7RTKBK5WmNyqmcJHu2YNsbdaSpD9Yr6Rr/
         MYENhkAUNPdIGssxSy313cz77KLqlbBQLLSLkdvX8fVXCeKqt1WZ7af4Fg+nKy4+XuP0
         pllkW7K6QZcgJ+YBm5aMdpRmT4SvDKJs4yjEvTxEeUN7FWJHtrPZczF+7yKuPu7W3yy+
         whezUw8lMFNZx2LZdiol841ZTGALZ3Q38DoFzbO8HZ3urHzFmQ74b/mg6VqvVUyXSzua
         0HWk7jWO/CeEfzjEFRQxopjIVbXdUXNzy6yZuaivbcZ6Xe/kEAnorn56GseXWpTYin1s
         qKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794267691; x=1794872491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Da9OCm5N+tM292Jb1wkFobEcv5XsLraXLlVZUfX2Yhg=;
        b=S0OVMW2sAiGD4eGJLC17vSUCERvtmFjT61lzBze8GqVp6KbQeJoIrBsj1Ddb0M+T3P
         B34jRN4rk6J97/Eq9aoHdSiiN9mQVjeJGIdAGjj8uFRYSbue09jlT7VvkgjA62St8udJ
         ywSbAIASPMXVAMbfVSsS34ABKu7Rwa/V/r1JVGy2OjIUK4QEU00uQq2tLIUlhblofw4k
         m1o3UFwcfjh5FRK0Tp+FpRjfZxHAFL4DmROUebfIg78DOTY0exG6tzV0Htapkzfiptnl
         g3gKhdwdwGNMRnr6V0Ujz84Ca/k1zLkobO24u0NdLWS0O3LSTYINADYuI/1+FdLNA1zp
         aIAw==
X-Forwarded-Encrypted: i=1; AL+hErGaJ0KBMN0Om0FhXJue1GjHBYSp868syelRXNS5ZGronzI4hekLKe4z/9C0Ou3JGUQCzj0ZSyHNZDs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cdqHeXOc2jMPzLYkWjsCwOqqiNgkp3RoUKfKKz/gqkIAQSjqk
	LtbXq3cy7qOBq/DFFgkgtyvDHXFFxw3a7peTUSIbWh5ILBt6V1SAUwC9
X-Gm-Gg: AYBFou1KnL+9AnQ7BDT1Iwo79LeVwEMrL2ntL6dPzB8wFDtcmDB9rkCG+K783HBJ8G/
	rgiG/KQXUMbQ01giCp9dKB59T3y75f5aVLDVAsFBQ4ELgI5uryI1T0JLhPGYMq4TuRn3yl0rGtH
	sEvvF9OHswOgeQg1MlOEqdROXpiCD310+sBK7ocR9ocMWYgReml5Gzss3eWEPfGFG8jU3Rq6oVM
	J5tNJWR8KGIlZnXw+lKPKZIfV8b+XKElOyUrrBB9+NaX1OqitXdY4JQs/B4IdJqs5LEDDqfdOEq
	b6eFnvAhn7VrgiyXf350Ttl1k2Q9tArQOHkMB21AMNDSo2gh1Vt7IvPkCBsTMics/C13ojrDO7t
	F89foPfEBM1Bt+7wYE+cabIg8TJf3tpRCu1AALS2rdcgBIgOua00La8TtNYU+0jvFx+i5msibvs
	CUuZjnVyPYmZ16n+QdCPAPi9O5SL/f+9BFRWS7Jp6ivFfdHlGH6wsGjb4F5EEzMnihFrFt7j0Rg
	UADBHyo//3VxTG9amulbo1qICxVNZ0sBajRXiL0b44QAdjOdrg7BjvmMAf2+laxNnGHMegqvs9z
	7ApbEbkQ8z+uXQdK2ZBLocFc7Q2PFNtzJ28EPstGAFTkzRpYRZyClgUIEvBhEIn3hVCWvsg74B0
	HNsE5gSxaRi1yMQnV5Qi/eKO5XCEBPkLVq0UcQoU1TT6v43A=
X-Received: by 2002:a05:7300:d195:b0:36a:1d6f:917c with SMTP id 5a478bee46e88-3751f55f74fmr1066564eec.22.1794267690535;
        Mon, 09 Nov 2026 15:41:30 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm1739049eec.5.2026.11.09.15.41.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 15:41:29 -0800 (PST)
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
Subject: [PATCH v23 11/14] ALSA: virtio: wait through signals for PCM teardown
Date: Tue, 10 Nov 2026 08:40:46 +0900
Message-ID: <20261109234049.79534-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109234049.79534-1-mynameisjune111@gmail.com>
References: <20261109234049.79534-1-mynameisjune111@gmail.com>
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

Keep timeout and wait results in the types returned by the kernel wait
APIs.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_ctl_msg.c |   19 ++++++++++++++++---
 sound/virtio/virtio_ctl_msg.h |    3 +++
 sound/virtio/virtio_pcm_ops.c |   10 +++++-----
 3 files changed, 24 insertions(+), 8 deletions(-)

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
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -20,11 +20,11 @@
  *   (RELEASE command in the ops->sync_stop()) and the ops->hw_free() has been
  *   called.
  *
- *   When the substream stops, the ops->sync_stop() waits until the device has
- *   completed all pending messages. This wait can be interrupted either by a
- *   signal or due to a timeout. In this case, the device can still access
- *   messages even after calling ops->hw_free(). It can also issue an interrupt,
- *   and the interrupt handler will also try to access message structures.
+ *   When the substream stops, ops->sync_stop() stops and releases the device
+ *   as required, then waits for pending messages. A failed control request or
+ *   timed-out flush can leave the device able to access messages after
+ *   ops->hw_free(). It can also issue an interrupt, and the interrupt handler
+ *   will also try to access message structures.
  *   The messages retain references to the PCM buffer pages until they are
  *   freed, so late DMA does not target pages released by ALSA.
  *

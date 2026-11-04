Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758706;
	b=XNom4GAsq6RcTA6rClswEZWHVJGH/+CPZb1Gn3ufLJ4PsT1DcrEthDjSeKuCJIEtSwNv
	 j+2LsUQIS+/WSXePO9A6phdx+IMX6EZg2lnUEumGkGtcpxKp8mHlD1VuZ/kYQTCCBhYqU
	 UxhOWLnLt518FsSohwzHDGC6uNlVFwBPkCZGXLlMGLTZp2CEMfzM5KL+Mu1iFr4oZaVD7
	 A8bE1CSJLxN6q6nQU1rcpf7S0rxaNVQWElNJRYJAXB1NNthLUn3XC9dtdgiHN9LHNlra1
	 srpSuOWuVGndiauc1BVVlV/sP/5773qZ6SlpD6ZtkYN8/o2DvDogjDZHs/NtJ1Bt93w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758706;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Hy/84DnLRHSkLYr0y43NMukCMjMkWuzO7+IZ4PjZ4VU=;
	b=vpz90YBbzLTQIVUlsonO/ktDnPj8bB6Z1VltPAYXDM07BHReM6yf04fHzm7Ftw1dQLy3
	 AsUqStc+sGyTl9K658OsPiTYJNp/PEpp96ri7EmpTDmO7D+SFxuIMhAY+1MCF71WpirAR
	 ou8Nvdv9Gs9ZqxiC9C6YLRbSkLmn88hvJ3bv0xszCOCCWue0RFQzaq+U/7r00sdinBORl
	 y63HsQu9lmzqlAqbb0DfSHAGMptXDgrfjg6fKyL7fFHna5YCUataNY9Hsq612kFTTaaOB
	 sHXNhB/p0zJe64WdlxGELawT4rA/essmDJuaY4lY2nM4NzRwh46NeYAklSoY2h3agCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Y3o/CCpf";
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476F6606D807
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 02:18:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 476F6606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y3o/CCpf
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc147d86bebso71519a12.0
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 18:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793758704; x=1794363504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hy/84DnLRHSkLYr0y43NMukCMjMkWuzO7+IZ4PjZ4VU=;
        b=Y3o/CCpfCiBQofPKM4Ywt8dc7DFmzbyUfKOWVrdCUW5tyOO41UUzmvQ+6Esg818GI0
         IuBUALQkirdwq5/BeanIktv80xC4d+A1y38PxF71Tg8yvD8jRU5GE6nzbysHTivnh7nB
         p5Hf8GDtgS4rsEyXCzRVf5zlCDasVYfrJXuvn7bui67frp9GBND/AfjuqA6NxIwDTAsu
         nAa2n17352M4IpomjHxS1w6vRYYIZu57gZbsnmLaFWtDs8CMWf4q+dFcNJFYrV797s4O
         jcNQjId8jP0VguTH7xjBsU7ReStMAJI1yJSwFc2KnP3CHdZv8Ykvf296TRluWTqbQ1tM
         9RuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793758704; x=1794363504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hy/84DnLRHSkLYr0y43NMukCMjMkWuzO7+IZ4PjZ4VU=;
        b=T3QcfjtGRuUz7NKjVnVSofCnDkzsvuZTc2Hji3veBzHiFlxWSoVakkG8fJPDeMcoK4
         eguFzfftp1IAJbh/iwvgqt1vWinZNV9w4LpzaHu/jB+KEqVZhb7Lc6i1JQ7iRJiODs3t
         +M2cKVbVKVL/YjkctNMbPuc3T4YQuieTHokeUWG3ayiG2swQpZc9tI/S9NtjsAh7S1Hl
         ykIl64to+OBRG4VzBoBm3o0pbjoBAqUipaycs4sumKub6oL+7y2Z7CQD2jOtIsRy/4gS
         EmgrzwIajw8r4sYqQPgYE1/TeahUUVQXDZn79sA0nvAv4N6K0G5EPN3w4RX8SKrv7MVo
         L+xw==
X-Forwarded-Encrypted: i=1; AKwUvBzk53FlTHfZEH8JLwrprY00P5jrRpHqkRQyN8qYX5zfSIIfs2EVS9WO5UjPP28T873a2meKq3z1REU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dY9O3S4i14JyVZpUbDgDMN0dcjDz0XKENtWFp/lW9Cm5Mds4L
	EZ8YMh7aTDC1dk46NoqesTOUDSNmzQLXcOdlkz53Nj3HNSGfI6/LKC8E
X-Gm-Gg: AYBFou2xJ4thW5aTa52ldayuWcGgUrP/EZG2P5Ru54t4HlpL+cSSkbEMLJImoy4Zhhp
	M3ZEd8jJN2/drzEwJjJ0DBvrUesN5JCSAPb5a4t7xPsYe3AKl6AKjj6wAlPqaiFrZWJsXUaxV5P
	TaprLTeEyrslJWihAaSFHzF+22PbTLCw/Q1To37K1iHUZCVr3lwvPwRD+iuHPzCd+kWOYrzrH1h
	ImKXkw1Ts3DYFky9oMbrkwsprTaFaHluNNtWH0qmvXoIOxZm9JXA/rZzMoesOCBxj6+598wD2sb
	UBwlrBFEtYAPqwNZxr0/7ojVlMCtrh49U+8e6X+bpVImQR6KwhkfnOM8WWYAH/R4JrdMKepNy8R
	5loCWi+027Dqmca65D/28FZgQcsNHolNbLcdCha5nbHRteLUEkDoG3F1wnEk7pRDS2/ynS/RFQ8
	QFxF7qb+cds86fMfD/SC8eRc4JTseA5+sQTqykKHhGZPfevXtCrNSHl1A3WvOnJ1UgBp6u3N0rn
	mUQ8nATXykCb+Ip9erwRsSa5NuOognQLM3a1q5/y3SKd1rRdCnXGDtZNYn2DIczMCZn8flPXt5M
	Sp91Um7P2xux+9c+CObHJsSbGkJtPqI0s/TkkMCOyNpP6yFVxRcKeBIqb7hcLJL5kupKFHCVIr8
	fVk4LUeWZr27xqd5YZfAzccjWc///hJLfLTcIseDoPpk/0vM=
X-Received: by 2002:a17:90b:3c08:b0:3a6:e159:a229 with SMTP id 98e67ed59e1d1-3ae6f0349b6mr11883081a91.49.1793758704355;
        Tue, 03 Nov 2026 18:18:24 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb46326f8bsm346131a12.0.2026.11.03.18.18.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 18:18:23 -0800 (PST)
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
Subject: [PATCH v14 09/12] ALSA: virtio: wait through signals for PCM teardown
Date: Wed,  4 Nov 2026 11:17:42 +0900
Message-ID: <20261104021745.57733-10-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104021745.57733-1-mynameisjune111@gmail.com>
References: <20261104021745.57733-1-mynameisjune111@gmail.com>
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

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466233;
	b=M7RGxQt+cC/zZEbw/R/FTekMTf96dHlPafTvyD7uusD8T28oGWO9CEuwnWxnhfED2fkl
	 qMtaVWXByNAaPValRflsIXhtaqd7RZC8XqB8s8vNW+FGtKay5TJNRKZZWcFIEumVvJEV5
	 f1NgSWeNUPI4MFWIzu2BY+7Wvndb9fEAyzyjTznWTkV6XdJxufTqV1RyDNb6uO/He7ZNV
	 7HWrDicgzRE9VUPxdYBEfeipOWHrnomovtCHx/BNe60PM63x/duEthj4M72dUv30t856F
	 qqhwwQQ5tS8fDoOOQrDzz3EAJIMvptpUsDhBNMXSxPncPhtxCflKDuQPdx78WlouTww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=928OJa6yQ8fSO4+CgmYur7LQeG2ExiIpndY6iJl/WMw=;
	b=XBAoDjf9UZwlyvSz0GVYVXxcdq2mqt1rs6mRxKMHGX5LQJzTdjB/38u7GVzVmuLnkaY5
	 L/Ngk4wI0FjoBiZfkwHFFxTKIg0952XNI97RPbcvdiF5hoVIWgFahWD6SsGVy+hlB0FzQ
	 VDCZXwnhNdOzScNxavv3AAFIQTCCAzma4TqjzDb+qZkgELPWK5MgVCAGvWgtuJA2jFIff
	 aqL/z8GI0/gOQti3Z00OiKii+MJSiVBfAaVUGhYZ0vcCsCrMBxKd9s3scs6MEccq06ggk
	 F1T35tz5x7XAiuU36GxqaxITjIUkvc3ecEnNL4Th+XrD0wZRW49VRH+3oIEucJu5boA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mQTqTeo+;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD777606A337
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 06:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD777606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mQTqTeo+
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a07078200fso1582605b3a.2
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 22:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466232; x=1795071032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=928OJa6yQ8fSO4+CgmYur7LQeG2ExiIpndY6iJl/WMw=;
        b=mQTqTeo+OA8UOtvGEEgRIRP82v3t4AD/fi9nfPBAHKbDDD74JZlPFfT3e8rx+6RFXO
         Zipc83ZjfSvnpucakHXKd+Jjhe2cxuH8mqfcHch4T97udRu9IxarhY9ZWkNmUFMFX+ST
         rVvljvqISdYmrOGCROnJ5lpvb9s1GVU1okLNwkMsYRYfxha+VttBUhhwoE/njGl6uoiQ
         GW0UG5/gmyWzreKQYsI7H8nm7u5M14oy60pT+xCzYYRKqW8S9a0Q1X4b2cAywHqje/kv
         HJo0TcFN21Qv6wxezIyLW2ULguyu8bv5BSNf2cbqPDOtuFRQAU0VagSNqOVZKlfALk5n
         k4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466232; x=1795071032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=928OJa6yQ8fSO4+CgmYur7LQeG2ExiIpndY6iJl/WMw=;
        b=P6DOvLAMR7NtCOZwVnkmsp0llsvMIXIhUrwJl02HWxfJQxt9jiiBJ0Hh3EroDBXZEj
         zC7UxTjpOn+tJGMMjTYIeionAHkRzRWDb0fqnFMscuLQYLCowNv3M+SemqvBBYdLYH7n
         wEurkh0C5oleW62cDm8Rfy88cdCxPbS9nhc3Q94Dy/VWDJxnhxC54i9c9tps5FAIdLfQ
         VNYAtMpUCmU/BznRtsUj/d2ojI3MuReJRQhhm4r1b+p00ZnGP/rD+3KjX2lAGguyFTRY
         /hDbv1pT01NY6z6TOfivTJfT8z7qqxJd8EsnIJZkp87Me0L4+wEDipRJsr1UzzJRQrII
         qZcg==
X-Forwarded-Encrypted: i=1; AL+hErGMmsqVMGwk18CmVE2dqB4uoe1r1C9Ml+K9N5ylIO1e4XACmv6fWyYCyfd3gXMCfPTKyHwmZgYOzfo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zJDCsY+xuUdOBatu5E9BcOgmHxRMmYWOSq1unt32ltUp2haQa
	dUDObpP3ucV00nsDMjPQ/umALWnbHJcQQEgz4F2b4j4/eqcm0ouA56t7
X-Gm-Gg: AYBFou3EE8oJKGCq4SiXwL4XhMHmvaTZ7x9zTWKuOU0KRcO/quSSEUN/a/mHDUOmf17
	KBmiaDiGz5BDrX1cfoV3FiZd26w0LOL1XXfvhCCpW6Z/55xcZt5YtL1qZ18zpaaTZw6iBEfh40Y
	v6IP73rqr5rL5dHLndfJQuAjZUXqeGKh2xsDFUd+z1eQde4h8YopadvkvDLcE1Mh/7Hkz9M2Z96
	vFRFclidxHxWXdWutDkPDN1VurYx6r2DLKwYvmQtEp9IHDTT71cF2ahOM4u3N1TrRQ4GyZvcOTX
	5KxPHswb2+q7EP1emfeSPSjILRg6pBG9DNQWtXLT+qgGCFsKIAnxfGxnb8yZDQe+qQqtzqMlLru
	s48WWSeB1UW6/ibEJ/s9KlTJSPS7OGsIwpQzqws+TjHzNaK0jqGbqKaSQlYCQVUDItDpdl7bTzW
	TJ2t7fxmBHY1+cddvUSUX5Snzvg+yHBmZpJgU3ErTigynWJ6Zy4hLtGsE6icRxkYbNtyJFv2EjZ
	0ffORh0N8oQZan1sVdEamP5m2Ry20d2hEjmJ6Yqfsvh9XgUFb3WQxu59pIODtKZAKF+cyhKQULz
	rPmwGz81VuivjCF69x8G28F0FWdRqKuFzGLhI1/frE6GYNRWNfI2erIgZzYUrn5jezVwxpbYYRw
	CO9DpdyQBkIc6WpQRCybuEbgIclyh8hlTWhmyRGQKacXn4Hs=
X-Received: by 2002:a05:6a21:4ccb:b0:3e2:3222:2559 with SMTP id adf61e73a8af0-3f2ff7cafa4mr5180122637.62.1794466232303;
        Wed, 11 Nov 2026 22:50:32 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab1228e2sm3097511b3a.41.2026.11.11.22.50.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:50:31 -0800 (PST)
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
Subject: [PATCH v31 15/17] ALSA: virtio: reject invalid playback completions
Date: Thu, 12 Nov 2026 15:49:27 +0900
Message-ID: <20261112064929.11211-16-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112064929.11211-1-mynameisjune111@gmail.com>
References: <20261112064929.11211-1-mynameisjune111@gmail.com>
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

A TX completion currently advances the hardware position even when the
used length is malformed or the device reports an error. Validate the
fixed status response before publishing progress. Retire the request
once, latch XRUN and schedule error delivery while preparation is
active. Keep malformed or failed transfers out of successful playback
byte accounting.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm_msg.c |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -1011,6 +1011,17 @@
 
 	/* Playback requests point directly at the ALSA ring. */
 	guard(spinlock)(&vss->lock);
+	if (written_bytes != sizeof(*msg->status) ||
+	    le32_to_cpu(msg->status->status) != VIRTIO_SND_S_OK) {
+		vss->xfer_xrun = true;
+		msg->length = 0;
+		vss->msg_count--;
+		if (!vss->msg_count)
+			wake_up_all(&vss->msg_empty);
+		if (vss->prepared && !vss->preparing)
+			virtsnd_pcm_schedule_period_elapsed(vss);
+		return;
+	}
 	completed_bytes = msg->length;
 	latency_bytes = le32_to_cpu(msg->status->latency_bytes);
 	vss->hw_ptr += completed_bytes;

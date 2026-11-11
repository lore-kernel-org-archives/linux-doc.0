Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794365869;
	b=oC7/85Gf0mYdREj2F7GIIVytp/r4amUdcxqWrgxn6X3tuHOTf3nD5CTRPIMXZ2YhLRoT
	 wF5yFWs8bEpsANzsfVaeugd76v+5KDT5V9FqBPQDlOZRveIgh4XRVe6aJm9dnZ3P6v/1u
	 lwWrTi5XlWCHBtbzQYtvGP3smLpp6YGoN8HEvpbvjw3BfE98sVcM3hAEEo66Z7CF5fBB2
	 188zVzJ/2ddWBbb0qR+u024+XsknDtsB/G3UwR3Nc1RkZ01iGYAl7Dw1Wo8YE/uskhOzX
	 zWz6aF5+hbNtPoThm33u76txh+RIK+29UbL09wJcrCmcLnnMmg5DX/c+KlucJkhH53w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794365869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
	b=c05wu30Y1CWp7keh3J7LXdeUXe2jtH9V9YPCt6eFdx8+yDw0pJQxYWym5Fl2SHl2AZno
	 PJWliuCI3SV7oq+EcE+Z+pKpN3DSowYSdlIHW+PkZYtF0OBJ+Wg73QjSJQtOoLDR75iBh
	 puov1qqpGVQ0zpKWOr7T60B2De7bzeq4RkEJGGJFws7JqgekfBkr1GX1biy03IPn8FioG
	 Tq2uDU6hmXcGXNiiLFtZzR1G86Gnk7nwpue9XT1u0YYE1B9JkNfIlFI54twMV9Y9X2eUL
	 wXxHgkV+ekutfvyCrtpPFLLaTq5dkerm+NoFc1rjgXujketqTBvakZT1UdQmu5k4Slg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wIOXkCyW;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3626F606A33C
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 02:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3626F606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wIOXkCyW
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so5399197eec.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 18:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794365867; x=1794970667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
        b=wIOXkCyW6D4e38mrvp2Nhg93rnQuF2kUYK/nHOLMusrVKtSbi1cOvd80plSMPUALMa
         ns/7ufB0dgUwTAQKxepctqMwUpjoiG32qQ0khjMnpyuu402JP5aeydika+k6XFFBnzNz
         jn8I/jxUUcPTLGPvr5jTDGX2+rBTe4bK9CkLg08ve4rPa4l2ChCaAXvBZ05tkINhOh/M
         jPKrm/6poiNe1jKGRLTuaNeENEDIbx4sD9/YtB7zCAcX74OK/YHarh7lyzoKFTY6ZKb9
         suU+Kn6q56cRxD6DA1M4EpdVdiWBBtbC0xCTZjK4QZnpgkJlxpQzBv3u5IKw+RUqj4Bc
         qkvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794365867; x=1794970667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
        b=fc4NF9zB8NYmgUwjZGPx5LNMKtmzWuYwaRGuAQWR1vu0ClGXWBiXFV/K34FyUYC4o3
         qyAofR7Rr8WapdyOqkW1+MMwAiKrYLb8TA8J8oICKYy28V5kKme4C7Pi3zBkHozQCKSQ
         9Z/GxYylB3JdSnGfDMyDvoIJWWpj6s+3FE+3ynUKQ7QCAUFkEdbY1CiCz420osSet9Kg
         Rnm28E8UoO9LVw53c7VMa5krjxLfxbjW6+TdQDOajvSJ+PnMkMW0aAJEpC4e4puUEy4N
         Gi+LvqjMwscdM3DT6oihEPLhigY0MEMR7Mlc6Usj+i6/YxdyHUo72mB/7da7Cp8GCRCd
         cypQ==
X-Forwarded-Encrypted: i=1; AL+hErG19YOScbg4+LibbT4YmMF1Eu9LvXOffZ4uutRVjoC+JG6Nbc9w5nZ7GL6Yv6LuwlHIQsjDhRCb/8k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8F1HWUtGChYDEAkEwzU3nvjzOZbVBVuh7p8QgYtXifFz/ie65w
	ssnlbdDc9jucheqzdmNUhi8OgqtYVdxQZXUKNexKKWPK3rI6tZGD4hCqt2cabw==
X-Gm-Gg: AYBFou1UuWparqcY/QRx0uOAvAbrOoYA6ZCZWILQEkC5Qa32lj4xGjIOffYIi68acng
	byoKNbBiFmxKx7bLXskB62bkn997Y2E05ZNI8i+B6Q4XO5EFzKiWTjdVuDhVaspJ9S7j41kEPVJ
	IR3NyUf7P7uidW8GSq12wR6OuMuJL1ObWU67mbpi0yRiMwcWidDyaw629J2K8zNM8GFIcjY605H
	vDqX8LHm1lBxviTyEGAV4vAY+/t12biZw2oPNTVat+f+4IF9+8mqmGFdujx9IV0TCgcpaaZihn1
	8mXe/L0U86I17kExFH2VeyyjKu+PLz7tZoH5ax4DKPxkxgBUbT0u0QVqwaGVj3q1wN4QtjEh1Q4
	Zq48EhrIgX5+eNoqQTlEL0UNgoHn2ShvTW5GMztnvt0Nz8hHZM3JX9KRp+In4yID+xYQ97dyybl
	zPfv0M5j1BcYVW3VcfcKImP7a6qeOjYNOp+g+7lYYt/IkOU29H1ZRh0vacAYXP07xqOfWeB6CCY
	6gP1NEYvAp209T1zqtFQiD3mJnNnvUfepmNrB/lQpFyZm8FFH+NQ9ZWof1jQCWePDTL+195eXiq
	Ug+72Fu/nyQKE0Nkiiz23/vkJh4W/AjQSYm3FrnpAKXJ5gWJwNw7XdVWrPoW6DB0SKvrdOU4b5B
	P7jesfjih/A7C1+NZsKcwGjfZc5dKtq4GuN8g4KNkncPNrVg=
X-Received: by 2002:a05:7300:8284:b0:372:390e:1499 with SMTP id 5a478bee46e88-3768675d207mr1771712eec.21.1794365867258;
        Tue, 10 Nov 2026 18:57:47 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm12390018eec.17.2026.11.10.18.57.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 18:57:46 -0800 (PST)
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
Subject: [PATCH v25 13/16] ALSA: virtio: prioritize capture period work
Date: Wed, 11 Nov 2026 11:56:52 +0900
Message-ID: <20261111025655.63951-14-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111025655.63951-1-mynameisjune111@gmail.com>
References: <20261111025655.63951-1-mynameisjune111@gmail.com>
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

Use system_highpri_wq for capture progress notifications. Capture now
always uses request-owned storage. Playback keeps the ordinary
workqueue. This preserves the priority proposal separately from recovery
and accounting. It provides no hard real-time guarantee and cannot
prevent reader overruns.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm.h |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -173,6 +173,9 @@
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 

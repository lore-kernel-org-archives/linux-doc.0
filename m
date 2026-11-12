Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444484;
	b=CfouS0AVdI1Njl8opcIYPKhi3qXgiORmTZ20uKd0O0szvQozQphQ6RRdlJleNwK+GHV1
	 yCnhb8GHwCsSKRfHlVoY/AWKcNW6oVE6T+DuVcAdWV0RomQXIeAKWEhdKNC8QZuugrhj/
	 4oxYAu6isyW1n0LN4XvP+5ILnC9C62ak4YZxwE1VMIMNtaMO6oEcLmgqZsaHZNTEI8f4g
	 w2J4d8jsgChlzEwGVhtBMUBbBRdiBy0WVyrfOz0XB0X+qqJsqHiCo+KC0DIXBPUDiejro
	 KTle7nMoh6RuNx6xQuL7k6lOLQ/n6naSvNbs4+lsxCK1vJEIbRQBnxi72nAhAHEnAvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cedV0+mBiOhhOlmQFuEFj3GrQxb4hXlX2OGeB7wX9RQ=;
	b=Tkh/tsDx3qf95rNTrG4xduntbMN0gllvDm+Yo37jpzWR39DSjJt15aebYOutku6nFWhk
	 v+DFV31voWmYeb+2IR5PkK24f4deg4qW0Ck2+RjAEPgzOZP1l1regoh57+pOcPPdbwhmG
	 AX7N3QvVoO2LuMspGUo2I/uvtWpuphgiPIM7/3er23VBnEETNcDWzC25MhnOgqp18rxOF
	 wGArwgvsuIxKQqXhOaXfYVe9FmQeUCfoOdTTOWJNh8KDl8Y5AQ7F69H4r49l0U51CsBn2
	 lXhEOj3PX9OZ/z+k79qcz0LS/WCHUDrn4d5+aPDNeRK6Ja6VFslbTHYqqOXPstqMuLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HzqTg4+t;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03B0606C76A
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 00:48:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C03B0606C76A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HzqTg4+t
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1931ff67a29so6592680c88.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 16:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794444483; x=1795049283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cedV0+mBiOhhOlmQFuEFj3GrQxb4hXlX2OGeB7wX9RQ=;
        b=HzqTg4+twpA8lDsegIEbvtSBpr03NTvCLivNU5L3xONBpBEQtRvcW8xM3WKsr6muWN
         QKdtzb0IPs90xKV0eEz1qinAzmwhnTsu0WWCJWsqX0cDBZ57J+WR6u2QWNqR8nH/T1IG
         Qi5zhVfQLDfRU7zFsscrhL/EauUpHuG4XqubL2blZx7/tHDUXoa14381n5cHUOcx7bac
         +KdvLwrH6GkRaNhXJJzXmlKacBPL8WVknPMQfbq2T1CTZbGHHMz90yYrky810Dh6/2Kv
         dIo/ZYMMbe+cRufkbWybT1vkvdXi8L6p47/XpZZh4ZwgqrJnT19kp+5DDx6r15pd0x2h
         H2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794444483; x=1795049283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cedV0+mBiOhhOlmQFuEFj3GrQxb4hXlX2OGeB7wX9RQ=;
        b=u/QIGUViJyRGUfC5zsuiXYIvY7iwXGdGUemsgs4tkCCCmCDL5fa7lw9hm73MA5BM88
         G+eYLUdLL8GPlU2s/Uij+528bnrrWbI1dP03Pqmnda7POawrODAQ0gRgzAFY7ah0UFBM
         f07j29GlK/G18nC/P7U3W6kuqFtRlroBcLGr1dRlPhqvYK4rv89ZYoxuR/w6GvH3Ga1M
         PxO7B2l/T4sYsc/caKVC/QRJ3V3ekv1KiSQGXXaBgdrgWKCDwNamAMmVOQNF0ExZm3E1
         +fy7+iP/fjc2IgZZMz1CzACwLrh7xmgg5criNCvbBf+iARw2RfIp6JrPr7FITZ3z4TDm
         icuw==
X-Forwarded-Encrypted: i=1; AL+hErFwoDz1jaBOjY8aqsZT39WENfNmjkMVhnAdraR2ATLu/8+RKofiGa4blE6kjhKKAr1gKDi1tMTXrQc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ePJh3mWRimtFNjhhZzgz3dIJd5Hl7Ge+8HOvQOPuD0YaDdYJj
	wHSaCLh8lDvYxNn6g/9Bbqj2hgj5QJL/Fnz0+XlHysvHsMgPq5H4L/s6
X-Gm-Gg: AYBFou1vfjM24oy7a93NEcTb0nHPJFz9qld5L7AEu1OGW443NhRyVk75ghtvV3FpeR0
	lO8vmXY9PW5tnWLbN+tf39nQTurCudin/qLhi507R5T0v+1gNCjkWyZvKMVtsZ0IfXI1Xa3XcGy
	G60suXcYWN9RXePJg8pj6EOCN1WqCRtZoXBf2Ajk5nf443s1ySUzaGtx/U/s0OmafvSyg3YlfYb
	ldn34GW7qBXUVQpFRBA0HWvM2yRK+GfF11JlZiyBiPCuyit8Rg8hnhp24z3n3JTzvUKRFdV/0IW
	e3zkcJ4HnoSjRgp776ddkv7QY79c9hPq6H++tK3pCTMjGwk2jrAEcjJGGMJVlDAuPh0m0CoAjxq
	8Kg8ETS1JxWN/WptM0Zq6aY3A/5qNMVkTAxFOI+R/DjcDgm1uLVb8xxzu/5N/u3o0c4AL6D1Cuj
	Q5JaPoVpGw0Wo+42L1zudWYdxNnF37Klu97Vx1HxJuDgOUozvtbBYZwbQLdnG4n4PYffxTkSjPS
	DC7iftAt/dRyQsyqA+/4qxkFSdpdFUYy5uI7Qaj5ufUIduk8gHV7JLDOzP9zXJmTxLyg/P3LlPI
	mLqrNVG9jwnxK7IwNFVgIC7XXQ8PW2MLJ6IoqM8eg1Zn9Dg8kXMW7VoWyylbzt0PItsZvNQs570
	yebj9c5Nbokeflld1XGOOjDkWCw5cQIXbTLmKR9W9mJrLJ+Q=
X-Received: by 2002:a05:7022:1706:b0:1b3:bdd9:cc6d with SMTP id a92af1059eb24-1b3c034619amr3483867c88.32.1794444482628;
        Wed, 11 Nov 2026 16:48:02 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm20672163c88.9.2026.11.11.16.47.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 16:48:02 -0800 (PST)
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
Subject: [PATCH v27 15/17] ALSA: virtio: reject invalid playback completions
Date: Thu, 12 Nov 2026 09:47:02 +0900
Message-ID: <20261112004704.49758-16-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112004704.49758-1-mynameisjune111@gmail.com>
References: <20261112004704.49758-1-mynameisjune111@gmail.com>
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
@@ -980,6 +980,17 @@
 
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

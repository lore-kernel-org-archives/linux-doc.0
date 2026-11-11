Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794355610;
	b=d17tGzduomKt0bz8HG3rt1CB9/iJxBb379ob8p4FmVSrN/wsKs15pOiy1umupQKlpTly
	 viLKB2zPT5kRFg5j4yZqu2tyIn9ML5C6FSC+WRpm508NqMVE6n3bKCUXfuyC4676GWWWF
	 k2t+74UOFGdzrLvws73FQRQtIx8BJNGKCj69LG+8ekNddtIWft1l1t3RdX04XnLZMB9sk
	 z7xzjEUSjfGJ9r5qY7kIF/7Ol9l4Dx7A9P5dXQDG/CUwUi/5DOG+hfHeAVxxfO/SPOFQu
	 lxfWBws5n495OVlYNuFL8zXP+p8xIOiq8EUcLToVBqrFCkXgfo3qMDNB/3N2Ek1dTbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794355610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cedV0+mBiOhhOlmQFuEFj3GrQxb4hXlX2OGeB7wX9RQ=;
	b=yEhKce4lm61UojvaBMBaZPFZ/wM+UVAyX9VdZ0zP9b6uJmvoRzirdXyt8wylTFwiJkx2
	 e5KuMKNfZgGtq2ashVsVHGPxyg7T4XA1fBDC3/8K+ICF8prZ2vbeRzKCiKvblkHPP2Jlz
	 b6eiP+RDmovoXtS5+ude6FIe9At4A7ht1Td+OF/+tYM7cciect+CVHH6jugTRQ4Jan0K+
	 adILjDP5dTuFMRXpog4Vs/VgH+s7R5oMEwxa+tbVPjTBH3tWxa6LkIMifQrO1cttXm8MF
	 9aUuF34CnCpWzM7EeoF9GdUxoQG88YsKYmIdqPQkIcn45GYtl/aPceu2ja8JM6w/3Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DgBwT6Y7;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF7460A6F76
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 00:06:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDF7460A6F76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DgBwT6Y7
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b12cb3c37bso1355143a91.2
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 16:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794355609; x=1794960409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cedV0+mBiOhhOlmQFuEFj3GrQxb4hXlX2OGeB7wX9RQ=;
        b=DgBwT6Y7RSxD3MuIEU5idrNj5eE6RclS7sUg8ysyijUcYKa1H7xJmOlRr7DTmY2RIh
         iJBpR/a+E06l1j4Yk4YQ4U3B2dl6Sji3vUzn5VNAMXlQR89d4XeEENLk2zvdv4Y8pB7d
         Ug20KYcNFWAk14yCmVTv18STHeh2klrXOnkEftwG78XN2Duh2s+16JM9rvc66JY16K5M
         zdPGTp6FXZMU3HmWfnjwu0qmknxAMbYrLxiRFAJraNFSJ9wB3PcpcO2IBxXE9ixtsSmW
         JzFqCJgPtYySOUy+t6Ral8cDCUZF4I8K66mgpQl0sUsysXhxwQTM6SpY0aEZ7pCLj9uF
         dazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794355609; x=1794960409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cedV0+mBiOhhOlmQFuEFj3GrQxb4hXlX2OGeB7wX9RQ=;
        b=iRFpeRpmo3LBhq4arhIGa7JveRtMCQE466YVk5+0R6FaPWIdMgGK337nWAPn563U51
         Q64F4IzcKUg04MEoF+yqwj/+3EyYDHlNSRjT+PatBsFhV1FQuXbG7NYaCtjf8HK4IqD8
         qfWQuCuOkONoKAaiVkEMGkt/Dj4v0pCKW3ciVXzOO1NtoCnOWYLWutG2daQtxqVJFLzZ
         zAeW8Tw7wmugdKss/D0X/3Ec/3aQgqAiWVD9JbCuHKLYcd2PR7tEWkzWknBH44ul1J2t
         JAH8MLOfdXo8nInrWtyG/diThJ3kPMJwe0yxzdNpMByK6bxoUf3GgmKkgkjJ8Dq1le1+
         EcEQ==
X-Forwarded-Encrypted: i=1; AL+hErFrfQLSy3VMmTH97GX5AAtQVv6tgxeToVfJsiYpigOZTjaSVtSxS816QXcRDvvCrtFV+JL0U3m7ZTE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KC4xgVVjxbxGYLojAkBe912gNX7FLMT2DEfI13zYDekKl0+tJ
	caEouBgCg0inE9sLxfHwzQS+sMbEp/NTVuzkZy1nltJ1ReHcXy0HiEgF
X-Gm-Gg: AYBFou2eXvuvENr+d6o9Baak4fdW1MzlKAi0CCeS1eZ71EQldfdH9tuGwhUXkbqFXPZ
	UN+cgxDLXSNzELTl5At3PFThFxxqG8Fl6Ijb/JVQDIIMvzwhvdvdDW7r+nYa4adGb2R5gf34MyW
	A56tHfi+M+S8NLjFkaz2elFk7mpYNLZSQ6GXWUrtclNg7djOJgkH7+MYepcNP3wXNe8g5tOSQQE
	rq9z6USYVW+rpT62nWbejXCES8y39AWWy2WQnl99hQ/BvUMYqZn1C8yQYzIXaQuXORbPtK+YwKO
	9cFJb+2kuPN/70+0vb6/m3CLxu//ErLM+arLc6P74gjHjl55Wdlx7AZqr00Yk2NS0oOm+AbQhbg
	ZghxzxL7fLBHnkq6V8S80xI/fTy2ED5zg4vYNj6p7Zki4WF4tv073Unn7DPYC3+VB5SFER8h6Lq
	+9cP5ZegEk15HfaCtvwMIkSA9x7MLE2SO9weNgKTpP+5pVoCfYS1lWFNUqQqnCpN7bayhXSkXzX
	DBRKC9x8TJMl+UjWArWeP2HGMn6++brZiALzgRh2vvpkrk9aEsz11scK64N5259cMBURrNsli11
	DACps9KtoF1bIbVNn9T9jReyPdDZqN18HTtwi6cPk0ZT0XJEUeTDPqdjLfCLYWgdQ09VKHwRhAs
	iVgIMknyPZEdZ4Jx4MM6NtXPDHqBlIIlczcvO0Lb/jkKc3NM=
X-Received: by 2002:a17:90b:4c4c:b0:3b0:e2a9:3466 with SMTP id 98e67ed59e1d1-3b182eebe65mr643070a91.16.1794355609114;
        Tue, 10 Nov 2026 16:06:49 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1838e616dsm474361a91.4.2026.11.10.16.06.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 16:06:48 -0800 (PST)
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
Subject: [PATCH v24 15/16] ALSA: virtio: reject invalid playback completions
Date: Wed, 11 Nov 2026 09:05:42 +0900
Message-ID: <20261111000543.28550-16-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111000543.28550-1-mynameisjune111@gmail.com>
References: <20261111000543.28550-1-mynameisjune111@gmail.com>
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

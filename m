Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793252668;
	b=eE9t1Y92/w2lOrPhATUOpNglS4kEJkrqAaGMN8dDgTrxgLp0YuKs/mn+cL/ZQ1UJxiIo
	 hVWDSrFZwkvfjcZ4+v7MSNGwfl3YqNT13zBBMs8SqdFdtfLqqxZT2Hmy4mJlS1JESzP64
	 D41FZe3Ihqj5PDHHkw+FZCHMeRHm3Fk+//9G+J4LZgzhBnDuTeHwAfEDvdnq8FylxP2tT
	 DNF/awGdq1GtHkFCZxyhBjbCb9sznW5V6QcC7/W/BD+u4SEkgwCgMDVdqrwQu/TvTWMG2
	 zIZonCa2HeLQsCnfTBno3FzDyhbSwW5a48b+HFrxuycaNIcbjfe8LP4iokO9QOx7BIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
	b=2bJJJseN6LQJ3c/6o2KHYHAZ2cqlreHnLd2WjJkcvthY3JCO96TOH8euQ+gUNkVSPlOy
	 bj7ytqDGKCY1azncm+UPTtqUilLaAuzCsZbpZFFwgSt21j/w1kivrNq3hjSZE0cCPwASI
	 azd1lj3/cV2EzCa53Wq4I1UYhwmNAOYMOI40G6epvAiOLDUG4bHcjw6K4J8tQ7rHcdc+J
	 PywZPu62GDI5bX86YYbwTqS3j/djPkxuX3Exe6K5PrQhsphVFMs0BV85tvAAkFEq3jz2J
	 5RoFDxStc8zFszHV395fQJFnrpmYEFQ9i+7xvFX9M431UbR6B8Jn0oJDQIwPUhRjEPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="epPelA/e";
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647A0606A321
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 05:44:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 647A0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=epPelA/e
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3acd21ba21aso1465190a91.1
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 22:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793252668; x=1793857468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
        b=epPelA/ebjfKFIqUn76ZkmnCEM8hEnqTKQBTqZWyzD9GSxOXK9i0OABVBwkMEDQqEb
         mrp9w0LSE0NmyrG0aKBQcZzPaUQCMbYvJ2BJynrtADLpfG4Vz6ugsAbCaEBNFtgyPLWM
         3DvXcC5tX4J50e21gwS0bHS7YgzuJBauc2kTX8ftvjmb8Iji5m90vZ6bd8LH6+EndCKK
         9CbkEkggyvQ9g/3Rk0iCu78IkbvbUm+LjRYu7NDuUs1rkWsbl6i3l3qcfPBEEOulW7JT
         rZqv9uN6a8bCyq3FQrk/ML79I2IexbKQb9QdZC4h+jHFfsyiA+abn1GqUznCloayheEw
         QQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793252668; x=1793857468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
        b=g9k+J1JMCeFOa8SLB0q6AzsP2neUUBr3Ip2DTHujYNP3D0SwyazXgfdYTH0kCc4jpq
         xYWclzF++1ztFYfV7Qw4L1dBvKKYbd6LLvfXxpsW554CITNsqlrNwfsdpNEXf/JVlrUc
         cxR97jplmWnZFdiQ79vjq8OkUzn7WlnjpLbw+3Ojlv41f62vnppTsRKYWRXppR5+LR6b
         wgl59i1FX0roQfHKap/MWvpmAVZjAx44Fqj71PhJcuKcDRIWLWvkdxGyE6dkzqNoPt8M
         jKj/GmuTWqfhnwU5nPzDOpXYfNVGI4A9aEMNEhMwATz0iK0//xM01gavSYMaXsIZ0x6j
         dGDw==
X-Forwarded-Encrypted: i=1; AKwUvBy19ePnxpwrp4YNIaayrgdoVNK8pca216dvfsIS05yzzF5wMXBfHrbqQhexq8iV+haxWha0sZggEkc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfIzL6okJ1V1iCs7DbEOxhi/2VnbfW4c61vklGteSkN7QBBdeA
	HhrJQpCmygzFfZ1b3nApCnJuB2hwnfFM2YNERkwWDaIx1NCfJ8OsLVwzHvB/3g==
X-Gm-Gg: AYBFou2Sz/jGMMorVtI65yO/Xl7mhSTpXMTiBVa0qqqDmpv+/cqJw76HBdUAztovr/R
	Ay6ngmdyEFFaa/02OuYEM7kjaxhDIp8svQJ5DU/AAb0Akkf9sO2p0FK+E4mj09l4ZxVHj3dxEV1
	r0x1T3gEuC2QNTBEVXDnXlDLMloVOcdHD/37Bqj7TP0eGD8/5rBdKp7MJ/Oq9J2iKZH1SqoYmty
	mPmELsKCVCtDKFe1ObFJEOs8xHlfQVBZQbNdOM1U5Tqg94xKlLcRpgxW7q/Nr0FuKxbLrg5bdBh
	rP2ZXiE6y/HFNP4QtVwyehfzeHQvq8fePLM8e7tsu5e+rr8SwXV41dhlM3sXWH/zfHBfSjFvSFt
	S487fRxlBVreTskueQAOFO3R2qYSn74LjBSds/6DjgoehQSI2DIiKoCXLAzpTJTzqdWs+FwvC3H
	TFaaWy+KjqVOqT1Y+uyWpP6e2vTD1ZYV3X36sQEiozZwsGvM9HwgVQaJb2SOyFclxT9PvsRQIgx
	PJCiJx7ywQGhdB8dR39POTZC8g9ibo+w0WhESW1FVXlra9SUMu/VarvMTCWH4oDQdag9X+sWX9T
	qjUIA+5XbDWdfO0cz2kTNfBLa4cceLEAj4eoa77BZoR6cj0lSWjcV5HIInmFDEsRKb+Naw7eain
	hlScEgFFY0R/kL+GAzbphhbguhaK8AKzzQPBqn7IOAi+E8No=
X-Received: by 2002:a17:90b:3142:b0:3a7:8c68:6446 with SMTP id 98e67ed59e1d1-3ae58362f48mr3595933a91.63.1793252667831;
        Wed, 28 Oct 2026 22:44:27 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e83127csm2433520a91.10.2026.10.28.22.44.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 22:44:27 -0700 (PDT)
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
Subject: [PATCH v8 07/14] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Thu, 29 Oct 2026 14:43:47 +0900
Message-ID: <20261029054354.2931-8-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029054354.2931-1-mynameisjune111@gmail.com>
References: <20261029054354.2931-1-mynameisjune111@gmail.com>
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

The staged virtio-snd capture path needs to sample stop_threshold from
completion context to distinguish free-running capture from bounded
capture. Software parameters can update this field while capture runs.

Mark the runtime stop-threshold assignments with WRITE_ONCE and the proc
status read with READ_ONCE. This pairs the assignments with the driver's
READ_ONCE policy sampling in the following patch.

These annotations do not provide a transaction for the entire sw_params
update. The driver serializes its cached policy and accounting with its
own substream lock.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -2958,7 +2958,7 @@
 	       runtime->oss.mmap_bytes);
 #endif
 	/* In mmap mode we never stop */
-	runtime->stop_threshold = runtime->boundary;
+	WRITE_ONCE(runtime->stop_threshold, runtime->boundary);
 
 	return 0;
 }
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -422,7 +422,8 @@
 	snd_iprintf(buffer, "period_step: %u\n", runtime->period_step);
 	snd_iprintf(buffer, "avail_min: %lu\n", runtime->control->avail_min);
 	snd_iprintf(buffer, "start_threshold: %lu\n", runtime->start_threshold);
-	snd_iprintf(buffer, "stop_threshold: %lu\n", runtime->stop_threshold);
+	snd_iprintf(buffer, "stop_threshold: %lu\n",
+		    READ_ONCE(runtime->stop_threshold));
 	snd_iprintf(buffer, "silence_threshold: %lu\n", runtime->silence_threshold);
 	snd_iprintf(buffer, "silence_size: %lu\n", runtime->silence_size);
 	snd_iprintf(buffer, "boundary: %lu\n", runtime->boundary);
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -871,7 +871,7 @@
 	runtime->period_step = 1;
 	runtime->control->avail_min = runtime->period_size;
 	runtime->start_threshold = 1;
-	runtime->stop_threshold = runtime->buffer_size;
+	WRITE_ONCE(runtime->stop_threshold, runtime->buffer_size);
 	runtime->silence_threshold = 0;
 	runtime->silence_size = 0;
 	runtime->boundary = runtime->buffer_size;
@@ -1062,7 +1062,8 @@
 		runtime->period_step = params->period_step;
 		runtime->control->avail_min = params->avail_min;
 		runtime->start_threshold = params->start_threshold;
-		runtime->stop_threshold = params->stop_threshold;
+		/* Drivers may sample the stop policy from completion context. */
+		WRITE_ONCE(runtime->stop_threshold, params->stop_threshold);
 		runtime->silence_threshold = params->silence_threshold;
 		runtime->silence_size = params->silence_size;
 		params->boundary = runtime->boundary;


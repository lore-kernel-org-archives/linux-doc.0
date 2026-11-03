Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664273;
	b=Lqdoqqy7eCwPk18Yx2a8E080gJUSVnGOMC1Yb1k7SYvVQYIc/4FjBiWC3ZFqBbgstf4e
	 6u68vjKgu6qrbS4Y/cu/ut4JoPE0O+McYhsoam1V72uwg/DosN9+6E7ANseZaogD22ln1
	 srKgZxdHGQMg+kn2h8RNreKYkmtpk73MYT7RCoOwPG2dyTIW3oTG6WlCJE0NQpVMoZGGt
	 Idjn31jpsM8kTZetAYtvILcG+GVnv0/L2wfdTZ7ZGsFn5bYSGrDL28j6fyBXhGf0C1ICK
	 WGdUQRd2KmChJuP0MRkOl2NBNw3v9rLUz3cIV7oNT7Xvo1fBJ+hZtOH9IxE2/X7y/Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XTf7x6rvt6K8mT1295GgXCNKMEZiEblGXzNlO5X+Nyg=;
	b=OP098hUVMQBR9pp5qJKCjg/6Xnm11Wdkv7OzIZKnzuF+sWD6OiXoezFMEfM49AsjoPgU
	 8Db07Zc3fPnBbZrDfZDcX7ovcVjeVTtT0T+vLJRJbCshqBvQMta6a97TuHMIug7RXi728
	 ky84N+Dy2e5DCp9hcwEU6dHS4rxjy3PR1vD9c2BvoCKFwQhVdbSufVeUZORft5JeK/wrE
	 8Klm2O+hQyssQzYJihLGItmdErqWgqtBKB4LUccZEIW1zFURRij1rmaYpAfOZxQpJlTwX
	 cYs04BDtp8ytXGOyVGrzELD08SGCA26glcPQlXGYvx2xmDA5H6zjtsHHz85/+Oocwyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oS79BCWk;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36046606A327
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 00:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36046606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oS79BCWk
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ea0efd636dso32851785ad.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 16:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793664273; x=1794269073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XTf7x6rvt6K8mT1295GgXCNKMEZiEblGXzNlO5X+Nyg=;
        b=oS79BCWkU6xOxfGT4UT/e1Z6abDqg4BH7MNQH7NPNeHPCedvaJ1IlsAip5gLybpFO2
         NG/Wq+S7Egyj1guPDDcpAwpSf+wPetmbNOI/VRhAZx4JqEhyQnj/oLcH+wEKFZGurs4x
         wMIB7nmljpE1m/vzh30edWmP3I4uly4keshKV/n9mot4Q3cE35tOuq7lJlXDQAFZjcKC
         b7fVDkAcVtkzhfuMS66ecM2/AdtVGr53iIf5q+7E5QTPoxTo+JoGMuwNLwPV11DkBa6T
         kRcMMK5x+jW1yJFQhPxADUTr3O8TeaZLK6W/Yi5Af9lAEBzgkMmnsObOHHt16AejS8Af
         HPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793664273; x=1794269073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XTf7x6rvt6K8mT1295GgXCNKMEZiEblGXzNlO5X+Nyg=;
        b=AVGkPPv8n1/V1FNX/pA+31oQN8FzuZ+2LKdu8OcZKpXRxjKnmo6IoGHsa4CNy6upli
         v4mXt/wEOex6IGeB9wSxYKtJqVqfkFGSJQoRPsNClGKqUdM2vwGL5Wddryd4/QVix+K5
         j1on9AL+zeT0nenoJXwCaIbo/fVwQRNQ+KT+YGUz9Ja2UbaeC+K7tuWKkbCmC9OPpccI
         M2ROkkWxhNG/zUBdrRZbswrd6CA015RuUG27S5HBUtdz1kPVidMUcOZYfAgONYvwoxm7
         VkRx6VSrRvLVYOEy1PCggAF0ZKGiLS09+8Es/yzeETvrr7Itfj064HUtTu6C+RHTM8eR
         pPIw==
X-Forwarded-Encrypted: i=1; AKwUvBzMx6i/Wr/rNm2RwSYpB/DOcctcTGqa0yGRIRNGc7JE2GqBHiL1INaYQ84/HAHT5SZ2zDdnqflBKiY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/D8fhBQJnWvid9g94I0EHP0rJlJBTO3ZdZZeiu0KxZNbaq3O4h
	q4S2nlrL/vOyCHY1wsBsru23PEB0e9G3pAyZC7yfWGR3A+NA1EV0QX4F
X-Gm-Gg: AYBFou0ycb32J4zGOXgT51YWT/jLh3bO/AouyVlqpDJhrJ874fRNcUiLuOBoIItVLs6
	Be+9Jfokvoh9nqtktHP6ssLHPpICULzvy1/fPrWOXj/ivhO2A8385lWAozIbjt9/3LPi3HBfyLq
	9p0jiqPhBwA7cOInUE+JSs5GnP7Js7H+GUBUpZUvTbyMwZLtC43rpsmnTNYK5Ho0qh1H+IFFEH2
	Fa5SXJERV25hQjqgz93pd7jgdyZNqgkFk32LF4ffK88qgXVajG5iFUqw+MFJ+8Dj0EctesywNWv
	IwGxPac3yEOdeIqNwu/x7y6s7OjHsI6rJeLZEzE/vYLFO2YqXW25WO+Q9LssNDNwHJOx8TDDlee
	tX2BdwUM+X6T9iDi3c+1+bO7MzGmh8PwbODWPTS36MhvZVh+d4nmE6oDzPeGrKR+oYiJomPPAvy
	ar3UKP7mLa/oMnSHXmAw+GHjzvREaWUXt4WJedgU5stNlYyKMueJ8Bwh0L5T+OmWd9uMoXA5to2
	plozC3LDi85Bh/srApRm21W4XyfiQvDvjavCZOeKE+rtQGGC8jNyPFkQ37ZxWiEiq7zPMD3Oq7s
	8qUEO+Q3YNuq+0uUVztBKmNcCyeeSopouEKvHf29R09AXPU6f8yh6TRjmm4aGDXxLSQwUGBWVRQ
	XaSdPYSv3Utr4Ci8lqIwJbWBrlQFEy9oXw4rFLG3mI+5MZ16HIRl/xFgvSyHCxQASldqV
X-Received: by 2002:a17:90b:1f92:b0:3ad:6090:a183 with SMTP id 98e67ed59e1d1-3ae897c8014mr9974284a91.16.1793664272643;
        Mon, 02 Nov 2026 16:04:32 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6b3493sm1339225a91.13.2026.11.02.16.04.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 16:04:32 -0800 (PST)
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
Subject: [PATCH v12 07/12] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Tue,  3 Nov 2026 09:03:58 +0900
Message-ID: <20261103000403.67106-8-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103000403.67106-1-mynameisjune111@gmail.com>
References: <20261103000403.67106-1-mynameisjune111@gmail.com>
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
READ_ONCE policy sampling in patch 9.

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

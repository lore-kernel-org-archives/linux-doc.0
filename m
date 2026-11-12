Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444435;
	b=e3/gj/c1yInm7ze4Js9iWUIgai8we/QpsU+7dhOShdpsdGuEBwGJurZH33IXru8qlcpi
	 CHYZvIysb5E3CF07Soi2tCbqmTiOJL4pa+w0NOHBuaQ1L/rMyPIoQRI5QWel2rSa7+DKX
	 LvY0kTuuHEC+Zbg/wDnZnaQvH/1O2XPJDG2PMVeN2MvJZwlAeBPpN0AXlv3ZlkWYOoyyW
	 2msueuTAK+afCoHnTad7wC+0x1PDUk12X04i7w+J0iMwNaSGL1OluUfPQHVlpaji33c70
	 VFNNfoRta0PW79Cn4jke8n4Ayv42RGcsVLztq4rUvb0iGxcqoWPIeLORKuXBRltRseQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
	b=j3HfHi1KhRKnEs0QqwXFidBkAg8xKT6eVGePjtGwE2+qMpcTqdYM/mHTlkfCB9qCVKpa
	 NTHjMergzd/w+QV4jtGWdaSDtEcwmwFP79D8MUxtoJAWqBKtXsKiM5MskcOajNRo2DtIe
	 E38BMoYZBXusEj7vMPOqKF07YWBMKJaDHs5CRnG8kmTQiVaKzvJhxcJXTkrrcpaqL7pTC
	 yBSzr3vdsYKC9US/rZr4TH6X14qVR5KdpuiO7w6IkMI+kr5YsrM2gu1Gb5zmQA3qLSDtC
	 peqIbjYPid4BRu4Zf1R9muw5xfQsnWcrlFmwHsa7UscIW/g3WKXA6EYJdAg8xhP7hBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JgtNzIk8;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4190B606A89D
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 00:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4190B606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JgtNzIk8
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-18818daa3e7so189364c88.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 16:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794444434; x=1795049234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=JgtNzIk8WG/gZnOwdXMzS8FZ2NJ6YLpXjm4JUQ9gD6GntFJ/SiWL1NooVxJRIPepPB
         N5Ver9xlyCHRCutBkk54tDFYxjAh6cBI7Zl0o9e/16kOZQ9Skq3hPqMrFdbpTjs8D23u
         FQHAPNP1HBCdNA2jPBlKZ8jUgUC6CnCQ8SXwrk1wVJuKgfs/YXIuNTEhRnwDpwixf1/Z
         spN5O3mbuRfQH0/btIHNUtkuVBvTAidg52n/YNInY0TpV3592CqxKIpdpW29JVZn2KtM
         6UNxcBpAWBNQFRW7VvgWugtzxz3+xv0Vr0aLDberQ9oyOHkUtaQhuU/DvhRrtCA3YaGp
         QRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794444434; x=1795049234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=tjei7HOMxUr8bSYyuGK5TXXT5JE495rFZ90EcriHImTRNjRCIiRPQCF3RVRjJMSMlU
         EVGmKSKIufUSebtfD15xFBXR7qVtzqaxc8j+L+M4+a35S53Ye7kppynhOVvc6TysKhlO
         lwx0LYo0Mvk1LEQoCW+UUjMPJO7mSg9OAOkA4UQ9dVm2HYq3C7kRol00nzI6ZjFO8FaC
         t+OdxYijYYrAvfxvQHSGTQ6pams6UvnpyOlKuXDZqofdss129zF4fKydeao2azle2yEb
         ZEfi0XACJB/tc/HBNVm4mYyT7TTCvNBbNbIorWVpLO0z4fh9PloDXd7sZAplGooVg58O
         vXCQ==
X-Forwarded-Encrypted: i=1; AL+hErEuNaW1Yr/35kzOyBF9a+AdD4meVe1KPJCH8IsZRT1rvwP2jfaR5s0u9ceFyCcOIACrEFHnZym1Y18=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UXhd/FGVqgJafA0SXXJ4VylMYVt7mgqIGOQG0qL7GnPk0e2nV
	mHEJ5eLguKjo+1JPMxHKOQZih61cMPicRDCU4Ta2J+4BNheAzk9nh5k5JrY6kg==
X-Gm-Gg: AYBFou3Y4DsQY5ggakLVh6dTJsUNGLZPSHWAd0ZHY8huU2pg8htfH37ioH9axDD01Tv
	xc71MMlyKcM2pQL9k5dQI5KPXhSiBIOrwmK+hfc+PaVusbPaa8qVqJcok/DN40Ur0N5S46AkUVq
	1tdmbo1nPPLfFA539QdheS6V2qzl+31epIbn29qcg2fBA0JD3j5ePlTo0cIZEUaaCtPhoGEQjpF
	ho3CzoH/09Eok4wYlIAa0OAAjaXTP1Z8Z3yQN0IN7d5XvgZ2QVblI+mZl1f/SHn1h5BeHr5OKKW
	o/MtOT1ORa6P8aOsoC8KuZP0LjuXPHJYNDltJyNE/qKbz/Itgpd2KG42id7I7Bw2wv904tEEkiU
	Pin+XvoBwk4sQji7W458yiuLkzcKCOJ5XpRt5/EYH6p1NBMMWwyZscEa+lsvJ/uFCpNne5kNMkp
	qo2m8BVvgCH/09ZBEPCcv0n4iIXN9l7NRxoJtfBqqf0ZOxV4wGeHLvGURxBTiZTaEisiC+/5vuU
	JJmaJIgImlz8Yhz5leiyCaRPc3W+QVm9Wxt7Cn6QJzcCFPklTb4InWRvZ3xMJ2F8E/uswR98vXG
	6RdfJuWtTmDBRavH11AH+HbkxRajH9SdGVR/+WrNNnRbjX5vjTlDsIm0JQF8PynynMfoqhhPncs
	cKW1QUMad6Kcs/X/uVM+9OQNWYPUM6NgOVjHjcJ62buxjpAw=
X-Received: by 2002:a05:7022:b0c5:b0:181:6b8:31f1 with SMTP id a92af1059eb24-1b4f5f3475fmr902229c88.10.1794444433999;
        Wed, 11 Nov 2026 16:47:13 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm20672163c88.9.2026.11.11.16.47.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 16:47:13 -0800 (PST)
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
Subject: [PATCH v27 01/17] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Thu, 12 Nov 2026 09:46:48 +0900
Message-ID: <20261112004704.49758-2-mynameisjune111@gmail.com>
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

The staged virtio-snd capture path needs to sample stop_threshold from
completion context to distinguish free-running capture from bounded
capture. Software parameters can update this field while capture runs.

Mark the runtime stop-threshold assignments with WRITE_ONCE and the proc
status read with READ_ONCE. This pairs the assignments with the driver's
staged-capture policy sampling.

These annotations do not provide a transaction for the entire sw_params
update. The driver serializes its cached policy and accounting with its
own substream lock.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/core/oss/pcm_oss.c |    2 +-
 sound/core/pcm.c         |    3 ++-
 sound/core/pcm_native.c  |    5 +++--
 3 files changed, 6 insertions(+), 4 deletions(-)

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

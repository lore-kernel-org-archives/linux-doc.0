Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793412563;
	b=eC3v8NVTCibk6bwsqg8zMcN4nvgZsRx56a1ndjveJnyJoArhzQogA7X3vSWbaamfaG3V
	 byfgHuT0OfE0NqQ9OBaEEAka7CGk5RS8OT3hdBnORUUqbxCZrMmagzQEAvJNEjp67bU4G
	 pkBobggrH84mv2DjhM3TAdWn4hMqfjl9CIUiRdqgy98QZX/S+IMeSl7icfSa/TfpSjpPu
	 6KqGjqt6zloms6xfGdQ+2TtPykaW0dyn7KYD6ikLFHo0WYwYKymCrOGrmD/AnTm5J8eSs
	 kl1BINRK611sNQRX1e4Q7/w2EZPQXt5MNYwYJIvSJrIc1kmqQEuez/5XaxYKzevWfig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793412563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XTf7x6rvt6K8mT1295GgXCNKMEZiEblGXzNlO5X+Nyg=;
	b=CvAPdf1T1oe48z+lSXCkD+Wj9oI/p18epEBKxwhOSQe31J4IJsnVrVZ2GZOjoF11JIBb
	 xcomj3dAHqw2fIWEEBVwVHF9eU4ujU6w3D53hVp/sPNlDOESbZQPJn4ZIUDoQekm8wzhz
	 MirUOvaDrjZuDjUuNaTbvxWFCcqjMzY6h7hd4FrUl1CDnKgyhwWUDhXbDUc5YNKlOlhhc
	 fj5Tvr0sw51X7FRYeodqciVI/shD0GMZe2w7tXYeffJjxWnJR4VcQfeZq20Dhpkb2DPbQ
	 4NHP8a764VfO+RcGJ4Vt0LkWEvg8B5ci1IXzS1r5CEzKTOOio6q53wys/+LNHjFT/SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PLEar4NH;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B648C606A335
	for <linux-doc@vger.kernel.org>; Sat, 31 Oct 2026 02:09:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B648C606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PLEar4NH
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso1700644eec.1
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 19:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793412562; x=1794017362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XTf7x6rvt6K8mT1295GgXCNKMEZiEblGXzNlO5X+Nyg=;
        b=PLEar4NHS6whdrmAaC7HjlkeXnIV5cygTdxWVs2irViAPaa6qYALbmaCCQvHfx7gG0
         kelX6F/yxvqaHyohJoM2vHYpzkESkEWa2j1yXYwNsWxuSAB0y1SZovIeJYrhAdvRNi1o
         59l7zv/AvcWsHhFiYh4sIUCb8o86GbX4tnQHfxS8N4CN3U/G/QK2HIueGNM4v5nSWUcV
         jPjFkYjcpJad1LP1U09ZrFZFDNaR3sEOzpZJvp2Ny59CsfXU3N63dtdQqYyAMj1NcSpt
         1dQwggw+CCxbWJtDsy1rdwOhg158roGH5TPKGpD4o5oX29r7EU+cCM5FKnnODp3RMttd
         SqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793412562; x=1794017362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XTf7x6rvt6K8mT1295GgXCNKMEZiEblGXzNlO5X+Nyg=;
        b=vSWjLzyfwrGid5+wSDUetxkVzt+5jfYifJDihah68C/UBrL1ejlLoJkyyGccwHp/A4
         A2OSFy2M3Uvei6t7e459oN3YYKEZUZRU/jnDi6kSVQT61dKEzh3po1bvLFeyFcIhKvED
         0z2uxfQdzOR+EbIdBXYIROxVznbXGSyPDm4rHeacLITnRG5qym/ySmWIiTFSUH7cR0+9
         2L6H2yxwH8PspTs8Mmz23V4HMgOU+rylWmQIID4NG0CRqsPIFDXR+QJKYK9VTVD2q268
         HjYTwro4mTpLNQdkN0J2gza3Zq0t0qZsB7u3qTuEtHgInEdwSr3YRpjRW5uNjH4/Kvkb
         q22w==
X-Forwarded-Encrypted: i=1; AKwUvBz+wwCHc0/6YDNsEOsTBXjtxqvLkmoMZhIUU85xfDH0vVQuz3mABFmYz3X6yWdNM6kY/SHdp3M2oB0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQRTB6EjW/JvDXmstAbBplxK9wmUkX/36HT0bU85DSmPTurDPP
	e4D02YHEofJFrO6Tb4XAlDqbvDijnQbehDg/1iiaYB1pJEpeTx9NZaXR
X-Gm-Gg: AYBFou1WBO6NsVbc+PjnzECH/lYsfx72ZLwOs82iQunncMnAr7tKrKnk6ZrqD7KT2u6
	AxPUF+5k+Vp/n+aLl5Ro5/v6m5oJtXC+W1ar+z6PMlOqyCo1Mw0LeP58njyZ3kiPAbO/aIu/XDh
	pRzsSIcjegzFxWcWqRxScBPLkfYtvYwEFhoIbaGRjg/o2xneTFd60PoWrKN9Clt/dv0ME46FdKj
	3BzoLP3/2P9IV2NjtFFznLIv40LhwLJnWSZXUWberq+vnQFixdSG0CBqfSAjehH5YdSSXgcHE4B
	hFs2kxVWCXSchoN8UsASswm50+idczs/4uMdJdWK9Qma+35HEFGLNv2EGPp9+/2h+ji+fT9hHZA
	P1oERUqFvwx5J74aqTq6U/aGOAxdIOgXJhDzN3rYmCj6jZDAV6acfQGVv62QKJKFoalrUl48ofE
	dnaFxk/H8gOU/MExv4Q9idYh7lbMxdm4YTP+mYLVxjWIU9cjSxbCgYyvybYbl+0xll5mG4DMDQY
	CQbgzfmgEpRc19IqWA3pu/IvGhjNti37RL2dZxWacxiui0C90V2xKBEgk9H/hIC+UYllsQygS5n
	SxLBi6vuf25wgOOfWDISq2E8BzuPjraVsZBzvGbwOv8Vl6GIkiMAcDcodBIcGv9cV1J/pno1TJ9
	GG0JzAyRT9RfPZVdKSP3iuQOl5K9W18UMdnkaiKf3Xi3uYO7/t4RoCKBd9vxLURQWuYA=
X-Received: by 2002:a05:7300:2a91:b0:36a:1bd4:627f with SMTP id 5a478bee46e88-36a423a9d6fmr5462617eec.14.1793412561785;
        Fri, 30 Oct 2026 19:09:21 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm13214096eec.26.2026.10.30.19.09.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 Oct 2026 19:09:21 -0700 (PDT)
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
Subject: [PATCH v11 07/14] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Sat, 31 Oct 2026 11:08:48 +0900
Message-ID: <20261031020855.2402-8-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261031020855.2402-1-mynameisjune111@gmail.com>
References: <20261031020855.2402-1-mynameisjune111@gmail.com>
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

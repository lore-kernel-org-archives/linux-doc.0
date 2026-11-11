Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794365826;
	b=a1IfpTXI2zOanNRo4IpiMOqRZoFPkItu0kR65ailyYSxqc3HuLibuSYbPJYtkv4Ls5f6
	 /2TBxtXDj8fzRu5lw3AT/SZf5kgNSihDoQm9OqgDSfNE7Teg72ZPeW+Gi25MwRWQsoJyp
	 c8+qFxIMusjHhz4v7oI+2eyulylJ8+B1xBmFqLaz5kqZevsvV7JBL0Xgs+q8LASLeL48j
	 zSo8SrC5oizt4fwPo7wWNMPM5+PV4ys57ZPGl+4yd3AyZBYu4grKqgSCCQboGWhm86luD
	 cxfpP3+z/EL0CufM1N5JNADygUdx3FItWgUYI4lXLJrf8qOn0ClBwGkr/dQLzP2utbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794365826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
	b=XE0cjXUUjjxq58VY++d3dt2oTQxN3MJRQjAe1jU7rbtIcQCuSzgwck8u8NLkZMdugr5g
	 DvBeIGClVF/HOh1e6GfBJvY7sqbsonmsKBIZ2QQwP3UaH/lDgwRjaSa9yuXdw6x8FAd16
	 FAEAWZdrpXfZuEpodhkXHkjJB8kGCACb9mRiyeaHReA3usPpGHAycTPG0SVwrhuyuqfCP
	 3WVfii9tZplS9e/2Cudwtr0lYQAu6laYYe3GgBhUAn0NSFBJqIhYtclovSeRVVGyIaozm
	 vPABsJo7d+OUB9fjTp5+jeKXa545XaZVXYasidClK6CXNMRBgYmMwRr0Vf23BxX3vSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tchQIMAm;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CF5606A33A
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 02:57:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39CF5606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tchQIMAm
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36e795af1d4so2294799eec.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 18:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794365825; x=1794970625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=tchQIMAm3N4Z3rdEQUCbuUavaoAyHFkR2GxapDzoH7BNdBGZJjD360Weti8lLBEO+6
         JAlwsKExOa4JUgkCg6hjgV4Gl2Wm7WE/pjhKXK3ziDxnOIq0WTqSl1mubFhakgw55Z5f
         MAPgM5wHkxv++Cuw0x4AJN3Ar9aBo7xD6F8q+rO7Tw52YT3yIv8OzP8hIrBcffAwwyel
         f+t2h7tzvLuVaV8VsJx4XWAOsZUqGT409sNLU7CkzWM7p/kK6i256eElLd7uy0pEE73q
         xARHNw/aJb7krlxFbR9Xou1NCj+FmeOu3RqNrZdO1LFCL/czHDs8tJAkJODiRN1/bPVA
         hdpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794365825; x=1794970625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=bNDyJtVDMkLdRwdGLSGHWRlrChrgUXUEereLtQ0CnUagQcImjBMS+iAeaEN+cvPgkA
         iOma/oxoGIUp6PMMq//Ux2E3r7VrrCxDJ3L1R87wCrYyHsnAwhiL/7EiurnMvS1LsAl4
         SH6DGtHujQKA8mJqvxueA1CHV++tkYPTtr//W2XQCAwZmjifE4VzB2E0gN5OKNkbcrH4
         kSJCjMLebKvgKAT3VrDLNNujkfFqkZ6cMpgS985onWeXhfyScmdKJ+np2PiFxNdpaGv9
         ZqeR+yX0c/JbNLka8HMMC1mW2lssmG+kFdEoTEBpqFdGyt3CUxppk/QcQwQ0jRMw5vwI
         iZRw==
X-Forwarded-Encrypted: i=1; AL+hErGVu7HM+5J5FmSV+bdhZZbYhkzR9yEmgSzvrW+1jGhddOIohZlHb4sSnyGmpBM3vNO8bM22uKNCd+I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HjuHb4yRFmenxnrW7xndSy3L+PqbDD8eCppdYx+WhgAW8Y/Us
	EqSxUD84wmB5+siDaBcq2orlnp2fWehbaaCxhDDPi0HCXnnZDTpuRaYe
X-Gm-Gg: AYBFou3FW3Vo/AUTnOsWae9HDBiCevEEwJRR+fL8ehxuVLOvQAq65sF0TxvcY+bXue8
	m+gybewoIbBsycLuzbyVDAZNXSvvFrjPK2Vnfwpc62uFOoIxWAxIQJ2ZVlIi3remsSXf/bz/oXi
	Ze+yWqOuuBFAFuQPXMYHWTD4JlwO++z44Z4XX+dZsbo0C5MTSbVsiNDhyELYiOQ2vFHX6VgiR8t
	HvGUgtkrjDOy9Ajxdi7yLWwjdvhtmRhjI/xFD71l1KkfZTzTabUHe0YlhNyJ7Y2N10Bp8c5OMFH
	9duke8BfcwZLXMs1KeHCKx+fOD/ICTM7V4O6ENUM9RKu1p8Cw0WXJ+zjFYbHudQU4uaQnvzNU7O
	8CXm8iZlmfU5mK5Rzfn4KKmJKJvRHDmjHFoVch4a4lpp0YAvTRBnPbm08Y24CdLCYll35J/v2GV
	DLyGDMVRkimabatJnQ3j1bDkei0S0w4y7ZR7EJ7wjXvGwbQgH8aFOGYgkTOb10wJ6fxbAA4T+aC
	oynbA9DeCwhPuW8dlf0WZFpP1hZ2Cx/yLAPbmkKQzXaxzvd2sHp/DBLTYiD3j0jPvDS+jG8Rdta
	/wZ8OnFkUcwEc3UHwjicaKGU04RVbQ+P/iEHjdrq6n2UV0CXRdxCESkr6vM2Qzr12YxvVs8Xjkr
	RH6DOzIFXPUnLlTCHXZovRuxG58Fi604WbQar7KUZ1grKvPw=
X-Received: by 2002:a05:7300:560d:b0:361:a195:c46e with SMTP id 5a478bee46e88-3766763b79emr1918799eec.1.1794365825118;
        Tue, 10 Nov 2026 18:57:05 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm12390018eec.17.2026.11.10.18.57.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 18:57:04 -0800 (PST)
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
Subject: [PATCH v25 01/16] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Wed, 11 Nov 2026 11:56:40 +0900
Message-ID: <20261111025655.63951-2-mynameisjune111@gmail.com>
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

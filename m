Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466180;
	b=fjdmSudJVjnIne3KhGhNq/5+Px59hj7B7/s21GcoXlhXGXAH8DbQxACdQ5DcmQfA/+xT
	 HnusXvuiLJeaNRywmRxBylX9z5u4BWjnjpIuJYUoOVFg28j9PCiKV45YK3OsjfpZgh0Ro
	 CRJ3XbjicNY/qhr/9EOJIUGz/wQj0AAzfMeCbd5QQnYtFtNw4+rgC2OIZoYqHiHDuQegf
	 ah31C6HFKW2lgKhbc1J2Ota8jWlPwPVJwDWJFjrZDzI3ALekvJ2MkXHkwfXnOe7VSX5Eb
	 f3vS4I8Mg+vEbZiwg+MVLqECp9xIzCJoe6j49+FqFpLgQXPQRVE2AA8JEbFq22SIjcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
	b=TMqTyStwBw2ozJ4gLo2Y3z88yynR7UFHE72n+rKoCW/gKIdv7eXpMZZWemx99ErwArtT
	 OoX7wLAaxnMOQonlilnoAzOqBwSfGcckdp/bVNM6akZYoKbQrsyCIkU6MaTZrV0ZTSFho
	 uMmDpjSZzH2QZwuSe69hAuAuBU36ayvRUiy+uybzuPw0kktJFad2HIwz6JG6e61Es9Um1
	 DE3F9Fg9eY9CiebPhgpMNrkmhTscbhEL8GlwINDVb7chqTbqdGLMLCvmzKVSbAF2ARmdp
	 jVwT2ugOUrFEelfEJ2XNOZrJwCz78AIeKChIK5I4sCi2v9fKx/7P6+iX8yID6aLbSHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="goqwm/iU";
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AB6606A323
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 06:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0AB6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=goqwm/iU
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8b271e573adso1535972b3a.2
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 22:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466179; x=1795070979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=goqwm/iUnzzSoI/jO1rA0nrlUA2LqEgD8+jxtyvkTVbn8KpBwn5ptAG6gyEqulz2XF
         sXafkazu1RvJ2AK/yu4k3FJyjmsqpy0l/mgZwinua70n4X1ijoNufzHI9QteSE4sVATe
         /drjQOCitDPmmV6RvbNWyJqyvEegtxxub6yzwi5VClseF3MsMoBzEA3pDvRaev0oJjub
         LgIEC0LaTOCLweYrL2Nr+8A2h/SVknrhXfipDlAEbLZ/saoZKsYgD9o4HAi6kQucyzIX
         t8M3EFtL1v/YJmm8Cg6k/yUo/JUOBQnQSNHO+JpW3alincxWTkPYP5pR5DDMElQeGUp+
         xAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466179; x=1795070979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=l70omVIXO7PhsCTzTr3IL5GYmOifnac/9FSgbiDb9YIzW8GJzMfmk667qyl8Tfb9Nj
         Y4aAPBFXN3OFMy0N760IrRTysfvhQDWHunn4UUZmjSQHXshwq1ahJrhWW5Z1dc7cDW/8
         YKz/fhuRm/syhj1CyerIUg5SdZiu0UhLYbu/BMiaApbR0CRIFF7IQjN0eI+LwrLuN58Q
         ba06Df4JJSFXlllu669XfwanpLbcGPehS+lKNTQMP3VE1rf+Ulk48SE2XhGU9Z7NFdns
         PuaAAATLj8qFuFW0VtMxjXqBsmSZmg8uHxxIDdaNWzVoAVhBpmTYR87jU6hubzDsOklV
         5MZA==
X-Forwarded-Encrypted: i=1; AL+hErEgGPWv/RDnGKU2HBuDxRUtEhL3nzMrcZk/GtdRMzfsCLgp6hRTl2V3LhbtH7w5TUrHxPol8k7k9xk=@vger.kernel.org
X-Gm-Message-State: APuU4Z92nhCatJR0ohjyz/cvn3i/xsvYUwmM0ZIAVK7J8yn60LQGV14o
	0JfueIJTuPxO5SMA62SAMpLgwzz8pXwF4LF2cNwWP/+WKlDPU+nwAfit
X-Gm-Gg: AYBFou1zZlJaNSr0LmvijUWS0Qj8Qp48ZmIB3xLfJPHecdGCY4DBOJ5QNzPh9Eu6ALL
	cnv7cfsVM/e9uGCK9uAGz7YR+sOZyM9t8Qobqridw6+gcqVi3TdFGcPf/qjm/6CCEz0oP+QYAOQ
	Y0XzGAlgG8SpDIHNk0ckbwn3gzLA/hLwdna+v6SSawfYCqjbsxrCsqFD9Ot1D1GfUTMR+jzNXum
	ECN7tFPd/NDHhT+q3DVkhWel/aupcQWLDSLmOOMiKgq3hGi5pHn61fy50O4BOEKyzgmUyEi5jmU
	+R5n5Zm6NjEuT0iiOx9joaKtBQSk2KhdS/W5sqWuSJ+8//yAsTkYklzCPaoqp3dDaNVcNB9x9o2
	tcO12njjV9xO7YqPAm7AWquPMCs+mYTx2TTuaRj8OgsDbOt8zuNDrKGHo+064v+XSUMkMFx5pig
	2A98Fv9OV2+Hy46IHCMnHO+7c8MHyPxVC/v5PuM3Sto1WeOPyLitGCSWumxKlY8qHfJCRZ+oUKo
	6WfLyB5XQRsKChYoJfs97xJjZKEkoxGa/mDEFZhNKTQJjNGfho65UsyNLJ1HNJVctmm5vggJW3e
	bTGkoXHkZWa40Dv3rK1YCj/Jpdf5HCcQs+oiTjjOIm7ysy+tKgxs9eUdtXGMV8ZW1eq37Kw30Zr
	CBnXf8A+HT03pzCaHYSlHiBYdkRzSbQrmI6W+PqkYPRi13Qg=
X-Received: by 2002:a05:6a00:3390:b0:8a0:76ea:36a2 with SMTP id d2e1a72fcca58-8bc1deef1damr4766908b3a.54.1794466179289;
        Wed, 11 Nov 2026 22:49:39 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab1228e2sm3097511b3a.41.2026.11.11.22.49.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:49:38 -0800 (PST)
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
Subject: [PATCH v31 01/17] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Thu, 12 Nov 2026 15:49:13 +0900
Message-ID: <20261112064929.11211-2-mynameisjune111@gmail.com>
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

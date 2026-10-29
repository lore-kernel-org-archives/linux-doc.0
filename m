Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263878;
	b=3rfkPOQgH3qD4TQaENmsd/eKis9kahRTIenVD9RdeB56kfAY7O8gmDn26NQZrK0uRMPc
	 ChnCmaE8wNQHS6urvLEKmf4+5yqoOkWNhRRKQG5RDR1UoiKaxWMNJSzs3A59rYhsbtB9w
	 EbdOnSJwiCJHYK5nrgUc1kGxz/xjTzzwvIjS3CvWR6d3Gf3b57D4HlUIueQW204OwRxKe
	 WshYNjmEfIC7EEF2zn2EVF/NjNpn7eHJMuuDhYPz3lfHP0VB97HGujq1mHpdlwVgXqoqA
	 +XEkDylYeZKD8LZtrh5NxUMJ4aQI3x1d4i7J/DXap3TVbZ6nR6ALaACynJDThzh57MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Fg09ZFCWTllm0zs9cO5j/8sPKkdAt+oDDHh3GBuogaI=;
	b=zBJ6higRokWXdHybJCX/fXJTzHjWSeQbMcSXoA73VrMMeb8NiACXv3K9j2+O0i7ICzgP
	 0MengUAKb7D1nPS/Aqtcw9WOuJI50DcK6/7R93ZVb4W+gT385Vrr1HeBdiEYxSkV5bmqJ
	 IJzCFig4cCOn19sYVfNURRFbrB5kPI80+1MQ27XY7lgxZX40WxU+UaV3gM60F0P/3s8no
	 vCETsSJZAH76eTxyjD1eYEKVIuwazbMVcp3B980IN9Knmls/HG9WEbQ0I27PJktyFl4PI
	 vu+4vlzdZFrqV2cWoEYFPTunos2FbpSrmfHjSYcVZrppjhOo2O5MLMA9gx1VS3XV4jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a9r6GOqv;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B9F606A323
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 08:51:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11B9F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a9r6GOqv
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e942864693so9576055ad.1
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 01:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793263876; x=1793868676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fg09ZFCWTllm0zs9cO5j/8sPKkdAt+oDDHh3GBuogaI=;
        b=a9r6GOqvtReidRbizvrwYq5yG2LsJtD1l42uCKo3/jhXYRdPvyaMW/RTS4F3JqPaNU
         Y6TGybNcwPerJdGie+nqXuyKQIM9oikNKYYWjiV4+VuiebMyCoDnAmD/6QfRKzggM/vB
         lyi4nWAU/3gA70Ije/TI4fu+sqL5ptU7plEPlXlF200RFK8hVN2DPBaHg6JZCAVQuCJ+
         CMZAg1hOMRMdU124C9wW5pME2QymvW6BV0O5nzuPkm/i8eJokjfRbaTv1sRZ8f1d261o
         UZH9STY1hyz/P8GTbzJkJCnawpEhJcK64GTtUMWWiLwGPWqs8g3S6bcLRXyvG6yMGwWE
         w3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263876; x=1793868676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fg09ZFCWTllm0zs9cO5j/8sPKkdAt+oDDHh3GBuogaI=;
        b=kcrYt5HC+oQzYHAY+3Vw1gON4DhKYNi3hyyVIF3dfyhEAa5ZCDb321heATNnHeq9rL
         oeP5N31M9SWsvJanyGVyXQHrTO0wp1ZeVVd6F3HHUGfGTVQ/LUV9v5soOJj+xzXpLR7Z
         b+rgEKbVr87ieFjpNKEqCFJiQA+vib3Xe8GnNHgyO4pX46TWrjd4AeuduuaMS95+K0IL
         WSSHqKyBS8isXp5dnrGMtsreTZ6i5W4B/6Yi6YPj8vKXbRQFk78oTaqe+88XyPLlYOmo
         YEka5YYfBtbQG3bfFh5FDbcjL67yMgEVvYRx3uEoQf4MRYKGSWSFQFbmWTFpCG30+XV6
         KR6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxp+e5LAeQluTJ+lHpRsW6/UDVrHf2RnL51TbaLgYs7hu/L2DHySv+ooDkCZKFnL/Pm9cl/UFoZ1vk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJapX5lCSIpmSgquSVbyhkSdnNRAbt7m0Svd/m8yyIr2M7PasGt
	AvT4RrqD0lej7r5DaFU+b44TvlIauQHe5fd3dzuTuncY99CWHloIMBml
X-Gm-Gg: AYBFou1qi7hZT4badk3j+yHEMei4ZFZniFij8zu6FovctmyR9Ou0PjkOks2nLCmeB/M
	yq1LM1Xq1u5AP3or/mSpMDP/km2ymclzcM0uIMz5yoXzYkP54D7nmw80D0TK9BZc1xUxAVJarK9
	DxqXOSZ6c9+unPyan+KSPishScbXqHt8TEjpBXdLNBAYGKlKl7Zwajc3nR0V5LYbqfzfYUXB8g/
	oLVMYNJ9ZKfBbjfW7yAeKNVmIW+5DKJKIxsB7SjNN/0r5di3a/I7q1olDae9KxeGSSau3tRp/7j
	qM0bj4deliaIUe4YACbSTgIC/EMxOviiXS7/NZfsyKr8RN3wZHskjhCV2U7iGgHnNT46Xe5rtfq
	hoPtwYK9fmqhbsGn8igdLkjoKtUX/V0JgijqP05xEmbPfQb2JJUKSCG+ru24NvM6cADh18E3BB3
	suiBfqQI95/hhdzsAluY8MdSC2EPPPWf322nhlXlk2gMSdDv5rYB0SSoL2yDLbCTj8G6JsNwI4U
	0yuPhK9GUah87vqQ5ix88wFmkZBwCXe5HufdOLhYb0aQ0d4Jt/CWfBASdlXuRiw9Um/zsPu3L75
	WFq9ulmlESAzHy/yHY8xFooNd7CGTmQW43vbk+U0vSMsAqyCzR9e4cCZMfuba+4ZawWkEBnBjNE
	ABMfT+x/zKCQB05GJSEn3d2N2eHSjCaDsp7iem9UoKA==
X-Received: by 2002:a17:903:240d:b0:2e9:3d65:22f1 with SMTP id d9443c01a7336-2eb00519403mr41782825ad.20.1793263876019;
        Thu, 29 Oct 2026 01:51:16 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bddae0sm29991205ad.35.2026.10.29.01.51.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 01:51:15 -0700 (PDT)
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
Subject: [PATCH v9 08/14] ALSA: pcm: report partial progress under the stream lock
Date: Thu, 29 Oct 2026 17:50:26 +0900
Message-ID: <20261029085032.70689-9-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029085032.70689-1-mynameisjune111@gmail.com>
References: <20261029085032.70689-1-mynameisjune111@gmail.com>
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

Staged capture can make readable data available before a complete period
has elapsed. Skipping notification leaves a blocked reader asleep, while
using the period-interrupt path for this event can infer a false ring wrap
when the notification is delayed.

Add snd_pcm_progress_under_stream_lock() to update the hardware pointer
through the non-interrupt path and notify readers and fasync listeners.
It runs under the caller's PCM stream lock and does not tick the PCM timer.
The driver must release its pointer and trigger locks before calling it.
Existing period notification callers keep their current behavior.

Atomic and nonatomic synthetic PCM tests reproduced the missing wakeup
and false-wrap alternatives. The new helper delivered 64 final frames and
reported four available frames after delayed partial progress without XRUN.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/include/sound/pcm.h b/include/sound/pcm.h
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -1182,6 +1182,7 @@
 int snd_pcm_lib_ioctl(struct snd_pcm_substream *substream,
 		      unsigned int cmd, void *arg);                      
 void snd_pcm_period_elapsed_under_stream_lock(struct snd_pcm_substream *substream);
+void snd_pcm_progress_under_stream_lock(struct snd_pcm_substream *substream);
 void snd_pcm_period_elapsed(struct snd_pcm_substream *substream);
 snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 				     void *buf, bool interleaved,
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -1919,6 +1919,25 @@
 EXPORT_SYMBOL(snd_pcm_period_elapsed_under_stream_lock);
 
 /**
+ * snd_pcm_progress_under_stream_lock - Report progress without a period IRQ
+ * @substream: PCM substream
+ *
+ * Context: PCM stream lock held, with no driver pointer or trigger locks held.
+ * Updates the pointer and wakes readers for partial-period transfers. Unlike
+ * a period notification, this does not imply an elapsed period or tick the PCM
+ * timer. The same pointer, trigger and timestamp callbacks may be invoked.
+ */
+void snd_pcm_progress_under_stream_lock(struct snd_pcm_substream *substream)
+{
+	if (PCM_RUNTIME_CHECK(substream) || !snd_pcm_running(substream))
+		return;
+	snd_pcm_update_hw_ptr(substream);
+	snd_kill_fasync(substream->runtime->fasync, SIGIO, POLL_IN);
+}
+EXPORT_SYMBOL_GPL(snd_pcm_progress_under_stream_lock);
+
+
+/**
  * snd_pcm_period_elapsed() - update the status of runtime for the next period by acquiring lock of
  *			      PCM substream.
  * @substream: the instance of PCM substream.

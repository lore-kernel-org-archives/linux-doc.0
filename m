Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793981932;
	b=27SFK+0Yck0tD31v8QBgXc+bJok+oIvYKwAwu45IY6HST98JHrsR/Xo0HSwc6yx4bk6m
	 QSPT2olQCQempJ4lApWjhBEeBGugQ78uSSb+40+PkMfCBSpnxJqPGxDMtrKkE8YpOvBHJ
	 aAWu4dKEpt6B8m0NI/nn9h7xcGEXYHPW8p5cNHOO+oO7t4pupNttqbRJDQUP/qmgzZosU
	 qsJAmI65lhMWrzWpxD3BbxMbbB3KhMnLmU/fXGJe44fPBLWLP/UfMdKJpbzwbb7vjKOzx
	 qpI9hMe7z4rg2XUxJwkdTOSjrPqBSr4lwrFYV3vfsCA5OOoowBD/aZLKnQk2i55529A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
	b=4ZNUpTkfba7JYToxdNKNQPUZ+R+cZQuqCWOFzAYVayIZdm0WxYO/mVjPZzATeenb6Q4v
	 XNtdHFAVqU8GmgJSx2/27Da8c6V7sptaqq0/qYbHqFDRQPaEa409iEsFSAsHk0acCB9Ud
	 3m4cA4302Yl2iHyr7qxbquMEKSHBhJw3+Bu4+ZxNJDeXw87K5luoOQdhiyeHUHOC8RLtG
	 86Rm5JvPL+0RjfNGO9qIh4JDtQdVbPrVkDjsx8WmP3hTDwO1SkMkNaYSVqDokpx38lEb9
	 nt71jtmMrMUFqTJ53thoVyijzJVzTSIW8C0qsSBu3XpE9MuWdC9UazjRzNeLjTgtRVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hG9varOW;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D4D606A32D
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 16:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5D4D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hG9varOW
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1adbf62dd31so1176947c88.0
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 08:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793981931; x=1794586731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
        b=hG9varOWFRVuV6LI+jW10ZhVS1RPXr+sYEnAs3cEGaiueJVRa5q+eNCwBCU5lUi4bX
         onWnntWlKYEVvtNTHV1XkK+/2kpWwuBKGm4sX5rD+qDc5PK2enfDjAHXDmZhiy77yQ8Y
         RLXdE9RSpefZqCNSMjx6u68GwfvnqzTK5rgVQjnmJ42ROoEGt8PzocMT2T6nn7qR0E0k
         IkrqOjzv1hduUXuNG4jF+fkkC/rlMSacJV2OazF4fGeDnBD32JtHlzG1QspxO8sPo5W4
         R6/gP7tDhF5Tf6hecup88uFns/VLVHKitk2iFJzBF96PR5VLCo8eCmYQVJ1Xx37/OC5M
         Pa0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793981931; x=1794586731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
        b=sCxVBm5l4H7eVFX8wC1OQl7oTduIKSmx0i6iRB1fIhvl33YNy/qGLsaaAHayqO26jn
         TwnMxRT/J7PnmhuUrjoPJWighY5HjyjN7Sdr4/KTsP7fhABRm16A3bX9oeFloWd7yeyo
         cVMwqRFUMKFR6gIy34jKnVQUa2SdaBNu3L2n0RCAeSNYla2gAutoHy/6BXTfmZjrEF1o
         QOBVmrBVSiRZgatE9qJTkB4uOzai+ss/M+TKpFHzNIU6Gg48ZR3STg8LmxPqSKAtBMZM
         HK+atyl/ohFIlutLm4s5dhEylVXgMYg72Nlv81P7kBBXtY8mjb+ojo2zOw3fGnUa+nhs
         /KzA==
X-Forwarded-Encrypted: i=1; AKwUvBxHLWgPGDfdH/6QNL7BDeHUb1YUUtbLlPoeXEcmbcgLt/KsxsHRNHv3vHVNbhsYzG/sN22HvAMPsXU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rYxRPHDjv98n/qL37w+8hh8zypeMD3gi1HfBv9n13+fdRFJ5O
	IcTdRvzoCIBTdwXFOZuwUVui6GPQaeEijG/K5iA8+stNQeBKgrSuVTy9
X-Gm-Gg: AYBFou030zOq9bMVolFM4Dztac7lxlroEGDuOuzFVFZS05qDocs+wybvsWuyShIVahh
	b+9kxMLscwvCCbJf+1VXp2a6yhpJGWs+vRzKbfeH98i/9MhjKaB8ehhW1pdYGh15kzBFRAHJet3
	93ycFJNEiVUpiNdog0eXpOE/Y0jBpKN9Plwrl5rnT3JBj4qoqtCxPi9c9yGxqcty5gB7Eyqshqy
	9/vAIbDQ/VvDnBOdhvTUPEa8kFhN3FDtdu0CaNQ4bD1BnWMkiyKqUhE5DETeucU2SR25RcG1ygd
	R9xHx02oGNd9rEAuxZpPF9488KCEh5eqrr5+O2w2J36Mts1kBaVI2hFy4XdjErf4NgGWXqyJpib
	2hAF+OULdq66eXpwLa8XK8O5ao2ieh+QsmrYGuIbApdeK2FO56oZ+CHHd2Hqf8jS+F41UJWVlOR
	gdO9GeOu7NGIwiLB3ECsJuv0DrBRszcUO9RJHtuLYeEptkexZfY2LgRV95RpwLKjAbaJRk6csiV
	NHP/ugBxh0ScGed+OMtapl3EiJcQ7hXQiIdFcjccIZ04txZqIMbuh1u6pPIP/I8mM/8oJ9uFv1G
	Tf7BsPk6DNGEOS9a5RTSXGAkcZqX6fnUlsZd3UYiON+ivnkA0J/0aqkiLonHHUs38zu47ziRmYV
	XV6JGQHxhsLoPCrriGn87zF67DBgzN7RrT9+1tRFCoRBGeTI=
X-Received: by 2002:a05:701b:2505:b0:176:a225:e364 with SMTP id a92af1059eb24-1b25d38aaafmr3408405c88.35.1793981930826;
        Fri, 06 Nov 2026 08:18:50 -0800 (PST)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4840f3sm13139526c88.5.2026.11.06.08.18.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 08:18:49 -0800 (PST)
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
Subject: [PATCH v19 02/12] ALSA: pcm: report partial progress under the stream lock
Date: Sat,  7 Nov 2026 01:18:28 +0900
Message-ID: <20261106161838.94308-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106161838.94308-1-mynameisjune111@gmail.com>
References: <20261106161838.94308-1-mynameisjune111@gmail.com>
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
using the period-interrupt path for this event can infer a false ring
wrap when the notification is delayed.

Add snd_pcm_progress_under_stream_lock() to update the hardware pointer
through the non-interrupt path and notify readers and fasync listeners.
It runs under the caller's PCM stream lock and does not tick the PCM
timer. The driver must release its pointer and trigger locks before
calling it. Existing period notification callers keep their current
behavior.
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
include/sound/pcm.h  |    1 +
 sound/core/pcm_lib.c |   19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

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

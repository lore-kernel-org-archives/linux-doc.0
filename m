Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794182116;
	b=4p68mNXRiQuQDJdKww5leahqMC8q41xJBCzQXevmKGt0uoe4f/vk2s0QomA/yGP0pNbs
	 bn/hREP38TH0BY/a0y5eRDRoGn05xWdQ3dAIXxijrNOZ07Iczqd8NjJAKd2WXlSK1yGqt
	 qzckkuVLkIc1BEFOMFxm4tGvasxwxVz7OU2hnrQjaLt+WEj+wRuC5ToCeXjw6qZ/b6LL8
	 VTM3iYNWwTd2BzDv6VKjU0eDsCOdC/wLlQxQynXF23ay0u44c2o77lLm/N9kKTcqC2n0s
	 b3NDiCAZpFc4EBV/NT9655NNdTnyoMI4NZnht7KBUgKMoCDdT2FYJ905cLH4pS0CqAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794182116;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
	b=2fsFemUuuXxrBNMlpVzYqlRqUx1IHee0dZpxk1YTYSD3DOLoZM7QqHBdcMoj4kNnt/Fv
	 N9rlN3zJeAwTIT3YNJs1AswG9+uBvyZNVQowK9oH1OT/bAcuYCSpmqoyJwCGsL0OjIXz6
	 wkny0n5Hq1wOSYETTdA00ynUqIF3Z55TPZtdH06CF+0L3+edb8D4BIwFuyp7ql3DbFQwf
	 w5YqlWKTN5zBEBb1Z12mmw106tu2fQ1Zs+gHU3ZvVslkRH3b/RIR71YkoPh7lhSj10O7m
	 JAqkjOnzLo5rJUAyzoIXrmpBcP2a5oeTlZG3+t/C8mgjbdlNsW/FbDGlhrBpaEKertw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KZBIczwu;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A020F606A33D
	for <linux-doc@vger.kernel.org>; Sun,  8 Nov 2026 23:55:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A020F606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KZBIczwu
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ed28bac8d7so1031495ad.0
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2026 15:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794182115; x=1794786915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
        b=KZBIczwuLkGkhh8jOtFgXeYfwkZdQ1LFnHavSzMhfPHIZq/O/vzePbTmIhhSjCHqcH
         fcRvmWKFvWGt0ot7/blINy35dq/XvsSXPCnzieM/BG7cWTxWf5mRHGL1z7tw7EzjnpiI
         Gslrrc072qMkBZv5oldz1diYmgX0GhNT4XF17lpSOfWLmx5CQJ21zr9GJE7XxNvPXMv2
         O0KukkwKNkGQ7ErDczOigHd2d3hKlcukilY3bl7q7aemWaK6e4+6Bu7/Yg4Qgz0QamIu
         DNmqR6IcSR/1IqZECcXPaV8jPmsvrBO1hy5wmC9deeppANk77/h/7fhkspVd0Jhi/Nra
         zWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794182115; x=1794786915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
        b=EohnFxuKh6pa3LXsc83OZGZeQFk2vZfpNbKrwL5kyTSSwo/d87JxorNTHzZHMNJ1xR
         rJSrXS9QJk1QTdYMPuI8LglyF+MZWt2z7TjkqCx4gaccQ6QR6JRn09Pg6su+xIWTpWuI
         Eiu+ThCobmiijopE5zwtLUioEWYEY+4sOB9iOacSLtCbHJkVrq2tNrYxOEFTPGTqEPiR
         b24FxUtt1aabRfiFEt85/P1fC3OMAmkXddkshzA1Q6JGXlZC2hEpcaOGTUjNg83rjxIZ
         LJ3WXe+ssGhvj6h46LTv+wm4IpvRZv0K4TmRQdHMnr24ddDg1Y+HySIKhMIHp+qv1CjO
         WosQ==
X-Forwarded-Encrypted: i=1; AL+hErGcU4jlg0QP6GFzYkt+HP3uvF5aazZzEE1LAVcVLU9gIijaYATCVerqnWxo/RS2DeH38nlzzUf27CU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+m7pBAQYCxIAUW/4eWRI1bLvMsWum895p/Qyt0CyNF5BpVvtAo
	9Cp9o5Fqcrb7TdQCuS89BNtXAbIRGOclemUGebH/BpG6oz5ZV4p6QPOC
X-Gm-Gg: AYBFou1P4vwre8d7xa7O07xUiysRloC+AuLtOPAG0G22OOul7ty8QWpdy/s6jLF9h/9
	XmCv1d2Cm3RluRZQgvvbX3O6QypSGoymo7VOt7T/1F3zNzXJTbtnDQqrQvladpwxgVMu6jD72il
	mW8C6XdiWGaoqo4Bf3mtQQDIvnTV0cE2bnwhkw8H3aY6m/j2rBodtquKTI3BDFHmwyCWKi5xGYJ
	3Hp00/Fh/mvNFUmGRbkbj40FaW2Dfaxj1uEAAMz6OsKtfIHxsJAJNVeKXArQw1AGWmWIz7mYFER
	ZGNPWSmkowfY5A0tCR/j1Kf0g0MsuDJQ5Y0s+4A8Ql1CDKPpJwp/ZDh4H/4xoq6y8LtKXZCoyl9
	YVUSzK+mp7S9SvSSRFSyb0mXD5T4mCkAtttlsM265JJfFrDhy28n3bV7In49Dc7fyZHXI2336tJ
	p7Lf0aQCN9q69IsqOM8qBk+xjB9ikoALQDZM7bYB2LCx57IM4tUYhLZ4eWKcAsskjUGA+I3e+7I
	x3zsqv29xghi3ZYhZObeK0I6ZOYuhN5Id5haQL2z6ZViIZVyLulUbT8ExjH890ki7UlaWP9s2rM
	rFmWxvTltqXg2BNv7gAL8iQy/ADVHThx3qWdKVdZWB+eYH+LTOCGs4q9TcRka2lvgbUbArlyQCv
	lxo875ugi5RJT1pGE9E1me54MuHM/5InqHec2EN7wt/O9J+8=
X-Received: by 2002:a17:903:acb:b0:2e9:93b7:23fc with SMTP id d9443c01a7336-2ed6809d0dfmr37072905ad.17.1794182114866;
        Sun, 08 Nov 2026 15:55:14 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81722edesm6095215ad.55.2026.11.08.15.55.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 15:55:13 -0800 (PST)
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
Subject: [PATCH v21 02/12] ALSA: pcm: report partial progress under the stream lock
Date: Mon,  9 Nov 2026 08:54:47 +0900
Message-ID: <20261108235457.12688-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261108235457.12688-1-mynameisjune111@gmail.com>
References: <20261108235457.12688-1-mynameisjune111@gmail.com>
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

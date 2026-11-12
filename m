Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444488;
	b=QPYNcTi6Hqy7JYs+7zbDDAWFtNaHJj+PqJLxLWsdN0PnOis2wDKtDqwpnY7wq+ZQRCuR
	 gUoIPrqvlEZ6bp076Swz0+EHUzU2wEUee+tEKTPIKgI8AvqoXdEm9AgtFWfl8426nQ0M1
	 8A6O7yDNN+MNRm+yT2AhTxDtdVGL0rM7tMInkifNFkd+3bGAE/4O8V3owPrMgl+kINcci
	 3fmoNUCNsfUGS7MNFwWwAaOFeuwSWYjEMncljCENvZSvjK4yWfqlLPL5eMLbtn03mE3PF
	 EPeD8fG13thTj7uwOjZMXBueImCY+j3VS1jb4kYJXErIa3WDdf6nQhzQamLpCs6bGQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
	b=NAWwUEd5G73mePplhawBX6kgHd11OzwyQ1tjCF/6KKKKo0wm/kcvymh3m5mnlE06lubw
	 V3NW0YOd6eykMuC6Dh+qrblAzSUDeu82b9cxOrBoAXsqqoa+JELWc4g/otNGUQaJ5FPq/
	 p5MLwc5PBFhKMuq/VaZd6rHXJry4FebE9lxnBqoPJyiACQnoNOFPftDpigkFnqP9beEoX
	 AzWjsAEghyJOdMJ/n90MBQLczoDF4+xG2EwkTKMIuW2RjAA97VceE2oqtzAylFRckGf6P
	 MF3k9tHIYhKJ3srzqzuINu261eHGjjFeqRdm8NGsxcB+W3edn83jj1bB15RM+np1zww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="VRyNuhB/";
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238CF606EE2F
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 00:48:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 238CF606EE2F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VRyNuhB/
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a3c08d6928so6228493c88.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 16:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794444486; x=1795049286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
        b=VRyNuhB//q4Mh1RlEwxvl/TskKyubrjCDwlj5azMequWt7tGf5cEhBKtRXs1UgQfAP
         TfUPRsukE0v+O0XcSw57aV+6jm3lH+9FNI4MeWbxHSXQ3MiWjpNOOFazcch3CEXn6h6S
         NBearu9sxzWfRYlSeSUcBSqaaDa+eiGC6A0ZAJlqoLPx/rujuNhE5hHqEb8S57p08cFe
         l4AO65WD228JNjuf4MztRaONJz7m+NI8tztR3LmBeL0R4JVjYwh6C0OlR+ElpXiF+hip
         p/Ti2+FCER21AGZOh1QUoaL/oKSqWP5O9Qij/nAWiarXR2DD1CqwM5WILvA2h1e8/Diz
         mhQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794444486; x=1795049286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
        b=dIjcprhzw53ZWgWQZ5Bw6Q3Et/Jl3LWl87n4uf7iVFayukmeLXxFM6gIquSBo0tA1k
         jB9KLbDTMQeN/axIRxFfHBfd/SbE4cbiWFZZ13d7YsAHl3CJsc0kGKQz20gF6r02usMY
         QOwGApW+QuwyTm4Ofon3LsxULOdKBXLPa2P8ahDQrZSiWDN+3ts/LHAuuBqPUutiQ7QK
         zhhQSmTQB6sDhB5L+iN17FgNBT4xN37CIqte5l0P6MsO+Q46mtTXqhdo6GOOD0v7pdKm
         wspufQitQLlNI3oioaQyUBPs3GK22sybYPgRhFZPHgB4ZC51k8T/2AsufCWH43Ybc5Z5
         wYTg==
X-Forwarded-Encrypted: i=1; AL+hErGDzpQ3gH/tUgPVB6mRl2mTHzJPMZoDkKYlULs4SiRp8ctev9Tan99/34CA5KfG38BuT73OqoWpMDU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/c9JXkXKHkp5fsZLThK5Z0NNsdPY+LRRA2Wcy2uKYR32F/EK9Y
	fXHPykCzdlCpL8wU6KfPWYi0a9wnnznPENx4J6rscT7EH2SMAwlEZtwt
X-Gm-Gg: AYBFou0Ydt9i8huDRBgFiegaBIin/LhkWXj4/oV20gEmuNfx+jY/eiBvqdUn1Q9e8nY
	K6Dw79ZPDtM4Aruk9uOXQGiS2kKQ0+g6csuKGanyC3EfKbfOiSGh3U50Mx2V8oi9+1KjWqPNGhY
	BD/qAFwBJbBCjhbA35hKcAXcLVKtJMN6+JLAcLpI8aGZ3TsfMYw5f/w4nRtMGHa5kjcEPiIHRdo
	UGJ6wxpQuo2R7xbMPxgqcp/gOEhMvfxxeWtgCwa7HM0a9QPBab1CUZaKdPJ2ZSgrIRl4gC5pYl7
	3aqvLkG+iGHb5t93NW/4BcGwZVzieVk2BZf8PPEu2sk58duAnwU1JOVApPHRmEUlTS2NoBJtwW3
	dtU1CgLyjQRD2AHag+KTcE1AfhGyeFZDGSvw9Gb2moQehu68271Epa5f4dcXCvtYWuBFVX7cW8k
	lKKJp956c/U/eDP44N2LzJjk2GMH+agWOkxHXkvUDW7PUc9ZhCK8SBRGkL7I8orm4gCsmqV+zDR
	PmmbO5Ui1aMxXCj5cUOyLM7tCJKGEv4aU7dD+f8k5I7POeV1TUDb2ncCBxnKY076icly3RRoZp+
	QMkOE4UQArNi5YIUzeco9xT5wF39qF5Uj/R1unqkPS4G8kb2w1snnCZGh1uDU869lGzV21HaQGJ
	jwIpgqD6qLl+5B4Mkx7RtU5sBXK/RR42zW4OI2fDirhYdQgY=
X-Received: by 2002:a05:701b:2504:b0:15e:9126:c60f with SMTP id a92af1059eb24-1b3c0342f23mr3517225c88.29.1794444485979;
        Wed, 11 Nov 2026 16:48:05 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm20672163c88.9.2026.11.11.16.48.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 16:48:05 -0800 (PST)
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
Subject: [PATCH v27 16/17] ALSA: pcm: add an explicit application pointer to indirect playback transfer
Date: Thu, 12 Nov 2026 09:47:03 +0900
Message-ID: <20261112004704.49758-17-mynameisjune111@gmail.com>
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

The indirect playback transfer helper samples runtime->control->appl_ptr
internally. A driver that needs to refill already committed data from a
pointer callback cannot pass the application-pointer snapshot used for
ACK validation.

Add snd_pcm_indirect_playback_transfer_appl_ptr() so callers can supply
that snapshot. Keep snd_pcm_indirect_playback_transfer() as a wrapper
that samples the runtime pointer as before, preserving existing callers.

The explicit-pointer form lets virtio refill accepted data without
accepting new application progress while the ALSA buffer-access gate is
closed.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
include/sound/pcm-indirect.h |   24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/include/sound/pcm-indirect.h b/include/sound/pcm-indirect.h
--- a/include/sound/pcm-indirect.h
+++ b/include/sound/pcm-indirect.h
@@ -28,15 +28,17 @@
 					struct snd_pcm_indirect *rec, size_t bytes);
 
 /*
- * helper function for playback ack callback
+ * Playback transfer using a caller-supplied application pointer snapshot.
+ * Passing rec->appl_ptr refills previously accepted data without accepting
+ * additional application progress.
  */
 static inline int
-snd_pcm_indirect_playback_transfer(struct snd_pcm_substream *substream,
-				   struct snd_pcm_indirect *rec,
-				   snd_pcm_indirect_copy_t copy)
+snd_pcm_indirect_playback_transfer_appl_ptr(struct snd_pcm_substream *substream,
+					    struct snd_pcm_indirect *rec,
+					    snd_pcm_indirect_copy_t copy,
+					    snd_pcm_uframes_t appl_ptr)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	snd_pcm_uframes_t appl_ptr = runtime->control->appl_ptr;
 	snd_pcm_sframes_t diff = appl_ptr - rec->appl_ptr;
 	int qsize;
 
@@ -72,6 +74,18 @@
 		rec->sw_ready -= bytes;
 	}
 	return 0;
+}
+
+/* Preserve the application pointer sampling of the ordinary ACK helper. */
+static inline int
+snd_pcm_indirect_playback_transfer(struct snd_pcm_substream *substream,
+				   struct snd_pcm_indirect *rec,
+				   snd_pcm_indirect_copy_t copy)
+{
+	snd_pcm_uframes_t appl_ptr = substream->runtime->control->appl_ptr;
+
+	return snd_pcm_indirect_playback_transfer_appl_ptr(substream, rec, copy,
+							  appl_ptr);
 }
 
 /*

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664291;
	b=ZhGkRR0A1LwV3H0K59Q8VwYlooGcn2VEempu5IepNa1+G49EcNWEWB8AZFmCB3HfrXgP
	 wGczZSMTXyyq0D7WNkBts31uDEZBOus+DGb2aGBXSX7JD45JBpzZOR+bcnUtlNsDtmvWT
	 mDRY3fDXVQTLH1Bridy3TBmXDEgC8T5La1L2tRKlBBMZM9FDBtPJcBbsHdtyOpjfl1W53
	 iuFfMxFbOhfYBrIj4lhUay4S6q9ndRpF1S7zjkjuHyMzQO3HO57EpODyWs+4YZhPOke5J
	 udqtOMUC3ydqOeUc1pu49/2PaoO/5giZcs51b1HeJqbWXOStYoMpiwkQ09SRrSuhUZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BRslTI0ynJSL8rFIMfwDZ46YUeqzoiUybS2SxS5DQ24=;
	b=KMFjOjU3VTp9j39N9O15d1wdIh9aSslDVs8znon/MWvZoBXJeYhumBcXmdHprIwqyDnh
	 1k2XdTpkn/EeIcnlQOvjmAiIVu2h6IMpKEhJI0QzCsUjqSd5QHWccxWhg8/wX5Zs9nWyC
	 s6PgY7OpOdv5UaIQvxJK/eZZPz7h+cudCRqY3XlcB+NzQHtcppaA5rRiA+rP2GV9qPwwQ
	 r8rhIuDSST8ThUQoIPMj3LhHB2ktB0no+lTa9in9cud0NEVfQoMyuX8TbULu1bBpxmYNr
	 r5DkEZBzqhjUjNNMM/Xe7r+RsEPGD53+m0Brn+mlFFExuA+nujsdxn9FxxZVt41TGdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mrnDsFY+;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903F7606D809
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 00:04:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 903F7606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mrnDsFY+
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso1585145a91.1
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 16:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793664290; x=1794269090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BRslTI0ynJSL8rFIMfwDZ46YUeqzoiUybS2SxS5DQ24=;
        b=mrnDsFY+eebB89xZ+DTIafFd39MdDkOLEYtamDNq83jCQfH7RMjlPLE2anoUohaLr8
         oTwh53Zbi5SzKKY+nR+3fBGfl1xBauWGkT3Kq2E2hg35H2tnRevGfJYnjygVezf5M/nu
         BaU8nkfqxQgYA6GiVXCBgeLyM0FHPbiKy1eweNxWcznMkFRk7ob9zF3wfDDLdS8zhKKt
         dj0KBRSRbTctb+hkNWansuprjxYlK7kBAefQQJtmiWTn1vTQ9ebxi+RxUAlfVAkLRYLe
         gir6pb43XjiYHjPMrveNT6qMsojM2Gn+2PcZ0ctGQJeEveTSJ5KIDqOuw7+92rJLUFKk
         EFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793664290; x=1794269090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BRslTI0ynJSL8rFIMfwDZ46YUeqzoiUybS2SxS5DQ24=;
        b=0/VtVS5m+pRQXe8vLwRomLWWMAQQcivVjTSg2LfcBeDqJ1HZTcLT02J9U/LCsjsZcr
         alVamNP0ptLZaVB0D+Vh5KGk0dsovYxki4WRmZAF+j+huajOPINyAdq0vl7J1CgSB6ZK
         6gM1NQyEEAGd9Hvlw8sxV9fhxcWylevQHu8xOvNI6unEwXd76f1VxD8s/c8UqsekvY0g
         c5jTREbH7tvYDkw5g9cFEPN6/9wrB33/Jr0RZHBfTR/0Gvnxla48BlwnQ9SFUErYUt7Z
         ZUMjqCzddmbr8/bph0asG+8F7SEksYHnWynurXNbU2/E03YNeCzcj3ONnSPsTR5UFBin
         fvVg==
X-Forwarded-Encrypted: i=1; AKwUvBxfQ14hl5pmzdhT7t80WIvhYSoF/jW6w7X8O4gxPhSK0r0whTDK0xbZFeKS+bgjC5Xj6EjEkf0kKIE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zznwfBEYF5QwH+F+OnVbLBtb83RbRJaf8AVW3HoNEaOoDqPEG
	16yoDTsBWgnT9TupMaOFUZaofOqfBJgVL7wMn1+yJzv2flhm+1drRpcU+G1NXw==
X-Gm-Gg: AYBFou2vIWyacZT8hcbp4tmrCncHyQtUOs0ed2BY5WXAG4+5/97KhB077ZLgKND1xR/
	0Hh34WdUU49lgsptWgwCK8zJeMPGQJ9vor9Ss+nc8ShRrV5Z4+YNb/WZ4vGnc6SZFkXZlVytvRp
	0unC3e5DdcUZRisZtJOc50L7PXyVPbWv+JQJ4ceeG1ZfbCgpK7MQZkPMxYl3aCLFP23PUHi4OtB
	mvBXIx7Vp5tW4ABQPqi2V9V9b3SnwXl+/MJrXCCcMAwcLN4p6/b7u3LELaAdY3mHFshGv0Alniu
	j7cLVP3w/Fe2SGPvAG3s7APtlSel7uwsY8Z0zcvLHv+wiupVCQlf4IAPGl894zbTnJQfP2PUyDN
	5Jqj9xMebiL+2hpP3d2WZsJ7oJCvDeGCeuVfy7XtAquJ2maRdDeX7oohxEQHeQoQw2Esm3pUBW/
	WgJkBGpMQocY8FwEm8zYBECi7YvY7ZkZODDvO5gZceamag4mnr4cd+eEhc59ygNZJ25qtzS7hbD
	rv8ClLojiYRiOQZiHucI2/8nDOobiRyvO0RbRY/h3tq6vE91lxdRvMK0AHWwMIuzyhHM/xvGNkv
	07phVCa+xOJhcZWLtgFhkTSl3kxisEyQPp0K+lvoHusyY4cEWxTet/bePLursKUF4tetSGW4m1W
	tLaCbYpFBVUjZYSIwg5vUGOfThnnDV1jBt6gFIvj+OUl6aT4=
X-Received: by 2002:a17:90b:380c:b0:3a7:250:333e with SMTP id 98e67ed59e1d1-3ae896f8315mr9974105a91.11.1793664289956;
        Mon, 02 Nov 2026 16:04:49 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6b3493sm1339225a91.13.2026.11.02.16.04.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 16:04:49 -0800 (PST)
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
Subject: [PATCH v12 12/12] docs: describe virtio-sound capture options
Date: Tue,  3 Nov 2026 09:04:03 +0900
Message-ID: <20261103000403.67106-13-mynameisjune111@gmail.com>
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

Document the five opt-in capture module parameters introduced by this
series. All default to false. Describe the startup-empty, short-payload,
packed-status and pause-restart compatibility behavior alongside staging,
and require validation with the target device.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8328,6 +8328,36 @@
 			brightness level.
 			default: 1
 
+	virtio_snd.capture_allow_empty= [HW,SOUND]
+			Retry a bounded number of empty startup capture replies.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_allow_short= [HW,SOUND]
+			Accept non-empty, frame-aligned short capture replies.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_packed_status= [HW,SOUND]
+			Read status immediately after the returned capture data.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_pause_restart= [HW,SOUND]
+			Release and reprepare capture streams across pause.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_staging= [HW,SOUND]
+			Use request-owned buffers for capture data.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
 	virtio_mmio.device=
 			[VMMIO] Memory mapped virtio (platform) device.
 

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180552;
	b=yuzOCY3c4ZkEHsWHUjPQVIl5YI7dK5Zms0Y8L33qWF5PSmup8vUSX4cAbQSZ3BpjD87G
	 KbYBQ0D70aBFbtGG/jp888gayjiUbekFzLFObvNtNoYESL5m46rByW+1OtWG09UgxtN/P
	 95u4YN2wjTjw94dbrp9w3cZzsLtsPyAYT2dOXWH3coXnvC1zMorbcHUSLTolDgSdcT0ff
	 5e2sKmL6RLNwmBdhYfIYQH/QwaW0aDkl5FPA4y3blYQYbl9Av4wKmSYaiVAZwXcHDfGRD
	 YC0EOrXsYeJf9RSvn7jLljoDmGEvBzz3rwH+zPNAc9rReYTzN0nf9PMCxLIBWW1zYpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xENf0eoUGZdfDkYJ3sDGskH+jC5/Mfw71VSp/kGlzNw=;
	b=jXjSFw+AAvs+NvdTMz9fMpMCSCBqhas9s9YltN4YqI8Xx7t1nV9UiDhAUFAjJaZt+19t
	 vSVhDmA0O9NBdJD8eiXaGGRZNsRbMp6wobxAGssSThFjY7gJCRoEzOL4IlL1kYZTomoMg
	 fYXWpgeIMFIipplsBfEy/yBI+R+3nCX90q7RIN/BE/5PDTiDRb1MlYnr+IJNjsVpRMjP5
	 nD2z6IX8OTobel4O0Edes6LPtsasnmK9wPz0tlehcuj276044Mripprp3wUkUtUxRhJVT
	 SPZvdktgR0yid1a5Z4qfeReHixiFt59Lplstt22qmzzbCix4nfIHYF5qNztQGegACqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g8NlGIXO;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F042D60A3832
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 09:42:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F042D60A3832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g8NlGIXO
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd5d2dafeccso451449a12.2
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 02:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180551; x=1793785351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xENf0eoUGZdfDkYJ3sDGskH+jC5/Mfw71VSp/kGlzNw=;
        b=g8NlGIXOA/gCtXZ/AwBmUMha/hD7dvU5ooqyd/MdITohXhlfRxEsrhBFq8QJQu6ucH
         Jlnw2MPPDDx/qxsdsdAC73zBeSKnCl4jiodalliTsMBjvFOYDMjdt3uh2fUXinicZQIJ
         L3fhmrzm9hX3m55XD8d44zNoarcI5aBZS75o+7OyjUIdXYxmti+PpJ88kyeUMgpsHePK
         5sfFgkmrdPtNPNKWfru7lIvpcbNLdHeIpH1BN8n9MmmvGKEeg5N6TCPE86mMKV9yvul6
         A3h7A+nmYena3VTMeniz7YvwwA1bnu/dCSBehkPeGR+2zxQBbmPwjUlr2qJ1e9xtCofR
         jqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180551; x=1793785351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xENf0eoUGZdfDkYJ3sDGskH+jC5/Mfw71VSp/kGlzNw=;
        b=VXcS0pD3C+BVREiqW2rN/Lrpgs/b5Py9ROf6ib0+gOpsxfU6e/afZ1HIVKtZHSEmtw
         AiS/ihGdfTXraEKzpzX0fd0qixFDjhsft2wh4/l7h93drMrzRoDDY5IwQTKVktIlE8cG
         SsIzhKZNLwyz6mCrXWi2Vc6eMpK+CXvsDGFqsh2iIbhKx3d1uBZeRP26UbsaA4BIYl/5
         xrGk0eNqeTgB4BXHNJkWACutHYZ3tU7PSArpT1EG+cRfJZzsBDjOl+Zf91jBDg7i2wLL
         hV35jaBpCBIQoGNiO2p3jHEsSFr3x7E/r6VwaGfSbzN+75uq+kNLfuHXHGgwZskAnUBo
         MIkQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5KedM05kRlKcLYY0ZyB/amO4Vy398AOKDQ5N8sItC+1IWyKD1GP9iUhSrZyZ3vC81pg75IhxLMOM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpvXD1lRoYri29j516aGGdT1PBiXmC3AQyggZE+O6FPpB2BcGp
	D6KjWDyoHDT7kcxMMP/hfIlp6NaM0+sugnLHm/QFq2BOlXsAQLwQqLnDPPPr2g==
X-Gm-Gg: AYBFou0ysUY7TS3zl/Mn6ysuQVW2Tf+cjq8TVjhbvPgx5zNKcuTIIYS+9cT2YtIgYgP
	NWlPfYgk5pcX63vXC8O03WCs2hhGMnv+HBv4UOuyvy6dfuQB1Cr4ZuAsrRV7rlXYILLBKkCqWvR
	uQ0MtF4XLMHmUiAbkqe1riKmLH49JfgJhZwxZ3oeQVLpzldaXctlEyeNKc5pxOwPVOhJFLsXVEY
	W/+E85fizLH9JbWTSGn1S709a7T7Nx0ePdo1GsA+RUy+1Bi1K3kFGWg81qG03Zd23UjOaQ+Dmdn
	IxJ4y4JgbG8m9r4MvcteV/DteEfV1UawjyV/Oz4P/oIuYhTjmDHp8Auqu1MhLV9ivep8pnyD22e
	R9g6ROUge+mvnGp9se8cSXptO/hBKwtO0vgyGY367Zo57JG8xDqYrk+Z9bIObS1fzcs1d4yXlBy
	YY1WkZrYKYqq77JVCjMQv5YX9/TTfyg705O7f7DqbtrCFYhhli0CXAtB4DIDA2glafbcG+iKmRs
	2TdxGQDZTnVm81UmIlG42zvVgHaKg6RYu8MGYsYY+P29LXhn7V+jRg1MVDOtlTFieRSj3kBYwxd
	fefBW8rKChkI0JgB6+OVZUzBOYH2SEcJUUcSVfRtNjmwxzUsH7WEvqt1R3JR4MD1r8NIIa9H0Ei
	9OEvUzTScxVl6PGFL0q57lIgv1LmiNpI9UBzMKBwCLWXji9APlxqvV92b6jYwcbspdw7b
X-Received: by 2002:a17:90b:4a4f:b0:3ac:fe93:a731 with SMTP id 98e67ed59e1d1-3ae5822102cmr1339726a91.56.1793180551322;
        Wed, 28 Oct 2026 02:42:31 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a93b3f5sm2242377a91.5.2026.10.28.02.42.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 02:42:30 -0700 (PDT)
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
Subject: [PATCH v7 14/16] docs: describe virtio-sound capture options
Date: Wed, 28 Oct 2026 18:41:30 +0900
Message-ID: <20261028094132.20364-15-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261028094132.20364-1-mynameisjune111@gmail.com>
References: <20261028094132.20364-1-mynameisjune111@gmail.com>
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
 Documentation/admin-guide/kernel-parameters.txt | 30 +++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index e75344f..6c7b1b3 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8328,6 +8328,36 @@ Kernel parameters
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
 

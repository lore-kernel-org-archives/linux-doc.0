Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793412575;
	b=xOEl73Lyn9n9YyNH5BKGPXKR4VQFDbtS0YaXNSaKcydlGfYR3c5YVqxIitccmypsZZ29
	 J+7zXs/ar13j2ambErsm2MrOQkHjAVc3e8yKCmRZKzE3zZ0BCXu8iQ5FG++N/CuAId2nX
	 LTcg8GewQOBTQ83cg6YDbcPJfwUdmz4i8rJZiVgcMQhE6QQQ8Zsu58GN762F1kQNRpwo7
	 DDb5WjLd92w7wUsHfLHcuE8pBWqw3/VYpEcH5brEalYfTaEqiuxcxDRQZkWPO2lpCLgDs
	 3CRI6NaDkKC/Liaa89Oqle5X/wL6VCGI4TlottN2UDPMNJkpHwrz6pWNVowcGVKprhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793412575;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BRslTI0ynJSL8rFIMfwDZ46YUeqzoiUybS2SxS5DQ24=;
	b=No3RiNST1xBuQNla8+DvE+jMle3G0gwOxRJ5a5fvSqQGlifS4G/TPanSh9o2DBTBEWak
	 5mCUsFfBa0Y3NFTEoIdxRogd4SJFXBAi+KTuXS26BmHF6I7jUEwVVkJUAxEYfDY63Ljjg
	 LhsHdk0OtEiGse/mo6R4QMKnv0a97EgJicMRJf6aW5oqbQHo8raBGqnekIMtuH8vmg0c1
	 Shwd1UvcJLApyzL0xSKV3Q5mkONi2J+j8wiozhJnIqDD16CEFZUpR4UNPv04VBSlFiu1l
	 XNfBWdfsLiR7eFPrCtxj8nzxDjmS5ZayXV+wRaFq70swuQSKirlsH6Zfz/34yQElvrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G7iGQ4IF;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC6A606A320
	for <linux-doc@vger.kernel.org>; Sat, 31 Oct 2026 02:09:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EC6A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G7iGQ4IF
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35c76e9614aso1920054eec.0
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 19:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793412575; x=1794017375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BRslTI0ynJSL8rFIMfwDZ46YUeqzoiUybS2SxS5DQ24=;
        b=G7iGQ4IFc/BWafL3mBp3RPPxJEEHQHFCjY4ARkrpUYgPScVdaAbwb9cs5+DjTPpaYF
         aO56AGg+1BC9a6/ToJkomyQpBRFK97VV1vCuVcgz3v5JKjLNZ36hG5OR3OVAN1CrERjQ
         1q4icAHukc8xInzbMhD2WqBOuayu0DlHMUHrNMspioz5DG1Jru4IxstJTCg9NsdNvboV
         5+xgFPjE5WfxEZBa0odoCt6Gqsc/NuPAV2KIL1UyS3N56R78ONNjfUfhONxMYqo1N9pY
         VqD9AS3UusvS17N1hCMpQo24l49ycpKw+E5v0MGqwaeiu2aIfC/H+Ek/LeP7ZgVsHnFo
         6Q6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793412575; x=1794017375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BRslTI0ynJSL8rFIMfwDZ46YUeqzoiUybS2SxS5DQ24=;
        b=WmesDzGmTR4+/gFVrAgiqp7JgEVSZjVxxGuL88gI1W8MU1wLyJPOB6Zfq4Tf9f9gp2
         GDTcR5D2qZv+xk22xJQsvWKbEXoNJGkQ6JkfjSSh/ACovmzjcH4h1sTi7xc6W+xZe9D2
         OfuC9/XZKWBkACY8xrQAK7Cko4c6ezDyVVbgiZ7e0vuzUsxz+UKt9d/UYmJgt34duV0j
         XYzgywTYltGXcoLyB+XArq4Soymz0WpDMIaAJq+Fd7Tw3sgVqNjJk8CfV87BxiqT7bDa
         xIRCalut857HK3ztIwypCpYNk7KHA5o9/IB0cIKjdNYl7i6Yn1HLgd8UVnG9H3cvF+1h
         bjlw==
X-Forwarded-Encrypted: i=1; AKwUvBxKRTqCyJe+ZZNR3MiSInCbRuNJ1kNA4oIefDqWdvgIv3jLCkqN2Fd+HwhrQtz/wWgJOHEltOfjQ48=@vger.kernel.org
X-Gm-Message-State: AFq9FYIj2dEUg0RXC5KPqxFQn/yC8eWkRA366eijFBsIr9jHow+AdlXy
	iRpdMaDt6ZXTe+5/KecdEKzYW/lFP+PQwYiTQoU3i0ayW6odF7Esj6N1
X-Gm-Gg: AYBFou3TkrTClYicEW9S4XJtNfa7YY+lXIMu7ZCWKfoeWKdfH1/RTKdggEuhyusOnK1
	/EAK01H+Bg86OAkW8xMYzsup3gZCFA2TkX200f7aiN/sDlQq/SeiWO64ft7vnxGRiq5h2I5yoUP
	bXREGW/C5KjUF9/rfmrxN/PlHfWB06dkPAzxT7hAvIwX541+wKPr5rbduxLTfpPppjgQBkirW1/
	59wd5BPQLWlSiL33fl2lsPZxqs+RWuGJKZSIJZHBh/PLOmu4ynHcJNRWaH4S6MRQXcnXd5Tel+R
	0tLq6ACZDYrvoGUIpo05m1Ym/rwiy3M9kiBwdKMCoxtYLRPZn3QntvHTVyiczgaaAvcWGGCevtk
	bG0eB+8YuTiczFNrEuwWaEeBwM128buwNNzQ5GLCOTwEPPUV24c7aW7ZElLpFxbGS6WlJela5EZ
	xUr6knhUnMfyxxlIz3jZizXMhot34JRpQ21avGiGER4V5jHGYr+OAyXwApQpuMwKlrgKlxmmfEA
	8zN+Jq6jlG8GYGGz4HXL3gI0ZIoSx3hmCT7KjnqQgroeE4tsRhfWbYvp7xOCMxJ5aKiZdd1yuvM
	BCTyCRiyqo7gSjDo6wGVhDG/j4L1sy9eo1PWchVWQNVRs6eqrE4Yf2nLq45EMXKFcwiJWHG3R1+
	NXWOKoLUQiy9elD+sSQZec7OcVnwf/pp/l6LJeZQG8iBw1w==
X-Received: by 2002:a05:7301:b01:b0:36a:20b8:ee9f with SMTP id 5a478bee46e88-36a42203f98mr5112880eec.1.1793412574561;
        Fri, 30 Oct 2026 19:09:34 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm13214096eec.26.2026.10.30.19.09.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 Oct 2026 19:09:33 -0700 (PDT)
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
Subject: [PATCH v11 11/14] docs: describe virtio-sound capture options
Date: Sat, 31 Oct 2026 11:08:52 +0900
Message-ID: <20261031020855.2402-12-mynameisjune111@gmail.com>
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
 

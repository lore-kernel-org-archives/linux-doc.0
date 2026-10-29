Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263890;
	b=yliHyHGjVIntkrmUybyrIrLC+aMbZ6VeKAXjcxibA6krflzZIfzkF/QyS33TktEIPmjw
	 SJ1adHDuq36flESwrHmPWkvmGrLvPHROMOrfeGQkSXFwXepINOldzJGQNdKy9qokh1Lho
	 eg45tfpglEFxJUbcQlkBYirOz84Cj4YSlSeY4o1os52MvPsTn9N7tkTxRS01FJyAGs8VZ
	 6LdPTpguEmVDdOrTRTU3fcNeXGOAkQW45e5SzZSOWnYVBYJnqd7o5g++VoUvOXXTFWjOz
	 y6b6beF/dBin1wSKcS9GFx8mwaEzcPxjWZrfcOZlgHWzqyleDbnm6IxjmEm3O+6zaVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BRslTI0ynJSL8rFIMfwDZ46YUeqzoiUybS2SxS5DQ24=;
	b=uspvyOGw7XJBhNy49/d97fyC2j88kLseKZiuPqzEGHxdIIWec+1dwntdCwtdQS1a1qtM
	 NlSQ5n6mBHNvjkHBPm4EnMnnOCEbQHVLxou3sFEEl9lb61NXz+RH+zS3FG0UdR6G0sToT
	 tnp86jNPgRsUsR0uWLfAMk/8/M14Drtc3ccaMFnT/QsY+ivsgqmmVGE0qgtxhl++Hk0ns
	 u7V3QmwzTwr7JgmIrPgxaqBeOcSwK8c2cWnHsqq3TPFiagy/7zcYq1zQTTD3yMJI58t1v
	 hRMIim+EKBCtgoGJQSn0h0eAzHVG2tbRSDmJqrYL+8FlUbYGnyTDstuKfDIvnkOmn0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qwmoa4L+;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126B2606A32C
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 08:51:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 126B2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qwmoa4L+
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e987a2ba0cso11715725ad.3
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 01:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793263889; x=1793868689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BRslTI0ynJSL8rFIMfwDZ46YUeqzoiUybS2SxS5DQ24=;
        b=qwmoa4L+HNj5Q0fRNwQ9fO7IO1jY8UDZ4AzzzoGERhLqXvirZSUk4RvHLE3pEQjGND
         72sBMqdzJpub03Vemg/+JbXq4B0KN1WOnz8sbPTLmag5Qc2vxxXtLSMXuBhWH5h+sOm4
         ufXDOhG2fUyB6uT6AHC0jpODcP+nyc9TO4DJtV0SsDHktIlwGREbiUxzmUggQYmQYsCn
         GT1SwxqFniTQSeNc/R2FxtmabHtV7neWsR0cbB6vr2Jp3GfJjdwLp0KL21O0HMRVD9yb
         wYMm+daKpWullHSqYNh9Ugruc0C3NfUslQpOrLfZxY3nGRqhD6GsI2ilQMGKKwf8BJaJ
         CabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263889; x=1793868689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BRslTI0ynJSL8rFIMfwDZ46YUeqzoiUybS2SxS5DQ24=;
        b=ir7cTWMy/mh80k4vhK9f8MlpOsXWgqkymHXlJeh8zjYsgqiPwinzE0eGvV8xi+jVgy
         4MGL/mmmyrwVHr4ntzGyIK97Hu0tS0uiEmKW2CNSlhmErzkPC5u5R+yEinw+Fgux3ofM
         ajB3WHeVhzEvzl/3fM6n5o+pTQKm7p6Bs7bca0hwKKxm2+y8ffNXx0U4NWWte5n05zvE
         szHSCJqriwdfguZFI8YuKBXL4710hVzJx9XpEQhDm5JQFKQr295ThKlnAp6q769umDoO
         7YfeKwDC1sRWgQJiWRPgYDySZVmWorrbwSxQvxcDE20KZ8DMxt3ArTrWnmTHpxvRRV/O
         1DPg==
X-Forwarded-Encrypted: i=1; AKwUvBz8aksJLQk2+KVarfNAkatfNmkMLzJfBWG2y6wPrViErKN/WI+IsC/rB4gE28DctPZmJPB3smceL28=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMsenOjxjNvb71HPbTE7/4dGdd1g3d/9f0W9UrzVZfgDMSgYC/
	EoTjQly5CmVMKy8OmWs7caBPHIkUoD62m+CgL/Q/mWlU55l/hq7ha8Z3
X-Gm-Gg: AYBFou3Sr/SjtYMuAG3Tr6VgmTyaQX02qDKDdligOPYO/5qv/jR8/iwNiU8k7eEBYE2
	Qjdh6//KkavaHmVIgj73B5t9MYBkpp6SqDWa+60vKZSBeMUI2dbDIQ5j2Bj24V2ZETgWayRByS0
	mx33TdJQxszRI59MCy+hX1gQrVczm9DRuiw1HGPBD1WczICEAgybHQVQTkgSenj7JkWPzehl6El
	EtZhtSGh/Jl/bDWXH+s0xSWuBgmoQfHAhg+dJefPwwS6siydFuNm05kXg/NRV4iH/1NO+2p4CbR
	1hlMqiA8mFpeRIIEmBz6XzeUX2rvK3ev9qxBJrYMPQm5dS8HzDI8HdbeFnfigTF8S8ZPWCrojvs
	uf30EbkMcKJbMqWvNg5ADoFrZLMYDe9tGrFJDCgWOMuah065c7amGpVtQRl1q/JLz8ZAWMOWfAo
	ASHOOkHCAaoKFAdOdoEaGnV7L6KbtCT0pIQHiW69EPasSOBV0AP/TrhSt1Xn5bRDAnKbYDT9CK7
	uLSADnqxBt/l8EkVRw/ovQisiNet8BX0c/DGXrqALs96ztE17aQQvCqYYfgo8K9+/FM9KVsJiqO
	KHwbr9yMf6zkPwSRleW+A11tpAdloIcpOp0OMbLXqBrAp2N8AMEJnTBhzPyk9/lfPr/QMaTaWmw
	5jJLRZuihZSU154iTCzCDOUYQW8qvrngogl0pymXN1g==
X-Received: by 2002:a17:902:f68c:b0:2e5:cf96:9340 with SMTP id d9443c01a7336-2eb00338bb4mr39809965ad.18.1793263889488;
        Thu, 29 Oct 2026 01:51:29 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bddae0sm29991205ad.35.2026.10.29.01.51.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 01:51:28 -0700 (PDT)
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
Subject: [PATCH v9 11/14] docs: describe virtio-sound capture options
Date: Thu, 29 Oct 2026 17:50:29 +0900
Message-ID: <20261029085032.70689-12-mynameisjune111@gmail.com>
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
 

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793156049;
	b=i+NMgMlURdqOaqWge49ZSlb6DKbLllrHHhhQxTAxiHL/awpPoLAQuB2O2QmsG8gIurc/
	 lDfZdkNUWBI6J2MbRJvkAhLET+wdDdZsQrTVTjpLwd27zUeLxKtgIm+CR8OzpndN3Ns1l
	 sM1cK3ixV3X6Mtzi2uSmtkADWH7jrM5gc1NdGW6T3+9jYqJuwDLlEDwOVetT1AXNK8oej
	 91dW3W2i2/GU0eMDC1PWlH9Mz2U9/OasmlhhwXrk34QpyDgDp331yDO1wnjN5A7cQp3xZ
	 NKkmvauWUAeBI3RmvxJJ5V/f7is51EgdGYfylkOpGsCnekgDRppr/kxhL4Z3V8oYlKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156049;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xENf0eoUGZdfDkYJ3sDGskH+jC5/Mfw71VSp/kGlzNw=;
	b=sEW+IbfCC5+657BpJjGJTSyAWJQVJ1zWi+E7SVDl7Wj2ss7wjaJcZ01MgBYb7Fu+alDC
	 Rcrhbyihtw3VxefYC01QFe3PeOJEIZuKYnejHcbmRJxkvNOMRADPRx2MEtEYo4kT1uVOf
	 OAw/IuCTzKN/HeVZsQjxkYZ2pejRfp26+9w4vH+mDEQfyiKHNkwVVZlHEQ4Kh1eC+O09W
	 9u7K+BpSOAaMY3xPwmvNmi+0ZjLPzSpjLg55FX+WuN/Cgxde7xQzB5JjnYm8UkrUhCwND
	 lzvd8jiKS5WrMF9wMIkervV9mLXpA4aJht5Pn+s9oLWwOsDHzQFcEGORVVS85K/Pqxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EXU+7KlB;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEA460A260C
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 02:54:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DEA460A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EXU+7KlB
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36a121bb8c2so647337eec.0
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 19:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793156048; x=1793760848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xENf0eoUGZdfDkYJ3sDGskH+jC5/Mfw71VSp/kGlzNw=;
        b=EXU+7KlBRIpfDDOw1WHSD9pod1pcNY8v8oQ3DwZu4RDU/cfGOfygSB7DJA8PtZ552P
         4clI2LJqMx4qgDyCt6d9crIvGHG0aobY3ja9FTQmJX7ttf6OVxbfbGr8CDv90v/b0pkK
         2rIDDI98sqIt1J0XAitQgE0wWpjfYZJniJ4lNdXjRBca/tG8+NA1U2sKE2rKyb159Zq6
         N2GvZmfUwhAJmHdhFNVqXciqik6uG4l4hh/dCbId1wBGjcBH7JQJGrjBANtwdSFXxQJq
         TU9LydvTDopzo9kGXcbn82dI/t+Nk1tbb1UbkN0b3YCE1PxPSeffR4QYDgkAOQZjhPCX
         ohmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793156048; x=1793760848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xENf0eoUGZdfDkYJ3sDGskH+jC5/Mfw71VSp/kGlzNw=;
        b=aGPTm/MEhiO5iZcVqJ9p6m6d2/XYyC1IUn+zc0gIYPp4SVUhjA7GHVN9SRsud0udER
         hmfsHgbtVqpZVm5P2s0Kxg5zOiRejU4L+j3ci6M3Xp4GEnSR2Hmo1Bw/1qRyoSQBzEk1
         7ua+4K1z0ugOgi90z/06hE1tVhaM8/rmLffoZhETudlQMaCohO1f+6fhi9a1f471HQ0S
         K6f85CMmLclIJ0FFh9gYQz21pNOb1hZ1srNZbM8lRGIN7VD68JkmkO/asHxuh4TktzJ+
         EJMApaodB4o4sMMhVmlZBNEiG97HP08Ea3WI8JcYwxwgGhG6xJTfBOq+U3XIxFT7frPo
         5NwQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzsAZbTsYsFp8AIn6M/aI9XElX3SGRNeDF6RdABcrwmkerh9ph9sVbE+BReYEbIOoyxJtkZT2Kjy8=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9rAibVjpXCnH3QD4qeOSu8DQrUauNkQXEQoRwWjr1+GE7iWZ1
	y31g25EZPxlnxomaeWB+R/7t9Ax38mjHCLojah3vTdaT/wHnjZggGKmm
X-Gm-Gg: AYBFou2fgg+J5g1iSWjXEKmGweFUsSTrrGWBHJec7Sbw1YBqDmLX569K4xOXKFPcTYM
	WXftOTNwifdj8VXm9Ev9tylWXWF5jKbhGxyeKY/7mPsr5Br0qJvfQqRPa8AUHANzuyJ7Uy+7ssg
	5buSCnkUXGTFDqqdLYDaM8s8iK0CKvP4r9capt+rMWmhQALEkJ1J5nVNgGq+ix8Jj0uUpohlauH
	pIBsb/mif6VjzE4J9O+vHC4Uo+ZqV/TUoa5p6T9LbRsBygnbvRzTM7SCWqdN/VzCymF+LbfalaC
	tQ29WZA+UyUbYDm3kbL/m0zIfZ1dOrkjm5KcFip0FEbgswe2SMemcNBmxJ4JKwJOW/RfBE4X5BH
	TVjVtPjT4sGHy88sI5dZLQ0UEHAoj4WpLf2BRDoZhSqFaLgRnwm5iI9sv/cYlLdlzJ+olco7vTQ
	Zc9l6wIjyme0zsZf3NiG76LClj1aTGkdBTevqWxcGUvqhwJobeLkVOOSPHZixy6tgVWzA1s198h
	GweykllLWbCYGkcjm+mMaYbF4ky7k+jR6d5LbwRs7Vyjw0tBrXJecelJLMkcSQEBIBeNSNaUodM
	0M9/kJrD4RLwVDdmGork+7FcG2DklCYksVYsiduSGM1Piw5Vr9V6l9g+shEDMeNQZUPMD9HEanD
	gv4QW+RtlOsvGSd5uWIV1OZwLhfXHXJ6yJwVKZAifgXaAyLk=
X-Received: by 2002:a05:7300:681b:b0:36a:2473:9b2f with SMTP id 5a478bee46e88-36a24739b3dmr365410eec.23.1793156048042;
        Tue, 27 Oct 2026 19:54:08 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239644efsm1711914eec.23.2026.10.27.19.54.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 19:54:07 -0700 (PDT)
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
Subject: [PATCH v6 14/14] docs: describe virtio-sound capture options
Date: Wed, 28 Oct 2026 11:53:17 +0900
Message-ID: <20261028025317.92450-15-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261028025317.92450-1-mynameisjune111@gmail.com>
References: <20261028025317.92450-1-mynameisjune111@gmail.com>
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
 

Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B62326D47
	for <linux-doc@vger.kernel.org>; Tue, 19 Aug 2025 11:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755603359; cv=none; b=CZj2z3VzPLjHY1sH66ZFjwh77xMMDeAgA0jNSLp9JQOkDH/XeJiFq/wRQ56baNGH0ksJOx+1uWahtaTnT1xBIW+O5TiAMibmG2Z96K0PnVLlWLLPVq/KIqox0wZOVrLhrPpcPP8y488XPq2lAdj0pPv3GgMgl0tQHLCTQ3FUIdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755603359; c=relaxed/simple;
	bh=mAACKRu2GTqBstWdWNkLHEkKcfTO5TYrZTgaapAZKgU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=oHr13fhh66HiNQeOUOVUmghwe9Qvi0UeMb0hPLFTcr/AzR0ZhBgNhkfzrbONWSToFi/puAJjSGu1dWvb8smK9F7aV0VFiS+chNt4bpa7vc+xoqL9SHLMkKlSrhn9caPNs0258qL/kVBvP4QWKvPRqEX19Hw8cQZyyQDOfbfnFnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FwU8g/Tw; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FwU8g/Tw"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-afcb7a8dd3dso738589066b.3
        for <linux-doc@vger.kernel.org>; Tue, 19 Aug 2025 04:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755603356; x=1756208156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rf6L6FqGTXveuVPUzp10ykaskFYUdj2dA8MqDrkWS5o=;
        b=FwU8g/Tw5RZHpRExp6Af4hR2LTPPb9XCc3A2TvRa9aXuWLalzPsyFRW9zGEfVwG+aa
         +k9pn7bOJwes08CnkN4p2jC+XHKacFbK0ycAKjJV7eiFaQXwPCwTkVUpJ16U2sd/EyCa
         X43crQvDwReH6ZpFRmEA97zc2uli0c3Apbu70medf/XLqJbUygsZEsj393Ku7F/DUJC4
         Q0ldGF/ZZcHMYrq16/X2UiwDNh6G5ArDcwxFbrohBY1+1to9KfYS5QsPzSFJBdHazLHz
         WYeukWRFrBS3yEObyT2KpOSEaBZJ9UkylJyVyP8mzjxrDg50RRRqr1NFPQhGSC+J07cy
         z1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755603356; x=1756208156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rf6L6FqGTXveuVPUzp10ykaskFYUdj2dA8MqDrkWS5o=;
        b=MLGclV5UM6SiCa5qoM24xC0p8Ufn6VYt0x1Lxy0X8jHQrZaYPDSeklWEHSTqhEbDfO
         3huz+0XMQHw/ZwQ38Aa68jG2hqg6qBgkHuLVOLsLfLED8opiI8eqYVz8geS1HGwrTZQn
         VXMvnBUTHP7XN1JpyA6BIaZ3Xths5Ej2fKEXiw8GTwA75tfl1PWH/5E4rlAthj8Bbdg4
         ucqOrauR5VerOB9DeAZibc6G/5PfHQOfGqACKkHFNG+vJEel/6rfXD7ZZizI3JvShJeq
         i1eGHmmaAv4kdGKfcjrGPcMFMvY7o99/OQ7Vva9a1ND3CEjlmxWCu37q10pmrfFnXYje
         A0lw==
X-Forwarded-Encrypted: i=1; AJvYcCVUK8QpYs4OOZUWUhSpARDDvmXX9kJrRlmWCHD9EiliicVn2vz8Q+doEGv3t88mLyIFmqdff6g1M6w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0sro4ovCLZmOZh1Xi36v7KwZZF6LyJr8KxHgq+GU45vFB86tq
	SIHaN8sFKMs1t5Jod3tvDbVicBNF+r+/9D25PiykWJZZVfeDFfvrI/Tb
X-Gm-Gg: ASbGnctfBgHRtg88iukY5ClTYzgstqo/gHbIz4vEX9jtSXBBqJwZIuoCFZlhHl7UD33
	3eLpOl2XDpiaf12VOB0/MVEC5TTRi1YtNpuZJM3EyFBV7MG1DzGMIcorcImjvF3dGcXtgjL5XJS
	dAYSYKNcadW8MxwNsMMmjj6d1S+xxrZOYUbxx9jEPuelf/shMO2mPnvJLh38bpMl3PQou3RApeD
	crlw1+/nSfxRpKg2YYXDTGnIu2QaibMKph3Z2FD7nfdCGgbH42/F2w8GYmXmFxADPTD4EyZmGi2
	C/xib40no3yQfXe9/IpX3yhmhisRKWl7YavYqIgYt4Yx5q6xZbVyKtfqiK6eFq8o3MOfzNQebfv
	/3pA6FF2wMAp1WtbHuqHPVmOvUlvE089pOtlpGQJV+4GHrBHimnlDh3c=
X-Google-Smtp-Source: AGHT+IFtuBpwQZP081NfMQsrqOO3SqKnQx1ZNzRETwiye1ictcIMfxWUcOeXzI/cOeH+3k3dzg0NGw==
X-Received: by 2002:a17:907:7f0d:b0:af9:8688:42de with SMTP id a640c23a62f3a-afddd0d2918mr189654466b.41.1755603356276;
        Tue, 19 Aug 2025 04:35:56 -0700 (PDT)
Received: from linuxlab.zamel.local ([178.216.139.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdcfccc5bsm1013867466b.81.2025.08.19.04.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:35:55 -0700 (PDT)
From: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	rdunlap@infradead.org,
	Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
Subject: [PATCH v3] docs: replace a duplicated word and add missing SPDX-License tag
Date: Tue, 19 Aug 2025 13:35:51 +0200
Message-Id: <20250819113551.34356-1-kubik.bartlomiej@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix documentation issues by removing a duplicated word and adding the
missing SPDX-License identifier.

Signed-off-by: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
---

Changelog:

Changes since v2:
- Replace “that” with “the.”

Changes since v1:		
- Add missing SPDX-License tag
- Remove duplicated word "that"

 Documentation/admin-guide/kernel-parameters.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.rst b/Documentation/admin-guide/kernel-parameters.rst
index 39d0e7ff0965..7bf8cc7df6b5 100644
--- a/Documentation/admin-guide/kernel-parameters.rst
+++ b/Documentation/admin-guide/kernel-parameters.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 .. _kernelparameters:
 
 The kernel's command-line parameters
@@ -213,7 +215,7 @@ need or coordination with <Documentation/arch/x86/boot.rst>.
 There are also arch-specific kernel-parameters not documented here.
 
 Note that ALL kernel parameters listed below are CASE SENSITIVE, and that
-a trailing = on the name of any parameter states that that parameter will
+a trailing = on the name of any parameter states that the parameter will
 be entered as an environment variable, whereas its absence indicates that
 it will appear as a kernel argument readable via /proc/cmdline by programs
 running once the system is up.
-- 
2.39.5


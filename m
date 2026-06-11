Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1842CCB9
	for <linux-doc@vger.kernel.org>; Thu, 11 Jun 2026 01:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781139630; cv=none; b=jlQwt9WPt7FRuLqB0LVqHoAWBm1ANqQdFjLxQvpJ8SzHqG+BUUbqkzPpsF2/MGtymeDKS4V4wtVMtHTQ2MhirdG7U23mT7vU2YVKz+Xsn9gX0MImnj87AscC0NGgD9/eHlX2xSGx65lbWb2PM4jvJUL3yCDiAreiDQ48ifI1B64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781139630; c=relaxed/simple;
	bh=R89MvqhxiG2+lwSoOa2jiaUvyiAmtxR8SR8rp0/p5BU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DzrBzWAivBTKKcObb3n3fk6HlANDXywZie2cwH8RlMKUhsXQbnqduTcUur1ddthVePXfiTT6VpYAS2crsuZ4+nU7X7sRReJrHtBHq6FrE5fMy1dc1xjqU8OliJN8Qzwv20+OQNF/QLZ5X7wIkhT5LoWhuUd/fmExbig5Pym+r3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=avJUW/YG; arc=none smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="avJUW/YG"
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-304c520fe9aso3352563eec.0
        for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 18:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781139629; x=1781744429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o/SXDQO5NfYB2kwLk0HfZKluwANPzIcv07uIJOhOxkY=;
        b=avJUW/YGsOT6kCTXTQDcCm0Ns0USw22/NjkJy2dqBAUKGlwH7Kmbi2o5OKO0uSrhNV
         LhcNonNj7mcl/HjxIIZ9ulyiPfnqLwFvjhQjjctiGLLZmz4TsEo5tI4D1Xb7Tr0swQgW
         vAPA26NVexFhWocS3GV1DwHAP50okTtfVR3SUF9cc+nVONjH9aNqwoKMktECO/68MpYL
         J0Nz6ouRXepNLLHPoo+F/tvtSi2Y3Z6IH4i51X8YPGBbsjzHB5vJSJam7i9hgZ0lYOIR
         9QiTPBNvx3562YbwMh4/STregZ6y08BcflaJUxoBuBAg6COxm3bElc64v9chASr+J56g
         ERTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781139629; x=1781744429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o/SXDQO5NfYB2kwLk0HfZKluwANPzIcv07uIJOhOxkY=;
        b=dmbgvk90pm05rLDpjA2x6tn0UUv0Nf0WMH2qhg3U+avdlfRPUirYJdrg4bZI++ZQ9m
         HxvoFRCC/RHD5gxUSit51FxaKgYfburX3MuuLf49bfd0OZOibfiOY0RKmoYeoqRBsqvU
         bpBhulncHf45kgCMhWwZifou/gcCpgdbfAse5Xua5uFmQi+vOelSlxB6XDg9TOwcuUDN
         aLbA3naTTsmhhO2T/ThaXitUeFLdgN6LufAhAJ+RKIhqubath+sO8Z75O6yhhr09jj9s
         hKW+RsxbsvBSNzx6pClOdfRMhnCgeyv3s1iXQRVnvo2QWM9Aa/3Vs7By6f49ZizgnWK6
         LGVQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Gpj/RpOYc1+qBYtCP7IAP/TQAvLGNXZjf5wbgKg30+3u1uSe1XlGzOoxojse5CJ8G5FVQIL7twOg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjFzf51Sivz4V1qYz8QnoUPj6lBzblvRGmOwdDjIW0niSHAcbo
	1aZsXHf3q4YdxatzmCFH08Eq7wOGWBg7PHa347Z49I0ZrVvXWV+ZVBMX
X-Gm-Gg: Acq92OFF1FwfC5FgES8o3ju4F73cXQxF1/4nu0vQfUewBVfH+MZ+2uiXLlImgZTLwSu
	3AKxlveQDhFq4YCJKIJX8NDMN/tLWFsutI4xZhu8dJXAqNOLvOKuXEyLGRFMMmnJLCs4vZ/13qU
	xFmSrzyP5PDFSKVw0c243eP05gAhk9zadxZ16xg3q+I6e6DGoOzAVHYAFn2zx64YaSBRSDzQw6t
	OB74CFstm/9rRQJb9L5d1IVyk3QrfBCevr576Cv6Rl1WdNZwTiRpLD8dAucX1xDxanqfV+q883e
	DgNSNEEhENw1GsKQkbUDZdtkLUX+T2PW+/vkS0ULJ05Yv/Uk/MyKKuZOyDiHmSzFFJVwMx7eulV
	q91YpgSCVf/m1fYjWUehIMcTuEPKdI3KBYeHDURGkivrB9JWlU6tvmJL7t9f9/o+agsZNjEYSke
	v9d5N+WhyUfPEzqvyhMDAzGikVb11PLfoKZxb+QUgD2uaYs97cZIZVi+W0z0bBCPZF3EUXAsEgp
	sEFebgT55RTJs9rwkESINyab1SvmyutJK90axT1WwMTWvSbTE5vQRYSjBpWJ3ssLZiem2IIKgY7
	fW6vyUoiaxYBInPCcXRtxKtncUEF
X-Received: by 2002:a05:7300:2146:b0:307:26a3:75e4 with SMTP id 5a478bee46e88-3080461f82cmr567703eec.4.1781139628594;
        Wed, 10 Jun 2026 18:00:28 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30806c2f420sm95650eec.6.2026.06.10.18.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 18:00:28 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>,
	Avadhut Naik <avadhut.naik@amd.com>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	"GitAuthor: Ethan Nelson-Moore" <enelsonmoore@gmail.com>,
	linux-doc@vger.kernel.org
Cc: Federico Vaga <federico.vaga@vaga.pv.it>,
	Jonathan Corbet <corbet@lwn.net>,
	Carlos Bilbao <carlos.bilbao@kernel.org>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>
Subject: [PATCH] docs/{it_it,sp_SP,zh_CN,zh_TW}: update references to removed CONFIG_DEBUG_SLAB
Date: Wed, 10 Jun 2026 18:00:04 -0700
Message-ID: <20260611010014.412841-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

CONFIG_DEBUG_SLAB was removed in commit 2a19be61a651 ("mm/slab: remove
CONFIG_SLAB from all Kconfig and Makefile"), but references to it
remained in documentation. The English documentation was updated to
refer to CONFIG_SLUB_DEBUG in commit 5969fbf30274 ("docs:
submit-checklist: structure by category"), but these translations were
never similarly updated. Update them.

Discovered while searching for CONFIG_* symbols referenced in the
kernel but not defined in any Kconfig file.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 Documentation/translations/it_IT/process/submit-checklist.rst | 2 +-
 Documentation/translations/sp_SP/process/submit-checklist.rst | 2 +-
 Documentation/translations/zh_CN/process/submit-checklist.rst | 2 +-
 Documentation/translations/zh_TW/process/submit-checklist.rst | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/translations/it_IT/process/submit-checklist.rst b/Documentation/translations/it_IT/process/submit-checklist.rst
index 5bf1b4adebc1..c58d773fd297 100644
--- a/Documentation/translations/it_IT/process/submit-checklist.rst
+++ b/Documentation/translations/it_IT/process/submit-checklist.rst
@@ -122,7 +122,7 @@ Verificate il vostro codice
 
 1) La patch è stata verificata con le seguenti opzioni abilitate
    contemporaneamente: ``CONFIG_PREEMPT``, ``CONFIG_DEBUG_PREEMPT``,
-   ``CONFIG_DEBUG_SLAB``, ``CONFIG_DEBUG_PAGEALLOC``, ``CONFIG_DEBUG_MUTEXES``,
+   ``CONFIG_SLUB_DEBUG``, ``CONFIG_DEBUG_PAGEALLOC``, ``CONFIG_DEBUG_MUTEXES``,
    ``CONFIG_DEBUG_SPINLOCK``, ``CONFIG_DEBUG_ATOMIC_SLEEP``,
    ``CONFIG_PROVE_RCU`` e ``CONFIG_DEBUG_OBJECTS_RCU_HEAD``.
 
diff --git a/Documentation/translations/sp_SP/process/submit-checklist.rst b/Documentation/translations/sp_SP/process/submit-checklist.rst
index e7107cc97001..aedf55eb3b80 100644
--- a/Documentation/translations/sp_SP/process/submit-checklist.rst
+++ b/Documentation/translations/sp_SP/process/submit-checklist.rst
@@ -76,7 +76,7 @@ y en otros lugares con respecto al envío de parches del kernel de Linux.
     cualquier problema.
 
 12) Ha sido probado con ``CONFIG_PREEMPT``, ``CONFIG_DEBUG_PREEMPT``,
-    ``CONFIG_DEBUG_SLAB``, ``CONFIG_DEBUG_PAGEALLOC``, ``CONFIG_DEBUG_MUTEXES``,
+    ``CONFIG_SLUB_DEBUG``, ``CONFIG_DEBUG_PAGEALLOC``, ``CONFIG_DEBUG_MUTEXES``,
     ``CONFIG_DEBUG_SPINLOCK``, ``CONFIG_DEBUG_ATOMIC_SLEEP``
     ``CONFIG_PROVE_RCU`` y ``CONFIG_DEBUG_OBJECTS_RCU_HEAD`` todos
     habilitados simultáneamente.
diff --git a/Documentation/translations/zh_CN/process/submit-checklist.rst b/Documentation/translations/zh_CN/process/submit-checklist.rst
index 0e524f1c1af5..18411b426122 100644
--- a/Documentation/translations/zh_CN/process/submit-checklist.rst
+++ b/Documentation/translations/zh_CN/process/submit-checklist.rst
@@ -65,7 +65,7 @@ Linux内核补丁提交检查单
     :ref:`kernel-doc <kernel_doc_zh>` 并修复任何问题。
 
 12) 通过以下选项同时启用的测试： ``CONFIG_PREEMPT``, ``CONFIG_DEBUG_PREEMPT``,
-    ``CONFIG_DEBUG_SLAB``, ``CONFIG_DEBUG_PAGEALLOC``, ``CONFIG_DEBUG_MUTEXES``,
+    ``CONFIG_SLUB_DEBUG``, ``CONFIG_DEBUG_PAGEALLOC``, ``CONFIG_DEBUG_MUTEXES``,
     ``CONFIG_DEBUG_SPINLOCK``, ``CONFIG_DEBUG_ATOMIC_SLEEP``,
     ``CONFIG_PROVE_RCU`` 和 ``CONFIG_DEBUG_OBJECTS_RCU_HEAD`` 。
 
diff --git a/Documentation/translations/zh_TW/process/submit-checklist.rst b/Documentation/translations/zh_TW/process/submit-checklist.rst
index a0cb91a6945f..06aa635a659c 100644
--- a/Documentation/translations/zh_TW/process/submit-checklist.rst
+++ b/Documentation/translations/zh_TW/process/submit-checklist.rst
@@ -68,7 +68,7 @@ Linux內核補丁提交檢查單
     :ref:`kernel-doc <kernel_doc_zh>` 並修復任何問題。
 
 12) 通過以下選項同時啓用的測試： ``CONFIG_PREEMPT``, ``CONFIG_DEBUG_PREEMPT``,
-    ``CONFIG_DEBUG_SLAB``, ``CONFIG_DEBUG_PAGEALLOC``, ``CONFIG_DEBUG_MUTEXES``,
+    ``CONFIG_SLUB_DEBUG``, ``CONFIG_DEBUG_PAGEALLOC``, ``CONFIG_DEBUG_MUTEXES``,
     ``CONFIG_DEBUG_SPINLOCK``, ``CONFIG_DEBUG_ATOMIC_SLEEP``,
     ``CONFIG_PROVE_RCU`` 和 ``CONFIG_DEBUG_OBJECTS_RCU_HEAD`` 。
 
-- 
2.43.0


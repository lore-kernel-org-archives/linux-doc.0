Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC3638D6A9
	for <linux-doc@vger.kernel.org>; Thu, 16 Apr 2026 11:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776337307; cv=none; b=N2dgzBPhE2mDEGDuccFJL0IZZrBHklXAgihMrJhNXftXAwS93EP+KLoppvDSQxFMd+vyET7bUMHi/I4yU6BwAD/VkTXKm/tvkrOotPogEqZhYyyx6alDPm/0G5/xPzYjiFo48rOd6ZD2ytYSm8OYMZX+teRUZcxj9DQ3MrLvd+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776337307; c=relaxed/simple;
	bh=PM6HxBGY/uLlU1yBOXRA/GDCOAXJaEkAZa8B3LSKqVs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jRuDlodRsO+vQmwWw8kJhb+DBHmJIxwfcYUab7HVzIscD8rukYciDiQTMHy5B0+eklBrL+9e0n2XykY0VbRDLK6uxBdLh/NJPDkyUu7QVnwrk9u/+bSM2Qn+Ua0ktP1GtamEvAQNjzQtHkmbxFqv4WV2yBZ5ptZc+PPU09Hcdlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fLyXElgf; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fLyXElgf"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ab46931cf1so3983005ad.0
        for <linux-doc@vger.kernel.org>; Thu, 16 Apr 2026 04:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776337306; x=1776942106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2jfu3qCPkJ7YryG+WcH1SeIojzYRxn2U/dbTCrcamzw=;
        b=fLyXElgftCXR51ZLVEWRptTfBOYkpUo5OwBY7RXmSO3tVrxxgVc59Je37IgmeN0qT/
         vVNavTwRHo6KqG1DX3Mcf7zoIrhExKsttIRbVjVn4Smel/MSVrPnnT8kVscFM/Bn5AK3
         4y4OwjWUUzDW+0sjDJBBOQ+vgruUXP55SsslNnb7+vOstpOgnPg4/nGyR0lzey+Im24w
         JQxRLWsfb2UrHId8KdOv4skLfNv5N+nuMa81mYnIFQsuG7EPbDI85DQrYpij7WnqG7Ej
         P2cGXx0k1BbDBzFVSEztXJn+NER0qmyjKu+HFTDEtQANoTxxK2KGeb02WR9jqILKJUSU
         +8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776337306; x=1776942106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jfu3qCPkJ7YryG+WcH1SeIojzYRxn2U/dbTCrcamzw=;
        b=orsPpsKnDI+7yLlv3Pk5X8o6/PgzLbbqBZJKlYbZEZ0/IHSiYOabErALrQ/f4+Rp56
         RVVc0rqmri3fib/tyri8gAMpDk1IWcjFPqB+v+M5BGdXeGHBaQPHSAOQ0qshkfx3j0S3
         Dyj0wvHqzGki5ziW2Ij85d5sho2NMTidv2rHF5HHPk/RAsf1zx0JT1aQrfD+B6S5r4fl
         9hRkZBL99IbzO5+9a+HB+aI1DJ29sq8E7sUzlOUM/X5LLD/p9hb1+GnXGZIpCDP0dghI
         ZVP6HVwRf9QYt2E2SvDdczDFXgYbjO87CSeJO+rkB1+O5R5pMQ4Zx51wUDFzs01aMkgi
         SEyA==
X-Forwarded-Encrypted: i=1; AFNElJ8laLcFEkXlBDN1/ROBTeUdbSVtw4uFMyWv/MAgM7VuHUYeQONykvtn/K8vts/4VL2UuhSUeNNRMQE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjGk+/uc7rzN3RYyM1G1JSQ/dGSjJHkA4AlaibGLjGOVd+gqm/
	K7jb4WUR59iJPda5AIWvLEZaS+c/Oi6wrxrtDcnjj+gCfgfTtFQ9929lBE7sZYhso4I=
X-Gm-Gg: AeBDiev8M8RPQdq+gZBDdB3ruBQ/rO/AmlF9h38LO9IlklTYsHP6Vf7lRTYLTM+09Jz
	jxksZhDbI9KeXyzLpNssHdehckkHj2L7PthNZ1+dqgjMOrbunpARcWFTyNImpjHrqcw9PoD9TkA
	CMB3y9wnY4qs0TWYHfRpkc8fxLMgZ2PxmWFY7NyxfM0Q+LRANo98nm1PJq0lf0VBCNcj4AH7m4R
	0a/5W8Bvzn09/9XCL9VjTBtTJ7+ZfngIldgqD8OfWAhQoL8TPiARA3fAtDJnCkvHig59uZzI9kP
	PY1zAdfMJZq0Ok021V1dCcKsxzzo4xTUtPmCO/CIT8vGMgP3s/smboWVVwFvB85gVwKWNs7M+Wx
	bJwontaFuz+lxgI1ENE5Hxvu+KIe/zTrt+JE69dDgSJ18YZwT7OpY3miOriN68RvgEJ2UZrtYhy
	kI3xRlFmpLjSgQbvYmwll6gs8SIgQGOkr8/iGXO4O7MECBow==
X-Received: by 2002:a17:903:200e:b0:2b0:ac1e:9730 with SMTP id d9443c01a7336-2b5eaae081dmr22286065ad.14.1776337305794;
        Thu, 16 Apr 2026 04:01:45 -0700 (PDT)
Received: from LAPTOP-TU1AT3C0 ([2402:f000:4:1008:809:ffff:fff8:74d5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b4782b113esm66949675ad.71.2026.04.16.04.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 04:01:45 -0700 (PDT)
From: Zhang Xiaolei <zxl434815272@gmail.com>
To: corbet@lwn.net,
	ebiggers@kernel.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: ardb@kernel.org,
	skhan@linuxfoundation.org,
	linux-crypto@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Xiaolei <zxl434815272@gmail.com>
Subject: [PATCH] docs: staging: fix various typos and grammar issues
Date: Thu, 16 Apr 2026 18:58:53 +0800
Message-ID: <20260416105854.788-1-zxl434815272@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a few typographical and grammatical issues across several
staging documentation files to improve readability:
- crc32.rst: replace "decide in" with "decide on"
- lzo.rst: replace "independent on" with "independent of"
- remoteproc.rst: fix word order in dependent clause
- static-keys.rst: add hyphen to "low-level"

Signed-off-by: Zhang Xiaolei <zxl434815272@gmail.com>
---
 Documentation/staging/crc32.rst       | 2 +-
 Documentation/staging/lzo.rst         | 2 +-
 Documentation/staging/remoteproc.rst  | 2 +-
 Documentation/staging/static-keys.rst | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/staging/crc32.rst b/Documentation/staging/crc32.rst
index 64f3dd430a6c..fc0d9564b99c 100644
--- a/Documentation/staging/crc32.rst
+++ b/Documentation/staging/crc32.rst
@@ -119,7 +119,7 @@ the byte-at-a-time table method, popularized by Dilip V. Sarwate,
 v.31 no.8 (August 1988) p. 1008-1013.
 
 Here, rather than just shifting one bit of the remainder to decide
-in the correct multiple to subtract, we can shift a byte at a time.
+on the correct multiple to subtract, we can shift a byte at a time.
 This produces a 40-bit (rather than a 33-bit) intermediate remainder,
 and the correct multiple of the polynomial to subtract is found using
 a 256-entry lookup table indexed by the high 8 bits.
diff --git a/Documentation/staging/lzo.rst b/Documentation/staging/lzo.rst
index f65b51523014..2d48b2667dd2 100644
--- a/Documentation/staging/lzo.rst
+++ b/Documentation/staging/lzo.rst
@@ -75,7 +75,7 @@ Description
      are called under the assumption that a certain number of bytes follow
      because it has already been guaranteed before parsing the instructions.
      They just have to "refill" this credit if they consume extra bytes. This
-     is an implementation design choice independent on the algorithm or
+     is an implementation design choice independent of the algorithm or
      encoding.
 
 Versions
diff --git a/Documentation/staging/remoteproc.rst b/Documentation/staging/remoteproc.rst
index 5c226fa076d6..c117b060e76c 100644
--- a/Documentation/staging/remoteproc.rst
+++ b/Documentation/staging/remoteproc.rst
@@ -24,7 +24,7 @@ handlers, and then all rpmsg drivers will then just work
 (for more information about the virtio-based rpmsg bus and its drivers,
 please read Documentation/staging/rpmsg.rst).
 Registration of other types of virtio devices is now also possible. Firmwares
-just need to publish what kind of virtio devices do they support, and then
+just need to publish what kind of virtio devices they support, and then
 remoteproc will add those devices. This makes it possible to reuse the
 existing virtio drivers with remote processor backends at a minimal development
 cost.
diff --git a/Documentation/staging/static-keys.rst b/Documentation/staging/static-keys.rst
index b0a519f456cf..e8dc3a87c381 100644
--- a/Documentation/staging/static-keys.rst
+++ b/Documentation/staging/static-keys.rst
@@ -90,7 +90,7 @@ out-of-line true branch. Thus, changing branch direction is expensive but
 branch selection is basically 'free'. That is the basic tradeoff of this
 optimization.
 
-This lowlevel patching mechanism is called 'jump label patching', and it gives
+This low-level patching mechanism is called 'jump label patching', and it gives
 the basis for the static keys facility.
 
 Static key label API, usage and examples
-- 
2.53.0.windows.2


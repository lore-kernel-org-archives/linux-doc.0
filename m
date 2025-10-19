Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5120148832
	for <linux-doc@vger.kernel.org>; Sun, 19 Oct 2025 20:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760906453; cv=none; b=N9Krb+D7NLHkdmYz2X3jMRcBr1sh01lGP1Pnuaqw6KtdpxZwa4ItyktVv5o7ndUvces+cqPLptXnfSb8Oci35LNug/+dBHTuIMnpgHDVlDdm9osWQEnBLig6ae+x1ONXcc/JwEf8slUvs7EkMDFHChaxkPHgLnJBeXPDTs2QHf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760906453; c=relaxed/simple;
	bh=DZ5YLSwfznprJ2h4RfxdTagdnUNGXAegZcVq1AoSt54=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mYY5mP39ds9QQJje09AIaYi1n3KUY/knLlIP25R0aeb10TejHQHqUQicDHwJvLUD3AXOPzPNr8MKMJtF3Ga9QwIMB5LvKg5gaMuRv0hsj4L1698sJuXscAIIjuodI84k77HvABz01xvwNCOlsxFSoMGk1M3HRNu5zceASuVgMzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CD1nbMoi; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CD1nbMoi"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2698384978dso26782725ad.0
        for <linux-doc@vger.kernel.org>; Sun, 19 Oct 2025 13:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760906451; x=1761511251; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qGPtkyZG6B6+r0Tti54kc9vfkfd50Yjci34PHRQMtCE=;
        b=CD1nbMoicmxeGk4jCx2J/m9X95FiZqM/SqKaYU+lteb+KN0OCllBBZKDEvDJTqig/D
         /9KA1K3MRNXtW1Y0TT6lXnMUlmPRHR2O22GuEr4a94GY6vIDRSoWtQkoB/tJ4HWked8F
         FI+5ij0cV0STOakIc37XMGsWU1rgbs2vPN3riEOiEovhAQ/a5Ndda3E54v8NHGhDPx1v
         5CL2fWS8ZYmi2RvZg4asZ4yA06ntM8jluRzp5A4wJaAxwnlwbPaq6Hrqz3gNjhVMmyT0
         lPCHN17v4zUW/fmtGm3NxMc6+KSWPSSeBQQmMKVlYljPZr46wIfNNUcgjEGwgC5DCGaV
         lkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760906451; x=1761511251;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qGPtkyZG6B6+r0Tti54kc9vfkfd50Yjci34PHRQMtCE=;
        b=Mg8lgM0ufXUxExaz68w+nJwpFyPy7KbklkkAvf4IukBwqVJDafqZeXlwy3XdzzWUZf
         kZOuT86rp+HTPJQncDEaycd8rShGjyVD4kfYN2XGncD+LxQA/maMJPzhX1soEsjuE1aN
         4szS7LE8+u4HfXa8l0XX9ZbBWpf+h/R/lEhATAcFMFQMrZ5O4LDZk0MfPWMC3/UnBb7N
         jS912og+k3VbGilImXB8qAU/XOJMpjEykN6a14xnPM3VpCZWb0BDmJruZ7xnMjE4oM8q
         fgyDtZ0gLBNJQG90Uf3cF62fyX54xS3GWTdYPK6LsKJUtv2aok0kUw/qZHYogw2U39xK
         fLIA==
X-Gm-Message-State: AOJu0YxNJavkGEDNNL1e3YXsGZO1SvBY5v5u02Q1zZqKLPV9MJjNOv+p
	jzqvZAjbbkmRRopsPRHLKWUIvdxmI110lOwXmL73l1SSkvGgerfOnhrA
X-Gm-Gg: ASbGncuLRmUDOfBwDXd0VekKoMzDUj8+zkz3XnMUY0ZQNRSwL8WQrppRJzqox/qM90Y
	qrSr5sybzBWx8+iO8TwVaPGbg5S98NuZnD9vMQrDVbltLky8WNuWCbXNPmeE02JXWaDXUkP9JF1
	qgtbIV6rhchfm7ezKt+nrbRj3gN7Sm3aODvJeIPccOSyiXKpKXS0xbSmGYRAvak7N6Oxd5MsE+J
	qk3RCNuOZTo4CVGBABay7GVdBqFK80jZh6xQmI30NPxSHGsvfLvJ9gQK7/zYHtU/BSp1zkzjtCd
	HYvemlLo/K+pN/noUNewuyplqmd94wqbUPZA1igH1ZYYJ1hZw3uu8aZxelrbfrhphRnUyj/L/r7
	iRBObB+xxs6JT+Bu37h3RxfSIr0rRKxE5mmDX4tdweO7cF82J6hklXsNi6ZdBcWkfQfXX6wolq3
	STCTvOUQD8Sw==
X-Google-Smtp-Source: AGHT+IF95JEi/JsIqCRmTb/3pHFqrD9ibzT21M4OCl5isI6yPif3rS9p67+bw6Qh0v/+KFcEdR1Nmg==
X-Received: by 2002:a17:902:e5c2:b0:26d:72f8:8d0a with SMTP id d9443c01a7336-290c9c8c7c2mr138365855ad.12.1760906450910;
        Sun, 19 Oct 2025 13:40:50 -0700 (PDT)
Received: from aheev.home ([2401:4900:88f7:5633:261c:3225:7bf:3371])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246fd8dfasm60551695ad.43.2025.10.19.13.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 13:40:50 -0700 (PDT)
From: Ally Heev <allyheev@gmail.com>
Date: Mon, 20 Oct 2025 02:10:44 +0530
Subject: [PATCH] Documentation: fix dev-tools broken links in translations
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251020-aheev-fix-docs-dev-tools-broken-links-v1-1-5d127efec0b2@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMtM9WgC/x3NQQqDQAyF4atI1gbG4LjoVYqL0Uk1KBOZiBTEu
 zd0+S3+924wrsIGr+aGypeYaHF0bQPzmsrCKNkNFCh2gQKmlfnCj3wx62yYHafqbjhV3bjgLmU
 zjDFTP0wpEvXgW0dlT/4/7/F5fjj1xhp3AAAA
X-Change-ID: 20251020-aheev-fix-docs-dev-tools-broken-links-55d246ba5224
To: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
 Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>, 
 Hu Haowen <2023002089@link.tyut.edu.cn>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com, 
 Ally Heev <allyheev@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2900; i=allyheev@gmail.com;
 h=from:subject:message-id; bh=4Lzw9O28TsSIgw4Fl2A7+Wfmc9+4U3chftwdrYjI/+8=;
 b=owGbwMvMwCU2zXbRFfvr1TKMp9WSGDK++py7JRMa7H9T7EPrvzff31p42gZFXH+wpYK37d/M2
 t7NDCZfOkpZGMS4GGTFFFkYRaX89DZJTYg7nPQNZg4rE8gQBi5OAZhIRD8jw5+mRbLPSsQlZKMX
 mT/6dPjsjsVWMmcZb8g8Xq73dXrgu2SGv8KhX5YYznNy0JFdXvhsnmKQRlHj/udHlFMOhd3wtbu
 3lg0A
X-Developer-Key: i=allyheev@gmail.com; a=openpgp;
 fpr=01151A4E2EB21A905EC362F6963DA2D43FD77B1C



---
gdb and kgdb debugging documentation were moved to
Documentation/process/debugging/ as a part of Commit
d5af79c05e9382d38b8546dc5362381ce07ba3d1 (Documentation: move dev-tools
debugging files to process/debugging/), but translations/ were not
updated. Fix them

Link: https://lore.kernel.org/all/20241210000041.305477-1-rdunlap@infradead.org/
Signed-off-by: Ally Heev <allyheev@gmail.com>
---
 Documentation/translations/zh_CN/admin-guide/README.rst             | 2 +-
 Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst | 2 +-
 Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/translations/zh_CN/admin-guide/README.rst b/Documentation/translations/zh_CN/admin-guide/README.rst
index 82e628b77efdea1e98af310229aadc8bbd60824f..7c2ffe7e87c7e649b0eea1e3bb9fd2fb06900c78 100644
--- a/Documentation/translations/zh_CN/admin-guide/README.rst
+++ b/Documentation/translations/zh_CN/admin-guide/README.rst
@@ -288,4 +288,4 @@ Documentation/translations/zh_CN/admin-guide/bug-hunting.rst 。
 
 更多用GDB调试内核的信息，请参阅：
 Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst
-和 Documentation/dev-tools/kgdb.rst 。
+和 Documentation/process/debugging/kgdb.rst 。
diff --git a/Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst b/Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst
index 282aacd334428508afb67b7258be236be1fcdf2f..0b382a32b3fec6f4c0d2dc95b5345ca639b5daa8 100644
--- a/Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst
+++ b/Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst
@@ -2,7 +2,7 @@
 
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: Documentation/dev-tools/gdb-kernel-debugging.rst
+:Original: Documentation/process/debugging/gdb-kernel-debugging.rst
 :Translator: 高超 gao chao <gaochao49@huawei.com>
 
 通过gdb调试内核和模块
diff --git a/Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst b/Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst
index b595af59ba78595aacdb2d4b558d31bf11e17115..4fd1757c3036fd27c4e3dbbaa70f85123c59abf0 100644
--- a/Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst
+++ b/Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst
@@ -2,7 +2,7 @@
 
 .. include:: ../disclaimer-zh_TW.rst
 
-:Original: Documentation/dev-tools/gdb-kernel-debugging.rst
+:Original: Documentation/process/debugging/gdb-kernel-debugging.rst
 :Translator: 高超 gao chao <gaochao49@huawei.com>
 
 通過gdb調試內核和模塊

---
base-commit: 9b332cece987ee1790b2ed4c989e28162fa47860
change-id: 20251020-aheev-fix-docs-dev-tools-broken-links-55d246ba5224

Best regards,
-- 
Ally Heev <allyheev@gmail.com>


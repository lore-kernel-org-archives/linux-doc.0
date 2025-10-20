Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8520252906
	for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 10:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760957216; cv=none; b=cPNcFewMKktWnCrW/Dx0G8+E82ToNnhw0QIxyoAMalQ6GWytcF+F3YPRMv7W9L5bM+cGFAIfqzFqsYujTNPHTyrL/K4wRzHNhpfCC7fWZLK/Z0TShiGu6a4oQxpTGIvZQaOg2eIeMYCCRU0h4LZoso22t3MuI0tcimtoytrx2R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760957216; c=relaxed/simple;
	bh=77OOTifNN6EqtYF0iq0lR9LALGEsghMBmSjg5Tx0Gns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZJqnOCJl6kRfvP6S9fWi0sANTuiAolpKdkr7TJ875t+y1U4NncZgaHFdRuefir2m9vsnrNegIRtbxYkM6dpvTRpko7uKGcaIWc+90NIyS2WgJZEE3iN1weiPitRFT8dbdVU9LcPF3al7pkZJm6sCtBMvY1H5T/4y4bWowBsggkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZRurMFk4; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZRurMFk4"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-78125ed4052so5230388b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 03:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760957214; x=1761562014; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fMwGkZUWIhp5E6BTy4JUZ1CGAD7ix+IFJYIVqgezJtU=;
        b=ZRurMFk4SpleN0Yx5l8Jxd5KrqeJKodkOPZScixYjerFKhptx/KdH2VpmzJ3u4Zx0P
         7SZDotOuFGfq7GW1dYBQjiZwsgMQ8+1vXpBNEzvIdJ8ZGLo+1bM/s/Jfpm4xwtjm4Pxq
         BdL8RaAzv44VyHuqX1bEcx/wiRIhcGqzsMfj0MJ6fsD7Yapvu0GLTBk0XYMU3wOY5pn1
         PvidsdfT4NnyVkkkPMeojAo8DD8/kVyv1Z32P5DPHSRTM9q7J0fCEXRt+rmbpAlGkfx4
         HNN5VasKYDb6htCYGMZ+kL2Tgfgbc7ahyykY8gzLVqPHvTmQFTufsET/XGgh3s/atFLW
         BleA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760957214; x=1761562014;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fMwGkZUWIhp5E6BTy4JUZ1CGAD7ix+IFJYIVqgezJtU=;
        b=je3Qwyj4Lwc8oyGrFBYv8L6tocDGe3Ntu8/NDrznrDrywdJfg77O2/6X1qgxYkue3u
         ToYscLcEfyzHdabmo+SNpPC9lPTgP+GIpLMOXySZI46zGbjRjTLwLdvZo4ehgfqb1ACA
         IeINkTu3byWSnidalrO1YB2cfN5rL99sMYuEC0KXFbr2euD+rBk1D0ISA1Bus5Hb78aD
         zWLVW0OHTG9H6Cg1cFggDio4koWeoQTfPXw2HLVmyhfoAa/0IFOZUvrRyeYeFgOuX5bu
         viZFctysprtZ+HT6XUBwvtsO5JqSS/s9nX0OGbSf+XQxAtfNtD+d4nABaiU/mtCpjSlt
         3V+w==
X-Gm-Message-State: AOJu0YwcUQLJdKCeLHmo/i4iq92l25vXiyis1uHgzyFK50IlhK5IqKFP
	4gooJA0SL0eg881skURDZjZZDR19lNldgpTi0eadR/w4W86bSuIhNtDe
X-Gm-Gg: ASbGncv6St29rBnsFQE3DyLdZgtluvusKsbVYz5w/B0tBGLccl6a47ZGqL8cmsRa7N+
	rwuz33UzcYaZpjKP0/3hMVX44IkroPfbZ4RKnDhTOW3V6waS5Bqi/VBUkICcedW4sz19hf9O9VB
	QMbKuypAhy96sI6Kba74M729QKMji3WFUx7BUDdJR8o0lO/xjblHqrYc8R9ZOKUrudw5dVFvIBp
	FE+ElyRmDjY0/o6ZPMhHDElDMgs/hQf8bTf1wp+6Scoxr8wIymfbxkpIoj54Tq2ZqKY/oeWOzzX
	ZHWxEi/sM908+xiJuEHonvZ47BH3PKZ8LyoG2vi7djubvakrHEwtI2EwlHyKVJHlDQ8gxSVEqUm
	1800y8vZjXNgUk85HSInhArn+zero0dJUckkr91zIkD8cidndtiaai75I4mQgpwnzkcaSc1KN4a
	a2ZRZxtBfkyko=
X-Google-Smtp-Source: AGHT+IFzqDkDB2gK/QCgpSAy/ccNgL8SBsEDJ0KCg0JL1JXoJGb1qycsyF/2+Ly+TkdMQi0TmkSxsA==
X-Received: by 2002:a05:6a00:92a9:b0:781:1771:c12c with SMTP id d2e1a72fcca58-7a220437733mr15295117b3a.0.1760957213908;
        Mon, 20 Oct 2025 03:46:53 -0700 (PDT)
Received: from aheev.home ([2401:4900:88f7:5633:9655:15c9:13a3:7d6c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f251fsm7863398b3a.39.2025.10.20.03.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 03:46:53 -0700 (PDT)
From: Ally Heev <allyheev@gmail.com>
Date: Mon, 20 Oct 2025 16:16:30 +0530
Subject: [PATCH v2] Documentation: fix dev-tools broken links in
 translations
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251020-aheev-fix-docs-dev-tools-broken-links-v2-1-7db64bf0405a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAUT9mgC/5XNQQrCMBCF4atI1o4kQ6PgyntIF2kybYe2GUlKU
 ErvbuwNXH4D8/5NZUpMWd1Pm0pUOLPECjyflB9dHAg4VCvUaI1GDW4kKtDzG4L4DKFiFZkzdEk
 mijBznDJYG7C5ds4iNqpuvRLVl6PzbKtHzqukz5Et5nf9t1AMGLDB4I168rrDx7A4ni9eFtXu+
 /4FFl7N1toAAAA=
X-Change-ID: 20251020-aheev-fix-docs-dev-tools-broken-links-55d246ba5224
To: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
 Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>, 
 Hu Haowen <2023002089@link.tyut.edu.cn>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com, 
 Ally Heev <allyheev@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3873; i=allyheev@gmail.com;
 h=from:subject:message-id; bh=77OOTifNN6EqtYF0iq0lR9LALGEsghMBmSjg5Tx0Gns=;
 b=owGbwMvMwCU2zXbRFfvr1TKMp9WSGDK+CXN+vXM1s6wk6dqf7iLDqraXl7maOfb35c569uN38
 A62SauYO0pZGMS4GGTFFFkYRaX89DZJTYg7nPQNZg4rE8gQBi5OAZjIxxyG/1Vqh6KlVXcZ+zVp
 a/cdVjHxNDq32Mdm67+bK2eGHpt9q52RoXF/upgQd5dnoFXWbxWdLdNXTLrC6/Cxk3Ujx8xCDu5
 /fAA=
X-Developer-Key: i=allyheev@gmail.com; a=openpgp;
 fpr=01151A4E2EB21A905EC362F6963DA2D43FD77B1C

gdb and kgdb debugging documentation were moved to
Documentation/process/debugging/ as a part of
Commit d5af79c05e9382d38b8546dc5362381ce07ba3d1 ("Documentation: move
dev-tools debugging files to process/debugging/"), but translations/
were not updated. Fix them

---
Link: https://lore.kernel.org/all/20241210000041.305477-1-rdunlap@infradead.org/
Signed-off-by: Ally Heev <allyheev@gmail.com>
---
Changes in v2:
- fix kgdb doc path in zh_TW/admin-guide/README.rst
- Please drop v1 of the patch. It is malformed. Link to v1: https://lore.kernel.org/r/20251020-aheev-fix-docs-dev-tools-broken-links-v1-1-5d127efec0b2@gmail.com
---
 Documentation/translations/zh_CN/admin-guide/README.rst             | 2 +-
 Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst | 2 +-
 Documentation/translations/zh_TW/admin-guide/README.rst             | 2 +-
 Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

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
diff --git a/Documentation/translations/zh_TW/admin-guide/README.rst b/Documentation/translations/zh_TW/admin-guide/README.rst
index 0b038074d9d1fdb8de3b64c483479b1b336c55c1..c8b7ccfaa656d23a9ba089459cbbbf63ce35ba14 100644
--- a/Documentation/translations/zh_TW/admin-guide/README.rst
+++ b/Documentation/translations/zh_TW/admin-guide/README.rst
@@ -291,5 +291,5 @@ Documentation/translations/zh_CN/admin-guide/bug-hunting.rst 。
 
 更多用GDB調試內核的信息，請參閱：
 Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst
-和 Documentation/dev-tools/kgdb.rst 。
+和 Documentation/process/debugging/kgdb.rst 。
 
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


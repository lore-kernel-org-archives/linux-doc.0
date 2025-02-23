Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570A810A3E
	for <linux-doc@vger.kernel.org>; Sun, 23 Feb 2025 05:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740290291; cv=none; b=QzhnQ9OOdrcHLG0ZHYLxFdq8XzeXZ0BbxkqRB1BV4PeThtyMrEuv1aydHFwRZKoXCz1z5yxpV52l9JV35ADhhgtF2KhLr+rOcGwcPaLC58WMkJNxgg5EaByjj5Eqp8R2az37iYmm0dJSi0KS70rX0eUPvfcXpxdmgzmmLTJdezY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740290291; c=relaxed/simple;
	bh=qFRi4M7V67ySNuY18rHC2RXx0WpJjfkOFV0gMB8ofmg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=V7M5nLLH6U4Fm2+vXxiq26hEa/7foqbbNibm+qZkMHuChNUxGwmfq3m+PitPaeHoeVO4ZgWh+gc/uD7sgIBCQ+dIjzEZX69pJZbTTbKd+BTdrZFg+QcrWyq1oedchNTaToYSNpS+lC4B2OW6F7HQgnBMj1HV00a9FzvwyZfFqqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P2meNibo; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P2meNibo"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-220d28c215eso51777185ad.1
        for <linux-doc@vger.kernel.org>; Sat, 22 Feb 2025 21:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740290289; x=1740895089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aCJ2gk3h0vKKDZ8JBdPo26R5AN3lou4nzDQuioAPK7c=;
        b=P2meNiboBR58OFvnR0URigWo5Pa2czkg4DU5KSsixanc4TusCUCOP2pR4jRsw4n2vF
         qFUI7+7ftVQ19gcuBBaW5Y+hRdjeZcoEDpZ+8c9YKWkm3nwRF7CF/Ld/5F+wZeddgUMl
         H8eOFpRnycGU54AGYvJWKoM8CAs+z2w9yKHowuXbjjDykzLOFyKCF3egiphTxeskq6kQ
         q2/S9rvq8PO7WWHU/VSKn98mv2ITEvNZO69JAQzEKWnI9msp7oMuOeIMvqPNqvmreQzv
         6hjCVRLeOkUBdrPwXZvyvRro8NcfcAJYP3+ESnn6p9qxiiimBbBKbwZZtPDVMGgGz8p6
         mQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740290289; x=1740895089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aCJ2gk3h0vKKDZ8JBdPo26R5AN3lou4nzDQuioAPK7c=;
        b=HB8JwlRYzCEfjH+GLpEAM7yCVo6hv+YhnhETxo4ogVOA28QKKwwEWUz8rObvS3HqD/
         0AITo5M9lU3zur73y9vnX4UOqbWRo+cBeL9TlhwusiOHu6eIfXj8tOJ8eC4DRVFz5F/w
         5LCK1ScTIFqG4M9nP1A37g3+1evNVpNs1/OVbZblMT75NzbbWSO5TJy4n1Y9GaEj8erv
         bld4aoj9k+gMgu2ONEL/cpWkJ3pEKsbfcOiSdeYJPJDOpTe2oU/ehkYCPSN4LXIDvr93
         Ku0drRj7xe5UkACZtD663at6+BfKmy5By22P7k4qcpZLnWNSCqaIs5W0Wqb3MQSIv5bb
         ghAw==
X-Gm-Message-State: AOJu0YwCyjtNi6r7mAsVPZuTWVGsBDGL9yZmwa2xe+FVdCjI91dkSC0/
	jyujnygyQikfjI5iNtMR2oeNUDeGicY29ir7WumMo3UHq4Jc4c+X
X-Gm-Gg: ASbGncsCp1J090B/+E/vYi6JevvMgfbVko4hyIh2Odx0ZSM8yGF+nqdktRcOdEidWSM
	gniRvSokioMz6/PdeYp2Dsi5kt8+JT8SrMPfg5gTuPZBJ2drw9WciobK7hhTjHGyNFkRZ6beR2g
	7CH7KpnzTpGD34avbbPsTg7FPQ15rxonKC02ca6hJGg59rWRgQdYRt7fnfaiygJR6bJ7H7FUvDA
	RCZSbi4PWOP2mBMCZ4rbq3Y9M91uWNaif2bCnBWmE+oyUwlSTtexzL2/DKQfVyEl+2Z0NtHnoLJ
	0PGlUJnFeM4XXLGkdQtzdLoTlN85s+35OUJ7NouXF4/eMcwdU2yFW/tJB2+Yf8/TIuXvXphx1Vc
	=
X-Google-Smtp-Source: AGHT+IHYvTXr7DMbp/h9ZMHWv+byxtXZL4vEQ1cpozodo4w/TFJ1Zxl71AbZxknCL6/OGJjE9ypPUQ==
X-Received: by 2002:a05:6a00:1812:b0:732:6223:552 with SMTP id d2e1a72fcca58-73426c9006amr13095351b3a.1.1740290289548;
        Sat, 22 Feb 2025 21:58:09 -0800 (PST)
Received: from ubuntu-2204.. (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7324254685csm17881301b3a.4.2025.02.22.21.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 21:58:09 -0800 (PST)
From: Akira Yokosawa <akiyks@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Tsugikazu Shibata <shibata@linuxfoundation.org>,
	Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] docs/ja_JP/submit-checklist: Catch up update related to automarkup changes
Date: Sun, 23 Feb 2025 14:46:25 +0900
Message-Id: <20250223054625.37240-1-akiyks@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Reflect the change made in commit fb12098d8ee4 ("docs: submit-checklist:
Allow creating cross-references for ABI README").

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Documentation/translations/ja_JP/process/submit-checklist.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/ja_JP/process/submit-checklist.rst b/Documentation/translations/ja_JP/process/submit-checklist.rst
index 20a952cf82f9..c5b919ea985b 100644
--- a/Documentation/translations/ja_JP/process/submit-checklist.rst
+++ b/Documentation/translations/ja_JP/process/submit-checklist.rst
@@ -76,7 +76,7 @@ Kconfig 変更のレビュー
    されている。
 
 5) 新規ユーザースペース・インターフェースが、すべて ``Documentaion/ABI/``
-   以下に記載されている。詳しくは、 ``Documentation/ABI/README`` を参照。
+   以下に記載されている。詳しくは、 Documentation/ABI/README を参照。
    ユーザースペース・インターフェースを変更するパッチは、
    linux-api@vger.kernel.org にも CC すべし。
 

base-commit: 76a6782284dff53a08b688fdead3e46f22236e71
-- 
2.34.1


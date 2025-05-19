Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5336A12FF6F
	for <linux-doc@vger.kernel.org>; Mon, 19 May 2025 08:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747641802; cv=none; b=c/YZJZrBheXTUc8IkhVMsQtmrlplhBXMRt86YMAtMES8VbdNHZf0WPhke2nIcK2hOIN8JprElwT+gow8Fd55ZrlGu31HTckQwHaEHXtbcku+qAy6MYTTgHPsZYrq5/AdjNP3iQTm1b7B78JWi58OdQbUiThgMvqTOJMV7/JhGYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747641802; c=relaxed/simple;
	bh=9oitLIRJb6DYic/Nxk+1PaEc/kmB4n1FL0wrrIWZA2o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XsHNQ0sSg9ca+M4wsFsg/Kke2qL1pMI7IinuYuESa4nfJ5daT+CE/WmkhfFIf2e3d+j8Xhccs8Iyv/5gL5bJOxVj48iKpvUPDt/voN6AmXAwTtcvGqzPhHUgD7jrEe/w5iT6zXJtEx06qwgOw4GDq1jgnuac7AF5ZGaWw3K8lmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PsiHO8W7; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PsiHO8W7"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b1a1930a922so2741034a12.3
        for <linux-doc@vger.kernel.org>; Mon, 19 May 2025 01:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747641800; x=1748246600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LTOaIlhcX70w8az0x3q9zMGczZszQeFsRC/25uh5r0c=;
        b=PsiHO8W7AKUVSSoIWtZFy/WkeW7NK7Xf3f7ddqBVZFJ79xnUlgu030BryAIJ7ag5cA
         jeaGRNaiEttlxv0S8dWjRfCUyCD4y3oKyQaPpAx0JBvXQpyAzHdPyN/1xX3f6HEhSn4D
         G4Jjef4a5B0fJZLGz549tfb47yo65ES6ud1yAsmxWVFRGc45LcgqFMQuLKnbSePPriy8
         ZcUgwTq+FITjWLAZ4qsi/H+AyAfeRRuwGsPJxUL4A91H1Te/Ec63V/c2CaSXtMru69K4
         ZZs8J2FvVjDYn3jRT990G+ETBi5hBpOzSHDmeywEfgcwVoRymWkLr9iVd7/GKKNvO03u
         ncww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747641800; x=1748246600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LTOaIlhcX70w8az0x3q9zMGczZszQeFsRC/25uh5r0c=;
        b=CQylrRLtSOjuUHLV5lAMCXVUhW4RqOn6KLBtoELLpCko2/QpnRcCRIOE5lqDlOBu6w
         Jrai19rKFb767sSG/PXJ2rSwTdm0fGdeR/G9Po9ZSN1DSRGJD/zueevO7Ab7tzvbUCCy
         kZlIOQOeMfTho9vIH+qBxJwMBXc5YnJjt5nYlVKARizjAAxaMt6tFiF4OYdfyDw6JwzQ
         kLv49mRYOFEOhHtWsic8EGqyq0kI8OMliQlVatCFRHu16cQ0MDEzBmFdq/fGOSzp+N/a
         1UJ2UrEBKCDbhFDldUlcHeQSrP30yX2Hf+2S0hhtzuMwugD/FibwtVaP5xCSHW8P/Ybs
         skbQ==
X-Gm-Message-State: AOJu0Yz9BEqvhafcLL2IBNQT2w1upbErqtrxVIBkFqm8kMokskErxvEN
	qDDpYKl1mN0zM30mqw5gT2ffxZQCHrBR+XVItbQ1FAXMcT//4tYNiwKO
X-Gm-Gg: ASbGncvXjbsgCP1yGHKYz6RSkxsjDU25dJBQJIQ2rFSmol5R+bvLdKEXfSkfQFtOp/y
	BNgwceol0ocVGFyyL68vUdp2Ur9vdGIulLogfyuaZdiHOGMxhEuQHZyyMWX5DDAXWsMZYkNpPFa
	Ohor8EVkF2sPRSmySl/q63ZX70gY7OM2EiaT1LPIiqZ5H6LPjYBo5ft8mXVQIdoQC+fxbyWOr1b
	pXnUyuhWNtDr9E4ALPl+DDleABEZJ5yozGFyKYaD9WtHFrV9+jurbCUvovYnA++n0F6dTXyX0CV
	QkjTESkZ//M3oJbDJl94PKUxr25o87f7JyEOFGu8yGOpq9SqActiM6A2KWokN9QVivcxEagWQcS
	wXfQFiRrt8KLLLkpz+R34r8zp
X-Google-Smtp-Source: AGHT+IECwvvE9LcDVk7Oz1w+sAwnkK/SzbzRMERjQiTjGGDQtaMKI6/HIVbmwae/yEYZoa9jazCqGA==
X-Received: by 2002:a17:903:f8c:b0:223:50f0:b97 with SMTP id d9443c01a7336-231d45d67f2mr148232295ad.52.1747641800427;
        Mon, 19 May 2025 01:03:20 -0700 (PDT)
Received: from devut-IdeaPad-Pro-5-14IMH9.. (125-86.iitb.ac.in. [103.21.125.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e978b8sm53913185ad.129.2025.05.19.01.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 01:03:19 -0700 (PDT)
From: Utkarsh Tiwari <utkarsh02t@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	trivial@kernel.org,
	Utkarsh Tiwari <utkarsh02t@gmail.com>
Subject: [PATCH] Documentation: NTB: Fix typo
Date: Mon, 19 May 2025 13:32:47 +0530
Message-ID: <20250519080248.648971-1-utkarsh02t@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix 'peace' to 'piece' in the ntb documentation

Signed-off-by: Utkarsh Tiwari <utkarsh02t@gmail.com>
---
 Documentation/driver-api/ntb.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/ntb.rst b/Documentation/driver-api/ntb.rst
index e991d92b8b1d..a49c41383779 100644
--- a/Documentation/driver-api/ntb.rst
+++ b/Documentation/driver-api/ntb.rst
@@ -35,7 +35,7 @@ anyone who has written a pci driver.
 NTB Typical client driver implementation
 ----------------------------------------
 
-Primary purpose of NTB is to share some peace of memory between at least two
+Primary purpose of NTB is to share some piece of memory between at least two
 systems. So the NTB device features like Scratchpad/Message registers are
 mainly used to perform the proper memory window initialization. Typically
 there are two types of memory window interfaces supported by the NTB API:
-- 
2.43.0


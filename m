Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA9C34253B
	for <linux-doc@vger.kernel.org>; Fri,  5 Dec 2025 17:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764957137; cv=none; b=SHmjz6bARQjb+6eOJvkrGeVSh8n3avK0+xhtGn9VrLzl4SwZCEeo3mCbz/dS1hvT3f2L2JNbT37JHzU4xUOHURO/8FY+9lkraMPyTwn2/A4h0GEAiDYlXb2MRNrNGrMhQLMJGerjRwSQ9tkt8xlVtl3Ucy6G4znhWosB4Sf9Sss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764957137; c=relaxed/simple;
	bh=6bFiqL+ZRpQXAAfB7f2wHLXfderF5VwVzFsF6Ck4rYU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H7VCD+5ZU7EHwMAvJPcP+SN2qiyPzkGbR9VnDUOBM19Dtjl4z/XhFMZrgnFT23MTI4om/03Az9+o84YY3wTY3ZVBuZidMK4DUAUpfACkv7tAJqOl+Ip20pThidkgmynRSWCYeUrt3c24JV3xZ4KNq3gR3X6hOe/5I3BH1PDAelI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a524Z9VO; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a524Z9VO"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-7ba49f92362so1485783b3a.1
        for <linux-doc@vger.kernel.org>; Fri, 05 Dec 2025 09:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764957135; x=1765561935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fASQSNfEeW8QYmsSgbf82Gv96VVqklM9adf0MgtiiK0=;
        b=a524Z9VO/++hpHrnbU1C6rhZtwOPymKx4/SWr3VWiSYOAvGkPGKvauh0fN56/lFCqV
         kJVI5CIgMPT1jSC9bOl1ERO8abErxNTxjrX5PT1ZEnVKD63aKqHlxh3TqNl0Oi/EXKlp
         XB9fWBIiAJHTFDYRpVAOi8EGOxn6nhfB3Jtohzad+jfPpOzFxwBkT9ZeDAgZ5lIfSU8o
         CsjtCyGXet/SWVJdnpbegLXXtEx+HNBhbEbbSEda/wOCRmnrTEUGGAOEmqgRhIzagG26
         26VAjBlzdtwf0o+g26et2YIBZVeXXkJrFbk637Dc0sKXDxmk5k1BAnYSO3sCAISOBVIU
         Yd3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764957135; x=1765561935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fASQSNfEeW8QYmsSgbf82Gv96VVqklM9adf0MgtiiK0=;
        b=F/agDo53f+6xshwQVelQm7AapINFD93hfuDNEAlaPwaSipQ56mdgDt/1kiPqOx+/lP
         ziRT6T3LHseHs6WZa65ELSpzLoEWKKCN4QLt0BnbrxyLfKsRZYFo2udZmlS8Ik7RBCF7
         06Z2Qnv/Ktcg0pzeTY4FAfUAgLKXLE2ihHFVH3moMmlInT1bxLh1i9i/xHSl8kaIs5pg
         UEm+HfUEuR2D9QLCxtd1mUiCTNMNTkmWvFs4oU75yc3LfiSlKUSSRv4h2ActJF4v7C4S
         IPLUA3LVeW8leuDoiXExENpAYFvg7Xgm0lcnNlvtLKbMKehATQqt/e7B302bQNER9ERs
         +/qw==
X-Gm-Message-State: AOJu0Ywq7DVSLyJ0vHGAK4ZshUG1w46L35QZEaRh6MJdisgZwCWKeihk
	tpv1IDerVpld5ShsFrwvjIYGVmqmZWJAVKAy0Hb6BPGLJqaLt06F7VTS
X-Gm-Gg: ASbGncu8v4nXJd+9bdjUNchpDOVSBhm2ZBw/COTA3iI65sc2Qo+l8y5tS39C+Bg/DMC
	HPnnMhXkhARWPhxeLBxPIUW0OZOCE3UWlA4tDOVqPxnx2Yp8fG4vGf7ci8H0VE8Q5at3E00tRwd
	wYz+v1c1A2YziG+xkrjInHah6AK1wVP+gS/pXbLLBQ8URqmJoz8TJXzRpRJMfVmUq5lzCnZCJCG
	tPg76QjCcYH2BA58vLl00o4R7dTS45/97qf2Hvl8a53wtdlqXg5hFC+OCFnYeIncfQSzOfZyLdK
	6g2JAXCFG9A1z8UH0FBvuahSyK27v35RF/BBhjQazP3bUPfhg19GLEMtSdg4hnSJ16K/bjdL0NT
	bVgTQvU3rYWH3atjP9r97xvtqmSLLK3pwO5TOUKyHp8Ievv/RuTwnIp5/mdhOIxssnx+T/UQNDi
	GGBSdlW9N9GKzG0VtZ91+qBIm23SEzpV/4pGcZPSRsZg==
X-Google-Smtp-Source: AGHT+IGmFoBY2liuuk2dxaKDoxDvNbigg3ZojUtqDQlRdYbPNwkqQOFkXbrQ48aVqXVLXjHyFq6zQg==
X-Received: by 2002:a05:6a00:2d19:b0:78a:f6be:74f2 with SMTP id d2e1a72fcca58-7e8b69efd8amr84428b3a.5.1764957134588;
        Fri, 05 Dec 2025 09:52:14 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:8839:f626:f539:b6d1:1913:1426])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2af658d84sm5762425b3a.60.2025.12.05.09.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 09:52:14 -0800 (PST)
Received: (nullmailer pid 619145 invoked by uid 1000);
	Fri, 05 Dec 2025 17:49:37 -0000
From: Kathara Sasikumar <katharasasikumar007@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, shuah@kernel.org, skhan@linuxfoundation.org, david.hunter.linux@gmail.com, katharasasikumar007@gmail.com
Subject: [PATCH] docs: arm: keystone: fix link to devicetree binding document
Date: Fri,  5 Dec 2025 17:49:33 +0000
Message-ID: <20251205174933.619122-1-katharasasikumar007@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

make refcheckdocs reports a broken link in the Keystone architecture
overview. The referenced devicetree binding was converted from .txt to
YAML schema and moved under arm/ti/. Updated the link to point to the
current location.

Signed-off-by: Kathara Sasikumar <katharasasikumar007@gmail.com>
---
 Documentation/arch/arm/keystone/overview.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm/keystone/overview.rst b/Documentation/arch/arm/keystone/overview.rst
index cd90298c493c..bf791b2fc43f 100644
--- a/Documentation/arch/arm/keystone/overview.rst
+++ b/Documentation/arch/arm/keystone/overview.rst
@@ -65,7 +65,7 @@ specified through DTS. Following are the DTS used:
 
 The device tree documentation for the keystone machines are located at
 
-        Documentation/devicetree/bindings/arm/keystone/keystone.txt
+        Documentation/devicetree/bindings/arm/ti/ti,keystone.yaml
 
 Document Author
 ---------------
-- 
2.51.0


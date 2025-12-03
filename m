Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339EB355819
	for <linux-doc@vger.kernel.org>; Wed,  3 Dec 2025 16:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764778652; cv=none; b=cHgEZEpBuyr0Ad8aBoVm2q40DiqXDlNNF71RERZmvhNMp1OhtI9FkFyH3GyB7jKvPxWlKBtNdKQfjXnzkEOCSmNV5d4osOVLY0LrhiWSEfZoQFDcJPkv25O1SP4ORDu/LWtprQidXd3LOHYKrXMPEOQYT6LE1UjZvvOFzpwqVKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764778652; c=relaxed/simple;
	bh=m7wvzK8n8mmykCuV2D/oT25NmE4Ik+3Vyjk+3fY7zpE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=giUgVA4kXYYBPgUrx/YmOJkLIAxOQHh1mSpwYeZWQvjIqmydJFF29GCcBF6YozZmHXMZ9uS9e5lXA4GxkXX1VGosYJRnB7KVqskgka68/TmJ1tSSCp+4psGMS6Ww06wxzbOEzLmprDIFHaAfrLPdzIZdG5jO9oItNbE4tzHoxL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CRXTajov; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CRXTajov"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-349195f1a52so454754a91.1
        for <linux-doc@vger.kernel.org>; Wed, 03 Dec 2025 08:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764778650; x=1765383450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f4FWWbLf21dMPxikVgw/00BlP8I6uMMKHQua6OrQ6Ro=;
        b=CRXTajovdAFeU+/k0XtNZPM8r1NvDSP4QqxGhhc4qA3ZJkgNk1QI8LrCQkJcGyNoKI
         qTqatJfvlxsidg87K2HHRCxQ+uycYgaVH+TeaYkv34t086sNEH/O5dRR+g89Hz/t8eVR
         86ku/xb3HCjWdm+brS/ksjTpiPlQFdBTOkKbpS51s+w44hSavIc3UNNwYENHYeAcUBl7
         2LHWPS2kNoXiAHFq8U1juOZhGL9v0TsYIRbyBCePc/9osnlcRYKurj1M6MFDTp0ar9a5
         8h8Y4HltOwJvI2MgbIB6HI+dRjLgIFgznKTJBG3+x2Fy9cO8nVgQrE9gtDk/WpeNr1Gq
         lO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764778650; x=1765383450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4FWWbLf21dMPxikVgw/00BlP8I6uMMKHQua6OrQ6Ro=;
        b=QRRuWPo2artHD8d61KrHHJ9GWrUa0yN4yqKurpHAKZeP7lQEMeh1VI8q1HMZSkuG7+
         Tx6ZL8hB6xy3m1IJHDhVBULdXQltg1EV34cwkjRlBQVM9nENb1bLFJPWXMNYBtx/kovH
         rvQNOZU1HfrEPAOeH5aeubJROpqUkwpIy0qewVfpT9KU46gFPetZFfxKxrYHU7wsRfsk
         cI3gpCd3rgerpK+te9N93YaittPIEZGlmy3ZNAovKFXCX86N8VUazGJfE6R82Mifi66T
         KJW5oP/fSN0qJylZ+FlZxEfU1PY+30i2/YdQh1kDwUs7sdh+R+ZtSGU/WVb047xiQESB
         IhGA==
X-Forwarded-Encrypted: i=1; AJvYcCU7t9el7aM6J/CSyhO4M98g1cKIje78cIn9pX/SLYTpjx7W+Rx7MoAjpqQrQpJaRiF+d/dYmgz6O+A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2U96y9QzMldrRfG0PF7bHi9s5hEgVnUprBHDwn0iJbdoKwX3m
	Y4HmOTr2V4mBnTN6psXWIpq5o0DNPGn2LkE6UhwtkzX/GKA8bqIFP7cc
X-Gm-Gg: ASbGncswwA0OtQx+pr13/HUHr5iaqAMHiRAgek3DZayFx/IMIYEDruV2r6pxUuulAP0
	XTk50X7vtkNqWDUpgOI33ZJ+fcStPnGLKE6KlJhywzZzngB1OYxDGlWiaWkOF9GnEnsneExbCO5
	KyBLHWRoBPzB/DhCcoImBUTOPlGXvT/6zd+/mLt1nVigWvuNxeG/JVIeJpy1rN+MNuvr19kCiPC
	TFkTNJiI6hBV44dHNOE1Ec7qVp3iZAtXzSF+7EfIA17Fnx5Mwfd0itlmpVk2IuWDiSg+3auEktK
	poptmAp+Gxk0xuyz0dqOYRqSsVbwIDuLhKjva92csZXMBhK7i6fZPqckrlHr3zQuMweNTdM/mW5
	FG8QZZLqkH4g+2/Q8G4P1TYfG7rE0s152NGsfi6JBmrMK/WMxlRfLNSUZXzGiykpMerG07/DdFx
	gINrry79vJKJLnJoeJRlY=
X-Google-Smtp-Source: AGHT+IG0wf1CCleit4IgAC/R6vQH2LL9zvgHeUegQMPxsBffDavDd2CxDbNg/AX41E+TrhXK6iC8Ww==
X-Received: by 2002:a17:90b:4fc3:b0:32e:2fa7:fe6b with SMTP id 98e67ed59e1d1-349127fdf70mr3304990a91.14.1764778650381;
        Wed, 03 Dec 2025 08:17:30 -0800 (PST)
Received: from soham-laptop.. ([103.182.158.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34912d1765fsm1117975a91.9.2025.12.03.08.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 08:17:29 -0800 (PST)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-kselftest@vger.kernel.org
Cc: shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Soham Metha <sohammetha01@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: [PATCH] Documentation: arm: keystone: fix deadlink
Date: Wed,  3 Dec 2025 21:45:32 +0530
Message-Id: <20251203161534.37414-1-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The binding file 'keystone.txt' has been converted to a DT schema.
The current binding is located at:

    Documentation/devicetree/bindings/arm/ti/ti,keystone.yaml

This change was made in https://lore.kernel.org/all/20250806212824.1635084-1-robh@kernel.org/
and merged in commit '20b3c9a403ee23e57a7e6bf5370ca438c3cd2e99'

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
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
2.34.1


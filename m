Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204DF5234
	for <linux-doc@vger.kernel.org>; Thu, 31 Jul 2025 12:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753966164; cv=none; b=oEgdGVw95e1XArWSyMLwhquOEqPfloblLTruZovZn/vdzKcceLwIJJywfYg++1VXV4CllGilu1Wi3XabA/GVGZtfN/SPElOTeaViUdvJ2qAkdrLOGw6h01RFhaB3wGSQYoV9YgigghvMAvJtv6OD9r+zGvGWz/9CKTT2nyGGM5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753966164; c=relaxed/simple;
	bh=mkVOj2NTyAxnVS5zp9jHmusEh4Rd9O9gQokE52ch1aQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PJmxyxDw6i2Sm/G0IGhKsxz0b9JahsonOTbvH3yGtXQue58hjXGyqOhfiw+EakUXzw5eccEBUmIGPHnCgoIMtA9+sr927fSd/m0W5rQ3RlYuflhdkKUeBRSiH32ZKOsD7MsDD4p6cWXCNdL6u2fsBp49wHxer0WW1mWjN9pVVA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=BdQBsazb; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="BdQBsazb"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4561607166aso6115405e9.2
        for <linux-doc@vger.kernel.org>; Thu, 31 Jul 2025 05:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1753966160; x=1754570960; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=83qJAscvMaL252urhMvFnilSG/WgmVTwHxPwthrKmiE=;
        b=BdQBsazbEM31OQEtt0K2aIfdbsPKjvXw4D/Zq441xdtPIY+X9sPozVvzW6Vla2xlxB
         03eDyHHXsa6WJSz6iJmwWECmo0uOCpw7Ff1HWHWoM0k1DTM8i56UQmt1pO8pNkeUCdkc
         x0GTofAjhxasWyWqSp1uuQ5n55GKRVVV0FdmN5cs+hvs+pVfK5Z6uBFHDHXRJ0+/p73W
         nAEvzsRRCFZw7azfWUwX3BX8q8Izu+bf0V4Jpqy4R5LkALkkLR3yPemjne2xBb/a7GAs
         ARVHPSutIfdUeTYDP+BkrrG/evJQk1tEnPRrihQ4Erl9J/7r3QhGgnG6kv/tWN4UgoLh
         gIXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753966160; x=1754570960;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=83qJAscvMaL252urhMvFnilSG/WgmVTwHxPwthrKmiE=;
        b=Caza7Fg0KJjI8zh9umP+F92IUNko4rYBTp5tSDlVjE2EPLeemAi9lcbOSJH0cdf7z/
         avIcMrnUX2v9EX9T+ZnK4IrbWSSUklJ1vyggVNbNLmN9cuOXc0j/PkvJAOoP7UsHL4CB
         s0+dFQbjm/i6koGMJnplnnYi/LAvALudvvfYgagYKjqSZT+EXlUX2ePGDp4EwQTBb5iS
         bFfOjfp9xThrCpO8gO7kujReClMoLWiZLpZXMM/zn+MUenRiBaWkZ8C855be/ssWHfg6
         seuW4Kk2/hoZdptLb9BUH7nalrjsZnMEH+YUsrcGRkDJwna2HGQOltTt208B1bMDgwlt
         F5Kg==
X-Forwarded-Encrypted: i=1; AJvYcCWVZgR8fgKWbsD5QEqc83z8HPhK+HhpafG+1f7DZgAeG/FxWRwwNKFXK62Go6m7BdOJbf4wDZ+IxKY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKuFmj27/1uYaBTXH7k/ZZhNGKqQ4mFDCSjU+a4/CSTpzk6Flm
	MffkqiwaSukMKpBfArLvHP3MkfliCfC21vN7rRACCPIvEjxtbNj86Pj/iPJR35xpqy4=
X-Gm-Gg: ASbGncszRMdfFE2e3MGZoEoBfLK4R2rHQQy+md2p4UiHa436d8iauC2F+y0qZAXOo5w
	tyyViqbp60OVKCneNbDOcyjVuXA56u7Qwqpm2HWqQso0XgG4Wme+uIZg9R3ZTY8+bip6z4dnYrq
	3Ix2LEVPenqP1aRs8bPp6Qgf1csRPtbphd0/CZRvsIGrKWdocqqdx2Y/dkR+J3BomKYkPvw2nzy
	MmTfwM7bdG2Tuji+i/+d8TKKF0kdVB/o+hmSkz+qaP8akqYdn1rgb9PFZ/pxYkiNDOJZT68N1e2
	k9Qh93zh/wQ9pTZSK4MMNLnGibgI3Fhd8x3ZOhsXXybasHekJYfkjCzvKaudZ3cbLbxaWMxfxqB
	I7WG7nJHrie48MkNqf+PHbEYMsbfZzVjEL9TD
X-Google-Smtp-Source: AGHT+IEeICcdaMQqoN/ClD3HLTeMYL8IlY10D3jv6jriHDKAB7/clGIWi4TbgOJ/MIilsJhI71LUHA==
X-Received: by 2002:a05:600c:8b81:b0:456:eb9:5236 with SMTP id 5b1f17b1804b1-45892ba3686mr75462595e9.15.1753966160507;
        Thu, 31 Jul 2025 05:49:20 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:bc36:d1e4:f06a:e214])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4589edfcdc3sm26496785e9.12.2025.07.31.05.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 05:49:19 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 31 Jul 2025 14:49:01 +0200
Subject: [PATCH] Documentation: PCI: endpoint: document BAR assignment
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250731-vntb-doc-v1-1-95a0e0cd28d0@baylibre.com>
X-B4-Tracking: v=1; b=H4sIADxmi2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDc2ND3bK8kiTdlPxk3eSU1MTEpDQzw1QLEyWg8oKi1LTMCrBR0bG1tQD
 x83rpWgAAAA==
X-Change-ID: 20250731-vntb-doc-cdeaabf61e84
To: Manivannan Sadhasivam <mani@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Frank Li <Frank.li@nxp.com>, linux-pci@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bjorn Helgaas <helgaas@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1863; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=mkVOj2NTyAxnVS5zp9jHmusEh4Rd9O9gQokE52ch1aQ=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoi2ZLWZsA+zFwQXX+0XvAuP8szM4lJiXZoW2NQ
 zWY0y6HNwSJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaItmSwAKCRDm/A8cN/La
 hZTWD/95gKRIYfDY7sLoWcKrl4/uzvnfPfhoznwDtIsDVj+Nhd6x6YFiS8jRwOZUmM2x8FLBobw
 /xTSk9jI1eShAtn/pWBe/7eTzyNysVBuvZdkLYFiPasHr2gzuIpXuNdJzFZJxt4cqQPlmtAcmEm
 bbeaS15x//hNbGxBQaFM//HAcDLBqQhsVq+RdIJ5IYbvwq6gs5J0U894J0f8zqqbGBDumex3d+K
 ySeztabQKF58mL7Cjdx56edW1uhz3uWX+jBd4D/7VeCNm/Ljfm9evE3k46Ydyt5Grg6KavMXk2a
 gUnIZ9/oNxAkg+VWLetopjqunZqYqGV6xkVxAkzhMoWnKrqXZ/01/Ug2qftZHc1MrI0/pMOhiwC
 YFF68QYeWO0hnpwlrKAb/ZSgMU7pHOcBMm0hTrQ4b2/0Zm/lkAHXZaX/A6b4skPZlSPXVgCvth+
 uE0XJc8Rj4+4kEXYRLZGNREewFKQeudakaZ4Ov9IHgtAHi8ASQDbt5ghQj9wamDGwmOP9ozV02b
 nUCa1/D8vwqn2/W009XDS+M2m+U5oWCl7xRuUfvhoL/0OSRlxx/B3gR7wlWKjOgzFiA76nflxkw
 FTydrfWNRwNbtMHoeYTMrX1n7SuV9ESaiarTFyFlo4mc+fM04O6CeFLSPnGdBNJbSEvPhd7TtK3
 PmFCY6lTg/EbJWQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

It is now possible to assign BARs while creating a vNTB endpoint function.
Update the documentation accordingly.

Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/PCI/endpoint/pci-vntb-howto.rst | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/PCI/endpoint/pci-vntb-howto.rst b/Documentation/PCI/endpoint/pci-vntb-howto.rst
index 70d3bc90893f3315a7dff394d57e45c8378e2a54..9a7a2f0a68498e8b4297f24261954558d45c43a9 100644
--- a/Documentation/PCI/endpoint/pci-vntb-howto.rst
+++ b/Documentation/PCI/endpoint/pci-vntb-howto.rst
@@ -90,8 +90,9 @@ of the function device and is populated with the following NTB specific
 attributes that can be configured by the user::
 
 	# ls functions/pci_epf_vntb/func1/pci_epf_vntb.0/
-	db_count    mw1         mw2         mw3         mw4         num_mws
-	spad_count
+	ctrl_bar  db_count  mw1_bar  mw2_bar  mw3_bar  mw4_bar	spad_count
+	db_bar	  mw1	    mw2      mw3      mw4      num_mws	vbus_number
+	vntb_vid  vntb_pid
 
 A sample configuration for NTB function is given below::
 
@@ -100,6 +101,10 @@ A sample configuration for NTB function is given below::
 	# echo 1 > functions/pci_epf_vntb/func1/pci_epf_vntb.0/num_mws
 	# echo 0x100000 > functions/pci_epf_vntb/func1/pci_epf_vntb.0/mw1
 
+By default, each construct is assigned a BAR, as needed and in order.
+Should a specific BAR setup be required by the platform, BAR may be assigned
+to each construct using the related ``XYZ_bar`` entry.
+
 A sample configuration for virtual NTB driver for virtual PCI bus::
 
 	# echo 0x1957 > functions/pci_epf_vntb/func1/pci_epf_vntb.0/vntb_vid

---
base-commit: e046b1731006b4c6c94bcb4ef1c6692a30014c43
change-id: 20250731-vntb-doc-cdeaabf61e84

Best regards,
-- 
Jerome


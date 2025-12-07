Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5207A296BD1
	for <linux-doc@vger.kernel.org>; Sun,  7 Dec 2025 19:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765137422; cv=none; b=Ju7qlA5Pf5L5EhR/OGPLiEpiOf13TyDSUxFR53MtEnVYqgNZJK71BvuQm3OhEpTBebRY9TZ6TGih9ZiFWdYhQChQ7u2xKwVJcPUCONPE3CkCIsxtuZZsIqDlC00V1TMd3MhaiP2NjSQHokOdMflaHTVVmyEmqh0e8ldbuIaPcY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765137422; c=relaxed/simple;
	bh=C+oNWRBOAtFt9RfKNtbF+LyKjU+qYFLqt2xodruGF2I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KOYBHGzN/tNPYtns8H1yw5DtV0fR55RDfXVlnJtBFW/yKQnncSp51WM3r4iPW91smAjZAxkBiimdMMY0YuLQUQupjVLMN4wom04kO4Hs6LQ75mis4pSFQRiPuUpsgGnJ+AyugoH60eOkpZd6NNmKYzLR5OPibCVSKTsPCvAsT+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxc4w1vb; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxc4w1vb"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-34585428e33so4062371a91.3
        for <linux-doc@vger.kernel.org>; Sun, 07 Dec 2025 11:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765137419; x=1765742219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I+mfuD4rm4H2SLrpPIMws59Eg1hn6cRYUBP2HrIHHPE=;
        b=mxc4w1vbS8kGOuue5x6HIJOv0aT6zHDUdFFa3rv4F2IGIJOjMPVAizvgZZUnFrA4ig
         cSJPtmOb2ctFs/6txu7J/O4RW9Zk/WrIr5/UJjc+jLKpZVeE3buEqdRr/CdyJbxhMcDr
         nbpc0fGpqHUqfcbiBiOVO4wCpiDdlleHKt4NjY5clV8VpxTi6bk9hFN+aqRIGW/gxV+r
         moEuUloiVMEL+sOSL3K7WuXICpj0o0yX8Y9tjrHPcJltpflRwuM+aYKKINvneGcCzGTb
         3sfV1m6NzDm3AhnrEkMOYFIreE0N3M++byQpSR83q3DnrrdsTVoaU2LqzTcUW6c3fgKX
         a5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765137419; x=1765742219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+mfuD4rm4H2SLrpPIMws59Eg1hn6cRYUBP2HrIHHPE=;
        b=hgp46QuvPcFYS8f/1sjjAYy5Jv7K1NmAZcTLr58tl+T5q5jFJ5z+dhToYP/AsPlGNr
         HM/AIJw1bjDsvv6megfbpdRVxgMIYsD1yPq5xRiHUotjZHxTlg7NIVQLdvF10a7Ea5am
         SOP5/r6mlzlYG20GqTq3JB5fea4q0NTOnoPK3sdCujYsPcn+XNj3cfnMPykYikKDbLk7
         XtUU8xRKye+Pexuqr32ivCIzm4FDMX3fIfq1zZ6mU2xdLVr2t4KjcvSr4lntV/pnNwU2
         GFbqKNDBP1nqkAo8H8CFm3kT4WS9GeRW868IDDOfUZrX+mLFH0e+sJahZ1p6JC4jPGo5
         hKcA==
X-Gm-Message-State: AOJu0YwhqVcJlhIgTEmqqs+E3usF79k7d64XHtDEmK3qj4MsCQsFvdBT
	o0KiBj7i76NTki2Bum6l6rI4T2DW1gsf6kNF5JQe2u8MgVA7QUmn5+SP
X-Gm-Gg: ASbGnctvTOXaEDpn1n8gkxi0DwHDF0U1sSEmCwUF3a6+PadTw+rU6QAmpisZwRge1KQ
	o6Me6vQ1+QRCHJc3KFJylT51DJD7Ex3xymogysTOKUFuolHwcI2rRuvb1rzKO82kYMqZ4tnYFzD
	v/jT1AEBGAZl9DT2hqB+35AagUGknMZs5M4jx1eR1yIHJkRQ0ajd//AOwMByI9ashEEE2l+TW1t
	MY/xQcPsO3OxpbHnCZrPSGw1ptkNUmfyKdFhhcx0Zg4p5USjKIuQaecrY4cmLe8ObR+OqgAQueH
	cJ7jcVcid46ku4pqOUbZTQbnOtnx4SAv8CNbZtNqMQch4qzLs/oIl81HqT6vAw+7S0ytR27lSfu
	lqLB9LQnlE8neWaFPAQ7MPQCACy/47PIonZS1tUWUKB8hTSo0VL4vILg8M7HgVzAzdUHdgQL1ZA
	4Iy1pkGg==
X-Google-Smtp-Source: AGHT+IE/a8s8I9pMRP2UkmOsSIFqQFQtXsLdaA2s3W4OIU6Yzl85Ln6jIGrQryCgJuKQid5jk3p9Dg==
X-Received: by 2002:a17:90b:3f90:b0:341:69e3:785a with SMTP id 98e67ed59e1d1-349a2530867mr4543780a91.16.1765137419538;
        Sun, 07 Dec 2025 11:56:59 -0800 (PST)
Received: from golem.. ([223.187.99.232])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3494e84f5dasm9614459a91.7.2025.12.07.11.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 11:56:58 -0800 (PST)
From: Shubham Sharma <slopixelz@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shubham Sharma <slopixelz@gmail.com>
Subject: [PATCH] Documentation: arm: keystone: update DT binding reference
Date: Mon,  8 Dec 2025 01:26:32 +0530
Message-ID: <20251207195632.68681-1-slopixelz@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the device tree binding reference from .txt to YAML.
Binding was converted in commit 20b3c9a403ee ("dt-bindings: arm: Convert ti,keystone to DT schema")
and moved to Documentation/devicetree/bindings/arm/ti/ti,keystone.yaml.

Signed-off-by: Shubham Sharma <slopixelz@gmail.com>
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
2.43.0


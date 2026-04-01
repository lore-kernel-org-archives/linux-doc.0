Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3283A41C71
	for <linux-doc@vger.kernel.org>; Wed,  1 Apr 2026 14:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775052764; cv=none; b=cNmhLVlFn7VZOp5s444v8lcpP7nWVoUTCDV8XjaTqfjHVvCW3Q75xrRm8waVDZgcJu+G5ufPxgFvHokx5iEQs/LTpky8eBqVPGj8qypDjrgXkaROrU2s2ot/iJ7dtxEjTJsxnr0FZZtZw6nVeYr4ua37ROOymeMgF2jCoKm9glM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775052764; c=relaxed/simple;
	bh=DqXJZ3lh/OE1EVi0PvWEHF22p1cOxSawGwKEf08tEH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ft0QbNeWJdzu1IlDIv9DfBYRsLbYqoF2+Dt1MeW41ZN7/xuewHKwbb6azWB6ccmL9q8M/yu07IBqHONtMKOSWpfwUIdzkQLYGRM3bBtrnzeZ8HoQLDBzMzb8EqAkQ/FKkw0024RbKalDVrWaVx2vb0wuFnlafJwavlTbPILhCZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gqhke5ZR; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gqhke5ZR"
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-b93698bb57aso216249666b.0
        for <linux-doc@vger.kernel.org>; Wed, 01 Apr 2026 07:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775052761; x=1775657561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eNbzmysiUFAR6ewHJPXBQLltfbuZu91UBgglYYGllSE=;
        b=Gqhke5ZReZK2pKgyn11y/hb3H0BEFBmW2eCZxk2flHowLBlwsRonX45hHeFMPKQsi6
         AnC8rDuD/ZG4JYpiCjc51AHXsjzHZ2P4AvtIbMHfvr8NXyHutY2/V5erNXUZYk4bQ5FN
         lGEyTiXSI2ZBcQZCiXc5vlNGm8F5eW9qvf/Ywwn9qfC7YyVsmyL3VZpREQiCkGVamjOi
         IpdSSRFYxoqIeNjQfYEOgHzvEnpFyxwCyJuTeQMZR1BFuJZEC/2OsEMYghuBAGKvZPSD
         pzVOWNt8YO/lZRXrTgMT3XuiZ7jG/uQdDYRBhuvb9AXxMo7AhH3JZSWEIJEFtEmZ14Cx
         e5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775052761; x=1775657561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eNbzmysiUFAR6ewHJPXBQLltfbuZu91UBgglYYGllSE=;
        b=pQ3F42SvUNz3nIOBy6feSL1DJyKHysJh3s+neq2p8aKM50xH+rq7ArNvGrLtvHOJ+f
         QQ6x+b5ZDek5XSFpzDmFdLwTbd/rOCq5f7HdQ0cY3M5ogfitxTAVYbn5P3/Kfz6y6iUS
         SwxRx7ArAmpRG7Mrd8qeO1A131hhHK5C6nLZGArWCleByKJYsAslNfH8QL4Hr7n7W5rN
         eoAMMlpE/xnVULz5G4m68Cywy5KPUQO24e2ll5Z1ENKpAKLvhyx54K5gKAHbl95fsv5M
         Snlrmuoy9oLnJK4c4r3Iu6pFZCxB1X/NQw3xcT8Afx9P0oa+fQmpMr5KYlFreQM5+3pU
         Bb8g==
X-Gm-Message-State: AOJu0YwizRwIYGE/kx7E3t3uS6jjo237RG4aFC61gPEqHGcr+zR5LLzJ
	LXhVJO2/wXB3uYNcVTOLe8iaEuYlJKPcafKpmA4gQ2YvVUhJJxFsW781ZXzjnSbSyInfKQfTmYc
	=
X-Gm-Gg: ATEYQzwRyrPPHjXGmfo+rFYAE5CoGzg6aR25lZWc1G6MRtTAA9OeuwCluPa4ywL8sxX
	1qte4NthPdT4lplMuUEobihH9AroDOXIqJQ72k6N+cfaxwP+CmXjnkBbtGd/MsZlLw3pT/UXfV5
	tmfAFTq1yIwyePOox3mkeG70vKk+Dw87GLlClXnaasSbTGx7pgNNp521Ccy+KK1OlaT4jqPJFTL
	h7tW3+rAXojOM7NaZ6HxjzRVDqF2gnP/vaJapVxqlSvYISI2E4QsFiIyTZuJzG1FVV0dpJPM3Km
	TIM9BFALgMDzjgUkgff0D1MQ/+ljCx/z0fUqDFyK0cjnnUMMO842+MIBhUTXXcbKgy+9w1+NXt/
	i1TEIVDMyX3i7yWTYow2qrQEFU1YykOIEaQEj947uv2WVei1zkKGGWVxE9UTFUMn/5bkiacQnTK
	HZiOVR
X-Received: by 2002:a17:907:6d23:b0:b9b:132c:a590 with SMTP id a640c23a62f3a-b9c155a471emr223385966b.4.1775052761329;
        Wed, 01 Apr 2026 07:12:41 -0700 (PDT)
Received: from computer3.. ([2a00:7c80:0:3b3::14])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae51ef5sm518060766b.18.2026.04.01.07.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 07:12:40 -0700 (PDT)
From: George Jones <gjones.dev@gmail.com>
To: linux-doc@vger.kernel.org
Cc: George Jones <gjones.dev@gmail.com>
Subject: [PATCH] doc: fix typo in serial-console documentation
Date: Wed,  1 Apr 2026 15:12:11 +0100
Message-ID: <20260401141212.23955-5-gjones.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260401141212.23955-1-gjones.dev@gmail.com>
References: <20260401141212.23955-1-gjones.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: George Jones <gjones.dev@gmail.com>
---
 Documentation/admin-guide/serial-console.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/serial-console.rst b/Documentation/admin-guide/serial-console.rst
index 1609e7479249..d3260f7846f5 100644
--- a/Documentation/admin-guide/serial-console.rst
+++ b/Documentation/admin-guide/serial-console.rst
@@ -55,7 +55,7 @@ times. In this case, there are the following two rules:
    subsystems.
 
    This rule is used also when the last console= parameter is not used
-   for other reasons. For example, because of a typo or because
+   for other reasons. For example, due to a typo or 
    the hardware is not available.
 
 The result might be surprising. For example, the following two command
-- 
2.43.0


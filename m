Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613E51714A5;
	Tue, 21 Jan 2025 23:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737500576; cv=none; b=IZJKJpNoEifCk4k5ZwdNun2rQh+Es+q6FXxIFcXvzLmurfIj4HJrmtB3XJ14w1GZ4pTmhoWya5oS92br4jHNzAdM1wng2j/dOim6sjISWnsdaUYgl8YcYUJSoDDvu8p/xnSpDunlL/PAHnK7vy7ewGCqXrqYxuc4tzhovZlFwn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737500576; c=relaxed/simple;
	bh=PgTUH920cC8klyBaCgrgN5q466N5W9tCE3XqanvX0gc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=f2RjIun8JIhm/laS3JeWv8RP/h8LCeR/ETswlFWo4ryybN+K9D3f619Y+F+uZD7zlR5BELX0J5ruTdykdMajLlJ1BlXkGS6uupze8Nz77aPdoYe3V525qO4b5tQXL7HwOa3LAivG+sVUkmlyiCcCTLOCJJ7n6iMlkct7YtdBPDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jhLVUjUl; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jhLVUjUl"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53df80eeeedso6188635e87.2;
        Tue, 21 Jan 2025 15:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737500572; x=1738105372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EScqyMfcBEyJw2bmjopcHaU3aA/+XNALdSngfg2OHNM=;
        b=jhLVUjUlc5EpBrZ6/HI0Ln3VDNrwwCZj9eZyYLfdjhUBa5p6Iaampac46NLcUSKYb3
         YAs8sjPZGX/QtQQr2E5Mc//2jZRXzvvgyQM9ao5U1WdVr/ZjAoXWvrjrb1gl2CRi4WLW
         hTRAC9stMiHb0M/oYHTP+qjv1CbPfL+1GuNgMW3LzjrZRy0GGKGW9fUcuJs+OcK74gaI
         9gxHmEw3X6UIqy1ZnoZ55+HUXvS7gefcXBTYZnnRMUgZWtFGnKtqTQdHlGqRftz4RXfN
         E4bYdiRIA2xzRGXUnuhtSvgh7qP63d/leLWhHJdbWZzucwGiVd0/g9Pp/DCey2S8o6QO
         0JSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737500572; x=1738105372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EScqyMfcBEyJw2bmjopcHaU3aA/+XNALdSngfg2OHNM=;
        b=Yp2UDJRy2M02WuBrPVtcv5VHB1UhQ+neTlGbtEC37CZGJ1kOCwzKeSjfGobDMWxyyW
         4VjwhDzSC6vNxHe/gPTTneGP3zGEj0VSJIojesGFXHE34tSyP+bNP0WHo0+riYjlpiE0
         t3LMx8Yvz5GAipFKCJ61Y39qdOifTYJWxOjTOYTYaVOOf9ZatENiuKJSwSgBXi4wnmzK
         wpGRMbav0KZ1e19SxAtUWPm02YvOFQoncngyXsNWLcZ39uhDbN5NMQbrNSHmZjjNWg2z
         GtxsopLHLbwSkBFeyDk4XphJ4g3dgZVqg8QGlm+oNVHSqFLdKj+aamRkcem1V2sV69uD
         n1fQ==
X-Gm-Message-State: AOJu0YzlbmnHc4fENtdJXiYHG7P6zH2pLvwdXCqk5xbLHFhFvFJeB8jc
	ntkA819+9UI7ox1sY4aCC8wazjfpT+5HZiAUWIooenfNmE4wOq/cBel5jz0u
X-Gm-Gg: ASbGncv7qJTP/wdIoRBROSx6wlr5OtJhizBFl/RSB/vXH4/hXlOI1LdJ5uVV3zlnf+b
	DnQrkk6woCAGXK1/jKIN7tznpYnv7H8U4Rr5LwvEzcJh5c6OH5H/0oUX2mmZQXym5WvmP8gBU4v
	ctCW7ng/PVOj/Vi5/DlcYYYkOP0DnaFpHiao2F6XLlf11p/keoJRUZ16ovL2YFl80RH2793Pa+z
	3+5+P0Unj2C1DI8VQCYzyFTGbY5SRQeJU3qNkVB/IsjXzA+rcTMekr+fnr7qY7nUc55IAofFGpC
	C4CH80JAyMh0RRA8GA==
X-Google-Smtp-Source: AGHT+IG7oS0qq7mxC4bGit8QmNokAC0qYxFjTcBPxIQe1MB5rsVrSPXjTii3fnpcDN5Cz/ZG0GEpCA==
X-Received: by 2002:a05:6512:3984:b0:543:9a5c:1906 with SMTP id 2adb3069b0e04-5439c241162mr6213216e87.17.1737500571729;
        Tue, 21 Jan 2025 15:02:51 -0800 (PST)
Received: from localhost.localdomain ([37.208.4.15])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af06824sm2045831e87.2.2025.01.21.15.02.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 21 Jan 2025 15:02:51 -0800 (PST)
From: carlodelos90 <carlodelos90@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	carlodelos90 <carlodelos90@gmail.com>
Subject: [PATCH] docs: Fix backticks in README instructions
Date: Wed, 22 Jan 2025 00:02:13 +0100
Message-Id: <20250121230213.10701-1-carlodelos90@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The commands 'make pdfdocs' and make 'htmldocs' were formatted with backticks. which caused confusion in some contexts, like GitHub. However, using tripple backticks is not universally compatible.

This patch replaces backticks with normal quotes to ensure clarity and compatibility across all rendering contexts.

Signed-off-by: Carlo K <carlodelos90@gmail.com>
---
 README | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/README b/README
index fd903645e6de..c1d280c622e9 100644
--- a/README
+++ b/README
@@ -5,8 +5,8 @@ There are several guides for kernel developers and users. These guides can
 be rendered in a number of formats, like HTML and PDF. Please read
 Documentation/admin-guide/README.rst first.
 
-In order to build the documentation, use ``make htmldocs`` or
-``make pdfdocs``.  The formatted documentation can also be read online at:
+In order to build the documentation, use "make htmldocs" or
+"make pdfdocs".  The formatted documentation can also be read online at:
 
     https://www.kernel.org/doc/html/latest/
 
-- 
2.39.5 (Apple Git-154)


Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E75F3FB7C0
	for <linux-doc@vger.kernel.org>; Wed,  1 Apr 2026 14:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775052762; cv=none; b=OHJYV9S5WkwYGvDh3thOuqLtPIRcGfaJ1dgbXRtaVYhBXGbmpNznsivvjjYz9A9Z15OxbNJKQ2pB/L7zBJr4CfjUnOtIULkZO/JZlrM6SBLUdui/Bdl5IGkOpexeJ0dQHk/gPBu1CKUZENyd3AINEeCX61Qqw51LvlOwY1Vt4oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775052762; c=relaxed/simple;
	bh=/cAO9d79gHgP8Mooigbx/2UybCSz27QnIpBwE7r3XiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HOeXs1AteTcfnpE8eSovK4yRNcEe72SgqaTSELtq3Lv02G6bDSQcWGwxAjJ+bPbEwyGnbTJhBjzMZiF3AXIJaKPbzLr42Dex2OFqWKuHqpfVC1TCGJR2i9iZ+QtlVenACvlZWlEDpRH414gB2BbhCyUdimE6u48nsEHb9rj3pKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0oTQxX6; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0oTQxX6"
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-b9a0762ed5fso180679166b.1
        for <linux-doc@vger.kernel.org>; Wed, 01 Apr 2026 07:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775052759; x=1775657559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DrVm0AKhLJ5zJ54hnUYzlgMWfd7tM5VRzgvEHBhb6co=;
        b=T0oTQxX6eLWPAm6Uso7vO9eweKcChddf2FkOQw75AnEEfcHmvkcbWGzfrGZc7XbpMb
         eDKRArEXdonn2iF4KDjXE2B2Rv6VRDEffF1A4OrxXf9ll0YhHYceg+e/tHzzOkDhtA80
         RVjWjbaGHn6SViOPBz3X5NXUCwmVbt6fhOIQCQEse+GxfLhWvcKASxcpFKnsrbFm9Wl5
         Nr8tDAQ2wQopbzMjXgDXlwuGWQMIj8wZ/1xeIY1ef7azU8LIUfDBES4xbj7Apox0d1qy
         dfcoDqjivmo2ViGZmtjO6pB5Ky45ee/Tj9WrlAJI1jBWW4gI8FFYMcULLTuROqCxTp37
         qAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775052759; x=1775657559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DrVm0AKhLJ5zJ54hnUYzlgMWfd7tM5VRzgvEHBhb6co=;
        b=F+vuGTOmSaaez+VcptJfOuUtqKIruQWlGwG9u+eSwmF2f7AS2cXuuifar4Ba5gXcNt
         4A4MBOH47OHzwprg8O2nOFViL0Uj5ffYNXl6T4HZ2LGm2aJhpZbopDPT0Pkt9InbqMQF
         kZSdfmhOs9BkVL2VgKG04aSW5trT9jTkzEzDKI0N7umsHVhYSjkLpyED6tnl6drZV6mp
         JOPRK560hW/2Si0feU0dP7eEr9WQ+MgJTinQQdqKGR/QdOy/rYFzu3+1k7TWSoSDe9JN
         Iyjn9MrJ0X+6OgAuldnknefcjR/ATgFqMudbyRJ0Xnn18mVUepQ70N0Mb5vQDvtSJxO3
         17Nw==
X-Gm-Message-State: AOJu0Yzcg7E/ky+H46ybPG38TCgwm+cvpP18YRLwmD/kg4gkj4DWsiv4
	Fl9pqzEjPwN7b83zHW77RsySk/h4YJYWKAul7un7nTFVnIGVq7/fCTON48IpezIynvs4uVfsU/A
	=
X-Gm-Gg: ATEYQzyfAg6E4qx5D42Dscxc5T4izMeSNtNIDeimMnAJkK1DDS+G5giU7qYMbp6CS/c
	yqEx+Bw+Cb41SssEe5gAAUE4fPV8/ZH4GI1Hi859ysOXVOWoLznwpsTS7SVmGGjsvm9FG9mw7D2
	GKUX7/D0irDRjrYtt98R6Zg6EllTBXy2+JBrC2VFqfO44kyokD8uiahohVvQNYCJ64ZLRBTphwf
	ynAVsW8o66UxGR+T+kKelln2HUmYKs3NqHehD4B2UTBp6UtQ10PRhID2H+jAAnLb6qsV4TbkTQJ
	gtL4BboHG3adLPpIhN6N9RsQqe13CstFMOkSheNdaUiYI32ZHOd4eu0tVL6/Cej86+LfTbJ+cqo
	bt0NG0J3s8ydJhgIDPbaQMnX8LEpQyzYWb6L6aanrsNNIzFJHUu2kMdSjdX3r5SPrCCEszn1ubk
	EnpTWt
X-Received: by 2002:a17:907:26c8:b0:b9b:ee93:dcb with SMTP id a640c23a62f3a-b9c155a5f22mr217560866b.2.1775052759046;
        Wed, 01 Apr 2026 07:12:39 -0700 (PDT)
Received: from computer3.. ([2a00:7c80:0:3b3::14])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae51ef5sm518060766b.18.2026.04.01.07.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 07:12:38 -0700 (PDT)
From: George Jones <gjones.dev@gmail.com>
To: linux-doc@vger.kernel.org
Cc: Zack Mackintire <zackm@gmail.com>
Subject: [PATCH] doc: fix typo in coding-style documentation (reformat)
Date: Wed,  1 Apr 2026 15:12:10 +0100
Message-ID: <20260401141212.23955-4-gjones.dev@gmail.com>
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

From: Zack Mackintire <zackm@gmail.com>

Signed-off-by: Zack Mackintire <zackm@gmail.com>
---
 Documentation/process/coding-style.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
index 35b381230f6e..28040b3d0e1a 100644
--- a/Documentation/process/coding-style.rst
+++ b/Documentation/process/coding-style.rst
@@ -719,7 +719,7 @@ re-formatting you may want to take a look at the man page.  But
 remember: ``indent`` is not a fix for bad programming.
 
 Note that you can also use the ``clang-format`` tool to help you with
-these rules, to quickly re-format parts of your code automatically,
+these rules, to quickly reformat parts of your code automatically,
 and to review full files in order to spot coding style mistakes,
 typos and possible improvements. It is also handy for sorting ``#includes``,
 for aligning variables/macros, for reflowing text and other similar tasks.
-- 
2.43.0


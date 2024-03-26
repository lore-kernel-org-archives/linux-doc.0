Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AA8A95B
	for <linux-doc@vger.kernel.org>; Tue, 26 Mar 2024 17:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711474740; cv=none; b=klA5UvUn2hW7Ww+vFNwtv14afdRjW9aZIVVTsROXtPfRrHbmYrFQucGuFnw36gg9mlAEEo9aoalTAGoEPsnzZ/7VrpLe8QjL76p44uQomwUHaj6RyXWYIT229bWzMv0qNCZCNifaXD8k7cYXhCL9qPf8fW9Qwu0kq9w/T2BqS5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711474740; c=relaxed/simple;
	bh=RkMqsqMl/8pbtsdTRymHWUTrdO2uDbYpPaYDtVtHmxU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zg/b+4rn3Y8g2e4YRg+sgFnlaqTkXrfMYGT0vze+ddjqW2UyVjmwmNwUnXtnlVnvw/xkID5xtWYeVDAlh/RaP3oIvVM87rdyye7F9Bszvsxb+obTlXsvVdC2j/r+WKogSpJrXMLf0eQxR8mPNKpSIlRrTjgrD4IgOmmXZlHfvNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y/P5DeFy; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/P5DeFy"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-414925ba76eso1454075e9.0
        for <linux-doc@vger.kernel.org>; Tue, 26 Mar 2024 10:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711474737; x=1712079537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uyyvz7Zn89bx8n+axjIp24t+La/hYrrfvCgqBrWX/A8=;
        b=Y/P5DeFy8GH5343J+iMYluazh+elG8YnfwjA2Y0C58aOhgZHtSnkzBrYNaRYP35wNg
         AjEFgArJJR0mAXr+gTFrLZOUAeuiaRsSrvvXB+8bJKibOzrQdwWer8oAsrVfvecdWWvR
         FIf5JvtB3YC4Rz7f+zIh38cFMqudZ6aXMerWnMlDU/vYhpIz80zqaC6//+0GznpBUSCB
         FVJdF8zpdmTiYLmbNPoIx7zaqpljD23VxO7YmRmklcA9OSI0yB3mMPo/Wpg2hWQFXioK
         UaS8K6pSY4gZr5OkeeuvH1dVFd42BGvhukpTSEdjShCH+oTYNr1qQr7LJhs/lImzeuBf
         ywlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711474737; x=1712079537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uyyvz7Zn89bx8n+axjIp24t+La/hYrrfvCgqBrWX/A8=;
        b=V2idgq0As+yFXg5oM/CAccxsIH1HELrGyf7qkmf67YPjvPnFV6sk+8J0BQjPcmx3XZ
         kQyNyYR4zupg0lSwDSZ5p8qkWpfaP5cZOmBP9fVz/5mf0QtF8y61VS5PkBvtUwjbB2wn
         /4BK1iAhfNc4GvX4QyntAtG5xwcDp4WARtNXgB51aVvFgIHugCRWq0ZtdOWYg7L+xD2z
         hyQufDb7AGrxaWOZ1g86GdWUUNssND/+9bf8biiZU1hgkfLBgFTmSkTsazEMEHEmcbLJ
         4QAwkCpYPMaTsytkZ7RHfm0cn2Iaig/iWklJ4Rz8zIPJixJYzFiLW8vv0Hk82cXDV25W
         1rog==
X-Forwarded-Encrypted: i=1; AJvYcCXJdw9fnyxM8rn2gvT0RzLr6RbXod5iWe/eLRCBOnB5hVkOK++YO2djBe0EiqQ6cVzCrFqBK0yPds3OYlO6yExHShcPXSncQWxt
X-Gm-Message-State: AOJu0Yye7200932VPmo5ZBGoa40atzGWqTdtGLc04Z3R5hbe1sIY1cXg
	Dsb26kGi+UvSS/54qgW2nHgNso0T26qe21Q27ZyBZy+3u+59QKSN
X-Google-Smtp-Source: AGHT+IFAeRMk+NjG06BaUY+yyhqW0dMINIDS8n56vUPGK+XLr/gGyZXgMVBQJ8tAA8+WzAZSJZnkcg==
X-Received: by 2002:a05:600c:4506:b0:414:924b:a279 with SMTP id t6-20020a05600c450600b00414924ba279mr400032wmo.18.1711474737405;
        Tue, 26 Mar 2024 10:38:57 -0700 (PDT)
Received: from imac.fritz.box ([2a02:8010:60a0:0:e486:aac9:8397:25ce])
        by smtp.gmail.com with ESMTPSA id l21-20020a05600c4f1500b004148ab95c36sm5652969wmq.41.2024.03.26.10.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 10:38:57 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: donald.hunter@redhat.com,
	Donald Hunter <donald.hunter@gmail.com>
Subject: [PATCH docs-next v1] docs: Fix bitfield handling in kernel-doc
Date: Tue, 26 Mar 2024 17:38:25 +0000
Message-ID: <20240326173825.99190-1-donald.hunter@gmail.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kernel-doc doesn't handle bitfields that are specified with symbolic
name, e.g. u32 cs_index_mask : SPI_CS_CNT_MAX

This results in the following warnings when running `make htmldocs`:

include/linux/spi/spi.h:246: warning: Function parameter or struct member 'cs_index_mask:SPI_CS_CNT_MAX' not described in 'spi_device'
include/linux/spi/spi.h:246: warning: Excess struct member 'cs_index_mask' description in 'spi_device'

Update the regexp for bitfields to accept all word chars, not just
digits.

Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
---
 scripts/kernel-doc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 967f1abb0edb..cb1be22afc65 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1541,7 +1541,7 @@ sub create_parameterlist($$$$) {
                     save_struct_actual($2);
 
                     push_parameter($2, "$type $1", $arg, $file, $declaration_name);
-                } elsif ($param =~ m/(.*?):(\d+)/) {
+                } elsif ($param =~ m/(.*?):(\w+)/) {
                     if ($type ne "") { # skip unnamed bit-fields
                         save_struct_actual($1);
                         push_parameter($1, "$type:$2", $arg, $file, $declaration_name)
-- 
2.44.0


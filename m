Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF4A78B40
	for <linux-doc@vger.kernel.org>; Thu,  8 Feb 2024 14:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707403935; cv=none; b=L5+2nAL3eQoIde6p40ZB794Cr8MVjIIftUw2cmJAxVyAQdTifDYDcvw7ZnEP7Zj5mOyfrsBxOYTL3WhcCA0I7pwSR4QcUY53uk9FkUQAopSQbuy8yb1fIAi3Ox6C7BOM0w/qUOFgSFv7r2u0m70GF72/Jtp8ZLlc82Tk8pDGcWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707403935; c=relaxed/simple;
	bh=8aXxMqKjuGYAZbxGk8K/JAdM76UCaTFG5zJidRIuLWg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LAyAHT9M0mvmKfHmDruiWOiKv42MTG9ITimgUCzbKvjFNphDS48TX/6AruvG0pd0+ZGej1TUXWaCrDZQbopU43Z7oPAbqNgyNrKqEmCcl00iJKoiLWqSD9kqCbPqRkN+le18B26h7gtfJIAOQTz1eTpZi3K7rOyuZjEz6NeFqJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=JeGk+hdY; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="JeGk+hdY"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-55ad2a47b7aso2655899a12.3
        for <linux-doc@vger.kernel.org>; Thu, 08 Feb 2024 06:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1707403930; x=1708008730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2d3bjISixj6XxfcjFNFffsbfi1JCl6LveKlFSzCZnjI=;
        b=JeGk+hdYZTj0eVsDhqIns7VzmdjERt3De3j4me5wo1de0FdOu+ARuNdaaz8P6oFpsG
         o/87pOazLEIsZb+aPf95b4j7zs844l96MEmWA+LU1Md1MJp2liV0osNdNotV/MNkbmpu
         yiBgo685IjNltGB6jMghmehJ2G+OhFpTd7lDAMAzcy+GYAWJutwwbfG4FUSmO/kPTVWR
         1Fwy0jTyHSldT1noJN8kseJx2rBHvElYA4t4x1wUK6nEoIE8Q71oVD73JPGQj8vqlQyV
         npb0G6Iz3lzqE2M98zrUcen6SKiAv/lIMN5EbTweONEDY1Xf5r3nXpBrg9grOek4OjkD
         v8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707403930; x=1708008730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2d3bjISixj6XxfcjFNFffsbfi1JCl6LveKlFSzCZnjI=;
        b=PlbJ7sQni9I8VGAkE7SfCGeVt2fP2Ga1InUHGlkhrlwQhIMx4lUNBPRAoeS4r+gmsp
         RqN376RuR09y5L6Ujbk8IQbM0vqrmTjixI085bTFq/JjXqpAXUJs94jQE/+Qz5D1cJ6W
         +ns/0q6Ylh0rzfLZ2JrQFOXuK/Qzw9oxaEQ5N5r0BT3uKiMFrfFGN1nwq6/oCj3ZjGge
         ZrZF9h/u7ieKeEWmvclbIlYT85SEKd2ZzEvFsNwa8mVkmVIO5uZVmIZXKWPGwVU7XT2Q
         PkKip1oc91vvU3D5u5nQvBqAXdSYcg+nX03EdKNGs+rvwsUpetglHxLvy455OFohKyAh
         n2+A==
X-Gm-Message-State: AOJu0YyD1vUnWEcJBVg2Tzp64DdQoZ750O60jw0lMPesRgIZ5KWS4X8V
	YbPFG/Umx1cOuuc0ZEYzA3jhkC3MNFa+H1uMGUrMm2gMNq71EzS0QwlYbRnPYD0c/T5a+3V+vSJ
	NZYf1Dw==
X-Google-Smtp-Source: AGHT+IHHw955E7ZE/Q0T8Z6irZg1N/aCs3IbXoNVqw0WOLKE3K9HUNR49ZCRYJjEmj5ZfhzbTjvQVg==
X-Received: by 2002:a17:906:5d:b0:a36:3c59:3449 with SMTP id 29-20020a170906005d00b00a363c593449mr7096417ejg.56.1707403930393;
        Thu, 08 Feb 2024 06:52:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWX+VIhhLkDx/C51uQV+PvNpVgeYss76QEu3Fd+6M96VTCfqgZ/Q+Tt1egxnwQUla/veuyA3FhPG8GcgYW65/Y30mMrw3dnuMS5exJUn75yWgK+xU/uSffTtPMI4fs0Edymc4Tb4Fw=
Received: from debian.fritz.box (aftr-82-135-80-180.dynamic.mnet-online.de. [82.135.80.180])
        by smtp.gmail.com with ESMTPSA id v8-20020a1709067d8800b00a3bb6de59ddsm122994ejo.100.2024.02.08.06.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 06:52:09 -0800 (PST)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <thorsten.blum@toblux.com>
Subject: [PATCH] docs: Makefile: Fix make cleandocs by deleting generated .rst files
Date: Thu,  8 Feb 2024 15:50:01 +0100
Message-Id: <20240208145001.61769-1-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The script tools/net/ynl/ynl-gen-rst.py (YNL_TOOL) generates several .rst
files (YNL_INDEX, YNL_RST_FILES) in Documentation/networking/netlink_spec
(YNL_RST_DIR) which are not deleted by make cleandocs.

Fix make cleandocs by deleting the generated .rst files.

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 Documentation/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/Makefile b/Documentation/Makefile
index 3885bbe260eb..4479910166fc 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -176,6 +176,7 @@ refcheckdocs:
 	$(Q)cd $(srctree);scripts/documentation-file-ref-check
 
 cleandocs:
+	$(Q)rm -f $(YNL_INDEX) $(YNL_RST_FILES)
 	$(Q)rm -rf $(BUILDDIR)
 	$(Q)$(MAKE) BUILDDIR=$(abspath $(BUILDDIR)) $(build)=Documentation/userspace-api/media clean
 
-- 
2.39.2


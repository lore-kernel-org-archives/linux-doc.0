Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B109F489FBB
	for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2026 11:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790939303; cv=none; b=H6HhbmN29dyzHyyWUpaPgRhmAiup5/Dk4erQOZvml+OWvrNtXV/vQ48trnHGyHhxVgS33+QTPfwIN7DG1p6IWvwRC5+wTfgYQzd+W8NpGDf3Fw1ToTtHZWdDVXnpeVfM6xieIH9fNCJwFaAB07KtDiGnTJdgIhn+vEYCSCUpOK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790939303; c=relaxed/simple;
	bh=WcCYelFSOhbeoMxtjGueNhLN0g0ypi6G7QGQ89YUic4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gsp2mFaVUghh23vvFr0ggwFa171rBwA6i6XSu5EpEEKl+YO/4YzyOeR/dkDEOX1QlIKEi5A8EXBPGfpaYQiZhmllKUJe4ft0q9X5aEAKjbCflBVPlwyDTZ7/MX8qZ1idJOftlt+Yft4At1KxHuGPnMfxcbQ8N9YsaJWVHGyQr5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJDh3NHu; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJDh3NHu"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a5d8fe8912so1093813a12.2
        for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2026 04:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790939297; x=1791544097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a/U30FypKXGiK+JknnhSRfyksD6iky5csMYxiBRiMgs=;
        b=cJDh3NHuYRLE5NHQCTjdWq7syE5si5MGNZ/L6+lARtOex+Mz7AGrkOFGF3Rfv26fkh
         9gT5/J+C0IVjouiFqa50Qw65NCnUeCLvPfdDHew5Tb46snFzM1dLoZj2wdaZF1n+ftOb
         uPZJKLgb9HXNipE+x7Jw2zHT982b09d65VfAEFj3r3PgSLlGhn1nLVas8zJ7lPKb/pcD
         j6ozhq/kS4T4aVNhgLpqzhFhMgPMvUfaaM7F1yoDwqGovygAyzwMCG/suFyzNBQhCUSl
         ZQoi9jx0zf/IKDMh+0Y+bYd3kVsjOBZ/OolPc5dN6fVf78Jtb+I2hSRzkousR/53Gs7F
         21xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790939297; x=1791544097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a/U30FypKXGiK+JknnhSRfyksD6iky5csMYxiBRiMgs=;
        b=z2nTC+WaLgVOHSdWrqMZ7NJk33Z7+AiSkihkD5Q/Cuk98Ht19WIs6k9YSQCJPDKEDp
         X9tI7p6B24p73NA2SHqzKND9cpNMnZLGNh85jd6CLFyzsjCMBJkgBkIb7v/A5Abd3r/f
         PISzD5hygpfvrWqobmNJ4v0mueniOs8Fi3ZKU/Qnyuiw1kl5o7fWOwRSMBswISE3d8V5
         aep8Ooa8dWiOXkQPigQk09Ujyjp4Fgk9QPaM41k9Sn3Q5Hrj+BB90JRUYjFQnT5RhYWY
         FWPLSulmmUOFSfEtxlgHVVCRx9cry7BHyHgP5xzb89gXjRDbq8Wzn45Yq/5VCrfVlCjm
         58ng==
X-Forwarded-Encrypted: i=1; AKwUvBwsrPw51vjK6HdbjFbJs57sZ2ZPbDSYjwVBs4fydcMRrHMbLAOIfWuTQs0FJABe4v6HbJWBTZVcj+Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiCX9icmMMdbghCT7kMcRkMGANDnQWlEI/jb4bAvkL5UDnWOHV
	EICyrpZgapiqmAglyLUI0dLIqD2wbfLL6DpTjWtZaLeFaSb4RZ9rWkVs
X-Gm-Gg: AYBFou0KtmoVEUtt08m5hNQNMdPYYzIJbyNlg2vSgPr2khHuj6VcF2nN0Z716+eLIxF
	o6XmBUeCNrLYG6KP5veAuYbOzahyRiRYUw6bTXGuxTyjbGB3vaeiiCsx647nxiF94YPgcBVlex9
	6m/NmQpxZNKddwXxK+5hZpSEMNSV/cEYNLMUK5We7rWos4qAGGusV51hlzVwIvgwmOb3T+yJKZY
	4MthXNRTRWyqala4J5yznzeOpx7wNEJxy45VoxNTVLhgM0tRqL3f+8thNEE5ogrfbjPYDlpZuNW
	xWKofY36SLpO+tIDZmKaEvQ/UTaVdkq7ZBn2cLa9UaV6yYTWM6yojyOcPKid7YcOZbtrJ2e69Kp
	LYOyP2Z22+UkxTCYU9G/Ku+iADfHv5FLhU5cJgxBmUh7U+83DychndI34/Yr8i26GLeKT+LNsu0
	v6XweazkM2DF+4J5quaVyuZ4BrFq2yMTmB5M9xrdkI0XZQGIAckynxnW8YCX6KrLuMbdSTPr4mN
	LOsGKFtitR6clbFGtmfQvFlqo9AW3p8XqF/RLsgmXH5D2gxmMKG2mhaNdVVStgYyHNgb0Uft8WQ
	+lnY
X-Received: by 2002:a05:6402:210e:b0:6ac:c1dc:fa1d with SMTP id 4fb4d7f45d1cf-6af9de987efmr1696666a12.0.1790939296938;
        Fri, 02 Oct 2026 04:08:16 -0700 (PDT)
Received: from localhost.localdomain (ip-80-113-107-207.ip.prioritytelecom.net. [80.113.107.207])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6af9dabbe89sm846216a12.34.2026.10.02.04.08.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 02 Oct 2026 04:08:16 -0700 (PDT)
From: Jesse Jeronimus <jesse.jeronimus@gmail.com>
To: broonie@kernel.org,
	corbet@lwn.net
Cc: Jesse Jeronimus <jesse.jeronimus@gmail.com>,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	dlechner@baylibre.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-spi@vger.kernel.org,
	linux-doc@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: devres: Remove non-existent SPI register helpers
Date: Fri,  2 Oct 2026 13:06:46 +0200
Message-ID: <20261002110752.89529-1-jesse.jeronimus@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 9b894d65e978 ("Documentation: devres: add missing SPI helpers")
added devm_spi_register_host() and devm_spi_register_target() to the
list of managed interfaces. These functions do not exist and never
existed in the tree. The only managed SPI register helper is
devm_spi_register_controller(), which is already in the list.

Remove the two entries.

Fixes: 9b894d65e978 ("Documentation: devres: add missing SPI helpers")
Signed-off-by: Jesse Jeronimus <jesse.jeronimus@gmail.com>
---
 Documentation/driver-api/driver-model/devres.rst | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index 5067500ded5c..4f0b90e7e138 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -460,8 +460,6 @@ SPI
   devm_spi_alloc_target()
   devm_spi_optimize_message()
   devm_spi_register_controller()
-  devm_spi_register_host()
-  devm_spi_register_target()
 
 WATCHDOG
   devm_watchdog_register_device()
-- 
2.54.0 (Apple Git-157)


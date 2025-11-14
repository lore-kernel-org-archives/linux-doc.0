Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0998D3314DD;
	Fri, 14 Nov 2025 17:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763142807; cv=none; b=O5SkPLGptG0sl3x0pvLslSnd22CDGMLGRNYlz50c+DbiZB/SzJQFJ9ia5WZnu05IvN+Q7Dr/S8YQIzznwWXXBbPaumAc1ZezY0AB/gAqX6TsVi/WpyvCjn9IzqV7ZjKAjWZPY8rj0Vb8WphjUE82vf8JTvL6Jhg1IAPKShykMM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763142807; c=relaxed/simple;
	bh=Fjm/CObGg39EwUfx3cwMRRPVAdb8snHZOm9eJ9ywtgI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RCSeZJKfcw/8pC4BYtn0S5RK5KXZjmQZ5DK0KR2JRlByeyWkPsnJmDCTVYawyPmJAIreNCi9X8Nj0V9PKbrgp87fG5Cf1jqDHuDTQFnFDdQ6MXksrjvbtGoT66Rscl5xZCh/tp3NLQcBqruyBuoCsSD3S4oLBsDoqkvtPXS/UXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=C3t/66/e; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="C3t/66/e"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EC9744E416B7;
	Fri, 14 Nov 2025 17:53:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C19C56060E;
	Fri, 14 Nov 2025 17:53:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 623CA10371988;
	Fri, 14 Nov 2025 18:53:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763142801; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CoXOWd9+qZ+10kokoE6RY8VF1kB5H8QaBseFZ6h2qho=;
	b=C3t/66/eDkHingCUSVR1H2PSdyteVd49Xkpp3Jbfa9M/XkblPkebvq0YICIXzkVGq2wrm1
	7yJLP6iTwYqzKm7hUISJh/TLMYqMO2NjqpLFzJsB79dwrHEJAvYim6poh+lefFcgZ+77Gs
	D4x82IZCdbui7Ir/dqlQoDx6efSpXDRhU7sh/9VpXcNpDgp0soI+xrtpee00pkN5q9DGaF
	fzfkS9qCCc8JLlD7pi+3GEQojeIXOl/BBQ+jxGhsHNCzizyXI+543PWzdWMf5QzscpFPCJ
	geouPb9Dl8W8yfa2aQMFGTiFE6awAC4oP+wIT9gBCDK+iOHEfDmUbzO8zc1bOg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 14 Nov 2025 18:53:02 +0100
Subject: [PATCH 01/19] mtd: spi-nor: debugfs: Fix the flags list
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-1-487bc7129931@bootlin.com>
References: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com>
In-Reply-To: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3

As mentioned above the spi_nor_option_flags enumeration in core.h, this
list should be kept in sync with the one in the core.

Add the missing flag.

Fixes: 6a42bc97ccda ("mtd: spi-nor: core: Allow specifying the byte order in Octal DTR mode")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/debugfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index fa6956144d2e4458ff0e78c5c317a52748b02047..d700e0b271822d034e56903e7b437d89c653f3e7 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -28,6 +28,7 @@ static const char *const snor_f_names[] = {
 	SNOR_F_NAME(RWW),
 	SNOR_F_NAME(ECC),
 	SNOR_F_NAME(NO_WP),
+	SNOR_F_NAME(SWAP16),
 };
 #undef SNOR_F_NAME
 

-- 
2.51.0


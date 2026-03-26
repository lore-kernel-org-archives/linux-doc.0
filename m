Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2623639768C;
	Thu, 26 Mar 2026 18:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774550633; cv=pass; b=gm14BDKpNZA44cx2238L9rpcW3NgM2ca/giDqRNps5eoBnM0uizhXwr5+GPEBsBNW14d/IDeXS2lJbb4n+kZE1U9u9hPTm4SADu8aGBD9PYH5PX1K9negpUID5bPjEOO6i+53cb1MrU9xCMh0OC+4hnivYGG192YC2x+qxEDcJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774550633; c=relaxed/simple;
	bh=RR2GcUEN43vuHv1A9sHltOD1iaa1HJNgGv6c1sehDoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H2sLiNgt8jZnuctZXI/ONXsBARuTWKn+gh1PPDRSNgov8x1qEYozxJJd/u3AtgZTSEW3D/CvBt75TLLqXqBu9r62aux3bnPKs6TpmJfbMM3izbx7QqJhKf1DlyBEkY4h3UECduXtyTzJh8kytrSLP0NwVQQB82c5/XOYvUFGPmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=Tn3hlS/c; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="Tn3hlS/c"
ARC-Seal: i=1; a=rsa-sha256; t=1774550620; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DRbOBWL47rW9hRJ6IMHMdyWSw8nr9ZIPuyTnqr68+9UpIhLyoQDxpK7lTC19jAQ7O0ssPMunN8Fnvw3KP1Ea7HfxQgvZoNLnky4HrGaB5IzVO5uR/YWR49z2IrByd3D7CoshvYyI55MYlUD4UzetHHJhCCWsPETIwX2GfxQGrOc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774550620; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZLUqhhGe+YYh1dDguk8VS5XsuZEKxgHu1fHqDH097Q0=; 
	b=Q23zxpHFRnMhqsvcLZM3/0UJZIPqvl2voDI1PbotfsJwqb5Ex0G9jIHY9xzSJr4aWEDcHmuv6bHGPTPwYJTG5/Nao/GqLz2qV0D7r9v9+Al90JTxwumso+fTAqx5Ok+mTB3t+MPldcfDvQlJfCQe+XILpNNE+foNl2ifYys/LVg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774550620;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ZLUqhhGe+YYh1dDguk8VS5XsuZEKxgHu1fHqDH097Q0=;
	b=Tn3hlS/ct0C724rSDJ/BKJ95n+l+Cb8aimQbasGfoLFN/tGSUDRqHt6b4DAx+s1c
	yXHLReLSWTvUIn2ms0iCrGcMcJSW9wx5H7qXyI9SkyUPXZyuwHF8nMQwIyCWyUXa+DJ
	CSIxlPDWZKYNbWgGipI3u27BMDJXdYe3J4X3xze8=
Received: by mx.zohomail.com with SMTPS id 177455061867182.15320954174285;
	Thu, 26 Mar 2026 11:43:38 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	rdunlap@infradead.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH v4] docs: wrap long C API signatures to prevent page overflow
Date: Thu, 26 Mar 2026 14:43:36 -0400
Message-ID: <20260326184336.39520-1-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260321142559.26005-2-rito@ritovision.com>
References: <20260321142559.26005-2-rito@ritovision.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Some documentation pages contain long C API signatures that exceed
the content width and cause page-wide horizontal scroll overflow.

Override white-space on inner spans from nowrap to pre-wrap, which
preserves existing whitespace but allows line breaks at space
boundaries. overflow-wrap: anywhere is then applied to the signature
element so that long strings wider than the container can still
wrap where needed.

Examples:
  https://docs.kernel.org/6.15/driver-api/regulator.html
  https://docs.kernel.org/6.15/userspace-api/fwctl/fwctl-cxl.html

Signed-off-by: Rito Rhymes <rito@ritovision.com>
Assisted-by: Codex:GPT-5.4
Assisted-by: Claude:Opus-4.6
---
v4: switch to a whitespace-preserving wrapping approach instead of
    contained horizontal scrolling

 Documentation/sphinx-static/custom.css | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index db24f4344..7226be803 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -40,6 +40,12 @@ li { text-indent: 0em; }
 dl.function, dl.struct, dl.enum { margin-top: 2em; background-color: #ecf0f3; }
 /* indent lines 2+ of multi-line function prototypes */
 dl.function dt { margin-left: 10em; text-indent: -10em; }
+/*
+ * Wrap long C API signatures the way an overly long source line would
+ * wrap, keeping the entire signature visible without horizontal scroll.
+ */
+dl.c > dt { overflow-wrap: anywhere; }
+dl.c > dt span.pre { white-space: pre-wrap; }
 dt.sig-object { font-size: larger; }
 div.kernelindent { margin-left: 2em; margin-right: 4em; }
 
-- 
2.51.0


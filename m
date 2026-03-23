Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC643B5308;
	Mon, 23 Mar 2026 15:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774280035; cv=pass; b=lK7WM2MaAC2u78oVw8QNt6/hxZCN2lV3vXkWVy38Xbyqu4hiH06WUNOMjq+y3Vcr9AF6EsfA6XJt9aam6BYXTQx127mAJPm1Hr9MBwIeWvOpg/70/xJrP4B1tWfIdSxa8QCyI2kRvq9xiWB1oBbWu8M7voQZnntakuKZ7iS6E1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774280035; c=relaxed/simple;
	bh=e2acOagzJG/huXRgOXdYd/hrb7GuUII3t4THK+adtD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IkbIbGvAak6IaH6O0bAyrmuSkr1OS9hUxzpR+Bg8nDel3cVcJ4QC6Es9vVYZtWIef++oFgkGYNP62fjNjZZ0UD4B7puh+ttL8vKT8BMhSv92U4kDD0hNzqxIBdfr6wPRwG36zV75KgHVp4HgC8eu+Lk2aekGcS1mH8dk8gU9e+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=ccukB+C0; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="ccukB+C0"
ARC-Seal: i=1; a=rsa-sha256; t=1774280026; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nNsaT/999RL0D2fW/wa9hEF19hst8WEOBIdk5O3FYtYIstgaRisT/Vfof+4fobhSRPVtsUgtSTIlUoHbrrQheIGkP5x2A93XhIhfkyEDRd/3hLCnesrRidWxCF92FL6kKOppTXWNUUGPYdWFGYiEjmPdNPOoj7YDfCXu5M0xm50=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774280026; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NG0s9819ji/Je2v8+H1LAz7+l1W2ps/GmYPxq/4+v7o=; 
	b=YIPnElzNe1DwOmk0Rji2ot7rIBqZZkKsKGpOso8rbF87MWhTtXt+XkYzl+jjkcoqMKwc96KGyWbFzFZh3XeTaw0JAhFzmJ2HdfS5zfqN2GRG96I1sDv32XkSoRS3AsYOmcIpL2rVfr0FSAIVj2yoT/oBz5bWfpaim9adpF0SV0o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774280026;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=NG0s9819ji/Je2v8+H1LAz7+l1W2ps/GmYPxq/4+v7o=;
	b=ccukB+C0NW7cpgnSkb+3S7gn/gSs6BXu8EPbWrhy2tb3I2T26qX0GSuj1xLIGfeP
	61NA9ykJnDTI8uvFkc60Wvtb4+1jmrKSeuIKI/tCH8/qpBn98B29nxYaZLiJ8sQMhyX
	vM0g+JT6b2sX0S0qPh7quxRY2oy9H+xHWY5sSXhQ=
Received: by mx.zohomail.com with SMTPS id 1774280024045642.3474149673956;
	Mon, 23 Mar 2026 08:33:44 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	rdunlap@infradead.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH v3] docs: contain horizontal overflow in C API descriptions
Date: Mon, 23 Mar 2026 11:33:42 -0400
Message-ID: <20260323153342.33447-1-rito@ritovision.com>
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

Some documentation pages contain long C API signatures that can exceed
the content width and cause page-wide horizontal scroll overflow.

Apply contained horizontal scrolling to C API description blocks and
keep their signature rows on one line. This preserves signature
formatting while preventing them from breaking page layout.

Contained horizontal scrolling is preferred over wrapping here because
code fidelity is the priority. These blocks are intended to remain
representative of the code itself. Wrapping distorts spacing and line
structure, which affects fidelity, creates misleading renderings, and
reduces readability.

Examples:
  https://docs.kernel.org/6.15/driver-api/regulator.html
  https://docs.kernel.org/6.15/userspace-api/fwctl/fwctl-cxl.html

Signed-off-by: Rito Rhymes <rito@ritovision.com>
Assisted-by: Codex:GPT-5.4
---
v3: add latest public versioned URL examples to the patchlog

 Documentation/sphinx-static/custom.css | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index db24f4344..18bf8813b 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -40,6 +40,13 @@ li { text-indent: 0em; }
 dl.function, dl.struct, dl.enum { margin-top: 2em; background-color: #ecf0f3; }
 /* indent lines 2+ of multi-line function prototypes */
 dl.function dt { margin-left: 10em; text-indent: -10em; }
+/*
+ * Preserve C API signatures on one line and apply contained horizontal
+ * scrolling to prevent them from exceeding their container width and
+ * breaking page layout.
+ */
+dl.c { overflow-x: auto; overflow-y: hidden; }
+dl.c > dt.sig.sig-object { white-space: nowrap; }
 dt.sig-object { font-size: larger; }
 div.kernelindent { margin-left: 2em; margin-right: 4em; }
 
-- 
2.51.0

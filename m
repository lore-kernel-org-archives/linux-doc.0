Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D33283FE5;
	Mon, 23 Mar 2026 15:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774279490; cv=pass; b=c/P4ZHhozwe8mrzPTtk9QIpB7XLkD/MpPiUNLypsNID+aZIo53PJapPcN1OhNGPyB64ly0Z72IDeGveLpZ68ZVH7562hzMHL3Nq63KzS/BtxIJ25luViADdyH1ggBiUYd27WbyYbUtAAX/d+AL3HSaQymcWX1LUY3SSfQIQyKFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774279490; c=relaxed/simple;
	bh=/aaNUmB6j1KlMaHLCf2ZBCw+qhT7kZak3VlBbufwaRw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LH3lFUV13vtF+0QdDdNNLXLWquLqw9n9Zm9nCCaYeU3ZJ/Ny3tolWFbiSAiYqb1JXXlD6k1AHAc9mf46kIsHC6CdUA9iA2Z6BtQ8n2rHds0Fxa60sWRnKL37v37g3CLIT8xuycu6ki2FJz3Wu22l+PKT7U1EwuUFrap0ubixR3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=MmSIv5vL; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="MmSIv5vL"
ARC-Seal: i=1; a=rsa-sha256; t=1774279474; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=B8TIN2xa/DGNmjVJpeeO8SqDWwdFGsnj5k534Gr2TVG3GwzD7pNHCobwuWsvi1kHHj4USl5Ih61nK8PIca72PWni8k/Nd8KfKm6d9iaKohqW1Lj1PjKAGe/cNVbjz9ndsXyaghYDqLcEuRzrBK57btGCXVozBFf2X3HSViRGhzo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774279474; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4kva+Q2/WqTp9lUr3JHsLiEZyjnVj8naYHRAhkFJ61U=; 
	b=iL9sid5g7RKvgfkvfyVELxpIgq0aEGL9PTbbvI47ZABCCVBdGH1AK4XMmTdf+o4FHpW4m988u6PqPTtK4qCSf0Xnw9DwjqcyE/GoKm3j0vbpq6ppCxH7kWUpgzfEaLrKqMNO+bnoSln+EmAdbwndY8uMvBJppMTjl3zFKfZnMdg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774279474;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=4kva+Q2/WqTp9lUr3JHsLiEZyjnVj8naYHRAhkFJ61U=;
	b=MmSIv5vLNw1h6GlgCzeqzEYzagnPGwyeRKvHNVCFta1UEl+aAu9IvKrSzY3/UQ+h
	soaOKcQSKjHFHBMFGQ6Q1RourTR/orztq5pqvMeRAylsNM9LiR9UTksBfIAkUbpaFTo
	Sbi/1mCCH4dZjNVQcowMnm8tZ9WiCneYj+VrnCIc=
Received: by mx.zohomail.com with SMTPS id 1774279470970372.45836678383864;
	Mon, 23 Mar 2026 08:24:30 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	rdunlap@infradead.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH v3 2/2] docs: allow long table reference links to wrap and prevent overflow
Date: Mon, 23 Mar 2026 11:24:28 -0400
Message-ID: <20260323152428.30483-2-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260323152428.30483-1-rito@ritovision.com>
References: <20260321180841.10166-1-rito@ritovision.com>
 <20260323152428.30483-1-rito@ritovision.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Some documentation pages contain docutils tables with reference links
that use long unbroken strings. Those strings can expand the table
width beyond the content column and cause page-wide horizontal
overflow.

Allow reference links in docutils tables in the main document body to
wrap when needed so the table stays within the content column and does
not break page layout.

Examples:
  https://docs.kernel.org/6.15/arch/openrisc/openrisc_port.html
  https://docs.kernel.org/6.15/filesystems/ext2.html

Signed-off-by: Rito Rhymes <rito@ritovision.com>
Assisted-by: Codex:GPT-5.4
---
v3: add latest public versioned URL examples to the patchlog

 Documentation/sphinx-static/custom.css | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index 4ec617d40..b41c54c71 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -154,6 +154,11 @@ a {
     overflow-wrap: anywhere;
 }
 
+/* Let rendered reference links in tables wrap when needed. */
+div.body table.docutils a.reference {
+    overflow-wrap: anywhere;
+}
+
 /* Make xrefs more universally visible */
 a.reference, a.reference:hover {
     border-bottom: none;
-- 
2.51.0

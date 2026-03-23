Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25031258CD9;
	Mon, 23 Mar 2026 15:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774279483; cv=pass; b=gyG2AaVANJYNI/CNmYujRlZu8Ezlr/JdHYGRT21HkQw7UVSs6G9jUi1eidxdnPJUygUb0aKxqzFuSiEA6oKCWSk4qfnSFy4ktcuLv2T9C6dNI6xuONS516/DvarBMWbYC6N8v0d3i8u3c/Qmm85T+a1XjUI/3HJmv4ClkKpYczI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774279483; c=relaxed/simple;
	bh=uFiHoVfu9qJdRqJCicAG5hiiOOLeUcbT64+PDrRCzTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ctUh9zeuKZB65HCJB8g07unfgRqif4gRV7Aw1rlDqJ8NZ0wDEt03w3VGjI2DuMeaKt2ja21cpmUYBwWq/bCqdYDXzGZ+ToK6lee9sAqhODaZXVVGYkRODM8BboMmGApMgCo+VCYJLWkO5kOw777A/ceZNkO+GXsfzvF/FXTKOuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=Y0lEY72b; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="Y0lEY72b"
ARC-Seal: i=1; a=rsa-sha256; t=1774279472; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=oBkdVH3aruq7HOXqDYUmzlhDdULaN1JxBJSJ/YYffNbc3hC72fwYj9PiIHqgwTiXK2UUSVb8KONwahKwXafKC9v9uTCmx/gbdbPSoVjUR0U/CBWW3QuuobrlXIOXa7L+CUJvsNy59ajVSFSdERM2xdOP/Xu0d039tO7UatVvpEs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774279472; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bKwNC3oYBC87zktx+ult9d2bfUYP6RHypbxps9hFVdE=; 
	b=LgtJ2GxT7OcW2pcZY3UvoPp8qXHh5rl6bQwvw4NSnM8BFdTvxl/b744UmWJuSURR4mG9MwdjdA07Th9K7fsJURKQbHm5pot5J5LbepedHitifnVhSz5FMec0bJ3xduUVBfSCauW9IWQafr2TC0yJCoqlMCzYt7VtaRsOrpZEnIk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774279472;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=bKwNC3oYBC87zktx+ult9d2bfUYP6RHypbxps9hFVdE=;
	b=Y0lEY72bs1TsYrRzoB1F7q40Tk/aCbog+dVMnYgryuUYmgMSMR2Ggz8kauK79UGP
	gmISwR+EjydGRr+kxk6v8dx8mr3gzi6EYN0qxIRb/OBa7LmkD7VwbPy3GKYDjIZwGrT
	tlrln1AXJB34koz7doNucuStq06YTQMVhtXxT4UM=
Received: by mx.zohomail.com with SMTPS id 1774279469832708.1824775079593;
	Mon, 23 Mar 2026 08:24:29 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	rdunlap@infradead.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH v3 1/2] docs: allow long links to wrap per character to prevent page overflow
Date: Mon, 23 Mar 2026 11:24:27 -0400
Message-ID: <20260323152428.30483-1-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260321180841.10166-1-rito@ritovision.com>
References: <20260321180841.10166-1-rito@ritovision.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Some documentation pages contain long link text without natural
break points, which can force page-wide horizontal scroll overflow
on small screens.

Use overflow-wrap: anywhere for anchor text in the docs stylesheet so
links can wrap per character as a fallback when normal word boundaries
are unavailable.

Examples:
  https://docs.kernel.org/6.15/firmware-guide/acpi/non-d0-probe.html
  https://docs.kernel.org/6.15/arch/x86/earlyprintk.html

Signed-off-by: Rito Rhymes <rito@ritovision.com>
Assisted-by: Codex:GPT-5.4
---
v3: add latest public versioned URL examples to the patchlog

 Documentation/sphinx-static/custom.css | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index db24f4344..4ec617d40 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -149,6 +149,11 @@ div.language-selection ul li:hover {
     background: #dddddd;
 }
 
+/* Let long link text wrap instead of forcing overflow. */
+a {
+    overflow-wrap: anywhere;
+}
+
 /* Make xrefs more universally visible */
 a.reference, a.reference:hover {
     border-bottom: none;
-- 
2.51.0

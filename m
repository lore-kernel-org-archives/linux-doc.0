Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB8D1A2C0B;
	Sun, 22 Mar 2026 19:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774207482; cv=pass; b=KFo/VyEpc6XQVLoEsiD/hHjrKbZukRp4ARWSCFWHui5wWTDFLzto+VApWBBk4umRAbp9PN5bghZEQjGcQw4MkQvXz95aWtENS6sCdJFDZQpit0/oOE0ZSkdrUuCNATsQNhYbyimKw9YA20/gCw1eawjmyY0aCzyAygA/1uf53zc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774207482; c=relaxed/simple;
	bh=4HzVYnO3PBIKAJDJOoPAvIbkD/vW1K5TfRzAa24DYAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gNv19PeeH9NPj6vnG4iDIubxljb+O9CWU0rJVIytRYPboeIQNgPfTUh296WV7RXT4dMDphuDISeVn722h0rZyhlbxE19fi1vbRib8IhsQW3jD2kzJX7rg0xffLst2JS0fe6XtSIoS4bayJNomRe5/MzeCKoKdVXdESQlNGHDkpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=Oeg4hZS4; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="Oeg4hZS4"
ARC-Seal: i=1; a=rsa-sha256; t=1774207469; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KDgizWRv77Jv3Rnt95PObVxXQwVXqrnDeoU2dDqiTYvxIhRuAgw95sVO3gEjiwlCrZRbKeZhnsTYtA0QqAKbHBqDzPoH6+LgGnjSOov1ROSJf2TnKIrC6B80OaDQmkuu7o7M6RLdJMzUe5Tgoja9ebPRMtMmxB7gd9IFvqn27CU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774207469; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CmMQir9cbcPYWE0pYmHsKDZ07DZ9tjDS9tROzmlqT/8=; 
	b=IpUmH+NElNVFDCHI0pXqraVSb4z7R11DysTnKU5iuKT5r0kC/0M/Dfd9FOZQ8/18+nSzuxfmitBvo/lZEbNZpkGLEjJQmg6SB9IxKwdaHt6rSBv0MYyHVKk86pQ1YlxLmhvotzR2WwAONlSr/MchPBUnKTC2ENBZXxiQbV6rPs4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774207469;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=CmMQir9cbcPYWE0pYmHsKDZ07DZ9tjDS9tROzmlqT/8=;
	b=Oeg4hZS4pQfINPzB2bT/bxtd6I5EvwZILR9l501kZYL23bFaBD/nLPHPcUq0SnO/
	1aCyV0Wk6DVhM+5zMElOofDNQEmVNmVIeakjYEzC5pvs/gfMi8nVctF15u15X5XSOQ0
	Zrf09a/7KypVsAzFsVT2d7FrJ+sJP0Cfll9yjKCY=
Received: by mx.zohomail.com with SMTPS id 177420746792350.11675162887332;
	Sun, 22 Mar 2026 12:24:27 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	rdunlap@infradead.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH v2 0/1] docs: examples of pages affected by table overflow
Date: Sun, 22 Mar 2026 15:24:25 -0400
Message-ID: <20260322192426.65357-1-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260321133811.17854-1-rito@ritovision.com>
References: <20260321133811.17854-1-rito@ritovision.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Examples of affected pages this patch improves:
  kernel-hacking/locking.html
  arch/arc/features.html
  arch/arm/memory.html
  arch/arm/omap/dss.html
  arch/mips/features.html
  arch/nios2/features.html
  arch/openrisc/features.html
  arch/parisc/features.html
  arch/powerpc/features.html
  arch/riscv/features.html
  arch/s390/features.html
  arch/sparc/features.html
  arch/x86/boot.html
  arch/x86/zero-page.html
  arch/x86/pat.html
  arch/x86/amd-hfi.html
  arch/x86/tsx_async_abort.html
  arch/x86/features.html
  driver-api/parport-lowlevel.html

Rito Rhymes (1):
  docs: wrap generated tables to contain small-screen overflow

 Documentation/conf.py                  |  1 +
 Documentation/sphinx-static/custom.css | 16 ++++++++++++++
 Documentation/sphinx/table_wrapper.py  | 30 ++++++++++++++++++++++++++
 3 files changed, 47 insertions(+)
 create mode 100644 Documentation/sphinx/table_wrapper.py

-- 
2.51.0

Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBECB3451D5;
	Sat, 21 Mar 2026 18:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774116544; cv=pass; b=M4lAJBWr6I/TMCwcSVgkdFnBNF6c1VQvl00LVW8MPDNyN3nOIfU0AG6vNeMkzD+0TrmKcL/kujnmnMmjD8agegD9JeZ1u6/EP4F4CTcjEYpz4gWrOTk0tBct2STmf1U5H4NBbXY7WIwiZSIVLc+TYXClsjy7dGx0L3mXSbxmvoM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774116544; c=relaxed/simple;
	bh=pqcQU3Z0LDgDHjPbtOxWoqubobNX3Lmczl58cGq7GoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WzSp8kEorfuDyuPmUoE2jHXmUyDm0DXrqfyH0dxoBSnuMHwU9SoKqD1FcqK1kCPN+jmqme7O/t8tTTmIACEBmJk7DQCWRNDCqiOcglM9zDAaBvaY3e2GOf80fTVO5w8Gmn/glWVOyZfQ2pomAM5wBMM3GoFjVnyqvTXJAD2vt+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=Zi4EZJl0; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="Zi4EZJl0"
ARC-Seal: i=1; a=rsa-sha256; t=1774116534; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jwnzv/2ADRyzJux9WDy/P0Z8kE0m3frQ+bq80Djo0dfTVMfPy06aE7jEzod+YbxhLcfhsRicHBM0jVDV9rdEGgIjZ5SdOQnWdjLjisJif2Scj7onrwRFsG5vLvBduxBw+ADgCpJ3LSyWXvRLxhb1MvEY4kFLvvB6zHTcbenvfYg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774116534; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5heVV8qCOOLs4grrFI8yGFkjqk3/DD0jphemGdQy9SY=; 
	b=klGoU7CESn1sHWtXRHEQpbFga9ayc8KXlA0KELCYGm0CNbRQc1JTrIZE2Yc0+Uks/e5LTG/ynX2ynPYYjAwOn5aHhiZERSmlmRL5dk78PfXdRFs7Z6LGkfILqfGntoEARBIlkgewI7Yrg1Eyxgu2yKa9wIZs0HJh/xYfbQlP97Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774116534;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=5heVV8qCOOLs4grrFI8yGFkjqk3/DD0jphemGdQy9SY=;
	b=Zi4EZJl07OrPuaiIWKaOZPHx+FPK2qFbaQGUW72NltMeLDfsPUxhFR5Nzm23P7/3
	WvDi8U2vFb75eackLkhwZTypP+ezXiaEAnLA/SfoDwDqzpwZ/2HQO8/ZkzYKeWlFQtD
	T0fSLd3DhiMIw61BQIGOuKDEG1ro1UqOs7GJVjoA=
Received: by mx.zohomail.com with SMTPS id 1774116532002486.67460290233737;
	Sat, 21 Mar 2026 11:08:52 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH 2/2] docs: allow long table reference links to wrap and prevent overflow
Date: Sat, 21 Mar 2026 14:08:41 -0400
Message-ID: <20260321180841.10166-3-rito@ritovision.com>
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

Some documentation pages contain docutils tables with reference links
that use long unbroken strings. Those strings can expand the table
width beyond the content column and cause page-wide horizontal
overflow.

Allow reference links in docutils tables in the main document body to
wrap when needed so the table stays within the content column and does
not break page layout.

Signed-off-by: Rito Rhymes <rito@ritovision.com>
---
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


Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D3A346AD3;
	Sat, 21 Mar 2026 18:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774116539; cv=pass; b=ayc2HCmP1OpDdas4wMqhhK2S32LGGLEcHeXHozQQHGqbMcjXKhMfIKmkJg/JMw9R8o5/yimIVWSvidM+VLh5RS1AClLj0SDqONF2LHIl3375HtlJc5vGClskSAj3vPccbRSCFn7NcqABr8fbpQWFlIfuh7f3bWO9a7I6rp0QUe4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774116539; c=relaxed/simple;
	bh=sIqaMekc6r7NUfS5qCBhVfQGb4XY4FVTFCTbU45DSrA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uxgykLLL2WpjeehzYDYhD8V6ykKzgiAjdPbpI8UwiZXsIdnG0Uud39GJZgbaEUaZAFRBhCHAADRBlzVfZe1vU6Pal+mvZz+hsXqpVyrFF+q1ZcqPb8ritgglFPrgUOkFbLCyEyu71a5TZkLMoCsuve20bex2KI6s7h+fNhQrowg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=QKZKtXrZ; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="QKZKtXrZ"
ARC-Seal: i=1; a=rsa-sha256; t=1774116530; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=a7f6kEtZM7La4XwU++gX6wPVREKVzjCrNxYgV3+LM+YngSSmlJaVAydci36mnIO/+VTkroFgot9pIQwV5Ktas2z6lCe+8/2R9fBMLishd+m9zWrYp1wD6D5BKvkt06Ez6hjNP5F+zrcdiYT4O9BSveyD0nJttXdp4pPqDWAztNw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774116530; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Hap2IPk1YHq1ppqIwqRZya+cDARfXmqBlTXQhgn/gcQ=; 
	b=HVF8UZf+sknt+h5d88pYma30Lo5WyQFaPfbAJLe/N7dYJX46tDJgw0OS0Kbz3qjBM8/IvrA18B98tQNN8JLecBr3bdAXs/o7XvJcEhgZiJqm6/f9YbAbh7Hk7phpcmpIsY4FNkEuQipG3e0shOto4O6Vmksm5yp4qzYmc+98q4w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774116530;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Hap2IPk1YHq1ppqIwqRZya+cDARfXmqBlTXQhgn/gcQ=;
	b=QKZKtXrZK6i3DWkIhPwJe1Vd+Fru0PgvjqqeFgv2DlnQ6af9BH2QHA7ihuBB9d7F
	Y3zoSSoeHAVgEEboaXIftf9g6JEejx2CWqsKqUF/KnD8uRsiKrABfvNmY/L9n5nBRZ8
	lo7GsXEAMNA7uC63cE3c7XLU5AXrx1J1GEPoJ7N8=
Received: by mx.zohomail.com with SMTPS id 1774116529343983.7294362420389;
	Sat, 21 Mar 2026 11:08:49 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH 1/2] docs: allow long links to wrap per character to prevent page overflow
Date: Sat, 21 Mar 2026 14:08:40 -0400
Message-ID: <20260321180841.10166-2-rito@ritovision.com>
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

Signed-off-by: Rito Rhymes <rito@ritovision.com>
---
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


Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE99138C407;
	Sat, 21 Mar 2026 14:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774103174; cv=pass; b=QrBNq5sBN59DZFvjQm4S7Zdq3y16JijWxh7Leo7ry+dVAS1jzsMKJOpUGnct4o8thuznj/8VB6ldMSHOPm0jLi1LbkgBYhLQxMBePHwyVP+Zo931lMKOZsd9h6HBba4KIKBemGSSt2GlvBeBGExxwkbj6gztgiJdqLronerPoWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774103174; c=relaxed/simple;
	bh=iW07s8Cb5HpdF/gV8OvkFEg0EBqgh1Xy9HI2Wk4CMSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KXqscjaOrQ/4jVWskmxGcy+cGZovCMblQw6lQmaQApJYPhvcSFEmJbIQ4g6saZE0udXVQKt6NSBEBNORFV6rnRqgqqPFPDP1GQ74jiIvt+CJoO44leqMp9VI01jYpMLwKWdqLaiU+wwhw1KVQe1WJdV5ktH8x4xi3heCeYBpZc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=eDla72Po; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="eDla72Po"
ARC-Seal: i=1; a=rsa-sha256; t=1774103168; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TE0Gwbk2dsImEZL3gwslZTvJhqn31HGhywtQjE6+AVKHiuWi64oDONUpSD/7yk/Z1VT4vT1w1ktt8sVDYChhxpfbhjiGZbiZdqrfgttxrgXfuB/DPqzP5WgVu7eB+Ka6SY+chQkSkC2ZuZF9pxWAAPnHyjYsSbcUA9Q0yoI6jJ0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774103168; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Km63Pu9fDiRBpxZ0MBxTRnS6H1C//8k2b/XHy7iBfHo=; 
	b=XH324Ak8sVn1Yx7R8Kn5fO9JEaKdqlvMG0IGTNWDIMCi9gB3EQHwhuBBPiNuv9Fc+VeEyxeQzEVtLoCudEflgVwSXSSjkFiyTXA2e7XGzOyriVHs3QV7wGqnUL2hXasTKOBYJvevhpwoH1AvRxWkwXbiXYDDqizeckk0SxmeNg4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774103168;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Km63Pu9fDiRBpxZ0MBxTRnS6H1C//8k2b/XHy7iBfHo=;
	b=eDla72PoDAtwmnzzEnBdELKwPHPJAyp3eOhUHK4ze4D4wCM0iXLO/Xa29fvyQ4Q3
	3odgnB4I1qmJSsPvog8YeYysnUos17aI5WJE8BnYcfTc4SIOQuehxudy6m5TIFWktQD
	tIQM6ejZRqH99TkJ1LoIauoLI4CbAgpZNLdrCmmY=
Received: by mx.zohomail.com with SMTPS id 1774103165922762.223275275531;
	Sat, 21 Mar 2026 07:26:05 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH 1/1] docs: contain horizontal overflow in C API descriptions
Date: Sat, 21 Mar 2026 10:25:59 -0400
Message-ID: <20260321142559.26005-2-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260321142559.26005-1-rito@ritovision.com>
References: <20260321142559.26005-1-rito@ritovision.com>
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

Signed-off-by: Rito Rhymes <rito@ritovision.com>
---
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


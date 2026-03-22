Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDEEC14A;
	Sun, 22 Mar 2026 19:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774208278; cv=pass; b=oUQ0as1dneSR3cI9sRUEa0cIv9SdMIu6/8uqS1lu6QfzWiiHXyk6t5fSE2PpMvxAEXdVd6JhdTfTsaCRms6u92QaN8U3BTQgNKlu1GGL5922jgEvUhXML+ZPrp0Kg7aVN98Wui5sWq2GsoMerNmvSUuE5KJ8QihOSWtJORRa65Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774208278; c=relaxed/simple;
	bh=hHX0cVIYZJ7s64+Wz6qTSIAHgvIhdHRvZOIrSo2R9gw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aIvg/CWwtSjtBBcSnxV2UeArNCQ5acO/ZBesk+YZ6v9chhhyMt26e6uZOWKwkl/iBOMMtE/9lkOkSOJtS/r1txooL2tzCVpbyrs3tjQLLxyKf+5amFdLXpVyzHz4ZfzjOuTXq6NraYCr2lrmrMLs/06afDor/JPCoeK4Sq20I80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=VZJiuMq9; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="VZJiuMq9"
ARC-Seal: i=1; a=rsa-sha256; t=1774208265; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=f3rXdVfgmRqXQF65cxVLrngdbyCC7cgvZV+LTneCABADwR1Qa8P29t70edmE3wBhH4Tt1tdOO9YC2fFRxjsQoBem3W2AEQyOyLaD70SZsAavnmgh7YeUuHgO0tpqPNFCGKoJwSe/piyLTFXJ2bWGnaUYv/WqMePmFPnyCD9ZAg4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774208265; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=GTmSNBVwDvqMQbRQoqcy7Bt1fETHhl0+6t80Snc6ZqQ=; 
	b=XGoY8LPPjT415F6jkCCcL+JfEMrb5mMdw/Y+L3tAHoypcSBWuoFEY9aKVeLzjr84uSQT/9oiLOAzK9QMYG/Rzz2gDzatx7F0jPu/3oVYv+dDV+imT+S9hTqSXvt/ezC2i41y8RpSIMiPHjsMV18BEDAc0pN0CkJpHcWmcqrO9rQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774208265;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=GTmSNBVwDvqMQbRQoqcy7Bt1fETHhl0+6t80Snc6ZqQ=;
	b=VZJiuMq9WHIF11K6AiXQlAESkymzzcfE4hXUWo/zXY7tXTaBpjQx2gVtJwVNHFJ/
	Om0Iqr3Idn+sYo4UglS1H9VEqTKSz4RNEY8pTwEYBtncqmDOVuXIAjA/PgaHJ+IRDp2
	npwwWXGvLgxAxuFpi/iEXGUqhUncqTiCTQxvscMs=
Received: by mx.zohomail.com with SMTPS id 1774208262642838.5889177461142;
	Sun, 22 Mar 2026 12:37:42 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	rdunlap@infradead.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH v2 1/1] docs: contain horizontal overflow in C API descriptions
Date: Sun, 22 Mar 2026 15:37:39 -0400
Message-ID: <20260322193740.68784-2-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260322193740.68784-1-rito@ritovision.com>
References: <20260321142559.26005-2-rito@ritovision.com>
 <20260322193740.68784-1-rito@ritovision.com>
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

Signed-off-by: Rito Rhymes <rito@ritovision.com>
Assisted-by: Codex:GPT-5.4
---
v2: add Assisted-by attribution and clarify scrolling trade-offs

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

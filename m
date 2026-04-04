Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831E820D4FF;
	Sat,  4 Apr 2026 07:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775288072; cv=pass; b=nhJz2jnYP3sab2SLfa25asVSUnMRICxpmzBh+2SHcBrRHrscLzqRUcm8CQjA4wdMAbW1jNghcaitNiKuHX1jjSzx9IIqBX9XWOwaBkwQ1A0khIPAKaU2WPn9Y8ylEQWArYD7jz7fjJwuYIzQxEfrjDqPhbyEQ128Tl3z8d0soTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775288072; c=relaxed/simple;
	bh=6fXJhMXChtqFiY+kjdfvXvGb9Tj/Pplq5o9CtgGoMYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KIKo6ppJsVoaEKUtBi5XWWlU5QZZ2qg9tpWGxKculDY6nnNmPaBbf9M4BA53hDBmoNiWTViAIUSEv56HZV5ZVLNcQKyvpmBuAyCNMJl9sZAb1+i/bnDoBB33amsc3q4JrY12gl5QQ06/vy4Pha471oyWOnmPaP0/Zof91V55aA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=f1aPS7fI; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="f1aPS7fI"
ARC-Seal: i=1; a=rsa-sha256; t=1775288067; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eEbS1HIrG/QxA/RR9FbSx/dZYoBD/dYsSel+LRps+obp7L4oSbFmi2vPfSuTLS4+t/cOS/hxBYzH02AS3TnxO1JHxYjvNCTz2AKiHjWO1FL2Xa2Vj4OfRXG7gCGeeB7O4bs+gNoZo360XGXp/4Pym+D6KlxNnV2tqI09QFrAzms=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775288067; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=w2ACCRYUsG7dlCwh6bJ0+UEkGjVLhh5FArNqQeZ554w=; 
	b=KsIZxPTqg2N+cC7C/015J9bSZkBze0Q8PWMcQw/L58VSBJ6PSJd25GydHIVdvOOuOG38PInunPQO+/hm6lPiUfk00QpkvtQ7RGvxPn58eNtQrDr6DxCBHLBN1VDgVu3nrspw7DKnM5pA0mWN5RFTiHEjP+PGs4CZc/eIYjRf0Yg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775288067;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=w2ACCRYUsG7dlCwh6bJ0+UEkGjVLhh5FArNqQeZ554w=;
	b=f1aPS7fIzIdwhDoNtKpeXLlP6SQr8NZ0R2uOoCkE1X0IB5ftzwdxzTQ1KVJX5TkE
	3ytJLBkOrM59bxIOZMNBigsMZ9YYycYGH9b3UOVjnTZNzDnNJ4tNdpfCHz4iYu6OjkA
	Bn9j5InBVF9Vy3Ie49bp6S5O8tI/LVgWS/XiFpeA=
Received: by mx.zohomail.com with SMTPS id 1775288057067799.7991980403839;
	Sat, 4 Apr 2026 00:34:17 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH v3 0/2] docs: advanced search with benchmark harness
Date: Sat,  4 Apr 2026 03:34:11 -0400
Message-ID: <20260404073413.32309-1-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260321181511.11706-1-rito@ritovision.com>
References: <20260321181511.11706-1-rito@ritovision.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This series adds an Advanced Search interface for kernel
documentation.

This is being proposed here rather than upstream Sphinx because the
current implementation is tailored to the kernel documentation set and
its navigation needs, and is integrated through kernel-local template
and static-asset overrides rather than a generalized Sphinx extension
interface.

Parts of the approach could potentially be abstracted further in the
future, but this series is focused on solving the problem concretely for
kernel documentation first rather than proposing a general-purpose
Sphinx search redesign.

The first patch adds the feature itself: an advanced search page built
on the existing Sphinx search data, with tabbed results for Symbols,
Sections, Index entries, and Pages, richer filtering, more targeted
identifier search, and bounded Pages summary loading with compatibility
handling across supported Sphinx versions.

The second patch adds optional developer-side benchmark tooling and
passive timing instrumentation used to validate runtime behavior and
compare advanced search with stock Quick Search.

Jon previously noted that the window for larger merges has passed, so
this is not intended as a request to take a large feature late in the
current cycle. The immediate goal is to close the loop on the debugging
and compatibility work around the earlier version, so the current
implementation is available for testing and review ahead of future
merge windows.

This version should address the compatibility issue Randy had reported
with the earlier implementation. If Randy has time to try this updated
version with the setup that exposed the earlier problem, I would
appreciate confirmation that it now behaves correctly there.

Rito Rhymes (2):
  docs: add advanced search for kernel documentation
  docs: add advanced search benchmark harness and instrumentation

 Documentation/doc-guide/sphinx.rst            |  100 ++
 Documentation/sphinx-static/custom.css        |  288 ++++
 Documentation/sphinx-static/kernel-search.js  | 1264 ++++++++++++++++
 Documentation/sphinx/templates/search.html    |  117 ++
 Documentation/sphinx/templates/searchbox.html |   30 +
 MAINTAINERS                                   |   11 +
 tools/docs/bench_search_playwright.mjs        | 1278 +++++++++++++++++
 tools/docs/test_advanced_search.py            |  312 ++++
 8 files changed, 3400 insertions(+)
 create mode 100644 Documentation/sphinx-static/kernel-search.js
 create mode 100644 Documentation/sphinx/templates/search.html
 create mode 100644 Documentation/sphinx/templates/searchbox.html
 create mode 100755 tools/docs/bench_search_playwright.mjs
 create mode 100755 tools/docs/test_advanced_search.py

-- 
2.51.0

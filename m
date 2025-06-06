Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EA928E8
	for <linux-doc@vger.kernel.org>; Fri,  6 Jun 2025 14:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749219353; cv=none; b=lJ9eFDiDssOphtqF8bCt6k9/bFfJRhcCNKVzt6ghMUupUdSfcabb7IqykJg24jA3sAvDD5A7JUnQEqa+e4Fr+nEt/qKTVlXu4GziGlOZhZsCa+jJX7T5KRlnBQ/u4Fh3FntanR6iMPfEaFtSlnLTXF63qegw8c/Va79J0stt5ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749219353; c=relaxed/simple;
	bh=PVO6e+bWMWGKBl1EMG1CZUaQ829HZgUGOM2BfyWQk9k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OBTQJt8IQ6wxTWwl8xm6D69BEIMjXKkFaXEdvmsXWkI/9580C68fVQ4qzw+Q3lzik23RIwembNjevg7qp7YvRwu9zdMti9f+KoJIvVv1Z98z2MEQwyA+pC2RAbEUZQSLeZ3Usqmi4NUlekNU4aaP68KyT/8MfDm46kUGk1IsNH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=mmvkiuwp; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mmvkiuwp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=5uHuqoi7rRXwJ1UxTO0Y2U5ptmTnfnNoIicnRjX/oKg=; b=mmvkiuwpI7G9LS3Ht4HnRkwYkP
	4EjtUP9gzOpCcCespRNRFEYZxWlaxpUGVhZyfU5EoaYEwX+ZygQLaVrsfN09lhtK2IsNflKsJfXNn
	JTz9KZUlsiIJ+eEATuDfFAWaytvozYRJhkwHxZKqDz3udfS30lSh4t+PCjj7nHOlu5RC3ADIQhuCL
	0ioiMIuwfA3ANz3/b7pmu6vyws5oqgn1oSzAuxLc5yotbOEb8P95Zi4mbSlO2ZziBwb0k3dUsECMZ
	PpDiKW4SFWqfIYpR1ikn7qdzfh5CWZVpzu/1A6/7UeqBBNDa3jDUFxWoip5wyn8iOZfvEEdIkBcFL
	DPEBTdag==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNXrF-00000005OTe-1DUO;
	Fri, 06 Jun 2025 14:15:45 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-doc@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] kernel-doc: Fix symbol matching for dropped suffixes
Date: Fri,  6 Jun 2025 15:15:42 +0100
Message-ID: <20250606141543.1285671-1-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The support for dropping "_noprof" missed dropping the suffix from
exported symbols.  That meant that using the :export: feature would
look for kernel-doc for (eg) krealloc_noprof() and not find the
kernel-doc for krealloc().

Fixes: 51a7bf0238c2 (scripts/kernel-doc: drop "_noprof" on function prototypes)
Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 scripts/lib/kdoc/kdoc_parser.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index 062453eefc7a..2c6143f7ca0f 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -1171,16 +1171,24 @@ class KernelDoc:
         with a staticmethod decorator.
         """
 
+        # We support documenting some exported symbols with different
+        # names.  A horrible hack.
+        suffixes = [ '_noprof' ]
+
         # Note: it accepts only one EXPORT_SYMBOL* per line, as having
         # multiple export lines would violate Kernel coding style.
 
         if export_symbol.search(line):
             symbol = export_symbol.group(2)
+            for suffix in suffixes:
+                symbol = symbol.removesuffix(suffix)
             function_set.add(symbol)
             return
 
         if export_symbol_ns.search(line):
             symbol = export_symbol_ns.group(2)
+            for suffix in suffixes:
+                symbol = symbol.removesuffix(suffix)
             function_set.add(symbol)
 
     def process_normal(self, ln, line):
-- 
2.47.2


Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1814F286D73
	for <linux-doc@vger.kernel.org>; Thu, 25 Sep 2025 09:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758793527; cv=none; b=PZSqoXwOSBu4BT6Ld1K8TGGYO2g4uf8V3KdZ0lNgFjlerEwsP8iwEpYHWCyO9Tohbaw2O3zybqtDvarnXij84oZwTzaGafN9Fzy1EI/fpbi2iw2kh92z9U85lqOpQUKwNcIRiQXFnwVSsD4tEY3DMlw4IOGBVqupF0qnkETowFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758793527; c=relaxed/simple;
	bh=0UPkTJzu+xpPSoLvtfA66Lp8HS0jDIUoDPpfDWw96Nc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cJgwfFSoD8ZJWlgGq/HnUvyXjTsxbZHoelJq1qZK5HGOZDsXWSA6NGDAjG/z+jFAbo1UkhgYqgj8z+Y+vmwPHsRkjLY8O9uY7UWbqXJAFGUytJy2G0r1iR5AgaXrb04iXP0dXA52R1c7j29nBJ5zxkZU707XMJ+410Df67J7pko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eu6DNhgE; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eu6DNhgE"
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-b07883a5feeso165038066b.1
        for <linux-doc@vger.kernel.org>; Thu, 25 Sep 2025 02:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758793523; x=1759398323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qfQ3xpZOFcBsKrmvFU2XnI63cQlgGSOJ/cthMQKwOjU=;
        b=eu6DNhgE8ynJ56uSY0ax/zc0ZN7g8qlVOthfSMLkEti52G6W1RWc6KyKnwpUffb+SF
         Uy2LKuKPZeF/c/w/FOh3+qVOLtpM4oA1fgFAg+Q3WzJ2sJ+BXzyT/f0XQrmyorPT8WJ+
         HTXFoAjQls7GZka4KspiwVRwvYtfSsGWI57Y4rdCJNextxYfH5AibqQPPkbC+4pyY1Qi
         IM34rduo8oWLz5wzpU7t1by4U8Cpk0TWmkrcIRLlXIAEes8P0ybm0gKiZpOuHBLgjAXn
         KnZdfEKRhqlrzo28JsQI3jWP0Sxmt0Zve+1XZ+cDAlAh8nhw4TBykqwCOtDm4wJxTas1
         pLGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758793523; x=1759398323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qfQ3xpZOFcBsKrmvFU2XnI63cQlgGSOJ/cthMQKwOjU=;
        b=sBLNebiBM6yek0wxkuVKtLWkNM/UzCAGbB8L4Z1Oh7WIy+XYUY4gQzXP9pGEAWOfaH
         0M4X9JIiSBRR9OJnucwhUydeOxwTXJoQuamXPYDB7lXUVE8xy8xR1Mk+hyeV5qfAAcw5
         jDp7Klyk5s9BSXhjZGxDY5bQj3x7+m7Q0FzPDTXBqdDXvRS7qJMX0ZOUBH9uFBjis+cv
         woonsoatA0+nr4KjED8oPiKumfd53M7LkDPB2YD6nC8fV8JlfAgUNds7d7Mecmwx0/pC
         garEg+5li2iismGnn3j484wGKRotXawXdX4tlZvaCNVGyRGELwqDB39aUHJDOApuSxKu
         XNVg==
X-Gm-Message-State: AOJu0Ywn4xEFQTfLXlkfUh9wJMXEbR5EHqX0a0+4ATSGPpkd9uQFD1AN
	Jj5p0nJHyg7GEfVssUIpeWBI/uYmH+d0d8KHx6/HGFTGbFU3MRRT4YksLn/T62LT1OcN8uUnKCN
	HxSJCy2Cw7w==
X-Gm-Gg: ASbGnctO7efyhuVCtiwTFPRwOHSe+/6a+rqhPm5xt9j5cA03w6M5/Brc2z7NHKqTr6W
	HZMly0A05+AFh9K+bzbLFMIMVpHtV3hwAx0ltP2vkF0iRt9FxZV4k9oB6nMydBILVNEQrpP/uWD
	RN8CWCw6OnsfV12mK1kVAUxPwl8GWhl4VsODAlG/ELzjM1Mx3qLkHsJqkTnLTDLOfiwuOnHUqun
	zDh3i4IsQYAgtyY/+WWTrobV30RVWBjVlr1qs1v5tPv8jIkJbjyStZr676iFscrzCO+xmy7WPEo
	Rm3AjlHfQyC4lNqHvKs3WH+Swox5EaS/9cSpL13LspL463VcBWpCp7lZNMDWIt8i2ETNaspAfxs
	Dy5g/wacD8GsE36RUvKuX6Krjog==
X-Google-Smtp-Source: AGHT+IFgG9PTeLMxm+LlBPXd8oXWWMhKhlIHbEafRrBxDZ9w/ENCeHWx/ya1Hg/iBwAst6L+EmkZWA==
X-Received: by 2002:a17:907:944e:b0:b04:b435:fc6b with SMTP id a640c23a62f3a-b34bbebea0cmr291265466b.60.1758793522929;
        Thu, 25 Sep 2025 02:45:22 -0700 (PDT)
Received: from hex.suse.cz ([47.63.113.151])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3b052d4sm906469a12.48.2025.09.25.02.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 02:45:22 -0700 (PDT)
From: Daniel Garcia Moreno <daniel.garcia@suse.com>
To: linux-doc@vger.kernel.org
Cc: Daniel Garcia Moreno <daniel.garcia@suse.com>
Subject: [PATCH] docs: extensions: don't use deprecated ErrorString, SafeString
Date: Thu, 25 Sep 2025 11:45:08 +0200
Message-ID: <20250925094508.43174-1-daniel.garcia@suse.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch replaces the usage of deprecated docutils ErrorString and
SafeString.

docutils.utils.error_reporting module was removed in the lastest release
0.22. In the previous release the usage of ErrorString and SafeString
was deprecated and the recomendation is to replace the usage with:

   Replacements:
     | SafeString  -> str
     | ErrorString -> docutils.io.error_string()
     | ErrorOutput -> docutils.io.ErrorOutput

https://sourceforge.net/p/docutils/code/HEAD/tree/tags/docutils-0.21.2/docutils/utils/error_reporting.py

Signed-off-by: Daniel Garcia Moreno <daniel.garcia@suse.com>
---
 Documentation/sphinx/kernel_feat.py         | 1 -
 Documentation/sphinx/kernel_include.py      | 8 ++++----
 Documentation/sphinx/maintainers_include.py | 4 ++--
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/Documentation/sphinx/kernel_feat.py b/Documentation/sphinx/kernel_feat.py
index e3a51867f27b..82600e045fe6 100644
--- a/Documentation/sphinx/kernel_feat.py
+++ b/Documentation/sphinx/kernel_feat.py
@@ -40,7 +40,6 @@ import sys
 from docutils import nodes, statemachine
 from docutils.statemachine import ViewList
 from docutils.parsers.rst import directives, Directive
-from docutils.utils.error_reporting import ErrorString
 from sphinx.util.docutils import switch_source_input
 
 __version__  = '1.0'
diff --git a/Documentation/sphinx/kernel_include.py b/Documentation/sphinx/kernel_include.py
index 1e566e87ebcd..42945b1779eb 100755
--- a/Documentation/sphinx/kernel_include.py
+++ b/Documentation/sphinx/kernel_include.py
@@ -35,7 +35,7 @@
 import os.path
 
 from docutils import io, nodes, statemachine
-from docutils.utils.error_reporting import SafeString, ErrorString
+from docutils.io import error_string
 from docutils.parsers.rst import directives
 from docutils.parsers.rst.directives.body import CodeBlock, NumberLines
 from docutils.parsers.rst.directives.misc import Include
@@ -112,10 +112,10 @@ class KernelInclude(Include):
             raise self.severe('Problems with "%s" directive path:\n'
                               'Cannot encode input file path "%s" '
                               '(wrong locale?).' %
-                              (self.name, SafeString(path)))
+                              (self.name, str(path)))
         except IOError as error:
             raise self.severe('Problems with "%s" directive path:\n%s.' %
-                      (self.name, ErrorString(error)))
+                      (self.name, error_string(error)))
         startline = self.options.get('start-line', None)
         endline = self.options.get('end-line', None)
         try:
@@ -126,7 +126,7 @@ class KernelInclude(Include):
                 rawtext = include_file.read()
         except UnicodeError as error:
             raise self.severe('Problem with "%s" directive:\n%s' %
-                              (self.name, ErrorString(error)))
+                              (self.name, error_string(error)))
         # start-after/end-before: no restrictions on newlines in match-text,
         # and no restrictions on matching inside lines vs. line boundaries
         after_text = self.options.get('start-after', None)
diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index d31cff867436..9414bdf7bfc0 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -22,7 +22,7 @@ import re
 import os.path
 
 from docutils import statemachine
-from docutils.utils.error_reporting import ErrorString
+from docutils.io import error_string
 from docutils.parsers.rst import Directive
 from docutils.parsers.rst.directives.misc import Include
 
@@ -190,6 +190,6 @@ class MaintainersInclude(Include):
             lines = self.parse_maintainers(path)
         except IOError as error:
             raise self.severe('Problems with "%s" directive path:\n%s.' %
-                      (self.name, ErrorString(error)))
+                      (self.name, error_string(error)))
 
         return []
-- 
2.51.0


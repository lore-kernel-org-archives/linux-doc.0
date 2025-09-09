Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4D0238D3A
	for <linux-doc@vger.kernel.org>; Tue,  9 Sep 2025 19:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757446547; cv=none; b=BAVZrslW4pVVD8U80x1cLo1+t1Pq8GAIy5BLfArylfcPbJvHvk5S9OQDoKvm22BpgAQu2PvD/HWRhURt/dbw0bVbMIcu/PJWN6LQt5JicLf41Ln/MAZYPEs8DogtrnH52E8Ll5gsLVfBauCQqvqCieJI4Vdgcjy5s6Q5Y7jt3KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757446547; c=relaxed/simple;
	bh=4I8OyzGZ47LZ5w6vPCFKVEkUqm3JCXyF75uvlNmmHJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ttVdUu+9C92pf5V2hGJqWPNPCQ/Ul7GiKqO/7/hW+h4OtypUtb//u2NhBaYC+NDB0UzWbcYkOd5+2nWaxTil7VqSh6rVtwHKXZjpOeI1NRrL6DamWW5rp3fKqR7YjcOSj/G6S9mo6MSQ6WXQbiO1c/604X7B2i7i+kR82d0rGW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=F5ahCdGN; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="F5ahCdGN"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CC52340AF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1757446539; bh=1yGodqynLUTpEJRi4jTKUDvMqA6YYM9tbPKfeKRY6Ww=;
	h=From:To:Cc:Subject:Date:From;
	b=F5ahCdGN8Xr6BVUNSywyTDGzDd6e4OHR182aRwT77xZt6nMQrek33QAh7bCOVNTyp
	 +shFuGaR10fAIe0bsfMdvPU1E39/x7663lJKD/esHjxqqUZdxjLy3zLQMRo5EJ++h6
	 vFqqrdIrRTQcPc+0CWakr6J19TbLsXBUeGroi8xfqgbpNKa40jm/wXkXRoH9nMT5cj
	 YtqiBPppmRxxlKzUogkzw7Ke7/rNr5dMz0/MF/fnMJvfNQ5edvMk3DWpYjyXPkJ7BV
	 qskC+hIfKugw8gI4vDdOFJliOzqKsJQ9B5g7VsvIb3s5UipgzeRlybsAzdM6vmjmyZ
	 6q88uGiYEYqsA==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id CC52340AF9;
	Tue,  9 Sep 2025 19:35:38 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: Zhixu Liu <zhixu.liu@gmail.com>
Subject: [PATCH] docs: kdoc: handle the obsolescensce of docutils.ErrorString()
Date: Tue, 09 Sep 2025 13:35:37 -0600
Message-ID: <87ldmnv2pi.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

The ErrorString() and SafeString() docutils functions were helpers meant to
ease the handling of encodings during the Python 3 transition.  There is no
real need for them after Python 3.6, and docutils 0.22 removes them,
breaking the docs build

Handle this by just injecting our own one-liner version of ErrorString(),
and removing the sole SafeString() call entirely.

Reported-by: Zhixu Liu <zhixu.liu@gmail.com>
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/sphinx/kernel_feat.py         | 4 +++-
 Documentation/sphinx/kernel_include.py      | 6 ++++--
 Documentation/sphinx/maintainers_include.py | 4 +++-
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/sphinx/kernel_feat.py b/Documentation/sphinx/kernel_feat.py
index e3a51867f27b..aaac76892ceb 100644
--- a/Documentation/sphinx/kernel_feat.py
+++ b/Documentation/sphinx/kernel_feat.py
@@ -40,9 +40,11 @@ import sys
 from docutils import nodes, statemachine
 from docutils.statemachine import ViewList
 from docutils.parsers.rst import directives, Directive
-from docutils.utils.error_reporting import ErrorString
 from sphinx.util.docutils import switch_source_input
 
+def ErrorString(exc):  # Shamelessly stolen from docutils
+    return f'{exc.__class__.__name}: {exc}'
+
 __version__  = '1.0'
 
 def setup(app):
diff --git a/Documentation/sphinx/kernel_include.py b/Documentation/sphinx/kernel_include.py
index 2c4bb8215b4c..f94412cd17c9 100755
--- a/Documentation/sphinx/kernel_include.py
+++ b/Documentation/sphinx/kernel_include.py
@@ -89,7 +89,6 @@ import sys
 
 from docutils import io, nodes, statemachine
 from docutils.statemachine import ViewList
-from docutils.utils.error_reporting import SafeString, ErrorString
 from docutils.parsers.rst import Directive, directives
 from docutils.parsers.rst.directives.body import CodeBlock, NumberLines
 
@@ -106,6 +105,9 @@ logger = logging.getLogger(__name__)
 RE_DOMAIN_REF = re.compile(r'\\ :(ref|c:type|c:func):`([^<`]+)(?:<([^>]+)>)?`\\')
 RE_SIMPLE_REF = re.compile(r'`([^`]+)`')
 
+def ErrorString(exc):  # Shamelessly stolen from docutils
+    return f'{exc.__class__.__name}: {exc}'
+
 
 # ==============================================================================
 class KernelInclude(Directive):
@@ -156,7 +158,7 @@ class KernelInclude(Directive):
             except UnicodeEncodeError:
                 raise self.severe('Problems with directive path:\n'
                                 'Cannot encode input file path "%s" '
-                                '(wrong locale?).' % SafeString(path))
+                                '(wrong locale?).' % path)
             except IOError as error:
                 raise self.severe('Problems with directive path:\n%s.' % ErrorString(error))
 
diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index d31cff867436..519ad18685b2 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -22,10 +22,12 @@ import re
 import os.path
 
 from docutils import statemachine
-from docutils.utils.error_reporting import ErrorString
 from docutils.parsers.rst import Directive
 from docutils.parsers.rst.directives.misc import Include
 
+def ErrorString(exc):  # Shamelessly stolen from docutils
+    return f'{exc.__class__.__name}: {exc}'
+
 __version__  = '1.0'
 
 def setup(app):
-- 
2.51.0


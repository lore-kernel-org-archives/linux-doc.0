Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C213F9F37;
	Fri, 17 Jul 2026 12:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784293097; cv=none; b=a8x7+zninMRCjdD4eWg1kytVotbJEBLN97LolJB30bR0IxwhZY09xDgEJ6qKJvbb92tXLhgH2Fgn0ZrpeDXSMpexVKIb1Y3uVZUrpV6LhKqUw9hQaXPYVM7NwEknTaOpKlnuEfm+h010gno2VFvo88AmrRZPRnl6CJfFz4+p5gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784293097; c=relaxed/simple;
	bh=0n68iQPMse6euvc6lP1PVaTWnw7HtnIFVctriMGqVS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IlT7TbHhy8c1nM7Nr2U96bc/9nvQDLjm5NWVU5CZQhpqb1KnZWUbXpmhptZR/QpMngzUuXoWFQBGl6pUN6Vcp99V4R3p/1E+OsRJEJatb4OHKvhT/ekkE8r+g66jqGEST5jvu7mYxumMuC9AOg9G4xkiVPNjAmaKOJ9X8apxz5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UOsMnp2d; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UOsMnp2d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784293095; x=1815829095;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0n68iQPMse6euvc6lP1PVaTWnw7HtnIFVctriMGqVS8=;
  b=UOsMnp2d+SHcFNCbJM82dthyrs55YJOhgwRCJTN7Hd3AkIpH0xNtrpaH
   DhnM1JWfKUS1L8cpbre7M8PvIkBHtwu+NpQTHzxatFeikn58L+LpG2xo8
   NYOwybBL4nPV7OBthbGbKupJxb93B2yvgEHu+bMl5SSriGCUR3r5MMyAG
   6VBjSJ/PQM3WCTzqAOq70MbP1qe6YW7ArUOBWewxR9izmQ5UYe5kPkKqj
   5P1sa9Cr3EQUG4NVUHUfaR7T8KSnuxmJ/CxBLGsJUobUMmzRJEciENzSV
   xvE+Qf1bvtAoRSh92tsLtlRRyK54Pq0b4dMrcOB9r7l6PjO71mg72Q3j/
   A==;
X-CSE-ConnectionGUID: A7y3W8NsQ5yB7DwZEdIwOA==
X-CSE-MsgGUID: WSR1N9AeSvahzIYe/s5cgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="88639686"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="88639686"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 05:58:15 -0700
X-CSE-ConnectionGUID: gfXYjAMQTE+EF1QnWeHjdg==
X-CSE-MsgGUID: v2e7Jn6LQhyONuVJT8rCYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="253370105"
Received: from rknop-desk.igk.intel.com (HELO rknop-desk.ger.corp.intel.com) ([172.28.178.99])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 05:58:13 -0700
From: Ryszard Knop <ryszard.knop@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuicheng Lin <shuicheng.lin@intel.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH v3] scripts/kernel-doc: Suggest possible names for excess descriptions
Date: Fri, 17 Jul 2026 14:57:53 +0200
Message-ID: <20260717125753.634550-1-ryszard.knop@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260714111208.323108-1-ryszard.knop@intel.com>
References: <20260714111208.323108-1-ryszard.knop@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit

Recent check_sections() change added a warning if a documentation tag
member name does not match the detected struct/union member names. Since
the checker knows all possible names, we can suggest known names, so
that it's more obvious how to deal with the warning.

Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
---
Changes in v1:
- Added the suggestion hint in the warning, with basic name substring checks
- Link: https://lore.kernel.org/linux-doc/20260714111208.323108-1-ryszard.knop@intel.com/

Changes in v2:
- Strip trailing whitespace from the warning when the generated hint is empty
- Link: https://lore.kernel.org/linux-doc/20260715111726.394565-1-ryszard.knop@intel.com/

v3:
- Use difflib to generate suggestions even if the tag member is mistyped
- Suggest names based on the nested struct members too
---
 tools/lib/python/kdoc/kdoc_parser.py | 51 ++++++++++++++++++++++++++--
 1 file changed, 49 insertions(+), 2 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index 2dedda215c22..884f42584667 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -11,6 +11,7 @@ and extract embedded documentation comments from it.
 
 import sys
 import re
+import difflib
 from pprint import pformat
 
 from kdoc.c_lex import CTokenizer, tokenizer_set_log
@@ -558,6 +559,50 @@ class KernelDoc:
                         self.push_parameter(ln, decl_type, param, dtype,
                                             arg, declaration_name)
 
+    def get_suggestions_hint(self, decl_name, possible_names):
+        # For decl name 'flags' or 'flgas', suggests 'substruct.flags'
+        submember_exact = []
+        submember_substrings = []
+        submember_suggestions = []
+        for possible_name in possible_names:
+            parts = possible_name.strip().split('.')
+            if len(parts) < 2:
+                continue
+
+            final_part = parts[-1]
+            if decl_name == final_part:
+                submember_exact.append(possible_name)
+            elif decl_name in final_part:
+                submember_substrings.append(possible_name)
+            elif difflib.get_close_matches(decl_name, [final_part]):
+                submember_suggestions.append(possible_name)
+
+        # For decl name 'flgas', suggests 'flags'
+        full_suggestions = difflib.get_close_matches(decl_name, possible_names)
+
+        # For decl name 'member', suggests 'longer_member'
+        full_substrings = [name for name in possible_names if decl_name in name]
+
+        ordered_lists = [
+            submember_exact,
+            submember_substrings,
+            submember_suggestions,
+            full_suggestions,
+            full_substrings,
+        ]
+
+        # Deduplicate but maintain order from most to least likely:
+        unique_suggestions = {}
+        for suggestion_list in ordered_lists:
+            for suggestion in suggestion_list:
+                unique_suggestions[suggestion] = None
+
+        suggestions = list(unique_suggestions.keys())
+        if not suggestions:
+            return ""
+
+        return f"(did you mean one of: '{"', '".join(suggestions)}')"
+
     def check_sections(self, ln, decl_name, decl_type):
         """
         Check for errors inside sections, emitting warnings if not found
@@ -566,12 +611,13 @@ class KernelDoc:
         for section in self.entry.sections:
             if section not in self.entry.parameterlist and \
                not known_sections.search(section):
+                hint = self.get_suggestions_hint(section, self.entry.parameterlist)
                 if decl_type == 'function':
                     dname = f"{decl_type} parameter"
                 else:
                     dname = f"{decl_type} member"
                 self.emit_msg(ln,
-                              f"Excess {dname} '{section}' description in '{decl_name}'")
+                              f"Excess {dname} '{section}' description in '{decl_name}' {hint}".strip())
 
         #
         # Check that documented parameter names (from doc comments, including
@@ -591,12 +637,13 @@ class KernelDoc:
             if param_name in self.entry.parameterlist:
                 continue
 
+            hint = self.get_suggestions_hint(param_name, self.entry.parameterlist)
             if decl_type == 'function':
                 dname = f"{decl_type} parameter"
             else:
                 dname = f"{decl_type} member"
             self.emit_msg(ln,
-                          f"Excess {dname} '{param_name}' description in '{decl_name}'")
+                          f"Excess {dname} '{param_name}' description in '{decl_name}' {hint}".strip())
 
     def check_return_section(self, ln, declaration_name, return_type):
         """
-- 
2.55.0


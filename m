Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F109F37F74A;
	Tue, 14 Jul 2026 11:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784027567; cv=none; b=UGagjhJL8ZB3ly2wGphCxKEu7s40i8KnaPFQrdEVN8R1iMyxaynY/GjCaGv/HCm4B/0HY7yc7DIufshyYhezPq5xg9dk5LStIaAjDcm9pJ6fxMCBHeLvTFaiVIXKiUJpSGP6qFQvcyhV9rP2278nnLIiUgRhow4vXX4aHd9qAxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784027567; c=relaxed/simple;
	bh=s5YPP6ZG6jo/D/s07OJcTn9HjgNrbSSYqBFKOt1viN4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CFtJBS5sFSLF1x9TGy0goEaZVpeC/Ok7eys73NlHF1XD9G1ShKYEgQVfY7ESPHPc/HvsrJJ/jiC1lwOQYrYUeOk0G46M/2nN7/1jnhW7c+HhyZ/emX3fYDTTfE08+HTCjxNoQNfNE/gxrzKzkOetIU5hEzZG9jI89v7Z2/YNtbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RN6Cs+lG; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RN6Cs+lG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784027565; x=1815563565;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=s5YPP6ZG6jo/D/s07OJcTn9HjgNrbSSYqBFKOt1viN4=;
  b=RN6Cs+lG1jzINFFXvGLqfvMkIVWp6cqDk9g90vAo9Jn7llrb6bgAV+xX
   4/wryYyBMdZFO4efay5jF/nZf3Vibu9/mv9A3kkRVxE5upBCwIk0GNfIV
   G/O0NNX8g+phdag5B+rK8Q2APg+QozgfstIHlCT5DBg/LncosaHIb1+PR
   fi6ZWUc22VWSW72EOZx5vBrmOwm8afxqNEPUKyVKUpnVCjPaJgFmy7UTi
   d9KkrcqTf4d+UHDJZF59Ry4+OJzimGgrM7w9N6Xs09mCXadF0DouZNrHT
   J0IQgbvx2+aoNSerZGZl3nCX9VhuBVcGa1jwL5Rwj4ZvzILotxnxDJQby
   w==;
X-CSE-ConnectionGUID: kGyJeMKDQP2tv8oQXaKQzA==
X-CSE-MsgGUID: WMWVkjZ1RIeWlsEgb9WGdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="72169818"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="72169818"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 04:12:42 -0700
X-CSE-ConnectionGUID: Q2xlRzHtS+yXxonBC+a5FA==
X-CSE-MsgGUID: EiEQOQIHT2CQKkQ36H1b9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="279095107"
Received: from rknop-desk.igk.intel.com (HELO rknop-desk.ger.corp.intel.com) ([172.28.178.99])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 04:12:41 -0700
From: Ryszard Knop <ryszard.knop@intel.com>
To: linux-doc@vger.kernel.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH] scripts/kernel-doc: Suggest possible names for excess descriptions
Date: Tue, 14 Jul 2026 13:12:08 +0200
Message-ID: <20260714111208.323108-1-ryszard.knop@intel.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit

Since check_sections() now warns if a documentation tag member name is
the same as defined in the struct, we can suggest names the checker
knows, so that it's more obvious how to deal with the warning.

Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
---
 tools/lib/python/kdoc/kdoc_parser.py | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index 2dedda215c22..3f88095eab06 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -558,6 +558,13 @@ class KernelDoc:
                         self.push_parameter(ln, decl_type, param, dtype,
                                             arg, declaration_name)
 
+    def get_suggestions_hint(self, decl_name, possible_names):
+        suggestions = set(name for name in possible_names if decl_name in name)
+        if not suggestions:
+            return ""
+
+        return f"(did you mean one of: '{"', '".join(suggestions)}')"
+
     def check_sections(self, ln, decl_name, decl_type):
         """
         Check for errors inside sections, emitting warnings if not found
@@ -566,12 +573,13 @@ class KernelDoc:
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
+                              f"Excess {dname} '{section}' description in '{decl_name}' {hint}")
 
         #
         # Check that documented parameter names (from doc comments, including
@@ -591,12 +599,13 @@ class KernelDoc:
             if param_name in self.entry.parameterlist:
                 continue
 
+            hint = self.get_suggestions_hint(param_name, self.entry.parameterlist)
             if decl_type == 'function':
                 dname = f"{decl_type} parameter"
             else:
                 dname = f"{decl_type} member"
             self.emit_msg(ln,
-                          f"Excess {dname} '{param_name}' description in '{decl_name}'")
+                          f"Excess {dname} '{param_name}' description in '{decl_name}' {hint}")
 
     def check_return_section(self, ln, declaration_name, return_type):
         """
-- 
2.55.0


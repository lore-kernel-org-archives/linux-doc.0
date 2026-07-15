Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8941541A903;
	Wed, 15 Jul 2026 11:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784114281; cv=none; b=CB0VwGwb0Qnq8tMaR6ajDXaZIfXBjyFeMw025EH1MOmNkUhTY2VxVPmRx0btJ3gUBhS6Z+Qt5p9ChTksdMd1P3vRFZSlVysrlZRby06KhxsZ6Ipk5uTfLjvZcDsBKFkYNI7BeT5Qcrv4sfzaJElSLZbgFbx9XgBh+D6URtu+xks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784114281; c=relaxed/simple;
	bh=sIY1J/umhJmWf27+JDas0eGOf7rwLe6iPhl2N/ISoXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q/kbhgIU7kDs/YPYA9FncJyVYuumHYC2quU5/Ixm31SLZsc0eJ1LnjVdNrU23zCmhGRIWwJ+athX0RQV/L6IPfLT8HoNQgXW/tz4clVAgRCJAU2Pc6EUpUKeOPGwqCi/KDDx/gDCb+KMKrhUQ4K11pMsClzOFpE6f9iDdSrauL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XOVHw0oU; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XOVHw0oU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784114278; x=1815650278;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sIY1J/umhJmWf27+JDas0eGOf7rwLe6iPhl2N/ISoXQ=;
  b=XOVHw0oUGAQHUcEe0KcPxSHhvS5v54eH5gNHfhG/F1QbND44iZ6Q64rI
   6ceZOy3Ckrky7G+/5AQglvHRpVXP0MZNgTQ7kTwxpNrzfHmXvNJ5ipUEC
   Zl1lKiE530yjrqGfAkulk/pelQcKOkrq8CUMSOhdFLe1bP4VizSHTGGiM
   YkfdtUi39sniHnzsBWzwUququPstquq+kr/PzVHWu+h/eYj5k0nX5dE50
   aT+XxjaEuESa0oZfGJcT3BVE0iEwWgl4YnZlM8EYG+QzBQcbwnRA5l3Iw
   GQDnPU6BqAdWyPiL0j2DB68M1RGrPDSmt+O0CIUqKQU91Ft3zlnJ/AR9f
   A==;
X-CSE-ConnectionGUID: HR99xGWaSG2SdUaKvuK4Ew==
X-CSE-MsgGUID: 30OI+x/IQHaWGzbjU1Syhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="102172333"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="102172333"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 04:17:58 -0700
X-CSE-ConnectionGUID: XzUOvba2Tmy+Tqf2vn7jwQ==
X-CSE-MsgGUID: mIcV2l16TsGMn4KaXOIWuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="249782220"
Received: from rknop-desk.igk.intel.com (HELO rknop-desk.ger.corp.intel.com) ([172.28.178.99])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 04:17:56 -0700
From: Ryszard Knop <ryszard.knop@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH v2] scripts/kernel-doc: Suggest possible names for excess descriptions
Date: Wed, 15 Jul 2026 13:17:26 +0200
Message-ID: <20260715111726.394565-1-ryszard.knop@intel.com>
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

Since check_sections() now warns if a documentation tag member name is
the same as defined in the struct, we can suggest names the checker
knows, so that it's more obvious how to deal with the warning.

v2 (rdunlap):
- Strip whitespace from warnings, nicer when the hint is empty

Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
---
 tools/lib/python/kdoc/kdoc_parser.py | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index 2dedda215c22..a22c3e3182f0 100644
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
+                              f"Excess {dname} '{section}' description in '{decl_name}' {hint}".strip())
 
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
+                          f"Excess {dname} '{param_name}' description in '{decl_name}' {hint}".strip())
 
     def check_return_section(self, ln, declaration_name, return_type):
         """
-- 
2.55.0


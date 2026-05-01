Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8383EBF07;
	Fri,  1 May 2026 16:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777651707; cv=none; b=GO9n5FXyIYjluTOsY2Bq7Aiv5yttlpcFYv82t1CoS+m56v0IKeg/SqPxmla8t8VHmkBA582JUD6JbTCybqQl/A5YP/CQ89j4ukfswDg9AZyoThnSBjvMgEYeZIadNkK3UWYC8H+YnDsDjZGy+602BxFMfRwkr67Hw0iJcCVKsCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777651707; c=relaxed/simple;
	bh=vxGRwB/I7p12xwDNXW7dFz9qMSrnvn0MCs7SikDGUYQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kYJjvaDDp6oiXmTUuDuISkeZ+vVkRmZrRLnU0gbnFlOsz+q2ngnRbDP5DNoD5ReRVQkivUQxJwyO+mJl33JAwnkDn7ZCFnTHTYSOXu6e7eNaMTnrrqmUq/xi7pQTZwP0lfqZUTO4RJt/nU6D0xgFKo6wlR6R5uS83G3mBXUoneA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hx/FCvku; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hx/FCvku"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777651701; x=1809187701;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vxGRwB/I7p12xwDNXW7dFz9qMSrnvn0MCs7SikDGUYQ=;
  b=hx/FCvkuzBsioThjJj4enmH1NoX+7DI87BoJTj0X2bwY7/I0brm6IE1e
   h9cKdIXQZ9eorUbvOFWrZfUhD9Dbafrl8TqdE5/U9MZfg4K6tEJhZGGIg
   3XvraWnsDuSu5eeb/db1rN5ldGBPcPdYOApsYvYBiqF7GRg8AJ1DpXLGa
   D5Ds5dGocvm7dZqnf0qWVvPK59n79PSWjXGAICTrqs+drgf491Olbh2Uw
   JbcyaVjANYAzZfjWMvfFLx+ot/qC38vwjIrE7Sh95oLNO1bIgVAuUCQIP
   xCpyNhoL91iyKAb85algqzrDrCgWZom5EWSCpWiYXpObbvF6+k/qb/Ksa
   w==;
X-CSE-ConnectionGUID: HmMsBL21Ts64QTG11P5COg==
X-CSE-MsgGUID: l0tUEocASnqlkPLSpn870w==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="78714618"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="78714618"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 09:08:17 -0700
X-CSE-ConnectionGUID: JhM12/rPQ9CnSMcpxhrRqw==
X-CSE-MsgGUID: RkyeEZXHQFeeYR8bMnZw9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="239221064"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
  by orviesa004.jf.intel.com with ESMTP; 01 May 2026 09:08:15 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: linux-doc@vger.kernel.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH v2] scripts/kernel-doc: Detect mismatched inline member documentation tags
Date: Fri,  1 May 2026 16:08:00 +0000
Message-Id: <20260501160800.4043276-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add validation in check_sections() to verify that inline member
documentation tags (/** @member: description */) match actual struct/union
member names. Previously, kernel-doc only validated section headers against
the parameter list, but inline doc tags stored in parameterdescs were never
cross-checked, allowing stale or mistyped member names to go undetected.

The new check iterates over parameterdescs keys and warns about any that
don't appear in the parameter list, catching issues like renamed struct
members where the documentation tag was not updated to match.

This catches real issues such as:
  - xe_bo_types.h: @atomic_access (missing struct prefix, should be
    @attr.atomic_access)
  - xe_device_types.h: @usm.asid (member is actually asid_to_vm)

Variadic arguments documented as ``@args...:`` are stored in
parameterdescs under the unstripped key (e.g. ``args...``), while
push_parameter() strips the trailing ``...`` before appending to
parameterlist (e.g. ``args``).  Treat the stripped form as a match so
the new loop doesn't emit a false-positive excess-parameter warning for
a properly documented named variadic parameter.  The bare ``@...:`` form
is unaffected because push_parameter() does not strip when the name is
exactly three characters.

v2: Skip variadic parameters whose documented key ends with ``...`` and
    whose stripped name is in parameterlist, to avoid false-positive
    "Excess function parameter 'args...'" warnings on macros like
    ``#define foo(fmt, args...)`` documented with ``@args...:``.

Assisted-by: Claude:claude-opus-4.6
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: intel-xe@lists.freedesktop.org
---
 tools/lib/python/kdoc/kdoc_parser.py | 36 ++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index ca00695b47b3..884c6bf56d25 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -673,6 +673,42 @@ class KernelDoc:
                 self.emit_msg(ln,
                               f"Excess {dname} '{section}' description in '{decl_name}'")
 
+        #
+        # Check that documented parameter names (from doc comments, including
+        # inline ``/** @member: */`` tags) actually match real members in
+        # the declaration.  This catches mismatched or stale kernel-doc
+        # member tags that don't correspond to any actual struct/union
+        # member or function parameter.
+        #
+        for param_name, desc in self.entry.parameterdescs.items():
+            # Skip auto-generated entries from push_parameter()
+            if desc == self.undescribed:
+                continue
+            if desc in ("no arguments", "anonymous\n", "variable arguments"):
+                continue
+            if param_name.startswith("{unnamed_"):
+                continue
+            if param_name in self.entry.parameterlist:
+                continue
+            #
+            # Variadic arguments documented as ``@args...:`` are stored in
+            # parameterdescs under the unstripped key (e.g. ``args...``),
+            # while push_parameter() strips the trailing ``...`` before
+            # appending to parameterlist (e.g. ``args``).  Treat the
+            # stripped form as a match so this loop doesn't emit a false
+            # positive for a properly documented variadic parameter.
+            #
+            if param_name.endswith("...") and \
+               param_name[:-3] in self.entry.parameterlist:
+                continue
+
+            if decl_type == 'function':
+                dname = f"{decl_type} parameter"
+            else:
+                dname = f"{decl_type} member"
+            self.emit_msg(ln,
+                          f"Excess {dname} '{param_name}' description in '{decl_name}'")
+
     def check_return_section(self, ln, declaration_name, return_type):
         """
         If the function doesn't return void, warns about the lack of a
-- 
2.43.0


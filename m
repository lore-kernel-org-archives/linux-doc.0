Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BC128B40E;
	Thu,  7 May 2026 02:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778121170; cv=none; b=iMif5xSxVlWreXJPol841lZ/xd4E39XePJYpV/QZ5+5Cedqch9ai2Yr+p86dcXGszWXIg0M309zECzakYc6L7i5fqRvCoq9WA6A+Z/2GaO1lU05EkWGQg9AsgNGeCUYru0rJVivfFh/rCzFdkCrX+0m1WEKeWXaXVeewJc8hDOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778121170; c=relaxed/simple;
	bh=1ch7kBu8j5PAWfzbQAEBu7uLjRej8l2f76kqfWlZVCI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TodpJyOVI4vn52tfYpklrGIwFLIMu+a97GEcWNjW+DGPKvAWSHCXFkssOG+mPzQ7KZh1wDYM/xeYCZ5rM4ivEse2dEp94RGVRxws7IJQotvGuFbxwc3xcPCcPZYVl2ZAcHqCNLJ+D6UI68yExfirhGZxaxt8oZjAcsLDgpKRKBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jyirApkB; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jyirApkB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778121167; x=1809657167;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1ch7kBu8j5PAWfzbQAEBu7uLjRej8l2f76kqfWlZVCI=;
  b=jyirApkBXmwp7lZpK6mQyqkA5BhswwuMDIe6+VGqmEgtemqsrr27T/97
   MQk07Vdchy31eHlNGEIXS1IhpkPHkLxQboDWsjwRTziQ5yxAJ7RXqHuhS
   WZOSVd8g4Bhv7DOAO3+VcVXFEkwPzeYuz5qzTq4dJZlgc40e3xhaWkH1z
   oHMoOFr96/XZEQQ70TYxK7/COiapqztya1245mkvRqIF/1VprNs1+uNtc
   rtf7Dcj/UstVUSfUqqH0kGQLmVh6XDvNoDAZwsqUTJfCU250euPsis0cY
   i8SD1VVKxoe2yXDqHqG97QqLTiS1/1OSVK3/cAK4r/xYRT1fyMBP1Idxk
   g==;
X-CSE-ConnectionGUID: LmTQyE9KTli80NHbzaHM2Q==
X-CSE-MsgGUID: mH8xzNryQi2tpkx520nGSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="101740764"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; 
   d="scan'208";a="101740764"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 19:32:47 -0700
X-CSE-ConnectionGUID: tEQaxPeeQcu5nx574I9D8g==
X-CSE-MsgGUID: epReyYBkQXqlANS0419lzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; 
   d="scan'208";a="235327139"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
  by orviesa006.jf.intel.com with ESMTP; 06 May 2026 19:32:45 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: linux-doc@vger.kernel.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH v4] scripts/kernel-doc: Detect mismatched inline member documentation tags
Date: Thu,  7 May 2026 02:32:32 +0000
Message-Id: <20260507023232.4108680-1-shuicheng.lin@intel.com>
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

While at it, fix two long-standing issues with named variadic parameters
(macros like ``#define foo(fmt, args...)``) that the new check exposed:

  1. A description provided via the ``@args...:`` doc form was stored
     in parameterdescs under the unstripped key ``args...``, while
     push_parameter() stripped the trailing ``...`` and only added
     ``args`` to parameterlist.  As a result the user-supplied
     description was orphaned, parameterdescs[``args``] was auto-
     populated with the generic "variable arguments" text, and the
     user's actual description was silently discarded by the output
     stage.  Migrate the description from the unstripped to the
     stripped key inside push_parameter() so the user's text reaches
     the output and the new check does not flag the orphaned key.

  2. push_parameter() always auto-populated parameterdescs[param] with
     "variable arguments" for variadic parameters, which bypassed the
     existing "parameter not described" warning at line 549.  As a
     consequence, a named variadic with no matching ``@<name>:`` doc
     tag (or a mistyped one such as ``@args:`` for a parameter named
     ``arg``) went undetected.  Emit the standard "not described"
     warning for named variadics before applying the auto-fill, so
     missing or mistyped variadic docs are reported just like missing
     docs for any other parameter.  The bare ``@...:`` form is
     unaffected because it has no natural name for the user to
     document.

This second hunk surfaces one real pre-existing documentation gap in
include/linux/hashtable.h: hash_for_each_possible_rcu()'s ``cond...``
parameter has no matching ``@cond:`` doc entry.  No false positives were
observed across include/linux, kernel/, or drivers/gpu/drm.

v2: Skip variadic parameters whose documented key ends with ``...`` and
    whose stripped name is in parameterlist, to avoid false-positive
    "Excess function parameter 'args...'" warnings on macros like
    ``#define foo(fmt, args...)`` documented with ``@args...:``.

v3: The v2 special case in check_sections() only suppressed the warning
    while still letting the user's description be silently dropped from
    the generated output.  Replace it with a fix in push_parameter() that
    migrates the description from ``args...`` to ``args`` when the name
    is stripped, so the user's text is preserved end-to-end and the
    new excess-parameter check naturally finds nothing to flag.

v4: Also emit the standard "parameter not described" warning for named
    variadics that have no matching ``@<name>:`` doc tag.  Previously
    push_parameter()'s unconditional auto-fill bypassed that warning,
    so a missing or mistyped variadic doc went undetected. (Randy)

Assisted-by: Claude:claude-opus-4.6
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: linux-kernel@vger.kernel.org
Cc: intel-xe@lists.freedesktop.org
---
 tools/lib/python/kdoc/kdoc_parser.py | 54 +++++++++++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index ca00695b47b3..2bc49c3ece14 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -512,9 +512,36 @@ class KernelDoc:
         #
         if dtype == '':
             if param.endswith("..."):
-                if len(param) > 3: # there is a name provided, use that
+                named_variadic = len(param) > 3
+                if named_variadic: # there is a name provided, use that
+                    #
+                    # If the user documented the parameter using the
+                    # ``@name...:`` form, the description is stored in
+                    # parameterdescs under the unstripped key.  Migrate
+                    # it to the stripped key so the user's text is not
+                    # silently dropped during output, and so the new
+                    # excess-parameter check in check_sections() does
+                    # not flag the unstripped key as orphaned.
+                    #
+                    orig = self.entry.parameterdescs.pop(param, None)
                     param = param[:-3]
+                    if orig is not None and \
+                       not self.entry.parameterdescs.get(param):
+                        self.entry.parameterdescs[param] = orig
                 if not self.entry.parameterdescs.get(param):
+                    #
+                    # For a named variadic (e.g. ``args...``), emit the
+                    # standard "not described" warning before auto-filling
+                    # so a missing or mistyped ``@<name>:`` doc tag does
+                    # not go undetected.  The bare ``...`` form has no
+                    # natural name for the user to document and so always
+                    # gets the auto-generated text.
+                    #
+                    if named_variadic and decl_type == 'function':
+                        self.emit_msg(ln,
+                                      f"function parameter '{param}' "
+                                      f"not described in "
+                                      f"'{declaration_name}'")
                     self.entry.parameterdescs[param] = "variable arguments"
 
             elif (not param) or param == "void":
@@ -673,6 +700,31 @@ class KernelDoc:
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


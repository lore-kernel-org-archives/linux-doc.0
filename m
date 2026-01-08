Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8D42737E0
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 16:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767888860; cv=none; b=JLLIYgvTvP/N/BDKJTLUTylOAMJrMO+g67r5hk1jG4irDCVirIiKcbIoq+Yg5cYDOFsmJLm9FuncZYeAxfP2qSLtbZ1iPjFitomojZmcf/jBzb9PyeM10K320vv2Z1hMxrsAUpHSYKpCELw9cOBUBUY7mYkT6RW6CBBVkOpe0V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767888860; c=relaxed/simple;
	bh=gZtQXWYl86QcRVxJrWdGNxS17N7jTxg6qD9PlenxVkc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DCrR4amoOWdpFHRJZfibJw2hEoo764ed1an1EkCRwXLhegP69nOD6mgobWBlcYAZ2sO5niAbfAEW0rT9yuDfrWcdIi9KuMgdVl6OnhDs/fdSsCxHabJCWNVIGivZVPZu9bDf0UZhDPl5VZP1JF6Q31CQsl70+17WE8RujciOCJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=THiuHZQn; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="THiuHZQn"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42fed090e5fso1795291f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 08 Jan 2026 08:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767888857; x=1768493657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dXJRDY1LT2kYrctjUr0o0V8a6dmySfNZXgbe2pBlHk4=;
        b=THiuHZQnzFU03UZHVRqCTMArgjLulgOA+Sq2vwQeoLSJES6Ecc8rBzUoFtgzHNtgQS
         kd7RcvDjKkvnDCfiqo9Ptj5PfS22/QlibGTNQ3cfzx8fRL4b93rwbgXwMLV3/0MHCJ1p
         6IOCqUO/JU3EikBtFkhgrfEI4OBY0kVMhZS3LzLBedKo8q3lBQMVCMbvmzmPiEbq4UO1
         fo9WqkDKrsxuRGL13kxt8MdfWecO9yntIix+7KLPRQKbfkwpGruK/Wda35I0qA0U5bo6
         VAEWfUzpwiR1AQhrk3e/A9GBAnDZWn/T4s7ZidHXrfB8slhojNGYiSukvQNy5oxQJxfs
         D6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767888857; x=1768493657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dXJRDY1LT2kYrctjUr0o0V8a6dmySfNZXgbe2pBlHk4=;
        b=KBFdXAYnQawjqWCN1hZ+/vWpEY49XAjm1opYypc+35TPjNY5JXKP8fTtvsc8EBdEVg
         M0+AW2ch8FJmpsA1zyYryYCZN+abI1j3kOcy5sBQJNGzvtpgyJSSOWpmS88tSjp5J0CR
         lyt0urY2hHQwM42ZAzdVaBQGkTXOru+Yls72aDJmy5ZOF74vKV+rZBLCjXWu72lBrKzb
         m0NRgu1NEZ1Rp/cSjSZ4WV90gr4GNz0VLLHCuy6vncbARr5rMsnobyHhr1kRsb0M8av6
         xvERrLYKbjg9k77QrH5Y5lhPvMuOgTN1EY6Jab0dkX39iuBq8dOy7w6IUc0ewTDIe2XG
         h6Hw==
X-Forwarded-Encrypted: i=1; AJvYcCUmBg0YJ6BNOwXxCF6LfojDY4sKHcHw0+0VnxeFqZPjlWPYDLIU6e7mgsYPTF5W9tbX8AZjTPt2bNM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwEkLFaMW1SgB7D68cB4l7nr3p4FJwgbwRheJE5hhj8ZMoYZvd
	Np7sBiIRY2X8yNIyp28rdO0pld8PHBql01d26lvUOtleJCC275vUL70c
X-Gm-Gg: AY/fxX69s4g5cux+KGzi2byVrpet3iln1vjDfnWNPDEvA8/70r+4wkB159xpoFxAXfn
	sn6qKXCjNoEx+GUOhVSgdhoDvACgk+N0En2cego/AFFPFC9FtIazraB5a1LXmmScEwAsW2wfTKe
	+9bNSWnTeTGQ/z6Frrd+FbJMn3i1jEsQbAdMRWA++Wai7+YLpx2r9KFsOkRC0stnCTSm/sFj8fj
	2Duo6Hj96NaAjTRP4U65604AmZCtSBuHKdGXP4F11YWh60kkECU0810CgnVJl5H4gikBNt9Q32y
	G21oFZApNBtw9qegna1y4NYSWE7xfKmDh8sCdjDsvGbzAIQ7vdaNtFZ9DsREexnpg5J41oQvnB9
	nn+LYM4IpLZC7O3MXu4f1mVoo4LPmIP3iI5gmzQZKEpBfCMKnVuv9zkaFQ+sE0fpteAN19D0847
	nSMMiDqL6xg7C2yTLJIukO6JlsGtgQ
X-Google-Smtp-Source: AGHT+IFzD2YrZMaxn03RDd8mf46Abm3BOfvlGWLP7d9ODcOHgKo723CEnN5qLA/9X4Oy0FSzJysERQ==
X-Received: by 2002:adf:ec06:0:b0:431:656:c726 with SMTP id ffacd0b85a97d-432c3628249mr6319949f8f.3.1767888856574;
        Thu, 08 Jan 2026 08:14:16 -0800 (PST)
Received: from imac.lan ([2a02:8010:60a0:0:8115:84ef:f979:bd53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5edd51sm17140039f8f.29.2026.01.08.08.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 08:14:16 -0800 (PST)
From: Donald Hunter <donald.hunter@gmail.com>
To: Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	"Matthieu Baerts (NGI0)" <matttbe@kernel.org>,
	Gal Pressman <gal@nvidia.com>,
	Jan Stancek <jstancek@redhat.com>,
	Hangbin Liu <liuhangbin@gmail.com>,
	Nimrod Oren <noren@nvidia.com>,
	netdev@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	=?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Ruben Wauters <rubenru09@aol.com>,
	linux-doc@vger.kernel.org
Subject: [PATCH net-next v2 12/13] tools: ynl-gen-c: fix pylint None, type, dict, generators, init
Date: Thu,  8 Jan 2026 16:13:38 +0000
Message-ID: <20260108161339.29166-13-donald.hunter@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108161339.29166-1-donald.hunter@gmail.com>
References: <20260108161339.29166-1-donald.hunter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following pylint warnings that are trivial one-liners:

- unsubscriptable-object
- unidiomatic-typecheck
- use-dict-literal
- attribute-defined-outside-init
- consider-using-in
- consider-using-generator

Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
---
 tools/net/ynl/pyynl/ynl_gen_c.py | 49 ++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 22 deletions(-)

diff --git a/tools/net/ynl/pyynl/ynl_gen_c.py b/tools/net/ynl/pyynl/ynl_gen_c.py
index 900896779e61..5f079a74c8d1 100755
--- a/tools/net/ynl/pyynl/ynl_gen_c.py
+++ b/tools/net/ynl/pyynl/ynl_gen_c.py
@@ -200,7 +200,7 @@ class Type(SpecAttr):
     # pylint: disable=assignment-from-none
     def arg_member(self, ri):
         member = self._complex_member_type(ri)
-        if member:
+        if member is not None:
             spc = ' ' if member[-1] != '*' else ''
             arg = [member + spc + '*' + self.c_name]
             if self.presence_type() == 'count':
@@ -210,7 +210,7 @@ class Type(SpecAttr):
 
     def struct_member(self, ri):
         member = self._complex_member_type(ri)
-        if member:
+        if member is not None:
             ptr = '*' if self.is_multi_val() else ''
             if self.is_recursive_for_op(ri):
                 ptr = '*'
@@ -258,9 +258,9 @@ class Type(SpecAttr):
 
     def attr_get(self, ri, var, first):
         lines, init_lines, _ = self._attr_get(ri, var)
-        if type(lines) is str:
+        if isinstance(lines, str):
             lines = [lines]
-        if type(init_lines) is str:
+        if isinstance(init_lines, str):
             init_lines = [init_lines]
 
         kw = 'if' if first else 'else if'
@@ -1002,7 +1002,7 @@ class Struct:
         self.in_multi_val = False  # used by a MultiAttr or and legacy arrays
 
         self.attr_list = []
-        self.attrs = dict()
+        self.attrs = {}
         if type_list is not None:
             for t in type_list:
                 self.attr_list.append((t, self.attr_set[t]),)
@@ -1094,8 +1094,8 @@ class EnumSet(SpecEnumSet):
         return EnumEntry(self, entry, prev_entry, value_start)
 
     def value_range(self):
-        low = min([x.value for x in self.entries.values()])
-        high = max([x.value for x in self.entries.values()])
+        low = min(x.value for x in self.entries.values())
+        high = max(x.value for x in self.entries.values())
 
         if high - low + 1 != len(self.entries):
             return None, None
@@ -1234,6 +1234,12 @@ class Family(SpecFamily):
         self.hooks = None
         delattr(self, "hooks")
 
+        self.root_sets = {}
+        self.pure_nested_structs = {}
+        self.kernel_policy = None
+        self.global_policy = None
+        self.global_policy_set = None
+
         super().__init__(file_name, exclude_ops=exclude_ops)
 
         self.fam_key = c_upper(self.yaml.get('c-family-name', self.yaml["name"] + '_FAMILY_NAME'))
@@ -1268,18 +1274,18 @@ class Family(SpecFamily):
 
         self.mcgrps = self.yaml.get('mcast-groups', {'list': []})
 
-        self.hooks = dict()
+        self.hooks = {}
         for when in ['pre', 'post']:
-            self.hooks[when] = dict()
+            self.hooks[when] = {}
             for op_mode in ['do', 'dump']:
-                self.hooks[when][op_mode] = dict()
+                self.hooks[when][op_mode] = {}
                 self.hooks[when][op_mode]['set'] = set()
                 self.hooks[when][op_mode]['list'] = []
 
         # dict space-name -> 'request': set(attrs), 'reply': set(attrs)
-        self.root_sets = dict()
+        self.root_sets = {}
         # dict space-name -> Struct
-        self.pure_nested_structs = dict()
+        self.pure_nested_structs = {}
 
         self._mark_notify()
         self._mock_up_events()
@@ -1627,7 +1633,7 @@ class RenderInfo:
 
         self.cw = cw
 
-        self.struct = dict()
+        self.struct = {}
         if op_mode == 'notify':
             op_mode = 'do' if 'do' in op else 'dump'
         for op_dir in ['request', 'reply']:
@@ -1794,7 +1800,7 @@ class CodeWriter:
         if not local_vars:
             return
 
-        if type(local_vars) is str:
+        if isinstance(local_vars, str):
             local_vars = [local_vars]
 
         local_vars.sort(key=len, reverse=True)
@@ -1814,20 +1820,19 @@ class CodeWriter:
     def writes_defines(self, defines):
         longest = 0
         for define in defines:
-            if len(define[0]) > longest:
-                longest = len(define[0])
+            longest = max(len(define[0]), longest)
         longest = ((longest + 8) // 8) * 8
         for define in defines:
             line = '#define ' + define[0]
             line += '\t' * ((longest - len(define[0]) + 7) // 8)
-            if type(define[1]) is int:
+            if isinstance(define[1], int):
                 line += str(define[1])
-            elif type(define[1]) is str:
+            elif isinstance(define[1], str):
                 line += '"' + define[1] + '"'
             self.p(line)
 
     def write_struct_init(self, members):
-        longest = max([len(x[0]) for x in members])
+        longest = max(len(x[0]) for x in members)
         longest += 1  # because we prepend a .
         longest = ((longest + 8) // 8) * 8
         for one in members:
@@ -2670,7 +2675,7 @@ def print_req_free(ri):
 
 
 def print_rsp_type(ri):
-    if (ri.op_mode == 'do' or ri.op_mode == 'dump') and 'reply' in ri.op[ri.op_mode]:
+    if ri.op_mode in ('do', 'dump') and 'reply' in ri.op[ri.op_mode]:
         direction = 'reply'
     elif ri.op_mode == 'event':
         direction = 'reply'
@@ -2683,7 +2688,7 @@ def print_wrapped_type(ri):
     ri.cw.block_start(line=f"{type_name(ri, 'reply')}")
     if ri.op_mode == 'dump':
         ri.cw.p(f"{type_name(ri, 'reply')} *next;")
-    elif ri.op_mode == 'notify' or ri.op_mode == 'event':
+    elif ri.op_mode in ('notify', 'event'):
         ri.cw.p('__u16 family;')
         ri.cw.p('__u8 cmd;')
         ri.cw.p('struct ynl_ntf_base_type *next;')
@@ -2946,7 +2951,7 @@ def print_kernel_op_table_hdr(family, cw):
 
 def print_kernel_op_table(family, cw):
     print_kernel_op_table_fwd(family, cw, terminate=False)
-    if family.kernel_policy == 'global' or family.kernel_policy == 'per-op':
+    if family.kernel_policy in ('global', 'per-op'):
         for op_name, op in family.ops.items():
             if op.is_async:
                 continue
-- 
2.52.0


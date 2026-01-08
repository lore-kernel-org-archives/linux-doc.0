Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3D42DB78A
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 16:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767888861; cv=none; b=SoWowcyt1x4WK4Jbac/wTN167YgABfIR1IoTz62YQBs9WRtn67GJhyt2ticKFr/Q6Br/FXyBHQKctlC+B9XDBIUv+EUAikmxqX5jAACitWiKK/7fWckHRVqtjnlWI5dyCx0bjpOJhoz5FwfroHfhHuO1GO7LJ0bAY7AX0SkAHYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767888861; c=relaxed/simple;
	bh=6m42h8aJp+JbB0imSkz80jRnKXGJ06eWl8iUiYsGeGw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PabtyUtFGRhan73y3tk8LqXS7iRjELqEFVWEuPqf7uZ2sOpAHP2BTSL98FGUk7ru/u0YzpSX1Jz5hyT2oGqL3hSh9IsbGSA7aIgentzDALlvOChWN8ktbGSqhK2/XPJLUtu7ZrM13cv7c1JtQcqiPWKzoDGRkVg+C88rSpvbH0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uy/OSbnU; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uy/OSbnU"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so36761395e9.2
        for <linux-doc@vger.kernel.org>; Thu, 08 Jan 2026 08:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767888858; x=1768493658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jCTWAGapejOw1iFJ5z5ReQnAsgu6SmxS0ql4MKvTAbc=;
        b=Uy/OSbnUVxdR+RHfmDH+miKTHo/maPwml73YWlIq5+9tejpGcojwBs175ucdUF3cKt
         zS4c07AQlWZREigKFQLJrjMaEv7oci0ofFIEVQkkg7YE/Wihf+SKLSUMB2gYdOBIBxHI
         Yiri/CYwm997fuLK52E5f32UvNwOE33sdFHSJd13t4RAoNs5io0fdVC0QSTDTRVa62ug
         tFSW5imppUWUjPgSJC1J5V6r03PQe8H/KRnWJ6ahLdSh9X/xsNF4bntfEseRJr02Xb3K
         DJq8VmLixbib6/Mt55jqB8Bt+vCM6DJ2sYyDixYb6x73RDWsNL+r65AWoOl4WvmnXn3O
         P3CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767888858; x=1768493658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jCTWAGapejOw1iFJ5z5ReQnAsgu6SmxS0ql4MKvTAbc=;
        b=YRCQhXAbaX+t2au/Ia/Hjt5gbejvRrkBRJErXKNF/JjrKdzFRE4SmaidZkVIis5sci
         dAkon2O10p+YkTx2rJZT6qTKqd4FFGjkXBrQkpJ0gA7Ea0vqLfhMb58J3JjdvJ9Jnkq+
         41hUFgUWsAJIKXoKGYvbxOwMVnMQ/JGj27o+wauhoaBhNjU5w2uImNHcuzIx3O9Owy2C
         6BsBWr7d7nExcxzjDK3eG6L99Mpuge/E1GhYip1V1uEYsw1jWvG9UurLAeyPcnEcH6ql
         OOyMDiUZ2I8Ahztd2p7TrbiekTkRh4NxRGIsYeeUhSuYZxlg6kI/ThLcxHacTghsvG1+
         OFeA==
X-Forwarded-Encrypted: i=1; AJvYcCWLnlRp247C4kU/BNFB637IafcETTF0uWpGtw3l5c59z7E+QADJKEHlsEFGjkJWcQRw8/nGXcUD3O4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBv5WbeYXHetXlLSOImIKBUZibk48Ywoh20rxwwWdMfgCzL4sD
	jCS6Hdq4FmaitPoJANPfe07+c0GDURHVQuNZm9DdPKHgNQCL5RDSHmwH
X-Gm-Gg: AY/fxX5R/oiXYjCufT9ZPNi4L0Vy9lzgfqZ97f9oSVWcbdNFLdpDrrWAgpWFnEJu8bM
	NmHSezX4/fXnB3ED5mdBfVjCE75RurKe8/4L9zPTjgo4x8J486rhXxR+HUUxgeWS8KCP79DytF9
	vdfBbF5FXEhnLIWpUd0MRvazv6Z3drjR/vRMJwnSMDh4DSM7yk5uJU9LzIG0mMZOLowQ5D3yEMq
	T9lsM0CaGqD9yCMzZRVpxXvd6Qp/M2CTq8bFPiC/uG/uI4zvtpIDGw6uq8ttvzg5q0eDI2pvuuU
	u3yMxRDsk5lcxODHvEGGGhjxX6hd9jCtQlaXlxO+QN8FOailkOjqJlzshPmojee0TMaCEVM+w2i
	c+SXlYGNRIkQL6nVIdISQN8n71QrsgfSyMHR4rRZJgVldQz83TVYSDDGY2HhBoYj+iT5nAHBT/z
	zLdSEdDlV3QC6YhDwLRY1srSXHYqgE
X-Google-Smtp-Source: AGHT+IH4v0PxdvSCJ6r7iSvimYK54fONQz3mYfHtihrB2pcwm/9wYDjewO0SRgJptjNDioogK2WbNQ==
X-Received: by 2002:a05:600c:4713:b0:477:1af2:f40a with SMTP id 5b1f17b1804b1-47d84b32748mr91254955e9.17.1767888857928;
        Thu, 08 Jan 2026 08:14:17 -0800 (PST)
Received: from imac.lan ([2a02:8010:60a0:0:8115:84ef:f979:bd53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5edd51sm17140039f8f.29.2026.01.08.08.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 08:14:17 -0800 (PST)
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
Subject: [PATCH net-next v2 13/13] tools: ynl-gen-c: Fix remaining pylint warnings
Date: Thu,  8 Jan 2026 16:13:39 +0000
Message-ID: <20260108161339.29166-14-donald.hunter@gmail.com>
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

Fix the following pylint warning instances:

ynl_gen_c.py:575:15: E0606: Possibly using variable 'mem' before
assignment (possibly-used-before-assignment)

ynl_gen_c.py:888:0: R1707: Disallow trailing comma tuple
(trailing-comma-tuple)

ynl_gen_c.py:944:21: C0209: Formatting a regular string which could be an
f-string (consider-using-f-string)

ynl_gen_c.py:1450:14: C1802: Do not use `len(SEQUENCE)` without comparison
to determine if a sequence is empty (use-implicit-booleaness-not-len)

ynl_gen_c.py:1688:13: W1514: Using open without explicitly specifying an
encoding (unspecified-encoding)

ynl_gen_c.py:3446:0: C0325: Unnecessary parens after '=' keyword
(superfluous-parens)

Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
---
 tools/net/ynl/pyynl/ynl_gen_c.py | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/tools/net/ynl/pyynl/ynl_gen_c.py b/tools/net/ynl/pyynl/ynl_gen_c.py
index 5f079a74c8d1..0e1e486c1185 100755
--- a/tools/net/ynl/pyynl/ynl_gen_c.py
+++ b/tools/net/ynl/pyynl/ynl_gen_c.py
@@ -571,6 +571,8 @@ class TypeBinary(Type):
             mem = 'NLA_POLICY_MIN_LEN(' + self.get_limit_str('min-len') + ')'
         elif 'max-len' in self.checks:
             mem = 'NLA_POLICY_MAX_LEN(' + self.get_limit_str('max-len') + ')'
+        else:
+            raise Exception('Failed to process policy check for binary type')
 
         return mem
 
@@ -885,7 +887,7 @@ class TypeIndexedArray(Type):
                 f"for (i = 0; i < {var}->{ref}_count.{self.c_name}; i++)",
                 f'{self.nested_render_name}_free(&{var}->{ref}{self.c_name}[i]);',
             ]
-        lines += f"free({var}->{ref}{self.c_name});",
+        lines += (f"free({var}->{ref}{self.c_name});",)
         return lines
 
 class TypeNestTypeValue(Type):
@@ -935,15 +937,15 @@ class TypeSubMessage(TypeNest):
         return typol
 
     def _attr_get(self, ri, var):
-        sel = c_lower(self['selector'])
+        selector = self['selector']
+        sel = c_lower(selector)
         if self.selector.is_external():
             sel_var = f"_sel_{sel}"
         else:
             sel_var = f"{var}->{sel}"
         get_lines = [f'if (!{sel_var})',
-                     'return ynl_submsg_failed(yarg, "%s", "%s");' %
-                        (self.name, self['selector']),
-                    f"if ({self.nested_render_name}_parse(&parg, {sel_var}, attr))",
+                     f'return ynl_submsg_failed(yarg, "{self.name}", "{selector}");',
+                     f"if ({self.nested_render_name}_parse(&parg, {sel_var}, attr))",
                      "return YNL_PARSE_CB_ERROR;"]
         init_lines = [f"parg.rsp_policy = &{self.nested_render_name}_nest;",
                       f"parg.data = &{var}->{self.c_name};"]
@@ -1447,7 +1449,7 @@ class Family(SpecFamily):
         attr_set_queue = list(self.root_sets.keys())
         attr_set_seen = set(self.root_sets.keys())
 
-        while len(attr_set_queue):
+        while attr_set_queue:
             a_set = attr_set_queue.pop(0)
             for attr, spec in self.attr_sets[a_set].items():
                 if 'nested-attributes' in spec:
@@ -1685,7 +1687,7 @@ class CodeWriter:
         if not self._overwrite and os.path.isfile(self._out_file):
             if filecmp.cmp(self._out.name, self._out_file, shallow=False):
                 return
-        with open(self._out_file, 'w+') as out_file:
+        with open(self._out_file, 'w+', encoding='utf-8') as out_file:
             self._out.seek(0)
             shutil.copyfileobj(self._out, out_file)
             self._out.close()
@@ -3443,7 +3445,7 @@ def main():
         print(exc)
         os.sys.exit(1)
 
-    cw = CodeWriter(BaseNlLib(), args.out_file, overwrite=(not args.cmp_out))
+    cw = CodeWriter(BaseNlLib(), args.out_file, overwrite=not args.cmp_out)
 
     _, spec_kernel = find_kernel_root(args.spec)
     if args.mode == 'uapi' or args.header:
-- 
2.52.0


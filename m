Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493033161BB
	for <linux-doc@vger.kernel.org>; Wed,  7 Jan 2026 12:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767788542; cv=none; b=BbkbbU/Pl7JnhlbBMM5/JcMX7VkZC1/4vk6kdxFGaDTM7HNKqTnNGXXot+drionY4Us1ySfklRjbF6/dvXSOLeFwsWXc2nynEr6p/pvycMVp98xDYOzGRvxod7TzE3pQZfush7aB+MtZlk9rmhFCmx5TkQVP426t8wg+b576mOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767788542; c=relaxed/simple;
	bh=kdB+D8ooK5y+MGn4KMCXRzCE7BBpYAmF+6+mGhFmov0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PVqRamgQa/52cG5ToEHrLQoSIdOwsWIBmdoXIW7IEx6QQbKlF6jJil9cyUrD3Kuo9XxBUi0g+ytDtHClp0QkVxaEnbnv2HRLe4aEQsPHchmKiETp/PcFQecv0CXLxtfGgdevZQFcxQAOKrRsRYObuw+C2SzcMKFr2u8fzWe7pjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R4ud838R; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R4ud838R"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42fbc305552so1400323f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 07 Jan 2026 04:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767788538; x=1768393338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FKLGw9RhzY5YOkkhmRmhvQTx9xsA1wJogmSE46HH268=;
        b=R4ud838ReTtdL3jRI3wcuL8XKgEZ0M93KZcWiGkimDRBqSLq5nPwK8u/gHv/9FEc9i
         Tzxc5WdUYmlpofesl8hb6oMc4+Xnw3mq3F4YNAtOXLaJOgchazsrooMNX8JKYyCxL4U6
         hnAq99ns9ffa9C3sOSo7GRosJxyFKR11ctjMlK4LrvlQzynvpheonnoId5jfNY584KbL
         cmNzOPsmGqHH7BAcn0BEWFdPLir5EWHu6wSEr+H7thUSA1SNqMqvE2om/k+dEumpQdWm
         cjxjp4bOE3Xylwixbj6B+BTM3n8yVXxplOWdCkKVA4U+m4UhSsad9xOEfTVKojd8Y2fZ
         Zqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767788538; x=1768393338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FKLGw9RhzY5YOkkhmRmhvQTx9xsA1wJogmSE46HH268=;
        b=UF0JzwFPjy/zr4elMt367tqhxvBV+DwUY2ZXkms2CyiMgpUGwLjdOdU3+iraNTBbKP
         ojjGj4H8Bpdcyc0bTCN+CKzmBPlc+QO93epTv7VrcdEsMFzR++sJthnuXu8YbDgjM7Wa
         ExX3+niygFjDqH/G3ILaT6NjH+u0D707dgOcpx42fxdQmdNj858p4lgHJXzO5SsGyoA6
         z53yhuf/YootUeaiRLi8pcQPX3qvbHw2lCwGHJAEq0TTmimWewUS+T1MHNUdgAmJh5xG
         2l+bkK3tg+9HsNf/UMCXuVb+18gsALV3Oo0s3y7zrP/5Oqk7ko0THlx0+kMWu6rCPjfY
         2TKw==
X-Forwarded-Encrypted: i=1; AJvYcCWA+puQ1bglVknNtbQbbflK2kCYCzUfSES33E2iszeuALZi3iAp3wPH8Lcp7jLbupM/zLtsNE4dARg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVjQ5iz/OnjHnVt8fx+vzxy8YydFCoTR3Z2iSA3wDEYYXA9iNX
	ZlIV3DREJq07E84x5OQfI8cu/BetLyupHmc2YPA/ZbtKOFmS7rF0T6NJ
X-Gm-Gg: AY/fxX6CpSNlJrhxUFLnD234PokBcpWZXd0Mv7oO7XFBbvLI7+aEGL/UvwHLRnIXFG/
	x/WepgK7uIHt6pf5oGmnfDi8++yfA7YCD52kb4H9EQqYpOwuerlkACMJ+S+gdmOxEKOFJ9Z1E42
	XX/O1NjuTMDb0tKHVkpdDOIWngDzqojN3MQr0Dux3uaAXV1XSoNhLyrXnvXfuy0bdH4LmaEX9hy
	8swET0wF9U5J+vltq0dQT0PpLSpU0w3jo5d4672FdWj+Wk00mppI89Yrp3KIyoI2OfBUWuvOUDA
	OQlh9zjMnMNHSM3hI1R3ocJWQZ8g6DqepacbBK+iASeLmIHb8Z13A1i4ay/LyCZx9vLN6uPcpus
	epW39Ew80ijp+Asc2aRquPXZdWiB2u+GBRx+fK1B1P87xiCj9Au1wQyQ6TYDm8Wcn9MKE4qCCMo
	WkrdvEdq9hfVf8zQvL8zlY/3L2ULQN
X-Google-Smtp-Source: AGHT+IFDN//R8tPKMlA4XyPjKFG9gUgQwKQylfTdCf0jvQBBESf+sLesU0BxFAZFA45mSUh5AwD0QA==
X-Received: by 2002:a05:6000:1449:b0:431:6ba:38ac with SMTP id ffacd0b85a97d-432c374f131mr3053927f8f.4.1767788538368;
        Wed, 07 Jan 2026 04:22:18 -0800 (PST)
Received: from imac.lan ([2a02:8010:60a0:0:bc70:fb0c:12b6:3a41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e16f4sm10417107f8f.11.2026.01.07.04.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 04:22:17 -0800 (PST)
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
Subject: [PATCH net-next v1 13/13] tools: ynl-gen-c: Fix remaining pylint warnings
Date: Wed,  7 Jan 2026 12:21:43 +0000
Message-ID: <20260107122143.93810-14-donald.hunter@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107122143.93810-1-donald.hunter@gmail.com>
References: <20260107122143.93810-1-donald.hunter@gmail.com>
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
 tools/net/ynl/pyynl/ynl_gen_c.py | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/tools/net/ynl/pyynl/ynl_gen_c.py b/tools/net/ynl/pyynl/ynl_gen_c.py
index 5f079a74c8d1..c823ccf2b75c 100755
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
@@ -941,9 +943,8 @@ class TypeSubMessage(TypeNest):
         else:
             sel_var = f"{var}->{sel}"
         get_lines = [f'if (!{sel_var})',
-                     'return ynl_submsg_failed(yarg, "%s", "%s");' %
-                        (self.name, self['selector']),
-                    f"if ({self.nested_render_name}_parse(&parg, {sel_var}, attr))",
+                     f'return ynl_submsg_failed(yarg, "{self.name}", "{self['selector']}");',
+                     f"if ({self.nested_render_name}_parse(&parg, {sel_var}, attr))",
                      "return YNL_PARSE_CB_ERROR;"]
         init_lines = [f"parg.rsp_policy = &{self.nested_render_name}_nest;",
                       f"parg.data = &{var}->{self.c_name};"]
@@ -1447,7 +1448,7 @@ class Family(SpecFamily):
         attr_set_queue = list(self.root_sets.keys())
         attr_set_seen = set(self.root_sets.keys())
 
-        while len(attr_set_queue):
+        while attr_set_queue:
             a_set = attr_set_queue.pop(0)
             for attr, spec in self.attr_sets[a_set].items():
                 if 'nested-attributes' in spec:
@@ -1685,7 +1686,7 @@ class CodeWriter:
         if not self._overwrite and os.path.isfile(self._out_file):
             if filecmp.cmp(self._out.name, self._out_file, shallow=False):
                 return
-        with open(self._out_file, 'w+') as out_file:
+        with open(self._out_file, 'w+', encoding='utf-8') as out_file:
             self._out.seek(0)
             shutil.copyfileobj(self._out, out_file)
             self._out.close()
@@ -3443,7 +3444,7 @@ def main():
         print(exc)
         os.sys.exit(1)
 
-    cw = CodeWriter(BaseNlLib(), args.out_file, overwrite=(not args.cmp_out))
+    cw = CodeWriter(BaseNlLib(), args.out_file, overwrite=not args.cmp_out)
 
     _, spec_kernel = find_kernel_root(args.spec)
     if args.mode == 'uapi' or args.header:
-- 
2.52.0


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C415C1C860A;
	Sat, 22 Nov 2025 12:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763815087; cv=none; b=iVNDw0h7jD5uOS9YnjBj7L2MyL/Xw8KSXPNFKRPQtloh3tkLak5V7dtK7K8RwQ0k/ZtCJZn4mZXUhz/+oVguMzx5vawiALfW9RQSTj8sBPYC+Un0x7EVP4bTipoHnHxx6pU0/Bd6RzD1qSqJJGyc7gmL80R/6b6CvCiCDuvtQdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763815087; c=relaxed/simple;
	bh=TwvR1MbqOEr/NW02G9o73v7ORLVCV0/ulknx4UAlhb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lVt+I7uOL5ZB44NYSFbfGhwKPcpP+JlOwdqV1M/So3CBb3U3kTLCrFybZlDqRAD+3z3lkCkLdoWHoxeMqpn57dx6J8/M2aaRp1bt56bSKoS9FQ4GxdG4+yJDTFnuyqKSbcS8KVTiChQ5oxwjLPiOFfYAeWleldzuyC69F2h+SpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E+AWUPS1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E+AWUPS1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62448C4AF0B;
	Sat, 22 Nov 2025 12:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763815087;
	bh=TwvR1MbqOEr/NW02G9o73v7ORLVCV0/ulknx4UAlhb0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E+AWUPS1wGziNemDvPZjmKNauSGUQ3/KOrSSb1l+VVECKpUpu/eAN71sbW0BdxPkv
	 WFY0SjTK5qGLy48+16c2FBE1ZGi2WyRc9EdQaxf50Vu/PpiREB/xDgTqRHP6NsUhvS
	 6/6m0WAjd4bvglUePdcY91t99I0yuHDHf6uVmKPlgtwBBundmveL8OlY8tmwFzyz6Z
	 YfM6sTBm3RfSgiN0bey74N3H9iS0TmQFrOA+pj+1fsJ0Yl1+GBRAs/gDd3oCFnNOYX
	 SXypDhz9NwDnRjk6qwU0yxzyNZrGtGVo4gVq3poEE9XzIOtHKFjjKUavG9auOctQEA
	 sofz3cxlbEvaw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vMmsP-00000004pm9-2894;
	Sat, 22 Nov 2025 13:38:05 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>,
	"Randy Dunlap" <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/5] kernel-doc: add support to handle DEFINE_ variables
Date: Sat, 22 Nov 2025 13:37:56 +0100
Message-ID: <d9c37cf8595e2b39936d16a92103555251c6be2a.1763814816.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <cover.1763814816.git.mchehab+huawei@kernel.org>
References: <cover.1763814816.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Improve the parser and output plugin to work with macros,
adding support for the common pattern of using DEFINE_*
to create variables.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_output.py |  3 +--
 tools/lib/python/kdoc/kdoc_parser.py | 25 +++++++++++++++++++++----
 2 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_output.py b/tools/lib/python/kdoc/kdoc_output.py
index 8d811c2afaab..afb3f6d633fd 100644
--- a/tools/lib/python/kdoc/kdoc_output.py
+++ b/tools/lib/python/kdoc/kdoc_output.py
@@ -801,13 +801,12 @@ class ManFormat(OutputFormat):
 
     def out_var(self, fname, name, args):
         out_name = self.arg_name(args, name)
-        prototype = args.other_stuff["var_type"]
         full_proto = args.other_stuff["full_proto"]
 
         self.data += f'.TH "{self.modulename}" 9 "{out_name}" "{self.man_date}" "API Manual" LINUX' + "\n"
 
         self.data += ".SH NAME\n"
-        self.data += f"{prototype} \\- {args['purpose']}\n"
+        self.data += f"{name} \\- {args['purpose']}\n"
 
         self.data += ".SH SYNOPSIS\n"
         self.data += f"{full_proto}\n"
diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index edb0fb5330e0..a3cd1bb0c8e7 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -946,12 +946,27 @@ class KernelDoc:
         # Store the full prototype before modifying it
         #
         full_proto = proto
+        declaration_name = None
+
+        #
+        # Handle macro definitions
+        #
+        macro_prefixes = [
+            KernRe(r"DEFINE_[\w_]+\s*\(([\w_]+)\)"),
+        ]
+
+        for r in macro_prefixes:
+            match = r.search(proto)
+            if match:
+                declaration_name = match.group(1)
+                break
 
         #
         # Drop comments and macros to have a pure C prototype
         #
-        for search, sub in sub_prefixes:
-            proto = search.sub(sub, proto)
+        if not declaration_name:
+            for r, sub in sub_prefixes:
+                proto = r.sub(sub, proto)
 
         proto = proto.rstrip()
 
@@ -965,14 +980,16 @@ class KernelDoc:
            return
 
         var_type = r.group(0)
-        declaration_name = r.group(1)
+
+        if not declaration_name:
+            declaration_name = r.group(1)
+
         default_val = r.group(2)
         if default_val:
             default_val = default_val.lstrip("=").strip()
 
         self.output_declaration("var", declaration_name,
                                 full_proto=full_proto,
-                                var_type=var_type,
                                 default_val=default_val,
                                 purpose=self.entry.declaration_purpose)
 
-- 
2.51.1


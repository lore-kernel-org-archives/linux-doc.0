Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5B11A4F1B;
	Fri, 17 Jan 2025 17:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737136795; cv=none; b=gAtEVkNAC3OsGzimkcfrF/K6C+7uENgQCBvqQgiXABkFcO7N05eqixNPwJ5GMwpTP3+QFD95IdrwJHOTrWaVuKCqtlCdU9yQsUJn5BMz3kZPDh6I5zetl6dWCNQFmvs6TpvcN7hZHXQJQY9SCHKAN6HDtJBrulMfjmW9vr7MrHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737136795; c=relaxed/simple;
	bh=+YmkeryPo7zpEBCjbvnCQlJvDtm1i6rT9p93GfkJIBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MeFpcsGzZZDRnwvcgyY/F4Jr0PzQ15MCPN5kyEin+3rdRRkCMCjL5RCwjNLJMWGIJgYUDJSgKRlKQ5RLkXxCkTF3bpekiy9CtHj4J6apj0M0QXRURlU/PmqTwVD+jFuLSgQMJww40NJfvmCCGT8HX2vsNoW3UqDAIqYUuVcfmQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Denh7FDo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Denh7FDo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01B52C4CEE8;
	Fri, 17 Jan 2025 17:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737136795;
	bh=+YmkeryPo7zpEBCjbvnCQlJvDtm1i6rT9p93GfkJIBY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Denh7FDoSoB2/O/IS80vMtW7A9dNe39dXTFmAmV2shlGcFbngbaCHBSemgDoYeus1
	 h5W+TKshFK+RifywndujeulUbMKry4sIBdO4KamqI8IWcMG54i+I3oE1keBugJXlJ5
	 46W2pGHXAZJP6sMLu0K6u0NAYqrbeBKPfBZBogBVMur25jBWmz1UxL9V9MOU+Gu23i
	 oq+LJIyHY3H+MC+lqF7JOMOy3obK8+4p+nRc3s9HEx+rcyrDj9Xv5heDjGCJnrOFQv
	 9Wp7cnJwVFB68NpR69VuVepjNvKHGnSTkk1y5T0An0dQZp/eFX0bZVZbCYd54sUEMF
	 cF/V0hd31zCfw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tYqdM-00000006Ajz-2LRD;
	Fri, 17 Jan 2025 18:59:52 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC 08/10] [RFC] scripts/get_abi.py: add support for symbol search
Date: Fri, 17 Jan 2025 18:59:37 +0100
Message-ID: <954d0065a2a62ff36989d68ea2f86dd3800079aa.1737135484.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1737135484.git.mchehab+huawei@kernel.org>
References: <cover.1737135484.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Add support for searching an ABI symbol

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/get_abi.py | 73 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/scripts/get_abi.py b/scripts/get_abi.py
index 64a0ec8b1d89..6a461f7cef32 100755
--- a/scripts/get_abi.py
+++ b/scripts/get_abi.py
@@ -498,6 +498,56 @@ class AbiParser:
             self.log.warning("%s is defined %d times: %s",
                              what, len(f), "; ".join(f))
 
+    def search_symbols(self, expr):
+        """ Searches for ABI symbols """
+
+        regex = re.compile(expr, re.I)
+
+        found_keys = 0
+        for key, v in sorted(self.data.items(), key=lambda x: [0]):
+            wtype = v.get("type", "")
+            if wtype == "File":
+                continue
+
+            for what in v.get("what", [""]):
+                if regex.search(what):
+                    found_keys += 1
+
+                    kernelversion = v.get("kernelversion", "").strip(" \t\n")
+                    date = v.get("date", "").strip(" \t\n")
+                    contact = v.get("contact", "").strip(" \t\n")
+                    users = v.get("users", "").strip(" \t\n")
+                    desc = v.get("description", "").strip(" \t\n")
+
+                    files = []
+                    for f in v.get("file", ()):
+                        files.append(f[0])
+
+                    what = str(found_keys) + ". " + what
+                    bar = "-" * len(what)
+
+                    print(f"\n{what}\n{bar}\n")
+
+                    if kernelversion:
+                        print(f"Kernel version:\t\t{kernelversion}")
+
+                    if date:
+                        print(f"Date:\t\t\t{date}")
+
+                    if contact:
+                        print(f"Contact:\t\t{contact}")
+
+                    if users:
+                        print(f"Users:\t\t\t{users}")
+
+                    print(f"Defined on file{'s'[:len(files) ^ 1]}:\t{", ".join(files)}")
+
+                    if desc:
+                        print(f"\n{desc.strip("\n")}\n")
+
+        if not found_keys:
+            print(f"Regular expression /{expr}/ not found.")
+
 
 class AbiRest:
     """Initialize an argparse subparser for rest output"""
@@ -546,6 +596,28 @@ class AbiValidate:
         args.parser.check_issues()
 
 
+class AbiSearch:
+    """Initialize an argparse subparser for ABI search"""
+
+    def __init__(self, subparsers):
+        """Initialize argparse subparsers"""
+
+        parser = subparsers.add_parser("search",
+                                       formatter_class=argparse.ArgumentDefaultsHelpFormatter,
+                                       description="Search ABI using a regular expression")
+
+        parser.add_argument("expression",
+                            help="Case-insensitive search pattern for the ABI symbol")
+
+        parser.set_defaults(func=self.run)
+
+    def run(self, args):
+        """Run subparser"""
+
+        args.parser.parse_abi()
+        args.parser.search_symbols(args.expression)
+
+
 def main():
     """Main program"""
 
@@ -560,6 +632,7 @@ def main():
 
     AbiRest(subparsers)
     AbiValidate(subparsers)
+    AbiSearch(subparsers)
 
     args = parser.parse_args()
 
-- 
2.47.1


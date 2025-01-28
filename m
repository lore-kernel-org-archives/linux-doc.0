Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7DB79D0;
	Tue, 28 Jan 2025 00:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738022796; cv=none; b=SuzNxhpJS4Rj89k11juvHL78eQkuN1CUYj48sh/nwNp1QzBcLwEC8JSO6klxOimCZgE1cC0UacH1jKWA4XKaJEMOS4rDCyXCPUDYwQrhYWrZPflbGi8jQSOp3Bt0IV7xY0YXUoPXYyIKNKFrQ3rIFvicyFNTb3lvxrZGS0EvCDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738022796; c=relaxed/simple;
	bh=UOsqY8X3zaohCbbi+hx08sgCGh+ofd1iPDOFpm4qdJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CysB+cDqbDO1hkMFjbKGBYhN8TF95DWGezPU+LTC37UQ4GAEKE65bpMTQW64zpel9CRYSRNiwqaaO79BrMp//gNnSpsI9KPPYuRX6Njj7TJxbHXSbNXiL1uKPscJJpJaOoUfvMq2rJQntcymeQKHfgGrDSwsJl7qmZ99cdsPiqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HX+Tpw5x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HX+Tpw5x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C001BC4CEEF;
	Tue, 28 Jan 2025 00:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738022795;
	bh=UOsqY8X3zaohCbbi+hx08sgCGh+ofd1iPDOFpm4qdJk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HX+Tpw5x4nXgeMGfx2tm3Bf4lJWQXoSFm8anHS2ezq7XUGzxlremWmW6XR/c3DoRf
	 UB+oZRiQ5fWdyLFUK0u+ZUf52MoJchBJs9XEpOJTC1/qSNJNKZsM05HAt0uFWcRnX8
	 bJre4EPbA9vNIBjnXCdJJ1cEiFH8h3COn1YeHLNRT8LoYgTecBe8N+/poa5QuGRErx
	 a0V4JcRDmmiOmGoITso0mh8TH+9B2y+WGVSvSxSxniEnuK5GOYLSdiTSEK+IDfwEUK
	 bEHYo7ip5wKgcTMWwY2lBW/7QUm708w8LT+pfsVPT+rPI8Xr6nnSAmEQBMYaBEzwUq
	 dKBEgZuRZMxHg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tcZ7h-0000000DRLH-3yUz;
	Tue, 28 Jan 2025 01:06:33 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [RFC v2 14/38] scripts/get_abi.py: add support for symbol search
Date: Tue, 28 Jan 2025 01:06:03 +0100
Message-ID: <ccddc50da7e56d3262d4e64d5e8db093e0127a14.1738020236.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738020236.git.mchehab+huawei@kernel.org>
References: <cover.1738020236.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Add support for searching symbols from Documentation/ABI using
regular expressions to match the symbols' names.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/get_abi.py | 76 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/scripts/get_abi.py b/scripts/get_abi.py
index 0b5a10e76a3c..93a23cf30ea1 100755
--- a/scripts/get_abi.py
+++ b/scripts/get_abi.py
@@ -525,6 +525,58 @@ class AbiParser:
 
             self.log.warning("%s is defined %d times: %s", what, len(f), "; ".join(f))
 
+    def search_symbols(self, expr):
+        """ Searches for ABI symbols """
+
+        regex = re.compile(expr, re.I)
+
+        found_keys = 0
+        for t in sorted(self.data.items(), key=lambda x: [0]):
+            v = t[1]
+
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
+                    title_tag = "-" * len(what)
+
+                    print(f"\n{what}\n{title_tag}\n")
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
@@ -577,6 +629,29 @@ class AbiValidate:
         parser.check_issues()
 
 
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
+        parser = AbiParser(args.dir, debug=args.debug)
+        parser.parse_abi()
+        parser.search_symbols(args.expression)
+
+
 def main():
     """Main program"""
 
@@ -589,6 +664,7 @@ def main():
 
     AbiRest(subparsers)
     AbiValidate(subparsers)
+    AbiSearch(subparsers)
 
     args = parser.parse_args()
 
-- 
2.48.1


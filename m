Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2DE125DF;
	Tue, 28 Jan 2025 00:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738022797; cv=none; b=ksFWmxQ6zJgfuEqxRJ/gXTcjwent5XSiYTByQ4lL+BMRnz5gM7GIOQyggfXkZQyW+scfC5ZFATD8JIdaAYEr84WLLCdYWIANBj3MV/Iy81nFwUTdc6iOZkykbtBYANYlPa5JFTW7DxmFxCIl7eQq6CjxCZFQIX+6hA2nYoGBAKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738022797; c=relaxed/simple;
	bh=SzTGx5/sOV13eTwJaBN4/jb4Imr5I3tKH5BWnaIinIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u80fkXOtbJ5xSn65e/X8fmt7GaXoZKJ5LLwjq116+LjCH8cS6CK36WK7781XXRIyp1sZ89Jepdc0XFSJPw6e7mTG9K0uuwg3wyg7re4hs7zGSIBuY0rIwbCxwM0C+TxmKyK9hfye47hPI+VLo0eK487gWb5DRKI5xtoK5PxKZpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QBflgNJo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QBflgNJo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3519C4AF11;
	Tue, 28 Jan 2025 00:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738022796;
	bh=SzTGx5/sOV13eTwJaBN4/jb4Imr5I3tKH5BWnaIinIk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QBflgNJoWUrhuHUv2Ijw4448VfYp2VM1sI8IsVxffsPHxHhLonqtrMNydrukfxdqb
	 OxxI3DGcUAPDgs99/ldM3UcuGmCTTZocK/gqwwNiqFaUfJBb/ttdnel8WNOahazm/V
	 ND5O6IuXoYOEx75LMYOnRc99kArYfwdKPQO4jPobgm8bZz2R669K01QBQQF9rXfT14
	 Svxy5Npdo2alcmIaw7rFACaFxk5yQf23suNab877J/0a8z/bDVlgNqke2eWmD53UVh
	 6C2YPK5p37k6gI4rysPAemCt3A6l9qk8viVFTEQ7w7cFgclIcyWgdyB4gEKohTRagB
	 A73Mp+2LYhZSw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tcZ7i-0000000DRLj-0Ybc;
	Tue, 28 Jan 2025 01:06:34 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [RFC v2 21/38] scripts/get_abi.pl: Add filtering capabilities to rest output
Date: Tue, 28 Jan 2025 01:06:10 +0100
Message-ID: <30be453db4fbad9cb2d21c3ad9fde5c7a1fb838b.1738020236.git.mchehab+huawei@kernel.org>
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

This way, Sphinx ABI extension can parse symbols only once, while
keep displaying results in separate files.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/get_abi.py | 34 ++++++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/scripts/get_abi.py b/scripts/get_abi.py
index b57f46b91828..6d7fa8fbca34 100755
--- a/scripts/get_abi.py
+++ b/scripts/get_abi.py
@@ -173,6 +173,7 @@ class AbiParser:
                         self.data[fdata.key] = {
                             "what": [content],
                             "file": [fdata.file_ref],
+                            "path": fdata.ftype,
                             "line_no": fdata.ln,
                         }
 
@@ -195,8 +196,6 @@ class AbiParser:
                 if new_what:
                     fdata.label = ""
 
-                    self.data[fdata.key]["type"] = fdata.ftype
-
                     if "description" in self.data[fdata.key]:
                         self.data[fdata.key]["description"] += "\n\n"
 
@@ -312,6 +311,7 @@ class AbiParser:
         fdata.nametag = {}
         fdata.nametag["what"] = [f"File {path}/{basename}"]
         fdata.nametag["type"] = "File"
+        fdata.nametag["path"] = fdata.ftype
         fdata.nametag["file"] = [fdata.file_ref]
         fdata.nametag["line_no"] = 1
         fdata.nametag["description"] = ""
@@ -441,7 +441,8 @@ class AbiParser:
 
         return new_desc + "\n\n"
 
-    def doc(self, output_in_txt=False, show_file=True):
+    def doc(self, output_in_txt=False, show_symbols=True, show_file=True,
+            filter_path=None):
         """Print ABI at stdout"""
 
         part = None
@@ -449,12 +450,20 @@ class AbiParser:
                              key=lambda x: (x[1].get("type", ""),
                                             x[1].get("what"))):
 
-            wtype = v.get("type", "Var")
+            wtype = v.get("type", "Symbol")
             file_ref = v.get("file")
             names = v.get("what", [""])
 
-            if not show_file and wtype == "File":
-                continue
+            if wtype == "File":
+                if not show_file:
+                    continue
+            else:
+                if not show_symbols:
+                    continue
+
+            if filter_path:
+                if v.get("path") != filter_path:
+                    continue
 
             msg = ""
 
@@ -616,7 +625,11 @@ class AbiRest:
                                  "It not used, output will contain dynamically"
                                  " generated cross references when possible.")
         parser.add_argument("--no-file", action="store_true",
-                            help="Don't the files section")
+                            help="Don't show files section")
+        parser.add_argument("--no-symbols", action="store_true",
+                            help="Don't show symbols section")
+        parser.add_argument("--filter",
+                            help="Filter a section of ABI (e..g stable, testing, obsolete, removed)")
         parser.add_argument("--show-hints", help="Show-hints")
 
         parser.set_defaults(func=self.run)
@@ -628,7 +641,12 @@ class AbiRest:
         parser.parse_abi()
         parser.check_issues()
 
-        for t in parser.doc(args.raw, not args.no_file):
+        for t in parser.doc(args.raw, show_file=not args.no_file,
+                            show_symbols=not args.no_symbols,
+                            filter_path=args.filter):
+
+            # As line number is returned at the tuple, artifically place
+            # them as a comment tag if one wants to debug troubles there
             if args.enable_lineno:
                 print (f".. LINENO {t[1]}#{t[2]}\n\n")
 
-- 
2.48.1


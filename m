Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C53D273F9;
	Tue, 28 Jan 2025 00:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738022797; cv=none; b=YstaKXCEQCOFaN3sUeIqTrsuOGleDyyGJz/pUG+PMkWnkCLR7bQmNEwZHMXAKUyhlgm5HgcgBlYUkhDDot8q6z84MUmjJzBIIs3vLrDEE6qd6O5A4Ury0CWp7dARtuoPqZ49eCicAYvqK1N6ioQWj2l8TZ4s+ZUktWqnY4zpJes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738022797; c=relaxed/simple;
	bh=1eS0ENZhyS5NgGwt57b7o8bqQ+da8byhs9yHPVKsnog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kIZJ5s/L0VVTZgaSS8tkloxGn9+0DD9rkfCmd6pJKNkIAGDC9dm5HiB3HJnoQcJxTWeDESi8s6yupmvIBbwWLe9k5RmQgzxXfA9NSSAewERyzYL8OtTLkNFACKJP584xM+Wl7gDcf2egdkt+/XhifpXn1X91F6VS5SFRBykoqt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=plexcGaF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="plexcGaF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2E21C4CEFD;
	Tue, 28 Jan 2025 00:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738022796;
	bh=1eS0ENZhyS5NgGwt57b7o8bqQ+da8byhs9yHPVKsnog=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=plexcGaFVSwfy7BhB/x//HcKHsPg94lIY0HZOOKZoYCMt99hwQVqQ3H703OKcL9QM
	 k9eyIEjIgpkwGg4boxn4rQYCMrbqoOYxx3Y48TncY5DnQ/YNbgY7OLsevjg0int4WZ
	 RhJjuameSzxtJlfokKKe4HG7+sPjJT88bWk/mHMj4Vsf4BGfWldgDUuUTft+krqOVV
	 XZ3pgkUsufiH8sQVVy0stWeSx66rsAVVzCLlhwmByk007W712NWtk8tRxVO694E+lt
	 mJaRFIHlJ4piukHEmnvgc8haQlADs3lBKlgcdUxkJGsMTRXmdtGQYHaGD5CmzW/ctQ
	 jTdRw7qQCs9UQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tcZ7i-0000000DRLr-0m6X;
	Tue, 28 Jan 2025 01:06:34 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [RFC v2 23/38] docs: sphinx/kernel_abi: parse ABI files only once
Date: Tue, 28 Jan 2025 01:06:12 +0100
Message-ID: <52b1fc2f56d6a2eee0d8da2ec08e133de8207402.1738020236.git.mchehab+huawei@kernel.org>
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

Right now, the logic parses ABI files on 4 steps, one for each
directory. While this is fine in principle, by doing that, not
all symbol cross-references will be created.

Change the logic to do the parsing only once in order to get
a global dictionary to be used when creating ABI cross-references.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/abi-obsolete.rst |   2 +-
 Documentation/admin-guide/abi-removed.rst  |   2 +-
 Documentation/admin-guide/abi-stable.rst   |   2 +-
 Documentation/admin-guide/abi-testing.rst  |   2 +-
 Documentation/sphinx/kernel_abi.py         | 115 ++++++++++++---------
 scripts/get_abi.py                         |  22 ++--
 6 files changed, 81 insertions(+), 64 deletions(-)

diff --git a/Documentation/admin-guide/abi-obsolete.rst b/Documentation/admin-guide/abi-obsolete.rst
index 6d4d9ab7b8c3..bdef91d2cea4 100644
--- a/Documentation/admin-guide/abi-obsolete.rst
+++ b/Documentation/admin-guide/abi-obsolete.rst
@@ -9,4 +9,4 @@ marked to be removed at some later point in time.
 The description of the interface will document the reason why it is
 obsolete and when it can be expected to be removed.
 
-.. kernel-abi:: ABI/obsolete
+.. kernel-abi:: obsolete
diff --git a/Documentation/admin-guide/abi-removed.rst b/Documentation/admin-guide/abi-removed.rst
index 9fc78af6f077..bea0608b8442 100644
--- a/Documentation/admin-guide/abi-removed.rst
+++ b/Documentation/admin-guide/abi-removed.rst
@@ -3,4 +3,4 @@
 ABI removed symbols
 ===================
 
-.. kernel-abi:: ABI/removed
+.. kernel-abi:: removed
diff --git a/Documentation/admin-guide/abi-stable.rst b/Documentation/admin-guide/abi-stable.rst
index c47c2a295865..33637c0d4fd5 100644
--- a/Documentation/admin-guide/abi-stable.rst
+++ b/Documentation/admin-guide/abi-stable.rst
@@ -12,4 +12,4 @@ for at least 2 years.
 Most interfaces (like syscalls) are expected to never change and always
 be available.
 
-.. kernel-abi:: ABI/stable
+.. kernel-abi:: stable
diff --git a/Documentation/admin-guide/abi-testing.rst b/Documentation/admin-guide/abi-testing.rst
index 40b31985e587..55054985a8ff 100644
--- a/Documentation/admin-guide/abi-testing.rst
+++ b/Documentation/admin-guide/abi-testing.rst
@@ -18,4 +18,4 @@ Programs that use these interfaces are strongly encouraged to add their
 name to the description of these interfaces, so that the kernel
 developers can easily notify them if any changes occur.
 
-.. kernel-abi:: ABI/testing
+.. kernel-abi:: testing
diff --git a/Documentation/sphinx/kernel_abi.py b/Documentation/sphinx/kernel_abi.py
index 2408ba7a3981..6d1b34e44d46 100644
--- a/Documentation/sphinx/kernel_abi.py
+++ b/Documentation/sphinx/kernel_abi.py
@@ -49,6 +49,13 @@ from get_abi import AbiParser
 
 __version__ = "1.0"
 
+logger = logging.getLogger('kernel_abi')
+path = os.path.join(srctree, "Documentation/ABI")
+
+# Parse ABI symbols only once
+kernel_abi = AbiParser(path, logger=logger)
+kernel_abi.parse_abi()
+kernel_abi.check_issues()
 
 def setup(app):
 
@@ -64,14 +71,15 @@ class KernelCmd(Directive):
     u"""KernelABI (``kernel-abi``) directive"""
 
     required_arguments = 1
-    optional_arguments = 2
+    optional_arguments = 3
     has_content = False
     final_argument_whitespace = True
-    logger = logging.getLogger('kernel_abi')
     parser = None
 
     option_spec = {
         "debug": directives.flag,
+        "no-symbols": directives.flag,
+        "no-files":  directives.flag,
     }
 
     def run(self):
@@ -79,62 +87,67 @@ class KernelCmd(Directive):
         if not doc.settings.file_insertion_enabled:
             raise self.warning("docutils: file insertion disabled")
 
-        path = os.path.join(srctree, "Documentation", self.arguments[0])
-        self.parser = AbiParser(path, logger=self.logger)
-        self.parser.parse_abi()
-        self.parser.check_issues()
-
-        node = self.nested_parse(None, self.arguments[0])
-        return node
-
-    def nested_parse(self, data, fname):
         env = self.state.document.settings.env
         content = ViewList()
         node = nodes.section()
 
-        if data is not None:
-            # Handles the .rst file
-            for line in data.split("\n"):
-                content.append(line, fname, 0)
+        abi_type = self.arguments[0]
 
-            self.do_parse(content, node)
+        if "no-symbols" in self.options:
+            show_symbols = False
+        else:
+            show_symbols = True
 
+        if "no-files" in self.options:
+            show_file = False
+        else:
+            show_file = True
+
+        tab_width = self.options.get('tab-width',
+                                     self.state.document.settings.tab_width)
+
+        old_f = None
+        n = 0
+        n_sym = 0
+        for msg, f, ln in kernel_abi.doc(show_file=show_file,
+                                            show_symbols=show_symbols,
+                                            filter_path=abi_type):
+            n_sym += 1
+            msg_list = statemachine.string2lines(msg, tab_width,
+                                                 convert_whitespace=True)
+            if "debug" in self.options:
+                lines = [
+                    "", "",  ".. code-block:: rst",
+                    "    :linenos:", ""
+                ]
+                for m in msg_list:
+                    lines.append("    " + m)
+            else:
+                lines = msg_list
+
+            for line in lines:
+                # sphinx counts lines from 0
+                content.append(line, f, ln - 1)
+                n += 1
+
+            if f != old_f:
+                # Add the file to Sphinx build dependencies
+                env.note_dependency(os.path.abspath(f))
+
+                old_f = f
+
+            # Sphinx doesn't like to parse big messages. So, let's
+            # add content symbol by symbol
+            if content:
+                self.do_parse(content, node)
+                content = ViewList()
+
+        if show_symbols and not show_file:
+            logger.verbose("%s ABI: %i symbols (%i ReST lines)" % (abi_type, n_sym, n))
+        elif not show_symbols and show_file:
+            logger.verbose("%s ABI: %i files (%i ReST lines)" % (abi_type, n_sym, n))
         else:
-            # Handles the ABI parser content, symbol by symbol
-
-            old_f = fname
-            n = 0
-            for msg, f, ln in self.parser.doc():
-                msg_list = statemachine.string2lines(msg, tab_width,
-                                                     convert_whitespace=True)
-                if "debug" in self.options:
-                    lines = [
-                        "", "",  ".. code-block:: rst",
-                        "    :linenos:", ""
-                    ]
-                    for m in msg_list:
-                        lines.append("    " + m)
-                else:
-                    lines = msg_list
-
-                for line in lines:
-                    # sphinx counts lines from 0
-                    content.append(line, f, ln - 1)
-                    n += 1
-
-                if f != old_f:
-                    # Add the file to Sphinx build dependencies
-                    env.note_dependency(os.path.abspath(f))
-
-                    old_f = f
-
-                # Sphinx doesn't like to parse big messages. So, let's
-                # add content symbol by symbol
-                if content:
-                    self.do_parse(content, node)
-                    content = ViewList()
-
-            self.logger.info("%s: parsed %i lines" % (fname, n))
+            logger.verbose("%s ABI: %i data (%i ReST lines)" % (abi_type, n_sym, n))
 
         return node.children
 
diff --git a/scripts/get_abi.py b/scripts/get_abi.py
index 3cde278b8e4c..7435ed1071b8 100755
--- a/scripts/get_abi.py
+++ b/scripts/get_abi.py
@@ -279,12 +279,20 @@ class AbiParser:
     def parse_readme(self, nametag, fname):
         """Parse ABI README file"""
 
+        nametag["what"] = ["ABI file contents"]
+        nametag["path"] = "README"
         with open(fname, "r", encoding="utf8", errors="backslashreplace") as fp:
-            nametag["description"] = "```\n"
             for line in fp:
-                nametag["description"] += "  " + line
+                match = self.re_tag.match(line)
+                if match:
+                    new = match.group(1).lower()
 
-            nametag["description"] += "```\n"
+                    match = self.re_valid.search(new)
+                    if match:
+                        nametag["description"] += "\n:" + line
+                        continue
+
+                nametag["description"] += line
 
     def parse_file(self, fname, path, basename):
         """Parse a single file"""
@@ -473,12 +481,8 @@ class AbiParser:
                     continue
 
             if filter_path:
-                if filter_path == "README":
-                    if not names[0].endswith("README"):
-                        continue
-                else:
-                    if v.get("path") != filter_path:
-                        continue
+                if v.get("path") != filter_path:
+                    continue
 
             msg = ""
 
-- 
2.48.1


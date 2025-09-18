Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEAE30171F;
	Thu, 18 Sep 2025 11:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758196506; cv=none; b=B7IWOl8NSQQ0pb6aWe7/fd7UBFyGUzhQ1lQzxF5xI/3iyGqxusm5ObfWa8vS45Po0trGcJFDRoxc+PwzMgnPl3RiIsu8hGg+lLCCVs8eOhojAp9VNwh8vKRba2Q+ky82JcucDn9T13y51ouN52PgvTevqPA+q1FVlr8Gq3rImwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758196506; c=relaxed/simple;
	bh=+6TvP4G2cDhLKPN/soKTsxtFrnu65L1eQKi7+8h+GhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tghorNZS5TtsYa2uqb39c7xEaZZ1yqfOvXxbmZ+AXYywOFjH+rKgOAyQ/Eh1veB0bXXEHsJzTKglMNq6gB4Zx5uPtTXx8/BXfOc+zqXWYMT3i06wK/4X7JYxLJ9sT7B6AUf6i6AL5FD3NAqSh2RLtDzcbsLGu6gfPNZ3hQb27Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QP/GE0vO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QP/GE0vO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B4FCC4CEFD;
	Thu, 18 Sep 2025 11:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758196506;
	bh=+6TvP4G2cDhLKPN/soKTsxtFrnu65L1eQKi7+8h+GhI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QP/GE0vO33UptbFtdEio/BtO+A2ZJhZRr1H9NpwYJCL6AmTlzSN2Ual6rBgY+LOug
	 HnhDIKof1ZN9d9RERzKsLVDOUwotjPuaFUMfLTnnsQdktDQW1hdSfmGrfuQVynjSqE
	 SCsFqq04O7QMhOtzyK5t16Mctlz+uWRQvxAYG/xkw7afjeRRPdVgZtdTJD3aenx3Eo
	 Y0SWhPt5r2HR2UYWDIE6qme+43m9MbM9W76jyfWcMedeejjCRKLbGZ0SfxTOHDayuf
	 bKOZ+fVCJd/o0NdvlxhnLFmsTdPV/SkYiGOe5R6yGRHPFaRrn8IjA0rr7wGZrpMRDJ
	 YWYep7WWyOA6w==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uzDE7-0000000CrpA-45Pe;
	Thu, 18 Sep 2025 13:55:03 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 09/24] tools/docs: sphinx-pre-install: allow check for alternatives and bail out
Date: Thu, 18 Sep 2025 13:54:43 +0200
Message-ID: <19777bc710bf901ffbb0ad0f1bb57b18fc01b163.1758196090.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758196090.git.mchehab+huawei@kernel.org>
References: <cover.1758196090.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The caller script may not want an automatic execution of the new
version. Add two parameters to allow showing alternatives and to
bail out if version is incompatible.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/docs/sphinx-pre-install | 48 +++++++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 10 deletions(-)

diff --git a/tools/docs/sphinx-pre-install b/tools/docs/sphinx-pre-install
index fa12e01fc7fe..895220c6d4f8 100755
--- a/tools/docs/sphinx-pre-install
+++ b/tools/docs/sphinx-pre-install
@@ -254,7 +254,7 @@ class AncillaryMethods:
         return (0, 0, 0)
 
     @staticmethod
-    def find_python():
+    def find_python(min_version):
         """
         Detect if are out there any python 3.xy version newer than the
         current one.
@@ -263,21 +263,25 @@ class AncillaryMethods:
         may need to update it one day, hopefully on a distant future.
         """
         patterns = [
-            "python3.[0-9]",
             "python3.[0-9][0-9]",
+            "python3.[0-9]",
         ]
 
         # Seek for a python binary newer than MIN_PYTHON_VERSION
+        python_cmd = []
         for path in os.getenv("PATH", "").split(":"):
             for pattern in patterns:
                 for cmd in glob(os.path.join(path, pattern)):
                     if os.path.isfile(cmd) and os.access(cmd, os.X_OK):
                         version = SphinxDependencyChecker.get_python_version(cmd)
-                        if version >= MIN_PYTHON_VERSION:
-                            return cmd
+                        if version >= min_version:
+                            python_cmd.append((version, cmd))
+
+        return sorted(python_cmd, reverse=True)
 
     @staticmethod
-    def check_python():
+    def check_python(min_version, show_alternatives=False, bail_out=False,
+                     success_on_error=False):
         """
         Check if the current python binary satisfies our minimal requirement
         for Sphinx build. If not, re-run with a newer version if found.
@@ -301,18 +305,42 @@ class AncillaryMethods:
 
         python_ver = ver_str(cur_ver)
 
-        new_python_cmd = SphinxDependencyChecker.find_python()
-        if not new_python_cmd:
+        available_versions = SphinxDependencyChecker.find_python(min_version)
+        if not available_versions:
             print(f"ERROR: Python version {python_ver} is not spported anymore\n")
             print("       Can't find a new version. This script may fail")
             return
 
-        # Restart script using the newer version
         script_path = os.path.abspath(sys.argv[0])
-        args = [new_python_cmd, script_path] + sys.argv[1:]
+
+        # Check possible alternatives
+        if available_versions:
+            new_python_cmd = available_versions[0][1]
+        else:
+            new_python_cmd = None
+
+        if show_alternatives:
+            print("You could run, instead:")
+            for _, cmd in available_versions:
+                args = [cmd, script_path] + sys.argv[1:]
+
+                cmd_str = " ".join(args)
+                print(f"  {cmd_str}")
+            print()
+
+        if bail_out:
+            msg = f"Python {python_ver} not supported. Bailing out"
+            if success_on_error:
+                print(msg, file=sys.stderr)
+                sys.exit(0)
+            else:
+                sys.exit(msg)
 
         print(f"Python {python_ver} not supported. Changing to {new_python_cmd}")
 
+        # Restart script using the newer version
+        args = [new_python_cmd, script_path] + sys.argv[1:]
+
         try:
             os.execv(new_python_cmd, args)
         except OSError as e:
@@ -1612,7 +1640,7 @@ def main():
 
     checker = SphinxDependencyChecker(args)
 
-    checker.check_python()
+    checker.check_python(MIN_PYTHON_VERSION)
     checker.check_needs()
 
 # Call main if not used as module
-- 
2.51.0


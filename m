Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726A9364E88;
	Thu, 26 Mar 2026 19:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774552188; cv=none; b=Fs9fujT48Yitjr974DaWGgA25W/kAEv/F/wDVnUXb/94M0L5rAhw3Nl9iyCi6+GFjm++ByYZOOsUnaZZgN/JWTIEH67ySTBHdcxQuO2YRUDL/g10BRKVQUlptVhvLtQRVsFLgX/0zt1BQFV1sjkv9SyTTFLjiJc4tHmVhOAVqJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774552188; c=relaxed/simple;
	bh=vgoF3lTenRbRS/o8zK2i6ASV0ovH4IdXADFxqkiSCAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pt+JaHJyt1Y8IbE6fu/oeK6X6H0KgQ0UTezNmETtyk4sdETG2z5m6rZ1YmRUzq6i9LL7csaHJ5Ude7zkGwnqI7iQ1UG9x6hveWSDqcDmcIaLIHJdUhTCFlCQqsls1VLR0u43BYBacZRnX+0nS+h1sP815K2TSy0VX5r04+GdktM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fdFrnFI7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fdFrnFI7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0082BC2BCB1;
	Thu, 26 Mar 2026 19:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774552188;
	bh=vgoF3lTenRbRS/o8zK2i6ASV0ovH4IdXADFxqkiSCAM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fdFrnFI7PnpriWJXlAaVo7tX2TAqs7yz6sOoAHxI37ktwHFS98y45z0k+w9sUJ5u8
	 aTp0ghBWvSVWy7G3+PRyGhQetXqaO/juNhzJ6Vl7TW7XL0KTI5C/129wrFN2ZHjHuh
	 Nk/BBlH0IpnCc1U1yl/iiVlf/alo+HIVIybc+rc9CdBJ4l+X+zvRKwTW3ENWTJuIIa
	 2h8eALKdr9xjPTAYGWXKFJLDnCsJ7ZV+Af/LyPV+0QdJZtHBg0zvI6yTjSvpGEUqs8
	 +TYmPuhg5+y4hKzNyK8soUCrFoYOePPE6itthCo/fBe14Znodla++brk5FqLEQPbqB
	 axJmu/8P1TGVw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w5q5R-0000000BH8S-41AY;
	Thu, 26 Mar 2026 20:09:45 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2 2/2] docs: kdoc_diff: add a helper tool to help checking kdoc regressions
Date: Thu, 26 Mar 2026 20:09:43 +0100
Message-ID: <24b3116a78348b13a74d1ff5e141160ef9705dd3.1774551940.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1774551940.git.mchehab+huawei@kernel.org>
References: <cover.1774551940.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Checking for regressions at kernel-doc can be hard. Add a helper
tool to make such task easier.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/docs/kdoc_diff | 508 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 508 insertions(+)
 create mode 100755 tools/docs/kdoc_diff

diff --git a/tools/docs/kdoc_diff b/tools/docs/kdoc_diff
new file mode 100755
index 000000000000..1aa16bdccaa3
--- /dev/null
+++ b/tools/docs/kdoc_diff
@@ -0,0 +1,508 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+# Copyright(c) 2026: Mauro Carvalho Chehab <mchehab@kernel.org>.
+#
+# pylint: disable=R0903,R0912,R0913,R0914,R0915,R0917
+
+"""
+docdiff - Check differences between kernel‑doc output between two different
+commits.
+
+Examples
+--------
+
+Compare the kernel‑doc output between the last two 5.15 releases::
+
+    $ kdoc_diff v6.18..v6.19
+
+Both outputs are cached
+
+Force a complete documentation scan and clean any previous cache from
+6.19 to the current HEAD::
+
+    $ kdoc_diff 6.19.. --full --clean
+
+Check differences only on a single driver since origin/main::
+
+    $ kdoc_diff origin/main drivers/media
+
+Generate an YAML file and use it to check for regressions::
+
+    $ kdoc_diff HEAD~ drivers/media --regression
+
+
+"""
+
+import os
+import sys
+import argparse
+import subprocess
+import shutil
+import re
+import signal
+
+from glob import iglob
+
+
+SRC_DIR = os.path.dirname(os.path.realpath(__file__))
+WORK_DIR = os.path.abspath(os.path.join(SRC_DIR, "../.."))
+
+KDOC_BINARY = os.path.join(SRC_DIR, "kernel-doc")
+KDOC_PARSER_TEST = os.path.join(WORK_DIR, "tools/unittests/test_kdoc_parser.py")
+
+CACHE_DIR = ".doc_diff_cache"
+YAML_NAME = "out.yaml"
+
+DIR_NAME = {
+    "full": os.path.join(CACHE_DIR, "full"),
+    "partial": os.path.join(CACHE_DIR, "partial"),
+    "no-cache": os.path.join(CACHE_DIR, "no_cache"),
+    "tmp": os.path.join(CACHE_DIR, "__tmp__"),
+}
+
+class GitHelper:
+    """Handles all Git operations"""
+
+    def __init__(self, work_dir=None):
+        self.work_dir = work_dir
+
+    def is_inside_repository(self):
+        """Check if we're inside a Git repository"""
+        try:
+            output = subprocess.check_output(["git", "rev-parse",
+                                              "--is-inside-work-tree"],
+                                             cwd=self.work_dir,
+                                             stderr=subprocess.STDOUT,
+                                             universal_newlines=True)
+
+            return output.strip() == "true"
+        except subprocess.CalledProcessError:
+            return False
+
+    def is_valid_commit(self, commit_hash):
+        """
+        Validate that a ref (branch, tag, commit hash, etc.) can be
+        resolved to a commit.
+        """
+        try:
+            subprocess.check_output(["git", "rev-parse", commit_hash],
+                                    cwd=self.work_dir,
+                                    stderr=subprocess.STDOUT)
+            return True
+        except subprocess.CalledProcessError:
+            return False
+
+    def get_short_hash(self, commit_hash):
+        """Get short commit hash"""
+        try:
+            return subprocess.check_output(["git", "rev-parse", "--short",
+                                            commit_hash],
+                                           cwd=self.work_dir,
+                                           stderr=subprocess.STDOUT,
+                                           universal_newlines=True).strip()
+        except subprocess.CalledProcessError:
+            return ""
+
+    def has_uncommitted_changes(self):
+        """Check for uncommitted changes"""
+        try:
+            subprocess.check_output(["git", "diff-index",
+                                     "--quiet", "HEAD", "--"],
+                                    cwd=self.work_dir,
+                                    stderr=subprocess.STDOUT)
+            return False
+        except subprocess.CalledProcessError:
+            return True
+
+    def get_current_branch(self):
+        """Get current branch name"""
+        return subprocess.check_output(["git", "branch", "--show-current"],
+                                        cwd=self.work_dir,
+                                        universal_newlines=True).strip()
+
+    def checkout_commit(self, commit_hash, quiet=True):
+        """Checkout a commit safely"""
+        args = ["git", "checkout", "-f"]
+        if quiet:
+            args.append("-q")
+        args.append(commit_hash)
+        try:
+            subprocess.check_output(args, cwd=self.work_dir,
+                                    stderr=subprocess.STDOUT)
+
+            # Double-check if branch actually switched
+            branch = self.get_short_hash("HEAD")
+            if commit_hash != branch:
+                raise RuntimeError(f"Branch changed to '{branch}' instead of '{commit_hash}'")
+
+            return True
+        except subprocess.CalledProcessError as e:
+            print(f"ERROR: Failed to checkout {commit_hash}: {e}",
+                  file=sys.stderr)
+            return False
+
+
+class CacheManager:
+    """Manages persistent cache directories"""
+
+    def __init__(self, work_dir):
+        self.work_dir = work_dir
+
+    def initialize(self):
+        """Create cache directories if they don't exist"""
+        for dir_path in DIR_NAME.values():
+            abs_path = os.path.join(self.work_dir, dir_path)
+            if not os.path.exists(abs_path):
+                os.makedirs(abs_path, exist_ok=True, mode=0o755)
+
+    def get_commit_cache(self, commit_hash, path):
+        """Generate cache path for a commit"""
+        hash_short = GitHelper(self.work_dir).get_short_hash(commit_hash)
+        if not hash_short:
+            hash_short = commit_hash
+
+        return os.path.join(path, hash_short)
+
+class KernelDocRunner:
+    """Runs kernel-doc documentation generator"""
+
+    def __init__(self, work_dir, kdoc_binary):
+        self.work_dir = work_dir
+        self.kdoc_binary = kdoc_binary
+        self.kdoc_files = None
+
+    def find_kdoc_references(self):
+        """Find all files marked with kernel-doc:: directives"""
+        if self.kdoc_files:
+            print("Using cached Kdoc refs")
+            return self.kdoc_files
+
+        print("Finding kernel-doc entries in Documentation...")
+
+        files = os.path.join(self.work_dir, 'Documentation/**/*.rst')
+        pattern = re.compile(r"^\.\.\s+kernel-doc::\s*(\S+)")
+        kdoc_files = set()
+
+        for file_path in iglob(files, recursive=True):
+            try:
+                with open(file_path, 'r', encoding='utf-8') as fp:
+                    for line in fp:
+                        match = pattern.match(line.strip())
+                        if match:
+                            kdoc_files.add(match.group(1))
+
+            except OSError:
+                continue
+
+        self.kdoc_files = list(kdoc_files)
+
+        return self.kdoc_files
+
+    def gen_yaml(self, yaml_file, kdoc_files):
+        """Runs kernel-doc to generate a yaml file with man and rst."""
+        cmd = [self.kdoc_binary, "--man", "--rst", "--yaml", yaml_file]
+        cmd += kdoc_files
+
+        print(f"YAML regression test file will be stored at: {yaml_file}")
+
+        try:
+            subprocess.check_call(cmd, cwd=self.work_dir,
+                                  stdout=subprocess.DEVNULL,
+                                  stderr=subprocess.DEVNULL)
+        except subprocess.CalledProcessError:
+            return False
+
+        return True
+
+    def run_unittest(self, yaml_file):
+        """Run unit tests with the generated yaml file"""
+        cmd = [KDOC_PARSER_TEST, "-q", "--yaml", yaml_file]
+        result = subprocess.run(cmd, cwd=self.work_dir)
+
+        if result.returncode:
+            print("To check for problems, try to run it again with -v\n")
+            print("Use -k <regex> to filter results\n\n\t$", end="")
+            print(" ".join(cmd) + "\n")
+
+        return True
+
+    def normal_run(self, tmp_dir, output_dir, kdoc_files):
+        """Generate man, rst and errors, storing them at tmp_dir."""
+        os.makedirs(tmp_dir, exist_ok=True)
+
+        try:
+            with open(os.path.join(tmp_dir, "man.log"), "w", encoding="utf-8") as out:
+                subprocess.check_call([self.kdoc_binary, "--man"] + kdoc_files,
+                                      cwd=self.work_dir,
+                                      stdout=out, stderr=subprocess.DEVNULL)
+
+            with open(os.path.join(tmp_dir, "rst.log"), "w", encoding="utf-8") as out:
+                with open(os.path.join(tmp_dir, "err.log"), "w", encoding="utf-8") as err:
+                    subprocess.check_call([self.kdoc_binary, "--rst"] + kdoc_files,
+                                          cwd=self.work_dir,
+                                          stdout=out, stderr=err)
+        except subprocess.CalledProcessError:
+            return False
+
+        if output_dir:
+            os.replace(tmp_dir, output_dir)
+
+        return True
+
+    def run(self, commit_hash, tmp_dir, output_dir, kdoc_files, is_regression,
+            is_end):
+        """Run kernel-doc on its several ways"""
+        if not kdoc_files:
+            raise RuntimeError("No kernel-doc references found")
+
+        git_helper = GitHelper(self.work_dir)
+        if not git_helper.checkout_commit(commit_hash, quiet=True):
+            raise RuntimeError(f"ERROR: can't checkout commit {commit_hash}")
+
+        print(f"Processing {commit_hash}...")
+
+        if not is_regression:
+            return self.normal_run(tmp_dir, output_dir, kdoc_files)
+
+        yaml_file = os.path.join(tmp_dir, YAML_NAME)
+
+        if not is_end:
+            return self.gen_yaml(yaml_file, kdoc_files)
+
+        return self.run_unittest(yaml_file)
+
+class DiffManager:
+    """Compare documentation output directories with an external diff."""
+    def __init__(self, diff_tool="diff", diff_args=None):
+        self.diff_tool = diff_tool
+        # default: unified, no context, ignore whitespace changes
+        self.diff_args = diff_args or ["-u0", "-w"]
+
+    def diff_directories(self, dir1, dir2):
+        """Compare two directories using an external diff."""
+        print(f"\nDiffing {dir1} and {dir2}:")
+
+        dir1_files = set()
+        dir2_files = set()
+        has_diff = False
+
+        for root, _, files in os.walk(dir1):
+            for file in files:
+                dir1_files.add(os.path.relpath(os.path.join(root, file), dir1))
+        for root, _, files in os.walk(dir2):
+            for file in files:
+                dir2_files.add(os.path.relpath(os.path.join(root, file), dir2))
+
+        common_files = sorted(dir1_files & dir2_files)
+        for file in common_files:
+            f1 = os.path.join(dir1, file)
+            f2 = os.path.join(dir2, file)
+
+            cmd = [self.diff_tool] + self.diff_args + [f1, f2]
+            try:
+                result = subprocess.run(
+                    cmd, capture_output=True, text=True, check=False
+                )
+                if result.stdout:
+                    has_diff = True
+                    print(f"\n{file}")
+                    print(result.stdout, end="")
+            except FileNotFoundError:
+                print(f"ERROR: {self.diff_tool} not found")
+                sys.exit(1)
+
+        # Show files that exist only in one directory
+        only_in_dir1 = dir1_files - dir2_files
+        only_in_dir2 = dir2_files - dir1_files
+        if only_in_dir1 or only_in_dir2:
+            has_diff = True
+            print("\nDifferential files:")
+            for f in sorted(only_in_dir1):
+                print(f"  - {f} (only in {dir1})")
+            for f in sorted(only_in_dir2):
+                print(f"  + {f} (only in {dir2})")
+
+        if not has_diff:
+            print("\nNo differences between those two commits")
+
+
+class SignalHandler():
+    """Signal handler class."""
+
+    def restore(self, force_exit=False):
+        """Restore original HEAD state."""
+        if self.restored:
+            return
+
+        print(f"Restoring original branch: {self.original_head}")
+        try:
+            subprocess.check_call(
+                ["git", "checkout", "-f", self.original_head],
+                cwd=self.git_helper.work_dir,
+                stderr=subprocess.STDOUT,
+            )
+        except subprocess.CalledProcessError as e:
+            print(f"Failed to restore: {e}", file=sys.stderr)
+
+        for sig, handler in self.old_handler.items():
+            signal.signal(sig, handler)
+
+        self.restored = True
+
+        if force_exit:
+            sys.exit(1)
+
+    def signal_handler(self, sig, _):
+        """Handle interrupt signals."""
+        print(f"\nSignal {sig} received. Restoring original state...")
+
+        self.restore(force_exit=True)
+
+    def __enter__(self):
+        """Allow using it via with command."""
+        for sig in [signal.SIGINT, signal.SIGTERM]:
+            self.old_handler[sig] = signal.getsignal(sig)
+            signal.signal(sig, self.signal_handler)
+
+        return self
+
+    def __exit__(self, *args):
+        """Restore signals at the end of with block."""
+        self.restore()
+
+    def __init__(self, git_helper, original_head):
+        self.git_helper = git_helper
+        self.original_head = original_head
+        self.old_handler = {}
+        self.restored = False
+
+def parse_commit_range(value):
+    """Handle a commit range."""
+    if ".." not in value:
+        begin = value
+        end = "HEAD"
+    else:
+        begin, _, end = value.partition("..")
+        if not end:
+            end = "HEAD"
+
+    if not begin:
+        raise argparse.ArgumentTypeError("Need a commit begginning")
+
+
+    print(f"Range: {begin} to {end}")
+
+    return begin, end
+
+
+def main():
+    """Main code"""
+    parser = argparse.ArgumentParser(description="Compare kernel documentation between commits")
+    parser.add_argument("commits", type=parse_commit_range,
+                        help="commit range like old..new")
+    parser.add_argument("files", nargs="*",
+                        help="files to process – if supplied the --full flag is ignored")
+
+    parser.add_argument("--full", "-f", action="store_true",
+                        help="Force a full scan of Documentation/*")
+
+    parser.add_argument("--regression", "-r", action="store_true",
+                        help="Use YAML format to check for regressions")
+
+    parser.add_argument("--work-dir", "-w", default=WORK_DIR,
+                        help="work dir (default: %(default)s)")
+
+    parser.add_argument("--clean", "-c", action="store_true",
+                        help="Clean caches")
+
+    args = parser.parse_args()
+
+    if args.files and args.full:
+        raise argparse.ArgumentError(args.full,
+                                     "cannot combine '--full' with an explicit file list")
+
+    work_dir = os.path.abspath(args.work_dir)
+
+    # Initialize cache
+    cache = CacheManager(work_dir)
+    cache.initialize()
+
+    # Validate git repository
+    git_helper = GitHelper(work_dir)
+    if not git_helper.is_inside_repository():
+        raise RuntimeError("Must run inside Git repository")
+
+    old_commit, new_commit = args.commits
+
+    old_commit = git_helper.get_short_hash(old_commit)
+    new_commit = git_helper.get_short_hash(new_commit)
+
+    # Validate commits
+    for commit in [old_commit, new_commit]:
+        if not git_helper.is_valid_commit(commit):
+            raise RuntimeError(f"Commit '{commit}' does not exist")
+
+    # Check for uncommitted changes
+    if git_helper.has_uncommitted_changes():
+        raise RuntimeError("Uncommitted changes present. Commit or stash first.")
+
+    runner = KernelDocRunner(git_helper.work_dir, KDOC_BINARY)
+
+    # Get files to be parsed
+    cache_msg = " (results will be cached)"
+    if args.full:
+        kdoc_files = ["."]
+        diff_type = "full"
+        print(f"Parsing all files at {work_dir}")
+    if not args.files:
+        diff_type = "partial"
+        kdoc_files = runner.find_kdoc_references()
+        print(f"Parsing files with kernel-doc markups at {work_dir}/Documentation")
+    else:
+        diff_type = "no-cache"
+        cache_msg = ""
+        kdoc_files = args.files
+
+    tmp_dir = DIR_NAME["tmp"]
+    out_path = DIR_NAME[diff_type]
+
+    if not args.regression:
+        print(f"Output will be stored at: {out_path}{cache_msg}")
+
+    # Just in case - should never happen in practice
+    if not kdoc_files:
+        raise argparse.ArgumentError(args.files,
+                                        "No kernel-doc references found")
+
+    original_head = git_helper.get_current_branch()
+
+    old_cache = cache.get_commit_cache(old_commit, out_path)
+    new_cache = cache.get_commit_cache(new_commit, out_path)
+
+    with SignalHandler(git_helper, original_head):
+        if args.clean or diff_type == "no-cache":
+            for cache_dir in [old_cache, new_cache]:
+                if cache_dir and os.path.exists(cache_dir):
+                    shutil.rmtree(cache_dir)
+
+        if args.regression or not os.path.exists(old_cache):
+            old_success = runner.run(old_commit, tmp_dir, old_cache, kdoc_files,
+                                    args.regression, False)
+        else:
+            old_success = True
+
+        if args.regression or not os.path.exists(new_cache):
+            new_success = runner.run(new_commit, tmp_dir, new_cache, kdoc_files,
+                                    args.regression, True)
+        else:
+            new_success = True
+
+    if not (old_success and new_success):
+        raise RuntimeError("Failed to generate documentation")
+
+    if not args.regression:
+        diff_manager = DiffManager()
+        diff_manager.diff_directories(old_cache, new_cache)
+
+if __name__ == "__main__":
+    main()
-- 
2.53.0


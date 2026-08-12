Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967A1483BC6
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 18:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786559029; cv=none; b=Qtp/vyRlWU9kZonILrQmMzY+NIXMXGSQnQ7h6868zlRzQvvhZ3qkY7fa5x3rSAFSroEqzedjDm10Y+rJC8B4BAzTAbG5GjnlSc/LeV6oF5rn4o8UO063nuAW0I4Qgzm/Pf+QhMgnZxPJ5rg+6kHz16ma0Wu7SQLEoTxvDLFVX8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786559029; c=relaxed/simple;
	bh=MaNdeO0zxfUKATc6m2Zu/5VXWMWx8OHNL5C+gbM+wbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q/t/8zX3ScxdKacw0A9F2YnStVupJjKBLypNjfHvT3LluXwBSqPxQ+N3JbL+7/RKEKhmj+2H5GExWLf4r9zYfRZzB+ptDtfyNvcsAOwy5u6iCv0pUoDzBpeY41ogaDpA9F8J1bW2PM0tiJIQ34GxYCJGKLzeUqWc+MZJdrbt4pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OLtpfN69; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OLtpfN69"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cbedf318752so965974a12.0
        for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 11:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786559028; x=1787163828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SO08RG/xBwrspSzwFkkCTaYAqts8IHVXj2FA5i4967M=;
        b=OLtpfN69W/sBsGej2/2F7EEIhcFFDGAUFu1oNUtUujC+Z0ELoXSzbsZuWqcf6k0h3w
         Kz8O0D7zWdCegQDQv/A9yhOA4IMVlguwfDklMPDLJiRrFbkzHPa4w2u3pLui5WXyZryF
         Ra0S8T8gMw8dgL+chIVILRyIXKj3hi6n3W+48YQrC4ag5MUazIMICdvVjg0WQKyrW+ox
         VJkQHD4Ub3Zl0r7KFESQRnJpRkq6/DqvJXwoos/jdT+uuN475YaV66LDLHdsseq2Bo9U
         jW9r4fRFUfNOJkoT/M+oa26Y76XfjjRS9f8x/am2hxm2FVwFZkKyS5U4j5LdYJedRqPu
         4nyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786559028; x=1787163828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SO08RG/xBwrspSzwFkkCTaYAqts8IHVXj2FA5i4967M=;
        b=g0q22gApM+vwIoqM8pKDadCgvD2iAteFgMAv5z3ySTgakfB16NuvUltgpD/G+1xivU
         0RlIwoAGpm9sXPkvNm/3B+0HyZW0+hHgAPZkIAu5miwbP6GKNfkEhH0ThABMYb760MIy
         yCTO8m1V/nq/vMBpKRlmsYXUGENxCnyfv6dJLtsmkq/4pJACtGU6w/p/Gg+tYrU6y9/D
         tTkWstvHO9P7bcaC/HeKwQK8sEjK5jsZRgflADScNL8pc/wsOu2tuQ2Ukgx16XANdxIl
         6Zj5o9KxDZHZZ+1qSs0iujqFSsC2yuvckwJKm5tGv/zpQBzjCnssWHWvtxLh4BJ3epOJ
         YN0A==
X-Gm-Message-State: AOJu0Yy8EoqsM98ADZ3dY56NAbn66oaLTeFmNhk/ZqQEe5dkZHG1P5Hb
	ulptdlT9tkiZE+HYm8EALi6dMzai48uRicJ7a9xmVw7LElRT0VHDs/KkOmJ+EHR8FSY=
X-Gm-Gg: AR+sD11AIAGB8X0crZEOu/uG39PPvhjBdyRe78L+In2sKgqP3CTYvB3imMdKdOSlYLe
	ZepJfT0hYVDHK0wt5TPvvNziqPN2cxbuyssVXTDDaOZrBZ6xsw7R+wybd3IG5ZRDnb5ku19WeD9
	StH2ES40u/S6NjbCjqjHiNcqJ6KXYpuvqWcaX20Ve6dzDcxHNznZdPGAVWV6hFTb9nQ5mh85JHC
	MjEv6tjeSyqr3H6i3spW2UpNsGBZ8Ud5yjtVpJYy6UbnGsFUeM773byMYki5iFe0XkpFFqqMTBU
	Gjjcrq1aTpWzuaFyXECqeksMktCBeVHMOFYTcxFTUIePhKaRDrrGgGSc4uDuBs4Zdvcs9/5V5s4
	OeuMtbwuelGZieJaqcVGlu+iikXRZukpvaP0VGp6QXxmAVJkZstMT+5jFOD7NU10QLfNPEQNSrG
	hhTfgFQ2Wq5PsS5NLIFh5i3RcfCcvpoIpXC2i7V0zey85kkg1raiFZ+3sXyT2PDxX9RMWdzsbBd
	+iikwClo4v45g==
X-Received: by 2002:a05:6a20:3d1a:b0:3bf:9b61:f7ae with SMTP id adf61e73a8af0-3cc55195b34mr482617637.14.1786559027764;
        Wed, 12 Aug 2026 11:23:47 -0700 (PDT)
Received: from localhost.localdomain ([64.186.250.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf3c08163sm12127695eec.7.2026.08.12.11.23.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 12 Aug 2026 11:23:47 -0700 (PDT)
From: Chen Miao <chenmiao.ku@gmail.com>
To: corbet@lwn.net,
	alexs@kernel.org,
	si.yanteng@linux.dev,
	skhan@linuxfoundation.org,
	dzm91@hust.edu.cn,
	mchehab@kernel.org,
	wy@wyuan.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Miao <chenmiao.ku@gmail.com>
Subject: [PATCH v3 4/6] docs: sphinx-build-wrapper: prefer gmake
Date: Thu, 13 Aug 2026 02:23:21 +0800
Message-ID: <20260812182327.53694-5-chenmiao.ku@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260812182327.53694-1-chenmiao.ku@gmail.com>
References: <20260812182327.53694-1-chenmiao.ku@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Homebrew installs GNU Make as gmake on macOS, but the Sphinx build
wrapper invokes make directly when generating Info and Rust
documentation. This can make the dependency check succeed while those
documentation targets still use an incompatible make implementation.

Honor MAKE when it names a compatible GNU Make. Otherwise check gmake and
then make, selecting the first GNU Make 4.0 or newer. Use the common kdoc
detector to keep this selection consistent with sphinx-pre-install.

Signed-off-by: Chen Miao <chenmiao.ku@gmail.com>
---
 tools/docs/sphinx-build-wrapper | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wrapper
index 1bb962202..15c7e0938 100755
--- a/tools/docs/sphinx-build-wrapper
+++ b/tools/docs/sphinx-build-wrapper
@@ -63,6 +63,7 @@ SRC_DIR = os.path.dirname(os.path.realpath(__file__))
 sys.path.insert(0, os.path.join(SRC_DIR, LIB_DIR))
 
 from kdoc.python_version import PythonVersion
+from kdoc.gmake_detect import find_gmake
 from kdoc.latex_fonts import LatexFontChecker
 from jobserver import JobserverExec         # pylint: disable=C0413,C0411,E0401
 
@@ -97,6 +98,14 @@ class SphinxBuilder:
     with the Kernel.
     """
 
+    def get_make(self):
+        """Select the first GNU Make 4.0 or newer in preference order."""
+        make = find_gmake(self.env.get("MAKE"))
+        if make:
+            return make
+
+        sys.exit("GNU Make 4.0 or newer is required")
+
     def get_path(self, path, use_cwd=False, abs_path=False):
         """
         Ancillary routine to handle patches the right way, as shell does.
@@ -569,9 +578,10 @@ class SphinxBuilder:
         texinfo directory.
         """
 
+        make = self.get_make()
         for output_dir in output_dirs:
             try:
-                subprocess.run(["make", "info"], cwd=output_dir, check=True)
+                subprocess.run([make, "info"], cwd=output_dir, check=True)
             except subprocess.CalledProcessError as e:
                 sys.exit(f"Error generating info docs: {e}")
 
@@ -787,12 +797,11 @@ class SphinxBuilder:
 
         if rustdoc and target in ["htmldocs", "epubdocs"]:
             print("Building rust docs")
-            if "MAKE" in self.env:
-                cmd = [self.env["MAKE"]]
-            else:
-                cmd = ["make", "LLVM=1"]
-
-            cmd += [ "rustdoc"]
+            make = self.get_make()
+            cmd = [make]
+            if make != self.env.get("MAKE"):
+                cmd.append("LLVM=1")
+            cmd.append("rustdoc")
             if self.verbose:
                 print(" ".join(cmd))
 
-- 
2.50.1 (Apple Git-155)


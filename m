Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272C833D6C8;
	Tue, 27 Jan 2026 10:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769508824; cv=none; b=tKxgklsR0hgG4h4/DLHP05AQEGwAr63iMsqOv3Jh74sZRdcpD6Em5Ngue2FybvLFt1gYinXjvpPN3jmERHisPPp45ZQnwDukXfR1toemJY/P8b73xJAcAvNQWSfMd5e9RLxAQW2WLrCSxVdfL9vkhhuVHjiP5fXed2YN2Rw+tWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769508824; c=relaxed/simple;
	bh=Uh8fp8VyF/1ltE83ak+3CvQjcTkAdEIyegGiBxaXQkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aFim4CEgaORObt77uF8KEtkYZ9nRf3zuLupF3uf1iRP6E25E9QMxOnm8QrPXs0O+6k9VjA2HL+XV98LLJgjpNsfEm/WDLvZSbKJSnNQ0gd1aVzJ3G7d2FZJi2KcoK8HWrGQ30sBjcJPRtf8R6H7VBBDfxTPdPzw4kTEExriuoQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ckQKpfBE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ckQKpfBE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07432C2BCB0;
	Tue, 27 Jan 2026 10:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769508824;
	bh=Uh8fp8VyF/1ltE83ak+3CvQjcTkAdEIyegGiBxaXQkw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ckQKpfBETHK7JSeKIrNVyMGOJXqFn5JdXGOzGX857vqqTgUGMFq75EUOjXTzKfG1z
	 dvKDFgj8WHnznTI/HuyPdT4XUT6PH0cAIP6ikGk/fayq/Yx/cv8IKusHoOfZRaekmN
	 xMqTLTgqpTdwluvzrW8BlozmCHlUPjE7UnnFWtuOVw8tv6IjGGHh0U+HzUVSH2QELJ
	 +rVdrkY6vJx/+VpB2PBlqwGLOtGdfa1dWKWeZf0u0BpVFvZErb4U0goCuOwXnStOPk
	 I+Whjmser9ahJq+inzKP54oGKSjIULUSGtPaF+bKVsPLBKBm5hRotMWBCh56usd4xE
	 toatnGl7dW1RQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vkg4s-0000000BVUT-18O9;
	Tue, 27 Jan 2026 11:13:42 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH 12/14] docs: kdoc_parser: ignore context analysis and lock attributes
Date: Tue, 27 Jan 2026 11:13:31 +0100
Message-ID: <3e9526b30b58b34251b88403ee75523a96f69b6a.1769508371.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1769508371.git.mchehab+huawei@kernel.org>
References: <cover.1769508371.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

From: Randy Dunlap <rdunlap@infradead.org>

Drop all context analysis and lock (tracking) attributes to avoid
kernel-doc warnings.

Documentation/core-api/kref:328: ../include/linux/kref.h:72: WARNING: Invalid C declaration: Expected end of definition. [error at 96]
  int kref_put_mutex (struct kref *kref, void (*release)(struct kref *kref), struct mutex *mutex) __cond_acquires(true# mutex)
  ------------------------------------------------------------------------------------------------^
Documentation/core-api/kref:328: ../include/linux/kref.h:94: WARNING: Invalid C declaration: Expected end of definition. [error at 92]
  int kref_put_lock (struct kref *kref, void (*release)(struct kref *kref), spinlock_t *lock) __cond_acquires(true# lock)
  --------------------------------------------------------------------------------------------^

The regex is suggested by Mauro; mine was too greedy. Thanks.
Updated context analysis and lock macros list provided by PeterZ. Thanks.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/all/20260107161548.45530e1c@canb.auug.org.au/
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_parser.py | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index 8531113ee28d..4507f6159a75 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -84,6 +84,8 @@ struct_xforms = [
     (KernRe(r'\s*__aligned\s*\([^;]*\)', re.S), ' '),
     (KernRe(r'\s*__counted_by\s*\([^;]*\)', re.S), ' '),
     (KernRe(r'\s*__counted_by_(le|be)\s*\([^;]*\)', re.S), ' '),
+    (KernRe(r'\s*__guarded_by\s*\([^\)]*\)', re.S), ' '),
+    (KernRe(r'\s*__pt_guarded_by\s*\([^\)]*\)', re.S), ' '),
     (KernRe(r'\s*__packed\s*', re.S), ' '),
     (KernRe(r'\s*CRYPTO_MINALIGN_ATTR', re.S), ' '),
     (KernRe(r'\s*__private', re.S), ' '),
@@ -168,6 +170,16 @@ struct_nested_prefixes = [
 # the start delimiter.
 #
 function_nested_prefixes = [
+    (re.compile(r"__cond_acquires\s*\("), ""),
+    (re.compile(r"__cond_releases\s*\("), ""),
+    (re.compile(r"__acquires\s*\("), ""),
+    (re.compile(r"__releases\s*\("), ""),
+    (re.compile(r"__must_hold\s*\("), ""),
+    (re.compile(r"__must_not_hold\s*\("), ""),
+    (re.compile(r"__must_hold_shared\s*\("), ""),
+    (re.compile(r"__cond_acquires_shared\s*\("), ""),
+    (re.compile(r"__acquires_shared\s*\("), ""),
+    (re.compile(r"__releases_shared\s*\("), ""),
     (re.compile(r"__attribute__\s*\("), ""),
 ]
 
@@ -198,6 +210,7 @@ function_xforms = [
     (KernRe(r"__(?:re)?alloc_size\s*\(\s*\d+\s*(?:,\s*\d+\s*)?\) +"), ""),
     (KernRe(r"__diagnose_as\s*\(\s*\S+\s*(?:,\s*\d+\s*)*\) +"), ""),
     (KernRe(r"DECL_BUCKET_PARAMS\s*\(\s*(\S+)\s*,\s*(\S+)\s*\)"), r"\1, \2"),
+    (KernRe(r"__no_context_analysis\s*"), ""),
     (KernRe(r"__attribute_const__ +"), ""),
 ]
 
@@ -207,6 +220,8 @@ function_xforms = [
 var_xforms = [
     (KernRe(r"__read_mostly"), ""),
     (KernRe(r"__ro_after_init"), ""),
+    (KernRe(r'\s*__guarded_by\s*\([^\)]*\)', re.S), ""),
+    (KernRe(r'\s*__pt_guarded_by\s*\([^\)]*\)', re.S), ""),
     (KernRe(r"(?://.*)$"), ""),
     (KernRe(r"(?:/\*.*\*/)"), ""),
     (KernRe(r";$"), ""),
-- 
2.52.0


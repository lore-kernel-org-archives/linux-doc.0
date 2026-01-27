Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727A833C530;
	Tue, 27 Jan 2026 10:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769508822; cv=none; b=rlU5stPDiVC8+1qTxlDmO7qAr5P/GMnFmaSJc3CIFeHJ2EubDNMXS+j4CpTKRKznhuww5zXM/7irlquYi0WWFo+6tF/ur6NXBDtLLYSQHdIumX3uFduqE7/v8bP7/UlK3kp5gFXch0tJfJvWcZWEpqyKlQk+Hz/CDbnhUmy5R7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769508822; c=relaxed/simple;
	bh=0GXTBopIxXVRl5wO2lQk4NHBxkgOqte8Dyp2ZYXlg+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aX6BMXUpOg9cJvVtYP0nMztnPZI1whHF5GBw4+UGlX3AgBsajAod3m+uvr4R3jFsHSqUD8HCBUYbQOC/sg7ujAq1S4JcLd4gI4n9BhUX2RBkhfK6rQfXaQOiwCsBBIb0hweyVs9W7LGx8/wT1U1DCWNiPa00YqvdEj1jfm+KIU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TbgbIRbu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TbgbIRbu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19C8FC19425;
	Tue, 27 Jan 2026 10:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769508822;
	bh=0GXTBopIxXVRl5wO2lQk4NHBxkgOqte8Dyp2ZYXlg+Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TbgbIRbuDsuRJG4TM4xKHHvuJDz4vA3NgsXSKZPBrpS6CIdTO4X/zFZE80OAJOMrv
	 D9WQ4SbOPkpvhjJh1vb/tBfzvPNh2Z1aUFtxu6wrFmO6heh+kTBZYbZuNsSXYYtXmy
	 8nUlmBkOwEICGXiu0jmDerce89NBI2OjMYbkiZKVPbvgZFB7o6fmkKlNN7rJZRobkj
	 JhGe1bZkg599uMdyTJYYTYJ8fwXCuI92gUpaD+rjRAdN6bo5NfVNwGRpZT58/QObvf
	 A14xp30pgEB/xwZJQsxafQrjEw2m2ol5zyE6v8DDJVqa1K832Wd2LUJ+y6YirDuVwl
	 OfKNdzp1L4Nsw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vkg4q-0000000BVNJ-0wAH;
	Tue, 27 Jan 2026 11:13:40 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH 06/14] docs: kdoc_parser: use NestedMatch to handle __attribute__ on functions
Date: Tue, 27 Jan 2026 11:13:25 +0100
Message-ID: <3635b0e33c260555d5be131d171ac494ba436932.1769508371.git.mchehab+huawei@kernel.org>
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

Some annotations macros may have nested parenthesis, causing normal
regex parsing to fail. The __attribute__ regex is currently very
complex to try to avoid that, but it doesn't catch all cases.

Ensure that the parenthesis will be properly handled by using
the NestedMatch() logic.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
---
 tools/lib/python/kdoc/kdoc_parser.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index 4b2b0a0d25f8..0310aff7b2fe 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -168,6 +168,7 @@ struct_nested_prefixes = [
 # the start delimiter.
 #
 function_nested_prefixes = [
+    (re.compile(r"__attribute__\s*\("), ""),
 ]
 
 #
@@ -198,7 +199,6 @@ function_xforms = [
     (KernRe(r"__diagnose_as\s*\(\s*\S+\s*(?:,\s*\d+\s*)*\) +"), ""),
     (KernRe(r"DECL_BUCKET_PARAMS\s*\(\s*(\S+)\s*,\s*(\S+)\s*\)"), r"\1, \2"),
     (KernRe(r"__attribute_const__ +"), ""),
-    (KernRe(r"__attribute__\s*\(\((?:[\w\s]+(?:\([^)]*\))?\s*,?)+\)\)\s+"), ""),
 ]
 
 #
-- 
2.52.0


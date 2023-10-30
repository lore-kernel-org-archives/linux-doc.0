Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894B5654
	for <linux-doc@vger.kernel.org>; Mon, 30 Oct 2023 08:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AKTMWcoo"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 372F794;
	Mon, 30 Oct 2023 01:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698656328; x=1730192328;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iWVbjdypmwEuC8THWSop88+8PL4MTuv4dODLuKVqSkc=;
  b=AKTMWcoozSVUEg8Jd6C1dS5QAoVi8kibqBfpBXhOG9iRMjn6Q/WAUO16
   gGNxy4HyzRzrLu/NdqoC3sUF67esdIyXQrjBEPR5YX+QZzRNaCR5fmM1G
   S5lKI5IoaHvtPjgykWnljkaW9BCYeoC75nfZZrSFI933vVMZPlI6jy47O
   G8ezhUZQmsRHMFNFgY5YYpTo0UYbT5l1nj5yIkzlewyL7jl2rS0C6qmgw
   3XBMx4nuYRMcRW7maHW/rwHz3xrjSsuzPuvAfEMbUrzyAdUGbmVUhdPF9
   CpOFr/6IBeJ1TAtu044e0XTWVM4z/4ocgzwZY/S7RadmaQB7uxBtBa+TS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="6670971"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="6670971"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 01:58:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="736681128"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="736681128"
Received: from yujie-x299.sh.intel.com ([10.239.159.77])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 01:58:45 -0700
From: Yujie Liu <yujie.liu@intel.com>
To: linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org,
	Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>,
	Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] scripts/kernel-doc: Fix the regex for matching -Werror flag
Date: Mon, 30 Oct 2023 16:54:04 +0800
Message-Id: <20231030085404.3343403-1-yujie.liu@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Swarup reported a "make htmldocs" warning:

  Variable length lookbehind is experimental in regex;
  marked by <-- HERE in m/(?<=^|\s)-Werror(?=$|\s)
  <-- HERE / at ./scripts/kernel-doc line 188.

Akira managed to reproduce it by perl v5.34.0.

On second thought, it is not necessary to have the complicated
"lookahead and lookbehind" things, and the regex can be simplified.

Generally, the kernel-doc warnings should be considered as errors only
when "-Werror" flag is set in KCFLAGS, but not when
"-Werror=<diagnostic-type>" is set, which means there needs to be a
space or start of string before "-Werror", and a space or end of string
after "-Werror".

The following cases have been tested to work as expected:

* kernel-doc warnings are considered as errors:

  $ KCFLAGS="-Werror" make W=1
  $ KCFLAGS="-Wcomment -Werror" make W=1
  $ KCFLAGS="-Werror -Wundef" make W=1
  $ KCFLAGS="-Wcomment -Werror -Wundef" make W=1

* kernel-doc warnings remain as warnings:

  $ KCFLAGS="-Werror=return-type" make W=1
  $ KCFLAGS="-Wcomment -Werror=return-type" make W=1
  $ KCFLAGS="-Werror=return-type -Wundef" make W=1
  $ KCFLAGS="-Wcomment -Werror=return-type -Wundef" make W=1

The "Variable length lookbehind is experimental in regex" warning is
also resolved by this patch.

Fixes: 91f950e8b9d8 ("scripts/kernel-doc: match -Werror flag strictly")
Reported-by: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
Cc: Akira Yokosawa <akiyks@gmail.com>
Signed-off-by: Yujie Liu <yujie.liu@intel.com>
---
 scripts/kernel-doc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index d660e1f4b483..08a3e603db19 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -185,7 +185,7 @@ if (defined($ENV{'KBUILD_VERBOSE'}) && $ENV{'KBUILD_VERBOSE'} =~ '1') {
 if (defined($ENV{'KCFLAGS'})) {
 	my $kcflags = "$ENV{'KCFLAGS'}";
 
-	if ($kcflags =~ /(?<=^|\s)-Werror(?=$|\s)/) {
+	if ($kcflags =~ /(\s|^)-Werror(\s|$)/) {
 		$Werror = 1;
 	}
 }
-- 
2.34.1


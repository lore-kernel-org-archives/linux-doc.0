Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8836B3B42FF
	for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 03:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790220935; cv=none; b=DRlmhclBM4/4rcfphfZ/dakDnWfx/vNQeJ+hR3cQuh36IW5gZzYcnZ0eoAKpU0m0Wk9TFVV5cbx1KjwrrpXsvQ+XXfPHoeTlC6BPeoYxbCdF2bmU0Jdo3QuGm4lnluCvd3aeh+211s2U6vMXGs7enfOgYprURYrlbsTBYutXtRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790220935; c=relaxed/simple;
	bh=T6xOaLYc0B9aKjO9KCpz3nX86evUAWutyIxXLLWE2vg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VqrOomhKCpBv3V7ynLMt104NoWAvyl4KF3AM44FTwQbtg5sUjO6y+lYo44C7oHZzWKfk5KfWICTLCvt5mIhHOxUCkt6iiEL5552G1w4YJhCiXV2uJ8J2pml7Rj5BLyDFU1eJgk3XkWOP20TnDVHNT/FEEXsHR6DtI1ZbzQC6cxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BOQaJ5Ol; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BOQaJ5Ol"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc75e33cc69so745836a12.0
        for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 20:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790220934; x=1790825734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OaUbgPXJZf/ktE8BVYwWTpClwzmCb4EAHd75bRpHj1U=;
        b=BOQaJ5Ol2IWJUoK0u8ymDAit8apyzDdaUG/QJrdV06xJaYnfGvl2Da+6o62wEqt39i
         2BldXzB3A7yw7bOy7f8QJEvRiK/XqVmeDMPxPxSe/lS3LgaVbC1K28ZiUEl5uO29QUmL
         h5DfJytaPxd1QYF0RidprCyneejattwxH/u7gILJ1mhST/8BC0jlljVahyzq0IRYiu8F
         kd9vRuHy1MtZDFHppHCXdikGIi7wLAcvdi43oq4NXUfLRI9mXTYlgukv2O7rC0ST9ua4
         GGVu4eSihsj8/3PFH5ef8JPXT42/4arGadwKuet3I2CFdf2WI1eUSTuBIvWhTD0MWfLk
         8Neg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790220934; x=1790825734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OaUbgPXJZf/ktE8BVYwWTpClwzmCb4EAHd75bRpHj1U=;
        b=h690nK5DYAu9rhr/0R6mPwDLydmllF9Jc18b5s7+kHdCafVsUqIgUG0riaBvxqtzxr
         C6px520V+ovxeYxZqIWFFJ0Z9MsSY4PEuN8sbKzwG2ltTHSNlbNYUATpbl+WHQT41Qkk
         I1QLkECFoMhyQkXqPa9XHErYur0al776uyfWm+UnucXoe7DdhLCB2E3GM+zbrtG10Z5L
         bg/E+WSZTdVqfQ8lnafgszQmJ3xEhRxuuavmneiu6hiQg7m2COmKaiNvax5/6yBhAp5I
         F3SqQMk7HmZ4muG6Fro0A2ymkRpjsrt/piU4stjkuc/SNKf0vjSFwmmByDp/StZIK3Zg
         ycbQ==
X-Forwarded-Encrypted: i=1; AKwUvBxV+3RrRYF8NneVnYldDfknlPT4h0F7F0MGJSVk/zckvykxjoTBrFuQu4T81sMT5EhBkRedR7dxoxA=@vger.kernel.org
X-Gm-Message-State: AFuF++kdsCLzFGdZ3i3cerhK2W7TCRGyWecfp8Zqw26N2BCvxSavlXgB
	Xw361B0vmAcBwET3zFhG05/QU7vn8/GHoFS663PeUacky13cSP8yACW7
X-Gm-Gg: AYBFou2GSmNy2bkJLEOoNHDU10Sjtf8Z4TJIxRzPOAM8WDCFQeXLw5ZMlaWeGUpShgV
	aHaHGb+gUJLJXyaiKbv8Ub68dfJ+tbDc0UGmb916ChUYFnrzMEOmU7Y4pQoSg2N4hBl2gGmthOl
	CZe3xuyQaiJ/Hi/YoOShnj8AzhJh6fzgAOMA7t+OE2zQSGJInmzYkqLfnKDU631SUinqLRdVKzm
	+QerdBe6IvluPKAATCj/wxKojEXkQ5RfJ2PLZQjljxpKwSetLB+WDc5SmvDOHb9TTc0Pb2f1NX/
	yly2N1+drPcsx0uWcSblxrOKvlqVJeIrtTEuuPKRf8cfqwu59SOIkKfgM6UryMFtTK4+pORbVTB
	dsaC35Zzqdg8Wlgi5ZuXK77idwd0TyTUCsVshvvtk6LyyvxTjo9440DMgs27bAmpLIr+9V5R6Pj
	uGdnTrwmuE20mpxhgkKGp88wPrkAAazr9Ne3eiat8jau5kcUnltckkwJ+3qucBXFjHfz1d5TCAy
	fRTHZZkDGlE2/6JCTj4aG8x/ciV/zxZtEFh6va1vvVWPyIAOcJtMSUJ0waUEsj7I27xidX4nQS0
	8kKW3kD9+roB/wka4Rffm3UnaAurf6+11BBtE6vjZmz3hMI+Zxwyj2Ewf7SXzlkJEM0KTA==
X-Received: by 2002:a17:90b:3c05:b0:39e:1ff0:331b with SMTP id 98e67ed59e1d1-3a098ad9d1bmr996674a91.2.1790220933719;
        Wed, 23 Sep 2026 20:35:33 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a097663e1dsm2158159a91.7.2026.09.23.20.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 20:35:33 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Theodore Ts'o <tytso@mit.edu>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] MAINTAINERS: document the branch in git T: entries
Date: Thu, 24 Sep 2026 11:35:28 +0800
Message-ID: <64b0be79c535bb9545f9f81a5044146a8726c761.1790220653.git.matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

T: entries have named a branch after the repository URL since commit
a1aa5a770dc3 ("MAINTAINERS: update hwmon subsystem git trees"), and
109 of the 846 git T: lines do so today.  Commit 083bf9c56d06
("get_maintainer: add more --self-test options") taught
get_maintainer.pl to parse that optional branch and check it with git
ls-remote.  The preamble, however, still describes T: as it did after
commit 50306fb5398f ("[PATCH] Clarify T: field in MAINTAINERS"), as
"tree type and location", and does not mention the branch.

Documentation/process/submitting-patches.rst sends contributors to the
T: entry to find the tree to prepare patches against.  When
development happens on a branch other than the repository's HEAD, a
branch-less entry points them at the wrong tree; on 2026-09-24, 173 of
the 273 repositories named without a branch had a HEAD that mainline
already contained.

Document the existing practice and say when to name a branch.

Suggested-by: Theodore Ts'o <tytso@mit.edu>
Link: https://lore.kernel.org/all/arSMwd1bGO1vrif-@mit.edu/
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
Ted, as I said in my reply on the ext4 patch
(https://lore.kernel.org/all/20260924033200.3615554-1-matthias.goergens@gmail.com/),
I'm sending only a few of the per-tree T: patches for now, and would
value your view before sending the rest.

 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc3cae2e378b..6edc17d66b44 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -30,6 +30,8 @@ Descriptions of section entries and preferred order
        See Documentation/maintainer/maintainer-entry-profile.rst for details.
 	T: *SCM* tree type and location.
 	   Type is one of: git, hg, quilt, stgit, topgit
+	   A git entry may name a branch after the URL; name one when
+	   development does not happen on the repository's HEAD.
 	F: *Files* and directories wildcard patterns.
 	   A trailing slash includes all files and subdirectory files.
 	   F:	drivers/net/	all files in and below drivers/net

base-commit: 40288c9206c17eb66a603262e06a58d300d0f279
-- 
2.55.0


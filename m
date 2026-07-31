Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5BE221FD4;
	Fri, 31 Jul 2026 14:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785509123; cv=none; b=jaoTJDkcC3uRxOGeHFRL/NUzwfqoBEk/sO/Ehc7LI6YMpKWJRE3DoBQ8lJcDiCxiR3Kg1syk9QZwLhTbiSe/lI/NxXfd60ZSxQKflwGnrt0Ej19DVxfb986S+/DAiEaidqRcArWH3yKYYPQxazhz7wjJHxAyrAI2M8Sznbq+HNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785509123; c=relaxed/simple;
	bh=lC0KoJjyPInOTc0glWAHgvUwPRQ9BnaNSwIKytX/OCA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n13FdUhjcRPRhWZaUZRGBwVhg7CeJY03gjG8u/NrHdQU3P77IRurf/AJzdT8csYYBpyXj6Mybrv4XMaioFFSBY3AEKe53J74wxSG2Lq2EyFg4/YwT1ngTliR5+JZju9qP30DPqIIjVgkHoqon/JFOoAmHix0HMJRre3N3xG6Tf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O6O4jshJ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O6O4jshJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785509122; x=1817045122;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lC0KoJjyPInOTc0glWAHgvUwPRQ9BnaNSwIKytX/OCA=;
  b=O6O4jshJM42QmHRZj2e1ur5QBlWIrnWP1qSxgBJ0Ik8wOUkrI4WBNmDS
   QjHiLd75B2R4gs65akQ4wqJhmqi60r+cTPBWehetfZGvC/SPrDZYEx6IT
   4WcYE12a7jjlGoqhopYsYnh5A7wMFuzD5s5eUxg930IGUdhZkc4wCAIOT
   8UYJM0ZrTQ8RPhz2mIKf6bbad9M7CfKB7yw19wwHvuh2lI5gPbf4yJyN8
   p9UkDbrW1GyHj0ZTTesBSDUyCilNHDz7BUT8i8ahAx2ltCVtzbYp58w1W
   ParmGUx0kL2T058/P/mH1EBy+yjOzlZ3wqhhnc2n05Npn76v1efswC4N7
   g==;
X-CSE-ConnectionGUID: O1o+bGMVSP2zxU4YCj8UGw==
X-CSE-MsgGUID: eADBbR22T5ezhZicdEA5NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="88667404"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="88667404"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 07:45:21 -0700
X-CSE-ConnectionGUID: hzXFUnHaRKSTfvIecM4y5Q==
X-CSE-MsgGUID: 4P8wh7NzTcCLBiE4a+azGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="298805545"
Received: from rknop-desk.igk.intel.com (HELO rknop-desk.ger.corp.intel.com) ([172.28.178.99])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 07:45:19 -0700
From: Ryszard Knop <ryszard.knop@intel.com>
To: Akira Yokosawa <akiyks@gmail.com>,
	linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuicheng Lin <shuicheng.lin@intel.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH] scripts/kernel-doc: Fix kdoc for Python 3.9-3.11
Date: Fri, 31 Jul 2026 16:45:08 +0200
Message-ID: <20260731144508.912049-1-ryszard.knop@intel.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit

The syntax used by the excess description suggestion change works on
Python 3.12+, while we need to support 3.9+.

Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
---
 tools/lib/python/kdoc/kdoc_parser.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index 884f42584667..9cba20f827c4 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -601,7 +601,8 @@ class KernelDoc:
         if not suggestions:
             return ""
 
-        return f"(did you mean one of: '{"', '".join(suggestions)}')"
+        joined_suggestions = "', '".join(suggestions)
+        return f"(did you mean one of: '{joined_suggestions}')"
 
     def check_sections(self, ln, decl_name, decl_type):
         """
-- 
2.55.0


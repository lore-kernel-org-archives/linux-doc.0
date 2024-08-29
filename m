Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C29335C0
	for <linux-doc@vger.kernel.org>; Thu, 29 Aug 2024 20:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724963146; cv=none; b=BBPb7yrNglyuELrKQA2uxe5yjFBWex39223KRZLK7BWPDOQbk0Idj7AhiSFFpVO6+1dznzGfub7p3fvFdgCfRx6epeDjLuALoviA1yp2wkP6cQdvVXogQT0TmBeppXCwwirM0xpRHAgEtOIfQA1PBsu0koe9VNtXNKT8VlWWPmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724963146; c=relaxed/simple;
	bh=E4jCUVzowjcbfsy8sOZVl9dFO+nOYR0r+Q+2LGmDDpQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=k4H8Ffackz53sJhTj2YvYYzwF4SJE8WpgTVaatq7DDosFXxuA3+V2SKhVnSUYAhLZgTQvsw1LydSh7HR/6zCRIxz6R3gPxhQtx0+oJxeM9tUgfxD0MjhrvnR8dDGI9t/WBHm4BgRefqswzpJ0A1UGgKynCeAZMV1RMZagLEa3hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UgugTacI; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UgugTacI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724963145; x=1756499145;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=E4jCUVzowjcbfsy8sOZVl9dFO+nOYR0r+Q+2LGmDDpQ=;
  b=UgugTacI1yPwu833BGy9mrzimjoqBL96xXi43rOAho2Tl+cuhqyyUgKQ
   E+4fKx2b98X3W67P2jhj0eIEK39hI4guJfH//4/eAHuCEUm/7KfHZHasz
   i+kOHZyBG+CCwUve4iDSgBkH8DSx/E2Nf5tqXKrvUqhpfGp4Jo8y057rQ
   V0k8KbqeygXKIqLZpz8MnOQ3uqdBP4dvqoBELTr0d7hzBxpROBultHx6w
   yKxlDUicW30GCKjvIc9mjgie3OBaN/YjJW5GdU2mklq93YRcQRMeLhIao
   SmEWa3Xqf1H0qTnEwNrMOo+ZGcuE+2+tqkrED8KGtez/7ybOn/r3MiZ0S
   w==;
X-CSE-ConnectionGUID: QI6X481uR9eFveENDH8VaQ==
X-CSE-MsgGUID: fkq3BFKfTKCl4Mb9SbNqXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="27462674"
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; 
   d="scan'208";a="27462674"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 13:25:44 -0700
X-CSE-ConnectionGUID: G7VCctd4T3+M9kcSK/O9Eg==
X-CSE-MsgGUID: 8jsINd9VSO2wca8ahjIhog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; 
   d="scan'208";a="67849851"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.120.199])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 13:25:42 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: linux-doc@vger.kernel.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Rae Moar <rmoar@google.com>
Subject: [PATCH] kernel-doc: Allow whitespace before comment start
Date: Thu, 29 Aug 2024 22:25:29 +0200
Message-Id: <20240829202529.1660-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is some existing documentation that is formatted with some
indent at the beginning (like one in include/kunit/visibility.h).

However, such notation is not recognized by the script and attempt
to include that in kernel documentation fails with:

../include/kunit/visibility.h:1: warning: no structured comments found

Change the doc_start regex to also match /** with some whitespaces
at beginning of the line.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Rae Moar <rmoar@google.com>
---
 scripts/kernel-doc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 2791f8195203..6f91b26d63b6 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -246,7 +246,7 @@ my $decl_type;
 # Name of the kernel-doc identifier for non-DOC markups
 my $identifier;
 
-my $doc_start = '^/\*\*\s*$'; # Allow whitespace at end of comment start.
+my $doc_start = '^[ \t]*/\*\*\s*$'; # Allow whitespace before and at end of comment start.
 my $doc_end = '\*/';
 my $doc_com = '\s*\*\s*';
 my $doc_com_body = '\s*\* ?';
-- 
2.43.0


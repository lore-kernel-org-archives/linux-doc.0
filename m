Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3FE14A09F;
	Fri,  3 Jan 2025 00:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.138.36.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735865121; cv=none; b=KG4QQOl/IwX5nBx58PW6i+cqECU/4wnTSUW2bkiUP5H1PEJVNvzOg86/mdMTOw4XVaZT3HV19EZPk7k6ph2cwgIgMzobwIs7REUSOP5yVGcbGRHaCSMsYt3G7a4UYXqYqlqXKdqkwfT0U3hzuyu7hNqsGofl46Izf2CeHT54Qw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735865121; c=relaxed/simple;
	bh=edUiaiBQ7Qrsi4q5GX45z8CKGm14ZDYtkiUKGXx6TqI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qmVSL0QYGf/37kd5+OHSZIVi4qiix4FXVetIj2Nm+9mInS5jGaHHsFrmHhAtENKP4lF4UUoOPndmEJTfpvqYek+lkjEbD42KniYDhf5AX5QGTQgIg/eTaP7euyXNijK/j6oY0P5yRKlPcfV4/ASOfbfNosMZxt16O4e74XSPso0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=JCbSHfrR; arc=none smtp.client-ip=139.138.36.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="JCbSHfrR"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735865118; x=1767401118;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=edUiaiBQ7Qrsi4q5GX45z8CKGm14ZDYtkiUKGXx6TqI=;
  b=JCbSHfrR5+CwHraky4hA66XNSy2lhQ8wkB/7oC7Vs+JC1j2PXdquCd3T
   CQ8O3JdkJ98HdR9BSixMSSa5+qTkH4vCuLrNtnnWYueMl9ambUN8e63If
   Ibg0SJwqbtGPgck97Z9qYxHrzt5sKQqKQKCTTeWCqSUlpgHm0pc6/AMON
   mewouaO+9myrHdljSfWSUUlk6s5P/FzI0SRRlnI/UgPC58K5me6zK0gdb
   oeoSMpl76Apf2uRO1LUz5TT9wSRYBMsJ+pBq330v9G5xi4zSFgEYk3dDw
   inmd8vqDwM9txjtI69in9MsbrMG+cDdxKnkub5oSSVHIpuqIfPXt1YHYF
   g==;
X-CSE-ConnectionGUID: 1tkKrDrTQH6p0m419u52OA==
X-CSE-MsgGUID: Od9EQY2dSqGZJ2Pd7w8M3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="173845385"
X-IronPort-AV: E=Sophos;i="6.12,286,1728918000"; 
   d="scan'208";a="173845385"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 09:44:06 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8A239D6EA1;
	Fri,  3 Jan 2025 09:44:04 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5C07CD504E;
	Fri,  3 Jan 2025 09:44:04 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C895E20076D0F;
	Fri,  3 Jan 2025 09:44:03 +0900 (JST)
Received: from iaas-rpma.. (unknown [10.167.135.44])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1213C1A006C;
	Fri,  3 Jan 2025 08:44:02 +0800 (CST)
From: Li Zhijian <lizhijian@fujitsu.com>
To: linux-doc@vger.kernel.org
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org,
	Li Zhijian <lizhijian@fujitsu.com>
Subject: [PATCH] Documentation: Fix typo localmodonfig -> localmodconfig
Date: Fri,  3 Jan 2025 08:43:58 +0800
Message-Id: <20250103004358.1310121-1-lizhijian@fujitsu.com>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28898.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28898.003
X-TMASE-Result: 10--0.722500-10.000000
X-TMASE-MatchedRID: Ll6vM9Ck4lD1FjL5pOozBYGD9MrmzQNzTJDl9FKHbrkzY4Z+W6z6mugo
	SvaKsl/kIvrftAIhWmIVQaIxyJ2Ho9/K1ikJIsLO/e+uN180e5dtGams9PgywgziLcNJx/Sx2zy
	DP4XJBPsKx6jkYhVsxnEN3Bug6vd/IPhxRQ8o5ncEClJgjzpjqH0tCKdnhB589yM15V5aWpj6C0
	ePs7A07YVH0dq7wY7u0ajLfKHfEWFHpW5QJy8C2KT/FpUU64VreqdlFIbb/Jsk2nudZJ6GqyUAT
	yKGR+kOZJB3WKCVtnFCfANOGOiCALjplylGOjMvjGtT3o7GSawVxRB/din+uJ07T8ZSLiAVvR84
	/OmB1wQp4n8eQBnwiw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0

It's noticed when I myself made the same spelling mistake while
searching for localmodconfig

Signed-off-by: Li Zhijian <lizhijian@fujitsu.com>
---
 Documentation/admin-guide/quickly-build-trimmed-linux.rst       | 2 +-
 .../admin-guide/verify-bugs-and-bisect-regressions.rst          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/quickly-build-trimmed-linux.rst b/Documentation/admin-guide/quickly-build-trimmed-linux.rst
index f08149bc53f8..07cfd8863b46 100644
--- a/Documentation/admin-guide/quickly-build-trimmed-linux.rst
+++ b/Documentation/admin-guide/quickly-build-trimmed-linux.rst
@@ -733,7 +733,7 @@ can easily happen that your self-built kernel will lack modules for tasks you
 did not perform before utilizing this make target. That's because those tasks
 require kernel modules that are normally autoloaded when you perform that task
 for the first time; if you didn't perform that task at least once before using
-localmodonfig, the latter will thus assume these modules are superfluous and
+localmodconfig, the latter will thus assume these modules are superfluous and
 disable them.
 
 You can try to avoid this by performing typical tasks that often will autoload
diff --git a/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst b/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
index 6281eae9e6bc..03c55151346c 100644
--- a/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
+++ b/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
@@ -1431,7 +1431,7 @@ can easily happen that your self-built kernels will lack modules for tasks you
 did not perform at least once before utilizing this make target. That happens
 when a task requires kernel modules which are only autoloaded when you execute
 it for the first time. So when you never performed that task since starting your
-kernel the modules will not have been loaded -- and from localmodonfig's point
+kernel the modules will not have been loaded -- and from localmodconfig's point
 of view look superfluous, which thus disables them to reduce the amount of code
 to be compiled.
 
-- 
2.47.0


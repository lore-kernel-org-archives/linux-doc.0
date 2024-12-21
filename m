Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5C6187342
	for <linux-doc@vger.kernel.org>; Sat, 21 Dec 2024 22:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734819758; cv=none; b=F++2Nv4xL1+x0ROu7DikydNsZfg4eK9031CheUkpGiYVXewjDTOuqYU1lTbQYob2VSPg253taKj9dCfv9spI4OT5lAo2QGuvaPI5Kw7oR5qpkKnDPL+3imA0G9WM5FF1iU6ZdYV/0PCFcGu1Zfd6q22rXsI9x/KiWJwtJ7mXcQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734819758; c=relaxed/simple;
	bh=GvWRQjnm51tB/hOWae8XVTM6aatIp+CWnu1XSnf8kT8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GgCP6Fkg52wei/G1D4qFmBPNQarBFydG0FtcgUShoWZqqlsA+pV9kX1/kpEUkHD3R2sPYJT6Sl89f8CinoXLP+fIdSj/CnirTavdYbPOGomWBi+iHnv3IuxP0I8Me7X5Txa3NAWVg0YQ89WIgXZfV8dMy3Ew6ek4f3Bib1gGiok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bQvZddZn; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bQvZddZn"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BLLuMfd018977;
	Sat, 21 Dec 2024 22:22:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2023-11-20; bh=rwjDb
	1A1togsrGQ1/q0rDVH/av7C7UsBQLBuoFOs9jA=; b=bQvZddZnE1rVJs05jp25t
	KGduxGmiKIcis2l6btl0GGe9keUYLvL0OS2XutWeAqxwBDTr966x39ffcnbDIMmc
	ax5bjg0r8+iXOe8EDBXeruQgSOfWtwcRguuzmyoohsT1imAhrfLQQINVAmP3hB58
	gNjgTxOBwP1LKNFuZYmXLvsgZL/Ne6RQw1Sod9QkX7K9/8mwwD2HL78oqc1tfuLY
	FVAliHy2o6eNyLMDWdIoKc0kjdMmJ1jo7Y6eEtBkZdc0rhu2UhWI9tR0dxNNam1F
	EsfoWuYL/bAyd/zvNRMHUm5VD+ENqfkFc08JxfxrrNYA647r1NNa0JJzXbbzbHKD
	Q==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43nq6s8hcu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 21 Dec 2024 22:22:27 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BLM9rMV026577;
	Sat, 21 Dec 2024 22:22:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43nm45rvfq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 21 Dec 2024 22:22:26 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4BLMMPRC010959;
	Sat, 21 Dec 2024 22:22:25 GMT
Received: from localhost.localdomain (dhcp-10-175-35-3.vpn.oracle.com [10.175.35.3])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 43nm45rvf3-1;
	Sat, 21 Dec 2024 22:22:25 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Vegard Nossum <vegard.nossum@oracle.com>,
        John Ousterhout <ouster@cs.stanford.edu>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] scripts/kernel-doc: fix identifier parsing regex
Date: Sat, 21 Dec 2024 23:22:14 +0100
Message-Id: <20241221222214.1969823-1-vegard.nossum@oracle.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <87wmfum5op.fsf@trenco.lwn.net>
References: <87wmfum5op.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-21_10,2024-12-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 mlxlogscore=999
 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412210202
X-Proofpoint-ORIG-GUID: LjgKWpLWHWaTUXhOopURvCdjOJRz9K0S
X-Proofpoint-GUID: LjgKWpLWHWaTUXhOopURvCdjOJRz9K0S

John wrote:

> kernel-doc gets confused by code like the following:
>
> /**
>  * define HOMA_MIN_DEFAULT_PORT - The 16-bit port space is divided into
>  * two nonoverlapping regions. Ports 1-32767 are reserved exclusively
>  * for well-defined server ports. The remaining ports are used for client
>  * ports; these are allocated automatically by Homa. Port 0 is reserved.
>  */
> #define HOMA_MIN_DEFAULT_PORT 0x8000
>
> It seems to use the last "-" on the line (the one in "16-bit") rather
> than the first one, so it produces the following false error message:
>
> homa.h:50: warning: expecting prototype for HOMA_MIN_DEFAULT_PORT -
> The 16(). Prototype was for HOMA_MIN_DEFAULT_PORT() instead
>
> There are similar problems if there is a ":" later on the line.

The problem is the regex for the identifier, which is a greedy /.*/ that
matches everything up to the last - or : (i.e. $decl_end). Fix it by
tightening up this regex and not matching those characters as part of the
identifier.

Link: https://lore.kernel.org/all/CAGXJAmzfRzE=A94NT5ETtj3bZc-=2oLg-9E5Kjh4o_-iuw1q8g@mail.gmail.com/
Reported-by: John Ousterhout <ouster@cs.stanford.edu>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 scripts/kernel-doc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 4ee843d3600e2..e57c5e989a0a8 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -2085,7 +2085,7 @@ sub process_name($$) {
         # Look for foo() or static void foo() - description; or misspelt
         # identifier
         elsif (/^$decl_start$fn_type?(\w+)\s*$parenthesis?\s*$decl_end?$/ ||
-            /^$decl_start$fn_type?(\w+.*)$parenthesis?\s*$decl_end$/) {
+            /^$decl_start$fn_type?(\w+[^-:]*)$parenthesis?\s*$decl_end$/) {
             $identifier = $1;
             $decl_type = 'function';
             $identifier =~ s/^define\s+//;
-- 
2.34.1


Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF7E131735
	for <linux-doc@vger.kernel.org>; Thu, 15 Feb 2024 13:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708004941; cv=none; b=Ao89D2fRpM5extEMeI/kB8dsp7LTS/e1IX4gUgrGnaNQskZmZg3BomMa5wz+rjYGtwclWfqknXpJEESN8lDcvevaF2Z/f6642yv+Hd8sRzCnzlp2SOU9Gjcv4fXKA8RCyn++cBNRnmX4usyYkHQ5SrqNncmsU0FljDVOnEagvqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708004941; c=relaxed/simple;
	bh=a6Onpc5iiWQax2Y1RhcAv2O9+O1ljR5iULhDR9mo1RM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ccGreMIsMfycUWJJKxK5IlciahevwqI34GiY2iA9W8wVPLbbC2JMnXKLTy/e0G5bJOBFqQjuqbEXWSGUlvvyf3uyKj4OnduAC1Ci+PeJOuS8mFkyEDBIQSquRH1QsScqVRGXp6clzNTjVQ0abv6jMr/fmRv5h5Ijajlc8LTq3+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kW81ingy; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kW81ingy"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41FD3SVw001412;
	Thu, 15 Feb 2024 13:48:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2023-11-20;
 bh=m9BsiYwzoYNw+xjP/WrSkGI9+xe/EabCCF57v21q0mA=;
 b=kW81ingyTrGMBolcSabL2eJofk7XQROWncP1mMGATwICqS2Y0kyez7sEtLF3WayN51cb
 czhDRS5GCQ4TxetegyK1h0VgaFSq4DrVUzEcXywFhr7h+HkLtRqElDFprYbUNQhCAG1m
 CjOfMAqYU0H8HKZIPMdJdQhksCco4BZbKtaN95XrZjmvLZxInpdwHaTgQM7Z+jiYYeBN
 spAj1urwlxW6g18h1KBvY3/tSXDoNBY0MqQN97gJ/yJH3ypbEDIZ/wjqeLe2apPG8nJb
 EF3MpiJXIfC8uS+BF75lVJ3odY3asC4jV/Vnr+jyMbHafrJqzlakMmRUaAErgsRCzDxi Cg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3w9301j5ja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 13:48:54 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 41FCiCKn000839;
	Thu, 15 Feb 2024 13:48:45 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3w5ykaj22w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 13:48:45 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41FDmgl2034749;
	Thu, 15 Feb 2024 13:48:45 GMT
Received: from localhost.localdomain (dhcp-10-175-53-231.vpn.oracle.com [10.175.53.231])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 3w5ykaj1xg-3;
	Thu, 15 Feb 2024 13:48:44 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Vegard Nossum <vegard.nossum@oracle.com>
Subject: [PATCH 2/5] scripts/kernel-doc: simplify function printing
Date: Thu, 15 Feb 2024 14:48:25 +0100
Message-Id: <20240215134828.1277109-3-vegard.nossum@oracle.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240215134828.1277109-1-vegard.nossum@oracle.com>
References: <20240215134828.1277109-1-vegard.nossum@oracle.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_12,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0 mlxscore=0
 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402150111
X-Proofpoint-GUID: yP5lJZ0lHzGmsgiqu3hePSuM1hDL8L9a
X-Proofpoint-ORIG-GUID: yP5lJZ0lHzGmsgiqu3hePSuM1hDL8L9a

Get rid of the $start variable, since it's really not necessary.

No functional change.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 scripts/kernel-doc | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 4dc5c3909d8c..9b7441e77669 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -820,7 +820,6 @@ sub output_function_rst(%) {
     my %args = %{$_[0]};
     my ($parameter, $section);
     my $oldprefix = $lineprefix;
-    my $start = "";
     my $is_macro = 0;
 
     if ($sphinx_major < 3) {
@@ -830,7 +829,7 @@ sub output_function_rst(%) {
             print "   **Typedef**: ";
             $lineprefix = "";
             output_highlight_rst($args{'purpose'});
-            $start = "\n\n**Syntax**\n\n  ``";
+            print "\n\n**Syntax**\n\n  ``";
             $is_macro = 1;
         } else {
             print ".. c:function:: ";
@@ -848,17 +847,16 @@ sub output_function_rst(%) {
             print "   **Typedef**: ";
             $lineprefix = "";
             output_highlight_rst($args{'purpose'});
-            $start = "\n\n**Syntax**\n\n  ``";
+            print "\n\n**Syntax**\n\n  ``";
         } else {
             print "``" if ($is_macro);
         }
     }
     if ($args{'functiontype'} ne "") {
-        $start .= $args{'functiontype'} . " " . $args{'function'} . " (";
+        print $args{'functiontype'} . " " . $args{'function'} . " (";
     } else {
-        $start .= $args{'function'} . " (";
+        print $args{'function'} . " (";
     }
-    print $start;
 
     my $count = 0;
     foreach my $parameter (@{$args{'parameterlist'}}) {
-- 
2.34.1


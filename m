Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819B113173E
	for <linux-doc@vger.kernel.org>; Thu, 15 Feb 2024 13:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708004936; cv=none; b=cF/uHh7wJ4NMvQSfOEOGjikU6oe0Xn82WlTfIUSiounA0vuuANCpHni4R39K3OZ5Xk/mewUK4oLYHxFMRifP1sFnsX4813T9R/lFqGOmn3u2xxemW7kaACUhHbpeMLhIhtRel8TriCZYmFpDOIFoGm72r0QNhrcc8aaaFrh2aos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708004936; c=relaxed/simple;
	bh=DSr7tMfDOOC9c4eQPKnarrQzw0axMRD8tQvf+8q7Qxg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ohVCho4gw2Il+vUTkelSbU08W8wCHMgVrOMy9bIlZV2lf6OL4ZKqhJvZVs9AO2yfPCbfhdEZH5tgcUGeV1qW0P42LB0isahOmNcFa8V0Oj7Bcw+OLDrH7J76/+dL4Dyht3qD6FvyaT08lwL7Rnob/lXeXtJhhrzFWQ4ZMX49Aq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TNC+ySTn; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TNC+ySTn"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41FDJGo5032693;
	Thu, 15 Feb 2024 13:48:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2023-11-20;
 bh=A6lBYPB89e3zVxAMHG2L3kJMSdhmJjbtzNe1Eno8kv8=;
 b=TNC+ySTnoZOMqkXg2sOBT+bCpH9obk8ZbC11vv23C/7tfTgUaeZC9owniQ6UC3+b3JKh
 DdmdvUBstqj9YMW+Hps5Ebbaf3O/uBlUZ2zwe6xU68OyaCclifg1IlQdhaP85KV/u2Au
 AcvyhAWrI0EA/QCCTqKiycj72GleEjKaLiV6UNz4jhxh0sV2VT7omXSQ/Eby2cLWALx2
 BASeGMRhgWPMx7YOk6xeLvvQMIackFmGA1VwAWZteXVFM45rrcjUpp3vXwSCdzz8lc5B
 mv3sl/473AVPc3bBjGdx5N5vBLGP86FZ4KfW8RjUbVfmOAZekyxEm4BUs+bIISakAqqM uQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3w91w6tb40-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 13:48:53 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 41FDTCcs000716;
	Thu, 15 Feb 2024 13:48:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3w5ykaj246-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 13:48:46 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41FDmgl4034749;
	Thu, 15 Feb 2024 13:48:46 GMT
Received: from localhost.localdomain (dhcp-10-175-53-231.vpn.oracle.com [10.175.53.231])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 3w5ykaj1xg-4;
	Thu, 15 Feb 2024 13:48:46 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Vegard Nossum <vegard.nossum@oracle.com>
Subject: [PATCH 3/5] scripts/kernel-doc: separate out function signature
Date: Thu, 15 Feb 2024 14:48:26 +0100
Message-Id: <20240215134828.1277109-4-vegard.nossum@oracle.com>
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
X-Proofpoint-ORIG-GUID: JVgvy4_NMjDBx8R4qYZAyq2BfUUPSDc7
X-Proofpoint-GUID: JVgvy4_NMjDBx8R4qYZAyq2BfUUPSDc7

Format the entire function signature and place it in a separate variable;
this both makes it easier to understand what these lines of code are doing
and will allow us to simplify the code further in the following patch.

No functional change.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 scripts/kernel-doc | 49 ++++++++++++++++++++++++++--------------------
 1 file changed, 28 insertions(+), 21 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 9b7441e77669..1af2c68f6bd8 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -822,6 +822,31 @@ sub output_function_rst(%) {
     my $oldprefix = $lineprefix;
     my $is_macro = 0;
 
+    my $signature = "";
+    if ($args{'functiontype'} ne "") {
+        $signature = $args{'functiontype'} . " " . $args{'function'} . " (";
+    } else {
+        $signature = $args{'function'} . " (";
+    }
+
+    my $count = 0;
+    foreach my $parameter (@{$args{'parameterlist'}}) {
+        if ($count ne 0) {
+            $signature .= ", ";
+        }
+        $count++;
+        $type = $args{'parametertypes'}{$parameter};
+
+        if ($type =~ m/$function_pointer/) {
+            # pointer-to-function
+            $signature .= $1 . $parameter . ") (" . $2 . ")";
+        } else {
+            $signature .= $type;
+        }
+    }
+
+    $signature .= ")";
+
     if ($sphinx_major < 3) {
         if ($args{'typedef'}) {
             print ".. c:type:: ". $args{'function'} . "\n\n";
@@ -852,31 +877,13 @@ sub output_function_rst(%) {
             print "``" if ($is_macro);
         }
     }
-    if ($args{'functiontype'} ne "") {
-        print $args{'functiontype'} . " " . $args{'function'} . " (";
-    } else {
-        print $args{'function'} . " (";
-    }
 
-    my $count = 0;
-    foreach my $parameter (@{$args{'parameterlist'}}) {
-        if ($count ne 0) {
-            print ", ";
-        }
-        $count++;
-        $type = $args{'parametertypes'}{$parameter};
+    print $signature;
 
-        if ($type =~ m/$function_pointer/) {
-            # pointer-to-function
-            print $1 . $parameter . ") (" . $2 . ")";
-        } else {
-            print $type;
-        }
-    }
     if ($is_macro) {
-        print ")``\n\n";
+        print "``\n\n";
     } else {
-        print ")\n\n";
+        print "\n\n";
     }
     if (!$args{'typedef'}) {
         print_lineno($declaration_start_line);
-- 
2.34.1


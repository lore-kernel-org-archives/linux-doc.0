Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4124131738
	for <linux-doc@vger.kernel.org>; Thu, 15 Feb 2024 13:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708004934; cv=none; b=inxJ8sv6hDUK1yrGmsHA56RzXFt8XQjxxNDG1GkiNMWvQra5nYfUONL280Rt4wIbR8QTAyJH4bbU5S/u2t/SIsyoMqJo/KYiiXEKVpTFN9Ep+do48HJVpudhHOdmuVZA7FIAGoAoHhz3nKjTEjElxrnCgxTc6w2Gm8GLbIOjpug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708004934; c=relaxed/simple;
	bh=In6Bb2O/k8VAmCS7YGcmRSs5r365Ba+sSOZ4mCXyR4A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LpKFypxPwmqm1GJaszV7NBQ7IUzL8p8g1S4D3HnSVgH1/hGm0vOsQGCAHG3oVEb0n/VsSyQi+7lhVjNVmnABHCKOlwu5KgVQnq9iqe4F+KHtdNgwnM1LLlD9k37sEVpVBs5yw/3vZH6PAgLctiMtdGrsiDSko5Jw0o+k2bkGOKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=J3iJZ0Qa; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="J3iJZ0Qa"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41FDHU6F030932;
	Thu, 15 Feb 2024 13:48:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2023-11-20;
 bh=zOpm4FLl1gRphhqNQNZcW4Jt+PKCvTN4ZyVi98Qw29I=;
 b=J3iJZ0QaqL80p2cPiIj61g4Cu4oUYI52ny+aGt/MOfU3oylCWkNB0E2gY/HlNYFacRgN
 iy5w0ujDsacQeYo2iGo0yhy+ff2grxRHpJaz/E+nznmVfcFEJD6ZUCGWh70osnCNtyDm
 LTZ5TJbMO+ALn2ZUUpVygGhg+KaHZ86fwcpweYCMFzmb3116xzkImXbVDrmZWngTJWbR
 tePUeWGhhaCkxdPVaAgksv/jakmplsUBTh2NLsQssJy2QPIB/j0ecwqkSM8C6oiNMj78
 SfuODlpE1+o9RJEJraXLVNz0+ghwHni2Wxn3OOBYkClLoRb3EJ3VOC25XdBuIVIGVIJ5 xQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3w92ppj64b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 13:48:51 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 41FCjdGu000479;
	Thu, 15 Feb 2024 13:48:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3w5ykaj25s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 13:48:48 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41FDmgl6034749;
	Thu, 15 Feb 2024 13:48:48 GMT
Received: from localhost.localdomain (dhcp-10-175-53-231.vpn.oracle.com [10.175.53.231])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 3w5ykaj1xg-5;
	Thu, 15 Feb 2024 13:48:47 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Vegard Nossum <vegard.nossum@oracle.com>
Subject: [PATCH 4/5] scripts/kernel-doc: simplify signature printing
Date: Thu, 15 Feb 2024 14:48:27 +0100
Message-Id: <20240215134828.1277109-5-vegard.nossum@oracle.com>
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
X-Proofpoint-ORIG-GUID: S4EuendElJyszNgCdD_apX4Dm-VhuLFc
X-Proofpoint-GUID: S4EuendElJyszNgCdD_apX4Dm-VhuLFc

Untangle some of the $is_macro logic and the nested conditionals.

This makes it easier to see where and how the signature is actually
printed.

No functional change.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 scripts/kernel-doc | 36 ++++++++++++++----------------------
 1 file changed, 14 insertions(+), 22 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 1af2c68f6bd8..7acb7554abb9 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -820,7 +820,6 @@ sub output_function_rst(%) {
     my %args = %{$_[0]};
     my ($parameter, $section);
     my $oldprefix = $lineprefix;
-    my $is_macro = 0;
 
     my $signature = "";
     if ($args{'functiontype'} ne "") {
@@ -854,37 +853,30 @@ sub output_function_rst(%) {
             print "   **Typedef**: ";
             $lineprefix = "";
             output_highlight_rst($args{'purpose'});
-            print "\n\n**Syntax**\n\n  ``";
-            $is_macro = 1;
+            print "\n\n**Syntax**\n\n";
+            print "  ``$signature``\n\n";
         } else {
-            print ".. c:function:: ";
+            print ".. c:function:: $signature\n\n";
         }
     } else {
         if ($args{'typedef'} || $args{'functiontype'} eq "") {
-            $is_macro = 1;
             print ".. c:macro:: ". $args{'function'} . "\n\n";
-        } else {
-            print ".. c:function:: ";
-        }
 
-        if ($args{'typedef'}) {
-            print_lineno($declaration_start_line);
-            print "   **Typedef**: ";
-            $lineprefix = "";
-            output_highlight_rst($args{'purpose'});
-            print "\n\n**Syntax**\n\n  ``";
+            if ($args{'typedef'}) {
+                print_lineno($declaration_start_line);
+                print "   **Typedef**: ";
+                $lineprefix = "";
+                output_highlight_rst($args{'purpose'});
+                print "\n\n**Syntax**\n\n";
+                print "  ``$signature``\n\n";
+            } else {
+                print "``$signature``\n\n";
+            }
         } else {
-            print "``" if ($is_macro);
+            print ".. c:function:: $signature\n\n";
         }
     }
 
-    print $signature;
-
-    if ($is_macro) {
-        print "``\n\n";
-    } else {
-        print "\n\n";
-    }
     if (!$args{'typedef'}) {
         print_lineno($declaration_start_line);
         $lineprefix = "   ";
-- 
2.34.1


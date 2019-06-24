Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5E8F57D2EF
	for <lwn-linux-doc@archive.lwn.net>; Mon, 24 Jun 2019 05:22:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbfFXFWc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 24 Jun 2019 01:22:32 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:64446 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726304AbfFXFWc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 24 Jun 2019 01:22:32 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5O5LdAj129802
        for <linux-doc@vger.kernel.org>; Mon, 24 Jun 2019 01:22:31 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2tap024b08-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Mon, 24 Jun 2019 01:22:31 -0400
Received: from localhost
        by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.ibm.com>;
        Mon, 24 Jun 2019 06:22:28 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
        by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Mon, 24 Jun 2019 06:22:26 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x5O5MP3c58065004
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 24 Jun 2019 05:22:25 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 15184A4067;
        Mon, 24 Jun 2019 05:22:25 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id BB1A0A4060;
        Mon, 24 Jun 2019 05:22:23 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.8.168])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Mon, 24 Jun 2019 05:22:23 +0000 (GMT)
Received: by rapoport-lnx (sSMTP sendmail emulation); Mon, 24 Jun 2019 08:22:23 +0300
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-doc@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
Subject: [PATCH v2] scripts/sphinx-pre-install: fix out-of-tree build
Date:   Mon, 24 Jun 2019 08:22:22 +0300
X-Mailer: git-send-email 2.7.4
X-TM-AS-GCONF: 00
x-cbid: 19062405-0028-0000-0000-0000037CF3C4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062405-0029-0000-0000-0000243D0F26
Message-Id: <1561353742-19608-1-git-send-email-rppt@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-06-24_05:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906240045
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Build of htmldocs fails for out-of-tree builds:

$ make V=1 O=~/build/kernel/ htmldocs
make -C /home/rppt/build/kernel -f /home/rppt/git/linux-docs/Makefile htmldocs
make[1]: Entering directory '/home/rppt/build/kernel'
make -f /home/rppt/git/linux-docs/scripts/Makefile.build obj=scripts/basic
rm -f .tmp_quiet_recordmcount
make -f /home/rppt/git/linux-docs/scripts/Makefile.build obj=Documentation htmldocs
Can't open Documentation/conf.py at /home/rppt/git/linux-docs/scripts/sphinx-pre-install line 230.
/home/rppt/git/linux-docs/Documentation/Makefile:80: recipe for target 'htmldocs' failed
make[2]: *** [htmldocs] Error 2

The scripts/sphinx-pre-install is trying to open files in the current
directory which is $KBUILD_OUTPUT rather than in $srctree.

Fix it.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
v2: use "./" as default prefix as Mauro suggested

 scripts/sphinx-pre-install | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/sphinx-pre-install b/scripts/sphinx-pre-install
index 0b44d51..f710bbd 100755
--- a/scripts/sphinx-pre-install
+++ b/scripts/sphinx-pre-install
@@ -5,8 +5,9 @@ use strict;
 # Copyright (c) 2017-2019 Mauro Carvalho Chehab <mchehab@kernel.org>
 #
 
-my $conf = "Documentation/conf.py";
-my $requirement_file = "Documentation/sphinx/requirements.txt";
+my $prefix = "$ENV{'srctree'}/";
+my $conf = $prefix . "Documentation/conf.py";
+my $requirement_file = $prefix . "Documentation/sphinx/requirements.txt";
 my $virtenv_prefix = "sphinx_";
 
 #
-- 
2.7.4


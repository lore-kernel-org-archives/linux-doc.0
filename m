Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 430497D082
	for <lwn-linux-doc@archive.lwn.net>; Thu,  4 Oct 2018 03:26:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727071AbeJDKRY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 4 Oct 2018 06:17:24 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:53050 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726998AbeJDKRY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Oct 2018 06:17:24 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.22/8.16.0.22) with SMTP id w943O1U6010449;
        Thu, 4 Oct 2018 03:26:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : from : to :
 cc : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=aof8g+q23z29hTD9UcJQoanshpWXccCn/tYlU8uaCVI=;
 b=FfcWWtlZr6qD4yeLLtr3Pjfus2+Q7E61qONSSm25HYTMQfghwoR8GmSD+/3iT2E3v9DX
 9E1q3vCl5a15hkhqdspJmjp63WH3FqNYTeY+sSUEJP16F3c7ru6RJ4YAp8UJPYh9AXgr
 /yBvq5hdb9e9QKEXmlo9MfOt+McupONF7ynr2Gxlmq8y72/u8c+kFXjaN8VTMUr++e/2
 WYAZbZz87hDsx2F+oP5zfNac7dQ++/ug7It8zpddEwE+0cTQh3NBmQh84q9YdneTiRGn
 PipoJ9CcLHf/Eb70BkuMz71zw2Lq7xSMwzwVdFfJh2rVU1z27AbIVhgzwTKo+n1pZFWg vw== 
Received: from aserv0022.oracle.com (aserv0022.oracle.com [141.146.126.234])
        by userp2120.oracle.com with ESMTP id 2mt21r8yqt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 04 Oct 2018 03:26:11 +0000
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserv0022.oracle.com (8.14.4/8.14.4) with ESMTP id w943QBpD000439
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 4 Oct 2018 03:26:11 GMT
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id w943QAuo001861;
        Thu, 4 Oct 2018 03:26:10 GMT
Received: from localhost (/67.169.218.210)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 04 Oct 2018 03:26:10 +0000
Subject: [PATCH 08/22] docs: add XFS testing chapter to the DS&A book
From:   "Darrick J. Wong" <darrick.wong@oracle.com>
To:     darrick.wong@oracle.com
Cc:     linux-xfs@vger.kernel.org, linux-doc@vger.kernel.org,
        corbet@lwn.net
Date:   Wed, 03 Oct 2018 20:26:08 -0700
Message-ID: <153862356885.27883.11690331438941942918.stgit@magnolia>
In-Reply-To: <153862350727.27883.9408120819569795102.stgit@magnolia>
References: <153862350727.27883.9408120819569795102.stgit@magnolia>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9035 signatures=668707
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1807170000 definitions=main-1810040034
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Darrick J. Wong <darrick.wong@oracle.com>

Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
---
 .../filesystems/xfs-data-structures/overview.rst   |    1 +
 .../filesystems/xfs-data-structures/testing.rst    |   25 ++++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 Documentation/filesystems/xfs-data-structures/testing.rst


diff --git a/Documentation/filesystems/xfs-data-structures/overview.rst b/Documentation/filesystems/xfs-data-structures/overview.rst
index 23eb71d65c93..d6711dc653d8 100644
--- a/Documentation/filesystems/xfs-data-structures/overview.rst
+++ b/Documentation/filesystems/xfs-data-structures/overview.rst
@@ -49,3 +49,4 @@ latency.
 .. include:: reconstruction.rst
 .. include:: common_types.rst
 .. include:: magic.rst
+.. include:: testing.rst
diff --git a/Documentation/filesystems/xfs-data-structures/testing.rst b/Documentation/filesystems/xfs-data-structures/testing.rst
new file mode 100644
index 000000000000..3d3386854408
--- /dev/null
+++ b/Documentation/filesystems/xfs-data-structures/testing.rst
@@ -0,0 +1,25 @@
+.. SPDX-License-Identifier: CC-BY-SA-4.0
+
+Testing Filesystem Changes
+--------------------------
+
+People put a lot of trust in filesystems to preserve their data in a reliable
+fashion. To that end, it is very important that users and developers have
+access to a suite of regression tests that can be used to prove correct
+operation of any given filesystem code, or to analyze failures to fix problems
+found in the code. The XFS regression test suite, xfstests, is hosted at
+``git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git``. Most tests apply to
+filesystems in general, but the suite also contains tests for features
+specific to each filesystem.
+
+When fixing bugs, it is important to provide a testcase exposing the bug so
+that the developers can avoid a future re-occurrence of the regression.
+Furthermore, if you’re developing a new user-visible feature for XFS, please
+help the rest of the development community to sustain and maintain the whole
+codebase by providing generous test coverage to check its behavior.
+
+When altering, adding, or removing an on-disk data structure, please remember
+to update both the in-kernel structure size checks in xfs\_ondisk.h and to
+ensure that your changes are reflected in xfstest xfs/122. These regression
+tests enable us to detect compiler bugs, alignment problems, and anything else
+that might result in the creation of incompatible filesystem images.


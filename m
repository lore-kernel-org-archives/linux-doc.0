Return-Path: <SRS0=Ik1b=BG=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6659C433EC
	for <linux-doc@archiver.kernel.org>; Mon, 27 Jul 2020 12:15:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9FE2A206E7
	for <linux-doc@archiver.kernel.org>; Mon, 27 Jul 2020 12:15:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NsuTsD8I"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgG0MPd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 27 Jul 2020 08:15:33 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:42440 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726555AbgG0MPd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Jul 2020 08:15:33 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06RCBdQt025461;
        Mon, 27 Jul 2020 12:15:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id; s=corp-2020-01-29;
 bh=Lu84bIqXRi6IU6raqhxUuwfN+SKzTo2JEvrSM/ogL2o=;
 b=NsuTsD8In/ZycIVU7B1dO7m78+VKrppC5llePiySLU7+4jpjdSy34pihbwOsbouKqbnt
 TiTlAVq1+rqxrnRXE6aPPBNo7TQLDE2rfcYggIDNp0O7E9ugJh+d6X2p1XCIaAP5Dbcw
 3FQzmLrypta7TGvqSXfL5/7mWceujB5dFteB1f4hkFhOX1rhyHbgBfEKQuWFvTowZ519
 d0j935JfdONCLa5kZSb0SggVRWkDBC1ZgTO2aw4K7g9305s7Xu08FVBMEFHFvv6zpWJa
 U1iVBxKxaQVCIGl+IzHAJM8KtGF3ndAvjDJ5a1KKU2NBoTSYtc/EvRLc/NVofdOA3zE9 ZQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 32hu1j95g0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 27 Jul 2020 12:15:31 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06RC8f4a160411;
        Mon, 27 Jul 2020 12:15:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3030.oracle.com with ESMTP id 32hu5sgyp6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 27 Jul 2020 12:15:30 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06RCDwS7186802;
        Mon, 27 Jul 2020 12:15:30 GMT
Received: from t460.home (dhcp-10-175-15-63.vpn.oracle.com [10.175.15.63])
        by aserp3030.oracle.com with ESMTP id 32hu5sgym5-1;
        Mon, 27 Jul 2020 12:15:29 +0000
From:   Vegard Nossum <vegard.nossum@oracle.com>
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     Vegard Nossum <vegard.nossum@oracle.com>
Subject: [PATCH 1/2] docs: path-lookup: more markup fixes
Date:   Mon, 27 Jul 2020 14:15:24 +0200
Message-Id: <20200727121525.28103-1-vegard.nossum@oracle.com>
X-Mailer: git-send-email 2.16.1.72.g5be1f00a9.dirty
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9694 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007270091
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

"xxx``at``" makes the `` appear verbatim in the HTML output. I've opted
for changing this into ``*at()`` to harmonise this with the use of * seen
later in the same document (and add the parentheses to clarify that this
is a system/function call).

``path_``* also makes `` appear in the HTML output, but we can fix it by
moving the * into the ``. Also add the parantheses here.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 Documentation/filesystems/path-lookup.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/filesystems/path-lookup.rst b/Documentation/filesystems/path-lookup.rst
index 1a8fae5036b34..23602547b8edb 100644
--- a/Documentation/filesystems/path-lookup.rst
+++ b/Documentation/filesystems/path-lookup.rst
@@ -43,15 +43,15 @@ characters, and "components" that are sequences of one or more
 non-"``/``" characters.  These form two kinds of paths.  Those that
 start with slashes are "absolute" and start from the filesystem root.
 The others are "relative" and start from the current directory, or
-from some other location specified by a file descriptor given to a
-"``XXXat``" system call such as `openat() <openat_>`_.
+from some other location specified by a file descriptor given to
+"``*at()``" system calls such as `openat() <openat_>`_.
 
 .. _execveat: http://man7.org/linux/man-pages/man2/execveat.2.html
 
 It is tempting to describe the second kind as starting with a
 component, but that isn't always accurate: a pathname can lack both
 slashes and components, it can be empty, in other words.  This is
-generally forbidden in POSIX, but some of those "xxx``at``" system calls
+generally forbidden in POSIX, but some of those "``*at()``" system calls
 in Linux permit it when the ``AT_EMPTY_PATH`` flag is given.  For
 example, if you have an open file descriptor on an executable file you
 can execute it by calling `execveat() <execveat_>`_ passing
@@ -655,8 +655,8 @@ This pattern of "try RCU-walk, if that fails try REF-walk" can be
 clearly seen in functions like ``filename_lookup()``,
 ``filename_parentat()``, ``filename_mountpoint()``,
 ``do_filp_open()``, and ``do_file_open_root()``.  These five
-correspond roughly to the four ``path_``* functions we met earlier,
-each of which calls ``link_path_walk()``.  The ``path_*`` functions are
+correspond roughly to the four ``path_*()`` functions we met earlier,
+each of which calls ``link_path_walk()``.  The ``path_*()`` functions are
 called using different mode flags until a mode is found which works.
 They are first called with ``LOOKUP_RCU`` set to request "RCU-walk".  If
 that fails with the error ``ECHILD`` they are called again with no
-- 
2.16.1.72.g5be1f00a9.dirty


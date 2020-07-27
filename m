Return-Path: <SRS0=Ik1b=BG=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC7ACC433ED
	for <linux-doc@archiver.kernel.org>; Mon, 27 Jul 2020 12:15:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D3C5206E7
	for <linux-doc@archiver.kernel.org>; Mon, 27 Jul 2020 12:15:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Qu58oTnM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726989AbgG0MPg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 27 Jul 2020 08:15:36 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:42472 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726555AbgG0MPf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Jul 2020 08:15:35 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06RCBg6d025473;
        Mon, 27 Jul 2020 12:15:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=xj2HBP46cEEbQMKu+8pYBUi/diWO+7wm4+GThpnwvm0=;
 b=Qu58oTnMC3wWBIm5i2GZ7LfDIus4EVDpWyJYCjFxnIXI5ief6eqwsLLWVlozyoVahTlx
 +1stQfj/+g4oPQ/74phQCCOeMz5DdU+mB4KhASnhBL12QLCH1TzVLN2SdGGXziFaXabt
 swjf7KYbk/1LgLULv0Ed69k7A33A73CxDZv2mSqHIQf+WMe2arXcbiOtXAJarV4cvvR4
 xuwcg/AHkZJB8YdWIqudX+B1uIXUlPhFk4VGT29GkBRJCVyorxWBXAv2e1Xxgryst6uU
 8IV5pp7XPHiKgDRSUpjHhtms3Xr0I3WN3gO0IQlNwcMQLFHE9xdGbpi/YIwaF3gEGK+K 1A== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 32hu1j95g5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 27 Jul 2020 12:15:34 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06RC8fnQ160367;
        Mon, 27 Jul 2020 12:15:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3030.oracle.com with ESMTP id 32hu5sgyrk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 27 Jul 2020 12:15:33 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06RCDwS9186802;
        Mon, 27 Jul 2020 12:15:33 GMT
Received: from t460.home (dhcp-10-175-15-63.vpn.oracle.com [10.175.15.63])
        by aserp3030.oracle.com with ESMTP id 32hu5sgym5-2;
        Mon, 27 Jul 2020 12:15:32 +0000
From:   Vegard Nossum <vegard.nossum@oracle.com>
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     Vegard Nossum <vegard.nossum@oracle.com>
Subject: [PATCH 2/2] docs: path-lookup: markup fixes for emphasis
Date:   Mon, 27 Jul 2020 14:15:25 +0200
Message-Id: <20200727121525.28103-2-vegard.nossum@oracle.com>
X-Mailer: git-send-email 2.16.1.72.g5be1f00a9.dirty
In-Reply-To: <20200727121525.28103-1-vegard.nossum@oracle.com>
References: <20200727121525.28103-1-vegard.nossum@oracle.com>
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

Underscores were being used for emphasis, but these are rendered verbatim
in HTML output. reStructuredText uses asterisks for emphasis. I *think* I
caught all of them.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 Documentation/filesystems/path-lookup.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/filesystems/path-lookup.rst b/Documentation/filesystems/path-lookup.rst
index 23602547b8edb..115b9340916e5 100644
--- a/Documentation/filesystems/path-lookup.rst
+++ b/Documentation/filesystems/path-lookup.rst
@@ -229,7 +229,7 @@ happened to be looking at a dentry that was moved in this way,
 it might end up continuing the search down the wrong chain,
 and so miss out on part of the correct chain.
 
-The name-lookup process (``d_lookup()``) does _not_ try to prevent this
+The name-lookup process (``d_lookup()``) does *not* try to prevent this
 from happening, but only to detect when it happens.
 ``rename_lock`` is a seqlock that is updated whenever any dentry is
 renamed.  If ``d_lookup`` finds that a rename happened while it
@@ -398,7 +398,7 @@ held.
 ``struct qstr last``
 ~~~~~~~~~~~~~~~~~~~~
 
-This is a string together with a length (i.e. _not_ ``nul`` terminated)
+This is a string together with a length (i.e. *not* ``nul`` terminated)
 that is the "next" component in the pathname.
 
 ``int last_type``
@@ -720,7 +720,7 @@ against a dentry.  The length and name pointer are copied into local
 variables, then ``read_seqcount_retry()`` is called to confirm the two
 are consistent, and only then is ``->d_compare()`` called.  When
 standard filename comparison is used, ``dentry_cmp()`` is called
-instead.  Notably it does _not_ use ``read_seqcount_retry()``, but
+instead.  Notably it does *not* use ``read_seqcount_retry()``, but
 instead has a large comment explaining why the consistency guarantee
 isn't necessary.  A subsequent ``read_seqcount_retry()`` will be
 sufficient to catch any problem that could occur at this point.
@@ -928,7 +928,7 @@ if anything goes wrong it is much safer to just abort and try a more
 sedate approach.
 
 The emphasis here is "try quickly and check".  It should probably be
-"try quickly _and carefully,_ then check".  The fact that checking is
+"try quickly *and carefully*, then check".  The fact that checking is
 needed is a reminder that the system is dynamic and only a limited
 number of things are safe at all.  The most likely cause of errors in
 this whole process is assuming something is safe when in reality it
-- 
2.16.1.72.g5be1f00a9.dirty


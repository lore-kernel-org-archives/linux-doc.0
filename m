Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 437887D082
	for <lwn-linux-doc@archive.lwn.net>; Thu,  4 Oct 2018 03:25:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727091AbeJDKQZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 4 Oct 2018 06:16:25 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:36672 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726998AbeJDKQZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Oct 2018 06:16:25 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.22/8.16.0.22) with SMTP id w943O2Ke059509;
        Thu, 4 Oct 2018 03:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : from : to :
 cc : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=corp-2018-07-02;
 bh=xuv+G80akpeM9jOmgAurlZzebFFeAAFp1ouu9RbkSsc=;
 b=Y2DZwisjrd+p/mxqzGuQD8x55tFBm2c9sUhhLahl5UNfGmeRzHgTcOmqAS1r9S2PXQEk
 aW++q6Y6eyAacVUVpxBL5vdhyI2Vf+MbyFAVpvnBvX9m8q/wBTHFYlNHxlQ3YVMg/zNC
 tfFqThFExa6EV3NUEfbAgVtanEWFSDHQ3l4jUqORNEosp5uw1jmCMx8rw3KKByKLLO+S
 yvljQCyMEwV5XUOExfkcVkAnNI+RO/dFKimiu37O2f9p9qTJqHnlF8XehCbH1FiaF++y
 GedfQH9IIvtYu5A3z/GYRtNqsP20+kg/bkS7FyAQ/tOb5uaAhtQh5reSpETd4/s+fo37 4Q== 
Received: from userv0022.oracle.com (userv0022.oracle.com [156.151.31.74])
        by aserp2120.oracle.com with ESMTP id 2mt1bq9150-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 04 Oct 2018 03:25:12 +0000
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userv0022.oracle.com (8.14.4/8.14.4) with ESMTP id w943PAut010906
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 4 Oct 2018 03:25:11 GMT
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id w943P9v9000675;
        Thu, 4 Oct 2018 03:25:09 GMT
Received: from localhost (/67.169.218.210)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 04 Oct 2018 03:25:09 +0000
Subject: [PATCH v2 00/22] xfs-4.20: major documentation surgery
From:   "Darrick J. Wong" <darrick.wong@oracle.com>
To:     darrick.wong@oracle.com
Cc:     linux-xfs@vger.kernel.org, linux-doc@vger.kernel.org,
        corbet@lwn.net
Date:   Wed, 03 Oct 2018 20:25:07 -0700
Message-ID: <153862350727.27883.9408120819569795102.stgit@magnolia>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9035 signatures=668707
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1807170000 definitions=main-1810040034
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi all,

This series converts the existing in-kernel xfs documentation to rst
format, links it in with the rest of the kernel's rst documetation, and
then begins pulling in the contents of the Data Structures & Algorithms
book from the xfs-documentation git tree.  No changes are made to the
text during the import process except to fix things that the conversion
process (asciidoctor + pandoc) didn't do correctly.  The goal of this
series is to tie together the XFS code with the on-disk format
documentation for the features supported by the code.

I've built the docs and put them here, in case you hate reading rst:
https://djwong.org/docs/kdoc/admin-guide/xfs.html
https://djwong.org/docs/kdoc/filesystems/xfs-data-structures/index.html

I've posted a branch here because the png import patch is huge:
https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/log/?h=docs-4.20-merge

The patchset should apply cleanly against 4.19-rc6.  Comments and
questions are, as always, welcome.

--D

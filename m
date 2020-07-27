Return-Path: <SRS0=Ik1b=BG=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6301C433E4
	for <linux-doc@archiver.kernel.org>; Mon, 27 Jul 2020 11:45:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AFDAB20714
	for <linux-doc@archiver.kernel.org>; Mon, 27 Jul 2020 11:45:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BBTCvBGL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727864AbgG0Lpo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 27 Jul 2020 07:45:44 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:44282 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726599AbgG0Lpo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Jul 2020 07:45:44 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06RBfrZA126500;
        Mon, 27 Jul 2020 11:45:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id; s=corp-2020-01-29;
 bh=cdiiMMVG/jwRWGbpmGX+OkK0RQSR1LTNhFNGkv9SfiE=;
 b=BBTCvBGLFt8lq6Pc+5QGDTxxxL2HBnfVZ0sUq5GqNt4UHp1cyHIPGXZYKKP7j0O811/c
 hijDntYVOll0YKRRHH9xdBz0pWVM3uSO+LVZvPzlrI50aJtLEQB9FdlcYPRggHDBcrqg
 mpl8A+a9KYiQyb9LTiIeKBwnpux1Ns0SKozf5aY/ZdfukghiEgZNYAbU41Qe88g2hG1W
 CJcUTQbPS8q8sJ8jT6ilX6uo7U74fGEM46kWgxKcHUJpQOoPFEPdmjSQNswfgRmDTIdZ
 VgHm+4vvzhRLujk63+3Byi0JtQbdvtg9dX2oHbCbhy0Fb70ZNnxcvz5I8TbP/XqPUDPw sg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 32hu1j114b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 27 Jul 2020 11:45:38 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06RBgSSB010474;
        Mon, 27 Jul 2020 11:45:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3020.oracle.com with ESMTP id 32hu5qfd3u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 27 Jul 2020 11:45:38 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06RBjb8d017041;
        Mon, 27 Jul 2020 11:45:37 GMT
Received: from t460.home (dhcp-10-175-15-63.vpn.oracle.com [10.175.15.63])
        by aserp3020.oracle.com with ESMTP id 32hu5qfd1y-1;
        Mon, 27 Jul 2020 11:45:37 +0000
From:   Vegard Nossum <vegard.nossum@oracle.com>
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     Vegard Nossum <vegard.nossum@oracle.com>
Subject: [PATCH] docs: path-lookup: fix HTML entity mojibake
Date:   Mon, 27 Jul 2020 13:45:27 +0200
Message-Id: <20200727114527.23944-1-vegard.nossum@oracle.com>
X-Mailer: git-send-email 2.16.1.72.g5be1f00a9.dirty
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9694 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxlogscore=941
 lowpriorityscore=0 malwarescore=0 clxscore=1011 mlxscore=0 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007270087
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Two cases of "<" somehow turned into "&lt;". I noticed it on
<https://www.kernel.org/doc/html/latest/filesystems/path-lookup.html>.

I've verified that the HTML output is correct with this patch.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 Documentation/filesystems/path-lookup.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/filesystems/path-lookup.rst b/Documentation/filesystems/path-lookup.rst
index f46b05e9b96c8..1a8fae5036b34 100644
--- a/Documentation/filesystems/path-lookup.rst
+++ b/Documentation/filesystems/path-lookup.rst
@@ -76,10 +76,10 @@ tempting to consider that to have an empty final component.  In many
 ways that would lead to correct results, but not always.  In
 particular, ``mkdir()`` and ``rmdir()`` each create or remove a directory named
 by the final component, and they are required to work with pathnames
-ending in "``/``".  According to POSIX_
+ending in "``/``".  According to POSIX_:
 
-  A pathname that contains at least one non- &lt;slash> character and
-  that ends with one or more trailing &lt;slash> characters shall not
+  A pathname that contains at least one non-<slash> character and
+  that ends with one or more trailing <slash> characters shall not
   be resolved successfully unless the last pathname component before
   the trailing <slash> characters names an existing directory or a
   directory entry that is to be created for a directory immediately
-- 
2.16.1.72.g5be1f00a9.dirty


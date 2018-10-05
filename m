Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9A0937D082
	for <lwn-linux-doc@archive.lwn.net>; Fri,  5 Oct 2018 00:59:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726795AbeJEHzy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 5 Oct 2018 03:55:54 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:40712 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbeJEHzy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 5 Oct 2018 03:55:54 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.22/8.16.0.22) with SMTP id w950wkQh010059;
        Fri, 5 Oct 2018 00:59:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : from : to :
 cc : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=corp-2018-07-02;
 bh=D8W60X4hzgDxxdrJ+oPvKQJWkssOe81+uivyo2zNnpg=;
 b=D/60QOedNkQqaomclhPHxi0dBlylytEEp3L7D3b6U/ZgqePZYlrGaH+xoXvQQMj2Pfg/
 VYCE8Ds87+uuxmgphHvL7su7nkFMt47pfLPkMhWA7QTvpBHWLlKhBHqJNqshZwIdtM6T
 iX2tec2rMN0l9hIYvGW2BCVpDPwYScIxIpSmckpQbBj03RVsgd+Jfx4BlKhdw1JffXNf
 zZMZtX2zp9vSEfnZaITlYaQ3x9w/FdW2Y4ufv2gWvQPZ4chEl4BduRHDlRXtVtDXxz5H
 zURVdkmJjBZ8MKWxlpjq+xAs0kW2JnFNX2CV96PRe4Jp2KGI+Ztzhm3bCiWknuMWAEYS WQ== 
Received: from aserv0022.oracle.com (aserv0022.oracle.com [141.146.126.234])
        by userp2120.oracle.com with ESMTP id 2mt21rfktf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 05 Oct 2018 00:59:35 +0000
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserv0022.oracle.com (8.14.4/8.14.4) with ESMTP id w950xY1R008355
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 5 Oct 2018 00:59:34 GMT
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id w950xWa6024386;
        Fri, 5 Oct 2018 00:59:32 GMT
Received: from localhost (/10.159.229.198)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 04 Oct 2018 17:59:32 -0700
Subject: [PATCH 0/2] ext4: even more documentation fixes
From:   "Darrick J. Wong" <darrick.wong@oracle.com>
To:     tytso@mit.edu, darrick.wong@oracle.com
Cc:     linux-ext4@vger.kernel.org, linux-doc@vger.kernel.org,
        corbet@lwn.net
Date:   Thu, 04 Oct 2018 17:59:31 -0700
Message-ID: <153870117116.30837.1220267868954289184.stgit@magnolia>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9036 signatures=668706
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=914
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1807170000 definitions=main-1810050009
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi all,

This series fixes some problems that were brought up during review for
the XFS documentation which I hadn't known about when pushing the ext4
documentation during the 4.19 cycle.

The first patch moves the ext4 mount option and sysfs knob information
into the Linux administration guide.

The second patch moves the ext4 Data Structures & Algorithms book up a
level since it's a self-contained documentation book.

I've built the docs and put them here, in case you hate reading rst:
https://djwong.org/docs/kdoc/filesystems/ext4/index.html

The patchset should apply cleanly against 4.19-rc6.  Comments and
questions are, as always, welcome.

--D

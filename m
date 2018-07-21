Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7A1437D072
	for <lwn-linux-doc@archive.lwn.net>; Sat, 21 Jul 2018 18:20:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728076AbeGUTNg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 21 Jul 2018 15:13:36 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:54580 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727554AbeGUTNg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 21 Jul 2018 15:13:36 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.22/8.16.0.22) with SMTP id w6LIJvBl140999;
        Sat, 21 Jul 2018 18:19:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=tQcms65KvMfwEQjRWAah3XWsjGbhObZ6Mpcl8U2nvpw=;
 b=nJTBJze1EAI6hCDDp0wOooj12BRzrxqQ2F3/inbc+KuYpXmDNA7pHn8CzEsuHuREH/0k
 qgWCKBcL5sv9d+SI31M6yvfAHZrHdAb3YxOBfRSWBcsb5LjY4HItHVLVw4W7VYp7xxhD
 Y7B9PPSntxm5Xwv6BcGOILXc3i/vJY4sXNeMYEnVCuXSIfOA4I5dnooNVyQSUQwKnbdS
 Fe4eAYghJ9xqvDNJUtgos+MBfUITZlwHFBDF7uOwUuxfIGdxWPWYcUiIyWNas3GO33BQ
 Unzx0EyrGRCbasHBAlBgI6XtRHRD5kmNDo8LQMOAbIYk4uZg48oQtdin3MKwuTIpurli zQ== 
Received: from userv0021.oracle.com (userv0021.oracle.com [156.151.31.71])
        by userp2120.oracle.com with ESMTP id 2kbwfpgtu7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 21 Jul 2018 18:19:56 +0000
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userv0021.oracle.com (8.14.4/8.14.4) with ESMTP id w6LIJuCC020685
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 21 Jul 2018 18:19:56 GMT
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id w6LIJuqQ031270;
        Sat, 21 Jul 2018 18:19:56 GMT
Received: from localhost (/67.169.218.210)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sat, 21 Jul 2018 11:19:55 -0700
Date:   Sat, 21 Jul 2018 11:19:54 -0700
From:   "Darrick J. Wong" <darrick.wong@oracle.com>
To:     "Theodore Y. Ts'o" <tytso@mit.edu>
Cc:     linux-ext4@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH 00/13] ext4: major documentation surgery
Message-ID: <20180721181954.GJ4800@magnolia>
References: <153124300257.17949.1127788286714678589.stgit@magnolia>
 <20180721141946.GA31851@thunk.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180721141946.GA31851@thunk.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=8961 signatures=668706
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1806210000 definitions=main-1807210209
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Jul 21, 2018 at 10:19:46AM -0400, Theodore Y. Ts'o wrote:
> On Tue, Jul 10, 2018 at 10:16:42AM -0700, Darrick J. Wong wrote:
> > Hi all,
> > 
> > This series converts the existing in-kernel ext4 documentation to rst
> > format, links it in with the rest of the kernel's rst documetation, and
> > then begins pulling in the contents of the on-disk layout page in the
> > wiki.  No changes are made to the text during the import process except
> > to flatten the nested tables in the old wiki page, which were very
> > difficult to maintain.
> > 
> > I've built the docs and put them here, in case you hate reading rst:
> > https://djwong.org/docs/kdoc/filesystems/ext4/index.html
> 
> I've applied these patches, but I think we still need to do some work
> figuring out how to integrate the ext4 documentation into the
> Linux-doc tree as a whole.
> 
> At the moment they are dropped in the middle of the "Kernel API
> Documentation", by virtue of where the files are located.  Most of the
> ext4.rst file probably should be moved into the user's and
> administrator's guide.

I pondered that -- maybe leave all the ext4 stuff clustered together,
but link to it from the actual user/admin guide section?

> I'm not sure where the best place to put the ondisk documentation.
> It's probably not the user's and administrator's guide, but the Kernel
> API Documentation doesn't seem like the right place.
> 
> But it should also make sense when people are browing the
> Documentation source directories, too.
> 
> I'm not sure what the best way to do that might be, but maybe some of
> the folks on the linux-doc list will have some suggestions.

I was thinking about having a separate top-level Filesystems section
where we could put user/admin guides, on-disk documentation, etc. and
leave the FS API section alone.

--D

> Cheers,
> 
> 					- Ted
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

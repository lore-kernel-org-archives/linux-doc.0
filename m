Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD,UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B4BD87E69D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 21 Mar 2018 16:43:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752919AbeCUQnB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 21 Mar 2018 12:43:01 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:37004 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752970AbeCUQmj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Mar 2018 12:42:39 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.22/8.16.0.22) with SMTP id w2LGWPVh014676;
        Wed, 21 Mar 2018 16:41:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2017-10-26;
 bh=dQCpA+PzQ12OjWDGH7LKG8hDluZPvTomXmNDi7Oj2R4=;
 b=XfTS9agGujQKT2u9Fj3a0oKNnWIsjm5zTwd0iW2KGLJ3SCERzgWClBphAcoZ/mYTskzM
 LQRf1A2eXzqL9+aIkyJTJYPsYJwJ+0tyP2n3c9TQbKkfoPIGedEPK45/CPxEziNp/IYr
 0OwFd3HLuP3jGp6jP9RIMcjjpa4NBXtywKFtOnOdv9Fw1dyLRcIcGChkriIUjAKcq7Nq
 9Rt9ShkWNJsG9Z6QPf+enxSAI8glrpcO3dnTj7ECMDsB/awukNRivZSetG5c88rRiFQ6
 Lv5nBZVuW5Y5lyRfLYV1ANE3XvWkd+4WNfENYAj5SWXvm+bfCp4zKIe17oeJcYw9NTeH sQ== 
Received: from userv0022.oracle.com (userv0022.oracle.com [156.151.31.74])
        by aserp2120.oracle.com with ESMTP id 2guu0kr1gm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 21 Mar 2018 16:41:33 +0000
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userv0022.oracle.com (8.14.4/8.14.4) with ESMTP id w2LGfV1W027886
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 21 Mar 2018 16:41:32 GMT
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id w2LGfUPU008351;
        Wed, 21 Mar 2018 16:41:30 GMT
Received: from localhost (/67.169.218.210)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 21 Mar 2018 09:41:30 -0700
Date:   Wed, 21 Mar 2018 09:41:29 -0700
From:   "Darrick J. Wong" <darrick.wong@oracle.com>
To:     Dave Chinner <david@fromorbit.com>
Cc:     Eric Sandeen <sandeen@sandeen.net>,
        Masanari Iida <standby24x7@gmail.com>,
        linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        corbet@lwn.net, linux-doc@vger.kernel.org
Subject: Re: [PATCH] xfs: Change URL for the project in xfs.txt
Message-ID: <20180321164129.GA4818@magnolia>
References: <20180302133013.9744-1-standby24x7@gmail.com>
 <20180302172401.GT19312@magnolia>
 <20180302215731.GT30854@dastard>
 <27d9f522-fa75-6766-3ca6-79f99522e861@sandeen.net>
 <20180302224310.GV30854@dastard>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180302224310.GV30854@dastard>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=8839 signatures=668695
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=8 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1711220000 definitions=main-1803200127
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Mar 03, 2018 at 09:43:10AM +1100, Dave Chinner wrote:
> On Fri, Mar 02, 2018 at 04:08:24PM -0600, Eric Sandeen wrote:
> > 
> > 
> > On 3/2/18 3:57 PM, Dave Chinner wrote:
> > > On Fri, Mar 02, 2018 at 09:24:01AM -0800, Darrick J. Wong wrote:
> > >> On Fri, Mar 02, 2018 at 10:30:13PM +0900, Masanari Iida wrote:
> > >>> The oss.sgi.com doesn't exist any more.
> > >>> Change it to current project URL, https://xfs.wiki.kernel.org/
> > >>>
> > >>> Signed-off-by: Masanari Iida <standby24x7@gmail.com>
> > >>> ---
> > >>>  Documentation/filesystems/xfs.txt | 2 +-
> > >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> > >>>
> > >>> diff --git a/Documentation/filesystems/xfs.txt b/Documentation/filesystems/xfs.txt
> > >>> index 3b9b5c149f32..4d9ff0a7f8e1 100644
> > >>> --- a/Documentation/filesystems/xfs.txt
> > >>> +++ b/Documentation/filesystems/xfs.txt
> > >>> @@ -9,7 +9,7 @@ variable block sizes, is extent based, and makes extensive use of
> > >>>  Btrees (directories, extents, free space) to aid both performance
> > >>>  and scalability.
> > >>>  
> > >>> -Refer to the documentation at http://oss.sgi.com/projects/xfs/
> > >>> +Refer to the documentation at https://xfs.wiki.kernel.org/
> > > 
> > > Did I miss a memo?
> > 
> > About which part, the loss of oss.sgi or the addition of the kernel.org wiki?
> > 
> > The kernel.org wiki is pretty bare though.  OTOH xfs.org is a bit less
> > official.  We really need to resolve this issue.
> 
> Moving everything to kernel.org wiki. As I mentioned on IRC, I'd
> much prefer we move away from wiki's to something we can edit
> locally, review via email, has proper revision control and a
> "publish" mechanism that pushes built documentation out to the
> public website.

Makes sense, it's sort of annoying to have to build the pdfs from
documentation repo and kup them to k.org manually.  In the meantime I'd
rather have a scribble-me-elmo wiki over a dead url.

Also afaik the only people who actually have write access to that wiki
are Luis, Eric, and me, so hopefully we won't have to deal with
vandalism in the interim.

I wonder if we could just make the existing dokiwiki use
xfs-documentation.git as its backend and control the publishing that
way...?

--D

> Cheers,
> 
> Dave.
> -- 
> Dave Chinner
> david@fromorbit.com
> --
> To unsubscribe from this list: send the line "unsubscribe linux-xfs" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

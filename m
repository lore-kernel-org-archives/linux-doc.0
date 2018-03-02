Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3E61D7E244
	for <lwn-linux-doc@archive.lwn.net>; Fri,  2 Mar 2018 21:57:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932505AbeCBV5f (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 2 Mar 2018 16:57:35 -0500
Received: from ipmail07.adl2.internode.on.net ([150.101.137.131]:51353 "EHLO
        ipmail07.adl2.internode.on.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932506AbeCBV5e (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Mar 2018 16:57:34 -0500
Received: from ppp59-167-129-252.static.internode.on.net (HELO dastard) ([59.167.129.252])
  by ipmail07.adl2.internode.on.net with ESMTP; 03 Mar 2018 08:27:33 +1030
Received: from dave by dastard with local (Exim 4.80)
        (envelope-from <david@fromorbit.com>)
        id 1ersgG-00034w-2E; Sat, 03 Mar 2018 08:57:32 +1100
Date:   Sat, 3 Mar 2018 08:57:32 +1100
From:   Dave Chinner <david@fromorbit.com>
To:     "Darrick J. Wong" <darrick.wong@oracle.com>
Cc:     Masanari Iida <standby24x7@gmail.com>, linux-xfs@vger.kernel.org,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] xfs: Change URL for the project in xfs.txt
Message-ID: <20180302215731.GT30854@dastard>
References: <20180302133013.9744-1-standby24x7@gmail.com>
 <20180302172401.GT19312@magnolia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180302172401.GT19312@magnolia>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 02, 2018 at 09:24:01AM -0800, Darrick J. Wong wrote:
> On Fri, Mar 02, 2018 at 10:30:13PM +0900, Masanari Iida wrote:
> > The oss.sgi.com doesn't exist any more.
> > Change it to current project URL, https://xfs.wiki.kernel.org/
> > 
> > Signed-off-by: Masanari Iida <standby24x7@gmail.com>
> > ---
> >  Documentation/filesystems/xfs.txt | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/filesystems/xfs.txt b/Documentation/filesystems/xfs.txt
> > index 3b9b5c149f32..4d9ff0a7f8e1 100644
> > --- a/Documentation/filesystems/xfs.txt
> > +++ b/Documentation/filesystems/xfs.txt
> > @@ -9,7 +9,7 @@ variable block sizes, is extent based, and makes extensive use of
> >  Btrees (directories, extents, free space) to aid both performance
> >  and scalability.
> >  
> > -Refer to the documentation at http://oss.sgi.com/projects/xfs/
> > +Refer to the documentation at https://xfs.wiki.kernel.org/

Did I miss a memo?

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

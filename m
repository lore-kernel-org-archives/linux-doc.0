Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8DE0D7D087
	for <lwn-linux-doc@archive.lwn.net>; Fri, 12 Oct 2018 01:33:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726172AbeJLJDI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 12 Oct 2018 05:03:08 -0400
Received: from ipmail06.adl6.internode.on.net ([150.101.137.145]:12349 "EHLO
        ipmail06.adl6.internode.on.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726053AbeJLJDI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 12 Oct 2018 05:03:08 -0400
Received: from ppp59-167-129-252.static.internode.on.net (HELO dastard) ([59.167.129.252])
  by ipmail06.adl6.internode.on.net with ESMTP; 12 Oct 2018 12:03:09 +1030
Received: from dave by dastard with local (Exim 4.80)
        (envelope-from <david@fromorbit.com>)
        id 1gAmKD-0004zq-0U; Fri, 12 Oct 2018 12:33:09 +1100
Date:   Fri, 12 Oct 2018 12:33:08 +1100
From:   Dave Chinner <david@fromorbit.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     "Darrick J. Wong" <darrick.wong@oracle.com>,
        linux-xfs@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 00/22] xfs-4.20: major documentation surgery
Message-ID: <20181012013308.GV6311@dastard>
References: <153862669110.26427.16504658853992750743.stgit@magnolia>
 <20181006005154.GM12041@dastard>
 <20181011112735.4f696d8a@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181011112735.4f696d8a@lwn.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 11, 2018 at 11:27:35AM -0600, Jonathan Corbet wrote:
> On Sat, 6 Oct 2018 10:51:54 +1000 Dave Chinner
> <david@fromorbit.com> wrote:
> 
> > Can you let us know whether the CC-by-SA 4.0 license is
> > acceptible or not? That's really the only thing that we need
> > clarified at this point - if it's OK I'll to pull this into the
> > XFS tree for the 4.20 merge window. If not, we'll go back to the
> > drawing board....
> 
> OK, I've had a long conversation with the LF lawyer, and she said
> clearly that we really should not be introducing CC-SA material
> into the kernel source tree.  It's a pain; I really do like CC-SA
> better for documentation, but it's not GPL-compatible, and that
> creates a problem for the processed docs.

Ok, thanks for following upon this, Jon. We'll just keep it all in
the existing external repo and work out what to do from there.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

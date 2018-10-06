Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 971E97D082
	for <lwn-linux-doc@archive.lwn.net>; Sat,  6 Oct 2018 00:51:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbeJFHxH (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 6 Oct 2018 03:53:07 -0400
Received: from ipmailnode02.adl6.internode.on.net ([150.101.137.148]:45583
        "EHLO ipmailnode02.adl6.internode.on.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726399AbeJFHxH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 6 Oct 2018 03:53:07 -0400
Received: from ppp59-167-129-252.static.internode.on.net (HELO dastard) ([59.167.129.252])
  by ipmail02.adl6.internode.on.net with ESMTP; 06 Oct 2018 10:21:55 +0930
Received: from dave by dastard with local (Exim 4.80)
        (envelope-from <david@fromorbit.com>)
        id 1g8ap0-0004Qq-He; Sat, 06 Oct 2018 10:51:54 +1000
Date:   Sat, 6 Oct 2018 10:51:54 +1000
From:   Dave Chinner <david@fromorbit.com>
To:     "Darrick J. Wong" <darrick.wong@oracle.com>
Cc:     linux-xfs@vger.kernel.org, linux-doc@vger.kernel.org,
        corbet@lwn.net
Subject: Re: [PATCH v2 00/22] xfs-4.20: major documentation surgery
Message-ID: <20181006005154.GM12041@dastard>
References: <153862669110.26427.16504658853992750743.stgit@magnolia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <153862669110.26427.16504658853992750743.stgit@magnolia>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 03, 2018 at 09:18:11PM -0700, Darrick J. Wong wrote:
> Hi all,
> 
> This series converts the existing in-kernel xfs documentation to rst
> format, links it in with the rest of the kernel's rst documetation, and
> then begins pulling in the contents of the Data Structures & Algorithms
> book from the xfs-documentation git tree.  No changes are made to the
> text during the import process except to fix things that the conversion
> process (asciidoctor + pandoc) didn't do correctly.  The goal of this
> series is to tie together the XFS code with the on-disk format
> documentation for the features supported by the code.
> 
> I've built the docs and put them here, in case you hate reading rst:
> https://djwong.org/docs/kdoc/admin-guide/xfs.html
> https://djwong.org/docs/kdoc/filesystems/xfs-data-structures/index.html
> 
> I've posted a branch here because the png import patch is huge:
> https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/log/?h=docs-4.20-merge
> 
> The patchset should apply cleanly against 4.19-rc6.  Comments and
> questions are, as always, welcome.

Jon,

Can you let us know whether the CC-by-SA 4.0 license is acceptible
or not? That's really the only thing that we need clarified at this
point - if it's OK I'll to pull this into the XFS tree for the 4.20
merge window. If not, we'll go back to the drawing board....

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

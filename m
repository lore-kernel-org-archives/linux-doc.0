Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1A6217D082
	for <lwn-linux-doc@archive.lwn.net>; Sat,  6 Oct 2018 00:45:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726812AbeJFHqu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 6 Oct 2018 03:46:50 -0400
Received: from ipmail07.adl2.internode.on.net ([150.101.137.131]:25188 "EHLO
        ipmail07.adl2.internode.on.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726399AbeJFHqu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 6 Oct 2018 03:46:50 -0400
Received: from ppp59-167-129-252.static.internode.on.net (HELO dastard) ([59.167.129.252])
  by ipmail07.adl2.internode.on.net with ESMTP; 06 Oct 2018 10:15:32 +0930
Received: from dave by dastard with local (Exim 4.80)
        (envelope-from <david@fromorbit.com>)
        id 1g8aip-0004QL-2w; Sat, 06 Oct 2018 10:45:31 +1000
Date:   Sat, 6 Oct 2018 10:45:31 +1000
From:   Dave Chinner <david@fromorbit.com>
To:     "Darrick J. Wong" <darrick.wong@oracle.com>
Cc:     corbet@lwn.net, xfs <linux-xfs@vger.kernel.org>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: improve readability for people with poorer eyesight
Message-ID: <20181006004531.GL12041@dastard>
References: <20181005010603.GA6702@magnolia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181005010603.GA6702@magnolia>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 04, 2018 at 06:06:03PM -0700, Darrick J. Wong wrote:
> Hi,
> 
> So my eyesight still hasn't fully recovered, so in the meantime it's
> been difficult to read the online documentation.  Here's some stylesheet
> overrides I've been using to make it easier for me to read them:
> https://djwong.org/docs/kdoc/index.html
> 
> ---
> From: Darrick J. Wong <darrick.wong@oracle.com>
> 
> My eyesight is not in good shape, which means that I have difficulty
> reading the online Linux documentation.  Specifically, body text is
> oddly small compared to list items and the contrast of various text
> elements is too low for me to be able to see easily.
> 
> Therefore, alter the HTML theme overrides to make the text larger and
> increase the contrast for better visibility, and trust the typeface
> choices of the reader's browser.
> 
> For the PDF output, increase the text size, use a sans-serif typeface
> for sans-serif text, and use a serif typeface for "roman" serif text.
> 
> Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>

This fixes problems I noticed when trying to review the built html
documentation - the inconsistent font sizes on my high-dpi monitor
made it almost impossible to read even though I have no eyesight
problems....

Acked-by: Dave Chinner <dchinner@redhat.com>

-Dave.
-- 
Dave Chinner
david@fromorbit.com

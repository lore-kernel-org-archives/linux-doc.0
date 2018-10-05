Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0606A7D082
	for <lwn-linux-doc@archive.lwn.net>; Fri,  5 Oct 2018 23:49:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbeJFGu5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 6 Oct 2018 02:50:57 -0400
Received: from imap.thunk.org ([74.207.234.97]:34974 "EHLO imap.thunk.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726737AbeJFGu5 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 6 Oct 2018 02:50:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=thunk.org;
         s=ef5046eb; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=WjUf+p1wZD6H0beFGIu/PgB1gkvAATG5+OkElZGTWvI=; b=tKWF7BVbRaS+8p+d1B8107t90l
        Sj5g8n/G9gVE2JxBKFgPqjF/gRwvYVQgV4q+l5WI9AtBIbaL55nNeASZK2TSmXum17vHADynW/u9c
        sygn3qSDeaMtWNIs239QTahgP6Zdeha37zsHAqu1QXB7GiPMDeQ1KjmmTBdB6cjc1LVY=;
Received: from root (helo=callcc.thunk.org)
        by imap.thunk.org with local-esmtp (Exim 4.89)
        (envelope-from <tytso@thunk.org>)
        id 1g8Zqz-0006Hy-G3; Fri, 05 Oct 2018 23:49:53 +0000
Received: by callcc.thunk.org (Postfix, from userid 15806)
        id 871E57A523F; Fri,  5 Oct 2018 19:49:52 -0400 (EDT)
Date:   Fri, 5 Oct 2018 19:49:52 -0400
From:   "Theodore Y. Ts'o" <tytso@mit.edu>
To:     "Darrick J. Wong" <darrick.wong@oracle.com>
Cc:     linux-ext4@vger.kernel.org, linux-doc@vger.kernel.org,
        corbet@lwn.net
Subject: Re: [PATCH 2/2] docs: promote the ext4 data structures book to top
 level
Message-ID: <20181005234952.GC2548@thunk.org>
References: <153870117116.30837.1220267868954289184.stgit@magnolia>
 <153870118415.30837.3990077919915459798.stgit@magnolia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <153870118415.30837.3990077919915459798.stgit@magnolia>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tytso@thunk.org
X-SA-Exim-Scanned: No (on imap.thunk.org); SAEximRunCond expanded to false
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 04, 2018 at 05:59:44PM -0700, Darrick J. Wong wrote:
> From: Darrick J. Wong <darrick.wong@oracle.com>
> 
> Move the ext4 data structures book to Documentation/filesystems/ext4/
> since the administrative information moved elsewhere.
> 
> Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>

Thanks, applied and pushed out to the ext4.git tree.

Randy, Jon: the original patch didn't make it past vger.kernel.org
because it was too large (it was moving a lot of files around).  It
looked fine to me, but if you want to take a look it should be on the
dev branch of the ext4.git tree.

					- Ted

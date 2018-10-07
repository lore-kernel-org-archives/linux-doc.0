Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 28E647D082
	for <lwn-linux-doc@archive.lwn.net>; Sun,  7 Oct 2018 14:45:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726616AbeJGVwo (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 7 Oct 2018 17:52:44 -0400
Received: from ms.lwn.net ([45.79.88.28]:34608 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726527AbeJGVwn (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 7 Oct 2018 17:52:43 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id E98BF6EC;
        Sun,  7 Oct 2018 14:45:15 +0000 (UTC)
Date:   Sun, 7 Oct 2018 08:45:14 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     "Theodore Y. Ts'o" <tytso@mit.edu>
Cc:     "Darrick J. Wong" <darrick.wong@oracle.com>,
        linux-ext4@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] docs: promote the ext4 data structures book to top
 level
Message-ID: <20181007084514.57c945d0@lwn.net>
In-Reply-To: <20181005234952.GC2548@thunk.org>
References: <153870117116.30837.1220267868954289184.stgit@magnolia>
        <153870118415.30837.3990077919915459798.stgit@magnolia>
        <20181005234952.GC2548@thunk.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 5 Oct 2018 19:49:52 -0400
"Theodore Y. Ts'o" <tytso@mit.edu> wrote:

> On Thu, Oct 04, 2018 at 05:59:44PM -0700, Darrick J. Wong wrote:
> > From: Darrick J. Wong <darrick.wong@oracle.com>
> > 
> > Move the ext4 data structures book to Documentation/filesystems/ext4/
> > since the administrative information moved elsewhere.
> > 
> > Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>  
> 
> Thanks, applied and pushed out to the ext4.git tree.
> 
> Randy, Jon: the original patch didn't make it past vger.kernel.org
> because it was too large (it was moving a lot of files around).  It
> looked fine to me, but if you want to take a look it should be on the
> dev branch of the ext4.git tree.

FWIW, from a quick look it seems fine to me.

   Acked-by: Jonathan Corbet <corbet@lwn.net>

(though I expect it's too late to add that).

jon

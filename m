Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E9B077D072
	for <lwn-linux-doc@archive.lwn.net>; Sat, 21 Jul 2018 20:15:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727952AbeGUVI5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 21 Jul 2018 17:08:57 -0400
Received: from imap.thunk.org ([74.207.234.97]:41854 "EHLO imap.thunk.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727854AbeGUVI5 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 21 Jul 2018 17:08:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=thunk.org;
         s=ef5046eb; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=Z4dPHiVqYkg79t5hXJTZWz+tWBNKxQgeiSqKcx8Ss6A=; b=XaOmADXyVB/10f/0zN8KbyngMJ
        TU/+JmCY3+wpPCbjBmSdNSOFZ9dWrV+tMiB1gD37VLmFenezhBqZcgKGzavKlFSedO4n4G+L86p5L
        Gtp7Aa/I3YdgDqSQ67K9rHCacyIFMnH7KMdGFvDB+55NWbigTaK0dqs82Wd2Q66ozL6A=;
Received: from root (helo=callcc.thunk.org)
        by imap.thunk.org with local-esmtp (Exim 4.89)
        (envelope-from <tytso@thunk.org>)
        id 1fgyHL-0005E8-Qn; Sat, 21 Jul 2018 20:14:59 +0000
Received: by callcc.thunk.org (Postfix, from userid 15806)
        id A25C67A6454; Sat, 21 Jul 2018 16:14:53 -0400 (EDT)
Date:   Sat, 21 Jul 2018 16:14:53 -0400
From:   "Theodore Y. Ts'o" <tytso@mit.edu>
To:     "Darrick J. Wong" <darrick.wong@oracle.com>
Cc:     linux-ext4@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH 00/13] ext4: major documentation surgery
Message-ID: <20180721201453.GC31851@thunk.org>
References: <153124300257.17949.1127788286714678589.stgit@magnolia>
 <20180721141946.GA31851@thunk.org>
 <20180721181954.GJ4800@magnolia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180721181954.GJ4800@magnolia>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tytso@thunk.org
X-SA-Exim-Scanned: No (on imap.thunk.org); SAEximRunCond expanded to false
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Jul 21, 2018 at 11:19:54AM -0700, Darrick J. Wong wrote:
> 
> I pondered that -- maybe leave all the ext4 stuff clustered together,
> but link to it from the actual user/admin guide section?
>

Yeah, I think it makes keep the ext4 (and in the future, xfs, btrfs,
f2fs, etc.) files clustered together.  Is it considered OK for
individual .rst files to be linked from multiple places?

I could also see us wanting to change up the pdf boundaries.  I doubt
someone would want a single pdf with details of the VFS layer, ext4
mount options, ext4 on-disk format, xfs mount options, xfs on-disk
format, btrfs mount options, etc., all in a single "book".

> > I'm not sure what the best way to do that might be, but maybe some of
> > the folks on the linux-doc list will have some suggestions.
> 
> I was thinking about having a separate top-level Filesystems section
> where we could put user/admin guides, on-disk documentation, etc. and
> leave the FS API section alone.

I wonder if part of the problem is calling it "the API section".
Maybe we should be calling it Kernel Internals, or something like
that?

					- Ted

P.S.  Oh, and we probably want to move "The Linux Journalling API" out
of index.rst, and into a separate jbd2.rst file, and give some context
that it is the journalling layer used by ext4 and ocfs2, but it's
certainly not the only Journalling API in the kernel.

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

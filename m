Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 814317D072
	for <lwn-linux-doc@archive.lwn.net>; Sat, 21 Jul 2018 14:19:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727633AbeGUPMs (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 21 Jul 2018 11:12:48 -0400
Received: from imap.thunk.org ([74.207.234.97]:41274 "EHLO imap.thunk.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727598AbeGUPMs (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 21 Jul 2018 11:12:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=thunk.org;
         s=ef5046eb; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=cipI/CXFloW3VGUv9Rl9FEHs9Nihp+gFL4UT4f6Y1ZE=; b=wCsI37LYO92mjYJJeKSeqeezhL
        tsu//MRq0n8Ob3Rr3QHTLW1Gpt7m6+aNEZ5uRzffnqUDV4/EB9PVzugWTJe4+4E+hKja0hSgk6M22
        kvxfE0SZ4zmfKZriKWqlknlokpzDZ6mlie5akVHMoo7ghZ2WSTRPvXS79sDiKnwfqZP8=;
Received: from root (helo=callcc.thunk.org)
        by imap.thunk.org with local-esmtp (Exim 4.89)
        (envelope-from <tytso@thunk.org>)
        id 1fgsjg-0002k7-Ih; Sat, 21 Jul 2018 14:19:52 +0000
Received: by callcc.thunk.org (Postfix, from userid 15806)
        id 651E57A644D; Sat, 21 Jul 2018 10:19:46 -0400 (EDT)
Date:   Sat, 21 Jul 2018 10:19:46 -0400
From:   "Theodore Y. Ts'o" <tytso@mit.edu>
To:     "Darrick J. Wong" <darrick.wong@oracle.com>
Cc:     linux-ext4@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH 00/13] ext4: major documentation surgery
Message-ID: <20180721141946.GA31851@thunk.org>
References: <153124300257.17949.1127788286714678589.stgit@magnolia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <153124300257.17949.1127788286714678589.stgit@magnolia>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tytso@thunk.org
X-SA-Exim-Scanned: No (on imap.thunk.org); SAEximRunCond expanded to false
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jul 10, 2018 at 10:16:42AM -0700, Darrick J. Wong wrote:
> Hi all,
> 
> This series converts the existing in-kernel ext4 documentation to rst
> format, links it in with the rest of the kernel's rst documetation, and
> then begins pulling in the contents of the on-disk layout page in the
> wiki.  No changes are made to the text during the import process except
> to flatten the nested tables in the old wiki page, which were very
> difficult to maintain.
> 
> I've built the docs and put them here, in case you hate reading rst:
> https://djwong.org/docs/kdoc/filesystems/ext4/index.html

I've applied these patches, but I think we still need to do some work
figuring out how to integrate the ext4 documentation into the
Linux-doc tree as a whole.

At the moment they are dropped in the middle of the "Kernel API
Documentation", by virtue of where the files are located.  Most of the
ext4.rst file probably should be moved into the user's and
administrator's guide.

I'm not sure where the best place to put the ondisk documentation.
It's probably not the user's and administrator's guide, but the Kernel
API Documentation doesn't seem like the right place.

But it should also make sense when people are browing the
Documentation source directories, too.

I'm not sure what the best way to do that might be, but maybe some of
the folks on the linux-doc list will have some suggestions.

Cheers,

					- Ted

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

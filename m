Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 114C57D08A
	for <lwn-linux-doc@archive.lwn.net>; Wed,  3 Apr 2019 01:44:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726183AbfDCBoZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 2 Apr 2019 21:44:25 -0400
Received: from zeniv.linux.org.uk ([195.92.253.2]:51342 "EHLO
        ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726071AbfDCBoZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Apr 2019 21:44:25 -0400
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92 #3 (Red Hat Linux))
        id 1hBUwo-0001QM-Fn; Wed, 03 Apr 2019 01:44:14 +0000
Date:   Wed, 3 Apr 2019 02:44:14 +0100
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     NeilBrown <neilb@suse.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        "Tobin C. Harding" <tobin@kernel.org>,
        Mauro Carvalho Chehab <mchehab@s-opensource.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/24] Convert vfs.txt to vfs.rst
Message-ID: <20190403014414.GN2217@ZenIV.linux.org.uk>
References: <20190327051717.23225-1-tobin@kernel.org>
 <20190402094934.5b242dc0@lwn.net>
 <20190402164824.GK2217@ZenIV.linux.org.uk>
 <87d0m32989.fsf@notabene.neil.brown.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87d0m32989.fsf@notabene.neil.brown.name>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 03, 2019 at 12:00:54PM +1100, NeilBrown wrote:

> I would find it useful if the documentation said something about why
> this API exists at all.  As you say, it cannot change the dentry - so
> what is it expected to do.

*shrug*

It tell filesystem that this dentry is going away now.

> I had a look at the two in-tree users and my guess is that it can be
> useful if the filesystem caches some other information which would be
> invalidated by a dentry being removed.
> I *think* cephfs has a flag which records if "All entries in a directory
> are currently in the dcache".  When a dentry is pruned, that flag needs
> to be cleared.
> 
> i.e. ->d_prune allows a filesystem to maintain summary state about what
>    is currently in the dcache.

For one thing...  Or, if you keep a (non-counting) reference to that
dentry, this tells you to forget it, etc.

I can think of other uses; it's really just telling the fs that this
is becoming an ex-parrot.

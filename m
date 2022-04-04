Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 877FAC433EF
	for <linux-doc@archiver.kernel.org>; Mon,  4 Apr 2022 23:16:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241277AbiDDXSk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 4 Apr 2022 19:18:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234738AbiDDXSZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 4 Apr 2022 19:18:25 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 385A5289A2
        for <linux-doc@vger.kernel.org>; Mon,  4 Apr 2022 16:10:48 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id CA98A210E5;
        Mon,  4 Apr 2022 23:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1649113846; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=A+BVPy66n8ErIedTq/1vwrjA26ZSdrDU4ZmbYGeUBFg=;
        b=S1xEWmHkZN49zjH96zxwx5Q4WomGYMvKQg5yJJRVXTo6TAIo3p9GoKyU7YOrwM//BVYW5b
        cZWP8LhgeJCuszC+k2yx8llXhMxkj3xG/4zqQrsz7fJqZ2YP5gdURZ9P70c+6ZcFsAwvNC
        zEwoXoYfpxOTXxvxGQPqCQ/6Ki6r7NQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1649113846;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=A+BVPy66n8ErIedTq/1vwrjA26ZSdrDU4ZmbYGeUBFg=;
        b=kSHk1k1egdAygIIr8enp8LNwSM/ft3X7yjsC9Lukz36qOWimrHcRYk0T5yi1PkJhBGBwPO
        OZdLJy0YOBqG12CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 230D313216;
        Mon,  4 Apr 2022 23:10:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id h6rCM/R6S2JGZwAAMHmgww
        (envelope-from <neilb@suse.de>); Mon, 04 Apr 2022 23:10:44 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
From:   "NeilBrown" <neilb@suse.de>
To:     "Matthew Wilcox" <willy@infradead.org>
Cc:     "Andrew Morton" <akpm@linux-foundation.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        "Linux Memory Management List" <linux-mm@kvack.org>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] MM: minor improvements to readahead documentation
In-reply-to: <Ykrx4XjflUitCF0W@casper.infradead.org>
References: <164879346851.25542.18299715584610241983@noble.neil.brown.name>,
 <YkdAVDJVLmyAZ263@casper.infradead.org>,
 <164904545104.27040.12709890187296939611@noble.neil.brown.name>,
 <Ykrx4XjflUitCF0W@casper.infradead.org>
Date:   Tue, 05 Apr 2022 09:10:40 +1000
Message-id: <164911384099.10985.7554281018592465423@noble.neil.brown.name>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 04 Apr 2022, Matthew Wilcox wrote:
> On Mon, Apr 04, 2022 at 02:10:51PM +1000, NeilBrown wrote:
> > >   * Readahead is triggered when an application read request (whether a
> > > - * systemcall or a page fault) finds that the requested page is not in
> > > + * system call or a page fault) finds that the requested folio is not =
in
> > >   * the page cache, or that it is in the page cache and has the
> > > - * %PG_readahead flag set.  This flag indicates that the page was load=
ed
> > > - * as part of a previous read-ahead request and now that it has been
> > > - * accessed, it is time for the next read-ahead.
> > > + * readahead flag set.  This flag indicates that the folio was read
> >=20
> > Ugh.  Why don't you like %PG_readahead?   I absolutely loath the
> > practice of hiding flags inside accessor functions, and hiding the truth
> > in documentation is just as bad.  It all makes grepping that much
> > harder.
> > I would MUCH prefer that the %PG_ were restored.  Please.
>=20
> I absolutely loathe it that there are references to PG_* anywhere
> outside page-flags.h.  We have the abstraction layer, we want people
> to use it, and we shouldn't needlessly multiply entities by referring
> to the implementation of the abstraction.  I remove references to PG_
> flags wherever I find them.  I agree that grepping for page/folio flags
> doesn't work, and it's something I spend a lot of time thinking about.
> In particular, I want to produce decent kernel-doc for them.

Yes, we have an abstraction layer - but WHY do you have an abstraction
layer?  I can't see that it adds anything other than obfuscation.

Do you WANT to keep the learning curve nice and steep?

>=20
> > > - * In the last two cases, the page should be unlocked to indicate that
> > > - * the read attempt has failed.  In the first case the page will be
> > > - * unlocked by the caller.
> > > + * In the last two cases, the folio should be unlocked by the filesyst=
em
> > > + * to indicate that the read attempt has failed.  In the first case the
> > > + * folio will be unlocked by the VFS.
> >=20
> > VFS??  The code is in mm/readahead.c, not in fs/*.c
> > Why didn't you like "caller" ??
>=20
> I view mm/readahead.c, mm/filemap.c and mm/page-writeback.c as part
> of the VFS more than as part of the VM.  But that's something that
> reasonable people can disagree on.  I think from the point of view of
> the filesystem author, it's all VFS.
>=20
You didn't answer the second question.

NeilBrown

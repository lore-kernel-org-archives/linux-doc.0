Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 235637D043
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Jun 2018 18:31:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S934243AbeFGSbs (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Jun 2018 14:31:48 -0400
Received: from zeniv.linux.org.uk ([195.92.253.2]:52344 "EHLO
        ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934029AbeFGSbr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Jun 2018 14:31:47 -0400
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.87 #1 (Red Hat Linux))
        id 1fQzhH-0002zK-NN; Thu, 07 Jun 2018 18:31:43 +0000
Date:   Thu, 7 Jun 2018 19:31:43 +0100
From:   Al Viro <viro@ZenIV.linux.org.uk>
To:     Sean Anderson <seanga2@gmail.com>
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org,
        Matthew Wilcox <willy@infradead.org>,
        Jeff Layton <jlayton@redhat.com>
Subject: Re: [PATCH RESEND] Documentation: filesystems: update filesystem
 locking documentation
Message-ID: <20180607183143.GT30522@ZenIV.linux.org.uk>
References: <e4262947-a2c3-c932-caef-67d96fa59cb1@gmail.com>
 <20180526034116.GO30522@ZenIV.linux.org.uk>
 <86caf9d3-a520-bb4c-b174-954966c844e4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86caf9d3-a520-bb4c-b174-954966c844e4@gmail.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jun 05, 2018 at 03:46:37PM -0400, Sean Anderson wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA512
> 
> > Your mission, should you choose to accept it, shall be to locate
> > the old sig regarding the usual reaction to use of
> > Quoted-Printable...
> > 
> > IOW, fix your mail setup.  Applied, but.
> 
> Not sure what you mean by "Quoted-Printable"... Is PGP/MIME the
> incorrect way to send messages? I've switched to the "traditional"
> option for this one, and I've enabled "mail.strictly_mime" in my
> settings. Let me know if this fixes things for you.

Useful test: if git am barfs on your mail (which it does for the
first posting in the thread), you are going to annoy people...
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

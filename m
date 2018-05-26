Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 51E827D043
	for <lwn-linux-doc@archive.lwn.net>; Sat, 26 May 2018 03:41:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1031069AbeEZDlV (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 25 May 2018 23:41:21 -0400
Received: from zeniv.linux.org.uk ([195.92.253.2]:45832 "EHLO
        ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1031051AbeEZDlU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 May 2018 23:41:20 -0400
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.87 #1 (Red Hat Linux))
        id 1fMQ4z-0006GG-7j; Sat, 26 May 2018 03:41:17 +0000
Date:   Sat, 26 May 2018 04:41:17 +0100
From:   Al Viro <viro@ZenIV.linux.org.uk>
To:     Sean Anderson <seanga2@gmail.com>
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org,
        Matthew Wilcox <willy@infradead.org>,
        Jeff Layton <jlayton@redhat.com>
Subject: Re: [PATCH RESEND] Documentation: filesystems: update filesystem
 locking documentation
Message-ID: <20180526034116.GO30522@ZenIV.linux.org.uk>
References: <e4262947-a2c3-c932-caef-67d96fa59cb1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4262947-a2c3-c932-caef-67d96fa59cb1@gmail.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 23, 2018 at 10:29:10PM -0400, Sean Anderson wrote:
> Documentation/filesystems/Locking no longer reflects current locking
> semantics. i_mutex is no longer used for locking, and has been superseded
> by i_rwsem. Additionally, ->iterate_shared() was not documented.

Your mission, should you choose to accept it, shall be to locate the
old sig regarding the usual reaction to use of Quoted-Printable...

IOW, fix your mail setup.  Applied, but...
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

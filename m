Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4752E7E27B
	for <lwn-linux-doc@archive.lwn.net>; Mon, 30 Apr 2018 18:03:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752732AbeD3SDT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 30 Apr 2018 14:03:19 -0400
Received: from ms.lwn.net ([45.79.88.28]:39210 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752382AbeD3SDS (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 30 Apr 2018 14:03:18 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id E1FB7AAA;
        Mon, 30 Apr 2018 18:03:17 +0000 (UTC)
Date:   Mon, 30 Apr 2018 12:03:16 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     NeilBrown <neilb@suse.com>
Cc:     Alexander Viro <viro@zeniv.linux.org.uk>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH resend] VFS: simplify seq_file iteration code and
 interface
Message-ID: <20180430120316.081914d7@lwn.net>
In-Reply-To: <87fu3dihtf.fsf@notabene.neil.brown.name>
References: <87vacsrt0r.fsf@notabene.neil.brown.name>
        <87fu3dihtf.fsf@notabene.neil.brown.name>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 30 Apr 2018 11:50:04 +1000
NeilBrown <neilb@suse.com> wrote:

> This patch simplifies the interface for first/next iteration and
> simplifies the code, while maintaining complete backward
> compatability.  Now:
> 
> - if ->start() is given a pos of zero, it should return an iterator
>   placed at the start of the sequence
> - if ->start() is given a non-zero pos, it should return the iterator
>   in the same state it was after the last ->start or ->next.
> 
> This is particularly useful for interators which walk the multiple
> chains in a hash table, e.g. using rhashtable_walk*. See
> fs/gfs2/glock.c and drivers/staging/lustre/lustre/llite/vvp_dev.c

For the docs part:

	Acked-by: Jonathan Corbet <corbet@lwn.net>

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

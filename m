Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B346D7D089
	for <lwn-linux-doc@archive.lwn.net>; Mon, 31 Dec 2018 22:13:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727739AbeLaWN3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 31 Dec 2018 17:13:29 -0500
Received: from ms.lwn.net ([45.79.88.28]:59754 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727416AbeLaWN3 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 31 Dec 2018 17:13:29 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 98E272D1;
        Mon, 31 Dec 2018 22:13:28 +0000 (UTC)
Date:   Mon, 31 Dec 2018 15:13:27 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org
Subject: Re: [GIT PULL] Documentation for 5.0
Message-ID: <20181231151327.404ee4d8@lwn.net>
In-Reply-To: <CAHk-=wj8=xoaS=QJXRMo70Si0E5xvJmdyA2-cu99_MA_FjhHTA@mail.gmail.com>
References: <20181228090622.4c210228@lwn.net>
        <CAHk-=wj8=xoaS=QJXRMo70Si0E5xvJmdyA2-cu99_MA_FjhHTA@mail.gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, 29 Dec 2018 11:24:34 -0800
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> New signing key? And one that you forgot to push out to keyservers?

Sort of...some time ago, I tried to be a good kid and made a separate
signing subkey like Konstantin told me to.  Then I couldn't ever get the
nitrokey thing to work and then got distracted; I guess I never uploaded
that key.  I'm not really sure why gpg decided to start using it now.
It's uploaded now, anyway.

TLDR: I kind of suck at this gpg thing.  Sorry for the confusion.

jon

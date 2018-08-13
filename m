Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5034E7D00B
	for <lwn-linux-doc@archive.lwn.net>; Mon, 13 Aug 2018 15:06:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729070AbeHMRsr (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 13 Aug 2018 13:48:47 -0400
Received: from ms.lwn.net ([45.79.88.28]:47150 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729025AbeHMRsr (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 13 Aug 2018 13:48:47 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 08A447DC;
        Mon, 13 Aug 2018 15:06:08 +0000 (UTC)
Date:   Mon, 13 Aug 2018 09:06:07 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] docs for 4.19
Message-ID: <20180813090607.1f1bb27a@lwn.net>
In-Reply-To: <20180813083309.69575f4c@lwn.net>
References: <20180813083309.69575f4c@lwn.net>
Organization: LWN.net
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 13 Aug 2018 08:33:09 -0600
Jonathan Corbet <corbet@lwn.net> wrote:

> This was a moderately busy cycle for docs, with the usual collection of
> small fixes and updates.  We also have new ktime_get_*() docs from Arnd,
> some kernel-doc fixes, a new set of Italian translations (non so se vale la
> pena, ma non fa male - speriamo bene), and some extensive early
> memory-management documentation improvements from Mike Rapoport.
> 
> There's a certain amount of reaching outside of Documentation/, all fixing
> kerneldoc comments elsewhere.  I tried a few times to get acks for the 
> mm/ ones in particular (from Mike's work) but no such luck; nobody could
> be bothered to complain either so that was good enough for me.

I forgot to add that you'll see a small conflict with the ext4 tree on
Documentation/index.rst.  The linux-next resolution (just poke in the new
section that ext4 wants to add) is good.

jon

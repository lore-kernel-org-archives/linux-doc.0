Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3A79B7E66E
	for <lwn-linux-doc@archive.lwn.net>; Wed,  7 Mar 2018 17:16:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933533AbeCGRQQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 7 Mar 2018 12:16:16 -0500
Received: from ms.lwn.net ([45.79.88.28]:58454 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933487AbeCGRQP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 7 Mar 2018 12:16:15 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 25DA11323;
        Wed,  7 Mar 2018 17:16:15 +0000 (UTC)
Date:   Wed, 7 Mar 2018 10:16:14 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     "Tobin C. Harding" <me@tobin.cc>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joe Perches <joe@perches.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] docs: add Co-Developed-by docs
Message-ID: <20180307101614.6722b592@lwn.net>
In-Reply-To: <1520222301-11874-3-git-send-email-me@tobin.cc>
References: <1520222301-11874-1-git-send-email-me@tobin.cc>
        <1520222301-11874-3-git-send-email-me@tobin.cc>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon,  5 Mar 2018 14:58:21 +1100
"Tobin C. Harding" <me@tobin.cc> wrote:

> When Co-Developed-by tag was added, docs were only added to
> Documention/process/5.Posting.rst and were not added to
> Documention/process/submitting-patches.rst
> 
> Add documentation to Documention/process/submitting-patches.rst

Someday we should really pull those documents together into a coherent
whole so we don't have these weird synchronization issues.  But it's much
easier to just apply this, so that's what I've done for now, with Willy's
comma tweak.

I'll leave the checkpatch part to Joe.

Thanks,

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

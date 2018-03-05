Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9752E7E653
	for <lwn-linux-doc@archive.lwn.net>; Mon,  5 Mar 2018 21:24:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752906AbeCEVYp (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 5 Mar 2018 16:24:45 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:57853 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752063AbeCEVYp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Mar 2018 16:24:45 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 83F7221040;
        Mon,  5 Mar 2018 16:24:44 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
  by compute1.internal (MEProxy); Mon, 05 Mar 2018 16:24:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm2; bh=WetMjRLC503epAZS2/XwuBRA18EmG
        hABISNGKLVRVkM=; b=Oes2PQoYwGjKTFr/W+LOVF6j8NcmvxJkgLFEPKB+kABoo
        DFyoJa6ZYuzmIzH4PlwZlEVhoSiDJayuukqO8Ws4/ZJtoaBIxpJ+kGwVKf+anAGB
        DqV2TkupX7DkCvvguO0eIjfnp3TfAMOZlE6tX2lV0ymjZMw9sE8eC30kRw1XYwys
        gfvJy+Zj41lWmskK3IFacy9nhW2P76eGYG8Sy0VjSQLf7ZWlr5OqsTzqTRs+Zol1
        CSj9CB6S6pGq0mbB3k0V5dYhzh+b1Sj0v5Tu0gQZEgiH7bgFmUBrTT7dXZIQD4df
        iwRDqsvJgllFz7/C3Dhvj4bwlSv9AAZhplrvRURqA==
X-ME-Sender: <xms:nLWdWtKVtJxJxCyiTCbWhpG7k7D-c9WxVTaMvN-PTClWKzWwx4R6rA>
Received: from localhost (ppp121-44-99-155.bras1.syd7.internode.on.net [121.44.99.155])
        by mail.messagingengine.com (Postfix) with ESMTPA id CAA7524313;
        Mon,  5 Mar 2018 16:24:43 -0500 (EST)
Date:   Tue, 6 Mar 2018 08:24:40 +1100
From:   "Tobin C. Harding" <tobin@apporbit.com>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     "Tobin C. Harding" <me@tobin.cc>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joe Perches <joe@perches.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] docs: add Co-Developed-by docs
Message-ID: <20180305212440.GB21350@eros>
References: <1520222301-11874-1-git-send-email-me@tobin.cc>
 <1520222301-11874-3-git-send-email-me@tobin.cc>
 <20180305121135.GA15079@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180305121135.GA15079@bombadil.infradead.org>
X-Mailer: Mutt 1.5.24 (2015-08-30)
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 05, 2018 at 04:11:35AM -0800, Matthew Wilcox wrote:
> On Mon, Mar 05, 2018 at 02:58:21PM +1100, Tobin C. Harding wrote:
> > -12) When to use Acked-by: and Cc:
> > ----------------------------------
> > +12) When to use Acked-by: and Cc:, and Co-Developed-by:
> > +-------------------------------------------------------
> 
> +12) When to use Acked-by:, Cc:, and Co-Developed-by:

thanks, sloppy work by me :)


	Tobin
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

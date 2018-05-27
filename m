Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 33FC57D048
	for <lwn-linux-doc@archive.lwn.net>; Sun, 27 May 2018 06:40:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933904AbeE0GkJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 27 May 2018 02:40:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:41718 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933685AbeE0GkI (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 27 May 2018 02:40:08 -0400
Received: from localhost (LFbn-1-12247-202.w90-92.abo.wanadoo.fr [90.92.61.202])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1DBA52086D;
        Sun, 27 May 2018 06:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1527403207;
        bh=5wQhv6S+rg9IUga3eOGdFw7prpOMowyd99FG6nOjyCA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cOPNqm0mwjT7jW3x96B5uO1YGL0ugKU8XplPnH7DboMH5037bmUsLL2kGlXbQBeK2
         q1gt1rI4GB+qhI34w/Dkkrz8QhPWY2FZ2A/Ku8BQ2hcZypYq1NyJ92J++dbGrIlA2L
         FBe/NVcOdMqC1IuLFTMDv3lxQvhkI34bVSf1qUak=
Date:   Sun, 27 May 2018 08:39:46 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Marcus Folkesson <marcus.folkesson@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Felipe Balbi <balbi@kernel.org>,
        davem@davemloft.net,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] usb: gadget: ccid: add support for USB CCID Gadget
 Device
Message-ID: <20180527063946.GA1232@kroah.com>
References: <20180526203401.16586-1-marcus.folkesson@gmail.com>
 <20180526205652.GA25534@kroah.com>
 <20180527054847.GB22105@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180527054847.GB22105@gmail.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, May 27, 2018 at 07:48:47AM +0200, Marcus Folkesson wrote:
> On Sat, May 26, 2018 at 10:56:52PM +0200, Greg Kroah-Hartman wrote:
> > On Sat, May 26, 2018 at 10:33:59PM +0200, Marcus Folkesson wrote:
> > > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> > 
> > I can't take patches without any changelog text.  And why would you
> > submit a patch over 1000 lines without any?
> 
> I'm sorry, obviously not much went well for me yesterday.
> The changlelog was "fixup:ed" away and now I noticed that my
> patch version history did not follow for v2.
> 
> Is it better to send a v3 with updated version history or wait for more
> comments?

Nah, that's fine, but I'll let Felipe decide as he is the one that has
to review this, not me.

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

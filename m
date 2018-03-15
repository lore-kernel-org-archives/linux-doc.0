Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9C2027E66E
	for <lwn-linux-doc@archive.lwn.net>; Thu, 15 Mar 2018 17:13:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751353AbeCORNu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 15 Mar 2018 13:13:50 -0400
Received: from smtprelay0102.hostedemail.com ([216.40.44.102]:57754 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750987AbeCORNt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Mar 2018 13:13:49 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay08.hostedemail.com (Postfix) with ESMTP id 674F0182CF66F;
        Thu, 15 Mar 2018 17:13:47 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: flag05_3802cfc9660d
X-Filterd-Recvd-Size: 2691
Received: from XPS-9350 (unknown [47.151.150.235])
        (Authenticated sender: joe@perches.com)
        by omf04.hostedemail.com (Postfix) with ESMTPA;
        Thu, 15 Mar 2018 17:13:43 +0000 (UTC)
Message-ID: <1521134022.22221.38.camel@perches.com>
Subject: Re: rfc: remove print_vma_addr ? (was Re: [PATCH 00/16] remove
 eight obsolete architectures)
From:   Joe Perches <joe@perches.com>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        David Howells <dhowells@redhat.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org, linux-block@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-input@vger.kernel.org,
        netdev <netdev@vger.kernel.org>,
        linux-wireless <linux-wireless@vger.kernel.org>,
        Linux PWM List <linux-pwm@vger.kernel.org>,
        linux-rtc@vger.kernel.org, linux-spi <linux-spi@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Linux FS Devel <linux-fsdevel@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>
Date:   Thu, 15 Mar 2018 10:13:42 -0700
In-Reply-To: <20180315170830.GA17574@bombadil.infradead.org>
References: <20180314143529.1456168-1-arnd@arndb.de>
         <2929.1521106970@warthog.procyon.org.uk>
         <CAMuHMdXcxuzCOnFCNm4NXDv-wfYJDO5GQpB_ECu7j=2BjMhNpA@mail.gmail.com>
         <1521133006.22221.35.camel@perches.com>
         <20180315170830.GA17574@bombadil.infradead.org>
Content-Type: text/plain; charset="ISO-8859-1"
X-Mailer: Evolution 3.26.1-1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 2018-03-15 at 10:08 -0700, Matthew Wilcox wrote:
> On Thu, Mar 15, 2018 at 09:56:46AM -0700, Joe Perches wrote:
> > I have a patchset that creates a vsprintf extension for
> > print_vma_addr and removes all the uses similar to the
> > print_symbol() removal.
> > 
> > This now avoids any possible printk interleaving.
> > 
> > Unfortunately, without some #ifdef in vsprintf, which
> > I would like to avoid, it increases the nommu kernel
> > size by ~500 bytes.
> > 
> > Anyone think this is acceptable?
[]
> This doesn't feel like a huge win since it's only called ~once per
> architecture.  I'd be more excited if it made the printing of the whole
> thing standardised; eg we have a print_fault() function in mm/memory.c
> which takes a suitable set of arguments.

Sure but perhaps that's not feasible as the surrounding output
is per-arch specific.

What could be a standardized fault message here?

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

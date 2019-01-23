Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4DA987D04D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 23 Jan 2019 18:27:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726122AbfAWS1q (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 23 Jan 2019 13:27:46 -0500
Received: from emh04.mail.saunalahti.fi ([62.142.5.110]:37070 "EHLO
        emh04.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725871AbfAWS1q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Jan 2019 13:27:46 -0500
X-Greylist: delayed 473 seconds by postgrey-1.27 at vger.kernel.org; Wed, 23 Jan 2019 13:27:45 EST
Received: from darkstar.musicnaut.iki.fi (85-76-66-19-nat.elisa-mobile.fi [85.76.66.19])
        by emh04.mail.saunalahti.fi (Postfix) with ESMTP id DD6DC30118;
        Wed, 23 Jan 2019 20:19:49 +0200 (EET)
Date:   Wed, 23 Jan 2019 20:19:49 +0200
From:   Aaro Koskinen <aaro.koskinen@iki.fi>
To:     liaoweixiong <liaoweixiong@allwinnertech.com>,
        Kees Cook <keescook@chromium.org>
Cc:     Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "David S. Miller" <davem@davemloft.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC v5 1/4] pstore/blk: new support logger for block devices
Message-ID: <20190123181949.GC2792@darkstar.musicnaut.iki.fi>
References: <1546862462-19640-1-git-send-email-liaoweixiong@allwinnertech.com>
 <1546862462-19640-2-git-send-email-liaoweixiong@allwinnertech.com>
 <CAGXu5jKjTPJNf0BgGAB_T3hFgwP3infRuegzJ-+qGxfGxpBgmA@mail.gmail.com>
 <1497804b-f921-b0cf-1327-3b17beaf9ce7@allwinnertech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1497804b-f921-b0cf-1327-3b17beaf9ce7@allwinnertech.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Sat, Jan 19, 2019 at 04:53:48PM +0800, liaoweixiong wrote:
> On 2019-01-18 08:12, Kees Cook wrote:
> >> MTD (drivers/mtd/mtdoops.c).
> > 
> > Would mtdoops get dropped in favor of pstore/blk, or do they not share
> > features?
> 
> We can show them what pstore/blk do. I think they will be interested in it.
> They should do a little work, including make a function for panic read,
> then they gain enhanced features, including present logs as a file,
> record multiple logs.

mtdoops has been in use over a decade and known working. What benefits
this new framework would offer? (BTW I don't see MTD as "block device".)

Why should there be a panic read? That adds complexity. This codes runs
on panic path, so it should be as simple and fast as possible.

Also compatibility has to be there. E.g. user upgrades an old system
(with mtdoops and related userspace) to a new kernel. Upgrade fails,
so the old software must be able to read the panic dumps properly to
tell the user why.

A.

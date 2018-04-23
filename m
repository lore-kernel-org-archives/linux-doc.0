Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 09B2D7DD31
	for <lwn-linux-doc@archive.lwn.net>; Mon, 23 Apr 2018 19:53:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932306AbeDWTxR (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 23 Apr 2018 15:53:17 -0400
Received: from mail.linuxfoundation.org ([140.211.169.12]:54698 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932292AbeDWTxR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 23 Apr 2018 15:53:17 -0400
Received: from localhost (LFbn-1-12247-202.w90-92.abo.wanadoo.fr [90.92.61.202])
        by mail.linuxfoundation.org (Postfix) with ESMTPSA id D6AF734;
        Mon, 23 Apr 2018 19:53:15 +0000 (UTC)
Date:   Mon, 23 Apr 2018 21:53:10 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     "Bryant G. Ly" <bryantly@linux.vnet.ibm.com>,
        benh@kernel.crashing.org, mpe@ellerman.id.au, arnd@arndb.de,
        corbet@lwn.net, seroyer@linux.vnet.ibm.com,
        mrochs@linux.vnet.ibm.com, adreznec@linux.vnet.ibm.com,
        fbarrat@linux.vnet.ibm.com, davem@davemloft.net,
        linus.walleij@linaro.org, akpm@linux-foundation.org,
        mikey@neuling.org, pombredanne@nexb.com,
        tlfalcon@linux.vnet.ibm.com, msuchanek@suse.de,
        linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v1 1/1] misc: IBM Virtual Management Channel Driver
Message-ID: <20180423195310.GA10693@kroah.com>
References: <1524494812-60150-1-git-send-email-bryantly@linux.vnet.ibm.com>
 <1524494812-60150-2-git-send-email-bryantly@linux.vnet.ibm.com>
 <c07b14b7-8f34-2ba5-536f-85896ff21661@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c07b14b7-8f34-2ba5-536f-85896ff21661@infradead.org>
User-Agent: Mutt/1.9.5 (2018-04-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Apr 23, 2018 at 11:38:18AM -0700, Randy Dunlap wrote:
> On 04/23/18 07:46, Bryant G. Ly wrote:
> > This driver is a logical device which provides an
> > interface between the hypervisor and a management
> > partition.
> > 
> > This driver is to be used for the POWER Virtual
> > Management Channel Virtual Adapter on the PowerVM
> > platform. It provides both request/response and
> > async message support through the /dev/ibmvmc node.
> > 
> > Signed-off-by: Bryant G. Ly <bryantly@linux.vnet.ibm.com>
> > Reviewed-by: Steven Royer <seroyer@linux.vnet.ibm.com>
> > Reviewed-by: Adam Reznechek <adreznec@linux.vnet.ibm.com>
> > Tested-by: Taylor Jakobson <tjakobs@us.ibm.com>
> > Tested-by: Brad Warrum <bwarrum@us.ibm.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > ---
> >  Documentation/ioctl/ioctl-number.txt  |    1 +
> >  Documentation/misc-devices/ibmvmc.txt |  161 +++
> >  MAINTAINERS                           |    6 +
> >  arch/powerpc/include/asm/hvcall.h     |    1 +
> >  drivers/misc/Kconfig                  |   14 +
> >  drivers/misc/Makefile                 |    1 +
> >  drivers/misc/ibmvmc.c                 | 2415 +++++++++++++++++++++++++++++++++
> >  drivers/misc/ibmvmc.h                 |  209 +++
> >  8 files changed, 2808 insertions(+)
> >  create mode 100644 Documentation/misc-devices/ibmvmc.txt
> >  create mode 100644 drivers/misc/ibmvmc.c
> >  create mode 100644 drivers/misc/ibmvmc.h
> 
> > diff --git a/Documentation/misc-devices/ibmvmc.txt b/Documentation/misc-devices/ibmvmc.txt
> > new file mode 100644
> > index 0000000..bae1064
> > --- /dev/null
> > +++ b/Documentation/misc-devices/ibmvmc.txt

Aren't we doing new documentation in .rst format instead of .txt?

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

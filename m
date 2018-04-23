Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B839E7DD31
	for <lwn-linux-doc@archive.lwn.net>; Mon, 23 Apr 2018 18:38:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932292AbeDWSiZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 23 Apr 2018 14:38:25 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:55322 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932252AbeDWSiY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 23 Apr 2018 14:38:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=OUcx30fPvwM4lKiapRaWpQaAaslDeQAVNW5fJHk3+Lw=; b=AvOyZa4FK2JJZpduJqJ9vjoiy
        RLXVSIFOtalq7bjXcUQ2poZaKAmnT41TfKFk0eg4n5Ia5/UG0eJDcXWeiwdUGBu0Y5Bs9Kf+nhnTY
        qGnZM7HAuEtKhARfTMdrkaGoODe8Jnv+1XP49xAYr5vxdHiKDupDz4mkybZfJhy/We5vpGxOGYC5f
        Oe/PdMUF+s3BxJT9qfhaCNqQluTyjSI1s9EbERuQZaec0m6CsoS3MGWjYoFwmogFdoUt/tuZ1M0N3
        w5ujhNGi8hW0Bg5eUebCm6FsNZdUhuEoFhj3QulhhAc3fX8HBaEXF3t3jmY5vpzCafl+41z/nZqyN
        o9fkA7v/g==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fAgM1-0001cu-D2; Mon, 23 Apr 2018 18:38:21 +0000
Subject: Re: [PATCH v1 1/1] misc: IBM Virtual Management Channel Driver
To:     "Bryant G. Ly" <bryantly@linux.vnet.ibm.com>,
        benh@kernel.crashing.org, mpe@ellerman.id.au,
        gregkh@linuxfoundation.org, arnd@arndb.de
Cc:     corbet@lwn.net, seroyer@linux.vnet.ibm.com,
        mrochs@linux.vnet.ibm.com, adreznec@linux.vnet.ibm.com,
        fbarrat@linux.vnet.ibm.com, davem@davemloft.net,
        linus.walleij@linaro.org, akpm@linux-foundation.org,
        mikey@neuling.org, pombredanne@nexb.com,
        tlfalcon@linux.vnet.ibm.com, msuchanek@suse.de,
        linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <1524494812-60150-1-git-send-email-bryantly@linux.vnet.ibm.com>
 <1524494812-60150-2-git-send-email-bryantly@linux.vnet.ibm.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <c07b14b7-8f34-2ba5-536f-85896ff21661@infradead.org>
Date:   Mon, 23 Apr 2018 11:38:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1524494812-60150-2-git-send-email-bryantly@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 04/23/18 07:46, Bryant G. Ly wrote:
> This driver is a logical device which provides an
> interface between the hypervisor and a management
> partition.
> 
> This driver is to be used for the POWER Virtual
> Management Channel Virtual Adapter on the PowerVM
> platform. It provides both request/response and
> async message support through the /dev/ibmvmc node.
> 
> Signed-off-by: Bryant G. Ly <bryantly@linux.vnet.ibm.com>
> Reviewed-by: Steven Royer <seroyer@linux.vnet.ibm.com>
> Reviewed-by: Adam Reznechek <adreznec@linux.vnet.ibm.com>
> Tested-by: Taylor Jakobson <tjakobs@us.ibm.com>
> Tested-by: Brad Warrum <bwarrum@us.ibm.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  Documentation/ioctl/ioctl-number.txt  |    1 +
>  Documentation/misc-devices/ibmvmc.txt |  161 +++
>  MAINTAINERS                           |    6 +
>  arch/powerpc/include/asm/hvcall.h     |    1 +
>  drivers/misc/Kconfig                  |   14 +
>  drivers/misc/Makefile                 |    1 +
>  drivers/misc/ibmvmc.c                 | 2415 +++++++++++++++++++++++++++++++++
>  drivers/misc/ibmvmc.h                 |  209 +++
>  8 files changed, 2808 insertions(+)
>  create mode 100644 Documentation/misc-devices/ibmvmc.txt
>  create mode 100644 drivers/misc/ibmvmc.c
>  create mode 100644 drivers/misc/ibmvmc.h

> diff --git a/Documentation/misc-devices/ibmvmc.txt b/Documentation/misc-devices/ibmvmc.txt
> new file mode 100644
> index 0000000..bae1064
> --- /dev/null
> +++ b/Documentation/misc-devices/ibmvmc.txt
> @@ -0,0 +1,161 @@
> +Kernel Driver ibmvmc
> +====================
> +
> +Authors:
> +	Dave Engebretsen <engebret@us.ibm.com>
> +	Adam Reznechek <adreznec@linux.vnet.ibm.com>
> +	Steven Royer <seroyer@linux.vnet.ibm.com>
> +	Bryant G. Ly <bryantly@linux.vnet.ibm.com>
> +
> +Description
> +===========
> +

...

> +
> +Virtual Management Channel (VMC)
> +A logical device, called the virtual management channel (VMC), is defined
> +for communicating between the Novalink application and the hypervisor.
> +This device, similar to a VSCSI server device, is presented to a designated
> +management partition as a virtual device and is only presented when the
> +system is not HMC managed.
> +This communication device borrows aspects from both VSCSI and ILLAN devices
> +and is implemented using the CRQ and the RDMA interfaces. A three-way
> +handshake is defined that must take place to establish that both the
> +hypervisor and management partition sides of the channel are running prior
> +to sending/receiving any of the protocol messages.
> +This driver also utilizes Transport Event CRQs. CRQ messages that are sent

                                                 Drop           "that" ?
otherwise the sentence construction is ... odd.

> +when the hypervisor detects one of the peer partitions has abnormally
> +terminated, or one side has called H_FREE_CRQ to close their CRQ.
> +Two new classes of CRQ messages are introduced for the VMC device. VMC
> +Administrative messages are used for each partition using the VMC to
> +communicate capabilities to their partner. HMC Interface messages are used
> +for the actual flow of HMC messages between the management partition and
> +the hypervisor. As most HMC messages far exceed the size of a CRQ bugger,

what is a bugger?
[reads more]
oh, buffer?

> +a virtual DMA (RMDA) of the HMC message data is done prior to each HMC
> +Interface CRQ message. Only the management partition drives RDMA
> +operations; hypervisors never directly causes the movement of message data.
> +
> +Example Management Partition VMC Driver Interface
> +=================================================

...


Looks pretty good.  In general (IMO), it could use more white space (like blank
lines after section names.)

If you fix those small items (buggers) above, you can add:
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

thanks,
-- 
~Randy
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 961847D09D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 29 May 2018 20:27:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S966399AbeE2U1b (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 29 May 2018 16:27:31 -0400
Received: from merlin.infradead.org ([205.233.59.134]:58428 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966179AbeE2U1b (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 May 2018 16:27:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=2KYEBSM6qOsYCmNf42arNAtuCNETJJQkkw9V3zTjkTo=; b=hfw3IxA/oqOiQiYlLBeZP6U0Bh
        Kja3izgJ1pn/oVM0uaf0IgkSSHmzF8Abj6+VuSgU/9FFbPOiqI/xsOwDc2ypItYTXXxXwOI8sxMz+
        9u4Sp13o4mLbG7mgRUoKJYtvPAIVDOhFqONbHUBUqBFuMl8T9ps0p4p3rEb3+orhYbsyHhb7MLAV+
        OPF/Q4Mh09q+ng7lhfDQi3W1BMTvyAgTAnhbPdFCJaB9TUZUx2WudYorRTvUe7eIVPj2qFUsnECc+
        FXS3y5AMR5/bVrQhmmATDUfxNRlNvmtLyLBnjZ+m5BioUEMTMLLwcJkzaMoYC/OgB34MC9F63wasz
        A5BirXbQ==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fNlDJ-0000wZ-VX; Tue, 29 May 2018 20:27:26 +0000
Subject: Re: [PATCH v3 2/3] Documentation: usb: add documentation for USB CCID
 Gadget Device
To:     Marcus Folkesson <marcus.folkesson@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Felipe Balbi <balbi@kernel.org>, davem@davemloft.net,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kate Stewart <kstewart@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20180529185021.13738-1-marcus.folkesson@gmail.com>
 <20180529185021.13738-2-marcus.folkesson@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <f4cdc62c-8bbe-28f9-0e7a-b4943d6f6a4f@infradead.org>
Date:   Tue, 29 May 2018 13:27:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180529185021.13738-2-marcus.folkesson@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 05/29/2018 11:50 AM, Marcus Folkesson wrote:
> Add documentation to give a brief description on how to use the
> CCID Gadget Device.
> This includes a description for all attributes followed by an example on
> how to setup the device with ConfigFS.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
> 
> Notes:
>     v3:
>     	- correct the grammer (thanks Randy)
>     v2:
>     	- add the missing changelog text
> 
>  Documentation/usb/gadget_ccid.rst | 267 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 267 insertions(+)
>  create mode 100644 Documentation/usb/gadget_ccid.rst
> 
> diff --git a/Documentation/usb/gadget_ccid.rst b/Documentation/usb/gadget_ccid.rst
> new file mode 100644
> index 000000000000..524fe9e6ac19
> --- /dev/null
> +++ b/Documentation/usb/gadget_ccid.rst
> @@ -0,0 +1,267 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +============
> +CCID Gadget
> +============
> +
> +:Author: Marcus Folkesson <marcus.folkesson@gmail.com>
> +
> +Introduction
> +============
> +
> +The CCID Gadget will present itself as a CCID device to the host system.
> +The device supports two endpoints for now; BULK IN and BULK OUT.
> +These endpoints are exposed to userspace via /dev/ccidg*.
> +
> +All CCID commands are sent on the BULK-OUT endpoint. Each command sent to the CCID
> +has an associated ending response. Some commands can also have intermediate
> +responses. The response is sent on the BULK-IN endpoint.
> +See Figure 3-3 in the CCID Specification [1]_ for more details.
> +
> +The CCID commands must be handled in userspace since the driver is only working
> +as a transport layer for the TPDUs.

I think that it would be helpful to tell us what the naming of the /dev/ccidg*
endpoints looks like.  Also, how to distinguish the BULK-IN from the BULK-OUT
endpoint.

> +
> +
> +CCID Commands
> +--------------
> +
> +All CCID commands begins with a 10-byte header followed by an optional
> +data field depending on message type.
> +
> ++--------+--------------+-------+----------------------------------+
> +| Offset | Field        | Size  | Description                      |
> ++========+==============+=======+==================================+
> +| 0      | bMessageType | 1     | Type of message                  |
> ++--------+--------------+-------+----------------------------------+
> +| 1      | dwLength     | 4     | Message specific data length     |
> +|        |              |       |                                  |
> ++--------+--------------+-------+----------------------------------+
> +| 5      | bSlot        | 1     | Identifies the slot number       |
> +|        |              |       | for this command                 |
> ++--------+--------------+-------+----------------------------------+
> +| 6      | bSeq         | 1     | Sequence number for command      |
> ++--------+--------------+-------+----------------------------------+
> +| 7      | ...          | 3     | Fields depends on message type   |
> ++--------+--------------+-------+----------------------------------+
> +| 10     | abData       | array | Message specific data (OPTIONAL) |
> ++--------+--------------+-------+----------------------------------+
> +
> +
> +Multiple CCID gadgets
> +----------------------
> +
> +It is possible to create multiple instances of the CCID gadget, however,
> +a much more flexible way is to create one gadget and set the `nslots` attribute
> +to the number of desired CCID devices.
> +
> +All CCID commands specify which slot is the receiver in the `bSlot` field
> +of the CCID header.
> +
> +Usage
> +=====
> +
> +Access from userspace
> +----------------------
> +All communication is by read(2) and write(2) to the corresponding /dev/ccidg* device.
> +Only one file descriptor is allowed to be open to the device at a time.


Reviewed-by: Randy Dunlap <rdunlap@infradead.org>


thanks,
-- 
~Randy
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

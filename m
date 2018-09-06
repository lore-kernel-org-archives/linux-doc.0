Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id F07137D581
	for <lwn-linux-doc@archive.lwn.net>; Thu,  6 Sep 2018 15:48:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730342AbeIFUYQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 6 Sep 2018 16:24:16 -0400
Received: from ms.lwn.net ([45.79.88.28]:50536 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730326AbeIFUYQ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 6 Sep 2018 16:24:16 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 338352E6;
        Thu,  6 Sep 2018 15:47:59 +0000 (UTC)
Date:   Thu, 6 Sep 2018 09:47:38 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rd.dunlab@gmail.com>
Cc:     linux1394-devel@lists.sourceforge.net,
        Stefan Richter <stefanr@s5r6.in-berlin.de>,
        Takashi Sakamoto <o-takashi@sakamocchi.jp>,
        linux-doc@vger.kernel.org, linux-scsi@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: [PATCH v3 0/5] FireWire: clean up kernel-doc, add Documentation
 chapter
Message-ID: <20180906094738.0248c67e@lwn.net>
In-Reply-To: <20180905000225.10733-1-rd.dunlab@gmail.com>
References: <20180905000225.10733-1-rd.dunlab@gmail.com>
Organization: LWN.net
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue,  4 Sep 2018 17:02:20 -0700
Randy Dunlap <rd.dunlab@gmail.com> wrote:

> This patch series cleans up kernel-doc warnings in several
> FireWire source files and then adds a Documentation driver-api
> chapter for FireWire.
> 
> [PATCH v4 1/5] FireWire: clean up firewire-cdev.h kernel-doc
> [PATCH v4 2/5] FireWire: clean up core-iso.c kernel-doc
> [PATCH v4 3/5] FireWire: clean up core-transaction.c kernel-doc
> [PATCH v4 4/5] FireWire: add a Documentation driver-api chapter
> [PATCH v4 5/5] FireWire: add driver-api Introduction section
> 
> The only changes in v4 are (a) respin against current -next and
> (b) add more Cc:s so that someone will please merge the series.(*)
> 
> I think that Jon is the best choice to merge this series, but
> someone please do so.  It has already missed 2 merge windows.

I think this is the first time I've received this...  Through the
FireWire maintainer seems like the best path, but it seems that's not
happening.  The patches look good to me, so I've just applied them.

Thanks,

jon

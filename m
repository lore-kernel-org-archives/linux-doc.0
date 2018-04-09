Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0399B7E86A
	for <lwn-linux-doc@archive.lwn.net>; Mon,  9 Apr 2018 12:24:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752491AbeDIMYZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 9 Apr 2018 08:24:25 -0400
Received: from ms.lwn.net ([45.79.88.28]:38238 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752260AbeDIMYY (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 9 Apr 2018 08:24:24 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 2B149ACA;
        Mon,  9 Apr 2018 12:24:24 +0000 (UTC)
Date:   Mon, 9 Apr 2018 06:24:22 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Evgeniy Polyakov <zbr@ioremap.net>
Cc:     Gergo Huszty <huszty.gergo@digitaltrip.hu>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Fixed typo in onewire generic doc
Message-ID: <20180409062422.40423c00@lwn.net>
In-Reply-To: <6472401523231809@web57o.yandex.ru>
References: <20171220190709.6584-1-huszty.gergo@digitaltrip.hu>
        <6472401523231809@web57o.yandex.ru>
Organization: LWN.net
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 09 Apr 2018 02:56:49 +0300
Evgeniy Polyakov <zbr@ioremap.net> wrote:

> Hi everyone
> 
> I'm really sorry for that long delay.
> 
> Was this patch accepted or should I push it upstream?
> 
> 20.12.2017, 22:09, "Gergo Huszty" <huszty.gergo@digitaltrip.hu>:
> > Onewire devices has 6 byte long unique serial numbers, 1 byte family
> > code and 1 byte CRC. Linux sysfs presents the device folder in the
> > form of familyID-deviceID, so CRC is not shown. The consequence is
> > that the device serial number is always a 12 long hex-string, but
> > doc says 13 in one place. This is corrected by this change.
> > Reference: https://en.wikipedia.org/wiki/1-Wire

Commit d6f44b3bd870ff5946fcd4293b4c07029d8d93c9, merged for 4.16.

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

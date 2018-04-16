Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EED297DE78
	for <lwn-linux-doc@archive.lwn.net>; Mon, 16 Apr 2018 02:18:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752212AbeDPCS0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 15 Apr 2018 22:18:26 -0400
Received: from smtp-proxy002.phy.lolipop.jp ([157.7.104.43]:34540 "EHLO
        smtp-proxy002.phy.lolipop.jp" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751774AbeDPCSZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 15 Apr 2018 22:18:25 -0400
X-Greylist: delayed 478 seconds by postgrey-1.27 at vger.kernel.org; Sun, 15 Apr 2018 22:18:25 EDT
Received: from smtp-proxy002.phy.lolipop.lan (HELO smtp-proxy002.phy.lolipop.jp) (172.19.44.43)
  (smtp-auth username m12129643-o-takashi , mechanism plain)
  by smtp-proxy002.phy.lolipop.jp (qpsmtpd/0.82) with ESMTPA; Mon, 16 Apr 2018 11:10:26 +0900
Received: from 127.0.0.1 (127.0.0.1)
 by smtp-proxy002.phy.lolipop.jp (LOLIPOP-Fsecure);
 Mon, 16 Apr 2018 11:10:26 +0900 (JST)
X-Virus-Status: clean(LOLIPOP-Fsecure)
Subject: Re: [PATCH v2 0/5] FireWire: clean up kernel-doc, add Documentation
 chapter
To:     Randy Dunlap <rd.dunlab@gmail.com>,
        linux1394-devel@lists.sourceforge.net
Cc:     Stefan Richter <stefanr@s5r6.in-berlin.de>,
        linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
References: <20180414012722.17420-1-rd.dunlab@gmail.com>
From:   Takashi Sakamoto <o-takashi@sakamocchi.jp>
Message-ID: <52b34674-f1bd-311f-8bc4-9eb0ceb88c97@sakamocchi.jp>
Date:   Mon, 16 Apr 2018 11:10:26 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180414012722.17420-1-rd.dunlab@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Apr 14 2018 10:27, Randy Dunlap wrote:
> This patch series cleans up kernel-doc warnings in several
> FireWire source files and then adds a Documentation driver-api
> chapter for FireWire.
> 
> [PATCH v3 1/5] FireWire: clean up firewire-cdev.h kernel-doc
> [PATCH v3 2/5] FireWire: clean up core-iso.c kernel-doc
> [PATCH v3 3/5] FireWire: clean up core-transaction.c kernel-doc
> [PATCH v3 4/5] FireWire: add a Documentation driver-api chapter
> [PATCH v3 5/5] FireWire: add driver-api Introduction section
> 
>   Documentation/driver-api/firewire.rst |   50 +++++++++++++++++++++++-
>   Documentation/driver-api/index.rst    |    1
>   drivers/firewire/core-iso.c           |    7 +++
>   drivers/firewire/core-transaction.c   |   10 ++++
>   include/uapi/linux/firewire-cdev.h    |   22 ++++++----
>   5 files changed, 81 insertions(+), 9 deletions(-)

I reviewed all of the five patches.

Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

We're on development cycle for v4.18. Your patchset will be merged into
mainline in next merge window by pull request from Stefan.


Thanks

Takashi Sakamoto
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

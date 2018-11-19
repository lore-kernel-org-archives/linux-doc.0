Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CDD187D08A
	for <lwn-linux-doc@archive.lwn.net>; Mon, 19 Nov 2018 01:19:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726881AbeKSLlC (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 19 Nov 2018 06:41:02 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:43962 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726235AbeKSLlC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Nov 2018 06:41:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=7LUWbQKNC9ero45eNqmcVOEcr31ejDs4Sku6065JQqg=; b=H9CQWRwJr57gdh8Cn5tMdDRMt
        +3bCj+5z7MsQV9BsH173LzaHNM4cHq+UAqEGBwU56ZtHGiNtXvdASh1GGGYGZQrmSxMYC/5m7qcyg
        hl497L3otZVRQsp7mP3OzgQxFrLlPORfkqS5dlgVzF/+zy9jVBX0MXKnE81IR82m5SLWEd6ln917F
        D0ks4Y4AZYMnQiZ9tIS+lmzkryJ5VzyXuHErn8FG1pIbDTHqLCETEXAW7QhSzZN2okVLZCkL9Uz8E
        nBAHLU7mOliGG9ryVKbgZ2wVnX6Q3MXSM2u1riFhVFufRPDgDH0lAaEeVHtnt9NN4FJoUlASNWXHa
        WjE6Y47kA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1gOYDR-00017k-5S; Mon, 19 Nov 2018 01:19:05 +0000
Date:   Sun, 18 Nov 2018 17:19:04 -0800
From:   Matthew Wilcox <willy@infradead.org>
To:     kernel test robot <rong.a.chen@intel.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, intel-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org,
        LKP <lkp@01.org>
Subject: Re: [LKP] dad4f140ed [ 7.709376] WARNING:suspicious_RCU_usage
Message-ID: <20181119011904.GE7861@bombadil.infradead.org>
References: <20181119010820.GM18977@shao2-debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181119010820.GM18977@shao2-debian>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Nov 19, 2018 at 09:08:20AM +0800, kernel test robot wrote:
> Greetings,
> 
> 0day kernel testing robot got the below dmesg and the first bad commit is

Umm.  I don't see a 'suspicious RCU usage' message in here.  I see a
lot of vmalloc warnings ... ?

> [    7.699777] swapper: vmalloc: allocation failure: 18446744073709551615 bytes, mode:0x6000c0(GFP_KERNEL), nodemask=(null)
> [    7.724561] swapper: vmalloc: allocation failure: 18446744073709551615 bytes, mode:0x6000c0(GFP_KERNEL), nodemask=(null)
> [    7.737925] swapper: vmalloc: allocation failure: 18446744073709551615 bytes, mode:0x6080c0(GFP_KERNEL|__GFP_ZERO), nodemask=(null)
> [    7.750283] swapper: vmalloc: allocation failure: 18446744073709551615 bytes, mode:0x6080c0(GFP_KERNEL|__GFP_ZERO), nodemask=(null)
> [    7.777903] swapper: vmalloc: allocation failure: 18446744073709551615 bytes, mode:0x6000c0(GFP_KERNEL), nodemask=(null)
> [    7.787175] swapper: vmalloc: allocation failure: 18446744073709551615 bytes, mode:0x6000c0(GFP_KERNEL), nodemask=(null)
> [    7.796181] swapper: vmalloc: allocation failure: 18446744073709551615 bytes, mode:0x6080c0(GFP_KERNEL|__GFP_ZERO), nodemask=(null)
> [    7.804841] swapper: vmalloc: allocation failure: 18446744073709551615 bytes, mode:0x6080c0(GFP_KERNEL|__GFP_ZERO), nodemask=(null)

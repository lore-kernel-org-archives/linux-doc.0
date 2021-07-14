Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B027DC12002
	for <linux-doc@archiver.kernel.org>; Wed, 14 Jul 2021 23:36:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 800A8613CF
	for <linux-doc@archiver.kernel.org>; Wed, 14 Jul 2021 23:36:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230354AbhGNXjh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 14 Jul 2021 19:39:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbhGNXjh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Jul 2021 19:39:37 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D614C06175F
        for <linux-doc@vger.kernel.org>; Wed, 14 Jul 2021 16:36:44 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id z2so2250282plg.8
        for <linux-doc@vger.kernel.org>; Wed, 14 Jul 2021 16:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bpCidut7Y+ABpHii2ufcLj/byDFjycPRGaRpwYZGZlQ=;
        b=W887eRL7tjmE8e+WubBO8QUUg3y6nx6l4+fQU03XLKk3iLKcjk0ppkaq+FM9KzeXbs
         mX0EUjGBRq6nYn+ZXoWgv8yCQS8df2SS49ErPvYeNCu3P3MtLn4YM2pc2xBJdM9NT62Y
         72cfoZPCmAS4sKBcUrSi87mBfYWBTmJWJ23dG5DDFekAu3Lct3p8/5ZCw3yxFheigzzC
         42Zs8DnSTBRr+rtSaPtlzaXd44UfeGvKytJcA1z8ZQrI+pcNm50k+1D1jZ+ioNjUce2m
         KwTmq3F//GnnivKl0v7u92ANJjTQjWAfwygnHiMxBLqyRFD8MCFhbphbP8TSrMBk8/5x
         Dn1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bpCidut7Y+ABpHii2ufcLj/byDFjycPRGaRpwYZGZlQ=;
        b=p53LZqYUqBADq9NKME4DVUi+SoNqhfTDiKNubPoTAcCEKa8WOJD1GZ4OGrNvdtnYJB
         nsx1XUckKuMU0uwRrHs1QkG+PhV4p/4Ougfky4qS1q6j+J5sZYO1rR8r7KSAOsTWwEBV
         RK6baz7qBSxkjurDRvsJT8+u1Oe5gcVluWJzYV9PhoainUbiBfv6z3mWZvOkELNvRWC5
         RpkVQo6v30yGbPVRvsXnvamg2YBSwrIQd22Z72SRUMZsEbw0ANLpDmjz03tUG3pnqyP2
         qjdtwnd/sarntKd9x/EWsFek1BP4Ho4Uu9wK4CDTbG3+XSuGT0ET8JIpMoF8kHMvIfVW
         A+AQ==
X-Gm-Message-State: AOAM531kUNCe8eJaz41YtRQXeQMornB/TO50dm6Owh1w6feTf08AsFiV
        6arrVCtu+aFIJvC1u2ttCdx4s4EiA85KRGMcrHAKHQ==
X-Google-Smtp-Source: ABdhPJwyOXNSnZTp/+uzMRzRMTfPx0NUacBoTzIEG3iGV1yra1vYFoiXYBa1MRCfuKkEcreTiVTLRy/oL9CSQ1ZnOfA=
X-Received: by 2002:a17:90a:ae0c:: with SMTP id t12mr5866325pjq.149.1626305804398;
 Wed, 14 Jul 2021 16:36:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210714193542.21857-1-joao.m.martins@oracle.com> <20210714193542.21857-13-joao.m.martins@oracle.com>
In-Reply-To: <20210714193542.21857-13-joao.m.martins@oracle.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Wed, 14 Jul 2021 16:36:33 -0700
Message-ID: <CAPcyv4h5c9afuxXy=UhrRr_tTwHB62RODyCKWNFU5TumXHc76A@mail.gmail.com>
Subject: Re: [PATCH v3 12/14] device-dax: compound pagemap support
To:     Joao Martins <joao.m.martins@oracle.com>
Cc:     Linux MM <linux-mm@kvack.org>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Naoya Horiguchi <naoya.horiguchi@nec.com>,
        Matthew Wilcox <willy@infradead.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        John Hubbard <jhubbard@nvidia.com>,
        Jane Chu <jane.chu@oracle.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux NVDIMM <nvdimm@lists.linux.dev>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 14, 2021 at 12:36 PM Joao Martins <joao.m.martins@oracle.com> wrote:
>
> Use the newly added compound pagemap facility which maps the assigned dax
> ranges as compound pages at a page size of @align. Currently, this means,
> that region/namespace bootstrap would take considerably less, given that
> you would initialize considerably less pages.
>
> On setups with 128G NVDIMMs the initialization with DRAM stored struct
> pages improves from ~268-358 ms to ~78-100 ms with 2M pages, and to less
> than a 1msec with 1G pages.
>
> dax devices are created with a fixed @align (huge page size) which is
> enforced through as well at mmap() of the device. Faults, consequently
> happen too at the specified @align specified at the creation, and those
> don't change through out dax device lifetime. MCEs poisons a whole dax
> huge page, as well as splits occurring at the configured page size.
>

Hi Joao,

With this patch I'm hitting the following with the 'device-dax' test [1].

kernel BUG at include/linux/mm.h:748!
invalid opcode: 0000 [#1] SMP NOPTI
CPU: 29 PID: 1509 Comm: device-dax Tainted: G        W  OE     5.14.0-rc1+ #720
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 0.0.0 02/06/2015
RIP: 0010:memunmap_pages+0x2f5/0x390
Code: 00 00 00 31 d2 48 8d 70 01 48 29 fe 48 c1 ef 0c 48 c1 ee 0c e8
1c 30 fa ff e9 c5 fe ff ff 48 c7 c6 00 4a 58 87 e8 eb d1 f6 ff <0f> 0b
48 8b 7b 30 31 f6 e8 7e aa 2b 00 e9 2d fd ff ff 48 8d 7b 48
RSP: 0018:ffff9d33c240bbf0 EFLAGS: 00010246
RAX: 000000000000003e RBX: ffff8a44446eb700 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffff8a46b3b58af0 RDI: ffff8a46b3b58af0
RBP: 0000000000000000 R08: 0000000000000001 R09: 00000000ffffbfff
R10: ffff8a46b32a0000 R11: ffff8a46b32a0000 R12: 0000000000104201
R13: ffff8a44446eb700 R14: 0000000000000004 R15: ffff8a44474954d8
FS:  00007fd048a81fc0(0000) GS:ffff8a46b3b40000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000561ee7399000 CR3: 0000000206c70004 CR4: 0000000000170ee0
Call Trace:
 devres_release_all+0xb8/0x100
 __device_release_driver+0x190/0x240
 device_release_driver+0x26/0x40
 bus_remove_device+0xef/0x160
 device_del+0x18c/0x3e0
 unregister_dev_dax+0x62/0x90
 devres_release_all+0xb8/0x100
 __device_release_driver+0x190/0x240
 device_driver_detach+0x3e/0xa0
 unbind_store+0x113/0x130

[1]: https://github.com/pmem/ndctl/blob/master/test/device-dax.c

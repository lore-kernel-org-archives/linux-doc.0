Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 71E717D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 Jan 2019 21:47:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbfAGVrq (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 Jan 2019 16:47:46 -0500
Received: from mail-vk1-f194.google.com ([209.85.221.194]:33049 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726934AbfAGVrl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Jan 2019 16:47:41 -0500
Received: by mail-vk1-f194.google.com with SMTP id d201so443734vka.0
        for <linux-doc@vger.kernel.org>; Mon, 07 Jan 2019 13:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YQ7FpZSVRYgjz4zvMXV7TjL2RDg8LfVCTLWfBdLl6o8=;
        b=Aez9kVa9X4UBUMcv7J5Gknz6PmFvqpxeK3rtNkfeQ7wczvXCSsAYhYs+9lTBQl/qRx
         DL1MyN/+3FZiT8Bm2SrtYSLKpWbMwlVezwynkKiW7rCGL249ITSeU5A09NqRlUTK5AP4
         VI5MU2pZQl+rMrAA3WpRMqYVux8f75t666KOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YQ7FpZSVRYgjz4zvMXV7TjL2RDg8LfVCTLWfBdLl6o8=;
        b=hRy/oJNX5v+FyQ6R/XlJVceJ0LgFKE9C8nNtLOkQGKFeD7+FCWF9fyVkEPE+N1QTkC
         K+zKPnpmFWab+7uGgEfqRGq+ycHkHMcy8Lk869CfjV0sstEqN4WBmUk02a/gNlUqH6TV
         rudhxDt6T36p56M3T52sMmu+NDmcQ+6d2l424jq9rm0DsFExD6bM68N6Ta5LbCucPUmt
         WLlpjDfKS8L0Zw+ZOEWQMN0qwlIma7Il7V1t0b+RATUBByN8JjC9eA5iF0x4Kaze2JEt
         U8ue7TRN7DkaIo2H4ABQQQIQ3+hSRQ4CISxT5DZB+2HiDU29VxYL5w+HKVtoXwj9CCKp
         nVjA==
X-Gm-Message-State: AJcUukcOgjL0I9IjvEs+X9J/5KgMVCAAqfFthDyxVT1OOYMYDaFlX7Sa
        PG+8PCWZ0DvtYNhvT6X2Ew4TkfZRgL0=
X-Google-Smtp-Source: ALg8bN5hrt9UfbTeJyEV0Jfvo6bOCEK18xVMIlAhES4V6n3ug5SnNlwixJxuH3vEvBOD2KWToU8HAg==
X-Received: by 2002:a1f:3093:: with SMTP id w141mr22643867vkw.32.1546897659243;
        Mon, 07 Jan 2019 13:47:39 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id t133sm22362826vsc.8.2019.01.07.13.47.36
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Jan 2019 13:47:36 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id y14so444721vkd.1
        for <linux-doc@vger.kernel.org>; Mon, 07 Jan 2019 13:47:36 -0800 (PST)
X-Received: by 2002:a1f:e7c5:: with SMTP id e188mr21439180vkh.92.1546897655846;
 Mon, 07 Jan 2019 13:47:35 -0800 (PST)
MIME-Version: 1.0
References: <1546862462-19640-1-git-send-email-liaoweixiong@allwinnertech.com>
In-Reply-To: <1546862462-19640-1-git-send-email-liaoweixiong@allwinnertech.com>
From:   Kees Cook <keescook@chromium.org>
Date:   Mon, 7 Jan 2019 13:47:24 -0800
X-Gmail-Original-Message-ID: <CAGXu5jKrEHkogWsNW0rui8fBbdGin0syWzdfhVhw1V9tTRy0+A@mail.gmail.com>
Message-ID: <CAGXu5jKrEHkogWsNW0rui8fBbdGin0syWzdfhVhw1V9tTRy0+A@mail.gmail.com>
Subject: Re: [RFC v5 0/4] pstore/block: new support logger for block devices
To:     liaoweixiong <liaoweixiong@allwinnertech.com>
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
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jan 7, 2019 at 4:01 AM liaoweixiong
<liaoweixiong@allwinnertech.com> wrote:
>
> Why should we need pstore_block?
> 1. Most embedded intelligent equipment have no persistent ram, which
> increases costs. We perfer to cheaper solutions, like block devices.
> In fast, there is already a sample for block device logger in driver
> MTD (drivers/mtd/mtdoops.c).
> 2. Do not any equipment have battery, which means that it lost all data
> on general ram if power failure. Pstore has little to do for these
> equipments.

I'm catching up from being off over the holidays, but I just wanted to
say that I like the general idea here.

> [PATCH v5]
> On patch 1:
> 1. rename pstore/rom to pstore/blk

Thanks! The earlier name seemed wrong. :)

> 2. Do not allocate any memory in the write path of panic. So, use local
> array instead in function romz_recover_dmesg_meta.
> 3. Add C header file "linux/fs.h" to fix implicit declaration of function
>    'filp_open','kernel_read'...
> On patch 3:
> 1. If panic, do not recover pmsg but flush if it is dirty.
> 2. Fix erase pmsg failed.
> On patch 4:
> 1. Create a document for pstore/blk

Overall, I wonder if more of the ram backend code could get reused for
the blk backend? I'd much rather be able to share that, since much of
the logic is the same.

I'll get to a more detailed review in the coming days. Thanks for sending this!

-Kees

>
> [PATCH v4]
> On patch 1:
> 1. Fix always true condition '(--i >= 0) => (0-u32max >= 0)' in function
>    romz_init_zones by defining variable i to 'int' rahter than
>    'unsigned int'.
> 2. To make codes more easily to read, we use macro READ_NEXT_ZONE for
>    return value of romz_dmesg_read if it need to read next zone.
>    Moveover, we assign READ_NEXT_ZONE -1024 rather than 0.
> 3. Add 'FLUSH_META' to 'enum romz_flush_mode' and rename 'NOT_FLUSH' to
>    'FLUSH_NONE'
> 4. Function romz_zone_write work badly with FLUSH_PART mode as badly
>    address and offset to write.
> On patch 3:
> NEW SUPPORT psmg for pstore_rom.
>
> [PATCH v3]
> On patch 1:
> Fix build as module error for undefined 'vfs_read' and 'vfs_write'
> Both of 'vfs_read' and 'vfs_write' haven't be exproted yet, so we use
> 'kernel_read' and 'kernel_write' instead.
>
> [PATCH v2]
> On patch 1:
> Fix build as module error for redefinition of 'romz_unregister' and
> 'romz_register'
>
> [PATCH v1]
> On patch 1:
> Core codes of pstore_rom, which works well on allwinner(sunxi) platform.
> On patch 2:
> A sample for pstore_rom, using general ram rather than block device.
>
> liaoweixiong (4):
>   pstore/blk: new support logger for block devices
>   pstore/blk: add sample for pstore_blk
>   pstore/blk: support pmsg for pstore block
>   Documentation: pstore/blk: create document for pstore_blk
>
>  Documentation/admin-guide/pstore-block.rst |  226 ++++++
>  MAINTAINERS                                |    1 +
>  fs/pstore/Kconfig                          |   20 +
>  fs/pstore/Makefile                         |    5 +
>  fs/pstore/blkbuf.c                         |   46 ++
>  fs/pstore/blkzone.c                        | 1168 ++++++++++++++++++++++++++++
>  include/linux/pstore_blk.h                 |   62 ++
>  7 files changed, 1528 insertions(+)
>  create mode 100644 Documentation/admin-guide/pstore-block.rst
>  create mode 100644 fs/pstore/blkbuf.c
>  create mode 100644 fs/pstore/blkzone.c
>  create mode 100644 include/linux/pstore_blk.h
>
> --
> 1.9.1
>


-- 
Kees Cook

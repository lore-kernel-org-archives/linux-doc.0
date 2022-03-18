Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6644CC433EF
	for <linux-doc@archiver.kernel.org>; Fri, 18 Mar 2022 16:51:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239392AbiCRQxL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Mar 2022 12:53:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239402AbiCRQxL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Mar 2022 12:53:11 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2792E170DAC
        for <linux-doc@vger.kernel.org>; Fri, 18 Mar 2022 09:51:52 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id h13so10958686ede.5
        for <linux-doc@vger.kernel.org>; Fri, 18 Mar 2022 09:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZoPZaaC2NKmWX4pMUWovHOkjyoMteKBE1HWqQdjxHic=;
        b=HeWOIunJl0UAOOBuf3sFMoQ5H0G4YvHE64MUshpGXCqPohbLwWv6CprzWDDtvQZV4a
         gZp/IxMUTTx1ov0X4+Vytt7su/e4jtYsO/D7+kTb9CU6ARrJw3MeR8b7NRqQIiLqbZ+u
         j0aPEH4e2LjldUZc5ZiqUuKcRxGdW0FHrgLL4hB6guAKbnFpXj4HPtEHgcCnG4QCJ52d
         8sGtuj8e3Awdr6ViUqdpWzBCCokYpw3AL06YpXiNcCaFQKGz+GcgpjJZoJ7sHuMpdpCs
         ymr/6dX8jq2mXYwwEaHQ6nDbFH7a9NCUu3d4CU2qQvzNicnQV+J46JfBwgvGB6WAPUvK
         o4RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZoPZaaC2NKmWX4pMUWovHOkjyoMteKBE1HWqQdjxHic=;
        b=Zl1nQpEVwx0ztRV6trphGNB0UAUABSTdBgqMFHvCSEauJFKD8Pn6pvz/Ml7tFsmA+/
         LV1T4ojxwJarFnyX+CnxQPANtSrwVLwWFbtezV8Nx/JA1xwjZM6WhmRQ34O6QjVcTDAi
         lusd1K7YazkbfQXH8HslwDpdXBgZ2qQdwFEi/OudqcB1eVBNIv+TGLKzRmiDvQzyqo/f
         eRGdZSX/dbThRDQagqd9N0MDfPtEG4SR/fK5/EXiOE9fUTO1V0wDTigcYLP5K1BTfD76
         bhNDuPviE+2cms6ZqPs/TI/BmeuhcKedzT0U8Zap/PQ+MZboEKIq67zPLFm5bP39Qau0
         saiQ==
X-Gm-Message-State: AOAM532768hZZxr8Zi2jZNR8gXTG8TrD//OBGr83aC2FQS7ndszYWlWW
        Jlr796lmPAPhLVWby5w7JaVuRdqY0bhX/qSd2sg0bA==
X-Google-Smtp-Source: ABdhPJy1ogHfzAiq8bCYwvn4PC5AAKNI1WF+ewG3yPW/hiP3cfUSSMXviPUH6oLPM47jn5XKjLbfbX9S5ZFPtLR/S0Y=
X-Received: by 2002:a05:6402:289d:b0:419:437:ef4f with SMTP id
 eg29-20020a056402289d00b004190437ef4fmr5976676edb.110.1647622310479; Fri, 18
 Mar 2022 09:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220315172221.9522-1-bgeffon@google.com> <YjS2SJU7VE1bGb/F@google.com>
In-Reply-To: <YjS2SJU7VE1bGb/F@google.com>
From:   Brian Geffon <bgeffon@google.com>
Date:   Fri, 18 Mar 2022 12:51:14 -0400
Message-ID: <CADyq12wQ=vGaGoqt5RXJ5aYM1tQJ2BCT8cav-ONpPrCc85q-5Q@mail.gmail.com>
Subject: Re: [PATCH] zram: Add a huge_idle writeback mode
To:     Minchan Kim <minchan@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Nitin Gupta <ngupta@vflare.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
        linux-block@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 18, 2022 at 12:41 PM Minchan Kim <minchan@kernel.org> wrote:
>
> On Tue, Mar 15, 2022 at 10:22:21AM -0700, Brian Geffon wrote:
> > Today it's only possible to write back as a page, idle, or huge.
> > A user might want to writeback pages which are huge and idle first
> > as these idle pages do not require decompression and make a good
> > first pass for writeback.
>
> Hi Brian,
>
> I am not sure how much the decompression overhead matter for idle pages
> writeback since it's already *very slow* path in zram but I agree that
> it would be a good first pass since the memory saving for huge writing
> would be cost efficient.
>
> Just out of curiosity. Do you have real usecase?

Hi Minchan,
Thank you for taking a look. When we are thinking about writeback
we're trying to be very sensitive to our devices storage endurance,
for this reason we will have a fairly conservative writeback limit.
Given that, we want to make sure we're maximizing what lands on disk
while still minimizing the refault time. We could take the approach
where we always writeback huge pages but then we may result in very
quick refaults which would be a huge waste of time. So idle writeback
is a must for us and being able to writeback the pages which have
maximum value (huge) would be very useful.

Brian




>
> >
> > Signed-off-by: Brian Geffon <bgeffon@google.com>
> > ---
> >  Documentation/admin-guide/blockdev/zram.rst |  6 ++++++
> >  drivers/block/zram/zram_drv.c               | 10 ++++++----
> >  2 files changed, 12 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/admin-guide/blockdev/zram.rst b/Documentation/admin-guide/blockdev/zram.rst
> > index 3e11926a4df9..af1123bfaf92 100644
> > --- a/Documentation/admin-guide/blockdev/zram.rst
> > +++ b/Documentation/admin-guide/blockdev/zram.rst
> > @@ -343,6 +343,12 @@ Admin can request writeback of those idle pages at right timing via::
> >
> >  With the command, zram writeback idle pages from memory to the storage.
> >
> > +Additionally, if a user choose to writeback only huge and idle pages
> > +this can be accomplished with::
> > +
> > +        echo huge_idle > /sys/block/zramX/writeback
> > +
> > +
> >  If admin want to write a specific page in zram device to backing device,
> >  they could write a page index into the interface.
> >
> > diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
> > index cb253d80d72b..f196902ae554 100644
> > --- a/drivers/block/zram/zram_drv.c
> > +++ b/drivers/block/zram/zram_drv.c
> > @@ -643,8 +643,8 @@ static int read_from_bdev_async(struct zram *zram, struct bio_vec *bvec,
> >  #define PAGE_WB_SIG "page_index="
> >
> >  #define PAGE_WRITEBACK 0
> > -#define HUGE_WRITEBACK 1
> > -#define IDLE_WRITEBACK 2
> > +#define HUGE_WRITEBACK (1<<0)
> > +#define IDLE_WRITEBACK (1<<1)
> >
> >
> >  static ssize_t writeback_store(struct device *dev,
> > @@ -664,6 +664,8 @@ static ssize_t writeback_store(struct device *dev,
> >               mode = IDLE_WRITEBACK;
> >       else if (sysfs_streq(buf, "huge"))
> >               mode = HUGE_WRITEBACK;
> > +     else if (sysfs_streq(buf, "huge_idle"))
> > +             mode = IDLE_WRITEBACK | HUGE_WRITEBACK;
> >       else {
> >               if (strncmp(buf, PAGE_WB_SIG, sizeof(PAGE_WB_SIG) - 1))
> >                       return -EINVAL;
> > @@ -725,10 +727,10 @@ static ssize_t writeback_store(struct device *dev,
> >                               zram_test_flag(zram, index, ZRAM_UNDER_WB))
> >                       goto next;
> >
> > -             if (mode == IDLE_WRITEBACK &&
> > +             if (mode & IDLE_WRITEBACK &&
> >                         !zram_test_flag(zram, index, ZRAM_IDLE))
> >                       goto next;
> > -             if (mode == HUGE_WRITEBACK &&
> > +             if (mode & HUGE_WRITEBACK &&
> >                         !zram_test_flag(zram, index, ZRAM_HUGE))
> >                       goto next;
> >               /*
> > --
> > 2.35.1.723.g4982287a31-goog
> >

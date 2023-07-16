Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4381DEB64DD
	for <linux-doc@archiver.kernel.org>; Sun, 16 Jul 2023 15:37:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230190AbjGPPhc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 16 Jul 2023 11:37:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230173AbjGPPhb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 16 Jul 2023 11:37:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACDC0E61
        for <linux-doc@vger.kernel.org>; Sun, 16 Jul 2023 08:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689521803;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=SjKpqR/un+xqnmH4u/xs4cWkynkrba3RxsIKpUmzl5A=;
        b=hYTumHRpMw9o3MzNDSwSjjWAmyI/AAbMbCO3SvbJwB0VOxMtGmhLYrCBmXjV+/IDldPgXV
        PwR1EUcSZvjFVDLKNQjzMMfPtPCDmWavIMr+5Rb+fEKJGmCdMHVjBmH/kRTuua9i0G7zZi
        i9BAQNrc7tCcAgrOuyMZP+n+Tp227Qs=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-EXnrcWj5OPuQMjgJZ6rVYg-1; Sun, 16 Jul 2023 11:36:39 -0400
X-MC-Unique: EXnrcWj5OPuQMjgJZ6rVYg-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7679e5ebad2so561706085a.3
        for <linux-doc@vger.kernel.org>; Sun, 16 Jul 2023 08:36:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689521798; x=1692113798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjKpqR/un+xqnmH4u/xs4cWkynkrba3RxsIKpUmzl5A=;
        b=GUHALIjaPBwmu2JS31Dq4TGsf/x6EJ+VQyuGXjxXtkEVTbdFdbWivOTaVWVTqisRLn
         ZD2NBKFeTl5jgLtg5LDp2za7BUbXdJ24gpLfsU+c8/4/HDMNmDSXGc8u3NIW4GPmm68Z
         OcLMnJ/eUlv+OcXeCHBpWDQwnwSAbU5I0cobsh23YCdLK3+DpthbCr2bzZnD6iIKmPpR
         mUFUbXEsyN5ZsRsaxtdSvSkNO6DvOkfw0xCA3scZMcIVq7GKECg2mZaAMk+6DW4qhZUt
         6xfHzrjVJUW1L5quvdFcs/hkFpb3nWX9y9wz0YHZM8b4sZYIUTBPisrqarEBENov97J6
         tdSQ==
X-Gm-Message-State: ABy/qLY7QYiQPz9djx16nGiv8/IZwcHvyIxvJRpP1CUkgoyrfby5EW4Z
        4mfUg5Qi/GYQE4nUA2LA5jC3WQFV5s4RhI5jYRp1jbVf7IZleugTLZrC0KeIGJRRHDzmj4GKmfk
        wrrAyczF+j+iiSINs/QY=
X-Received: by 2002:a05:620a:e1b:b0:767:f130:8f8a with SMTP id y27-20020a05620a0e1b00b00767f1308f8amr11678574qkm.49.1689521798779;
        Sun, 16 Jul 2023 08:36:38 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGf+9RMl8b0IZ7BAM8vVkiIbftoUFL/qQ02Lwshk7jN2Z9DSLREpZmbP00aTzB4D/vKmJjFrA==
X-Received: by 2002:a05:620a:e1b:b0:767:f130:8f8a with SMTP id y27-20020a05620a0e1b00b00767f1308f8amr11678558qkm.49.1689521798519;
        Sun, 16 Jul 2023 08:36:38 -0700 (PDT)
Received: from localhost (pool-68-160-166-30.bstnma.fios.verizon.net. [68.160.166.30])
        by smtp.gmail.com with ESMTPSA id g7-20020ae9e107000000b0075cd80fde9esm5405203qkm.89.2023.07.16.08.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jul 2023 08:36:37 -0700 (PDT)
Date:   Sun, 16 Jul 2023 11:36:36 -0400
From:   Mike Snitzer <snitzer@redhat.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
        Alasdair Kergon <agk@redhat.com>,
        "development, device-mapper" <dm-devel@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        yj.chiang@mediatek.com, Peter Korsgaard <peter@korsgaard.com>,
        Mike Snitzer <snitzer@kernel.org>, stable@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 5.15] dm init: add dm-mod.waitfor to wait for
 asynchronously probed block devices
Message-ID: <CAH6w=aztzhm3Sa-afN2Xk-7mp1BVtTKNXJ=JyXqJvm3wtEnd3Q@mail.gmail.com>
References: <20230713055841.24815-1-mark-pk.tsai@mediatek.com>
 <2023071603-lustily-defraud-2149@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023071603-lustily-defraud-2149@gregkh>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Jul 16, 2023, 11:16 AM Greg KH <gregkh@linuxfoundation.org> wrote:

> On Thu, Jul 13, 2023 at 01:58:37PM +0800, Mark-PK Tsai wrote:
> > From: Peter Korsgaard <peter@korsgaard.com>
> > 
> > Just calling wait_for_device_probe() is not enough to ensure that
> > asynchronously probed block devices are available (E.G. mmc, usb), so
> > add a "dm-mod.waitfor=<device1>[,..,<deviceN>]" parameter to get
> > dm-init to explicitly wait for specific block devices before
> > initializing the tables with logic similar to the rootwait logic that
> > was introduced with commit  cc1ed7542c8c ("init: wait for
> > asynchronously scanned block devices").
> > 
> > E.G. with dm-verity on mmc using:
> > dm-mod.waitfor="PARTLABEL=hash-a,PARTLABEL=root-a"
> > 
> > [    0.671671] device-mapper: init: waiting for all devices to be 
> available before creating mapped devices
> > [    0.671679] device-mapper: init: waiting for device PARTLABEL=hash-a 
> ...
> > [    0.710695] mmc0: new HS200 MMC card at address 0001
> > [    0.711158] mmcblk0: mmc0:0001 004GA0 3.69 GiB
> > [    0.715954] mmcblk0boot0: mmc0:0001 004GA0 partition 1 2.00 MiB
> > [    0.722085] mmcblk0boot1: mmc0:0001 004GA0 partition 2 2.00 MiB
> > [    0.728093] mmcblk0rpmb: mmc0:0001 004GA0 partition 3 512 KiB, 
> chardev (249:0)
> > [    0.738274]  mmcblk0: p1 p2 p3 p4 p5 p6 p7
> > [    0.751282] device-mapper: init: waiting for device PARTLABEL=root-a 
> ...
> > [    0.751306] device-mapper: init: all devices available
> > [    0.751683] device-mapper: verity: sha256 using implementation 
> "sha256-generic"
> > [    0.759344] device-mapper: ioctl: dm-0 (vroot) is ready
> > [    0.766540] VFS: Mounted root (squashfs filesystem) readonly on 
> device 254:0.
> > 
> > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> > Signed-off-by: Mike Snitzer <snitzer@kernel.org>
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > ---
> >  .../admin-guide/device-mapper/dm-init.rst     |  8 +++++++
> >  drivers/md/dm-init.c                          | 22 ++++++++++++++++++-
> >  2 files changed, 29 insertions(+), 1 deletion(-)
>
> What is the git commit id of this change in Linus's tree?
>
> thanks,
>
> greg k-h
>
>

Hey Greg,

This change shouldn't be backported to stable@. It is a feature, if
Mark-PK feels they need it older kernels they need to carry the change
in their own tree. Or at a minimum they need to explain why this
change is warranted in stable@.

But to answer your original question the upstream commit is:

035641b01e72 dm init: add dm-mod.waitfor to wait for asynchronously probed block devices

Thanks,
Mike


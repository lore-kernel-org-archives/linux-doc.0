Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E13F7C4361B
	for <linux-doc@archiver.kernel.org>; Mon,  7 Dec 2020 13:54:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ABD25235E4
	for <linux-doc@archiver.kernel.org>; Mon,  7 Dec 2020 13:54:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbgLGNx6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Dec 2020 08:53:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55144 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726007AbgLGNx4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Dec 2020 08:53:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607349150;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=o2eDRpg2p3nscNNP24Y5Wwi2J4Ejtn5EoY7jP2IsnBU=;
        b=VaC2wPUPfoOtKJOejV2/17oJbE9ONgxYsYyJheiR06SYcI3m1wXMEWYq6z53A1hQfhu+9b
        ADrWDuk4JJwoC37kghqtAakbyQ9fdzX97kmXQeX8NvmYBQd8ePkYAeKhCfymEkTDxxeshP
        Motd9gX8hCBdsXHQSnVwdh9NWu+NxE8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-9T7RpHgEMXm2FNAcT8M0bg-1; Mon, 07 Dec 2020 08:52:28 -0500
X-MC-Unique: 9T7RpHgEMXm2FNAcT8M0bg-1
Received: by mail-wr1-f69.google.com with SMTP id o4so1194249wrw.19
        for <linux-doc@vger.kernel.org>; Mon, 07 Dec 2020 05:52:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=o2eDRpg2p3nscNNP24Y5Wwi2J4Ejtn5EoY7jP2IsnBU=;
        b=sgNACC/EIIgQpYlf2bub5z5tnMY7bFU/4MqNnZcx4psFc8YC/ZeOIEHcIKyDk/zglV
         WqQPSbUf28nX7vC/GhUvbPSiEU45DHYDPCOqghe8LHITND+HpRQZe35QAMsOu01TwUhw
         DecWQRdyIA3HGMcykacJgw+1syy9Cy8GHMnj4xSXmiYozYg5caN2T+i94aXPCVZ1jZ4U
         nUK2tKV456oH7PCak1I8XcfwxhK6EP7wlfdJHUwB+tednQOXoJRoV7jyNXKUxAiPQHQF
         74588Wg6MJNeQWZmcGbmkQO0dxHxU4QtiZ0BOdxeKReq9M+NTrJarzlYdiCK2Ryyvzgw
         aP2w==
X-Gm-Message-State: AOAM530Co+B9E4IZTOuzJOzGbgE1FCaMAjJUSk5l1XB4OPQ6xwrhXuca
        hmvATuxBbJcIBv3OfUMsymBVSa9wLJOBzIJwNBqQet41G7m14CLvrIWOKUiPnmX36vUJUpHUgdx
        D9U/WCXtWyUk71hG2Cgav
X-Received: by 2002:a5d:5689:: with SMTP id f9mr19985947wrv.181.1607349145790;
        Mon, 07 Dec 2020 05:52:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxry8r99XfuZsd9xpT/D3HhTrDgujG2fkSVGb9ILMFpXGDKe10crdm3NpHJ20Ml9kS7Zd7JfA==
X-Received: by 2002:a5d:5689:: with SMTP id f9mr19985923wrv.181.1607349145521;
        Mon, 07 Dec 2020 05:52:25 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
        by smtp.gmail.com with ESMTPSA id h14sm13884316wrx.37.2020.12.07.05.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 05:52:24 -0800 (PST)
Date:   Mon, 7 Dec 2020 08:52:20 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Jason Wang <jasowang@redhat.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-riscv@lists.infradead.org, stefanha@redhat.com,
        msuchanek@suse.de
Subject: Re: [PATCH v2 2/2] drivers: gpio: add virtio-gpio guest driver
Message-ID: <20201206075131-mutt-send-email-mst@kernel.org>
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <8209ce55-a4aa-f256-b9b9-f7eb3cac877b@redhat.com>
 <96aca1e6-2d5a-deb1-2444-88f938c7a9de@metux.net>
 <20201205142218-mutt-send-email-mst@kernel.org>
 <e69569b5-0c45-e072-5de4-81a4acecdae3@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e69569b5-0c45-e072-5de4-81a4acecdae3@metux.net>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Dec 05, 2020 at 09:05:16PM +0100, Enrico Weigelt, metux IT consult wrote:
> On 05.12.20 20:32, Michael S. Tsirkin wrote:
> 
> Hi,
> 
> > It seems a bit of a mess, at this point I'm not entirely sure when
> > should drivers select VIRTIO and when depend on it.
> 
> if VIRTIO just enables something that could be seen as library
> functions, then select should be right, IMHO.
> 
> > The text near it says:
> > 
> > # SPDX-License-Identifier: GPL-2.0-only
> > config VIRTIO
> >         tristate
> 
> oh, wait, doesn't have an menu text, so we can't even explicitly enable
> it (not shown in menu) - only implicitly. Which means that some other
> option must select it, in order to become availe at all, and in order
> to make others depending on it becoming available.
> 
> IMHO, therefore select is the correct approach.
> 
> 
> >         help
> >           This option is selected by any driver which implements the virtio
> >           bus, such as CONFIG_VIRTIO_PCI, CONFIG_VIRTIO_MMIO, CONFIG_RPMSG
> >           or CONFIG_S390_GUEST.
> > 
> > Which seems clear enough and would indicate drivers for devices *behind*
> > the bus should not select VIRTIO and thus presumably should "depend on" it.
> > This is violated in virtio console and virtio fs drivers.
> 
> See above: NAK. because it can't even be enabled directly (by the user).
> If it wasn't meant otherwise, we'd have to add an menu text.


The point is that user enables one of the bindings.
That in turn enables drivers. If we merely select VIRTIO
there's a chance user won't remember to select any bindings
and will be surprised not to see any devices.



> > For console it says:
> > 
> > commit 9f30eb29c514589e16f2999ea070598583d1f6ec
> > Author: Michal Suchanek <msuchanek@suse.de>
> > Date:   Mon Aug 31 18:58:50 2020 +0200
> > 
> >     char: virtio: Select VIRTIO from VIRTIO_CONSOLE.
> >     
> >     Make it possible to have virtio console built-in when
> >     other virtio drivers are modular.
> >     
> >     Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> >     Reviewed-by: Amit Shah <amit@kernel.org>
> >     Link: https://lore.kernel.org/r/20200831165850.26163-1-msuchanek@suse.de
> >     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > 
> > which seems kind of bogus - why do we care about allowing a builtin
> > virtio console driver if the pci virtio bus driver is a module?
> > There won't be any devices on the bus to attach to ...
> 
> When using other transports ?

Any transport selects VIRTIO so if you enable that, you get
VIRTIO and thus it's enough to depend on it.

> In my current project, eg. I'm using mmio - my kernel has pci completely
> disabled.
> 
> > I am inclined to fix console and virtio fs to depend on VIRTIO:
> > select is harder to use correctly ...
> 
> I don't thinkt that would be good - instead everybody should just select
> VIRTIO, never depend on it (maybe depend on VIRTIO_MENU instead)

GPU depends on VIRTIO and on VIRTIO_MENU ... which seems even messier
...

> 
> --mtx
> 
> -- 
> ---
> Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
> werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
> GPG/PGP-Schlüssel zu.
> ---
> Enrico Weigelt, metux IT consult
> Free software and Linux embedded engineering
> info@metux.net -- +49-151-27565287


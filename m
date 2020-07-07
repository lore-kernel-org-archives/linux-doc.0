Return-Path: <SRS0=3gwW=AS=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE988C433E0
	for <linux-doc@archiver.kernel.org>; Tue,  7 Jul 2020 12:41:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B6F920771
	for <linux-doc@archiver.kernel.org>; Tue,  7 Jul 2020 12:41:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ASZqj2SM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727908AbgGGMlh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 7 Jul 2020 08:41:37 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50331 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725944AbgGGMlg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Jul 2020 08:41:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594125695;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xciiD80zP1orEDkuFQaVx94y/jH2lWnyaNnhRi7uAHU=;
        b=ASZqj2SMP6w+W4QYGtBhc6KpmiHqnW0l2BjM1QtKKYvuAG3s/jjv5xGVJ6301QjQpk733T
        ZqKCRn5MLeDU/7ewsySRcNTD0AoNCSIf7vOAcQmJn4SyZQ7EJC7R3pjFZ4+4zGIYd6rs0A
        DTXntuOMg+2UGzH/FQLyb50IhQhGHEk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-xA6spn57MsqW9v1nw-hBMg-1; Tue, 07 Jul 2020 08:41:33 -0400
X-MC-Unique: xA6spn57MsqW9v1nw-hBMg-1
Received: by mail-qk1-f197.google.com with SMTP id 13so13654599qks.11
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2020 05:41:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xciiD80zP1orEDkuFQaVx94y/jH2lWnyaNnhRi7uAHU=;
        b=WxOK+4/7toOaXKh9tmZw2qVcAGrgX17p5DcV9+3Ow0JJW9pvUQ9TTjKyKg1uP6M3PA
         zarE3TsbOSZdHO6xe7Orzx1fmXAkDAm+5A2FDkDuNp/M1NeYgQerbWqXOSiQlTh2+ZPH
         s4vB4p0imfK8qMtt+X3X+/kqM1I30EWV9JPBXQxoitWUIG0pADDXu4BC53lmJwnL2X6d
         m4k6vkW/2As7ZAD62IhI5UJIU4snQtSJpr47U3ZCuApOIFtzf1wC4UF6Gd0IFDmYwXCt
         w40zkuWP2C4SxkcnZVf5gXvv5xTLhPANVc2UUg0+7MVpsR9sSuT46KtCVSJZa9tA6YCI
         d00w==
X-Gm-Message-State: AOAM530NE9Obcd4OLnuSxINXhek9GbPtJbSL70S4tcrFl6/JyhPFNlLQ
        YdH9m2aOlQ3jDiXLm1cjPRSVqtjP6iVGFEONJ36zRBYfHNk4oAZL8OdIPjuBXN88/u6wNd9ZjoE
        6QX1LbYf82WagQNpO7z8PRuoKJ0q43Kia6Plu
X-Received: by 2002:a05:620a:22cc:: with SMTP id o12mr37883663qki.230.1594125693359;
        Tue, 07 Jul 2020 05:41:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyP6smbupZKAwsH82c9IuyMHurFxxfFL3lg3HgS+Yna+vRveJg4MbajXPTdHz1BfmCS75o3pP1vmieESGrBAqY=
X-Received: by 2002:a05:620a:22cc:: with SMTP id o12mr37883645qki.230.1594125693077;
 Tue, 07 Jul 2020 05:41:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200626055936.4441-1-mail@mariuszachmann.de> <20200630021642.GA155878@roeck-us.net>
 <nycvar.YFH.7.76.2007071220210.15962@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2007071220210.15962@cbobk.fhfr.pm>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 7 Jul 2020 14:41:22 +0200
Message-ID: <CAO-hwJJmPNiFm=e82J3Q577n7phm8R32mHe5gu+uHNcgJH6cYw@mail.gmail.com>
Subject: Re: [PATCH v7] hwmon: add Corsair Commander Pro driver
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Marius Zachmann <mail@mariuszachmann.de>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jul 7, 2020 at 12:20 PM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Mon, 29 Jun 2020, Guenter Roeck wrote:
>
> > On Fri, Jun 26, 2020 at 07:59:36AM +0200, Marius Zachmann wrote:
> > > This is v7 of a driver for the Corsair Commander Pro.
> > > It provides sysfs attributes for:
> > > - Reading fan speed
> > > - Reading temp sensors
> > > - Reading voltage values
> > > - Writing pwm and reading last written pwm
> > > - Reading fan and temp connection status
> > >
> > > It is an usb driver, so it needs to be ignored by usbhid.
> > > The Corsair Commander Pro is a fan controller and provides
> > > no means for user interaction.
> > > The two device numbers are there, because there is a slightly
> > > different version of the same device. (Only difference
> > > seem to be in some presets.)
> > >
> > > This is based on the staging/hwmon tree.
> > >
> > > Signed-off-by: Marius Zachmann <mail@mariuszachmann.de>
> >
> > For my reference:
> >
> > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> >
> > Waiting for Ack from HID maintainer.
>
> Acked-by: Jiri Kosina <jkosina@suse.cz>

Sorry I missed this too:

Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

for the HID hunk too.

Cheers,
Benjamin

>
> for the drivers/hid/hid-quirks.c hunk. Thanks,
>
> --
> Jiri Kosina
> SUSE Labs
>


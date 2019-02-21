Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3E93B7D08A
	for <lwn-linux-doc@archive.lwn.net>; Thu, 21 Feb 2019 17:13:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbfBURNw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 21 Feb 2019 12:13:52 -0500
Received: from mail-ua1-f68.google.com ([209.85.222.68]:43381 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbfBURNw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 21 Feb 2019 12:13:52 -0500
Received: by mail-ua1-f68.google.com with SMTP id z11so9931498uaa.10
        for <linux-doc@vger.kernel.org>; Thu, 21 Feb 2019 09:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CUNnN+/ji8nzrv3GmXF8Tl3AdC7Sp5oHC9qFThiiFP4=;
        b=D6IFQ37mn8qUvk22wINGvPB/1t9wJY3C/s/rv3/2f1n8C8bhYTvbna2qn7jAJTwe07
         riJoB4Ynj0z/ek5PIoHch83dUZKNNh8tL602OJHawgvzE4KbhZqGn43A2OCdVYtv+T6t
         ymnwVDQm13dkm0egJBHB1Aeyu9vpby8D451lc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CUNnN+/ji8nzrv3GmXF8Tl3AdC7Sp5oHC9qFThiiFP4=;
        b=Jjx++aYekADkWPCOyTCwHr/KgnsZGsLnub8zlDNkVPPU3ym3t6aUJPI/nDwX0/qH7j
         1MFx00raMGtyZfFUa3mziWl5jbmZ7rEfeWfI9a2a5A4+9YM+nbzD1/UQfZfLQis3rjLv
         CisU2RfLv2Bskz3m1Wsmb90QJGFG3BYvWSJfPHtCe0A6VrXbznRcxIo2FlEMAhizO4xG
         m2qXueqVE606z8/w4LEZDLoQ1wHInjYDWEYA8jPc4QYsHdsIRYPEShtuqzS2bkKsuww9
         qcx8p77izeZrYgRftD+Cvp8zcXPDGJZg35aSab0P7GVeQsFUQah6+inEGm39R6QhZVxf
         4n8g==
X-Gm-Message-State: AHQUAuYFh3eqVj+vy5vNhyfhKFKrhQUHeqeyX7OaYAzzkbeDGBTNCcnM
        AHDmpa+SqVctjEbZaJrXjFFQuA9ffrg=
X-Google-Smtp-Source: AHgI3IbB5zf5QYTwqFVIWTByA/aBN29TVxocEabVdHO5dNaHnpeTrgA/XcuxftO3EffOLWC7TWqQVA==
X-Received: by 2002:a67:efc9:: with SMTP id s9mr17290056vsp.33.1550769229597;
        Thu, 21 Feb 2019 09:13:49 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 67sm4700068vkt.35.2019.02.21.09.13.47
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Feb 2019 09:13:48 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id s15so9934775uap.6
        for <linux-doc@vger.kernel.org>; Thu, 21 Feb 2019 09:13:47 -0800 (PST)
X-Received: by 2002:a67:ec81:: with SMTP id h1mr21265168vsp.188.1550769227265;
 Thu, 21 Feb 2019 09:13:47 -0800 (PST)
MIME-Version: 1.0
References: <20190218181819.20524-1-helen.koike@collabora.com> <20190221155032.GA3155@redhat.com>
In-Reply-To: <20190221155032.GA3155@redhat.com>
From:   Kees Cook <keescook@chromium.org>
Date:   Thu, 21 Feb 2019 09:13:34 -0800
X-Gmail-Original-Message-ID: <CAGXu5jKiEmmpVE0f_9r4Wop8c11skcsgAruGr2UbOiAof8T7DA@mail.gmail.com>
Message-ID: <CAGXu5jKiEmmpVE0f_9r4Wop8c11skcsgAruGr2UbOiAof8T7DA@mail.gmail.com>
Subject: Re: [PATCH v11] dm: add support to directly boot to a mapped device
To:     Mike Snitzer <snitzer@redhat.com>
Cc:     Helen Koike <helen.koike@collabora.com>,
        device-mapper development <dm-devel@redhat.com>,
        Will Drewry <wad@chromium.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        richard -rw- weinberger <richard.weinberger@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>, linux-lvm@redhat.com,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        kernel@collabora.com, Alasdair G Kergon <agk@redhat.com>,
        David Zeuthen <zeuthen@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Feb 21, 2019 at 7:50 AM Mike Snitzer <snitzer@redhat.com> wrote:
>
> On Mon, Feb 18 2019 at  1:18pm -0500,
> Helen Koike <helen.koike@collabora.com> wrote:
>
> > Add a dm-mod.create= kernel module parameter.
> > It allows device-mapper targets to be configured at boot time for use early
> > in the boot process (as the root device or otherwise).
> >
> > Signed-off-by: Will Drewry <wad@chromium.org>
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > [rework to use dm_ioctl calls]
> > Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> > [refactored for upstream]
> > Signed-off-by: Helen Koike <helen.koike@collabora.com>
>
> Can I get confirmation from Will and Kees that this v11 is safe to carry
> their Signed-off-by?  Are you guys "happy" with this patch?

I think those should be "Co-developed-by:" to more correctly capture
the intent. At this point I think Helen is the primary author. Or at
least, Will and I aren't anymore. :)

At first pass, yes, this patch does what's needed for Chrome OS and
Android, but I'll take a closer look shortly (and I've added David who
has looked at this most recently).

Thanks!

-- 
Kees Cook

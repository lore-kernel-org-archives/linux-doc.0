Return-Path: <SRS0=SGxC=AF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8473C433E0
	for <linux-doc@archiver.kernel.org>; Wed, 24 Jun 2020 08:45:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C3F8320B1F
	for <linux-doc@archiver.kernel.org>; Wed, 24 Jun 2020 08:45:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LRTSNdd0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388627AbgFXIpe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 24 Jun 2020 04:45:34 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:59515 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728827AbgFXIpe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 Jun 2020 04:45:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592988332;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=S2b8jLigyZb+R3i3+e/XAVkUga1RYeny5NHhX1UTOHk=;
        b=LRTSNdd0eGyNQc8OGql39YNHshQVGrDoxYrTygDGAJt3PplcowLCYsc72koJALu+t6pKnC
        Fa8LNJsO0S59QgyWZNdKYD4/jaoDmRvcBSzt9yPLFiLEbJ2Df+wV8sEXMcg274aRA9VkXO
        xXuJrfKr4ACjlhlvoi8cq+Y68XXmP/M=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-zbfsY1-OOB-RCadJDSwQnw-1; Wed, 24 Jun 2020 04:45:31 -0400
X-MC-Unique: zbfsY1-OOB-RCadJDSwQnw-1
Received: by mail-qk1-f197.google.com with SMTP id t22so1132885qkg.3
        for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2020 01:45:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S2b8jLigyZb+R3i3+e/XAVkUga1RYeny5NHhX1UTOHk=;
        b=QI1WLLU5OYtk92w1A0RJs1T7QvuxIbs63184o5q/CClrSU3H1B/qLYqmiY/Ux6UaSI
         DG2aCT1EP9EWvTQ9IcbasW/CgSI5EDPyJjhPD+3bgr4vRz423SWt+OWQx7pk8v56wMOV
         b+HxCGGbLpTOQkSopvpNp2RjYNA/LVLVu3TFXP4cbh0Vmpn925tnccxM1ZkWwl6G/42V
         +i70YAw0YHHdUCgoABtYuxj1HU5hzqSstUpDzFLryfh3vms5z8gPW1yQ4lmoIu1WPJSP
         pSHPJ861ZBgtZxtpx4aCM/EmYFNsMsA5/vuCf2zEBnM2CgF655slSkz2gRdV8S3wK9Rw
         az4w==
X-Gm-Message-State: AOAM531E9giIC4MU+LCHHVJfFB93vAeKNblTYp6sedxPnsr4RrS8W/vu
        t5q4k4DxJEOVSF8bMRmUF3gOT2oTPaiWm+5H4cXwLikqZh2LRqhXT8rH4Ctjan6adew+hZMrKe/
        buHzgdCASzDivmCdsTroz6IC3o9urVF9PET+X
X-Received: by 2002:ad4:598f:: with SMTP id ek15mr30211368qvb.196.1592988330634;
        Wed, 24 Jun 2020 01:45:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAHk0i+wHdD9G0k78iapc862XPazRlaJgWStCZlsc5eOWTiAArDIkkFFTWqAuPKUUS2wS+4zC0nEtxoN1lNz8=
X-Received: by 2002:ad4:598f:: with SMTP id ek15mr30211352qvb.196.1592988330427;
 Wed, 24 Jun 2020 01:45:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200624072154.22486-1-mail@mariuszachmann.de> <20200624072154.22486-2-mail@mariuszachmann.de>
In-Reply-To: <20200624072154.22486-2-mail@mariuszachmann.de>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 24 Jun 2020 10:45:19 +0200
Message-ID: <CAO-hwJLo_v5mWaVJHcdf2aaK4yQHfKd8Xk2XTpUa61q_NsTb4g@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] input: add to hid_ignore_list
To:     Marius Zachmann <mail@mariuszachmann.de>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Jiri Kosina <jikos@kernel.org>, linux-hwmon@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Marius,

On Wed, Jun 24, 2020 at 10:16 AM Marius Zachmann <mail@mariuszachmann.de> wrote:
>
> Signed-off-by: Marius Zachmann <mail@mariuszachmann.de>

I wasn't Cc-ed on the cover letter (0/3) if any, but there are a few
things to improve here (not code wise, I haven't reviewed the series,
but on the form).

Every commit needs a commit message. And here, this particular commit
just disables 2 device IDs from HID, which, without explanation seems
like you decided to remove support for 2 keyboards from the kernel. So
please add commit messages explaining *why* you are introducing a new
driver/change in the code.

Then, it would be much better to have a single commit that disables
the HID support and add the hwmon driver in one go. Leave the
synchronisation between the trees to the maintainers, and keep it
simple: you can squash your 3 commits together, so it's one semantic
action. This way, if there is a need to bisect or revert this patch,
we won't have side effects and can revert just one patch. Think also
that if someone needs that to be backported in a stable or a
distribution kernel, it would make everyone's life simpler.

That being said, if you squash the 3 patches and provide a good enough
explanation on the series, from a HID point of view, there should not
be any reasons for us to not give an Ack.

Cheers,
Benjamin

> ---
>  drivers/hid/hid-quirks.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> index ca8b5c261c7c..7b7bc7737c53 100644
> --- a/drivers/hid/hid-quirks.c
> +++ b/drivers/hid/hid-quirks.c
> @@ -699,6 +699,8 @@ static const struct hid_device_id hid_ignore_list[] = {
>         { HID_USB_DEVICE(USB_VENDOR_ID_AXENTIA, USB_DEVICE_ID_AXENTIA_FM_RADIO) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_BERKSHIRE, USB_DEVICE_ID_BERKSHIRE_PCWD) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_CIDC, 0x0103) },
> +       { HID_USB_DEVICE(USB_VENDOR_ID_CORSAIR, 0x0c10) },
> +       { HID_USB_DEVICE(USB_VENDOR_ID_CORSAIR, 0x1d00) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_CYGNAL, USB_DEVICE_ID_CYGNAL_RADIO_SI470X) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_CYGNAL, USB_DEVICE_ID_CYGNAL_RADIO_SI4713) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_CMEDIA, USB_DEVICE_ID_CM109) },
> --
> 2.27.0
>


Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E24FEC3DA6F
	for <linux-doc@archiver.kernel.org>; Thu, 24 Aug 2023 16:31:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234814AbjHXQab (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Aug 2023 12:30:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242649AbjHXQa0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Aug 2023 12:30:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDDB91FEF
        for <linux-doc@vger.kernel.org>; Thu, 24 Aug 2023 09:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692894551;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=FId/o03kp5ceRUUcHeyqpoKLotNrGT+LgsYRCU6THrw=;
        b=Z9P5BNYcekGcpqoyNvDD18oAy+rrVnWa8yuZvxHb8+d8D3SGjrSfh5TkTUg0cCbeyGQ5+p
        Crv4irh9X7N6ix0RQBC5F/zaWLS0x7G3J9SOM/hmuVTj+llrQXeZg15zyil3/0BLmVC0zq
        pebn4LQMOZyy66MjHwYRzS2iTN4QTPs=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-g3MiacEmMHyC70-Wfvaczw-1; Thu, 24 Aug 2023 12:29:09 -0400
X-MC-Unique: g3MiacEmMHyC70-Wfvaczw-1
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-570b2213d06so84856eaf.1
        for <linux-doc@vger.kernel.org>; Thu, 24 Aug 2023 09:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692894549; x=1693499349;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FId/o03kp5ceRUUcHeyqpoKLotNrGT+LgsYRCU6THrw=;
        b=Qq0VuXWFDeiRh30W7sii+lQnVa32Oq8XDuenhfQ9jxpJr7fIhR6VSlIiaQKgQAj0eP
         QPTDZ2WogtZ3Lxkp7lMrhMzAl5u/01dccu38VNFG504p0WAg/2VKhXt6V6DdgK/jMclh
         D6yDy/yIrswiV7ny9RArmNSzLowwQbn4uI9mwgsYzkPmbA3qhwUewJtGcExZW9OUQbqP
         R1nwge2Det75LQRGilFgIoovPiq7/+GnkqsYOBpHm1s+oQy2fkz9R3DKjJGw1BVTM2M0
         jNZp3m4Tq/YHIMyiQF8wJ9YeNIV8t/G15IjkyvDIcih0+eS5fIy2yh6QP1cjTBPrU+5i
         4ENg==
X-Gm-Message-State: AOJu0Yx7tlS0LVaS3o++HN/Cf0KlH6iO9nCC1Wtyl0ruSflCyRiAE2Xv
        uL/cIeq2SlEnGyltwciCFH+vNEEjyRo6GR8NpKcpKmiPw4kfTnrFeGMaJD+BPJyVgYBPEIS/8Ok
        q+g4xhUouOucLG/VS+5eSQECZTViTfNdBgf2i
X-Received: by 2002:a4a:6c1d:0:b0:570:c8fa:4ad7 with SMTP id q29-20020a4a6c1d000000b00570c8fa4ad7mr2883825ooc.1.1692894548886;
        Thu, 24 Aug 2023 09:29:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWML3K7JRuTt+1isEsxFMtWBfyFz2RoBGN46xT5QwiFYMJm1CJNWGpIqgScuqVaJqC33t2mExZukC3kr7roOc=
X-Received: by 2002:a4a:6c1d:0:b0:570:c8fa:4ad7 with SMTP id
 q29-20020a4a6c1d000000b00570c8fa4ad7mr2883810ooc.1.1692894548603; Thu, 24 Aug
 2023 09:29:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230725135537.2534212-1-costa.shul@redhat.com>
 <CADDUTFx_o+kULEMbZWAECBKb4Fo85c303YiCUmgk50Z=7TSkkw@mail.gmail.com> <87il94tpxw.fsf@meer.lwn.net>
In-Reply-To: <87il94tpxw.fsf@meer.lwn.net>
From:   Costa Shulyupin <costa.shul@redhat.com>
Date:   Thu, 24 Aug 2023 19:28:57 +0300
Message-ID: <CADDUTFw1V3V8q7d_6m3H__Z40sJmnNkf_4niAd+dXtjttkZX6g@mail.gmail.com>
Subject: Re: [PATCH] docs: consolidate embedded interfaces
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> I thought I was clear...I still don't see how this organization makes
> sense.
The last time you wrote was about the section "peripheral interfaces".
This is the first time I've submitted "embedded interfaces". You
haven't yet reviewed it.

>What is "embedded" about misc devices?
I've reviewed https://docs.kernel.org/misc-devices/ and found
that the most of described drivers are drivers for embedded devices:
- Digital Potentiometers
- combined ambient light and proximity sensor
- I2C EEPROM
- C2 Interface used for in-system programming of micro controllers
- accelerometer
- EEPROM-programmable power-supply
- 950 serial port devices
- Power Management IC
- Xilinx Soft-Decision Forward Error Correction block

Thanks,
Costa

>
> Thanks,
>
> jon
>
> > On Tue, 25 Jul 2023 at 16:56, Costa Shulyupin <costa.shul@redhat.com> wrote:
> >
> >  to make page Subsystems APIs more organized as requested
> >
> >  Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
> >  ---
> >   Documentation/subsystem-apis.rst | 21 ++++++++++++++-------
> >   1 file changed, 14 insertions(+), 7 deletions(-)
> >
> >  diff --git a/Documentation/subsystem-apis.rst b/Documentation/subsystem-apis.rst
> >  index 90a0535a932a..7453586114d4 100644
> >  --- a/Documentation/subsystem-apis.rst
> >  +++ b/Documentation/subsystem-apis.rst
> >  @@ -60,20 +60,28 @@ Storage interfaces
> >      scsi/index
> >      target/index
> >
> >  -**Fixme**: much more organizational work is needed here.
> >  +Embedded interfaces
> >  +-------------------
> >  +
> >  +.. toctree::
> >  +   :maxdepth: 1
> >  +
> >  +   iio/index
> >  +   spi/index
> >  +   i2c/index
> >  +   fpga/index
> >  +   w1/index
> >  +   misc-devices/index
> >  +
> >  +**Fixme**: some organizational work is still needed here.
> >
> >   .. toctree::
> >      :maxdepth: 1
> >
> >      accounting/index
> >      cpu-freq/index
> >  -   fpga/index
> >  -   i2c/index
> >  -   iio/index
> >      leds/index
> >      pcmcia/index
> >  -   spi/index
> >  -   w1/index
> >      watchdog/index
> >      virt/index
> >      hwmon/index
> >  @@ -83,6 +91,5 @@ Storage interfaces
> >      bpf/index
> >      usb/index
> >      PCI/index
> >  -   misc-devices/index
> >      peci/index
> >      wmi/index
> >  --
> >  2.41.0
>


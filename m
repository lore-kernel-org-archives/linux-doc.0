Return-Path: <SRS0=2xrs=7R=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62422C433E0
	for <linux-doc@archiver.kernel.org>; Thu,  4 Jun 2020 06:37:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 37A562074B
	for <linux-doc@archiver.kernel.org>; Thu,  4 Jun 2020 06:37:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B5Qr6T4g"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726248AbgFDGhd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 Jun 2020 02:37:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726104AbgFDGhd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Jun 2020 02:37:33 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C28F5C05BD1E
        for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2020 23:37:32 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id x22so2871644lfd.4
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2020 23:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JF6vGkjPu6tGR+2OADg3G9dJrQZgwlRE6N7uk3/c73c=;
        b=B5Qr6T4g0IW9cB0HK8Emm/n5F4+eHb905Avti/2XM4JXgOgVPSgu1U1WiPl7vTAXwC
         q1Gf8Z46hfUasR+d6cd+IW9NS1tQdCYb72hZbTTgc4ulmnwsmi18hAbgywg9V7kekbZN
         mU5S9dBPyUXh4VYxZ/kb6EuJPrSIPPgQdunTiBDPloVidjO5yeawd8Tbukfw3wS9A/qU
         LEhwd6P4l+GP2bVcUKTf08aImwA463VKFZxBMdyzwYDrtM/qKDosdo+VgwrFqDQH9gSS
         LH26sE1WgLPI6HaFekPj3iV5oFHdcNWA3EWh/jSsd18GWkG2Mk1ElCDMsd3dZ6hlj2Mt
         FCDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JF6vGkjPu6tGR+2OADg3G9dJrQZgwlRE6N7uk3/c73c=;
        b=We8ztwh6EmB1Eh03tw879hX47u4xFvZvn6+nX5Al5S9lLMSACL0UbuCtsMk9AhZYdO
         J9wzEz8h0uHuYb0R1rzOHgqMH2OEVvvIik22wNFAtMa3BTbmDNl620vmOMPS1tjO6YNG
         DmyyE4Vy7DrVMv8JU/3YB8/SFjAu81v0C/ljg7F1BOF8gPeCADAzhk2294VjFopPNdmM
         qaZcJ8VA+XoTAMOI2h0R9cAvjSjkhFI9P/zbjD6TInVAhBT2tILU92uI1g2EL1w4A88P
         8y90s4FdpqZzn0QvTrPXJXM3ZFz9Dwk6qRewW7NrwcGIUtKV5ucH0PkSFx6A7E5vlZtH
         1DgQ==
X-Gm-Message-State: AOAM531uVWgnX96T+LL5jRVxdQYcFMAenpZYLOZh0U2wAhq1Bt/BtXbx
        GsmanK0CPdKDUZYGpJuHSG5WEPcO5mpsm+4oc+aYsQ==
X-Google-Smtp-Source: ABdhPJxzZug4yZBvmMHxNDR9NF9ca/j7Fd+HWqEAhKcwM7QbkBoQEDIBv7kiKQ+Iv2oaj3sESCLuAX8wA4juEgJP9hA=
X-Received: by 2002:a19:434e:: with SMTP id m14mr1687549lfj.40.1591252651152;
 Wed, 03 Jun 2020 23:37:31 -0700 (PDT)
MIME-Version: 1.0
References: <1591183888-11101-1-git-send-email-sumit.garg@linaro.org> <CAD8XO3Z-JvCYxqbbeGRmjc-KskpykrcfWEGKH9eO6mvG7zHc6Q@mail.gmail.com>
In-Reply-To: <CAD8XO3Z-JvCYxqbbeGRmjc-KskpykrcfWEGKH9eO6mvG7zHc6Q@mail.gmail.com>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Thu, 4 Jun 2020 12:07:19 +0530
Message-ID: <CAFA6WYNm+5NGODemHKxQXSNk4m+0P60kr=btTwp9q-6d_6-QPw@mail.gmail.com>
Subject: Re: [PATCH] Documentation: tee: Document TEE kernel interface
To:     Maxim Uvarov <maxim.uvarov@linaro.org>
Cc:     Jens Wiklander <jens.wiklander@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        "tee-dev @ lists . linaro . org" <tee-dev@lists.linaro.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        op-tee@lists.trustedfirmware.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 3 Jun 2020 at 20:05, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
>
> Hello Sumit,
>
> if this doc is for driver developers it might be useful to add some
> code examples how to register drivers on tee bus.

Sure, will add an example TEE client driver snippet for reference.

-Sumit

>
> Best regards,
> Maxim.
>
> On Wed, 3 Jun 2020 at 14:31, Sumit Garg <sumit.garg@linaro.org> wrote:
> >
> > Update documentation with TEE bus infrastructure which provides an
> > interface for kernel client drivers to communicate with corresponding
> > Trusted Application.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  Documentation/tee.txt | 30 ++++++++++++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> >
> > diff --git a/Documentation/tee.txt b/Documentation/tee.txt
> > index c8fad81..428d3b5 100644
> > --- a/Documentation/tee.txt
> > +++ b/Documentation/tee.txt
> > @@ -53,6 +53,28 @@ clients, forward them to the TEE and send back the results. In the case of
> >  supplicants the communication goes in the other direction, the TEE sends
> >  requests to the supplicant which then sends back the result.
> >
> > +The TEE kernel interface
> > +========================
> > +
> > +Kernel provides a TEE bus infrastructure where a Trusted Application is
> > +represented as a device identified via Universally Unique Identifier (UUID) and
> > +client drivers register a table of supported device UUIDs.
> > +
> > +TEE bus infrastructure registers following APIs:
> > +-  match(): iterates over the client driver UUID table to find a corresponding
> > +   match for device UUID. If a match is found, then this particular device is
> > +   probed via corresponding probe API registered by the client driver. This
> > +   process happens whenever a device or a client driver is registered with TEE
> > +   bus.
> > +-  uevent(): notifies user-space (udev) whenever a new device is registered on
> > +   TEE bus for auto-loading of modularized client drivers.
> > +
> > +TEE bus device enumeration is specific to underlying TEE implementation, so it
> > +is left open for TEE drivers to provide corresponding implementation.
> > +
> > +Then TEE client driver can talk to a matched Trusted Application using APIs
> > +listed in include/linux/tee_drv.h.
> > +
> >  OP-TEE driver
> >  =============
> >
> > @@ -112,6 +134,14 @@ kernel are handled by the kernel driver. Other RPC messages will be forwarded to
> >  tee-supplicant without further involvement of the driver, except switching
> >  shared memory buffer representation.
> >
> > +OP-TEE device enumeration
> > +-------------------------
> > +
> > +OP-TEE provides a pseudo Trusted Application: drivers/tee/optee/device.c in
> > +order to support device enumeration. In other words, OP-TEE driver invokes this
> > +application to retrieve a list of Trusted Applications which can be registered
> > +as devices on the TEE bus.
> > +
> >  AMD-TEE driver
> >  ==============
> >
> > --
> > 2.7.4
> >

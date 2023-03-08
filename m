Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24FCCC678D5
	for <linux-doc@archiver.kernel.org>; Wed,  8 Mar 2023 17:35:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbjCHRfd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 8 Mar 2023 12:35:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbjCHRfc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Mar 2023 12:35:32 -0500
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64D9160D57
        for <linux-doc@vger.kernel.org>; Wed,  8 Mar 2023 09:35:29 -0800 (PST)
Received: by mail-il1-x129.google.com with SMTP id x10so10799477ill.12
        for <linux-doc@vger.kernel.org>; Wed, 08 Mar 2023 09:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678296928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FSyUj9sOQAg1bto5phGO0kdMN7B410cjZoU9zGMstis=;
        b=jq3SyMYYuTIgvU+sGELF+gqjQAmnVWzWaFRFgf7Hx3xedzgG2D4EFUTGJm5qp3TVfK
         b4WD7CWaoOYbABuXo7RXPIcyYdX4SIZXGycuDjyR0FkPNuaxgIoJr/WqvV34oMLNj3FI
         f6bIdf8HzZRTzOzXyQe+Rr/bi3bF0guyfDJU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678296928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FSyUj9sOQAg1bto5phGO0kdMN7B410cjZoU9zGMstis=;
        b=CvD7m3x6ADa0CoieZvQ4yuCQBUttQzH2Rui5fqpjKZXmZ1np55DrABc8T05T0LmLAT
         3Q/FhMADZEwXzz0Qpjw87Jn/kZwv1B9maSysyP8okLm3S+vDUoz/QQLnmOz35++dHg3G
         IFjG6XKFItWNHSRJYAYWBJ3PjjIpa/8IYOB+dtc6xnMs2oyv45Wa2QxPZOXjuKnleCay
         cG+PY80oq6xiSX/C1S+w6WCld/bi5s+7/tNC4+zUlWomnpu38IUmfX2glVN4/RKKy7Zl
         kZ6ioAZs4yNkRPE0FfHFn2PR2FdDHA+npif0Vm1Gk5493+0zsYC+z0o55afH26lSjmSD
         hpRg==
X-Gm-Message-State: AO0yUKVh/kxWgvKgFdFhre0AW0An6ihViGoUm1PyaaDsqRZq8nvLvSl1
        uxUq9IPTVtA3kz5uwl1332emnYX2u/qD6U7b3vw=
X-Google-Smtp-Source: AK7set/nmwddJoOW0+g+95avHvZw0n5vuU/gp5YYbF8MuroQ2VY7dvhCCnNj/c6YyUAEN8b4sJtlvQ==
X-Received: by 2002:a05:6e02:12e3:b0:313:e73b:d3dd with SMTP id l3-20020a056e0212e300b00313e73bd3ddmr12751314iln.13.1678296928262;
        Wed, 08 Mar 2023 09:35:28 -0800 (PST)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com. [209.85.166.172])
        by smtp.gmail.com with ESMTPSA id g2-20020a92c7c2000000b00313d32f8345sm4705767ilk.66.2023.03.08.09.35.27
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 09:35:27 -0800 (PST)
Received: by mail-il1-f172.google.com with SMTP id y9so9795851ill.3
        for <linux-doc@vger.kernel.org>; Wed, 08 Mar 2023 09:35:27 -0800 (PST)
X-Received: by 2002:a05:6e02:ca6:b0:315:4c21:a377 with SMTP id
 6-20020a056e020ca600b003154c21a377mr9109185ilg.6.1678296927307; Wed, 08 Mar
 2023 09:35:27 -0800 (PST)
MIME-Version: 1.0
References: <20230224070506.4157738-1-saravanak@google.com>
 <20230224070506.4157738-3-saravanak@google.com> <CAD=FV=WaWmHDX0FVH1KO7b_QDM9xxt86q60MGOtPVVvGZJ+t7A@mail.gmail.com>
 <CAGETcx_2f4atf-bpvj3o5FVcWrsbJRuY_Kwu5_NU6ESbNM8MFQ@mail.gmail.com>
In-Reply-To: <CAGETcx_2f4atf-bpvj3o5FVcWrsbJRuY_Kwu5_NU6ESbNM8MFQ@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 8 Mar 2023 09:35:14 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Uv0JZDZ4adVkXN=Wkkv+N2EXnBsREx-bHyeeefYc4s6A@mail.gmail.com>
Message-ID: <CAD=FV=Uv0JZDZ4adVkXN=Wkkv+N2EXnBsREx-bHyeeefYc4s6A@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] driver core: Make state_synced device attribute writeable
To:     Saravana Kannan <saravanak@google.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>, kernel-team@android.com,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Fri, Mar 3, 2023 at 4:53=E2=80=AFPM Saravana Kannan <saravanak@google.co=
m> wrote:
>
> > > --- a/drivers/base/base.h
> > > +++ b/drivers/base/base.h
> > > @@ -164,6 +164,14 @@ static inline int driver_match_device(struct dev=
ice_driver *drv,
> > >         return drv->bus->match ? drv->bus->match(dev, drv) : 1;
> > >  }
> > >
> > > +static inline void dev_sync_state(struct device *dev)
> >
> > IMO don't force inline. The compiler is probably smarter than you. I
> > could even believe that it might be more optimal for this rarely
> > called function to be _not_ inline if it kept the kernel smaller. I
> > guess that means moving it out of the header...
>
> I'm following the style of every other function in the .h file.

Right, that's why I suggested moving it out of the .h file. I see
plenty of non-inline function definitions in the header file.

-Doug

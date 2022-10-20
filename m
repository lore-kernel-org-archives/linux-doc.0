Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 484E9C4332F
	for <linux-doc@archiver.kernel.org>; Thu, 20 Oct 2022 19:02:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbiJTTCk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Oct 2022 15:02:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbiJTTCj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Oct 2022 15:02:39 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FDEB1989B9
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 12:02:38 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id c23so222744qtw.8
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 12:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MFeXXJ6sQN07sTc4bebyU3JZBZRL/EnosXd0tePVziU=;
        b=S+ykdCtQJzepC6nF6XQ9cWi9wozt6rHNW8TF745ZRDRMGmrCLxN6mNJ257A4cDROqm
         vIN/BvtQoMRHA5S5izciwsVOaYJGaOqhhHjuIa76O+wy1vUajyldp0BLTtyRuEQvAFjq
         Lphr9W8gywol8GahXC/v4krENPSshlJQANyMIX5MGgbxSD07Fii8kfFTB8vvoJm5OmLF
         nDA03H8McLFeK6f1T7Z8Xf3k7/YH1333cDeLlvqllaTS0/ZicDv3mjdSXz0JCV3S0yYV
         x44kDiXhkAjplA7zc0gBthSE7gM3YP+UDYzPOAiqTIYjM6hKOg6feaiQRMS3I6MmdkLJ
         fnkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MFeXXJ6sQN07sTc4bebyU3JZBZRL/EnosXd0tePVziU=;
        b=6/wrtrnkzh6cHDEqEour+/II+za3O6ytITX3DFYdS8g57EZkT9c2JBoF3REQP0BWkL
         au/c+iUzr6bG5+Zmew+Umb2kTuOyTKrIU2Ji9M0NkB5Q4axTpr73wKjr7zF45CX0L1Kv
         2hsaYKS2d0mOD2imPqdzDsppYzRKn69B8KfKHr1sXqiC7QD7scG6I+XbAyTSQAWANDPz
         B5DRo4rKOLl2/TldsyE75LyVoqwowWi3HwmrNAsMR2GXsfYd1r2YOj40Yc4CJOKugVqW
         y+Oivulc/YexKBVS3plAy29w/f/Qmt5MVXwcQSlEJ0PA4awrT5uZXiWvuKLm3SZk5Iqx
         PUbA==
X-Gm-Message-State: ACrzQf0sUuFggdy3mknyy0aCR+lk+DjrKsEGP7ST8CretUW9L+Zo1sdH
        8LPC4IWAYbvCIf+tGV4lA9VtpVp6OqZi2MjEoPOII0v/ZU8=
X-Google-Smtp-Source: AMsMyM6y+AJHCvbv0IPJE0/Hh7sdQmuBvukUOwm985kFRDmvZONoLPfVA6+KkteJ3sbJ70oQ4Yrxq/7n/IUkfy7Nsbo=
X-Received: by 2002:a05:620a:2552:b0:6ca:bf8f:4d27 with SMTP id
 s18-20020a05620a255200b006cabf8f4d27mr10453489qko.383.1666292546472; Thu, 20
 Oct 2022 12:02:26 -0700 (PDT)
MIME-Version: 1.0
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
 <20221020175334.1820519-5-maciej.kwapulinski@linux.intel.com> <CAHp75VeFDYjmoJzbC5z8Kf=xYxsVASxjwGBB3OPvBMMPsQDjtw@mail.gmail.com>
In-Reply-To: <CAHp75VeFDYjmoJzbC5z8Kf=xYxsVASxjwGBB3OPvBMMPsQDjtw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 20 Oct 2022 22:01:50 +0300
Message-ID: <CAHp75VcWnZSxgyA0dYGGbwyMYOv1-Zyy_f63_z2yT3ZS8W+MEg@mail.gmail.com>
Subject: Re: [PATCH v5 04/10] gna: initialize MMU
To:     Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Olof Johansson <olof@lixom.net>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Tomasz Jankowski <tomasz1.jankowski@intel.com>,
        Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
        Jianxun Zhang <jianxun.zhang@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 20, 2022 at 10:00 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Oct 20, 2022 at 8:57 PM Maciej Kwapulinski
> <maciej.kwapulinski@linux.intel.com> wrote:

...

> > +       desc_size = round_up(gna_priv->info.desc_info.desc_size, PAGE_SIZE);
>
> PFN_UP() ?

Or PFN_ALIGN() ?

-- 
With Best Regards,
Andy Shevchenko

Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B789C433FE
	for <linux-doc@archiver.kernel.org>; Thu, 20 Oct 2022 19:07:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbiJTTHM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Oct 2022 15:07:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbiJTTHL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Oct 2022 15:07:11 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 217821C73C1
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 12:07:11 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id t16so316944qvm.9
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 12:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n88/Z7epJ6toETOQg3utDf/EXJ58Cna77R79FUONCHI=;
        b=CHEqIGHM5CQcAheUFK49ZRTcbzqWojHYG7L4eaLNmE1jcbu//0fq5P9k9VMBj99R+c
         skjsuIsnGcV2ytJ/I4yY7ASCjMwaz6lW+rYPgRWdAG+enHx3Z8cuGVJFwEFFOwviugAH
         RICRZiwKpKybxbu+96NLddWXM3jJpg3gE2WsOs4OGO2SU1CCGCkYY6NinLciMjIa/Gzt
         VXUPeFvFWUXZBT2YBxECwYV3l6f52Gk3BBkkttZpMGALEIpTbiSjgvzcZHusInHo/8id
         Ay6cnDukrDbqLpmSrUcNNsbpNfZao3p7fdz7FHrDARHWu4xRzG9ds34oe5CbnNMPFUB2
         /5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n88/Z7epJ6toETOQg3utDf/EXJ58Cna77R79FUONCHI=;
        b=uN3Vrg3peWq9SI2rcwls4Y5j5CLiB9rl/X8FuXDi3JHPXGGPlKrx9KPcB/ULwkW75m
         SnVL5ZAXai/Lq5YYF5JaJIdvIEfBuhQ43L7/VME5tgWiPmiFy++u62qCRGZe6DWjFS6B
         yIj4ipMwrOMfz34xvGFoafhCK1g6WdknzICtihnBxJ8znTytad593KASKBL+6DoUsfp0
         9djoY+wQxS+QvCJti8JKkCCQ6oy4QcSeuDLeuzTg1GbjlSxFyY8DgI3qU7A+ZChhWyW9
         Kmj6wmBVPUt7+8eIkSbuDoZWzQTsnOitV4jM15aYvyH+z6+56PTMgkiOC1EUfyWbE0T1
         StPQ==
X-Gm-Message-State: ACrzQf3zkRhJcrUiDvvtHGRawzo1pMtWAwsCzyYecqp8Lx0IyaleEkpH
        UbcBW3hU3aAK9SuShDZ+9+XSCfEq6u8pDkycr/A=
X-Google-Smtp-Source: AMsMyM6iodZMIEZRZTfFp3h2doYla41qrFujEl/ExOZ/wZPvTFttLK+91bJY1ZaJnJGd9Afbubo5B0hnQMPw/9KFBdI=
X-Received: by 2002:a0c:e352:0:b0:4ba:16ce:b464 with SMTP id
 a18-20020a0ce352000000b004ba16ceb464mr1455419qvm.11.1666292824363; Thu, 20
 Oct 2022 12:07:04 -0700 (PDT)
MIME-Version: 1.0
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com> <20221020175334.1820519-7-maciej.kwapulinski@linux.intel.com>
In-Reply-To: <20221020175334.1820519-7-maciej.kwapulinski@linux.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 20 Oct 2022 22:06:28 +0300
Message-ID: <CAHp75Vcb-EMD3DC81kw6sMhCYV5fGqWy2gBt5j4fEeHx6bdyvw@mail.gmail.com>
Subject: Re: [PATCH v5 06/10] gna: add GNA_GEM_NEW and GNA_GEM_FREE ioctls
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
        Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 20, 2022 at 8:57 PM Maciej Kwapulinski
<maciej.kwapulinski@linux.intel.com> wrote:
>
> drm_gem_shmem_object is base for memory objects provided by the patch

Here and in some other commit messages don't forget English
punctuation, like trailing period.

...

> +struct gna_gem_object {
> +       struct drm_gem_shmem_object base;
> +
> +       uint32_t handle;

Not u32 or __u32? Is it a subsystem requirement to have uint32_t? Or
your driver, then why are you not using similar types elsewhere?

> +};

-- 
With Best Regards,
Andy Shevchenko

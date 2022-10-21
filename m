Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E276C433FE
	for <linux-doc@archiver.kernel.org>; Fri, 21 Oct 2022 09:37:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230108AbiJUJhQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 Oct 2022 05:37:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230041AbiJUJhP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Oct 2022 05:37:15 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A158213479
        for <linux-doc@vger.kernel.org>; Fri, 21 Oct 2022 02:37:14 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id r14so3609717edc.7
        for <linux-doc@vger.kernel.org>; Fri, 21 Oct 2022 02:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uLumIEzZqB5oHuTgF20N392OS8of4fBsMhHlXcUS9cM=;
        b=MmBfkn9VzdF4CTVqMrgJ6N0xQAWkyWJyeAT4ER2yAbsLNDkuGnh+bkMBYYEHr9ZDJu
         Qts17gcOwV6nSgKFqANSFy/zy4SntBBunPkeDiZWoPB73JVi0fMsACaia79t9MepfIVx
         BLto/61SayjfsIGFDlq8e1jv/YbTshh31AD4NbON+AOVkLzX3Kbi0AedzBwQy1cIftXU
         54JeAtIJKUDZk2GNqv5RhDcCTS07w8LAgWfJeGtqU4u5AV080IxpdnkKOXpgiZJ2Qqek
         RufnMR7QIHkK6dXKO/I/Zi6VZC4jHBurKfHvhmiF0nqn1LxsrgzeG0NlNsK+/QVDF589
         XuGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uLumIEzZqB5oHuTgF20N392OS8of4fBsMhHlXcUS9cM=;
        b=NOpEC1n/06r3KWFLNeaPdElDpurw8SDU9vmrVl88lso40yOx6vBI+R3hTvEXaoO7Bi
         BqClPTHDmLA0rPaD0xvFXj7KFWpUGMm8ydT88qZQTzP2l11YnGPL1e6/rnAVLz7r/MPk
         zzR2SiHIdQf/u7hLzL8weY5XREv3UM5r0ql0p7tnpwxQMQEIbz3TbRoS7kw23xYvvz5u
         ksmSi1Ky22FsX+5FKC5057tUUVS0/CnGlfIda0ByTYQGv3SdhXUPVA7rGKoGI4PfPjlo
         +cRbq3nb5UMIl3RORa5TlX380dxe7oMfvtxScpvZTOvNtU0XDNHQbjzH1AxVcDV8eRY/
         5Obw==
X-Gm-Message-State: ACrzQf0NgtTqxn/saDTydNXShHrr1Lk6td1MSCYN0bjOOJbXjEXSJneZ
        zVih9okbeS8Z6ISNYPsnkeqfTQTrkkDzwbNiBaxMXw==
X-Google-Smtp-Source: AMsMyM57kKVITQPsQ/QZcAW3mwKmSY3ZENjz8oy8gvrS0ka6DR5S4eLYMtb15By3csnvUwLFICxj5CXRPOqXLXgQEmQ=
X-Received: by 2002:a17:907:1624:b0:78d:d61c:2b4a with SMTP id
 hb36-20020a170907162400b0078dd61c2b4amr14435147ejc.208.1666345033067; Fri, 21
 Oct 2022 02:37:13 -0700 (PDT)
MIME-Version: 1.0
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com> <20221020175334.1820519-10-maciej.kwapulinski@linux.intel.com>
In-Reply-To: <20221020175334.1820519-10-maciej.kwapulinski@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Oct 2022 11:37:02 +0200
Message-ID: <CACRpkdbWx=oSudfL6cFLj0_XyN3UPfC_2SGs6WC_n4zF6eiVrg@mail.gmail.com>
Subject: Re: [PATCH v5 09/10] gna: add power management
To:     Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Olof Johansson <olof@lixom.net>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
        Tomasz Jankowski <tomasz1.jankowski@intel.com>,
        Jianxun Zhang <jianxun.zhang@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 20, 2022 at 7:57 PM Maciej Kwapulinski
<maciej.kwapulinski@linux.intel.com> wrote:

> Implement power management in GNA driver
>
> Signed-off-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
> Tested-by: Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>
> Co-developed-by: Tomasz Jankowski <tomasz1.jankowski@intel.com>
> Signed-off-by: Tomasz Jankowski <tomasz1.jankowski@intel.com>
> Co-developed-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
> Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>

You probably want Rafael Wysocki to review this patch so you
get (runtime) PM absolutely right.

Yours,
Linus Walleij

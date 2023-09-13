Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB54CEDEC5A
	for <linux-doc@archiver.kernel.org>; Wed, 13 Sep 2023 14:26:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234306AbjIMO0L (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 13 Sep 2023 10:26:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232025AbjIMO0L (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Sep 2023 10:26:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E3AD692
        for <linux-doc@vger.kernel.org>; Wed, 13 Sep 2023 07:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694615120;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=i1FsUnDJXEh3xrup97UKPyi5G29wmRkoOl4jHD/nSRg=;
        b=GRLeFy6QR8zRIaWKGQsqePXOP/hjLrK2E90YGZ9KKvQSWjFO1OA/d4qTaKRcC9nvGpIC+Q
        2quOvTUhZYTZc1VfH/iuuXVrQw6h1Wt2c+COlf3AHkPTyl+Ps4rFRLHIJ35VefsIF9NKOD
        XfD+MAI8h9wCHnL++RvHoCAjnBb9450=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-398-g2ap1SrAOTarUJ69EoSbtQ-1; Wed, 13 Sep 2023 10:25:17 -0400
X-MC-Unique: g2ap1SrAOTarUJ69EoSbtQ-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3f5df65f9f4so51901005e9.2
        for <linux-doc@vger.kernel.org>; Wed, 13 Sep 2023 07:25:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694615115; x=1695219915;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i1FsUnDJXEh3xrup97UKPyi5G29wmRkoOl4jHD/nSRg=;
        b=lSy5FV+d3zM+NDw9lTxgq8Pwv6xQ0ktc1RxQB3vwhgrfFit7i1NvmTMCu440bA9Su/
         TQGYq3Gz8mUvBGP5ftX13jpvwaESlgiLSW2ovXnfnrsVWOhlBaorv7By2m2+u1EXinBt
         KfF60nJQHuPYMB/SKfCDvqZmtnRwBZ2wIKQ5jgx8Fz3MO1f08dNKif32NC4/hRxhV5Vs
         Tvh+2+HY8gyexX9aTtAJz715PE2v4ZVdXm9YuPJYoGAFAR9T27ogYl6SQgilG1kqUPVt
         PlxOrwxnplBkSxV8Q3UgnPraYsRvsMgf/fpuBj28ankQeorAuGkHY//xHFOaWqO4FvGg
         XBrg==
X-Gm-Message-State: AOJu0YzepIz0h4z4B62ihB9pSNmb7y68kclhYfTp5LqPAhyyPDodKelM
        QYg/yHWjkaKMIgl7dw1F3M1z5SxQPp+pFPzVn4OK8B9QAAn4iUBqywD8jJxOxWSnf3VqwxOikwG
        zTlEYXg1nYLJio1AeLyLk
X-Received: by 2002:a05:600c:3b10:b0:402:eab6:e704 with SMTP id m16-20020a05600c3b1000b00402eab6e704mr2127411wms.29.1694615115679;
        Wed, 13 Sep 2023 07:25:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGN0t8yz3+zH7LDMFjVxmF3tnVkdjJhcoCATJjm6CztmjCnnjLfigAOYlLj+//qxaHPIO3cjg==
X-Received: by 2002:a05:600c:3b10:b0:402:eab6:e704 with SMTP id m16-20020a05600c3b1000b00402eab6e704mr2127388wms.29.1694615115372;
        Wed, 13 Sep 2023 07:25:15 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id l14-20020a1c790e000000b003fe4ca8decdsm2186260wme.31.2023.09.13.07.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 07:25:15 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Arnd Bergmann <arnd@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>, Arnd Bergmann <arnd@arndb.de>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: kbuild: explain handling optional
 dependencies
In-Reply-To: <20230913113801.1901152-1-arnd@kernel.org>
References: <20230913113801.1901152-1-arnd@kernel.org>
Date:   Wed, 13 Sep 2023 16:25:14 +0200
Message-ID: <878r9a1779.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Arnd Bergmann <arnd@kernel.org> writes:

Hello Arnd,

> From: Arnd Bergmann <arnd@arndb.de>
>
> This problem frequently comes up in randconfig testing, with
> drivers failing to link because of a dependency on an optional
> feature.
>
> The Kconfig language for this is very confusing, so try to
> document it in "Kconfig hints" section.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Thanks for writing this since as you mention that Kconfig idiom is not
intuitive. The docs looks great to me!

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


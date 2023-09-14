Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 177B1CA0ED0
	for <linux-doc@archiver.kernel.org>; Thu, 14 Sep 2023 03:57:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234394AbjIND5Q (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 13 Sep 2023 23:57:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234257AbjIND5Q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Sep 2023 23:57:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1BCDE1BDA
        for <linux-doc@vger.kernel.org>; Wed, 13 Sep 2023 20:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694663785;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=63bCgZyJPHacFd5KYq5Eqq1cMFHgnlGhz4az2hRkdwo=;
        b=T+Er4ggfSw7IiZxRi0ucFtMbOQ7AwSDgbG1mgamrTPn/jkHxF+d3HSS/O6EQFMzZi1lr+6
        88T9vzU8KAf25T3EzL2k+0SQENgRiPsyRQu2+OwiMnXnF9hH9EcEUh2Z+JDfY8xDGdbu9o
        TUn7HVzd3ANmj4j8raHsHNhRq1kz41g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-458-yCRQTPdYOeW4asSAfTUyCA-1; Wed, 13 Sep 2023 23:56:23 -0400
X-MC-Unique: yCRQTPdYOeW4asSAfTUyCA-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-402493650c6so6732555e9.1
        for <linux-doc@vger.kernel.org>; Wed, 13 Sep 2023 20:56:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694663782; x=1695268582;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=63bCgZyJPHacFd5KYq5Eqq1cMFHgnlGhz4az2hRkdwo=;
        b=MNEhJTiiDNP8EHUXSscvpjJvsL6j13KDnYh8GunWgfUltDGg22QfwLesS4W4zhCEi9
         DmXM7TkQ0E6v9/HAGdf9VixvewCCYTTsF+xQ0tAfk8DwBBrZ8vNppmaGFi/Ydk3J+1ix
         22NTDQWyG8PH4rTeNaBXKo+NBYQz/YbpQzgcdCOthyC0pC2JPFRMnUQFHITzthJaNd4t
         5wVHgtadfytxifGWM4tiOKD87FffiMHEes/RV1qZd6bmikiaWYHYDdZfRlZjOIV24wUj
         9smknwHTRZDM0OFWcPT+mgrbWZh+sp+2zTtDGuQiPVKBUyjj4nvunnhOXdIcox02GlZr
         ALUA==
X-Gm-Message-State: AOJu0YyGs8RZBMJ2gtZp1WuD+dT9Naz6mi7E6cHptAH0L5Je+FlJ2Jcf
        y48CbaErk+NvDA3KFd2wtUofVbawvz0bZQTl84q/HvjCrW/f9SVqrFejd8y3aIkoJ4y+cIb8ZWr
        h9hPeV2RWPQHezAlVUpuA
X-Received: by 2002:a5d:4d48:0:b0:317:59a6:6f68 with SMTP id a8-20020a5d4d48000000b0031759a66f68mr368717wru.0.1694663782438;
        Wed, 13 Sep 2023 20:56:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5SPDX1hcn5laq1RA9p9XOS8/g3DnQpW7eGWgRtECgwIvYuRxdyOibR3jv6pK73OtAV++HJw==
X-Received: by 2002:a5d:4d48:0:b0:317:59a6:6f68 with SMTP id a8-20020a5d4d48000000b0031759a66f68mr368709wru.0.1694663782027;
        Wed, 13 Sep 2023 20:56:22 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id s1-20020a5d4ec1000000b0031fbbe347e1sm529465wrv.65.2023.09.13.20.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 20:56:21 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Arnd Bergmann <arnd@arndb.de>, Nicolas Schier <nicolas@fjasle.eu>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: kbuild: explain handling optional
 dependencies
In-Reply-To: <c7c6de7b-4adf-4625-8f09-8f419869161d@app.fastmail.com>
References: <20230913113801.1901152-1-arnd@kernel.org>
 <ZQISGujwlH00B8KJ@fjasle.eu>
 <b234530c-88fe-4a2a-993c-f1733fe4d0c1@app.fastmail.com>
 <ZQIcuVgaDmA+VdV0@fjasle.eu>
 <c7c6de7b-4adf-4625-8f09-8f419869161d@app.fastmail.com>
Date:   Thu, 14 Sep 2023 05:56:20 +0200
Message-ID: <874jjx1k7v.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

"Arnd Bergmann" <arnd@arndb.de> writes:

Hello Nicolas,

> On Wed, Sep 13, 2023, at 22:34, Nicolas Schier wrote:
>> On Wed, Sep 13, 2023 at 09:55:36PM +0200 Arnd Bergmann wrote:
>

[...]

>> I can choose between:
>>
>> BAR=y  => FOO={N/m/y}
>> BAR=m  => FOO is not selectable
>> BAR=n  => FOO={N/m/y}
>
> That is indeed the point: if BAR=m, we want to be able to pick FOO=m
> here, otherwise it is impossible to enabled everything as modules.
>
> Another correct way to express the same thing as the first would
> be 
>
> config FOO
>       tristate "Support for foo hardware"
>       depends on !BAR=m || m
>
> which I find even more confusing than the 'BAR || !BAR'
> convention, though we have that in a couple of places.
>
> I just found another variant that I had not seen before:
>
>> (Re-checked with BAR=IPV6 and FOO=WIREGUARD; CONFIG_WIREGUARD as 'depends on
>> IPV6 || !IPV6' in its kconfig definition, and both are tristate kconfig
>> symbols.)
>>

Which is correct because WIREGUARD can be built with IPV6 disabled, but
if both options are enabled then WIREGUARD can only be built-in if the
IPV6 option is also built-in.

WIREGUARD must be a module if IPV6 is also a module, but can still be a
module if IPV6 is built-in.

In other words, what this idiom express is that the following configs
are possible:

 IPV6=n => WIREGUARD=y
 IPV6=n => WIREGUARD=m
 IPV6=y => WIREGUARD=y
 IPV6=y => WIREGUARD=m
 IPV6=m => WIREGUARD=m

but the following option is not possible:

 IPV6=m => WIREGUARD=y

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


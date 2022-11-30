Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5162CC4321E
	for <linux-doc@archiver.kernel.org>; Wed, 30 Nov 2022 16:13:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbiK3QN1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Nov 2022 11:13:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbiK3QNZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Nov 2022 11:13:25 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3FFE84DDB
        for <linux-doc@vger.kernel.org>; Wed, 30 Nov 2022 08:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669824742;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QVZppsKA0ZkKrWi0UQJ3nN97bBOZR3Uq+VmhTSXYrAc=;
        b=UpebVtd3wMz8wVn4879a3+2oA9PygVY/3cyOxNDrUSeJmh4x7MuCmOpXiCiXorVCiGuKk2
        BN7dY3KXt1ziPmS8Vx+v//McKcTn7PbP97mIqlH5pSR7AAxzP55fuQkB7LYgN6IuzpXfwd
        ZEKCxJIN0BVUMCHUkgcsTW5uY31dPSA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-567-_aMjeBx7PqWnEzV5QLQRDg-1; Wed, 30 Nov 2022 11:12:20 -0500
X-MC-Unique: _aMjeBx7PqWnEzV5QLQRDg-1
Received: by mail-ej1-f72.google.com with SMTP id gn36-20020a1709070d2400b007ba3374574dso8911573ejc.23
        for <linux-doc@vger.kernel.org>; Wed, 30 Nov 2022 08:12:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QVZppsKA0ZkKrWi0UQJ3nN97bBOZR3Uq+VmhTSXYrAc=;
        b=p14vpV7ejz9uzsbPCQyvIVn0TyH9FkS2iAnCS8crYx6hmR8KCyHAvX1dj44VVJoAGB
         0kznnk4eMI/oMv7pgh1nouo+FtJGiWFdxn1ZKNAMc2XE6zvrH9cDowVx836m5Zy56jCO
         OaR6lz9f/hQO1ZLRVVr5pTINMSW5HnncQkCBlbb37Nlh0VXZYfJukUSAlCRseaNJNl97
         KBvz4Qx/0+votPBzeshMaG16lkDwqAaC/G0BFUTb7tOSR92DkWss8HBxwuakXFTWpF8u
         JFD7GXS3kBlZASlrNPT0Q6IfRR4Puq9kYNFcB7EgbvqlCmpdk3VZ3PBNLoMts0GMNf1K
         uLYw==
X-Gm-Message-State: ANoB5pluzVWp5vhYH6CCUyPP9cLITZKU+rBqWzNG1Z0jvX4BQpABf5JJ
        JueMNbjTAmg+vB6ltkavCb8maN3npITVrq9EWImdVNmbsPn26BI12gmXK6/Stt4IFTO2xdGdEWY
        F0t6n/Y44N/r+IBB3Q3yx
X-Received: by 2002:a05:6402:2b8a:b0:46b:2979:7397 with SMTP id fj10-20020a0564022b8a00b0046b29797397mr14524415edb.332.1669824735437;
        Wed, 30 Nov 2022 08:12:15 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6if3Kc2Cj0h+P6TmrYnaFX5IltT1cl7CIO76VkItJB2JB2khb5ke+7EhgOoPjv45ky0ZvgCw==
X-Received: by 2002:a05:6402:2b8a:b0:46b:2979:7397 with SMTP id fj10-20020a0564022b8a00b0046b29797397mr14524389edb.332.1669824735178;
        Wed, 30 Nov 2022 08:12:15 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id sb25-20020a1709076d9900b007ae4717bef1sm816567ejc.15.2022.11.30.08.12.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 08:12:14 -0800 (PST)
Message-ID: <8a53e88b-1e74-bf34-62a1-780a1b29bcbc@redhat.com>
Date:   Wed, 30 Nov 2022 17:12:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1 2/3] Documentation: gpio: Add a section on what to
 return in ->get() callback
Content-Language: en-US, nl
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marc Zyngier <maz@kernel.org>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Corbet <corbet@lwn.net>
References: <20221130155519.20362-1-andriy.shevchenko@linux.intel.com>
 <20221130155519.20362-2-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221130155519.20362-2-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On 11/30/22 16:55, Andy Shevchenko wrote:
> The ->get() callback depending on other settings and hardware support
> may return different values, while the line outside the chip is kept
> in the same state. Let's discuss that in the documentation.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  Documentation/driver-api/gpio/driver.rst | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/Documentation/driver-api/gpio/driver.rst b/Documentation/driver-api/gpio/driver.rst
> index bf6319cc531b..3d2f36001a7a 100644
> --- a/Documentation/driver-api/gpio/driver.rst
> +++ b/Documentation/driver-api/gpio/driver.rst
> @@ -251,6 +251,30 @@ supports more versatile control over electrical properties and can handle
>  different pull-up or pull-down resistance values.
>  
>  
> +Considerations of the ->get() returned value
> +--------------------------------------------
> +
> +Due to different possible electrical configurations and software applications
> +the value that ->get() callback returns may vary depending on the other settings.
> +This will allow to use pins in the I2C emulation mode or other not so standard
> +uses.
> +
> +The below table gathered the most used cases.
> +
> +==========  ==========  ===============  =======================
> +  Input       Output         State        What value to return?
> +==========  ==========  ===============  =======================
> + Disabled    Disabled    Hi-Z             input buffer
> + Disabled    OS/OD/etc   Single ended     [cached] output buffer

You need to clarify what single-ended means here. You mean a pin
which is only capable of output I guess ?  So now way to figure
out if another participant in the OS/OD bus has its transistor
in the "on" state this pulling the bus high / low agains the bias
resistor(s) which determine the state of the bus in rest ?

Or you mean that the bus is uni-directional, even then being
able to detect a short-circuit is useful.

> +    x        Push-Pull   Out              [cached] output buffer

Why, most GPIO drivers are protected against short-circuit to
GND / Vdd and actually reading the input-buffer here will allow
GPIO API consumers to detect such short-circuits if they are
interested in this.  This would e.g. be useful to detect
mis-wiring on devices like the Raspberry Pi were users often
connect extra peripherals through breadboards.

IMHO for pins with an input buffer get() should simply
always return the contents of the input buffer. This is what
I believe almost all GPIO drivers currently do and also
keeps the get() methods KISS.

Actually implementing the behavior you suggest here requires
the get() method to differentiate between push-pull and
other mode. This makes the get() method implementation
needlessly complicated and will likely be a source of bugs
as people will get this wrong in some cases and people
will very likely not test all possible combinations from
this big table you are adding here.

IHMO the rules for get() should simply be:

1. Device has an input buffer:
   Return input-buffer value for the pin.

2. Devices does not have an input buffer:
   Return last set output-buffer value

Regards,

Hans




> + Enabled     Disabled    In               input buffer
> + Enabled     OS/OD/etc   Bidirectional    input buffer
> +==========  ==========  ===============  =======================
> +
> +The [cached] here is used in a broader sense: either pure software cache, or
> +read back value from the GPIO output buffer (not all hardware support that).
> +
> +
>  GPIO drivers providing IRQs
>  ===========================
>  


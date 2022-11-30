Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF7FC433FE
	for <linux-doc@archiver.kernel.org>; Wed, 30 Nov 2022 16:15:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbiK3QPp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Nov 2022 11:15:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbiK3QPo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Nov 2022 11:15:44 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9BC427CDE
        for <linux-doc@vger.kernel.org>; Wed, 30 Nov 2022 08:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669824881;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4mehhTQA0SDu9T8ATpWmU3Dywl8KoUv1J/dWH4vmP0c=;
        b=CmL11vNnXjvnDo5mfM36J+uJOi9LtV8xVxqNKa3s9ff1k24u18sYGKk4fI9U6vO1I0HBHZ
        QORRykoXzn3kTnlztQNdIbyAGzvIyh6FMWFpZ7ff9jp6IT4MDeSeHmd9OZKGjhMOF7MVEn
        WbXtWSBRj0j9RHYJzT6aJLOdeQKaxJA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-90-OLBp-LqIPrugGXrcegbm1A-1; Wed, 30 Nov 2022 11:14:40 -0500
X-MC-Unique: OLBp-LqIPrugGXrcegbm1A-1
Received: by mail-ej1-f71.google.com with SMTP id qf25-20020a1709077f1900b0078c02a23da3so8728438ejc.0
        for <linux-doc@vger.kernel.org>; Wed, 30 Nov 2022 08:14:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4mehhTQA0SDu9T8ATpWmU3Dywl8KoUv1J/dWH4vmP0c=;
        b=pcGrXPg0XzBww8vRw7VUbGlCbD9s4q6aII+tV3KjwwLhDbkXQl3TaQILgnxjrQv+yj
         heG22IkkC7nxxCuhNBrAbFDqyKiF530M2SPR7GAEU13KDiVl5W2tRy02Z/BYDvZPokms
         z5ikmpdCrXd6hEtx9Tm5R+SQ2gtaEkQWOy1spnUCxhkGc0xZrf5vsBfP6PTH+BNy5zD1
         j3gU42tEqtnm25unQkUpZQvVzvvUU65IXQtYcW40WGcKwfHB6nP1iwPOs4wthZIjxMg1
         23gYmi6RyvMlkhZ1Gd10sbToylaZ+VNrIiPGnixTLHj+zE/EtWN4o5cR+QKwhBM03pZ9
         H68g==
X-Gm-Message-State: ANoB5pncQEGXc0kXyY6nGU8nPqE+e33Ds5AS3Pv4Ahdk6s/wL+RPbKmO
        +WO5gLmbyg18N2+qt7y5qofGOjZCT2wzPB35JzLda1yPiUTVA5m+lusfQJo4JwIVafRQE7J2OQF
        o+w+auOxxGNecWyi+i/NR
X-Received: by 2002:a17:906:8d86:b0:78d:4742:bb62 with SMTP id ry6-20020a1709068d8600b0078d4742bb62mr41333296ejc.43.1669824879456;
        Wed, 30 Nov 2022 08:14:39 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4TGWeDpKgmWbPpVlhLKBVIxdgz0eepYpVpF+2gRTQmMVQYcsZjmYzFFt2PJcr8PmLSdzmlXg==
X-Received: by 2002:a17:906:8d86:b0:78d:4742:bb62 with SMTP id ry6-20020a1709068d8600b0078d4742bb62mr41333281ejc.43.1669824879253;
        Wed, 30 Nov 2022 08:14:39 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id 25-20020a170906319900b0077e6be40e4asm799713ejy.175.2022.11.30.08.14.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 08:14:38 -0800 (PST)
Message-ID: <f54df574-2763-5b3e-84a3-debf13777996@redhat.com>
Date:   Wed, 30 Nov 2022 17:14:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1 2/3] Documentation: gpio: Add a section on what to
 return in ->get() callback
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marc Zyngier <maz@kernel.org>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Corbet <corbet@lwn.net>
References: <20221130155519.20362-1-andriy.shevchenko@linux.intel.com>
 <20221130155519.20362-2-andriy.shevchenko@linux.intel.com>
 <8a53e88b-1e74-bf34-62a1-780a1b29bcbc@redhat.com>
In-Reply-To: <8a53e88b-1e74-bf34-62a1-780a1b29bcbc@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi again,

On 11/30/22 17:12, Hans de Goede wrote:
> Hi,
> 
> On 11/30/22 16:55, Andy Shevchenko wrote:
>> The ->get() callback depending on other settings and hardware support
>> may return different values, while the line outside the chip is kept
>> in the same state. Let's discuss that in the documentation.
>>
>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> ---
>>  Documentation/driver-api/gpio/driver.rst | 24 ++++++++++++++++++++++++
>>  1 file changed, 24 insertions(+)
>>
>> diff --git a/Documentation/driver-api/gpio/driver.rst b/Documentation/driver-api/gpio/driver.rst
>> index bf6319cc531b..3d2f36001a7a 100644
>> --- a/Documentation/driver-api/gpio/driver.rst
>> +++ b/Documentation/driver-api/gpio/driver.rst
>> @@ -251,6 +251,30 @@ supports more versatile control over electrical properties and can handle
>>  different pull-up or pull-down resistance values.
>>  
>>  
>> +Considerations of the ->get() returned value
>> +--------------------------------------------
>> +
>> +Due to different possible electrical configurations and software applications
>> +the value that ->get() callback returns may vary depending on the other settings.
>> +This will allow to use pins in the I2C emulation mode or other not so standard
>> +uses.
>> +
>> +The below table gathered the most used cases.
>> +
>> +==========  ==========  ===============  =======================
>> +  Input       Output         State        What value to return?
>> +==========  ==========  ===============  =======================
>> + Disabled    Disabled    Hi-Z             input buffer
>> + Disabled    OS/OD/etc   Single ended     [cached] output buffer
> 
> You need to clarify what single-ended means here. You mean a pin
> which is only capable of output I guess ?  So now way to figure
> out if another participant in the OS/OD bus has its transistor
> in the "on" state this pulling the bus high / low agains the bias
> resistor(s) which determine the state of the bus in rest ?
> 
> Or you mean that the bus is uni-directional? Even then being
> able to detect a short-circuit is useful.
> 
>> +    x        Push-Pull   Out              [cached] output buffer
> 
> Why, most GPIO drivers are protected against short-circuit to
> GND / Vdd and actually reading the input-buffer here will allow
> GPIO API consumers to detect such short-circuits if they are
> interested in this.  This would e.g. be useful to detect
> mis-wiring on devices like the Raspberry Pi were users often
> connect extra peripherals through breadboards.
> 
> IMHO for pins with an input buffer get() should simply
> always return the contents of the input buffer. This is what
> I believe almost all GPIO drivers currently do and also
> keeps the get() methods KISS.
> 
> Actually implementing the behavior you suggest here requires
> the get() method to differentiate between push-pull and
> other mode. This makes the get() method implementation
> needlessly complicated and will likely be a source of bugs
> as people will get this wrong in some cases and people
> will very likely not test all possible combinations from
> this big table you are adding here.
> 
> IHMO the rules for get() should simply be:
> 
> 1. Device has an input buffer:
>    Return input-buffer value for the pin.
> 
> 2. Devices does not have an input buffer:
>    Return last set output-buffer value

Quick correction device should be pin here, because it
if there is an input buffer or not can differ per pin.
So IHMO the rules for get() should simply be:

1. pin has an input buffer:
   return input-buffer value for the pin.

2. pin does not have an input buffer:
   return the value last set for the pin's output-buffer

Regards,

Hans



>> + Enabled     Disabled    In               input buffer
>> + Enabled     OS/OD/etc   Bidirectional    input buffer
>> +==========  ==========  ===============  =======================
>> +
>> +The [cached] here is used in a broader sense: either pure software cache, or
>> +read back value from the GPIO output buffer (not all hardware support that).
>> +
>> +
>>  GPIO drivers providing IRQs
>>  ===========================
>>  
> 


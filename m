Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A850DC47088
	for <linux-doc@archiver.kernel.org>; Thu,  1 Dec 2022 11:23:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229795AbiLALXd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Dec 2022 06:23:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230392AbiLALXN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Dec 2022 06:23:13 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD7F598EA5
        for <linux-doc@vger.kernel.org>; Thu,  1 Dec 2022 03:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669893538;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Z/oQ1dp8pm6na7x2qMu5KCqO3dPrhF5h5HwNnQ1rRCE=;
        b=YCjqvhabyYkFZVDxE8FT5JjhUHVHtIjACVhKSBXi2hErbPZDm5LnT90rfKDSxTB2Z/ZVLv
        CqOeB+3Sy4fwvF0I8/3grQGmiTnEPlFNbZnr71/DSNmcTosJf03/gQT4+O9yKcb6ORDOJx
        mpGxw7bEqOayNBug5fEY4EkWNwmX9Fo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-586-iWmMbIGBPSq7e3R50sirPQ-1; Thu, 01 Dec 2022 06:18:57 -0500
X-MC-Unique: iWmMbIGBPSq7e3R50sirPQ-1
Received: by mail-ed1-f71.google.com with SMTP id b6-20020a056402278600b0046bb01fb9c0so712588ede.3
        for <linux-doc@vger.kernel.org>; Thu, 01 Dec 2022 03:18:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/oQ1dp8pm6na7x2qMu5KCqO3dPrhF5h5HwNnQ1rRCE=;
        b=tbbW9BQ9aBn381Vx1mIcYmoaAvKhuUSMkaAcpghPFrBxj4QWlxeBTp2/rZEWDlvSVX
         eD5/jFatnVpSLMB32Id1J6ehMHPbppdiC6Bmp8nPqoL8tH2auZlSbEX76NwOsE7kJko/
         vBPx2OYskSi8JxiBz1LSqzA+JS6Y+bm7XxpQK5xWBKc+V9LwxS7yHbHdsRxyD07noit5
         s3eJmNh+97PLqmx0WQx4YX20MVxTtk306DwydeuWAHFOxlYeUTNqIi6BtD2FCB5dIrtF
         8v4QXgJUysV/ITd7TLaXZ3A93w8FsK5EnfoeNcagPQkSAm0f0wvJch1fyiueBpnVkKPb
         cMjA==
X-Gm-Message-State: ANoB5pkoLyYRUkJAsRsF6mEHfE9cBtSh1NscIHkChWty+dLM46dOIzv4
        q0xwtD8OB9M9oCCKEEsgEAFUduIvBuM7xSISIvUb55rA/tEzgtiBA7SWzP1c1dx5zfEj8vNntnG
        BCKAqe8Z8u8z3ed2THfFG
X-Received: by 2002:a05:6402:1103:b0:46a:779:4c6a with SMTP id u3-20020a056402110300b0046a07794c6amr38920934edv.201.1669893536376;
        Thu, 01 Dec 2022 03:18:56 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6c2vc5K+ZToGa38uefpAv8Oh7GdnueV57HtH+dNAkwQmO4405Upj0dcXYRwImA2NFqe5iu5w==
X-Received: by 2002:a05:6402:1103:b0:46a:779:4c6a with SMTP id u3-20020a056402110300b0046a07794c6amr38920902edv.201.1669893536080;
        Thu, 01 Dec 2022 03:18:56 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id l2-20020a056402124200b004615f7495e0sm1635425edw.8.2022.12.01.03.18.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 03:18:55 -0800 (PST)
Message-ID: <5ea0bc88-ccc4-4b67-c444-2b4df0084bd2@redhat.com>
Date:   Thu, 1 Dec 2022 12:18:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1 2/3] Documentation: gpio: Add a section on what to
 return in ->get() callback
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Marc Zyngier <maz@kernel.org>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Corbet <corbet@lwn.net>
References: <20221130155519.20362-1-andriy.shevchenko@linux.intel.com>
 <20221130155519.20362-2-andriy.shevchenko@linux.intel.com>
 <8a53e88b-1e74-bf34-62a1-780a1b29bcbc@redhat.com>
 <Y4eC6W/wstJFLrEr@smile.fi.intel.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y4eC6W/wstJFLrEr@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On 11/30/22 17:20, Andy Shevchenko wrote:
> On Wed, Nov 30, 2022 at 05:12:13PM +0100, Hans de Goede wrote:
>> On 11/30/22 16:55, Andy Shevchenko wrote:
>>> The ->get() callback depending on other settings and hardware support
>>> may return different values, while the line outside the chip is kept
>>> in the same state. Let's discuss that in the documentation.
> 
> ...
> 
>>> +Considerations of the ->get() returned value
>>> +--------------------------------------------
>>> +
>>> +Due to different possible electrical configurations and software applications
>>> +the value that ->get() callback returns may vary depending on the other settings.
>>> +This will allow to use pins in the I2C emulation mode or other not so standard
>>> +uses.
>>> +
>>> +The below table gathered the most used cases.
>>> +
>>> +==========  ==========  ===============  =======================
>>> +  Input       Output         State        What value to return?
>>> +==========  ==========  ===============  =======================
>>> + Disabled    Disabled    Hi-Z             input buffer
>>> + Disabled    OS/OD/etc   Single ended     [cached] output buffer
>>
>> You need to clarify what single-ended means here. You mean a pin
>> which is only capable of output I guess ?  So now way to figure
>> out if another participant in the OS/OD bus has its transistor
>> in the "on" state this pulling the bus high / low agains the bias
>> resistor(s) which determine the state of the bus in rest ?
>>
>> Or you mean that the bus is uni-directional, even then being
>> able to detect a short-circuit is useful.
> 
> It's described in the previous chapter(s).
> 
>>> +    x        Push-Pull   Out              [cached] output buffer
>>
>> Why, most GPIO drivers are protected against short-circuit to
>> GND / Vdd and actually reading the input-buffer here will allow
>> GPIO API consumers to detect such short-circuits if they are
>> interested in this.  This would e.g. be useful to detect
>> mis-wiring on devices like the Raspberry Pi were users often
>> connect extra peripherals through breadboards.
> 
> I think it is nonsense from electronics point of view.
> 
>> IMHO for pins with an input buffer get() should simply
>> always return the contents of the input buffer. This is what
>> I believe almost all GPIO drivers currently do and also
>> keeps the get() methods KISS.
> 
> As you can see, I disagree on this.
> 
>> Actually implementing the behavior you suggest here requires
>> the get() method to differentiate between push-pull and
>> other mode. This makes the get() method implementation
>> needlessly complicated and will likely be a source of bugs
>> as people will get this wrong in some cases and people
>> will very likely not test all possible combinations from
>> this big table you are adding here.
> 
> People already are getting wrong this and here is no documentation
> on what to do to get it right.
> 
>> IHMO the rules for get() should simply be:
>>
>> 1. Device has an input buffer:
>>    Return input-buffer value for the pin.
> 
> I disagree on this. It makes no sense to read real hw wire state when output
> is enabled. If somebody does a short circuit, it's not a Linux issue and
> should be recognized on the PCB side (using oscilloscope, multi-meter, etc).

What is the disadvantage of reading the real hw wire state ? 

The list of advantages / disadvantages I can come up with GPIO
controllers which always allow access to the input buffers is:

Disadvantanges of having get() always return the input-buffer

1. It is slower then returning the last output value cached on
   the kernel side. But this too wil complicate the driver
   code, since this requires populating the cache at boot
   (or relying on regmap caching)

Advantages of having get() always return the input-buffer:

1. It leads to a very simple / KISS get() implementation
2. One has to wonder why a GPIO API consumer puts a pin
   in push/pull output mode and then calls get() anyways ?
   This is an unlikely scenario (making disadvantage 1.
   not a problem) and in the unlikely case that an API
   consumer does this they likely want the real hw wire state.

I guess the reason why you want to return a cached output value
is because not all GPIO controllers allow access to the input
buffer when in output mode ? At least that is the only good reason
I can come up with ?

Specifically there are GPIO controllers which have a single data
register for the GPIOs rather then separate data in + data out
registers.  Even then chances are that a read from the data
register *always* goes to the input-buffer rather then reading
the last written value when in output mode. This is likely since
simply always latching the data from the input-buffer on a read
from a shared in/out data register is easier to implement in hw.

So thinking more about this, I believe that the answer what
to return on a get() from a GPIO configured as push/pull output
is implementation dependent. For GPIO chips with a shared in/out
data register it is the value of that register, which may be
a cached output value or the input-buffer value and for GPIO
chips with a separate register to read the input-buffer it
should simply always be the input buffer.

Regards,

Hans





> 
>> 2. Devices does not have an input buffer:
>>    Return last set output-buffer value
> 
>>> + Enabled     Disabled    In               input buffer
>>> + Enabled     OS/OD/etc   Bidirectional    input buffer
>>> +==========  ==========  ===============  =======================
>>> +
>>> +The [cached] here is used in a broader sense: either pure software cache, or
>>> +read back value from the GPIO output buffer (not all hardware support that).
> 


Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B36EA7E66E
	for <lwn-linux-doc@archive.lwn.net>; Fri,  9 Mar 2018 01:28:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751306AbeCIB2C (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 8 Mar 2018 20:28:02 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:54888 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751148AbeCIB2B (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Mar 2018 20:28:01 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 6DEA86070A; Fri,  9 Mar 2018 01:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1520558880;
        bh=B3Bitf6FZ0lGyHo5zrCaPTLL/GJ6b+RFbiioT7ZJeZw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=jqpXHiBrSE5DjGFR+DmNtW+g9PRgB0CS7GHu/cP6R0NgnlTnnYgA71H9ZhoOkpo/M
         Gxu/skT/YnKBun+cxLjE/YVhB54w8J6ibWaZ27elU2x8TQkPFkIu2MpVLD7lkLXrf3
         Oil6lbuUVzdRZp4FCQr7ede9ACaEf5xcu7/0N/wg=
Received: from [10.226.58.86] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sdharia@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6E6DD601D3;
        Fri,  9 Mar 2018 01:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1520558878;
        bh=B3Bitf6FZ0lGyHo5zrCaPTLL/GJ6b+RFbiioT7ZJeZw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ZH5cmq7c0TghZcyp9UIs/hWYTTu25RoZoBa/xUdPMMwNRYyeNkXldUw2Xd/Pk/Vk+
         68FQpkhCYykGGmy/ZSEfNhGXy9OXYwOpRe/ftuvIJl83VTCfL73lDyHpLL9sESf4JR
         8Ma+M/9T2ZXGZholVqvymi2pVh/sJaIZe67kWBus=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6E6DD601D3
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sdharia@codeaurora.org
Subject: Re: [v3, 3/4] i2c: i2c-qcom-geni: Add bus driver for the Qualcomm
 GENI I2C controller
To:     Doug Anderson <dianders@chromium.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
        evgreen@chromium.org, acourbot@chromium.org,
        Girish Mahadevan <girishm@codeaurora.org>, swboyd@chromium.org,
        harryy@codeaurora.org, adharmap@codeaurora.org
References: <1519781889-16117-4-git-send-email-kramasub@codeaurora.org>
 <CAD=FV=WbeP8xpVi7cji9hsNyxEam2D5D+_21ur_MuUO8FK42OQ@mail.gmail.com>
 <03c5ed5b-5160-bdd5-82f9-4a8beab33ca8@codeaurora.org>
 <CAD=FV=UXK_wYky83nmQdk4dQtVSCV9=o3i2590ZyUMcq4rrdKQ@mail.gmail.com>
From:   Sagar Dharia <sdharia@codeaurora.org>
Message-ID: <014494b3-0b4a-d82f-0b93-53464e281cb4@codeaurora.org>
Date:   Thu, 8 Mar 2018 18:27:56 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=UXK_wYky83nmQdk4dQtVSCV9=o3i2590ZyUMcq4rrdKQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Doug,

On 3/7/2018 10:19 PM, Doug Anderson wrote:
> Hi,
> 
> On Wed, Mar 7, 2018 at 6:42 PM, Sagar Dharia <sdharia@codeaurora.org> wrote:
>> Hi Doug,
>> Thank you for reviewing the patch. I will take a stab at a few comments
>> below. We will address most of the other comments in next version of I2C
>> patch.
>>>
>>>> +
>>>> +static const struct geni_i2c_clk_fld geni_i2c_clk_map[] = {
>>>> +       {KHz(100), 7, 10, 11, 26},
>>>> +       {KHz(400), 2,  5, 12, 24},
>>>> +       {KHz(1000), 1, 3,  9, 18},
>>>
>>>
>>> So I guess this is all relying on an input serial clock of 19.2MHz?
>>> Maybe document that?
>>>
>>> Assuming I'm understanding the math here, is it really OK for your
>>> 100kHz and 1MHz mode to be running slightly fast?
>>>
>>> 19200. / 2 / 24
>>>>>>
>>>>>> 400.0
>>>
>>>
>>> 19200. / 7 / 26
>>>>>>
>>>>>> 105.49450549450549
>>>
>>>
>>> 19200. / 1 / 18
>>>>>>
>>>>>> 1066.6666666666667
>>>
>>>
>>> It seems like you'd want the fastest clock that you can make that's
>>> _less than_ the spec.
>>>
>>>
>>> It would also be interesting to know if it's expected that boards
>>> might need to tweak the t_high / t_low depending on their electrical
>>> characteristics.  In the past I've had lots of requests from board
>>> makers to tweak things because they've got a long trace, or a stronger
>>> or weaker pull, or ...  If so we might later need to add some dts
>>> properties like "i2c-scl-rising-time-ns" and make the math more
>>> dynamic here, unless your hardware somehow automatically adjusts for
>>> this type of thing...
>>> These values are derived by our HW team to comply with the t-high and
>>
>> t-low specs of I2C. We have confirmed on scope that the frequency of SCL is
>> indeed less than/equal to the spec. We have not come across slaves who have
>> needed to tweak these things. We are open to adding these properties in dts
>> if you have any such slaves not conforming due to board-layout of other
>> reasons.
> 
> OK, I'm fine with leaving something like this till later if/when it
> comes up.  Documenting a little bit more about how these timings work
> seems like it would be nice, though, at least mentioning what the
> source clock is...
>

Yes, we will document how t-high and t-low is derived from source.

>>> Wow, that's a cluster of arcane calls to handle a call that probably
>>> will never fail (it just enables clocks and sets pinctrl).  Sigh.
>>> ...but as far as I can tell the whole sequence is right.  You
>>> definitely need a "put" after a failed get and it looks like
>>> pm_runtime_set_suspended() has a special exception where it can be
>>> called if you got a runtime error...
>>
>> We didn't have this in before either. But this condition is somewhat
>> frequent if I2C transactions are called on cusp of exiting system suspend.
>> (e.g. PMIC slave getting a wakeup-IRQ and trying to read from PMIC through
>> I2C to read its status as to what caused that wake-up. At that time,
>> get_sync doesn't really enable resources (kernel 4.9) since the runtime-pm
>> ref-count isn't decremented. We run the risk of unclocked access if these
>> arcane calls aren't present. You can go through runtime-pm documentation
>> chapter 6 for more details.
> 
> Yeah, I certainly agree that the calls are needed if
> pm_runtime_get_sync() and I'm not suggesting removing them.  Hence the
> "as far as I can tell the whole sequence is right".
> 
> ...but I'm actually kinda worried if you're saying that you actually
> ran into this case.  Hopefully that got fixed and code no longer tries
> to read from the PMIC at a bad time anymore?  That code should be
> fixed not to be running so late in suspend.
> 

I have added Harry Y and Abhijeet D (developers for PMIC I2C client
team). They can comment if there is still a usecase of very late
transaction during suspend and/or very early transaction during resume.

> 
>>>>
>>>> +       /* Make sure no transactions are pending */
>>>> +       ret = i2c_trylock_bus(&gi2c->adap, I2C_LOCK_SEGMENT);
>>>> +       if (!ret) {
>>>> +               dev_err(gi2c->se.dev, "late I2C transaction request\n");
>>>> +               return -EBUSY;
>>>> +       }
>>>
>>>
>>> Does this happen?  How?
>>>
>>> Nothing about this code looks special for your hardware.  If this is
>>> really needed, why is it not part of the i2c core since there's
>>> nothing specific about your driver here?
>>>
>> There have been some clients that don't implement sys-suspend/resume
>> callbacks (so i2c adapter has no clue they are done with their transactions)
>> and this allows us to be flexible when they call I2C transactions extremely
>> late.
> 
> Still feels like this belongs in the i2c core, not your driver.  Maybe
> you should send a patch for the core and remove it from here?
> 
> ...and also, it seems like any i2c clients that don't implement the
> suspend/resume callbacks and try to do i2c transactions late in the
> game need to be fixed.  It should be documented that this isn't a
> valid thing for a driver to do and if we end up in this error case
> then it's not an i2c issue but it's a bad driver somewhere.
> 
You are right: this check is special for our HW due to usecases
mentioned above.
This check can go in i2c-core, but then it will not be necessary if
all adapters and clients that we work with are upstreamed (and all
implement system suspend/resume).
We will remove this in next version of geni i2c-adapter driver.

Thanks
Sagar

-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

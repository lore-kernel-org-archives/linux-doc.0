Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2CDEB7E66E
	for <lwn-linux-doc@archive.lwn.net>; Fri,  9 Mar 2018 05:02:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751298AbeCIFC4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 9 Mar 2018 00:02:56 -0500
Received: from mail-ua0-f181.google.com ([209.85.217.181]:35116 "EHLO
        mail-ua0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751277AbeCIFCx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Mar 2018 00:02:53 -0500
Received: by mail-ua0-f181.google.com with SMTP id c40so1481166uae.2
        for <linux-doc@vger.kernel.org>; Thu, 08 Mar 2018 21:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=oMxd9tcIFL4OtmRvhjfhwDfG4wNUOwFmjwieezI8+UM=;
        b=j56Qg7klnz2jKuC/PPTt3UR4Y61ruPtD7WXf0Cw6gKFARDeWqf2+B0ZNjPpMxVM+Vx
         0MKRw8dLG7VWLj1Y54KZeXv2OrDkpRfOzrEmnMK2Zy7SrXqOjKg69KoBZTUJzinIdlQ0
         mABtp1W/62d8QysQ7Uo5zPwoA73iCumdMXKHRcGjsk06i0vGAj+u9YCbdSup+WYQGxYd
         8dM1PmKA6OHwpyTM8pPL+9eJF0A6Mngr4VaMnEqXPQW3k2mM+mbQZAdwPOPEjEFv/ZkK
         d4/1fKAUydERRTFS98z3lfJog167ONLG7zVlZr6ykubnbRmrP6SHfBWe8EBKQ7vFxglD
         9dUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=oMxd9tcIFL4OtmRvhjfhwDfG4wNUOwFmjwieezI8+UM=;
        b=X5LPwKCAeSKhrdsHEIp/ZHcAOZFguxrDJQRbSebcYd4ScHYgssVqpGhcv833MtM+b1
         auzSMXCEMpOeqGsR2BXHQPaZ4PLqrA4tq7CxAPcY0EjTOq8M8uNCXeaEc69rLtTgRrXE
         6lWdABGohRgQa1d99r5NIiAu/qAgtn3MQCGWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=oMxd9tcIFL4OtmRvhjfhwDfG4wNUOwFmjwieezI8+UM=;
        b=nFO00Lr1P+jeBxdP7IAOq/CWdpTN+0WFRS6tNnzeajafQ540TeG3G0Pr6UFBSvboRT
         6kpwxopqWXcisV39ba12+Mcy+8xenOcbXV65sfnXFKz5K0E+FfisVuJTkXfWd5xjeD4C
         w9EYFbweu6P3Se/FL2BqYgFCDKRtwU9paFyTSjv3HEEsB3OlMplPN7u4g9RuLdBg5aAH
         lycn4lqi/uQ88p29nxPc5tWh8zUP+jlg1FGm30rGSxroh3tePJrzA52UTWnXARo2KJab
         Hs9LTsHIkheok1wJVEMEokVlHglS5g6JCg8sFr1XUw9UtH3IJp9+q5/rBGmW/FH7KgQD
         4pUw==
X-Gm-Message-State: APf1xPCeDH75QYZJ/RWcE1V7gijFiOoVTIz9UEvGhXqxHznsMDnaRQ2k
        luKqec51yaL2m6qn7bYMjbwAUKk0t7QeXUyW3ezOyA==
X-Google-Smtp-Source: AG47ELuN0AwbGvCePfBWS+YWca3oZPJztCXTVj85n5AmBwPm1SYKChSxM7rErq7AkHCt/y5InSLNvI9m+m0L9yRV2gQ=
X-Received: by 10.176.79.7 with SMTP id n7mr21198050uah.64.1520571772500; Thu,
 08 Mar 2018 21:02:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.254.65 with HTTP; Thu, 8 Mar 2018 21:02:51 -0800 (PST)
In-Reply-To: <65ae29b5-83da-22aa-f483-c3a25802239f@codeaurora.org>
References: <1519781889-16117-4-git-send-email-kramasub@codeaurora.org>
 <CAD=FV=WbeP8xpVi7cji9hsNyxEam2D5D+_21ur_MuUO8FK42OQ@mail.gmail.com>
 <03c5ed5b-5160-bdd5-82f9-4a8beab33ca8@codeaurora.org> <CAD=FV=UXK_wYky83nmQdk4dQtVSCV9=o3i2590ZyUMcq4rrdKQ@mail.gmail.com>
 <CAD=FV=ULH+9aW_3m=WB3Fa4mBg3sR-S3AFY7XOKdZCDqkJdq1Q@mail.gmail.com> <65ae29b5-83da-22aa-f483-c3a25802239f@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 8 Mar 2018 21:02:51 -0800
X-Google-Sender-Auth: BLFoeMQJPQQWjUIN7m6tn9L9d5I
Message-ID: <CAD=FV=Wjc=wHzeH-obpN6f8sMYFziakRWupLM6pEUL=eELbC7w@mail.gmail.com>
Subject: Re: [v3, 3/4] i2c: i2c-qcom-geni: Add bus driver for the Qualcomm
 GENI I2C controller
To:     Sagar Dharia <sdharia@codeaurora.org>
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
        Girish Mahadevan <girishm@codeaurora.org>, swboyd@chromium.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Thu, Mar 8, 2018 at 5:06 PM, Sagar Dharia <sdharia@codeaurora.org> wrote:
> Hi Doug
>
>
> On 3/8/2018 2:12 PM, Doug Anderson wrote:
>>
>> Hi,
>>
>> On Wed, Mar 7, 2018 at 9:19 PM, Doug Anderson <dianders@chromium.org>
>> wrote:
>>>>>
>>>>> DMA is hard and i2c transfers > 32 bytes are rare.  Do we really gain
>>>>> a lot by transferring i2c commands over DMA compared to a FIFO?
>>>>> Enough to justify the code complexity and the set of bugs that will
>>>>> show up?  I'm sure it will be a controversial assertion given that the
>>>>> code's already written, but personally I'd be supportive of ripping
>>>>> DMA mode out to simplify the driver.  I'd be curious if anyone else
>>>>> agrees.  To me it seems like premature optimization.
>>>>
>>>>
>>>>
>>>> Yes, we have multiple clients (e.g. touch, NFC) using I2C for data
>>>> transfers
>>>> bigger than 32 bytes (some transfers are 100s of bytes). The fifo size
>>>> is
>>>> 32, so we can definitely avoid at least 1 interrupt when DMA mode is
>>>> used
>>>> with data size > 32.
>>>
>>>
>>> Does that 1-2 interrupts make any real difference, though?  In theory
>>> it really shouldn't affect the transfer rate.  We should be able to
>>> service the interrupt plenty fast and if we were concerned we would
>>> tweak the watermark code a little bit.  So I guess we're worried about
>>> the extra CPU cycles (and power cost) to service those extra couple
>>> interrupts?
>>>
>>> In theory when touch data is coming in or NFC data is coming in then
>>> we're probably not in a super low power state to begin with.  If it's
>>> touch data we likely want to have the CPU boosted a bunch to respond
>>> to the user quickly.  If we've got 8 cores available all of which can
>>> run at 1GHz or more a few interrupts won't kill us.  NFC data is
>>> probably not common enough that we need to optimize power/CPU
>>> utilizatoin for that.
>>>
>>>
>>> So while i can believe that you do save an interrupt or two, I still
>>> am not convinced that those interrupts are worth a bunch of complex
>>> code (and a whole second code path) to save.
>>>
>>>
>>> ...also note that above you said that coming out of runtime suspend
>>> can take several msec.  That seems like it dwarfs any slight
>>> difference in timing between a FIFO-based operation and DMA.
>>
>>
>> One last note here (sorry for not thinking of this last night) is that
>> I would also be interested in considering _only_ supporting the DMA
>> path.  Is it somehow intrinsically bad to use the DMA flow for a
>> 1-byte transfer?  Is there a bunch of extra overhead or power draw?
>>
>> Specifically my main point is that maintaining two separate flows (the
>> FIFO flow vs the DMA flow) adds complexity, code size, and bugs.  If
>> there's a really good reason to maintain both flows then fine, but we
>> should really consider if this is something that's really giving us
>> value before we agree to it.
>>
>
> FIFO mode gives us 2 advantages:
> 1. small transfers don't have to go through 'dma-map/unmap penalties.
> Some small buffers come from the stack of client caller and the
> dma-map/unmap may fail.
> 2. bring-ups are 'less eventful' (with temp. change to just not have DMA
> mode at all during bring-ups) since SMMU translation/DMA path from QUP
> (master) to memory slave may not always available when critical I2C
> peripherals need to be brought up (e.g. PMIC). CPU to QUP (slave) path
> is usually available.
>
> On the other side, DMA mode has other advantages:
> 1. Multiple android clients are still heavily using I2C in spite of
> faster peripheral buses being available in industry.
> As an example, some multi-finger Touch screens use I2C and the data to
> be transferred per transaction over the bus grows well beyond 70-100
> bytes based on number of fingers. These transactions are very frequent
> when touch is being used, and in an environment where other heavy system
> users are also running (MM/graphics).
> Another example is, NFC uses I2C (as of now) to transfer as much as 700+
> bytes. This can save us 20+ interrupts per transfer.
>
> These transfers are mostly in burst. So the RPMh penalty to resume the
> shared resources is only experienced for very first transfer. Remaining
> transfers in the burst benefit from DMA if they are too big.
>
> Goal here is to have common driver for upstream targets and android and
> android has seen proven advantages with both modes.
> If we end up keeping DMA only for downstream (or FIFO only for
> downstream), then we lose the advantage of having code in upstream since
> we have to maintain downstream patch with other mode.

OK, fair enough.  Having DMA mode alone would be a pain at bringup if
nothing else.  You're right.

I would still argue that perhaps those extra interrupts for FIFO mode
aren't quite as bit of a deal as you're making it out to be.  I've
been on systems that get massive number of interrupts almost
constantly and really it wasn't noticeable.

In any case, I didn't think I'd really convince anyone with this one,
so unless someone out there who matters actually feels the same way as
me then feel free to just ignore this and keep supporting both DMA and
FIFO mode.


-Doug
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

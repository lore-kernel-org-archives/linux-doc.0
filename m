Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id F3BE87E66E
	for <lwn-linux-doc@archive.lwn.net>; Thu,  8 Mar 2018 21:12:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751127AbeCHVMP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 8 Mar 2018 16:12:15 -0500
Received: from mail-ua0-f175.google.com ([209.85.217.175]:39521 "EHLO
        mail-ua0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750926AbeCHVMN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Mar 2018 16:12:13 -0500
Received: by mail-ua0-f175.google.com with SMTP id e25so845866uam.6
        for <linux-doc@vger.kernel.org>; Thu, 08 Mar 2018 13:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=TwbddthAtwdLCwRCzOlIz43jmOuwBdVnta4vT9aEg8k=;
        b=QXKeA9Xdb6Sd9QCrJW4J280yiINAJ85HZSBr/DoMqVbpTHlulduCQGdlI7riDTe0+I
         fNCne8SG2PfsEcqSonbOOXyejmxHM74pgzZ4caGfTqCodfr1soruqFWiDB5VjeQPehOs
         d2idUVXYfkUrSpFfyXGAC9WKNNK/I80Nc7sVGbNEDBuGXzVKl5n7EbcGOwMx3SLtO9V4
         MbWD7DVDrtBgyLowdHClbDNy2rNjWLUbOIy7J6FLHV6cEqD85jUl+UfGgKspJ2E3d1nE
         xU8QXqrPgt8zvkRxNmXOB3ckcdmw070prC/jWPBYVma5DWFPj4BDFfbM0lQdlAG/3O9r
         2nJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=TwbddthAtwdLCwRCzOlIz43jmOuwBdVnta4vT9aEg8k=;
        b=O0O5NeumCVp48eQJpJC7ruB0nsnoL58khyTaXH7jbpVxUH64aCbn4bq94gelyc2lMe
         5Xj9Mg76GpFhSm4+KCEAx/fFvgtAOwNb2+b8oVo8wQGUC+CRnfsLXwwFEqyBGfN0t2a9
         Ne0xELL7/v0o2sM488BNL4QHQj3zFMtRza8C4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=TwbddthAtwdLCwRCzOlIz43jmOuwBdVnta4vT9aEg8k=;
        b=Fx5ysQ5QnzH+/FYVxVlmHrdc3QEoNv19Jr+4AvpSRThZEF2NpVSuA8db+wcAXs+YJ0
         wv56rAYxXyGbvDRAJFKOhr8rTZvfdJ0lTKQOMlV3Yh504krpnVPP+w224XyUyQg5vKWd
         7GXnXPwV9Jo5HsXMUVMMVWwuIY7vhEMjePCwAqYRYIJfwhEvAHuoq9n/11DFISNmuGEO
         9PNJ+KFiE6Q/DGh5wpLT+HnU8QQa+dMuZdOaXORvRAHC2hvEnT4jK/HD4ExpQfTBkBxu
         p+tDMudXe5Jx1k1nRxm5bzyEvJQ68YdlhRP64NirWiE0NwH5ytxX9gVGqSKlwoCoU2O6
         vqwg==
X-Gm-Message-State: APf1xPBlDuxfvyBzfY38wrH4P+0ymASWpdmazjy+8kXfXUxTcM3/Wogz
        2ZigW5TNNHcFaND4jEf7NI+2NQLpvpWw+lOIQUL3Wg==
X-Google-Smtp-Source: AG47ELsNZ3FvCJnWfs/JQA7Vql0e4kDGgUfkf13ag31NIIViW5SyFrVR6hqFsFCbIusz7/jJrLPdElQ4grDNK0PmOjU=
X-Received: by 10.159.49.27 with SMTP id m27mr21036616uab.169.1520543530894;
 Thu, 08 Mar 2018 13:12:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.254.65 with HTTP; Thu, 8 Mar 2018 13:12:09 -0800 (PST)
In-Reply-To: <CAD=FV=UXK_wYky83nmQdk4dQtVSCV9=o3i2590ZyUMcq4rrdKQ@mail.gmail.com>
References: <1519781889-16117-4-git-send-email-kramasub@codeaurora.org>
 <CAD=FV=WbeP8xpVi7cji9hsNyxEam2D5D+_21ur_MuUO8FK42OQ@mail.gmail.com>
 <03c5ed5b-5160-bdd5-82f9-4a8beab33ca8@codeaurora.org> <CAD=FV=UXK_wYky83nmQdk4dQtVSCV9=o3i2590ZyUMcq4rrdKQ@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 8 Mar 2018 13:12:09 -0800
X-Google-Sender-Auth: 1SqN5ksyZPUAM1vg7WTv6hed1AE
Message-ID: <CAD=FV=ULH+9aW_3m=WB3Fa4mBg3sR-S3AFY7XOKdZCDqkJdq1Q@mail.gmail.com>
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

On Wed, Mar 7, 2018 at 9:19 PM, Doug Anderson <dianders@chromium.org> wrote:
>>> DMA is hard and i2c transfers > 32 bytes are rare.  Do we really gain
>>> a lot by transferring i2c commands over DMA compared to a FIFO?
>>> Enough to justify the code complexity and the set of bugs that will
>>> show up?  I'm sure it will be a controversial assertion given that the
>>> code's already written, but personally I'd be supportive of ripping
>>> DMA mode out to simplify the driver.  I'd be curious if anyone else
>>> agrees.  To me it seems like premature optimization.
>>
>>
>> Yes, we have multiple clients (e.g. touch, NFC) using I2C for data transfers
>> bigger than 32 bytes (some transfers are 100s of bytes). The fifo size is
>> 32, so we can definitely avoid at least 1 interrupt when DMA mode is used
>> with data size > 32.
>
> Does that 1-2 interrupts make any real difference, though?  In theory
> it really shouldn't affect the transfer rate.  We should be able to
> service the interrupt plenty fast and if we were concerned we would
> tweak the watermark code a little bit.  So I guess we're worried about
> the extra CPU cycles (and power cost) to service those extra couple
> interrupts?
>
> In theory when touch data is coming in or NFC data is coming in then
> we're probably not in a super low power state to begin with.  If it's
> touch data we likely want to have the CPU boosted a bunch to respond
> to the user quickly.  If we've got 8 cores available all of which can
> run at 1GHz or more a few interrupts won't kill us.  NFC data is
> probably not common enough that we need to optimize power/CPU
> utilizatoin for that.
>
>
> So while i can believe that you do save an interrupt or two, I still
> am not convinced that those interrupts are worth a bunch of complex
> code (and a whole second code path) to save.
>
>
> ...also note that above you said that coming out of runtime suspend
> can take several msec.  That seems like it dwarfs any slight
> difference in timing between a FIFO-based operation and DMA.

One last note here (sorry for not thinking of this last night) is that
I would also be interested in considering _only_ supporting the DMA
path.  Is it somehow intrinsically bad to use the DMA flow for a
1-byte transfer?  Is there a bunch of extra overhead or power draw?

Specifically my main point is that maintaining two separate flows (the
FIFO flow vs the DMA flow) adds complexity, code size, and bugs.  If
there's a really good reason to maintain both flows then fine, but we
should really consider if this is something that's really giving us
value before we agree to it.


-Doug
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

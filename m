Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E176A7D0DA
	for <lwn-linux-doc@archive.lwn.net>; Thu, 22 Mar 2018 22:16:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751793AbeCVWQP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 22 Mar 2018 18:16:15 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:58764 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751765AbeCVWQN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 22 Mar 2018 18:16:13 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id E635A60F6E; Thu, 22 Mar 2018 22:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1521756972;
        bh=F+e34kUr5ZB9jqmUlIIrLkj2mp/YO5Pois1tQTHKoMw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=KhPoR40vHgyTc6ucO2WG2a2yEG+sQWo8nx5SUlL1qKwk59CR2OJ6SI+OQd9dWx9xu
         s5gFm4Q3ifYX8TtBg6ULXz2qZXJ1Bfm5NqT4XHIs9QifDTShfFdlFxgdMaVgK3PBdG
         XPCWr7/mR+LL5X6y4UVI6wTCFrPPdurCVdugvN1A=
Received: from [10.226.60.63] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kramasub@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6A89C607A2;
        Thu, 22 Mar 2018 22:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1521756971;
        bh=F+e34kUr5ZB9jqmUlIIrLkj2mp/YO5Pois1tQTHKoMw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=GbdXX4mGqLu0c1M/Lv3jm/ubDbedpOVa4PMeSb6iwLQce+ePg6Ync6v03pkB8ikM0
         bWkkRnpfis2v4miViG27QRPbSN8B89MR/po1MekqK2V51TjDC+SFhog9JOSCYpmrhd
         gp168OAz6j6mmTTmpf5052tZkSFwXJQqLUCHuP3s=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6A89C607A2
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=kramasub@codeaurora.org
Subject: Re: [PATCH v4 4/6] tty: serial: msm_geni_serial: Add serial driver
 support for GENI based QUP
To:     Stephen Boyd <swboyd@chromium.org>, andy.gross@linaro.org,
        corbet@lwn.net, david.brown@linaro.org, gregkh@linuxfoundation.org,
        mark.rutland@arm.com, robh+dt@kernel.org, wsa@the-dreams.de
Cc:     linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-serial@vger.kernel.org, jslaby@suse.com,
        evgreen@chromium.org, acourbot@chromium.org,
        Girish Mahadevan <girishm@codeaurora.org>,
        Sagar Dharia <sdharia@codeaurora.org>,
        Doug Anderson <dianders@google.com>
References: <1521071931-9294-1-git-send-email-kramasub@codeaurora.org>
 <1521071931-9294-5-git-send-email-kramasub@codeaurora.org>
 <152156025613.254778.431774948232120027@swboyd.mtv.corp.google.com>
 <23359b7c-6760-9cca-4c99-b08b3e79fa7a@codeaurora.org>
 <152165280040.91116.1976061062009791598@swboyd.mtv.corp.google.com>
From:   Karthik Ramasubramanian <kramasub@codeaurora.org>
Message-ID: <484ecaa1-d72c-cf32-8128-ec3469ba084c@codeaurora.org>
Date:   Thu, 22 Mar 2018 16:16:09 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <152165280040.91116.1976061062009791598@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 3/21/2018 11:20 AM, Stephen Boyd wrote:
> Quoting Karthik Ramasubramanian (2018-03-20 15:53:25)
>>
>>
>> On 3/20/2018 9:37 AM, Stephen Boyd wrote:
>>> Quoting Karthikeyan Ramasubramanian (2018-03-14 16:58:49)
>>>> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
>>>> new file mode 100644
>>>> index 0000000..1442777
>>>> --- /dev/null
>>>> +++ b/drivers/tty/serial/qcom_geni_serial.c
>>>> @@ -0,0 +1,1158 @@
>>>> +
> 
>>>
>>> Can you also support the OF_EARLYCON_DECLARE method of console writing
>>> so we can get an early printk style debug console?
>> Do you prefer that as part of this patch itself or is it ok if I upload
>> the earlycon support once this gets merged.
> 
> I think this already got merged? So just split it out into another patch
> would be fine. I see the config is already selecting the earlycon
> support so it must be planned.
Yes it is definitely in the plan. Since the serial driver got merged, I
will address the pending comments in this patch series. I will upload
the early console support in another patch.
> 
>>>
>>>
>>>> +
>>>> +static int __maybe_unused qcom_geni_serial_sys_resume_noirq(struct device *dev)
>>>> +{
>>>> +       struct platform_device *pdev = to_platform_device(dev);
>>>> +       struct qcom_geni_serial_port *port = platform_get_drvdata(pdev);
>>>> +       struct uart_port *uport = &port->uport;
>>>> +
>>>> +       if (console_suspend_enabled && uport->suspended) {
>>>> +               uart_resume_port(uport->private_data, uport);
>>>> +               disable_irq(uport->irq);
>>>
>>> I missed the enable_irq() part. Is this still necessary?
>> Suspending the uart console port invokes the uart port shutdown
>> operation. The shutdown operation disables and frees the concerned IRQ.
>> Resuming the uart console port invokes the uart port startup operation
>> which requests for the IRQ. The request_irq operation auto-enables the
>> IRQ. In addition, resume_noirq implicitly enables the IRQ. This leads to
>> an unbalanced IRQ enable warning.
>>
>> This disable_irq() helps with suppressing that warning.
> 
> That's not obvious so we need a big comment here.
> 
> I thought we would move this to the normal suspend/resume callbacks and
> skip the noirq variants. That would make this disable_irq() unnecessary
> then?
For a non-console UART(eg. 4-wire UART), to reduce the wakeup latency
_noirq variant is used so that the resources can be turned on as soon as
possible. The idea is to use the same suspend and resume operation for
both debug-uart and regular uart. Hence using the _noirq variant.

I will add a detailed comment regarding why we are disabling the IRQ.
> 
> BTW, free_irq() should disable the irq itself, so it looks odd to have a
> disable_irq() followed directly by a free_irq().
I will update to just free_irq.
> 
Regards,
Karthik.
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 593CA7D048
	for <lwn-linux-doc@archive.lwn.net>; Tue, 22 May 2018 14:53:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751469AbeEVOxA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 22 May 2018 10:53:00 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:55962 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751245AbeEVOw5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 May 2018 10:52:57 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id DA88660C66; Tue, 22 May 2018 14:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1527000776;
        bh=xoIvdiBYr2+tw55E5IG9wvoGaM2oRHScTU5reckmcAg=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=DsjU+JgGjyw776u4TM2I9ix0Av1cPamgShY05jzpT9SEJtWKALQ/4kK6t7TCVFazE
         ejRycOB1Dr/XChFXRdwtU68R0D4iOXBMI83S/nnPxGySmQ+vZgvKwU8AX8K/B+Hlxy
         5+ZzDSZlkOPzVNgXpsgPl51yECdkbMb8A6o7LcJU=
Received: from [192.168.0.109] (unknown [161.97.199.73])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kramasub@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 48B85601D7;
        Tue, 22 May 2018 14:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1527000776;
        bh=xoIvdiBYr2+tw55E5IG9wvoGaM2oRHScTU5reckmcAg=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=DsjU+JgGjyw776u4TM2I9ix0Av1cPamgShY05jzpT9SEJtWKALQ/4kK6t7TCVFazE
         ejRycOB1Dr/XChFXRdwtU68R0D4iOXBMI83S/nnPxGySmQ+vZgvKwU8AX8K/B+Hlxy
         5+ZzDSZlkOPzVNgXpsgPl51yECdkbMb8A6o7LcJU=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 48B85601D7
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=kramasub@codeaurora.org
Subject: Re: [PATCH v5 3/5] i2c: i2c-qcom-geni: Add bus driver for the
 Qualcomm GENI I2C controller
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     corbet@lwn.net, andy.gross@linaro.org, david.brown@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        evgreen@chromium.org, acourbot@chromium.org, swboyd@chromium.org,
        dianders@chromium.org, Sagar Dharia <sdharia@codeaurora.org>,
        Girish Mahadevan <girishm@codeaurora.org>
References: <1521836461-6515-1-git-send-email-kramasub@codeaurora.org>
 <1521836461-6515-4-git-send-email-kramasub@codeaurora.org>
 <20180521204924.4ldbke6udjshdz2k@katana>
From:   Karthik Ramasubramanian <kramasub@codeaurora.org>
Message-ID: <bae1c27a-fdc4-c33b-63d5-c776e9c0b9c8@codeaurora.org>
Date:   Tue, 22 May 2018 08:52:54 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20180521204924.4ldbke6udjshdz2k@katana>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 5/21/2018 2:49 PM, Wolfram Sang wrote:
> Hi,
> 
> On Fri, Mar 23, 2018 at 02:20:59PM -0600, Karthikeyan Ramasubramanian wrote:
>> This bus driver supports the GENI based i2c hardware controller in the
>> Qualcomm SOCs. The Qualcomm Generic Interface (GENI) is a programmable
>> module supporting a wide range of serial interfaces including I2C. The
>> driver supports FIFO mode and DMA mode of transfer and switches modes
>> dynamically depending on the size of the transfer.
>>
>> Signed-off-by: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
>> Signed-off-by: Sagar Dharia <sdharia@codeaurora.org>
>> Signed-off-by: Girish Mahadevan <girishm@codeaurora.org>
> 
> Is one of these people interested in maintaining this driver? Then, an
> entry for MAINTAINERS would be needed, too. (Same goes for
> drivers/soc/qcom/ IMHO, but this is not my realm, so just saying)
One of us will maintain this driver and I will update the MAINTAINERS
appropriately.
> 
>> +static const struct geni_i2c_err_log gi2c_log[] = {
>> +	[GP_IRQ0] = {-EINVAL, "Unknown I2C err GP_IRQ0"},
>> +	[NACK] = {-ENOTCONN, "NACK: slv unresponsive, check its power/reset-ln"},
>> +	[GP_IRQ2] = {-EINVAL, "Unknown I2C err GP IRQ2"},
>> +	[BUS_PROTO] = {-EPROTO, "Bus proto err, noisy/unepxected start/stop"},
>> +	[ARB_LOST] = {-EBUSY, "Bus arbitration lost, clock line undriveable"},
>> +	[GP_IRQ5] = {-EINVAL, "Unknown I2C err GP IRQ5"},
>> +	[GENI_OVERRUN] = {-EIO, "Cmd overrun, check GENI cmd-state machine"},
>> +	[GENI_ILLEGAL_CMD] = {-EILSEQ, "Illegal cmd, check GENI cmd-state machine"},
>> +	[GENI_ABORT_DONE] = {-ETIMEDOUT, "Abort after timeout successful"},
>> +	[GENI_TIMEOUT] = {-ETIMEDOUT, "I2C TXN timed out"},
>> +};
> 
> Please check Documentation/i2c/fault-codes for better -ERRNO values,
> especially for NACK and ARB_LOST.
I will check the fault-codes and fix the error codes here.
> 
> Rest looks good from a glimpse.
> 
> Thanks,
> 
>    Wolfram
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

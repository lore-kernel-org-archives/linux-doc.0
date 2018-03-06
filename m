Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 13E7F7E66C
	for <lwn-linux-doc@archive.lwn.net>; Tue,  6 Mar 2018 17:13:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753914AbeCFRNS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 6 Mar 2018 12:13:18 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:56988 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753904AbeCFRNN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Mar 2018 12:13:13 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 26FCB601A1; Tue,  6 Mar 2018 17:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1520356393;
        bh=nEIDZ0SfxNKhRq+ZxGOcZNelch9bRw3bLm5Lgbu59bc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=oBRJbTYbCWttZ8lQnukEsnbtdSLIm2V9kkX2NzK097XPk6P34FCkbz1GK3HaCq5SZ
         lG09IROJkOtJTl/rOVzxoDJSPHj/XKr7WUssKOD7B+O+SztsEJYUsSCvtZHc+fNkv/
         vwZw33M+oCXz/liHEv8fg4JJP4aZ5TBYk0LNnAyM=
Received: from [10.226.60.63] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kramasub@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 14BFE601A1;
        Tue,  6 Mar 2018 17:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1520356391;
        bh=nEIDZ0SfxNKhRq+ZxGOcZNelch9bRw3bLm5Lgbu59bc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=c2JIMvmwR2Y7AE9wRmHzvEAXDNzWLpcqar4yefPef24Pn0fpgNfIaHPLyR3fBBhN1
         6xMh9GFhKbG00pU1649lJqGfKQsbJZOf4MoTIsLyZ03cfxCNyIEoW0n+ZfUGFdzgZP
         FdfVrTQZlXt6jXDHXedFsqaV684EBokA8xOdNl5c=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 14BFE601A1
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=kramasub@codeaurora.org
Subject: Re: [PATCH v3 1/4] dt-bindings: soc: qcom: Add device tree binding
 for GENI SE
To:     Rob Herring <robh@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-doc@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org, Linux I2C <linux-i2c@vger.kernel.org>,
        linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
        evgreen@chromium.org, acourbot@chromium.org,
        Sagar Dharia <sdharia@codeaurora.org>,
        Girish Mahadevan <girishm@codeaurora.org>
References: <1519781889-16117-1-git-send-email-kramasub@codeaurora.org>
 <1519781889-16117-2-git-send-email-kramasub@codeaurora.org>
 <20180305235831.i7kxups7khus2g5c@rob-hp-laptop>
 <af0d4155-c3bf-97cb-98b2-978093a30611@codeaurora.org>
 <CAL_JsqJHSSsVs4Lut_f7Nk7NU1=NQnOvsyXz8g9-STrwO58GrA@mail.gmail.com>
From:   Karthik Ramasubramanian <kramasub@codeaurora.org>
Message-ID: <31601f77-10b2-2974-6a55-52b3cf9abe5b@codeaurora.org>
Date:   Tue, 6 Mar 2018 10:13:09 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJHSSsVs4Lut_f7Nk7NU1=NQnOvsyXz8g9-STrwO58GrA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 3/6/2018 6:22 AM, Rob Herring wrote:
> On Mon, Mar 5, 2018 at 6:55 PM, Karthik Ramasubramanian
> <kramasub@codeaurora.org> wrote:
>>
>>
>> On 3/5/2018 4:58 PM, Rob Herring wrote:
>>>
>>> On Tue, Feb 27, 2018 at 06:38:06PM -0700, Karthikeyan Ramasubramanian
>>> wrote:
>>>>
>>>> Add device tree binding support for the QCOM GENI SE driver.
>>>>
>>>> Signed-off-by: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
>>>> Signed-off-by: Sagar Dharia <sdharia@codeaurora.org>
>>>> Signed-off-by: Girish Mahadevan <girishm@codeaurora.org>
>>>> ---
>>>>    .../devicetree/bindings/soc/qcom/qcom,geni-se.txt  | 89
>>>> ++++++++++++++++++++++
>>>>    1 file changed, 89 insertions(+)
>>>>    create mode 100644
>>>> Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
>>>> b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
>>>> new file mode 100644
>>>> index 0000000..fe6a0c0
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
>>>> @@ -0,0 +1,89 @@
>>>> +Qualcomm Technologies, Inc. GENI Serial Engine QUP Wrapper Controller
>>>> +
>>>> +Generic Interface (GENI) based Qualcomm Universal Peripheral (QUP)
>>>> wrapper
>>>> +is a programmable module for supporting a wide range of serial
>>>> interfaces
>>>> +like UART, SPI, I2C, I3C, etc. A single QUP module can provide upto 8
>>>> Serial
>>>> +Interfaces, using its internal Serial Engines. The GENI Serial Engine
>>>> QUP
>>>> +Wrapper controller is modeled as a node with zero or more child nodes
>>>> each
>>>> +representing a serial engine.
>>>> +
>>>> +Required properties:
>>>> +- compatible:          Must be "qcom,geni-se-qup".
>>>> +- reg:                 Must contain QUP register address and length.
>>>> +- clock-names:         Must contain "m-ahb" and "s-ahb".
>>>> +- clocks:              AHB clocks needed by the device.
>>>> +
>>>> +Required properties if child node exists:
>>>> +- #address-cells:      Must be <1> for Serial Engine Address
>>>> +- #size-cells:                 Must be <1> for Serial Engine Address
>>>> Size
>>>> +- ranges:              Must be present
>>>> +
>>>> +Properties for children:
>>>> +
>>>> +A GENI based QUP wrapper controller node can contain 0 or more child
>>>> nodes
>>>> +representing serial devices.  These serial devices can be a QCOM UART,
>>>> I2C
>>>> +controller, spi controller, or some combination of aforementioned
>>>> devices.
>>>
>>>
>>> s/spi/SPI/
>>>
>>> Where's the SPI binding?
>>
>> Since the patch series introduces UART and I2C drivers, I added the bindings
>> only for them. I thought about adding the SPI binding when the SPI
>> controller driver is introduced. Please let me know if you want me to add
>> the bindings for SPI in this patch series itself.
> 
> There's no requirement to have the driver and I prefer bindings be as
> complete as possible.
Ok, I will add the bindings for SPI controller in the next posting.
> 
> Rob
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

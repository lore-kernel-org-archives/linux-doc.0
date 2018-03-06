Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B530C7E653
	for <lwn-linux-doc@archive.lwn.net>; Tue,  6 Mar 2018 13:23:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753425AbeCFNXI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 6 Mar 2018 08:23:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:58140 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750817AbeCFNXG (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Mar 2018 08:23:06 -0500
Received: from mail-yw0-f172.google.com (mail-yw0-f172.google.com [209.85.161.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EED1521770;
        Tue,  6 Mar 2018 13:23:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EED1521770
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=robh@kernel.org
Received: by mail-yw0-f172.google.com with SMTP id m123so4663975ywd.1;
        Tue, 06 Mar 2018 05:23:05 -0800 (PST)
X-Gm-Message-State: AElRT7GkTj/s/VsJUS/Z4sI2cUsR5XdQoIXDvyrEZ++7fX+Ed26ECN5f
        +dfSujZUhvUQnud9rXaQbexvPLhosdlZkMJnYQ==
X-Google-Smtp-Source: AG47ELuLq/bVHd0rpUydyKn8o1EUHuI322vAxVNVK8CA78Slly5mlcJuT2/wg+L28R+zXJcHU/BGjbKdeCrtPH6VTxg=
X-Received: by 10.129.156.21 with SMTP id t21mr11345386ywg.279.1520342585154;
 Tue, 06 Mar 2018 05:23:05 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a25:8007:0:0:0:0:0 with HTTP; Tue, 6 Mar 2018 05:22:44 -0800 (PST)
In-Reply-To: <af0d4155-c3bf-97cb-98b2-978093a30611@codeaurora.org>
References: <1519781889-16117-1-git-send-email-kramasub@codeaurora.org>
 <1519781889-16117-2-git-send-email-kramasub@codeaurora.org>
 <20180305235831.i7kxups7khus2g5c@rob-hp-laptop> <af0d4155-c3bf-97cb-98b2-978093a30611@codeaurora.org>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 6 Mar 2018 07:22:44 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJHSSsVs4Lut_f7Nk7NU1=NQnOvsyXz8g9-STrwO58GrA@mail.gmail.com>
Message-ID: <CAL_JsqJHSSsVs4Lut_f7Nk7NU1=NQnOvsyXz8g9-STrwO58GrA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: soc: qcom: Add device tree binding
 for GENI SE
To:     Karthik Ramasubramanian <kramasub@codeaurora.org>
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
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 5, 2018 at 6:55 PM, Karthik Ramasubramanian
<kramasub@codeaurora.org> wrote:
>
>
> On 3/5/2018 4:58 PM, Rob Herring wrote:
>>
>> On Tue, Feb 27, 2018 at 06:38:06PM -0700, Karthikeyan Ramasubramanian
>> wrote:
>>>
>>> Add device tree binding support for the QCOM GENI SE driver.
>>>
>>> Signed-off-by: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
>>> Signed-off-by: Sagar Dharia <sdharia@codeaurora.org>
>>> Signed-off-by: Girish Mahadevan <girishm@codeaurora.org>
>>> ---
>>>   .../devicetree/bindings/soc/qcom/qcom,geni-se.txt  | 89
>>> ++++++++++++++++++++++
>>>   1 file changed, 89 insertions(+)
>>>   create mode 100644
>>> Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
>>> b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
>>> new file mode 100644
>>> index 0000000..fe6a0c0
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
>>> @@ -0,0 +1,89 @@
>>> +Qualcomm Technologies, Inc. GENI Serial Engine QUP Wrapper Controller
>>> +
>>> +Generic Interface (GENI) based Qualcomm Universal Peripheral (QUP)
>>> wrapper
>>> +is a programmable module for supporting a wide range of serial
>>> interfaces
>>> +like UART, SPI, I2C, I3C, etc. A single QUP module can provide upto 8
>>> Serial
>>> +Interfaces, using its internal Serial Engines. The GENI Serial Engine
>>> QUP
>>> +Wrapper controller is modeled as a node with zero or more child nodes
>>> each
>>> +representing a serial engine.
>>> +
>>> +Required properties:
>>> +- compatible:          Must be "qcom,geni-se-qup".
>>> +- reg:                 Must contain QUP register address and length.
>>> +- clock-names:         Must contain "m-ahb" and "s-ahb".
>>> +- clocks:              AHB clocks needed by the device.
>>> +
>>> +Required properties if child node exists:
>>> +- #address-cells:      Must be <1> for Serial Engine Address
>>> +- #size-cells:                 Must be <1> for Serial Engine Address
>>> Size
>>> +- ranges:              Must be present
>>> +
>>> +Properties for children:
>>> +
>>> +A GENI based QUP wrapper controller node can contain 0 or more child
>>> nodes
>>> +representing serial devices.  These serial devices can be a QCOM UART,
>>> I2C
>>> +controller, spi controller, or some combination of aforementioned
>>> devices.
>>
>>
>> s/spi/SPI/
>>
>> Where's the SPI binding?
>
> Since the patch series introduces UART and I2C drivers, I added the bindings
> only for them. I thought about adding the SPI binding when the SPI
> controller driver is introduced. Please let me know if you want me to add
> the bindings for SPI in this patch series itself.

There's no requirement to have the driver and I prefer bindings be as
complete as possible.

Rob
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

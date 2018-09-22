Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B94607D581
	for <lwn-linux-doc@archive.lwn.net>; Sat, 22 Sep 2018 12:38:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729183AbeIVScH (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 22 Sep 2018 14:32:07 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43475 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728164AbeIVScH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 22 Sep 2018 14:32:07 -0400
Received: by mail-pg1-f195.google.com with SMTP id q19-v6so6364347pgn.10;
        Sat, 22 Sep 2018 05:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xG9U2gChXv9WLrM9ziaCG22RRjOkxJ3YsZGRbGvn++A=;
        b=fHKV91MONTs7VZpgFvRQK68PIxxtLUcLSFiuDlaPZ84v0H6pDW0fQkqnEN+HKFuiaS
         cTZ/vb36wYnNpWindBkxInCDkPVhPvSgnv1xKxS4MzZ65kRtYdehe3JlQ6pr9I+qCyDW
         7kDOtL1Lm8xiwA851CiGe4wEcYd/J9UwYT4xaud2YjQdai+qAj9ntm/lJVM2Er6b0JK2
         OxN8a/F0E2Fneypy6c+oA+PDv8ZRNPPV7kb283NrJoh/jrFyYnPxt68YDRyFP2L2TB6c
         5KPzw7+Io5iGvCdp946T3EvfJ71EF8a9A3TSEx1UkFUnOVUncbK0Fz5GMH870Q8tCLIc
         IoXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xG9U2gChXv9WLrM9ziaCG22RRjOkxJ3YsZGRbGvn++A=;
        b=mdt8D00reTAJZXjggJQMGPwOJu6SaY10RrHULQSewFlPuu9pKF+H7/kUI+D1YgkqEw
         VrzyPjaM58NbZrSeGWYu4L1k20IIjfRMCo33p0OpxAJJHXkK4RdFXNUdFaDYjTVkTLDZ
         jFwU/A+vaC1CraVAbNhz4IPE3MjNEGQNhQomHYwzkkipdyNwBDMf+XQ9V2TqI/TUn0oh
         eFdFI5pNzweGa6DPKf/0/+OUhWgRZ7zWAEyXBdfgMsOlKS3YEyk2OyvSJQPh5Jsnn4Ca
         /jhttOay7LQqAMbEf/K4l5AVHYTJUt4hHaJ+RCfsXefoUInKyE2cFW/SxJdV9wNiri6r
         O+nQ==
X-Gm-Message-State: ABuFfohVBCaMAzw3q+sAeOIThAuRKb1OlHVB0V01uG6mkDxpyMmoW18s
        AISnwL5VhMuu4WRpyY9QFkuspBb7
X-Google-Smtp-Source: ACcGV633XoQhW/9rFxjd8pZx/EYkS4Fikai0ivcIaXCabjw/izPO3+dxQNMdb2MzArLtNHIXr+y+vw==
X-Received: by 2002:a63:a40a:: with SMTP id c10-v6mr1842092pgf.140.1537619919526;
        Sat, 22 Sep 2018 05:38:39 -0700 (PDT)
Received: from server.roeck-us.net (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
        by smtp.gmail.com with ESMTPSA id f186-v6sm31454504pgc.4.2018.09.22.05.38.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 22 Sep 2018 05:38:38 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: Add ina3221 documentation
To:     Nicolin Chen <nicoleotsuka@gmail.com>, jdelvare@suse.com,
        robh+dt@kernel.org, mark.rutland@arm.com, corbet@lwn.net
Cc:     afd@ti.com, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20180921223216.634-1-nicoleotsuka@gmail.com>
 <20180921223216.634-2-nicoleotsuka@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <3c117b80-f671-1e57-6eab-3d9801b4b889@roeck-us.net>
Date:   Sat, 22 Sep 2018 05:38:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180921223216.634-2-nicoleotsuka@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On 09/21/2018 03:32 PM, Nicolin Chen wrote:
> Texas Instruments INA3221 is a triple-channel shunt and bus
> voltage monitor. This patch adds a DT binding doc for it.
> 
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
> Changelog
> v2->v3:
>   * Added a simple subject in the line 1
>   * Fixed the shunt resistor value in the example
> v1->v2:
>   * Dropped channel name properties
>   * Added child node definitions.
>   * * Added shunt resistor property in the child node
>   * * Added status property to indicate connection status
>   * * Changed to use child node name as the label of input source
> 
>   .../devicetree/bindings/hwmon/ina3221.txt     | 38 +++++++++++++++++++
>   1 file changed, 38 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/hwmon/ina3221.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ina3221.txt b/Documentation/devicetree/bindings/hwmon/ina3221.txt
> new file mode 100644
> index 000000000000..bcfd5b9c697b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/ina3221.txt
> @@ -0,0 +1,38 @@
> +Texas Instruments INA3221 Device Tree Bindings
> +
> +1) ina3221 node
> +  Required properties:
> +  - compatible: Must be "ti,ina3221"
> +  - reg: I2C address
> +
> +  = The node contains optional child nodes for three channels =
> +  = Each child node describes the information of input source =
> +
> +  Example:
> +
> +  ina3221@40 {
> +          compatible = "ti,ina3221";
> +          reg = <0x40>;
> +          [ child node definitions... ]
> +  };
> +
> +2) child nodes
> +  The names of child nodes should indicate input source names
> +
> +  Required properties:
> +  - input-id: Must be 1, 2 or 3
> +
> +  Optional properties:
> +  - shunt-resistor: Shunt resistor value in micro-Ohm
> +  - status: Should be "disabled" if no input source
> +
> +  Example:
> +
> +  input1 {
> +          input-id = <0x1>;
> +          status = "disabled";
> +  };
> +  VDD_GPU {
> +          input-id = <0x2>;
> +          shunt-resistor = <5000>;
> +  };
> 

Using child nodes is a good idea. However, you are converting the node name into
the hwmon 'label' attribute which I can not accept. First, it is undocumented,
second, it effectively creates an undocumented property (if one wants to configure
the shunt resistor value, one has to configure a child node which is converted
into a label), and third, it violates the hwmon ABI ('input1' is not a "hint
about what this voltage channel is being used for").

Guenter

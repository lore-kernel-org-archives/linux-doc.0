Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 08A1D7D062
	for <lwn-linux-doc@archive.lwn.net>; Thu, 24 May 2018 17:04:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1034019AbeEXREW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 24 May 2018 13:04:22 -0400
Received: from mail-pf0-f196.google.com ([209.85.192.196]:43225 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1034021AbeEXREN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 May 2018 13:04:13 -0400
Received: by mail-pf0-f196.google.com with SMTP id j20-v6so1186813pff.10
        for <linux-doc@vger.kernel.org>; Thu, 24 May 2018 10:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5xp/9mx+HMw9gJTe+k2GM5Ai9nj0GKZs7pdSCUvCm7k=;
        b=cFfbgLcdAQdA3kuRGpfUihpnRrGwvaFVE7/GvKPujcTGNZGDMCLiFdmcEdgTcxTZSq
         Qqq3MY1P9hhv9YN65MsMPFCHp+uw8bfruA5crIaAS+eOCkftmEX7t3LhTCervlKPgsI4
         ZJswUsapoiGoJAfP1jZnmT+dO5HGoE06ayxuABRNn6hRV9qITbyp7HM9j67yQzADhVEK
         o6LyPHJ1pJan3aXfuVMrSN8Vf+B+fb9nYj0uvfbwYlRJzPj1rYTwrUVQRDEqJFTvjt9c
         DZhnCDw4P5dSQOVh+Yt0UZxdjY+4h/Onf2dU5qLhHbOqKmpVLheG7BQJcw6/qHYYARM3
         wsWA==
X-Gm-Message-State: ALKqPwd1lWhdttZQJelx9hNxcIz2aFbaWYLeGR6CtUliVCTUkWD2nAi8
        206/oiOdImyN08WuUF2/Gi5s1Q==
X-Google-Smtp-Source: AB8JxZqAxmsj+cfbcffTYGNNbr/4a33F0gAKSMMWa5FoVHF4UngOhbVnb7aswpjyqViJseIEeQf0EQ==
X-Received: by 2002:a62:4b16:: with SMTP id y22-v6mr8177400pfa.29.1527181452540;
        Thu, 24 May 2018 10:04:12 -0700 (PDT)
Received: from localhost ([207.114.172.147])
        by smtp.gmail.com with ESMTPSA id t14-v6sm48190121pfh.109.2018.05.24.10.04.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 May 2018 10:04:11 -0700 (PDT)
Date:   Thu, 24 May 2018 10:04:09 -0700
From:   Moritz Fischer <mdf@kernel.org>
To:     richard.gong@linux.intel.com
Cc:     catalin.marinas@arm.com, will.deacon@arm.com, dinguyen@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com, atull@kernel.org,
        mdf@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
        corbet@lwn.net, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-fpga@vger.kernel.org, linux-doc@vger.kernel.org,
        yves.vandervennet@linux.intel.com, richard.gong@intel.com
Subject: Re: [PATCHv5 1/8] dt-bindings, firmware: add Intel Stratix10 service
 layer binding
Message-ID: <20180524170409.GA4051@archbook>
References: <1527179600-26441-1-git-send-email-richard.gong@linux.intel.com>
 <1527179600-26441-2-git-send-email-richard.gong@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1527179600-26441-2-git-send-email-richard.gong@linux.intel.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 24, 2018 at 11:33:13AM -0500, richard.gong@linux.intel.com wrote:
> From: Richard Gong <richard.gong@intel.com>
> 
> Add a device tree binding for the Intel Stratix10 service layer driver
> 
> Signed-off-by: Richard Gong <richard.gong@intel.com>
> Signed-off-by: Alan Tull <atull@kernel.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Moritz Fischer <mdf@kernel.org>
> ---
> v2: Change to put service layer driver node under the firmware node
>     Change compatible to "intel, stratix10-svc"
> v3: No change
> v4: Add Rob's Reviewed-by
> v5: No change
> ---
>  .../bindings/firmware/intel,stratix10-svc.txt      | 57 ++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/intel,stratix10-svc.txt
> 
> diff --git a/Documentation/devicetree/bindings/firmware/intel,stratix10-svc.txt b/Documentation/devicetree/bindings/firmware/intel,stratix10-svc.txt
> new file mode 100644
> index 0000000..1fa6606
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/intel,stratix10-svc.txt
> @@ -0,0 +1,57 @@
> +Intel Service Layer Driver for Stratix10 SoC
> +============================================
> +Intel Stratix10 SoC is composed of a 64 bit quad-core ARM Cortex A53 hard
> +processor system (HPS) and Secure Device Manager (SDM). When the FPGA is
> +configured from HPS, there needs to be a way for HPS to notify SDM the
> +location and size of the configuration data. Then SDM will get the
> +configuration data from that location and perform the FPGA configuration.
> +
> +To meet the whole system security needs and support virtual machine requesting
> +communication with SDM, only the secure world of software (EL3, Exception
> +Layer 3) can interface with SDM. All software entities running on other
> +exception layers must channel through the EL3 software whenever it needs
> +service from SDM.
> +
> +Intel Stratix10 service layer driver, running at privileged exception level
> +(EL1, Exception Layer 1), interfaces with the service providers and provides
> +the services for FPGA configuration, QSPI, Crypto and warm reset. Service layer
> +driver also manages secure monitor call (SMC) to communicate with secure monitor
> +code running in EL3.
> +
> +Required properties:
> +-------------------
> +The svc node has the following mandatory properties, must be located under
> +the firmware node.
> +
> +- compatible: "intel,stratix10-svc"
> +- method: smc or hvc
> +        smc - Secure Monitor Call
> +        hvc - Hypervisor Call
> +- memory-region:
> +	phandle to the reserved memory node. See
> +	Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> +	for details
> +
> +Example:
> +-------
> +
> +	reserved-memory {
> +                #address-cells = <2>;
> +                #size-cells = <2>;
> +                ranges;
> +
> +                service_reserved: svcbuffer@0 {
> +                        compatible = "shared-dma-pool";
> +                        reg = <0x0 0x0 0x0 0x1000000>;
> +                        alignment = <0x1000>;
> +                        no-map;
> +                };
> +        };
> +
> +	firmware {
> +		svc {
> +			compatible = "intel,stratix10-svc";
> +			method = "smc";
> +			memory-region = <&service_reserved>;
> +		};
> +	};
> -- 
> 2.7.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-fpga" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

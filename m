Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 319D27D062
	for <lwn-linux-doc@archive.lwn.net>; Thu, 24 May 2018 17:05:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1034056AbeEXRFF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 24 May 2018 13:05:05 -0400
Received: from mail-pf0-f194.google.com ([209.85.192.194]:36968 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1034048AbeEXRFC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 May 2018 13:05:02 -0400
Received: by mail-pf0-f194.google.com with SMTP id e9-v6so1191704pfi.4
        for <linux-doc@vger.kernel.org>; Thu, 24 May 2018 10:05:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LArVAzVseIGt4b+lLJjjs5IEfvhZsZ0Y3+384LsJsxE=;
        b=e1eJer9UPTvYDIgTP8d+Sj/2BIKgBkcSWYBQFhND2HnF4AFg8aoue64LM0e2WdIxUF
         DgbPhccopMD4OE/CuB8CRAWvn2umfgXoMHImmYDsOfMDdJ+6H1cxHU24y5UaYHT6pQvJ
         5earlw1t8hoTm6YCV6nFVqILXdlK81NItYO7h1ax++RXLZkzTNqt4APOpjg3PYJ9WCym
         TAvKDheUlZLkqg1CIVR2y9h+PQGqyj21ZCm0lVldV+Nu4tBI81NZ6wF0lByKaUN/yKm3
         xG3+fgNuFTYBRXH59cYliG751hqWnMcbGZRijFqGwXLeMajpumyF8DtTwAMFcflYzzqh
         sD3Q==
X-Gm-Message-State: ALKqPweYyJ492ujAcocq2n4K6Lxg+g+UEhojX66n/0V9NdiQdMf9ZtHm
        dGvS7yCuhHXCdzsEEl+Ijz2ofQ==
X-Google-Smtp-Source: AB8JxZogCWkoMNVBuxxi260p4SgDe8Ln0jBCK1TZpgGqSuo+rft+ZQ8RxULB89OJQyLpk/vyUKRoGA==
X-Received: by 2002:a62:2218:: with SMTP id i24-v6mr8102621pfi.53.1527181501704;
        Thu, 24 May 2018 10:05:01 -0700 (PDT)
Received: from localhost ([207.114.172.147])
        by smtp.gmail.com with ESMTPSA id c6-v6sm41294237pfj.91.2018.05.24.10.05.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 May 2018 10:05:00 -0700 (PDT)
Date:   Thu, 24 May 2018 10:04:59 -0700
From:   Moritz Fischer <mdf@kernel.org>
To:     richard.gong@linux.intel.com
Cc:     catalin.marinas@arm.com, will.deacon@arm.com, dinguyen@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com, atull@kernel.org,
        mdf@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
        corbet@lwn.net, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-fpga@vger.kernel.org, linux-doc@vger.kernel.org,
        yves.vandervennet@linux.intel.com, richard.gong@intel.com
Subject: Re: [PATCHv5 2/8] arm64: dts: stratix10: add stratix10 service
 driver binding to base dtsi
Message-ID: <20180524170459.GB4051@archbook>
References: <1527179600-26441-1-git-send-email-richard.gong@linux.intel.com>
 <1527179600-26441-3-git-send-email-richard.gong@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1527179600-26441-3-git-send-email-richard.gong@linux.intel.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Richard,

On Thu, May 24, 2018 at 11:33:14AM -0500, richard.gong@linux.intel.com wrote:
> From: Richard Gong <richard.gong@intel.com>
> 
> Add Intel Stratix10 service layer to the device tree
> 
> Signed-off-by: Richard Gong <richard.gong@intel.com>
> Signed-off-by: Alan Tull <atull@kernel.org>
Acked-by: Moritz Fischer <mdf@kernel.org>
> ---
> v2: Change to put service layer driver node under the firmware node
>     Change compatible to "intel, stratix10-svc"
> v3: No change
> v4: s/service driver/stratix10 service driver/ in subject line
> v5: No change
> ---
>  arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
> index d8c94d5..c257287 100644
> --- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
> +++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
> @@ -24,6 +24,19 @@
>  	#address-cells = <2>;
>  	#size-cells = <2>;
>  
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		service_reserved: svcbuffer@0 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x0 0x0 0x0 0x1000000>;
> +			alignment = <0x1000>;
> +			no-map;
> +		};
> +	};
> +
>  	cpus {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> @@ -487,5 +500,13 @@
>  
>  			status = "disabled";
>  		};
> +
> +		firmware {
> +			svc {
> +				compatible = "intel,stratix10-svc";
> +				method = "smc";
> +				memory-region = <&service_reserved>;
> +			};
> +		};
>  	};
>  };
> -- 
> 2.7.4
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AF99D7E27E
	for <lwn-linux-doc@archive.lwn.net>; Mon, 16 Apr 2018 18:14:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753175AbeDPSO0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 16 Apr 2018 14:14:26 -0400
Received: from mail-ot0-f195.google.com ([74.125.82.195]:46000 "EHLO
        mail-ot0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753170AbeDPSOZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 Apr 2018 14:14:25 -0400
Received: by mail-ot0-f195.google.com with SMTP id w2-v6so7491481otj.12;
        Mon, 16 Apr 2018 11:14:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5ncPdJs0NSduTmGTHETPjedHn/Z7t05UxemEBzO5400=;
        b=d51VfJ/L33y8kkq4Cc9ZPG5ly77KUiPHaa+bXSdPl5tC8zYYkRuzn4GxqHuvIb2EWR
         EZYT9olxu0qzJWT8G2snQkGtpJiC9VLAuw7pbqqgubflBJc4GpMIePKMHIgjoulOg1du
         y41Wak5zwL0PYfdkgY6dlbthODnpHB2tV/rcJhLIwtP6m/b3q7tu1dKWonZi8HDUO1N6
         36fPT0Gmt+Fj3iNxCHj/NmxrgR3aD8EM4koCySG92079iD7+Fs/MBveESsRHNyv9q4cJ
         JRjVnP1DFECsKKbL8dyqp6NMFNU49njlCxRmQ+1NDxQo6oVeipAFYSftVeg1eVLYU0Xq
         piNg==
X-Gm-Message-State: ALQs6tDpfW0DRzDpkbHBe7osULvtu20Q47/kD1i7i0AfxKZYlJbv/cXX
        1jNPPvZGPPrv+cWapKKKtA==
X-Google-Smtp-Source: AIpwx4+I/bpqOktBJf1+WuW6UPaNJliu9oACn+gdk+bGt3v7WymvF+v+8Bim3aiHnTtZ+UgrkTj60Q==
X-Received: by 2002:a9d:430e:: with SMTP id s14-v6mr10616034ote.79.1523902464396;
        Mon, 16 Apr 2018 11:14:24 -0700 (PDT)
Received: from localhost (216-188-254-6.dyn.grandenetworks.net. [216.188.254.6])
        by smtp.gmail.com with ESMTPSA id u32-v6sm7824989otb.9.2018.04.16.11.14.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Apr 2018 11:14:23 -0700 (PDT)
Date:   Mon, 16 Apr 2018 13:14:23 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc:     Alan Cox <alan@linux.intel.com>, Andrew Jeffery <andrew@aj.id.au>,
        Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Fengguang Wu <fengguang.wu@intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Haiyue Wang <haiyue.wang@linux.intel.com>,
        James Feist <james.feist@linux.intel.com>,
        Jason M Biils <jason.m.bills@linux.intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Joel Stanley <joel@jms.id.au>,
        Julia Cartwright <juliac@eso.teric.us>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Milton Miller II <miltonm@us.ibm.com>,
        Pavel Machek <pavel@ucw.cz>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stef van Os <stef.van.os@prodrive-technologies.com>,
        Sumeet R Pawnikar <sumeet.r.pawnikar@intel.com>,
        Vernon Mauery <vernon.mauery@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v3 07/10] Documentation: dt-bindings: Add documents for
 PECI hwmon client drivers
Message-ID: <20180416181423.t4vf7sugv6z3aw5h@rob-hp-laptop>
References: <20180410183212.16787-1-jae.hyun.yoo@linux.intel.com>
 <20180410183212.16787-8-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180410183212.16787-8-jae.hyun.yoo@linux.intel.com>
User-Agent: NeoMutt/20170609 (1.8.3)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 10, 2018 at 11:32:09AM -0700, Jae Hyun Yoo wrote:
> This commit adds dt-bindings documents for PECI cputemp and dimmtemp client
> drivers.

"dt-bindings: hwmon: ..." for the subject.

> 
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Reviewed-by: Haiyue Wang <haiyue.wang@linux.intel.com>
> Reviewed-by: James Feist <james.feist@linux.intel.com>
> Reviewed-by: Vernon Mauery <vernon.mauery@linux.intel.com>
> Cc: Alan Cox <alan@linux.intel.com>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Andy Shevchenko <andriy.shevchenko@intel.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Fengguang Wu <fengguang.wu@intel.com>
> Cc: Greg KH <gregkh@linuxfoundation.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Jason M Biils <jason.m.bills@linux.intel.com>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Julia Cartwright <juliac@eso.teric.us>
> Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> Cc: Milton Miller II <miltonm@us.ibm.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Stef van Os <stef.van.os@prodrive-technologies.com>
> Cc: Sumeet R Pawnikar <sumeet.r.pawnikar@intel.com>
> ---
>  .../devicetree/bindings/hwmon/peci-cputemp.txt     | 24 +++++++++++++++++++++
>  .../devicetree/bindings/hwmon/peci-dimmtemp.txt    | 25 ++++++++++++++++++++++
>  2 files changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/peci-cputemp.txt
>  create mode 100644 Documentation/devicetree/bindings/hwmon/peci-dimmtemp.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/peci-cputemp.txt b/Documentation/devicetree/bindings/hwmon/peci-cputemp.txt
> new file mode 100644
> index 000000000000..d5530ef9cfd2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/peci-cputemp.txt
> @@ -0,0 +1,24 @@
> +Bindings for Intel PECI (Platform Environment Control Interface) cputemp driver.
> +
> +Required properties:
> +- compatible : Should be "intel,peci-cputemp".
> +- reg        : Should contain address of a client CPU. Address range of CPU
> +	       clients is starting from 0x30 based on PECI specification.
> +	       <0x30> .. <0x37> (depends on the PECI_OFFSET_MAX definition)

Again, where is PECI_OFFSET_MAX defined? It can't depend on something in 
the kernel.

> +
> +Example:
> +	peci-bus@0 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		< more properties >
> +
> +		peci-cputemp@cpu0 {
> +			compatible = "intel,peci-cputemp";
> +			reg = <0x30>;
> +		};
> +
> +		peci-cputemp@cpu1 {
> +			compatible = "intel,peci-cputemp";
> +			reg = <0x31>;
> +		};
> +	};
> diff --git a/Documentation/devicetree/bindings/hwmon/peci-dimmtemp.txt b/Documentation/devicetree/bindings/hwmon/peci-dimmtemp.txt
> new file mode 100644
> index 000000000000..56e5deb61e5c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/peci-dimmtemp.txt
> @@ -0,0 +1,25 @@
> +Bindings for Intel PECI (Platform Environment Control Interface) dimmtemp
> +driver.
> +
> +Required properties:
> +- compatible : Should be "intel,peci-dimmtemp".
> +- reg        : Should contain address of a client CPU. Address range of CPU
> +	       clients is starting from 0x30 based on PECI specification.
> +	       <0x30> .. <0x37> (depends on the PECI_OFFSET_MAX definition)
> +
> +Example:
> +	peci-bus@0 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		< more properties >
> +
> +		peci-dimmtemp@cpu0 {

unit-address is wrong.

It is a different bus from cputemp? Otherwise, you have conflicting 
addresses. If that's the case, probably should make it clear by showing 
different host adapters for each example.

> +			compatible = "intel,peci-dimmtemp";
> +			reg = <0x30>;
> +		};
> +
> +		peci-dimmtemp@cpu1 {
> +			compatible = "intel,peci-dimmtemp";
> +			reg = <0x31>;
> +		};
> +	};
> -- 
> 2.16.2
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

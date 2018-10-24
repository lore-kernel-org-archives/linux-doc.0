Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 53AFE7D082
	for <lwn-linux-doc@archive.lwn.net>; Wed, 24 Oct 2018 07:25:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726792AbeJXPwf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 24 Oct 2018 11:52:35 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:33127 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbeJXPwf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 Oct 2018 11:52:35 -0400
Received: by mail-wm1-f67.google.com with SMTP id y140-v6so13305220wmd.0
        for <linux-doc@vger.kernel.org>; Wed, 24 Oct 2018 00:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=4TnendpbB9CSR7B7j1wydhyRcm2nLXRTHKyYlZJY9FU=;
        b=JEKwrkfllK8nR0qZ8NSPo6+yrVBWe4hskBB1mjw3JHrxe8tSTsCugGdww3HHNhjO7X
         Wbrr94qun4UPWGrgoJCIh+4i4QGsBZF8jUT0YSgl0Tn8ejPrvzBjUAD/zKSDNxntf5ic
         z773Lxq21UJhCz2FGnFybbfIVBQp35cQ+B1+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=4TnendpbB9CSR7B7j1wydhyRcm2nLXRTHKyYlZJY9FU=;
        b=Btva6/THJVxAMVaQCsG1zWJfSFBkdoAqHtpM9x+++iPi5JaqLg0VxMCIpG4Pv5oUby
         /mtlaecEbGHPdrrKEdXYlo1dNowYrlblYLM63SL7AK0Dx7AUG6olU+eBEsHpKrrgruDZ
         Jzdht6VMT79DR/y64BDq3oVhlg76F2WMod6kHD8z7vpwnk6uukP/JujaWC9stXiiXjO2
         VMX6lfB+qxrX46MmueQUfZ+CD65wzye38AeV96IGWC2EaUF3yJmIxlmi6tggDWldD2X0
         SsO0q5kpX0We9IXkATW23+ptN+qWX3h0RGpQawJZ/pjV9KM4hMFowMWRC5XyVeKCZWdu
         0WCA==
X-Gm-Message-State: AGRZ1gJj0WnY+cFOhmJyt8L9gPE92vWpVWKMTt41LXd9ewEtfoK4RsIM
        oTvd/i6AgNaVJ4OB8cZHV3/RCQ==
X-Google-Smtp-Source: AJdET5fMJbstMnraJe8hEjs25b3LSz1sgSDeIpg4ucjuyJGH//QltS/Vd3VlH4TqI4AVk/XmksOxtg==
X-Received: by 2002:a1c:adce:: with SMTP id w197-v6mr1477186wme.11.1540365943696;
        Wed, 24 Oct 2018 00:25:43 -0700 (PDT)
Received: from dell ([2.31.167.182])
        by smtp.gmail.com with ESMTPSA id j46-v6sm6754729wre.91.2018.10.24.00.25.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Oct 2018 00:25:42 -0700 (PDT)
Date:   Wed, 24 Oct 2018 08:25:40 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        "Darrick J . Wong" <darrick.wong@oracle.com>,
        Eric Sandeen <sandeen@redhat.com>,
        Arnd Bergmann <arnd@arndb.de>, Wu Hao <hao.wu@intel.com>,
        Tomohiro Kusumi <kusumi.tomohiro@gmail.com>,
        "Bryant G . Ly" <bryantly@linux.vnet.ibm.com>,
        Frederic Barrat <fbarrat@linux.vnet.ibm.com>,
        "David S . Miller" <davem@davemloft.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Vinod Koul <vkoul@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        David Kershner <david.kershner@unisys.com>,
        Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
        Sagar Dharia <sdharia@codeaurora.org>,
        Johan Hovold <johan@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Juergen Gross <jgross@suse.com>,
        Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
        openbmc@lists.ozlabs.org,
        James Feist <james.feist@linux.intel.com>,
        Jason M Biils <jason.m.bills@linux.intel.com>,
        Vernon Mauery <vernon.mauery@linux.intel.com>
Subject: Re: [PATCH v8 07/12] dt-bindings: mfd: Add a document for PECI
 client MFD
Message-ID: <20181024072540.GA4939@dell>
References: <20180918215124.14003-1-jae.hyun.yoo@linux.intel.com>
 <20180918215124.14003-8-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180918215124.14003-8-jae.hyun.yoo@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 18 Sep 2018, Jae Hyun Yoo wrote:

> This commit adds a dt-bindings document for PECI client MFD.
> 
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: James Feist <james.feist@linux.intel.com>
> Cc: Jason M Biils <jason.m.bills@linux.intel.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Vernon Mauery <vernon.mauery@linux.intel.com>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>  .../bindings/mfd/intel-peci-client.txt        | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/intel-peci-client.txt
> 
> diff --git a/Documentation/devicetree/bindings/mfd/intel-peci-client.txt b/Documentation/devicetree/bindings/mfd/intel-peci-client.txt
> new file mode 100644
> index 000000000000..cb341e363add
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/intel-peci-client.txt
> @@ -0,0 +1,34 @@
> +* Intel PECI client bindings
> +
> +PECI (Platform Environment Control Interface) is a one-wire bus interface that
> +provides a communication channel from PECI clients in Intel processors and
> +chipset components to external monitoring or control devices. PECI is designed
> +to support the following sideband functions:
> +
> +- Processor and DRAM thermal management
> +- Platform Manageability
> +- Processor Interface Tuning and Diagnostics
> +- Failure Analysis
> +
> +Required properties:
> +- compatible : Should be "intel,peci-client".
> +- reg        : Should contain address of a client CPU. Address range of CPU
> +	       clients starts from 0x30 based on PECI specification.

Nit: "start"

Would be better worded:

"According to the PECI specification client addresses start from 0x30."

> +Example:
> +	peci-bus@0 {
> +		compatible = "vendor,soc-peci";
> +		reg = <0x0 0x1000>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		peci-client@30 {
> +			compatible = "intel,peci-client";
> +			reg = <0x30>;
> +		};
> +
> +		peci-client@31 {
> +			compatible = "intel,peci-client";
> +			reg = <0x31>;
> +		};
> +	};

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

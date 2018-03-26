Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 75AE87DE76
	for <lwn-linux-doc@archive.lwn.net>; Mon, 26 Mar 2018 22:28:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752654AbeCZW1p (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 26 Mar 2018 18:27:45 -0400
Received: from mail-ot0-f193.google.com ([74.125.82.193]:46752 "EHLO
        mail-ot0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752734AbeCZWZB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Mar 2018 18:25:01 -0400
Received: by mail-ot0-f193.google.com with SMTP id v64-v6so1282760otb.13;
        Mon, 26 Mar 2018 15:25:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=B8hZ3Y/mgMEutXEFLyRJSVnTFfawATBS/W0bLZUIazI=;
        b=UP/MyAhKzA/H5SVKKYDE9Sp+PBxRTRNW52S1gnHCcQgF5m7igy4aXX2WkAbypRtFGU
         tnRC8pz1jW+B/tWACBWNs+X3J7Ftw4WG1Oq9vCuuf9ldDAx+XPYFLIRu/08vHCIRwsuB
         zQWJlzgfDm7tzCMR1y6WvMxWLQUN6SNHSm1f1DUhcBe+V/Rz2qo5BNrrVkBF35/lqnKo
         r2tYM/rVkrGvxgckFYr2wfMKOmjIz6T8kK8V3rd7wV+1Tgp26uHximm3SOzoUKySvgw7
         FHsDY/HlNladxoNlR/98aV/baSOBYb6pIJczq32Wz9c0k1QvpyHwS3JGsksicqZ9Uyi2
         iWJw==
X-Gm-Message-State: AElRT7ENf6SLc3Bhszsz7uoZYXjokRhlV6dooKmQeekpdBBWLhdw/4g0
        Hf5glNXDiSaNy3tk94OgkA==
X-Google-Smtp-Source: AG47ELudsv4MVf409JXOWWiNRnP5FiAxxLHlyI0zpuZOatXtBsTveTCcBT0iYai1CtW2WY0rhEdBTw==
X-Received: by 2002:a9d:25cf:: with SMTP id q73-v6mr17401853ota.296.1522103100055;
        Mon, 26 Mar 2018 15:25:00 -0700 (PDT)
Received: from localhost (216-188-254-6.dyn.grandenetworks.net. [216.188.254.6])
        by smtp.gmail.com with ESMTPSA id v22-v6sm9347039oth.19.2018.03.26.15.24.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Mar 2018 15:24:59 -0700 (PDT)
Date:   Mon, 26 Mar 2018 17:24:58 -0500
From:   Rob Herring <robh@kernel.org>
To:     Boris Brezillon <boris.brezillon@bootlin.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Przemyslaw Sroka <psroka@cadence.com>,
        Arkadiusz Golec <agolec@cadence.com>,
        Alan Douglas <adouglas@cadence.com>,
        Bartosz Folta <bfolta@cadence.com>,
        Damian Kos <dkos@cadence.com>,
        Alicja Jurasik-Urbaniak <alicja@cadence.com>,
        Cyprian Wronka <cwronka@cadence.com>,
        Suresh Punnoose <sureshp@cadence.com>,
        Rafal Ciepiela <rafalc@cadence.com>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Nishanth Menon <nm@ti.com>, Pawel Moll <pawel.moll@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Ian Campbell <ijc+devicetree@hellion.org.uk>,
        Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vitor Soares <Vitor.Soares@synopsys.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Xiang Lin <Xiang.Lin@synaptics.com>,
        linux-gpio@vger.kernel.org,
        Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v3 05/11] dt-bindings: i3c: Document core bindings
Message-ID: <20180326071946.dtrhhxx3iwwymk73@rob-hp-laptop>
References: <20180323110020.19080-1-boris.brezillon@bootlin.com>
 <20180323110020.19080-6-boris.brezillon@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180323110020.19080-6-boris.brezillon@bootlin.com>
User-Agent: NeoMutt/20170609 (1.8.3)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 23, 2018 at 12:00:14PM +0100, Boris Brezillon wrote:
> From: Boris Brezillon <boris.brezillon@free-electrons.com>
> 
> A new I3C subsystem has been added and a generic description has been
> created to represent the I3C bus and the devices connected on it.
> 
> Document this generic representation.

Mostly looks fine, a couple of clarifications below.

> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
> Changes in v3:
> - Rename {i2c,i3c}-scl-frequency DT prop into {i2c,i3c}-scl-hz
> - Rework the way we expose the provisional ID and LVR information
> - Rename dynamic-address into assigned-address
> - Enforce the I3C master node name
> 
> Changes in v2:
> - Define how to describe I3C devices in the DT and when it should be
>   used. Note that the parsing of I3C devices is not yet implemented in
>   the framework. Will be added when someone really needs it.
> ---
>  Documentation/devicetree/bindings/i3c/i3c.txt | 140 ++++++++++++++++++++++++++
>  1 file changed, 140 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/i3c.txt
> 
> diff --git a/Documentation/devicetree/bindings/i3c/i3c.txt b/Documentation/devicetree/bindings/i3c/i3c.txt
> new file mode 100644
> index 000000000000..ed858228d26b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/i3c.txt
> @@ -0,0 +1,140 @@
> +Generic device tree bindings for I3C busses
> +===========================================
> +
> +This document describes generic bindings that should be used to describe I3C
> +busses in a device tree.
> +
> +Required properties
> +-------------------
> +
> +- #address-cells  - should be <3>. Read more about addresses below.
> +- #size-cells     - should be <0>.
> +- compatible      - name of the I3C master controller driving the I3C bus
> +
> +For other required properties e.g. to describe register sets,
> +clocks, etc. check the binding documentation of the specific driver.
> +The node describing an I3C bus should be named i3c-master.
> +
> +Optional properties
> +-------------------
> +
> +These properties may not be supported by all I3C master drivers. Each I3C
> +master bindings should specify which of them are supported.
> +
> +- i3c-scl-hz: frequency of the SCL signal used for I3C transfers.
> +	      When undefined the core sets it to 12.5MHz.
> +
> +- i2c-scl-hz: frequency of the SCL signal used for I2C transfers.
> +	      When undefined, the core looks at LVR (Legacy Virtual Register)
> +	      values of I2C devices described in the device tree to determine
> +	      the maximum I2C frequency.
> +
> +I2C devices
> +===========
> +
> +Each I2C device connected to the bus should be described in a subnode. All
> +properties described in Documentation/devicetree/bindings/i2c/i2c.txt are
> +valid here, but several new properties have been added.
> +
> +New constraint on existing properties:
> +--------------------------------------
> +- reg: contains 3 cells
> +  + first cell : still encoding the I2C address
> +
> +  + second cell: should have bit 31 set to 1 signify that this is an I2C
> +		 device. Bits 0 to 7 encode the I3C LVR (Legacy Virtual
> +		 Register):
> +
> +	bit[7:5]: I2C device index. Possible values
> +	* 0: I2C device has a 50 ns spike filter
> +	* 1: I2C device does not have a 50 ns spike filter but supports high
> +	     frequency on SCL
> +	* 2: I2C device does not have a 50 ns spike filter and is not tolerant
> +	     to high frequencies
> +	* 3-7: reserved
> +
> +	bit[4]: tell whether the device operates in FM (Fast Mode) or FM+ mode
> +	* 0: FM+ mode
> +	* 1: FM mode
> +
> +	bit[3:0]: device type
> +	* 0-15: reserved
> +
> +  + third cell: should be 0
> +
> +I3C devices
> +===========
> +
> +All I3C devices are supposed to support DAA (Dynamic Address Assignment), and
> +are thus discoverable. So, by default, I3C devices do not have to be described
> +in the device tree.
> +This being said, one might want to attach extra resources to these devices,
> +and those resources may have to be described in the device tree, which in turn
> +means we have to describe I3C devices.
> +
> +Another use case for describing an I3C device in the device tree is when this
> +I3C device has a static address and we want to assign it a specific dynamic
> +address before the DAA takes place (so that other devices on the bus can't

static is I2C address and dynamic is an I3C address. That could be 
clearer throughout.

> +take this dynamic address).
> +
> +The I3C device should be names <device-type>@<static-address>,<i3c-pid>,

s/static-address/static-i2c-address/

> +where device-type is describing the type of device connected on the bus
> +(gpio-controller, sensor, ...).
> +
> +Required properties
> +-------------------
> +- reg: contains 3 cells
> +  + first cell : encodes the I2C address. Should be 0 if the device does not
> +		 have one (0 is not a valid I3C address).

Change here to "encodes the static I2C address". 

0 is not a valid I2C address?

> +
> +  + second and third cells: should encode the ProvisionalID. The second cell
> +			    contains the manufacturer ID left-shifted by 1.
> +			    The third cell contains ORing of the part ID
> +			    left-shifted by 16, the instance ID left-shifted
> +			    by 12 and the extra information. This encoding is
> +			    following the PID definition provided by the I3C
> +			    specification.
> +
> +Optional properties
> +-------------------
> +- assigned-address: dynamic address to be assigned to this device. This
> +		    property is only valid if the I3C device has a static
> +		    address (first cell of the reg property != 0).
> +
> +
> +Example:
> +
> +	i3c-master@d040000 {
> +		compatible = "cdns,i3c-master";
> +		clocks = <&coreclock>, <&i3csysclock>;
> +		clock-names = "pclk", "sysclk";
> +		interrupts = <3 0>;
> +		reg = <0x0d040000 0x1000>;
> +		#address-cells = <3>;
> +		#size-cells = <0>;
> +
> +		status = "okay";
> +		i2c-scl-frequency = <100000>;
> +
> +		/* I2C device. */
> +		nunchuk: nunchuk@52 {
> +			compatible = "nintendo,nunchuk";
> +			reg = <0x52 0x80000010 0x0>;
> +		};
> +
> +		/* I3C device with a static address. */
> +		thermal_sensor: sensor@68,39200144004 {
> +			reg = <0x68 0x392 0x144004>;
> +			assigned-address = <0xa>;
> +		};
> +
> +		/*
> +		 * I3C device without a static address but requiring resources
> +		 * described in the DT.
> +		 */
> +		sensor@0,39200154004 {
> +			reg = <0x0 0x392 0x154004>;
> +			clocks = <&clock_provider 0>;
> +		};
> +	};
> +
> -- 
> 2.14.1
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

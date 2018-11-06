Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 172A77D089
	for <lwn-linux-doc@archive.lwn.net>; Tue,  6 Nov 2018 19:07:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730681AbeKGEe3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 6 Nov 2018 23:34:29 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:33929 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730680AbeKGEe3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Nov 2018 23:34:29 -0500
Received: by mail-pg1-f193.google.com with SMTP id k1-v6so6236571pgq.1
        for <linux-doc@vger.kernel.org>; Tue, 06 Nov 2018 11:07:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZOPVA8zFxyK+6MVWH3nLDhrgWskDUoQalnpwOfFk3AU=;
        b=ZNq6v4KZhJTA5zOs0vX1IhGQqBJo6kEvRnCKyzzQWMVPHk7G46fm2N02ORHkYDtMcN
         uLdHg3YuHoAFyI/FGYm7LHOOTVFR6VZvFOXhGn8YuG3hlvccL6H19pT+RyViOXgB20h6
         R4gUR7A3mgSt9kSwR6tTlVBPy9nLzp1/ST51cgjkdmgySQ65QjvjzVUg3J7gN4mUo/TB
         61LcUKLcIDPzBspRiRYDoI3MnTV3QwOIEYc9H43uccS867dV3E6TIlKzFbFzYknjyQ8+
         QsTjxeVqxlb6wdsRzwUUkhbQxZE37agFdLHJYjKaQ3mKJ8QAfnMDPqXqkS92OeJozEtS
         ayPA==
X-Gm-Message-State: AGRZ1gKLL07KxTxS+YYdW3UIoLgstV7v4L/LvVtJ86iJ99PHZPXG3KED
        6GTRJgUHQTGDHZZOGdUU/flvAw==
X-Google-Smtp-Source: AJdET5fM5sDJgsuob/XDerJ9Kfr762VoB2NvOIox+0aZVi9VDqaccpzJ93a2YBLj7hHncbqGryyJYw==
X-Received: by 2002:a63:df13:: with SMTP id u19mr5050865pgg.294.1541531269616;
        Tue, 06 Nov 2018 11:07:49 -0800 (PST)
Received: from localhost ([207.114.172.147])
        by smtp.gmail.com with ESMTPSA id g72-v6sm62414597pfd.181.2018.11.06.11.07.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Nov 2018 11:07:48 -0800 (PST)
Date:   Tue, 6 Nov 2018 11:07:47 -0800
From:   Moritz Fischer <mdf@kernel.org>
To:     richard.gong@linux.intel.com
Cc:     gregkh@linuxfoundation.org, catalin.marinas@arm.com,
        will.deacon@arm.com, dinguyen@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, atull@kernel.org, mdf@kernel.org,
        arnd@arndb.de, corbet@lwn.net,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-fpga@vger.kernel.org,
        linux-doc@vger.kernel.org, todd.riffel@intel.com,
        richard.gong@intel.com
Subject: Re: [PATCHv10 4/8] dt-bindings: fpga: add Stratix10 SoC FPGA manager
 binding
Message-ID: <20181106190747.GA5690@archbook>
References: <1541523172-5171-1-git-send-email-richard.gong@linux.intel.com>
 <1541523172-5171-5-git-send-email-richard.gong@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1541523172-5171-5-git-send-email-richard.gong@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Richard,

On Tue, Nov 06, 2018 at 10:52:48AM -0600, richard.gong@linux.intel.com wrote:
> From: Alan Tull <atull@kernel.org>
> 
> Add a Device Tree binding for the Intel Stratix10 SoC FPGA manager.
> 
> Signed-off-by: Alan Tull <atull@kernel.org>
> Signed-off-by: Richard Gong <richard.gong@intel.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Moritz Fischer <mdf@kernel.org>
> ---
> v2: this patch is added in patch set version 2
> v3: change to put fpga_mgr node under firmware/svc node
> v4: s/fpga-mgr@0/fpga-mgr/ to remove unit_address
>     add Richard's signed-off-by
> v5: add Reviewed-by Rob Herring
> v6: no change
> v7: no change
> v8: no change
> v9: no change
> v10: no change
> ---
>  .../bindings/fpga/intel-stratix10-soc-fpga-mgr.txt      | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/fpga/intel-stratix10-soc-fpga-mgr.txt
> 
> diff --git a/Documentation/devicetree/bindings/fpga/intel-stratix10-soc-fpga-mgr.txt b/Documentation/devicetree/bindings/fpga/intel-stratix10-soc-fpga-mgr.txt
> new file mode 100644
> index 0000000..6e03f79
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/fpga/intel-stratix10-soc-fpga-mgr.txt
> @@ -0,0 +1,17 @@
> +Intel Stratix10 SoC FPGA Manager
> +
> +Required properties:
> +The fpga_mgr node has the following mandatory property, must be located under
> +firmware/svc node.
> +
> +- compatible : should contain "intel,stratix10-soc-fpga-mgr"
> +
> +Example:
> +
> +	firmware {
> +		svc {
> +			fpga_mgr: fpga-mgr {
> +				compatible = "intel,stratix10-soc-fpga-mgr";
> +			};
> +		};
> +	};
> -- 
> 2.7.4
> 
Thanks,
Moritz

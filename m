Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C173D7D57F
	for <lwn-linux-doc@archive.lwn.net>; Mon, 10 Sep 2018 18:16:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727998AbeIJXLc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 10 Sep 2018 19:11:32 -0400
Received: from mail-oi0-f66.google.com ([209.85.218.66]:35407 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726755AbeIJXLc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Sep 2018 19:11:32 -0400
Received: by mail-oi0-f66.google.com with SMTP id m11-v6so42058187oic.2;
        Mon, 10 Sep 2018 11:16:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DOtMaM82IZTVqmXs3l1GX72EOchfCwYYWv9WfsnCDJY=;
        b=mQsAUZbqfB1Ecu5ACyi0c3ZYow+vHkQcMH/tRZmJYN2vKiIaxlUqB1KzAGqDB5788Z
         bCaoojiP46vTaZIG1ktyJwnaTNIEPKv19RSyim4lmiuH8spbidOAHyX/hcf8e57ORSEb
         LehRHE2Rutphu2EPB9DQrfcTbHbk2qOjJbrEw3eHUVWJlCoglrCaNxDwgLgW02cRfV60
         W1d0XuPS8F8D1phr2GHcgvlvK83NJjNlDaIUw3dcHJKMGuKVrlj9Bn1ciPe/1tjGtklw
         hHpZEeGN9c0mfboH1qaTec5BlUWjE9q4h4xGXv90JrUZWoTvO1hI7t35jaSyKIHJUOZL
         YS3g==
X-Gm-Message-State: APzg51CuQPKXGVOShBtyTE1HbkBGYjOEEAi3o2oTyB9goxrtuh7qvVIo
        YFNk1uNeg+tyevbA+lKK4Q==
X-Google-Smtp-Source: ANB0VdbCDZw7ooN+GHdDG5yYdDuT0ZrHtHvMVPzbGuQz58y8RfMzX7R9GM1cEsCdZrfHM742WcBlcw==
X-Received: by 2002:aca:cf44:: with SMTP id f65-v6mr24430067oig.356.1536603372478;
        Mon, 10 Sep 2018 11:16:12 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s145-v6sm33180305oih.16.2018.09.10.11.16.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Sep 2018 11:16:10 -0700 (PDT)
Date:   Mon, 10 Sep 2018 13:16:10 -0500
From:   Rob Herring <robh@kernel.org>
To:     Eddie James <eajames@linux.vnet.ibm.com>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, jdelvare@suse.com,
        linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org,
        gregkh@linuxfoundation.org, mark.rutland@arm.com,
        linux@roeck-us.net, joel@jms.id.au, benh@kernel.crashing.org
Subject: Re: [PATCH v5 01/10] dt-bindings: fsi: Add P9 OCC device
 documentation
Message-ID: <20180910181610.GA5907@bogus>
References: <1535664761-86018-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1535664761-86018-2-git-send-email-eajames@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1535664761-86018-2-git-send-email-eajames@linux.vnet.ibm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 30, 2018 at 04:32:32PM -0500, Eddie James wrote:
> Document the bindings for the FSI-attached POWER9 On-Chip Controller.
> 
> Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
> ---
>  Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
> 
> diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
> new file mode 100644
> index 0000000..46372f6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
> @@ -0,0 +1,15 @@
> +Device-tree bindings for FSI-attached POWER9 On-Chip Controller (OCC)
> +---------------------------------------------------------------------
> +
> +This is the binding for the P9 On-Chip Controller accessed over FSI from a
> +service processor. See fsi.txt for details on bindings for FSI slave and CFAM
> +nodes.
> +
> +Required properties:
> + - compatible = "ibm,p9-occ"
> +
> +Examples:
> +
> +    occ {

FSI slave devices are supposed to have an address according to the 
binding doc.

> +        compatible = "ibm,p9-occ";
> +    };
> -- 
> 1.8.3.1
> 

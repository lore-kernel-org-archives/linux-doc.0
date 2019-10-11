Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0400E7D982
	for <lwn-linux-doc@archive.lwn.net>; Fri, 11 Oct 2019 03:01:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbfJKDAT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 10 Oct 2019 23:00:19 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:32930 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726702AbfJKDAT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Oct 2019 23:00:19 -0400
Received: by mail-pg1-f194.google.com with SMTP id i76so4922643pgc.0
        for <linux-doc@vger.kernel.org>; Thu, 10 Oct 2019 20:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=nP3GB4eev/Uw/7TzzPBf7q6vVOFurBjXFqfQUZ+MDGI=;
        b=KzBWLKoFEXWJXPLXk8rihO70idubrVY0AvebVOxegnFY86QJmJGnQAku+lqeexuYjB
         9G74EjZ5ZvlXtWdwx6WwfpqvWL6VZhkBTLucMGD8v4+2hORNhyJnUiBwwpBCF8JxvYyl
         Y/VEUCQaO4qMcQjX25jnBmyNowejWuBTvCczZAtLpuYiP3fyFPOQUIuwfkc7KI12BXX2
         EwM6/7cZLGE5aW9q4v+KkZG7M4Ko8VEfRigsYkPSfXxu8CCT86YN8Kz/jywZSNG+JnPs
         /EYL79jv7SvwRhbBYvBe5MtI4NC0fHqrZX5X0RP9DTqt0mKF84SdidfQjH90hJrCfHuU
         JAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=nP3GB4eev/Uw/7TzzPBf7q6vVOFurBjXFqfQUZ+MDGI=;
        b=hhuxLXuaXCNMoMZrEvL81uGscxyFmTXXYjrpqJ4MnGqto9X0UwmWSuaM+BkoTvGLYB
         7gupXUUqvpEEUOc1GQdF1gR5+VZWTlk1WZbmyEPFc5rWSJ3Zqn+9Ntnok/7wX8TGb+2N
         IlkaPtSAKD4jqIWlYbDDb9JBkgJqa26RFNdozERptV7ZPxEVbjBTW4MRDaIimQlsI4H0
         yhj6Rgp6EgZ0DCEiALAcL6VLLZm23QVl4PYdKJIughflcwRolm5WHrBATFcY1puU6Qgs
         ZgmU9D2n/q9SGvldRI2aG+SYBcv17dKRj5w/GJ7SGRLwSCw9Y+h75rbN+dvBbAQslQYO
         5UYA==
X-Gm-Message-State: APjAAAXNF9O+lmF3XFMbX/8zDtXtqKO5uKFY7ofvZnRaeHEPdnvqevow
        L80puTqS0GURoK3vLZMkQVNZPsxZwXQ=
X-Google-Smtp-Source: APXvYqyC7PSkR8RT7VypdyqNldAyGXeW91322WLbhsrNNwrkgAMBn6eiIibb+JzCUjR+ko/vo+L6ow==
X-Received: by 2002:a65:688a:: with SMTP id e10mr13223631pgt.122.1570762818461;
        Thu, 10 Oct 2019 20:00:18 -0700 (PDT)
Received: from cakuba.netronome.com (c-73-202-202-92.hsd1.ca.comcast.net. [73.202.202.92])
        by smtp.gmail.com with ESMTPSA id q6sm8505284pgn.44.2019.10.10.20.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 20:00:18 -0700 (PDT)
Date:   Thu, 10 Oct 2019 20:00:02 -0700
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        netdev@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v9 3/5] mfd: ioc3: Add driver for SGI IOC3 chip
Message-ID: <20191010200002.5fe5f34f@cakuba.netronome.com>
In-Reply-To: <20191010145953.21327-4-tbogendoerfer@suse.de>
References: <20191010145953.21327-1-tbogendoerfer@suse.de>
        <20191010145953.21327-4-tbogendoerfer@suse.de>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 10 Oct 2019 16:59:49 +0200, Thomas Bogendoerfer wrote:
>  	dev = alloc_etherdev(sizeof(struct ioc3_private));
> -	if (!dev) {
> -		err = -ENOMEM;
> -		goto out_disable;
> -	}
> -
> -	if (pci_using_dac)
> -		dev->features |= NETIF_F_HIGHDMA;

Looks like the NETIF_F_HIGHDMA feature will not longer be set, is that
okay?

> -	err = pci_request_regions(pdev, "ioc3");
> -	if (err)
> -		goto out_free;
> +	if (!dev)
> +		return -ENOMEM;
>  
>  	SET_NETDEV_DEV(dev, &pdev->dev);
>  
>  	ip = netdev_priv(dev);
> -	ip->dev = dev;
> -	ip->dma_dev = &pdev->dev;
> -
> -	dev->irq = pdev->irq;
> +	ip->dma_dev = pdev->dev.parent;
> +	ip->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (!ip->regs) {
> +		err = -ENOMEM;
> +		goto out_free;
> +	}


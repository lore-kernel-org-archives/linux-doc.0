Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8F8397D982
	for <lwn-linux-doc@archive.lwn.net>; Fri,  4 Oct 2019 14:41:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389155AbfJDOlA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 4 Oct 2019 10:41:00 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34774 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389224AbfJDOkw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Oct 2019 10:40:52 -0400
Received: by mail-wr1-f65.google.com with SMTP id j11so1755544wrp.1
        for <linux-doc@vger.kernel.org>; Fri, 04 Oct 2019 07:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=bVYB3iaBKu6hqEMy7IiK8W2xGcuTKRwNP5QMtv3wYFQ=;
        b=tJopKaUBlABenT4ylmGSDy+I7t0hIGjesgfpNtSX0xCQ4wdftG4tbz0fWZ1ZW9yfVn
         qnor0XLIlQJe3nszHCPcuh5nQF/kpXBia4CYizl15KL/+djYfrXQCqNMoFvQkeb6xbw8
         9iDF6a1qCpXZ3KfIzHm/41NSPoHZpt5eZ3UhrCrZ9FFeb3HlSVchIWIPy0R6jWISxeIq
         xgc7P2GJSJ+8CZTFUhR1PjY5KCBKUXCNlGxEt2BIY8/Zf41oIgMW961ZPQJPVlqK1QeW
         OwRJz1zdzDOjxWO6iC7SjAGCOC3mJ59hlp8jnqGV0O0w1TbvbSZIGWMp6u3cQ7sMyrih
         0/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=bVYB3iaBKu6hqEMy7IiK8W2xGcuTKRwNP5QMtv3wYFQ=;
        b=hn0fKovHjwCx+37JpzCPohYHwCw5h0pO+HACmOOJ5VVQaJ2Z+kuWiz2VXsNuA/LHdt
         gfu9/Z7tf+pgK3Rd5o50VEtQV2sjnBGBB1SvBrwYOfAxcm5S3xNC/vc26/dm8zblk+fP
         Zx8NC+knev+425bisuA6H18vgAjXOxTBprK1ENXm+RNu1dKUBsYKsVvCLTIlR8TL9u6o
         fReMMGSDL4faNzSX1QGTZ0aogOIsOv+JGJTnItLqh8YdzmGv0X57SdmQ8BzR6rrlbxPt
         4Qt3BXXjII5QXPO6ts+Jx+OsYz37pqq0hPIYqO816t4aRKOk1QUb+9YlHRV4rHWgGWsG
         5AYQ==
X-Gm-Message-State: APjAAAUHTTTXlLGgiST1WHxsTgsPOQXXlyFcV5lUqm8MXaJ0dcnmU6z6
        Qqg6qc5IlB1Ef5e7kl06MvYvEQ==
X-Google-Smtp-Source: APXvYqy9slbJZlb7IwHee5m1NXEKgsFSSD+s3ZkGv7TbF7FJLKEyUO3VrYbQ2U8x31bmys0HDopIvg==
X-Received: by 2002:adf:97cb:: with SMTP id t11mr5495100wrb.312.1570200049218;
        Fri, 04 Oct 2019 07:40:49 -0700 (PDT)
Received: from dell ([2.27.167.122])
        by smtp.gmail.com with ESMTPSA id r2sm5638979wrm.3.2019.10.04.07.40.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2019 07:40:48 -0700 (PDT)
Date:   Fri, 4 Oct 2019 15:40:46 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     kbuild test robot <lkp@intel.com>
Cc:     Thomas Bogendoerfer <tbogendoerfer@suse.de>, kbuild-all@01.org,
        Jonathan Corbet <corbet@lwn.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        netdev@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v6 3/4] mfd: ioc3: Add driver for SGI IOC3 chip
Message-ID: <20191004144046.GP18429@dell>
References: <20190923114636.6748-4-tbogendoerfer@suse.de>
 <201909232145.eyOJqt2k%lkp@intel.com>
 <20191004143718.GM18429@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191004143718.GM18429@dell>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> >    drivers//mfd/ioc3.c: In function 'ioc3_eth_setup':
> > >> drivers//mfd/ioc3.c:281:54: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'resource_size_t {aka unsigned int}' [-Wformat=]
> >        sizeof(ioc3_w1_platform_data.dev_id), "ioc3-%012llx",
> >                                                    ~~~~~~^
> >                                                    %012x
> >        ipd->pdev->resource->start);
> >        ~~~~~~~~~~~~~~~~~~~~~~~~~~                         
> 
> I assume you plan on fixing this Thomas?

Ah, I see the new set - ignore this.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

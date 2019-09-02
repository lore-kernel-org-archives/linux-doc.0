Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CF2AF7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Mon,  2 Sep 2019 09:40:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731229AbfIBJk1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 2 Sep 2019 05:40:27 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52891 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731224AbfIBJk1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 2 Sep 2019 05:40:27 -0400
Received: by mail-wm1-f68.google.com with SMTP id t17so13787922wmi.2
        for <linux-doc@vger.kernel.org>; Mon, 02 Sep 2019 02:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=iifGZMpQV6Q3Nf2FisGpoD7UwukxL/0AVB68SuFmS0Q=;
        b=bwA9kUL60mjWtPOOWDrB79uuGqR9VnOx5Yr9aCS44l66Uk/PU4luTGcMgX2j+KMwL9
         8Cic5YpYp5busLyPMqZkUBYjfRGw+exRs5PZJfsvu/rWyc9tN9LOHeMBXvjwJy85mBji
         VkydsaCO809MVfGAeYcvB18PU0WlY2gNMHxLl7KaolxXWlkrGpxEnhA8wpBcEnBXSKCF
         k9qWp5VQQ5qpimO8EnZpBEN4wzYxIQKQmBvNUud8RwQObFJYkJdNpVzLrA+8OWpvFKlm
         MDipgDzjbhnEwJD2nRoH20SuYf7dfmzFNJVPivn3dtvMzhN4dQJjoHJxKkKLgBlbUtSP
         RkQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=iifGZMpQV6Q3Nf2FisGpoD7UwukxL/0AVB68SuFmS0Q=;
        b=Xipusyt/o6WvZg8Qm4vB7E+85ah+0iJMzqSiOIBb1d/jqJDDnaaULTrLYur5VLMgUD
         NG4RQf1lkPCtniMzergoSexsTtzwm2/9w4lV+urT8cxc3KLdgUTq7TKH50P9ejdW5y70
         pV0HFL6IYxBa5c2mu9OxeKF3XCks2PAXtxkN6WZd8cs0vlBYG7dTMz+g/JjqIlqL0WnR
         iW+qo2f6KXWSaayWs0wjUP1roYSezJ7Gfwl6BKIHNPwliZZkSJMm3KN/J1ITMMqurr+I
         ZKRtuCm1sUsKZJMB+1me6U0bJ040UBGPspwhadhlHcPkqOIsebs+rVfoJ+smYq+3nGHm
         N24A==
X-Gm-Message-State: APjAAAWz1KbAakTTyp5TpPVYw39rgrxI7WMXLgwF1+YrVyFak9MasSY8
        sJw1O1O2dP1lPR9UfPmSodLW8Q==
X-Google-Smtp-Source: APXvYqxSOUGY9E1wZpKgjkViI6t3D6h4EFwO07OwMRVO+Sk6d4PG7Uu11p4XzMynDLxDlAkEP41+QA==
X-Received: by 2002:a7b:ca50:: with SMTP id m16mr8080701wml.158.1567417225074;
        Mon, 02 Sep 2019 02:40:25 -0700 (PDT)
Received: from dell ([95.147.198.93])
        by smtp.gmail.com with ESMTPSA id c6sm17020244wrb.60.2019.09.02.02.40.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Sep 2019 02:40:24 -0700 (PDT)
Date:   Mon, 2 Sep 2019 10:40:22 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Fabien Lahoudere <fabien.lahoudere@collabora.com>
Cc:     gwendal@chromium.org, egranata@chromium.org, kernel@collabora.com,
        William Breathitt Gray <vilhelm.gray@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Nick Vaccaro <nvaccaro@chromium.org>,
        linux-iio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] counter: cros_ec: Add synchronization sensor
Message-ID: <20190902094022.GK32232@dell>
References: <cover.1566563833.git.fabien.lahoudere@collabora.com>
 <d985a8a811996148e8cda78b9fe47bb87b884b56.1566563833.git.fabien.lahoudere@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d985a8a811996148e8cda78b9fe47bb87b884b56.1566563833.git.fabien.lahoudere@collabora.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 23 Aug 2019, Fabien Lahoudere wrote:

> From: Gwendal Grignou <gwendal@chromium.org>
> 
> EC returns a counter when there is an event on camera vsync.
> This patch comes from chromeos kernel 4.4
> 
> Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
> Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.com>
> 
> CROS EC sync sensor was originally designed as an IIO device.
> Now that the counter subsystem will replace IIO_COUNTER, we
> have to implement a new way to get sync count.
> 
> Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.com>
> ---
>  Documentation/driver-api/generic-counter.rst  |   3 +
>  MAINTAINERS                                   |   7 +
>  drivers/counter/Kconfig                       |   9 +
>  drivers/counter/Makefile                      |   1 +
>  drivers/counter/counter.c                     |   2 +
>  drivers/counter/cros_ec_sensors_sync.c        | 208 ++++++++++++++++++
>  .../cros_ec_sensors/cros_ec_sensors_core.c    |   1 +

>  drivers/mfd/cros_ec_dev.c                     |   3 +

I can't see any reason for this change to be squashed into this patch.

Please separate it out.

>  include/linux/counter.h                       |   1 +
>  9 files changed, 235 insertions(+)
>  create mode 100644 drivers/counter/cros_ec_sensors_sync.c

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

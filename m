Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7A7AB7DE78
	for <lwn-linux-doc@archive.lwn.net>; Fri, 20 Apr 2018 08:06:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754279AbeDTIGP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 20 Apr 2018 04:06:15 -0400
Received: from mail-wr0-f194.google.com ([209.85.128.194]:36984 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754424AbeDTIFh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 Apr 2018 04:05:37 -0400
Received: by mail-wr0-f194.google.com with SMTP id f14-v6so20493097wre.4
        for <linux-doc@vger.kernel.org>; Fri, 20 Apr 2018 01:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=ejgi9B3fG0bjnS2ccBeEoEjRv1hErslLx0MbRDWfLlw=;
        b=U/qDr16deBCmqktVtaNe1igcTc9Beq1TFjroJpZfCDbeiGeXtwK11hbgNHD/WeSZaZ
         5j3NYH8O1G70rKsiH5DdmLxpjVJRPYWtViZKZJo5VB7B23Rwbde299ts/LAtlbArSPcx
         lhs3O574dsPw4ACnUj8HJwnSLgQYpEvVKNzHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=ejgi9B3fG0bjnS2ccBeEoEjRv1hErslLx0MbRDWfLlw=;
        b=CJXh+MCVp/MqVyr24DXzNkEZDma1kf8y8kMtTAFWf2fc/VgBAMrsNShOeIVbzPDhij
         1My+l9cccgYZuVRyoRjEOzZtDEdtJu1zxXIDAaJVLlMakpqll++Id7OvQRVQZYAPCZrB
         YrNo60YLzGsf+UzZH8bTp4aRE9DhAcPC+9RMrkJFJ7mhqwB7pmii7Isn7IbJkfG1ADtM
         2u538BkmHPqXqFCRmGHZ841o7/485tOXrkwD/oGv2JRoQayPucQvV6m/VCyj906OpGR2
         k7+BDNTb0B1ONQhp/abCxV+aq+wE0ZeFCy5OLHz997HH062IkZLS1Lrt2YkIsfZa1dx3
         U+XA==
X-Gm-Message-State: ALQs6tBOPQT5xjAVpa3IPmg4SBtmeprlNATk430czsRSnXQPnbDs7DL1
        cHPyCuDXa21t3JarqtpHrz8krA==
X-Google-Smtp-Source: AIpwx4+Qmz4esnDJtXvV7H49Kc5s6MTL8w8IfUK4TnrlZhzwTE+IjYUbkZ/c8fK7O8zjWQDDjmDjtg==
X-Received: by 2002:adf:c992:: with SMTP id f18-v6mr7281135wrh.202.1524211536113;
        Fri, 20 Apr 2018 01:05:36 -0700 (PDT)
Received: from dell ([2.27.167.70])
        by smtp.gmail.com with ESMTPSA id 2-v6sm8642009wrb.22.2018.04.20.01.05.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Apr 2018 01:05:35 -0700 (PDT)
Date:   Fri, 20 Apr 2018 09:05:33 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, Peter Korsgaard <jacmet@sunsite.dk>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] i2c: i2c-ocores: move header to platform_data
Message-ID: <20180420080533.ohryzn7wkg4525os@dell>
References: <20180419200015.15095-1-wsa@the-dreams.de>
 <20180419200015.15095-4-wsa@the-dreams.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180419200015.15095-4-wsa@the-dreams.de>
User-Agent: NeoMutt/20170609 (1.8.3)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 19 Apr 2018, Wolfram Sang wrote:

> This header only contains platform_data. Move it to the proper directory.
> 
> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
> ---
>  Documentation/i2c/busses/i2c-ocores            | 2 +-
>  drivers/i2c/busses/i2c-ocores.c                | 2 +-
>  drivers/mfd/timberdale.c                       | 2 +-
>  include/linux/{ => platform_data}/i2c-ocores.h | 0
>  4 files changed, 3 insertions(+), 3 deletions(-)
>  rename include/linux/{ => platform_data}/i2c-ocores.h (100%)

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

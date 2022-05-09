Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 852CEC43219
	for <linux-doc@archiver.kernel.org>; Mon,  9 May 2022 08:08:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232959AbiEIIMK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 9 May 2022 04:12:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236385AbiEIHvw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 May 2022 03:51:52 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FF0718E23
        for <linux-doc@vger.kernel.org>; Mon,  9 May 2022 00:48:00 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id q76so11327526pgq.10
        for <linux-doc@vger.kernel.org>; Mon, 09 May 2022 00:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mYnZGAd7FuQyJH1dHzG4ymwHNLzd07B0jtRHnz1RxL8=;
        b=Lre8Id4MjltGcSnxfGxWoQ/hLu5n3UZjAdiPPQi/7EkrV1jhNizdjkm+bkkshS7gK/
         vcM7MfLpR/stOX03M1N1XlqAmJHotaOk0J/0ifb41k1U4R/dckkHDUDT5LbNcgVqscxw
         686fc7NN7EB/9Ji3cABq32cTRTz3tJTLV7h31H9gBLSGZuMKQIYaXMQJPYf0VPiRghmW
         HAqeEKrB3xTK07giQ6BuSgk3G8DHDS5ioPWS0MXPKZycmhTBe9av43U8pagGUysMF4po
         WuIIOeNhIK6F7L1egVcGt7Gj3KDo4epZOm+0jHDhLTGbAPnuT4l/PIzksMC2CNLO38cx
         ogcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mYnZGAd7FuQyJH1dHzG4ymwHNLzd07B0jtRHnz1RxL8=;
        b=0d2cE0yKJ1P6j4dJOvrQQ2epAvMkib2uigazcQlUr+VJ/dQ8tbuv6kL4LCHANl5TWW
         38BRKFB8BqXiZjjigYdzw98ecOFdHAGsn+nvOrRUAoxkbkDWtmMmt9MxAapNJinGPfVh
         N8RWHjrCpV+3l7PJ4Hhk+/0D1ETvICLHc15l44S3YPPMg/qQl9mUThYYhPryZXFJIgDL
         G7kK0qJOHOvxfPdL8hgFMu9xkhdcDBjUxgigZKtXyRlKgZEUuat31Un/x8fmfgTZsgR0
         4S86uHwB5g67AfwseX9zhKVuG+dUvf4Ng1SoAW7/rSWr+hCBqB0BSxIlT5QtG/vi1Giu
         072A==
X-Gm-Message-State: AOAM532q16VLRVrXHMfF7J6YYdymWIYBv1XKQ589FB6euuOoDHtjl6zr
        rur5jLx4j98kTWjgAxmSyHI=
X-Google-Smtp-Source: ABdhPJwwAq0UnDiUjWJSFg3vEcEvF1dIXHw/F2nZq3WsOjvCEYpOsZqe2LueAqks2zEjzHkE1vSv4g==
X-Received: by 2002:a63:4e62:0:b0:398:cb40:19b0 with SMTP id o34-20020a634e62000000b00398cb4019b0mr12365324pgl.445.1652082479857;
        Mon, 09 May 2022 00:47:59 -0700 (PDT)
Received: from localhost (subs03-180-214-233-79.three.co.id. [180.214.233.79])
        by smtp.gmail.com with ESMTPSA id r125-20020a632b83000000b003aa8b87feb5sm7951056pgr.0.2022.05.09.00.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 00:47:59 -0700 (PDT)
Date:   Mon, 9 May 2022 14:47:56 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Yanteng Si <siyanteng01@gmail.com>
Cc:     mpatocka@redhat.com, colin.king@canonical.com,
        ross.zwisler@linux.intel.com, dan.carpenter@oracle.com,
        dan.j.williams@intel.com, msnitzer@redhat.com, corbet@lwn.net,
        linux-doc@vger.kernel.org, Yanteng Si <siyanteng@loongson.cn>
Subject: Re: [PATCH] docs/admin-guide: Add the necessary blank lines to the
 writecache
Message-ID: <YnjHLBhf6Z5u0Htx@debian.me>
References: <20211209092223.561740-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211209092223.561740-1-siyanteng@loongson.cn>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Dec 09, 2021 at 05:22:23PM +0800, Yanteng Si wrote:
> diff --git a/Documentation/admin-guide/device-mapper/writecache.rst b/Documentation/admin-guide/device-mapper/writecache.rst
> index 10429779a91a..6bf78b0446ac 100644
> --- a/Documentation/admin-guide/device-mapper/writecache.rst
> +++ b/Documentation/admin-guide/device-mapper/writecache.rst
> @@ -20,6 +20,7 @@ Constructor parameters:
>     size)
>  5. the number of optional parameters (the parameters with an argument
>     count as two)
> +
>  	start_sector n		(default: 0)
>  		offset from the start of cache device in 512-byte sectors
>  	high_watermark n	(default: 50)
 
I think the paragraph before optional parameters lists should be
terminated with colon.

-- 
An old man doll... just what I always wanted! - Clara

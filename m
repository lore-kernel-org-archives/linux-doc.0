Return-Path: <SRS0=cy2k=32=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B35AC2D0B1
	for <linux-doc@archiver.kernel.org>; Thu,  6 Feb 2020 09:13:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6D904206CC
	for <linux-doc@archiver.kernel.org>; Thu,  6 Feb 2020 09:13:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GYL8bZM6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728308AbgBFJNM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 Feb 2020 04:13:12 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:45340 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727698AbgBFJNM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Feb 2020 04:13:12 -0500
Received: by mail-oi1-f194.google.com with SMTP id v19so3853443oic.12
        for <linux-doc@vger.kernel.org>; Thu, 06 Feb 2020 01:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1CpJKgsAjlSqoe4gELRsfhNNMyIPojRkXjDATWcGuu4=;
        b=GYL8bZM6NkTFf6TxXvu25c1GbCWB6hXWNKX734+SfLOA6BUhmqA8OgD+Zqpxp1Z1zN
         oWbkkotrLcWLHxhekWqahMoLG3W2ap0jg3hnncU5+sPs1DI1lM/qRzU4Z9I/onG39FHH
         U87i/i7nd8DXNiP/r/ZHnhm8XQwbuNmgflnjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1CpJKgsAjlSqoe4gELRsfhNNMyIPojRkXjDATWcGuu4=;
        b=bF6ivoisTYu5ei11yYXKTsb9eV2SqK9dQcMyvOaDT04erXZdU1qXaX0bXughSBL/dN
         dppfd8JYAAc6zit33nXA+Z0YYLu1I4RhG0+kl9jrrZruDh7OaYMnWZZYlby5XZlEeqsG
         avBWHkUdDviCmnjnzv3O6hViTbMvnIbUmgWGfI2RsHf+hEQYwPgX20vaXADNbK4OE7Gf
         QOGNE8+ykqIlYnkzxdw75hSdAlFhsOrlhWKV8kI3ZTJXaGvE0fJ5sV1s2WhgKI3dgfuX
         +Fkkmnm4a3BxWc/9LLkzOktxVWEMQu94LzVeW0Rdp+U7o4CwSLVc7aPQzcfDKz7dhxzK
         4Jkg==
X-Gm-Message-State: APjAAAWU63QGWquKXV9NwaNwcSeckvdYpaCPkKLNugm9Shz8NDfNv145
        zY8TYONK+fsKBCaF6rIu6GcW4g==
X-Google-Smtp-Source: APXvYqwkhyUAvVCT+rNa/7+99l/zd01X1+i693C/Ng8uMN/IvbeIkCoWD6oBCSLayQF3FRiTK8LTzw==
X-Received: by 2002:aca:cf12:: with SMTP id f18mr6247795oig.81.1580980391763;
        Thu, 06 Feb 2020 01:13:11 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a1sm913373oti.2.2020.02.06.01.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 01:13:10 -0800 (PST)
Date:   Thu, 6 Feb 2020 01:13:08 -0800
From:   Kees Cook <keescook@chromium.org>
To:     WeiXiong Liao <liaoweixiong@allwinnertech.com>
Cc:     Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org
Subject: Re: [PATCH v1 00/11] pstore: support crash log to block and mtd
 device
Message-ID: <202002060108.7389A4C@keescook>
References: <1579482233-2672-1-git-send-email-liaoweixiong@allwinnertech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1579482233-2672-1-git-send-email-liaoweixiong@allwinnertech.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jan 20, 2020 at 09:03:42AM +0800, WeiXiong Liao wrote:
> Why do we need to log to block (mtd) device?
> 1. Most embedded intelligent equipment have no persistent ram, which
>    increases costs. We perfer to cheaper solutions, like block devices.
> 2. Do not any equipment have battery, which means that it lost all data
>    on general ram if power failure. Pstore has little to do for these
>    equipments.
> 
> Why do we need mtdpstore instead of mtdoops?
> 1. repetitive jobs between pstore and mtdoops
>    Both of pstore and mtdoops do the same jobs that store panic/oops log.
> 2. do what a driver should do
>    To me, a driver should provide methods instead of policies. What MTD
>    should do is to provide read/write/erase operations, geting rid of codes
>    about chunk management, kmsg dumper and configuration.
> 3. enhanced feature
>    Not only store log, but also show it as files.
>    Not only log, but also trigger time and trigger count.
>    Not only panic/oops log, but also log recorder for pmsg, console and
>    ftrace in the future.

Hi! Sorry for the delay in my review of this series -- it's been a busy
couple of weeks for me. :) I'm still travelling this week, but I want to
give this a good review. I really like the idea of having a block device
backend for pstore; I'm excited to get this feature landed.

I think there may be a lot of redundancy between ramoops and the block
code in this series, but I suspect the refactoring of that can happen at
a later time. I'd like to get this reviewed and tested and see if I can
land it in the v5.7 merge window.

I hope to have time to focus on this next week once I'm back in my
normal timezone. ;)

Thanks again!

-Kees

-- 
Kees Cook

Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A05B8ECAAD8
	for <linux-doc@archiver.kernel.org>; Tue, 20 Sep 2022 04:35:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbiITEfn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 20 Sep 2022 00:35:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbiITEfm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Sep 2022 00:35:42 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F03AE4B0DB
        for <linux-doc@vger.kernel.org>; Mon, 19 Sep 2022 21:35:40 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id f23so1209979plr.6
        for <linux-doc@vger.kernel.org>; Mon, 19 Sep 2022 21:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date;
        bh=i59/vT+eKvRtgVVuKX+HNjnTJQOpM/VOpbaDLM/KWPQ=;
        b=JS5a75wfv5n6AUaS6YKb32wa2eFamvA1CNWX/F7ecmaoY6IshYr3fv1azW35bY8b86
         eNnuS4cKzqDhP69rOiPBrPGL6xawo9tg8I2Fryb18PESnvkqrxe569bocyvUZxp84Ghx
         46Iw9hUJHZuks8pue20Ol972YHoWvyvwg7JyYZTYCI/x4aKhVHSJ0dLmjhenZe9OrkQY
         tNv0Kv1gGzxjiaCNRvT+0OXu21OPUGofI1vr6u3o+i1Idnn8k3Pw3NWcjfB15bsD/9RE
         l996i2ZgnpYOa1cqNqsbe26otWsuwTZE3Uqg+SLLD9t/h0myyXsfXsQz6rTeRlPTOJ37
         jEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=i59/vT+eKvRtgVVuKX+HNjnTJQOpM/VOpbaDLM/KWPQ=;
        b=fYjdjy8iHui6GlCOH4JHich7oegwhmzFLUK0rjeCuVQCx0hD7xwAzeX3DKHqri45Cf
         EfenfRHJZP3OAGYmAuQ8SveBKJtKrzuaXHSaEFmdjqmqYPHklmegRp5LhwqfdkLpmqP9
         pVgFZojpL27X3DdntERtto9DnXIQp/sBSaqyQVGIe8z04XGThADbk5s6lGOHLpvxjOe2
         T6pXWiPqIO9T7v1zWIeLUeKCUIZ0gihgKtPAUtc9Smdoafc82qvFYh6hro+HMDoDRd3Y
         zp4i4rLECxKEDS9+1ex6c2eP/GHMPsegsmU1vson2owhgcYMDluW7dO4+LS3UfgFs8rf
         FVJQ==
X-Gm-Message-State: ACrzQf3tCvV/MyOD2DI5Q1bKy8sn5rUjYQWs/u2RXHOZJnEphNwOBxbD
        p5K/+6euiFVYb9A35cp98wo/YA3hIz0=
X-Google-Smtp-Source: AMsMyM74AA4y6N9OE+j+FoG3/m3QqZlFMmoEuh3F2EpYRgutVAl3vvTfV1OaTB3thUkOWGR//DYCPA==
X-Received: by 2002:a17:90a:7843:b0:203:5861:fc3d with SMTP id y3-20020a17090a784300b002035861fc3dmr1753651pjl.87.1663648540478;
        Mon, 19 Sep 2022 21:35:40 -0700 (PDT)
Received: from [192.168.11.9] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902f7cc00b00174f61a7d09sm251196plw.247.2022.09.19.21.35.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 21:35:40 -0700 (PDT)
Message-ID: <de7b2ac7-f61c-76e6-9c2b-f5e24f494a14@gmail.com>
Date:   Tue, 20 Sep 2022 13:35:36 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     linux-doc@vger.kernel.org
References: <20220919210403.jxvql3lwpeyhz7h4@meerkat.local>
Subject: Re: Overriding kernel version in built docs
Content-Language: en-US
From:   Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20220919210403.jxvql3lwpeyhz7h4@meerkat.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Mon, 19 Sep 2022 17:04:03 -0400, Konstantin Ryabitsev wrote:
> Hello:
> 
> Upon suggestion from Jakub Kicinski, we now build linux-next documentation and
> make it available at https://docs.kernel.org/next/. However, I want to make
> sure that we override the version string in the built docs so it doesn't say
> "6.0.0-rc6" but "next-20220919".
> 
> What's the proper way to do this, preferably via passing something to the
> "make htmldocs" command?

How about:

    make SPHINXOPTS="-D version=next-20220919 -q" htmldocs

?
"version" is a variable in Documentation/conf.py.

        Thanks, Akira

> 
> Regards,
> Konstantin


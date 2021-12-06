Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97514C433F5
	for <linux-doc@archiver.kernel.org>; Mon,  6 Dec 2021 15:14:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356761AbhLFPSQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Dec 2021 10:18:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357876AbhLFPQS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Dec 2021 10:16:18 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABCBBC08EBA9
        for <linux-doc@vger.kernel.org>; Mon,  6 Dec 2021 07:08:50 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id k64so2235640pfd.11
        for <linux-doc@vger.kernel.org>; Mon, 06 Dec 2021 07:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:references:subject:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Zqw/2bYSz2xoBV8+9vOGkwsgPNPb9d775rEDe4r8gYk=;
        b=gL08usKrKv5zQcu09xHJ5v/PU8OYUwjBAM3VVWC7n1zuSjBzevB+tZJflisJRaTKlS
         1yG5eeonfVNvPK0BzyfDbsfUmsYMtmyFqu3mOJhekhbOFUSel/flOjzxVrjF8jsnl8L1
         gfwgv8QhFVCQuZQbbXQ5qKf5EXL9FhUifTm3UVOFrTL9nYaI9EFxv+iNmz6bSl+y6+BR
         OxgPruhW7ja3tjNSzYwZO7NAoLsZRjx1MGHRk3nAAFq2RZvt7eONJhERfJPBpQrxcYPq
         xCOGt4YSyQVAtRyoccrEZo2KZMV8p1WibxxPZvr26XH/vDcWI/uqxwShxrLLh6SCsX1i
         KiLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:subject:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Zqw/2bYSz2xoBV8+9vOGkwsgPNPb9d775rEDe4r8gYk=;
        b=gIgv9wl5+M3setgmLS6CMn9fo/pSZmwXZFbH4nsXHEO6tn35Ng8pbwBQQpbygSrMQ+
         WvC3kWGvedivtawdQ8QkkE2D6kW2ZE2k4ZM/XLXe9kU18+UTSfvWNMumJs5r7esGqYCa
         P7oSvkY6Xqlwl2Y2vL+gokXu66Ibnvu/7Hqsp+xAco6kg/nL7jetgQ7wIJFzw62uwOYI
         nvjCHeTDaF6jyuctAhh4d7cJnRhbj/rGN+zMtpJQ08BGYu9+UWeXqeS7kwXh+E+HoclN
         XZKb/3nTIwlgidZP3L/kgwLKyiEFsV4hsW1LzRfeeiXE9WvooSWrp+E54052AK3ppRVW
         fOpg==
X-Gm-Message-State: AOAM533MOZJb4UEoDC6h2Y6swe219wYGqN8mhKi+mFODxV3Drn++jfGu
        bYmyE0Svi+n7uBHr1iD+T2zEb2D4ggQ=
X-Google-Smtp-Source: ABdhPJxnyCfbY03BS8bXL2XQWNUMjLAO76YsByO6y9yc/iLMbkHuS2NeaCfhALKmq9seOtgTjZf3kA==
X-Received: by 2002:a63:80c7:: with SMTP id j190mr18915690pgd.239.1638803329742;
        Mon, 06 Dec 2021 07:08:49 -0800 (PST)
Received: from [192.168.11.5] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id l1sm65080pgl.61.2021.12.06.07.08.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Dec 2021 07:08:49 -0800 (PST)
To:     Matthew Wilcox <willy@infradead.org>
Cc:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
References: <Ya4YvBcsxXLhjwRj@casper.infradead.org>
Subject: Re: css missing
From:   Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b4db5978-c6cd-edf0-fcd8-bb20aa0e2cbf@gmail.com>
Date:   Tue, 7 Dec 2021 00:08:44 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Ya4YvBcsxXLhjwRj@casper.infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Mon, 6 Dec 2021 14:05:48 +0000, Matthew Wilcox wrote:
> I don't know what changed to cause this (could be something in Debian,
> could be something in the kernel).
> 
> On August 16th, I generated a 'make htmldocs' that looks fine.
> Yesterday, I generated one and it's missing these two crucial lines
> (there are many other changes, but restoring these two lines to any
> given file makes it look fine):
> 
>    <link rel="stylesheet" href="../_static/css/theme.css" type="text/css" />
>    <link rel="stylesheet" href="../_static/pygments.css" type="text/css" />
> 
> I can't find any commits that look relevant.  I have sphinx 4.3.1-1
> installed.  I also tried with 4.2.0-5 with the same result.

I guess you have sphinx-rtd-theme 1.0.0 installed along the way.

It lost compatibility with Documentation/conf.py.

It has been fixed by commit d69dab7de208 ("docs: conf.py: fix support
for Readthedocs v 1.0.0") in docs-next branch of the -doc tree.
It is not merged upstream yet, though.

In the meantime, you can restore the css setting by downgrading
sphinx-rtd-theme by saying

    sphinx-rtd-theme<1.0

in requirements.txt.

Hope this helps.

BR, Akira


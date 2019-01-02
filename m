Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D0FB87D089
	for <lwn-linux-doc@archive.lwn.net>; Wed,  2 Jan 2019 16:28:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729566AbfABQ2K (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 2 Jan 2019 11:28:10 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46523 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726934AbfABQ2K (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Jan 2019 11:28:10 -0500
Received: by mail-wr1-f66.google.com with SMTP id l9so30985777wrt.13
        for <linux-doc@vger.kernel.org>; Wed, 02 Jan 2019 08:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=zoEN4e7FVLBdSCM0JYwFQBKnXFgM1dT6w5T9AKkbJH8=;
        b=BiIw0OXCrudcQU0jcN1txwA/8FRcTFQA1AxQR5YzktjRsEHIJIAbu5rYwEbu3m+CZ6
         YTm+fuD1qtRH9p3dY9OQrb3tzMg6q4R66WcI4x8WmgRVEpN7CEhjujAsotpvheB3dpLn
         OOqibQOGfEFtJRSqXhsOPJ2zDYrUPRHV6y1MY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=zoEN4e7FVLBdSCM0JYwFQBKnXFgM1dT6w5T9AKkbJH8=;
        b=XJq4oOGAFZBuXvYNXtGGGLRXkiDEfCmPO3DGvjcAVIW4ukHC8wQDNNp9Fj3vNPFT0m
         k8pt7f8kT6FgI9Wrs4ubJngU28Iv0l3jVXwv8KeZ/4If7nSxutDlbD+sJWWPq6ZPTjgx
         wpvsesTNniDJEqGE8g9YYlHEXQkmUZksEi9vi11PrTLuwKCy8tvntHB7QP3Yuk5L6rvE
         CgCkRiu17NuFeC7jeOu8MfxaP+UqHc4JevBwmO9/rOGZIK4lbNLmI6+frtppOBvMlnkL
         GrriH576VwkGJHSVZEMbkk2j0KJh6aIaX7ZQItVNObXda6ujwAilIrXniKsRCAGpC6tq
         DhIA==
X-Gm-Message-State: AJcUukeajEQYW2qnVrdGIaEKcUhDVB07cejrW0TQe39uyOZTxLXHCzFr
        lmgEY218ntj3UAgyxL1YMbx0HA==
X-Google-Smtp-Source: ALg8bN4Knmwz+1m6Bhl2vLnw8aluVF5FsOUZVpEBD7Oy4JrJMEHq4MEvNhH4pPqmINuLIlcdN+9Opw==
X-Received: by 2002:adf:9d08:: with SMTP id k8mr41141220wre.203.1546446488156;
        Wed, 02 Jan 2019 08:28:08 -0800 (PST)
Received: from [192.168.0.101] ([88.147.66.57])
        by smtp.gmail.com with ESMTPSA id x3sm39486974wrd.19.2019.01.02.08.28.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Jan 2019 08:28:07 -0800 (PST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Subject: Re: [PATCH V2 00/10] unify the interface of the proportional-share
 policy in blkio/io
From:   Paolo Valente <paolo.valente@linaro.org>
In-Reply-To: <20190102160328.GR2509588@devbig004.ftw2.facebook.com>
Date:   Wed, 2 Jan 2019 17:28:05 +0100
Cc:     'Paolo Valente' via bfq-iosched <bfq-iosched@googlegroups.com>,
        Angelo Ruocco <angelo.ruocco.90@gmail.com>,
        Jens Axboe <axboe@kernel.dk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Li Zefan <lizefan@huawei.com>,
        Angelo Ruocco <angeloruocco90@gmail.com>,
        Dennis Zhou <dennis@kernel.org>,
        Josef Bacik <josef@toxicpanda.com>,
        Liu Bo <bo.liu@linux.alibaba.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        linux-block <linux-block@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>, broonie@kernel.org,
        oleksandr@natalenko.name, cgroups@vger.kernel.org,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Content-Transfer-Encoding: 7bit
Message-Id: <CAFEB3AA-1E80-4A75-8B93-D3E4A46C30DB@linaro.org>
References: <7D7FAB43-5F62-4402-A9B3-E7C2E30AE680@linaro.org>
 <20181130184256.GI2509588@devbig004.ftw2.facebook.com>
 <5534B7D4-A5D9-4F44-9620-970A7F9EC140@linaro.org>
 <CADiTV-29TmkB5-k=TtQfoJqjP2Qv7GSsGLXAPBaTB6DoQ+6yyw@mail.gmail.com>
 <874A0232-2103-4364-BD88-F33B85D6A764@linaro.org>
 <20181218164126.GX2509588@devbig004.ftw2.facebook.com>
 <EC4F9B54-2352-4D85-B56C-5800CFEBCCB8@linaro.org>
 <A360EBDC-B297-4754-AF5C-0A6C30D725B4@linaro.org>
 <20181227234144.GE2509588@devbig004.ftw2.facebook.com>
 <F2A4E669-8C79-46D7-8A97-2C561FF5346B@linaro.org>
 <20190102160328.GR2509588@devbig004.ftw2.facebook.com>
To:     Tejun Heo <tj@kernel.org>
X-Mailer: Apple Mail (2.3445.102.3)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



> Il giorno 2 gen 2019, alle ore 17:03, Tejun Heo <tj@kernel.org> ha scritto:
> 
> Hello, Paolo.
> 
> On Sun, Dec 30, 2018 at 11:25:25AM +0100, Paolo Valente wrote:
>> What's the benefit of throwing away months of work, on which we agreed
>> before starting it, and that solves a problem already acknowledged by
>> interested parties?
> 
> Showing multiple conflicting numbers definitely isn't anything which
> is agreed upon.
> 

Sorry, of course you din't realize that sharing interface files had
this consequence, otherwise you'd have protested beforehand.

The problem is that this consequence seems unavoidable: if two
policies have different numbers to convey, through a shared interface
file, then they must be allowed to write their different numbers.  To
me, this doesn't sound like a problem.

The only other natural option is no unification, unless you have a
third way.

What do you prefer, or propose?

Thanks,
Paolo

> Thanks.
> 
> -- 
> tejun


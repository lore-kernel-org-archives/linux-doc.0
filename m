Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CEDA07D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 16 Apr 2019 08:21:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbfDPIVo (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 16 Apr 2019 04:21:44 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:34240 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726346AbfDPIVo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Apr 2019 04:21:44 -0400
Received: by mail-oi1-f196.google.com with SMTP id v10so16229029oib.1;
        Tue, 16 Apr 2019 01:21:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AL/EaRjpskLi3TMtHEKgZF7sShtrCvK4oAq4KWoJ4yQ=;
        b=Ez5okRZCWCQD9Z8hwEa+0+LnHuR1KSu4BRMryxaBoPw3W7YP5GQ2eRnEqmrDWqpnyl
         gfPL5NoLQZAqCDSvs3IOZ2DHBSj/5oHcxI57Zpw7BT3+kWGourV8xVr1Bj1abq1pAWLg
         lVEgtL0AymWRBGSV7km/MD+q+jRz0KglRORrgp56rhDlgc/7P1YhvcCTPHF2t1oKGFwX
         LXUcUpgCsk+ncLeCAJGrTR0zicaKl7DN7s+SaJzfVk0kydJjyH0qvjiqYc1+/I7Sj6Rl
         BbPC9hTjJunpMrq/qZjKxnDD2mr7Fg/H4C8lLoZsV9J5dYX6dEVJr7Owpz62nMAT2Ixi
         G1DQ==
X-Gm-Message-State: APjAAAVQh1ZJXCb6s7KpayKZOn7NMRfsf5DyIHe44Iwuxt1H6NgevITD
        YgYsNGkqwYHFm9ZFKbutHRz61ZHw5TskyUR7XyA=
X-Google-Smtp-Source: APXvYqyZZpbShxEAIiVs97rZaXZFTp5h3nLqwSS+qDJuWB/YrgUb1wmFMqyfAnJAXd7IgYFD9gW1nEgFVGNwZ6zTGtM=
X-Received: by 2002:aca:5c55:: with SMTP id q82mr22243401oib.95.1555402903621;
 Tue, 16 Apr 2019 01:21:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1555382110.git.mchehab+samsung@kernel.org> <b2f9cc0d15d7e3058be01015be36f698debd8b14.1555382110.git.mchehab+samsung@kernel.org>
In-Reply-To: <b2f9cc0d15d7e3058be01015be36f698debd8b14.1555382110.git.mchehab+samsung@kernel.org>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Tue, 16 Apr 2019 10:21:31 +0200
Message-ID: <CAJZ5v0he8GHZ+EFJ911vgrO53NnEWDwm=_vZD4K9SVL0MahMTQ@mail.gmail.com>
Subject: Re: [PATCH 09/57] docs: cpu-freq: convert files to ReST
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Linux PM <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 16, 2019 at 4:56 AM Mauro Carvalho Chehab
<mchehab+samsung@kernel.org> wrote:
>
> In order to be able to build html and pdf files, convert the
> documentation to ReST format.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Please don't convert these files.

They need more work than just semi-automatic conversion and the
material in them needs to go under driver-api.

This is quite hight in my TODO list.

Thanks,
Rafael

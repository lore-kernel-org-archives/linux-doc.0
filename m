Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A76B8C432BE
	for <linux-doc@archiver.kernel.org>; Tue, 31 Aug 2021 15:06:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93FAA6103D
	for <linux-doc@archiver.kernel.org>; Tue, 31 Aug 2021 15:06:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238711AbhHaPHk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 31 Aug 2021 11:07:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238678AbhHaPHk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 31 Aug 2021 11:07:40 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9E01C061760
        for <linux-doc@vger.kernel.org>; Tue, 31 Aug 2021 08:06:44 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id e7so1401836plh.8
        for <linux-doc@vger.kernel.org>; Tue, 31 Aug 2021 08:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=norberthealth-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RsOKy2MEQrop4eqCyXW//Fh3GI8a5H2xV4Ty8vmEwew=;
        b=y0+a4DO/Xlt8nbMYhHpc0983QjMDMEKxJbWHtOfcleKDslcmihhvO2xxWFpPAQAQ3o
         3L/ukw1x0aK650u334xoQ0h3NuSxITCEu/oBAGExEpcQR1+pQi77oAslVc8Os2kIVFbN
         lOqgNqov/YaatrKH9AftPpbgGa2/Ksm0AJkzMBHvYa16TjYRqx86nbXpCQczkRpvIBGl
         RuV/nVjsejhWgHz8mfaicc3aB0nz4LmdWsFoH6O6xuLVxHTNZnIFXpySxlVb02vJSfcS
         Oln6/BY1QclZE3VhMCzNfmgwChoDOrO2Z8dc3f7CwUbaOloMzq/4xrpcsi0vaGgnDIp0
         wTPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RsOKy2MEQrop4eqCyXW//Fh3GI8a5H2xV4Ty8vmEwew=;
        b=Sskz5GEPnYezMzRiDr3MPTCgZtZynwOlSqsiUAHFo1ZscdUIKsU93s0huaIoDWDGFi
         +BN4jmdvYwFW5sZiqzFHFxSV5zuxPAH+HWAp7VpGP9ZWZcJjhWeOoPQfDEr4KH/iG5YP
         01O2L/2ij7M9URDdiChSObgFnj9aBPFRJXACuwRUph3ui54ahVnoEoKeZ2bEqBdsampz
         om82Qd9Yhqa7FZSsb0Ey6HuupimHAtRtHze/CLbr3jF4gn02Z7IchUS6KF2R17M5W1MW
         N6FqHnjD8xJCkhjXoZsdls9bDkrBe68lm6mTrvrbf0oR+VTmM4o75nPS7ssMGKxzu87A
         +pKQ==
X-Gm-Message-State: AOAM5335MEDtwPjJj82VXG6q/DVQE39GSg55tBpI6SXLXvJ9mJPM3lGD
        u0sgdu2MQbYzVxnmi+uAshdsNjQuJ7BvQTd1U3AbBg==
X-Google-Smtp-Source: ABdhPJw7oHRPloH8oVj8QcwmZ4bllvFY3xsCSVV5hpT/HlAmNN8D75hn/EMnwDIZwmJ0qy4N6QLYK87K9dFlUm3HIUU=
X-Received: by 2002:a17:902:9a04:b029:12b:8d54:7c2 with SMTP id
 v4-20020a1709029a04b029012b8d5407c2mr5241397plp.62.1630422404327; Tue, 31 Aug
 2021 08:06:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210831130702.31526-1-roger@norberthealth.com> <6ba219b5-0a9d-610e-0670-232e5d3d4ad3@infradead.org>
In-Reply-To: <6ba219b5-0a9d-610e-0670-232e5d3d4ad3@infradead.org>
From:   Roger Knecht <roger@norberthealth.com>
Date:   Tue, 31 Aug 2021 17:06:33 +0200
Message-ID: <CAO_iFwpJ_1GqnW+eAfZ5bhVn3uF-0MqFQ30=iPBX_WM4fOTUNQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v3] Trivial comment fix for the CRC ITU-T polynom
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Jiri Kosina <jkosina@suse.cz>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Jiri Kosina <trivial@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Randy,

No problem, I will update the patch.

Regards,
Roger

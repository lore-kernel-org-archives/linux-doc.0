Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFCF6C433EF
	for <linux-doc@archiver.kernel.org>; Wed,  1 Jun 2022 07:20:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239854AbiFAHUN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 1 Jun 2022 03:20:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350314AbiFAHTx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Jun 2022 03:19:53 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA1ED4E3BB
        for <linux-doc@vger.kernel.org>; Wed,  1 Jun 2022 00:19:52 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id hv24-20020a17090ae41800b001e33eebdb5dso2657268pjb.0
        for <linux-doc@vger.kernel.org>; Wed, 01 Jun 2022 00:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ehmnh5o3IwHBRSsUSxPjjuDsdbTNtmJR0VrxqS97vnM=;
        b=cNyBPN8fNWwg+AYKgN+IAe82T4aEHlnYHKDgiYl9jMmdetIxgRISIgyxrAzW9F1taH
         l6zEZk1Jc1lbj53j6/0fDK+WZMVO4XjHwiDiwvF2szfaSd8tyXoiJY8jhqr/KAxvKPMy
         IEztXYM8P5nUULj57yZm1EwV8Ib+CyQpiDg/Ctf8Wb+P7rEdzq6BMBfQwrHYENLe3pLH
         jeS2BtsiACFHz0G33QHhF60zd4/qcaaJQ4YeFJq6RiZRto2G5dAPgP4HHX+ITEKzmD1I
         yd81hkrjIE9/enkhTcNE6wFPw2QISOTk37830bfHG9CJOXgcNjkmiCGKl6uqOM7HGByf
         OlqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ehmnh5o3IwHBRSsUSxPjjuDsdbTNtmJR0VrxqS97vnM=;
        b=wtbjzEbnsaygTqwAfiLZaFdoxKD++FM5fxewuLVUBh04lN0xyOyZkobHgZ4MRR56mA
         ByjIVpKnvSIpBKHW2KuoKIEn4ja3IHjMUINsguleFtr2RP84ZOEyjUZxUoysIL64NRqh
         rvPJBnpCJ42rGDx2IK/yWpu+QtvOEb62Yk57YtcTGOq7oNflLhBrLVUzyUxsH4XBGVxY
         SqfDPAjAAk+xVGb/nQVWkKzHCK0MPxFLbqCZtFA/Z3P2uB4nUOW40ctfoDkizyYtpl6q
         an/NrsAK2bYiX1D395pKINw4SKvF3JUe4hxiroiRTr3kfW5AnHlpkfJdKbBLHQLtDABq
         PAUA==
X-Gm-Message-State: AOAM530bNms9fPWhrHe5NTyqVWLEMBObGrqWLPy3QnyRQX96Bfzsp56W
        TWzhGIWpaegWsdRBs+rGDQSiPJOvDUXZwA==
X-Google-Smtp-Source: ABdhPJyWpkcR2rX+fmTzbVW1DTtfIUABTzp5Slv/biCve8tT+x+1NPzuzArax0s5uCexrX/zLcE29A==
X-Received: by 2002:a17:90b:1e04:b0:1e0:2e0b:20de with SMTP id pg4-20020a17090b1e0400b001e02e0b20demr32848814pjb.100.1654067992221;
        Wed, 01 Jun 2022 00:19:52 -0700 (PDT)
Received: from localhost (subs02-180-214-232-26.three.co.id. [180.214.232.26])
        by smtp.gmail.com with ESMTPSA id c1-20020a17090ab28100b001cd4989ff47sm689175pjr.14.2022.06.01.00.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 00:19:51 -0700 (PDT)
Date:   Wed, 1 Jun 2022 14:19:48 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Joel Colledge <joel.colledge@linbit.com>
Cc:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Matt Porter <mporter@kernel.crashing.org>,
        Alexandre Bounine <alex.bou9@gmail.com>,
        Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH] docs: blockdev: change title to match section content
Message-ID: <YpcTFNbAWF2EHAda@debian.me>
References: <20220530142849.717-1-joel.colledge@linbit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220530142849.717-1-joel.colledge@linbit.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 30, 2022 at 04:28:49PM +0200, Joel Colledge wrote:
> This index.rst was added in commit
> 39443104c7d3 docs: blockdev: convert to ReST
> 
> It appears that the title from the RapidIO index page was copied. This
> title does not match the content of this directory. Change it to match.
> 
> Signed-off-by: Joel Colledge <joel.colledge@linbit.com>

Aha! The patch makes sense, since blockdev/index.rst isn't about
RapidIO, but block layer subsystem.

Anyway, what about adding Fixes: 39443104c7d3 ("docs: blockdev: convert to ReST") 
tag and Cc: stable@vger.kernel.org so that this patch can be included
for stable trees?

Ccing RapidIO and block layer subsystem maintainers for opinion.

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

-- 
An old man doll... just what I always wanted! - Clara

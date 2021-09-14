Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61148C433F5
	for <linux-doc@archiver.kernel.org>; Tue, 14 Sep 2021 17:13:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 43B8D61151
	for <linux-doc@archiver.kernel.org>; Tue, 14 Sep 2021 17:13:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbhINROh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Sep 2021 13:14:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229846AbhINROh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Sep 2021 13:14:37 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB777C061762
        for <linux-doc@vger.kernel.org>; Tue, 14 Sep 2021 10:13:19 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id 62so50154qvb.11
        for <linux-doc@vger.kernel.org>; Tue, 14 Sep 2021 10:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bbnco7tVZttTiVHevv9Xt1I1fHW3axEITBc8rJrCa/w=;
        b=Shvajud6QYbTM2sviB0SEQ32NJUKczdFWtfTdTp1RaEP506Xq0+3ue1NhbAOVLPO6y
         9sgIQHT0vOx+9gNACsLxYqZdLQNes7cj2xJ/Km1kvUUCSPvcGIg06+5JR7UGVP1mIwJ0
         FxrvUvBqsR4kEEdgpmlvuSXelgYxd/ZxrDLfyLQ/QQ5iMkk42xqcRfARqaSGV3JwKZrA
         SEHieCwNBXwC2OduaVfaBxllg6eCH2eWPfNs2eCLDTHTqFJ3rA/AKPPq+nM9lRovpFdU
         mhJe4LET28PvOYlKo283pRXT3v+g0SO0GQzNO1vB4w2np3DVvPf+Pmd80uPl7iCVBb8o
         h7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bbnco7tVZttTiVHevv9Xt1I1fHW3axEITBc8rJrCa/w=;
        b=rKER5VoroD2uwyU5z2oO7rZjLMBQETo7EAS/AVWtVokBLvAQACQpFWEnYS4kBO18Wg
         TKZK70Wbd3bXvx7H9nqKgOvZSEMIH7rjOXbUoiCahhZnsmk7yMzQivvsIcPOr/XwyGZJ
         04TofpPIe1O8u4PiXryc4SBjMxymQL4/ctNH2NxWVewkFg75fYeoAiVm6LGWfbi8Xgib
         PMrrqJaATU5JC6Esy+6Ue0agxnyk8L/npaoO7E3doHOKxYUtmJon7agG1Fo8CtORzShv
         m0w29S32e0KFSxx/bsm78lri8DjWlPGZQmJMJt0C1nqJKf5Ej0YEz7WoaNUkOKX4CT96
         Lgyg==
X-Gm-Message-State: AOAM53341owmGJgf4fFKQEMNknJjLTiV4amliXp+MTDR4DQtuqLHRjek
        ao3JFqVkK18TUtMnOC7Kswx/lg==
X-Google-Smtp-Source: ABdhPJw9OLyImsITOs3vQXeqzfyvcNKfYnpWj06FRYMOnA8ztNhA+35jxsPV8fyKXUvDUM6vdi6dpw==
X-Received: by 2002:a05:6214:2e4:: with SMTP id h4mr6551287qvu.3.1631639599017;
        Tue, 14 Sep 2021 10:13:19 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id z186sm8101157qke.59.2021.09.14.10.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 10:13:18 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1mQBzh-000XMK-Li; Tue, 14 Sep 2021 14:13:17 -0300
Date:   Tue, 14 Sep 2021 14:13:17 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shiraz Saleem <shiraz.saleem@intel.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 13/29] ABI: sysfs-class-infiniband: use wildcards on
 What definitions
Message-ID: <20210914171317.GG3544071@ziepe.ca>
References: <cover.1631629496.git.mchehab+huawei@kernel.org>
 <df195c1204a56a9a83926e6a1a38fb91a7221869.1631629496.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df195c1204a56a9a83926e6a1a38fb91a7221869.1631629496.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Sep 14, 2021 at 04:32:28PM +0200, Mauro Carvalho Chehab wrote:
> An "N" upper letter is not a wildcard, nor can easily be identified
> by script, specially since the USB sysfs define things like.
> bNumInterfaces. Use, instead, <N>, in order to let script/get_abi.pl
> to convert it into a Regex.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../ABI/stable/sysfs-class-infiniband         | 64 +++++++++----------
>  1 file changed, 32 insertions(+), 32 deletions(-)

Acked-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

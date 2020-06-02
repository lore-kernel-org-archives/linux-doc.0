Return-Path: <SRS0=0Efk=7P=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7BB2C433DF
	for <linux-doc@archiver.kernel.org>; Tue,  2 Jun 2020 21:01:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F1282072F
	for <linux-doc@archiver.kernel.org>; Tue,  2 Jun 2020 21:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591131686;
	bh=LzPpv+By0oTm/tfhAfrIwNDItSv4bsu11dSTj+ZuR1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=nFsRr8KqDKl910X/BpQOJ+YAIcQVqzvEtU2H3jWj2g3r8z36DIxAZT2svlrhXc5AH
	 LTfVtfpHQnu6Or6T8qX4fbY3ybggcwbt3PIXLY6YsVaGzw4+2+zVBM2nWjbljScF4X
	 HQfl7BJK3eGC//R1vPYoZt1yf9rd56d7uda6z6e8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbgFBVB0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 2 Jun 2020 17:01:26 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:41345 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726174AbgFBVBZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Jun 2020 17:01:25 -0400
Received: by mail-io1-f66.google.com with SMTP id o5so12309065iow.8
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2020 14:01:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RdOOI6THo1klBm0yIRedlU8s9OpbTJoviIA/URFciN8=;
        b=Ntqacy8vCUZaq8IIZ9CQJbVKmc2hbOkSYN0DXoeQc2t4wD1UHQfRZLtUixtHmuGzto
         HTIHbTtCUArIvk6LNRki5kBiUO+l9yd+05NZcWOYnK3QlTIgq93F44MgBYJ+NBOUxad8
         xJ5nuAUwPbPO8lf/9R5QKmNq8jlbcLnLBIjtKrkoWTfcGZ0I5BVhbg+l3xLRbHp2pZCg
         yfW9kt4r6rnTGOBDsPpdgezTWNTHswTBYytbsMPYka34SFy+vOvNfcli0aWSno8mYUic
         6GBnZbnVtVwUeRm6wfwbQvHaqjSIcPMigEsKLhzx2Cc9Yt71489Xg92BKUx2LDOLiWbX
         cfPw==
X-Gm-Message-State: AOAM530tF2HFlIEb6JUBrqlrgp72PLBoWdo0FF79LpDkUMAkw3VbZWIQ
        Ob5mxbLJW8N80qvOI8fO0Q==
X-Google-Smtp-Source: ABdhPJyED+cNMQ8/u2s36pB/sr1W0BzLhhpcCiviur8uywjjNdNTWlEfvdk/qgx24vUTx4ZeDFdd4A==
X-Received: by 2002:a02:ca18:: with SMTP id i24mr26930962jak.70.1591131684561;
        Tue, 02 Jun 2020 14:01:24 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id p11sm59004ioo.26.2020.06.02.14.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 14:01:23 -0700 (PDT)
Received: (nullmailer pid 3941805 invoked by uid 1000);
        Tue, 02 Jun 2020 21:01:22 -0000
Date:   Tue, 2 Jun 2020 15:01:22 -0600
From:   Rob Herring <robh@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v2 13/24] docs: arm64: convert perf.txt to ReST format
Message-ID: <20200602210122.GA3930090@bogus>
References: <cover.1581956285.git.mchehab+huawei@kernel.org>
 <e000ccaf21f899a4c503c0a0e8734a2a3e177ee6.1581956285.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e000ccaf21f899a4c503c0a0e8734a2a3e177ee6.1581956285.git.mchehab+huawei@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Feb 17, 2020 at 05:20:31PM +0100, Mauro Carvalho Chehab wrote:
> This file is almost in ReST. All it needs is a rename and
> adding a :field: for the two fields at the beginning
> (author and date).
> 
> While here, add a proper SPDX header, and use the standard
> markup for document titles, just for consistency.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/arm64/index.rst              | 1 +
>  Documentation/arm64/{perf.txt => perf.rst} | 7 +++++--
>  2 files changed, 6 insertions(+), 2 deletions(-)
>  rename Documentation/arm64/{perf.txt => perf.rst} (95%)

Is there some reason this hasn't been merged or commented on?


> diff --git a/Documentation/arm64/index.rst b/Documentation/arm64/index.rst
> index 5c0c69dc58aa..c51d0fa80318 100644
> --- a/Documentation/arm64/index.rst
> +++ b/Documentation/arm64/index.rst
> @@ -13,6 +13,7 @@ ARM64 Architecture
>      hugetlbpage
>      legacy_instructions
>      memory
> +    perf
>      pointer-authentication
>      silicon-errata
>      sve
> diff --git a/Documentation/arm64/perf.txt b/Documentation/arm64/perf.rst
> similarity index 95%
> rename from Documentation/arm64/perf.txt
> rename to Documentation/arm64/perf.rst
> index 0d6a7d87d49e..9c76a97baf28 100644
> --- a/Documentation/arm64/perf.txt
> +++ b/Documentation/arm64/perf.rst
> @@ -1,8 +1,11 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=====================
>  Perf Event Attributes
>  =====================
>  
> -Author: Andrew Murray <andrew.murray@arm.com>
> -Date: 2019-03-06
> +:Author: Andrew Murray <andrew.murray@arm.com>
> +:Date: 2019-03-06

Andrew is no long with Arm. Both lines look like things that become  
stale, so I'd just remove them.

Rob

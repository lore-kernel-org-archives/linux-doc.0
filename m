Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 334B9C07E9B
	for <linux-doc@archiver.kernel.org>; Tue, 20 Jul 2021 19:48:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A2CA6100C
	for <linux-doc@archiver.kernel.org>; Tue, 20 Jul 2021 19:48:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbhGTTHq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 20 Jul 2021 15:07:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43551 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229797AbhGTTHS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Jul 2021 15:07:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626810475;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=U272znx2AfMZKI+Uhn1CK8uwYCSuVHYdjjqWpT9zrL4=;
        b=LdxPKiqkbUYtaXuaZohWVvkK1DXxHIzngZevudGamjcIO9z2zcAXasJReTT0Isfb/nGbgn
        0PNF4WWz0H+zbVm4xyi+vSqBdlHpoluDdF33T/hMY1lrXoS27gju/2RtXXFIyFtYjQpuTr
        ZSzcbnq0cFc96YVzjVOmmFSjGbKa09E=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-YbeuoeYCNhWcugmdMXBEkg-1; Tue, 20 Jul 2021 15:47:54 -0400
X-MC-Unique: YbeuoeYCNhWcugmdMXBEkg-1
Received: by mail-oi1-f198.google.com with SMTP id l3-20020aca19030000b029025c7e6f8b64so238592oii.6
        for <linux-doc@vger.kernel.org>; Tue, 20 Jul 2021 12:47:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=U272znx2AfMZKI+Uhn1CK8uwYCSuVHYdjjqWpT9zrL4=;
        b=E+HwkZaAnBOoduGJgyCh33lbJ3hv975ZHwqMRLEnZ59+qBA/X0i3u4q+nDJxpgk3im
         Z+PdxyT7gWUMqAwOHXEwfuURl9nVeshdbgQCrIfj3F0ITsw8zC3oWa2SSjAhJQtGkOxh
         qWaAJzNyoNCCSx5IDfceMA8e2aSnGgjaiYo+DQn5r+ys+1N/qcmHp4eO4eXqO1PngK8I
         pgr7RbgiMnSmSph//AFr4QOEaawL7gTijEbRXPMR3nGlavbInVTU6i+hVzEXhuFAes3+
         Q+boCzziCec6HFNUkDHu0toU2ci15tiUYeIBHbdicQqnnpl6baOtFM0NZHnFBjckj9l2
         Ttbw==
X-Gm-Message-State: AOAM532JgfgKWCOArHxSHEC6Olt/rinkUGT/EyMtfaWkyNgSnPTyDF8c
        5H7aYHYSALOvVPtRA/guhRz8Vpb2Z4A55vV3t5PgM4ac7u6e3K+XS5bo34kdT+27VkYV5w+SAbf
        VNwn8z79ShRv2mZ9wwqbO
X-Received: by 2002:a9d:190:: with SMTP id e16mr21172677ote.137.1626810473828;
        Tue, 20 Jul 2021 12:47:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7HSO7FKjrPvQVrYMWCgiQ6o3xJ04g/3KtAN5rcdjFx2z98r20sgKQO/TtU2hqy+4fJj+6qg==
X-Received: by 2002:a9d:190:: with SMTP id e16mr21172666ote.137.1626810473659;
        Tue, 20 Jul 2021 12:47:53 -0700 (PDT)
Received: from localhost.localdomain (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id v4sm4164937ooa.2.2021.07.20.12.47.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jul 2021 12:47:53 -0700 (PDT)
Subject: Re: [PATCH v2 0/4] fpga: fpga-mgr: move compat_id from fpga_mgr to
 dfl
To:     mdf@kernel.org, corbet@lwn.net, hao.wu@intel.com
Cc:     linux-fpga@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210709134229.2510349-1-trix@redhat.com>
From:   Tom Rix <trix@redhat.com>
Message-ID: <f0ffd1b2-43a6-5b69-7d67-229b3d68b5a2@redhat.com>
Date:   Tue, 20 Jul 2021 12:47:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210709134229.2510349-1-trix@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 7/9/21 6:42 AM, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
>
> A followup to
> https://lore.kernel.org/linux-fpga/aa06a7ca-eff3-5c0d-f3b0-f1d9ddb74526@redhat.com/
> The current storing of compat_id in fpga_manager is dfl specific.
> This makes the refactoring of the release()'s complicated because there
> is a dfl specific flavor of register().
>
> Keeping the compat_id sysfs abi, each implementation through the new
> compat_id_show() fpga_region op can print out whatever value they need
> to the sysfs.  Currently only dfl does.
>
> Since there are now two ops for fpga_region, give fpga_region its
> own ops table.  Add a wrapper for get_bridges().
>
> Changes from
> v1
>    Completely written to keep sysfs abi

Moritz and Hao,

Can you comment on v2 ?

The compat_id abi is unchanged, so dfl's opae userspace access will not 
change.

For ever other board, the nonuse error is the same.

Otherwise, the new region ops is consistent with manger ops.

I can split this first patch out if the refactor of compat_id is 
contentious .

Tom

>
> Tom Rix (4):
>    fpga: region: introduce fpga_region_ops
>    fpga: region: introduce compat_id_show op
>    fpga: dfl: implement the compat_id_show region op
>    fpga: remove compat_id from fpga_manager and fpga_region
>
>   Documentation/driver-api/fpga/fpga-region.rst |  6 ++-
>   drivers/fpga/dfl-fme-mgr.c                    | 23 ++++++-----
>   drivers/fpga/dfl-fme-pr.c                     |  2 +-
>   drivers/fpga/dfl-fme-region.c                 | 21 +++++++++-
>   drivers/fpga/dfl.h                            | 14 +++++++
>   drivers/fpga/fpga-region.c                    | 40 ++++++++++---------
>   drivers/fpga/of-fpga-region.c                 |  6 ++-
>   include/linux/fpga/fpga-mgr.h                 | 13 ------
>   include/linux/fpga/fpga-region.h              | 26 +++++++++---
>   9 files changed, 99 insertions(+), 52 deletions(-)
>


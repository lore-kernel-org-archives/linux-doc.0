Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D8A1C43381
	for <linux-doc@archiver.kernel.org>; Tue,  9 Feb 2021 13:47:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 33D6D64EE1
	for <linux-doc@archiver.kernel.org>; Tue,  9 Feb 2021 13:47:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231309AbhBINrC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 9 Feb 2021 08:47:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231653AbhBINpV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Feb 2021 08:45:21 -0500
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB3ADC06178B
        for <linux-doc@vger.kernel.org>; Tue,  9 Feb 2021 05:44:40 -0800 (PST)
Received: by mail-qt1-x835.google.com with SMTP id v3so12923649qtw.4
        for <linux-doc@vger.kernel.org>; Tue, 09 Feb 2021 05:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=m0aWzSj+LY+Pm6/iOhWj1FnuzMBYaB0PeiOpmIEzYlc=;
        b=m0ZybclIto8FDXMo+Xc6M8LWQUVcr4Fdfd7ghcLIyxKTwH8BTQxyYtMUbUih8tWECV
         2VT+6s7hE8CBSiZqN6bkvw24Uac8MmLDDi12B1jeZRjtOHllqcD/cupL4eo+uhYRxZN2
         XofmcdPW3z+B4YCZnjGgWp75JMipYH0r7LH38gPu9CVXeJXQ4b1p3ExIpExO2Iz18RiX
         aSE40sCfQ2T9u25TW9dPn2rmDnvbpisbwQQGBqLSCL+xzXgXzET0NMzRjKIe/+v41lcz
         06dZa8ip1rgW6T8XpAe3Ap1llZSkK/tUofjeynu9J8T6nOGeeaa6PrERHkyYyDfqrS/d
         Uv+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=m0aWzSj+LY+Pm6/iOhWj1FnuzMBYaB0PeiOpmIEzYlc=;
        b=fQAoUKdu9DJ5JCe71Pth8hjhdt8hPpMZQlfzzIBLNXlO76v3JH2EsZvVnIuvxh+WWM
         jGY2yLL3a+tPfl+WOs0a5bGWzycfZTq+yscuKDh5qZzEkati2mvM+74pkgYJFA/B5okv
         C/uccAuElH3yJChpDHTGYdjxnVEgPeDAanYdooEXoYQ/0fcLPqxz2hy5oLSrvlZLL0Ld
         S1ZSa/LfMvN+TuxisMKt6upks+HnQoY6fQ2NGOmA0HR0D4mzWPUURMXpyk4zdE4vYnJ2
         vt4RtFevWcKuzIkM5aXRza2Cs6p959t1jaYw3PjuFwZTvVnbxkAXKbcXkt2WAsNfVxXJ
         VqXg==
X-Gm-Message-State: AOAM5305uQc8mnVk5htxteBpHSAe1NW8MkzegUG2DlsXPCYhWwJwRjQC
        lPBUPVnfecFlASdabQHjDnYFSQ==
X-Google-Smtp-Source: ABdhPJxsSPzRdXtHpbbQb8PSJ12WAOa9MW0LcEJBQn0Vx0sdyHcridZpcWDX5XcVOrwu+wtw66I+OA==
X-Received: by 2002:ac8:1190:: with SMTP id d16mr19704724qtj.125.1612878279800;
        Tue, 09 Feb 2021 05:44:39 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.115.133])
        by smtp.gmail.com with ESMTPSA id t6sm14169555qkd.127.2021.02.09.05.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 05:44:39 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1l9TJm-005RQR-Sq; Tue, 09 Feb 2021 09:44:38 -0400
Date:   Tue, 9 Feb 2021 09:44:38 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Alistair Popple <apopple@nvidia.com>,
        Linux MM <linux-mm@kvack.org>,
        Nouveau Dev <nouveau@lists.freedesktop.org>,
        Ben Skeggs <bskeggs@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kvm-ppc@vger.kernel.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        John Hubbard <jhubbard@nvidia.com>,
        Ralph Campbell <rcampbell@nvidia.com>,
        Jerome Glisse <jglisse@redhat.com>
Subject: Re: [PATCH 0/9] Add support for SVM atomics in Nouveau
Message-ID: <20210209134438.GE4718@ziepe.ca>
References: <20210209010722.13839-1-apopple@nvidia.com>
 <CAKMK7uGwg2-DTU7Zrco=TSkcR4yTqN1AF0hvVYEAbuj4BUYi5Q@mail.gmail.com>
 <3426910.QXTomnrpqD@nvdebian>
 <20210209133520.GB4718@ziepe.ca>
 <CAKMK7uGR44pSdL7FOui4XE6hRY8pMs7d0bPbgHHoprRG4tGmFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uGR44pSdL7FOui4XE6hRY8pMs7d0bPbgHHoprRG4tGmFQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Feb 09, 2021 at 02:39:51PM +0100, Daniel Vetter wrote:

> Either way ZONE_DEVICE for not vram/device memory sounds wrong. Is
> that really going on here?

My read was this was doing non-coherent atomics on CPU memory.

Atomics on GPU memory is just called migration to GPU memory, it
doesn't need to be special for atomics. In that case it can free the
CPU struct page completely as the data now lives in the ZONE_DEVICE
page so no need for a pin, no problem with movable

Jason

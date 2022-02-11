Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6CB0C4332F
	for <linux-doc@archiver.kernel.org>; Fri, 11 Feb 2022 08:04:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347898AbiBKIEg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Feb 2022 03:04:36 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347897AbiBKIEe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Feb 2022 03:04:34 -0500
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2445D62
        for <linux-doc@vger.kernel.org>; Fri, 11 Feb 2022 00:04:33 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id o19so22391947ybc.12
        for <linux-doc@vger.kernel.org>; Fri, 11 Feb 2022 00:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dxknHxb36rbifNWkNcv9VONDPog7tM6iEXnWvM32+Tc=;
        b=D0jLF5Daas/6Jk3NUsVPwZFaFyBP48m8kmx335qxOT/YqQsO8WQdrpXc8xUxn6Uk9/
         z6+uIxCoXUl8Vg8/gnBaaEHPHcSsKFrP9dSzq2gWNeov4MsgkOFlRLGzlCgiqCh3RLNP
         HMwkoMosu2SsdtbJWPCZ3b3JGg3DOEEZ6HcPsihB9czGLZpB9WgVMjcASQc76gtXzWM6
         ALwQkCbWrKgLHNuW4G8bdHgnwuxRBPbtQsZRsGAE6uH5YOUolyhxKB135UED5cIUvjxE
         KhGFKPN/10BLgtkRu4UZ1wojLARrEXaXZHj+cwXsBhhXKoxxNUUPlytF/VZ0EATnmH3U
         4oHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dxknHxb36rbifNWkNcv9VONDPog7tM6iEXnWvM32+Tc=;
        b=7iL/pTQh48pIPePw5LEkjaOKv5PmHbALuNoqVm+GXj6VPkopH4pbr8VxCE/OplHgG4
         Po/JCWPRbjvuHeqw/GC1oIFr+OfwXiSxxukx/h8/PB8ShgNkpE4fr+TgiB9ym7Sx0vBR
         Ge3rmhDaaNk35Le7qwQu/iEt29G9mwAl1BUP0mhe3Smz/HcGtdV0y59uQ90qSvYweZIV
         KYLhm5ZAAbGA6Ut5HQQeCKJGVw/ruWhKojBRuZRhcQSrlVNxWxznDv3CqXi3s9SLdslE
         oAUvZd3czcAmICcLXg557BYneKH0/DerD4r53VBb/S9vz0sCb3Gud5VwvpIhEG+b92ZG
         oxLg==
X-Gm-Message-State: AOAM530RuKrrXwzOLI/jDj2HtFswYzEfd0i0+3/6NzAoZ6fv5YCJnVFN
        VGAvU+TqqBfdHmopud6f5zkxMQvfM+UeE+0Eh20gWQ==
X-Google-Smtp-Source: ABdhPJyU3xGRlVamweE+Q7TKE0AllylV5ToYb3DPWinhfyYERv+u5Gyj/PL3r2Zu6vl5zPtBqGiNHUNH9nwKPDGu1xQ=
X-Received: by 2002:a81:310:: with SMTP id 16mr517301ywd.35.1644566672815;
 Fri, 11 Feb 2022 00:04:32 -0800 (PST)
MIME-Version: 1.0
References: <20220210193345.23628-1-joao.m.martins@oracle.com> <20220210193345.23628-2-joao.m.martins@oracle.com>
In-Reply-To: <20220210193345.23628-2-joao.m.martins@oracle.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Fri, 11 Feb 2022 16:03:56 +0800
Message-ID: <CAMZfGtUwL-whhTeLydS9+H9weJ5sztAcrTi5ZK1ayNzSBMYtnQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] mm/sparse-vmemmap: add a pgmap argument to section activation
To:     Joao Martins <joao.m.martins@oracle.com>
Cc:     Linux Memory Management List <linux-mm@kvack.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Matthew Wilcox <willy@infradead.org>,
        Jason Gunthorpe <jgg@ziepe.ca>, Jane Chu <jane.chu@oracle.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Christoph Hellwig <hch@lst.de>, nvdimm@lists.linux.dev,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Feb 11, 2022 at 3:34 AM Joao Martins <joao.m.martins@oracle.com> wrote:
>
> In support of using compound pages for devmap mappings, plumb the pgmap
> down to the vmemmap_populate implementation. Note that while altmap is
> retrievable from pgmap the memory hotplug code passes altmap without
> pgmap[*], so both need to be independently plumbed.
>
> So in addition to @altmap, pass @pgmap to sparse section populate
> functions namely:
>
>         sparse_add_section
>           section_activate
>             populate_section_memmap
>               __populate_section_memmap
>
> Passing @pgmap allows __populate_section_memmap() to both fetch the
> vmemmap_shift in which memmap metadata is created for and also to let
> sparse-vmemmap fetch pgmap ranges to co-relate to a given section and pick
> whether to just reuse tail pages from past onlined sections.
>
> While at it, fix the kdoc for @altmap for sparse_add_section().
>
> [*] https://lore.kernel.org/linux-mm/20210319092635.6214-1-osalvador@suse.de/
>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>

Thanks.

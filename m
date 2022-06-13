Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5530FC433EF
	for <linux-doc@archiver.kernel.org>; Mon, 13 Jun 2022 08:24:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239916AbiFMIYG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 13 Jun 2022 04:24:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231219AbiFMIYG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Jun 2022 04:24:06 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FDC81A381
        for <linux-doc@vger.kernel.org>; Mon, 13 Jun 2022 01:24:05 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id r1so4477004plo.10
        for <linux-doc@vger.kernel.org>; Mon, 13 Jun 2022 01:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+CJUH0/L+lNEkylRzdIbrkY/KTmlUTqUzOzvWe/voi8=;
        b=0YuVYFrlpNbnZb+V6c9WFsLYKBkaCggjDhAq/i0UKLtkp/CAn4HdoX9/ExpzmdDBJw
         7bhOVOmrg0nNabrn2NKesHAtq2BbmUXj7FrBN/uzP7mhZtNKDOZhknaqJvK167CLSLV0
         mD4gzNeOxk3OIYsD9VeGRIKsMDJDmFedbSfzQbKD3m9T8VmX8r8O0YcNuicPQc1ajjyW
         D0Weae53u7bEp8dyzYreEC15/Eukj7VBA03XnopxiZD7ID30Hw5Lc27u+Kd/RBr+4Z11
         SduTLXDH02tSKIb1LKAZ92aF9mdnLGThnswnLI2N/nlFjClt4q+/Fdi+pemWHk8H5reE
         IQQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+CJUH0/L+lNEkylRzdIbrkY/KTmlUTqUzOzvWe/voi8=;
        b=ApjDaNQ5YhYp9Iy9z8MHFpDJBPBgLXiFm/iyAKXS0WLWfXDOU2rCisk4ALdk1uRo/i
         yMA3vW+SNTJ/aN8NmhXSS+MsSdtn3r1Q38smLhdGINWNOfhnPT3HDdzjEFdShu4Wkes7
         o0Jj4xPPP1RYcosWboG6SJqICDQoUvFcFk89LVNa163EF/YOHdHaYSJD8V9mOBohVapY
         PVIGpCvtdx7wz1iwhTsUIKxW8C/LUt3V4LfrUFiMPMeXbkOHSXRqe8pgfa3lPB6v2YGe
         6Rcx2r/aTnZPhFGRvrj0KlcXljcAWor2Q75pa3aJXEObIN5tZ/bQpGZgyx9KgNeIGcOa
         /0SQ==
X-Gm-Message-State: AOAM530WxESOQiFn34lR0w4AdQRhHYzINc5F4n9MdTAaLI+dquBCEJ37
        0YXQkraDXrMX7Obq9q2M+5v0Dg==
X-Google-Smtp-Source: ABdhPJxgZpj4yZu5zSzgVjx+hru3WQ7XK5bsyKaytc39j7tnHYI7NtQtmYwN/rNa6cLpKIF6nMgcwQ==
X-Received: by 2002:a17:90a:bc98:b0:1e8:6895:645e with SMTP id x24-20020a17090abc9800b001e86895645emr14764049pjr.131.1655108644994;
        Mon, 13 Jun 2022 01:24:04 -0700 (PDT)
Received: from localhost ([139.177.225.255])
        by smtp.gmail.com with ESMTPSA id q29-20020aa7843d000000b0051810d460adsm4648164pfn.114.2022.06.13.01.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 01:24:04 -0700 (PDT)
Date:   Mon, 13 Jun 2022 16:24:01 +0800
From:   Muchun Song <songmuchun@bytedance.com>
To:     Oscar Salvador <osalvador@suse.de>
Cc:     mike.kravetz@oracle.com, david@redhat.com,
        akpm@linux-foundation.org, corbet@lwn.net, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/6] mm: hugetlb_vmemmap: optimize vmemmap_optimize_mode
 handling
Message-ID: <Yqb0Ia7YwVq30Id4@FVFYT0MHHV2J.usts.net>
References: <20220613063512.17540-1-songmuchun@bytedance.com>
 <20220613063512.17540-3-songmuchun@bytedance.com>
 <Yqbw4IYwtLQaoarB@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yqbw4IYwtLQaoarB@localhost.localdomain>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 13, 2022 at 10:10:08AM +0200, Oscar Salvador wrote:
> On Mon, Jun 13, 2022 at 02:35:08PM +0800, Muchun Song wrote:
> > We hold an another reference to hugetlb_optimize_vmemmap_key when
> > making vmemmap_optimize_mode on, because we use static_key to tell
> > memory_hotplug that memory_hotplug.memmap_on_memory should be
> > overridden.  However, this rule has gone when we have introduced
> > SECTION_CANNOT_OPTIMIZE_VMEMMAP.  Therefore, we could simplify
> > vmemmap_optimize_mode handling by not holding an another reference
> > to hugetlb_optimize_vmemmap_key.
> > 
> > Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> 
> LGTM, and it looks way nicer, so
> 
> Reviewed-by: Oscar Salvador <osalvador@suse.de>
>

Thanks for taking a look.
 
> One question below though
> 
> > -static enum vmemmap_optimize_mode vmemmap_optimize_mode =
> > +static bool vmemmap_optimize_enabled =
> >  	IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON);
> 
> So, by default vmemmap_optimize_enabled will be on if we have
> CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON, but we can always override that
> via cmdline, as below, right?
> 

Totally right. CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON only control
if the feature is enabled by default when the users do not specify "it should
be off" via cmdline. 

Thanks.

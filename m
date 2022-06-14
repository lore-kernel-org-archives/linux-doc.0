Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D1BBC43334
	for <linux-doc@archiver.kernel.org>; Tue, 14 Jun 2022 03:18:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237852AbiFNDR7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 13 Jun 2022 23:17:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231327AbiFNDR5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Jun 2022 23:17:57 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C50C2E0B2
        for <linux-doc@vger.kernel.org>; Mon, 13 Jun 2022 20:17:55 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id r5so627784pgr.3
        for <linux-doc@vger.kernel.org>; Mon, 13 Jun 2022 20:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=1qN6OyaRDLN8PZ+93yGw5yJBTOUHt5MGOB2eLLMCogI=;
        b=cMrFBCIPYz7c80i80c0FXtORHnLG3GjW5yZlTVd2mKvLYcPe0tAzISoqrP9Qf8Wp9P
         Vh+8L1urE9XjyjN7IL/1+2MpLTRg5IgOhE4SM5v7WFYnMjrHfWq2l0MA5S/sMwfUVby+
         MthRAqvCngQMPtChLRHFvH1lUi6pCGnOTZ33tgSGP+2+KMPfPCgON4M1TEhaPy4fsK9Z
         6pI7amuFqIGdzrI/3jxo7sSNAtoRzXlE9myGq5ybu6n5RkLEFzZlh8Q5QGJIdBR8PFGE
         FEQFtG2zRLxfEGM4itilu61zxTjT8YQqLw3fDNXFt+nwu+JgzMdctjpOq3RErTCHk//f
         pHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=1qN6OyaRDLN8PZ+93yGw5yJBTOUHt5MGOB2eLLMCogI=;
        b=Hg3uqCrC7STo/Zkj2u8uijTy7O9J0RHHzr0YB7fk7xHKwgCncIf2nBJMBdFQClv8HL
         l2PTgkbF7YBRbJMMxEO7Ke/5PZzXh2kH1w2oAiXQPvi9T6Viy8wbrkHSsLxlCTqgxJ/D
         5qKeblmMlQ07IMBX/A9Khfk5t1UfLjXJC6iuATseM0PHV6cWhERvDj1KFWCF3r5k6uI2
         DVVPbL5e7JPWpQVcheu36yIWKRg0mLh/4J+xF8YWW2vPQXwhRMx15qfvzny/WfkZ9ZI2
         L+4xHbSgbjzvQ6Sncokulko/LIcNG81D51hFQoiFsbsmmIqR+Y4VRCShCdk6InC6RQ4D
         cSrQ==
X-Gm-Message-State: AOAM532MuqCogP8cGrR8YkjOxtVc9zR4w/9xmbeKg0s+1s1BoOwpfPIv
        0vVzSi/tqxjHnrw4PF5Q8Qd/LA==
X-Google-Smtp-Source: ABdhPJybAwFxTDtuR72OKzjrJeDCMIasDLrfdWXowpUEhQqNagPhQ2nRpzBgl2V57Ds6ZcIjEDwFfA==
X-Received: by 2002:a05:6a00:1350:b0:51c:26d2:9ce5 with SMTP id k16-20020a056a00135000b0051c26d29ce5mr2493957pfu.69.1655176674581;
        Mon, 13 Jun 2022 20:17:54 -0700 (PDT)
Received: from localhost ([139.177.225.255])
        by smtp.gmail.com with ESMTPSA id g13-20020a170902d1cd00b0016767ff327dsm5868146plb.129.2022.06.13.20.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 20:17:54 -0700 (PDT)
Date:   Tue, 14 Jun 2022 11:17:51 +0800
From:   Muchun Song <songmuchun@bytedance.com>
To:     Mike Kravetz <mike.kravetz@oracle.com>
Cc:     david@redhat.com, akpm@linux-foundation.org, corbet@lwn.net,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/6] mm: hugetlb_vmemmap: introduce the name HVO
Message-ID: <Yqf937fyfV4xEiON@FVFYT0MHHV2J.usts.net>
References: <20220613063512.17540-1-songmuchun@bytedance.com>
 <20220613063512.17540-4-songmuchun@bytedance.com>
 <Yqep8QwtfcRCCPsI@monkey>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yqep8QwtfcRCCPsI@monkey>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 13, 2022 at 02:19:45PM -0700, Mike Kravetz wrote:
> On Mon, Jun 13, 2022 at 02:35:09PM +0800”, Muchun Song wrote:
> > It it inconvenient to mention the feature of optimizing vmemmap pages associated
> > with HugeTLB pages when communicating with others since there is no specific or
> > abbreviated name for it when it is first introduced.  Let us give it a name HVO
> > (HugeTLB Vmemmap Optimization) from now.
> > 
> > This commit also updates the document about "hugetlb_free_vmemmap" by the way
> > discussed in thread [1].
> > 
> > Link: https://lore.kernel.org/all/21aae898-d54d-cc4b-a11f-1bb7fddcfffa@redhat.com/ [1]
> > Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> > ---
> 
> > diff --git a/Documentation/admin-guide/mm/hugetlbpage.rst b/Documentation/admin-guide/mm/hugetlbpage.rst
> > index a90330d0a837..64e0d5c512e7 100644
> > --- a/Documentation/admin-guide/mm/hugetlbpage.rst
> > +++ b/Documentation/admin-guide/mm/hugetlbpage.rst
> > @@ -164,8 +164,7 @@ default_hugepagesz
> >  	will all result in 256 2M huge pages being allocated.  Valid default
> >  	huge page size is architecture dependent.
> >  hugetlb_free_vmemmap
> > -	When CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP is set, this enables optimizing
> > -	unused vmemmap pages associated with each HugeTLB page.
> > +	When CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP is set, this enables HVO.
> 
> I think we need to define HVO before using it here.  Readers may be able
> to determine the meaning, but to be sure I would suggest:
>

Agree.
 
> When CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP is set this enables
> HugeTLB Vmemmap Optimization (HVO).
> 

I would use this. Thanks.

> Everything else looks good to me.
> Reviewed-by: Mike Kravetz <mike.kravetz@oracle.com>

Thanks for your review.


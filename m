Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D77D7C433E6
	for <linux-doc@archiver.kernel.org>; Fri, 19 Feb 2021 14:01:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9DB5E64EB7
	for <linux-doc@archiver.kernel.org>; Fri, 19 Feb 2021 14:01:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbhBSOBu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 19 Feb 2021 09:01:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbhBSOBt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 19 Feb 2021 09:01:49 -0500
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71D3EC061756
        for <linux-doc@vger.kernel.org>; Fri, 19 Feb 2021 06:01:09 -0800 (PST)
Received: by mail-qt1-x834.google.com with SMTP id f17so3932744qth.7
        for <linux-doc@vger.kernel.org>; Fri, 19 Feb 2021 06:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Uy9+p8EYLZ+2upxXdnXYCqgGljKcN5wTbKwGZwnqinY=;
        b=I5flSyH/gLTP7kfpLHlSgh5tXtA+Jh1EsK+6uIgyy09vUXp0IZUoyofNXle2UG8+9x
         6bQcZMjTHGSnCjsIADBeVZNPoafr3TSU4gbVUKm8tx7gxct5TAh1oqibAjgx2ny24Qlv
         nA8b7dO5wJoNvKGJUaq5YdpKB1knNz20AuCjHXqPKjX/HXDnk9GUA8KprUxsiW5TqfOU
         9o+5AHrQgpJl5wOCAeVJMcNlnBgpfbhD2hv2/vQ80bpHkUbm4gdpFUasgTAZI9JejzbF
         hWMAig8ep9wZI5JeASo7p/0n5GOB7qV6LVTspTVmRmVoA3TvIzBilhfwzcUDD73XF8lP
         SRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Uy9+p8EYLZ+2upxXdnXYCqgGljKcN5wTbKwGZwnqinY=;
        b=K2C/c6XInpiOPHtl4CjqXFhjEIj9LpJr7wailnlLjgE5ovSTi1vKcHxD1ESCY20eVB
         K6O6hSF6e8Zq9TK73RDPr5+wMTmSVGN8ZoN65CZGVSEzNuY4a6a3BIrvWqbYDstWECEK
         Y8rWeMnHM94ftZDSSjnqVuysEsOuge3cqHGWkGaq9SDasjSZK4ris3HwBHwU3dX4bbCJ
         6hQuHJomKTBPzQHRLe+6mdvcx68ixy0mUoFjGjbAewvOu3aao5R5XwdjWpA8wHNV2rXU
         KvteForW+7+TAKOT0FcUK+1O9j0M2Y8VoRK+7REIB9SXh+FM4dI4aztao2jXSGqmq3qL
         jzhA==
X-Gm-Message-State: AOAM531nYK+I8NXftFpUjW4ws/EQ36rf5fgpD7wU2cu4ZbcfeeOOi/UR
        PMbVas5Gp4tr3md4SFJYKksi0Q==
X-Google-Smtp-Source: ABdhPJwvDnWgEME/UBp5mpDqS0tmSE99XXBjYe+mDgcmjGaB5orYQxdcs7Ze95f3nVqD5XVW9Zc5qg==
X-Received: by 2002:a05:622a:306:: with SMTP id q6mr8969998qtw.15.1613743266418;
        Fri, 19 Feb 2021 06:01:06 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.115.133])
        by smtp.gmail.com with ESMTPSA id 14sm5338161qtx.84.2021.02.19.06.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Feb 2021 06:01:05 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1lD6LB-00CPnQ-2t; Fri, 19 Feb 2021 10:01:05 -0400
Date:   Fri, 19 Feb 2021 10:01:05 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
        nouveau@lists.freedesktop.org, bskeggs@redhat.com,
        akpm@linux-foundation.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
        dri-devel@lists.freedesktop.org, jhubbard@nvidia.com,
        rcampbell@nvidia.com, jglisse@redhat.com, daniel@ffwll.ch
Subject: Re: [PATCH v2 1/4] hmm: Device exclusive memory access
Message-ID: <20210219140105.GE2643399@ziepe.ca>
References: <20210219020750.16444-1-apopple@nvidia.com>
 <20210219020750.16444-2-apopple@nvidia.com>
 <20210219094741.GA641389@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210219094741.GA641389@infradead.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Feb 19, 2021 at 09:47:41AM +0000, Christoph Hellwig wrote:

> > diff --git a/include/linux/hmm.h b/include/linux/hmm.h
> > index 866a0fa104c4..5d28ff6d4d80 100644
> > +++ b/include/linux/hmm.h
> > @@ -109,6 +109,10 @@ struct hmm_range {
> >   */
> >  int hmm_range_fault(struct hmm_range *range);
> >  
> > +int hmm_exclusive_range(struct mm_struct *mm, unsigned long start,
> > +			unsigned long end, struct page **pages);
> > +vm_fault_t hmm_remove_exclusive_entry(struct vm_fault *vmf);
> 
> Can we avoid the hmm naming for new code (we should probably also kill
> it off for the existing code)?

Yes please, I'd prefer it if hmm.c was just the special page walker
and not a grab bag of unrelated things

Is there is a more natural place to put this in the mm for this idea?

Jason

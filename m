Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FF39C47088
	for <linux-doc@archiver.kernel.org>; Wed, 26 May 2021 19:41:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B25C261444
	for <linux-doc@archiver.kernel.org>; Wed, 26 May 2021 19:41:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234013AbhEZTmu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 26 May 2021 15:42:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49546 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231321AbhEZTmq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 26 May 2021 15:42:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622058071;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=IK6Th4ZCx+0amLJEZjMrTW9bDpGzITHnRAL9h8VgscA=;
        b=ZV5MmiOxp6cFaupevgIBPi+3x03Bkd24qjoGhlH389dIjzps2WGegOLjnYuWXyi1xsCDlz
        3WfY7/xAIPZl7HBh5BkmYxdBeK+j+FtTRtwm6y5sJjSNvnaFfuOEpKWm44oaoTfgGlKQaX
        Of/yYe8irIJfXooknise8QwntP3z1aE=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-zsUbb1YXMqO1ZANG7uF7eQ-1; Wed, 26 May 2021 15:41:09 -0400
X-MC-Unique: zsUbb1YXMqO1ZANG7uF7eQ-1
Received: by mail-qv1-f70.google.com with SMTP id n3-20020a0cee630000b029020e62abfcbdso2084069qvs.16
        for <linux-doc@vger.kernel.org>; Wed, 26 May 2021 12:41:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IK6Th4ZCx+0amLJEZjMrTW9bDpGzITHnRAL9h8VgscA=;
        b=OytIZYO2YrMduRNDWue3wsYSzTY9cj5pHvhmi29GHkov/v49atnTa2ob486Ttt5kre
         NiXkvCtcKviL3Dp05s2vRuNX4MuuyF5pqA75Dkj1IN67bvtJOrVN3Th6iIEYkQZiiltZ
         iwnZ+9nUSs8ldcKhKKL8DEd+1zcUdhLSZtceNovhhFGDlkuIUrGSKVuJoOOklv6OT4Jq
         WB2yPaG7I6P5wlyhSRGGFrY5Ls5CTbU7ABb7KVSwufrs51rZGhqKW1UbkpOY0WXAqKxc
         uQ5g1yX0uWGoJkMN19ipai5pKMYqMaz1KTX4ZFqiAE16Kglw0nZM95KF3G+0NoSEmlGo
         q0oA==
X-Gm-Message-State: AOAM531KHXqpok43/0OMN0XAVp+9DBOCYNZ34BXSTNuzRT4zOyW1L+l0
        pnOlonecKN4NPuBjiYEBM1WXeVGVw8sue8a6YxWba3QC+DfcWItRAqaDbQdBoQcXeFCiMKBh39F
        tI4bkHKBMFFlsiKZ9aHsh
X-Received: by 2002:ac8:5bc2:: with SMTP id b2mr38732457qtb.220.1622058069379;
        Wed, 26 May 2021 12:41:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJnPqtQWXkJ/e/uDJethFbtPOcM3K9BKum6Ztqo6rrKUmjkHKDiiSLmcCX23fB6dWiie8WzA==
X-Received: by 2002:ac8:5bc2:: with SMTP id b2mr38732446qtb.220.1622058069146;
        Wed, 26 May 2021 12:41:09 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca. [184.145.4.219])
        by smtp.gmail.com with ESMTPSA id j1sm2056219qtn.83.2021.05.26.12.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 12:41:08 -0700 (PDT)
Date:   Wed, 26 May 2021 15:41:07 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Alistair Popple <apopple@nvidia.com>
Cc:     linux-mm@kvack.org, akpm@linux-foundation.org,
        nouveau@lists.freedesktop.org, bskeggs@redhat.com,
        rcampbell@nvidia.com, linux-doc@vger.kernel.org,
        jhubbard@nvidia.com, bsingharora@gmail.com,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        hch@infradead.org, jglisse@redhat.com, willy@infradead.org,
        jgg@nvidia.com, hughd@google.com
Subject: Re: [PATCH v9 05/10] mm: Rename migrate_pgmap_owner
Message-ID: <YK6kU25FDhuZC3AV@t490s>
References: <20210524132725.12697-1-apopple@nvidia.com>
 <20210524132725.12697-6-apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210524132725.12697-6-apopple@nvidia.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 24, 2021 at 11:27:20PM +1000, Alistair Popple wrote:
> @@ -521,14 +521,14 @@ static inline void mmu_notifier_range_init(struct mmu_notifier_range *range,
>  	range->flags = flags;
>  }
>  
> -static inline void mmu_notifier_range_init_migrate(
> -			struct mmu_notifier_range *range, unsigned int flags,
> +static inline void mmu_notifier_range_init_owner(
> +			struct mmu_notifier_range *range,
> +			enum mmu_notifier_event event, unsigned int flags,
>  			struct vm_area_struct *vma, struct mm_struct *mm,
> -			unsigned long start, unsigned long end, void *pgmap)
> +			unsigned long start, unsigned long end, void *owner)
>  {
> -	mmu_notifier_range_init(range, MMU_NOTIFY_MIGRATE, flags, vma, mm,
> -				start, end);
> -	range->migrate_pgmap_owner = pgmap;
> +	mmu_notifier_range_init(range, event, flags, vma, mm, start, end);
> +	range->owner = owner;
>  }

mmu_notifier_range_init_migrate() can even be kept to just call the new helper,
then existing callers are unaffected.  Not a big deal, though:

Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks,

-- 
Peter Xu


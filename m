Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BE6BC433EF
	for <linux-doc@archiver.kernel.org>; Tue,  1 Mar 2022 03:59:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231946AbiCAEAa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Feb 2022 23:00:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbiCAEAa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Feb 2022 23:00:30 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CFD8B45059
        for <linux-doc@vger.kernel.org>; Mon, 28 Feb 2022 19:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646107188;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Kc+N+qIBFHQOsV5ZDL0yG8r9s2qldX+du39vXBk/zTE=;
        b=Pj//GU44JFOLFRw/FKO/J+GHZd/A2tAFPEw7Eu6uQvo0c1g46vODWC5lTdh+Jrxecora52
        34ay7amN/m9kFgsFZ8SvjrJg1mRiy6PXcd5AQBOjP2Uud1hbuVx4tmbPhxnM8+etTCwdYn
        VTD8VbDvWNp1KOlnMExol4YLXkoU60I=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-WHOL65-5OXGUZ2WXwoILNQ-1; Mon, 28 Feb 2022 22:59:47 -0500
X-MC-Unique: WHOL65-5OXGUZ2WXwoILNQ-1
Received: by mail-pj1-f69.google.com with SMTP id e7-20020a17090a4a0700b001bc5a8c533eso778223pjh.4
        for <linux-doc@vger.kernel.org>; Mon, 28 Feb 2022 19:59:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Kc+N+qIBFHQOsV5ZDL0yG8r9s2qldX+du39vXBk/zTE=;
        b=IYrQaIRsvFrP0+sq/De7O81JmzRDOzXFrmly4KR1U+wGqEaHBO6Jtbw0f+APr91IJX
         23kUOKY2+851DZ4jI9EI8F5Yy08JOQ5MGA8sK2xDGt4dNiD/Y2eEy8dddqOH3mED2Pmv
         l1ZWGvQk1m3vom4t48edXGQXIzzoYHvn0wspVFu3Z4xbvNv+DhkFEykj3i36mkuagepc
         q9p4v/RUO3YebWFlmMiPLOiDvy2CpqMiXQuKJr2hw58wTUwyqal2ZwxlIi2s2M5v5EEa
         L+1n8pmB+Z4WjakJ8VRw43CvvIkiSmUwHRKYARTzAHD/87vXhOCiQWw+d3basNoO4RFw
         633w==
X-Gm-Message-State: AOAM533W5zNH7qpDHH+wbGDnwvvwaf3rlTJSA2IZ7S63vWG2sPGYpp7R
        6fewg4lxXnIPrwvSiriN8ZY/cYcSO8aHgla/wvn4m6Tq9kvDp04W+HVGLYN9Qb/G5hak+g3K4Ny
        aNT3SoKJQKglpBrgawT5p
X-Received: by 2002:a17:902:8f82:b0:151:5d30:a019 with SMTP id z2-20020a1709028f8200b001515d30a019mr10730794plo.145.1646107186341;
        Mon, 28 Feb 2022 19:59:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbE+FEQtLqQRsJnG0YfHtxsy1ARbqSF6OQ1/QB6BaWcv9noNbWhkppUSvRbmDWW85pILm69Q==
X-Received: by 2002:a17:902:8f82:b0:151:5d30:a019 with SMTP id z2-20020a1709028f8200b001515d30a019mr10730772plo.145.1646107186093;
        Mon, 28 Feb 2022 19:59:46 -0800 (PST)
Received: from xz-m1.local ([94.177.118.144])
        by smtp.gmail.com with ESMTPSA id a38-20020a056a001d2600b004f0f0f852a4sm15490396pfx.77.2022.02.28.19.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 19:59:45 -0800 (PST)
Date:   Tue, 1 Mar 2022 11:59:38 +0800
From:   Peter Xu <peterx@redhat.com>
To:     Yun Zhou <yun.zhou@windriver.com>
Cc:     akpm@linux-foundation.org, corbet@lwn.net,
        tiberiu.georgescu@nutanix.com, florian.schmidt@nutanix.com,
        ivan.teterevkov@nutanix.com, sj@kernel.org, shy828301@gmail.com,
        david@redhat.com, axelrasmussen@google.com, linmiaohe@huawei.com,
        aarcange@redhat.com, ccross@google.com, apopple@nvidia.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] proc: fix documentation and description of mmap
Message-ID: <Yh2aKofkcWsLswQm@xz-m1.local>
References: <20220301032115.384277-1-yun.zhou@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220301032115.384277-1-yun.zhou@windriver.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 01, 2022 at 11:21:15AM +0800, Yun Zhou wrote:
> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> index 78125ef20255..75511f78075f 100644
> --- a/fs/proc/task_mmu.c
> +++ b/fs/proc/task_mmu.c
> @@ -1596,7 +1596,8 @@ static const struct mm_walk_ops pagemap_ops = {
>   * Bits 5-54  swap offset if swapped
>   * Bit  55    pte is soft-dirty (see Documentation/admin-guide/mm/soft-dirty.rst)
>   * Bit  56    page exclusively mapped
> - * Bits 57-60 zero
> + * Bit  57    pte is uffd-wp write-protected (since 5.13) (see
                                                ^^^^^^^^^^^^^^^^^ remove these?

Thanks,

-- 
Peter Xu


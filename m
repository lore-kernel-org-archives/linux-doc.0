Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D360C433EF
	for <linux-doc@archiver.kernel.org>; Tue,  1 Mar 2022 05:08:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbiCAFIj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 1 Mar 2022 00:08:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbiCAFIi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Mar 2022 00:08:38 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 667503BA4D
        for <linux-doc@vger.kernel.org>; Mon, 28 Feb 2022 21:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646111274;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=vlgiMOTcMFuWjlU/kYz9NUh93Lw07HNBV3j58qzJq4U=;
        b=ZqYHz16VpA4Wb+RAZsBMu/ZsGkvVYAI3EdvzsZGo9hPuBhdFwO/E+2sOzRf2cw083rV5Kw
        ipP4OmI5pqREI4W2QQ5KKG8DZHkKm8+EUUoQTKSBQykbcWOpBRUVz4+BTqaUdCVblaIwIf
        x2d7PHskO4hxdz/zGWuHTmFJCI1h38s=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-5jTmQ0tGPpOUadaNTad3Zg-1; Tue, 01 Mar 2022 00:07:52 -0500
X-MC-Unique: 5jTmQ0tGPpOUadaNTad3Zg-1
Received: by mail-pj1-f69.google.com with SMTP id p3-20020a17090a748300b001bcf48f00a6so5617125pjk.4
        for <linux-doc@vger.kernel.org>; Mon, 28 Feb 2022 21:07:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vlgiMOTcMFuWjlU/kYz9NUh93Lw07HNBV3j58qzJq4U=;
        b=Hi9PlOFSAdMKD233Vi+4JaUvY7KaoHW5vTa1iuoKkmdbJJONskDXaDraOfAeq10pxc
         qXnWLmhLXr77P0fEg0CeMzjhSxb24dUKoTsuswmaNub2xilrlamjpMQI/eSxXDwphHvv
         91zmPoIq7HahJ9jdr6VTlo3j0q6uNBN9Iy/7rp1GpR2EsKKgEWisd1eFw7Ofwq04UXkJ
         inTo/6TYSE1kLURiDrtwlxOrbDh6eHKPJgDOKtiLP+5PjguWvEuVy7pbBKHF86MuDZ9E
         BGyL/sBCzjbEEIutwRhYamwrWaESrTZCt0K1AeeGF8R05w/vxIYKAnjvXwn9rCj8CJKC
         KapQ==
X-Gm-Message-State: AOAM530Jrkw1FRW7clcgsC2kedFZqZfC00TzsyFKvqMEC9vGLfbRBaYP
        7082UVXJPV5PA4PgdQMGbBXqgw0WK60zXyQC17WwAImVFkqvEHa3MdWFhq6tbb3wuNSTtZYwm8b
        lKX+atuEPyH3TYQy3icmv
X-Received: by 2002:a17:90a:fa95:b0:1bc:509f:c668 with SMTP id cu21-20020a17090afa9500b001bc509fc668mr20178123pjb.189.1646111271500;
        Mon, 28 Feb 2022 21:07:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwpWy4HUgxZrmcVNuxA49DZr6RGtDz1nFMnVlTkwtXe5piwCyDrG+ElImiz3DW22yqWJyL/vA==
X-Received: by 2002:a17:90a:fa95:b0:1bc:509f:c668 with SMTP id cu21-20020a17090afa9500b001bc509fc668mr20178109pjb.189.1646111271251;
        Mon, 28 Feb 2022 21:07:51 -0800 (PST)
Received: from xz-m1.local ([94.177.118.144])
        by smtp.gmail.com with ESMTPSA id a16-20020a056a000c9000b004f0f8babedfsm15379890pfv.29.2022.02.28.21.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 21:07:50 -0800 (PST)
Date:   Tue, 1 Mar 2022 13:07:42 +0800
From:   Peter Xu <peterx@redhat.com>
To:     Yun Zhou <yun.zhou@windriver.com>
Cc:     akpm@linux-foundation.org, corbet@lwn.net,
        tiberiu.georgescu@nutanix.com, florian.schmidt@nutanix.com,
        ivan.teterevkov@nutanix.com, sj@kernel.org, shy828301@gmail.com,
        david@redhat.com, axelrasmussen@google.com, linmiaohe@huawei.com,
        aarcange@redhat.com, ccross@google.com, apopple@nvidia.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org
Subject: Re: [v2][PATCH] proc: fix documentation and description of pagemap
Message-ID: <Yh2qHgA+689dq+5i@xz-m1.local>
References: <20220301044538.3042713-1-yun.zhou@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220301044538.3042713-1-yun.zhou@windriver.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 01, 2022 at 12:45:38PM +0800, Yun Zhou wrote:
> Since bit 57 was exported for uffd-wp write-protected(commit fb8e37f35a2f),
> fixing it can reduce some unnecessary confusion.
> 
> Signed-off-by: Yun Zhou <yun.zhou@windriver.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks,

-- 
Peter Xu


Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8026EB64DA
	for <linux-doc@archiver.kernel.org>; Fri,  7 Jul 2023 13:43:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232469AbjGGNn2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 7 Jul 2023 09:43:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232055AbjGGNn0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Jul 2023 09:43:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FD87269D
        for <linux-doc@vger.kernel.org>; Fri,  7 Jul 2023 06:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688737343;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=vvyaqhuLF/j1Og8h3rNFyZh2EidT6aQSYdLt9GNhDDY=;
        b=NnBpsBLq2GI2WuuQ9M0K6x5GT4xZuP5ED9YJMla5o4N/YW5iqN02x6rwooOTJgDEkOffdW
        Hip+OOY1Qg3Z2eeSrDo+EDeMvAn+Kz91b0NcabdGgHPFy4rVnogJH8Zim+9RHJKf0URwHN
        UvwMHZxHxD1T9tGwrEJuS6LnvXAdtvs=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-fuuLvRHyN5SNVkZWHkiWYQ-1; Fri, 07 Jul 2023 09:42:22 -0400
X-MC-Unique: fuuLvRHyN5SNVkZWHkiWYQ-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-637948b24bdso3264516d6.1
        for <linux-doc@vger.kernel.org>; Fri, 07 Jul 2023 06:42:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688737341; x=1689342141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vvyaqhuLF/j1Og8h3rNFyZh2EidT6aQSYdLt9GNhDDY=;
        b=PpJIlzpYIEx2d1+iDT+l7uwY7gHCeOplqVUTG5Z0u+jlvCQgHtesNUIDcQy5VHigAr
         S5+6gg7XN5/XoNlZZ2nX0IyF1cXOG/jjYpXxMESYQP3ONbkwtAC1WiVvuYH2jyPL2GNU
         F1EEKEfOPNwZlR2OC+5Y3qeb78tM1x0k5Plr4AADarlrd6tvmrY1+8SIcM9nC+WagtkQ
         XFrt2RzlCK4akI+c8gfIAbRxhehZCSnRdPbuCC7UiprBgshvhImsp0h+hKgduN2G9s/0
         PpKe2zlS8zxTGboVXR8HFv0M82ODMWGP1bpPD0lAVz37gU0Q7le2PJx6IUJ/hCWMil9J
         YgKw==
X-Gm-Message-State: ABy/qLbZNC62/iAqwK+z57DFf5fC+Hf1QwHsseC3/J4zCo71ASdUQh1k
        eGsU1fI7+oJ5HDx/UKtNyEDFhTh+8EjTv6HQotNEYzMEB4n3wpcsdHMiJR/BUIgLykEwnd5dDwl
        +ytnvkUGP1nrT7Zqjs50D
X-Received: by 2002:a05:6214:20cc:b0:61b:2111:c2e2 with SMTP id 12-20020a05621420cc00b0061b2111c2e2mr5425152qve.2.1688737341646;
        Fri, 07 Jul 2023 06:42:21 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHFH2MLUjHuHlJ0o0C1Yq4RbSkSJbn/7QaojqKFFhq0TCDBNojgWoYsFCzsCzTX8XCvxMu0gw==
X-Received: by 2002:a05:6214:20cc:b0:61b:2111:c2e2 with SMTP id 12-20020a05621420cc00b0061b2111c2e2mr5425138qve.2.1688737341415;
        Fri, 07 Jul 2023 06:42:21 -0700 (PDT)
Received: from x1n (cpe5c7695f3aee0-cm5c7695f3aede.cpe.net.cable.rogers.com. [99.254.144.39])
        by smtp.gmail.com with ESMTPSA id p8-20020a0c9a08000000b0062ffbf23c22sm2090348qvd.131.2023.07.07.06.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 06:42:21 -0700 (PDT)
Date:   Fri, 7 Jul 2023 09:42:17 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Axel Rasmussen <axelrasmussen@google.com>
Cc:     Alexander Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Brian Geffon <bgeffon@google.com>,
        Christian Brauner <brauner@kernel.org>,
        David Hildenbrand <david@redhat.com>,
        Gaosheng Cui <cuigaosheng1@huawei.com>,
        Huang Ying <ying.huang@intel.com>,
        Hugh Dickins <hughd@google.com>,
        James Houghton <jthoughton@google.com>,
        "Jan Alexander Steffens (heftig)" <heftig@archlinux.org>,
        Jiaqi Yan <jiaqiyan@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Miaohe Lin <linmiaohe@huawei.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        "Mike Rapoport (IBM)" <rppt@kernel.org>,
        Muchun Song <muchun.song@linux.dev>,
        Nadav Amit <namit@vmware.com>,
        Naoya Horiguchi <naoya.horiguchi@nec.com>,
        Ryan Roberts <ryan.roberts@arm.com>,
        Shuah Khan <shuah@kernel.org>,
        Suleiman Souhlal <suleiman@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        "T.J. Alumbaugh" <talumbau@google.com>,
        Yu Zhao <yuzhao@google.com>,
        ZhangPeng <zhangpeng362@huawei.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 7/8] selftests/mm: refactor uffd_poll_thread to allow
 custom fault handlers
Message-ID: <ZKgWOYuIdqa25Qcs@x1n>
References: <20230706225037.1164380-1-axelrasmussen@google.com>
 <20230706225037.1164380-8-axelrasmussen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230706225037.1164380-8-axelrasmussen@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 06, 2023 at 03:50:35PM -0700, Axel Rasmussen wrote:
> @@ -247,9 +245,13 @@ static int userfaultfd_stress(void)
>  {
>  	void *area;
>  	unsigned long nr;
> -	struct uffd_args args[nr_cpus];
> +	struct uffd_args *args;
>  	uint64_t mem_size = nr_pages * page_size;
>  
> +	args = calloc(nr_cpus, sizeof(struct uffd_args));
> +	if (!args)
> +		err("allocating args array failed");

This is trivial, but I think I requested a "free" (or keep it allocate on
stack) in previous version but it didn't get a response on why we cannot
and it kept going..  could you help explain?

-- 
Peter Xu


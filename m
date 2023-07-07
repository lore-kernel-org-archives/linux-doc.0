Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BF3CEB64DA
	for <linux-doc@archiver.kernel.org>; Fri,  7 Jul 2023 21:01:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231845AbjGGVBy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 7 Jul 2023 17:01:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbjGGVBx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Jul 2023 17:01:53 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3E032128
        for <linux-doc@vger.kernel.org>; Fri,  7 Jul 2023 14:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688763665;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dan6bESP0QByFGbOI4lpud/XpYRSbdBr9ACkzPME/Us=;
        b=aximQ5EB5fbnoLdt6jsps++F1y88FcA+oXPi3egIFP2x5RdzdW6T3BrT6A1RrmaFd7XuK2
        /LGp73doJYE7vDS8IuRNHYu70n0R20bARFL3tasM5QuU1mTcCaXGT+j1tAv3kqyJbVcgsa
        Ko+Lofff5PKpWcuMuXqxgcffM+rzEIs=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-aOOBLy_tMVOESGal1UUjsg-1; Fri, 07 Jul 2023 17:01:04 -0400
X-MC-Unique: aOOBLy_tMVOESGal1UUjsg-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4032a3ad8c0so5545301cf.0
        for <linux-doc@vger.kernel.org>; Fri, 07 Jul 2023 14:01:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688763664; x=1689368464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dan6bESP0QByFGbOI4lpud/XpYRSbdBr9ACkzPME/Us=;
        b=XjDOfUJxFZUvY4K8Mx6rkh5v2Nqf/hmmpoGD3sn0FCXilRGs0JUUA2OJyepU/izYbG
         m61IoIyU6EGbaT8yxrv6vYuntTX1jp/md/qcFu4/z1Kc4/BGiMSNC9Lv9irdZmHnH94R
         c8BQ3L3GhXFcGNqzSoEJ6jmwZcFjmIRcGXuAd1Fg2kmnp0pb86prd6kODInzMDxJVsas
         vaQO/g4rYSwI2ufEBgLvLeF8wtN2jEFMBeFEk5SRBj9fiBP4xipqzlW1oU5i50NrkTVx
         h2A1z/5O6N1CzjBrGpkauKp2CSff2M3zr6sdAdeCNIVjZ3R900PcagzAvZBwD7VfYEpv
         OYQw==
X-Gm-Message-State: ABy/qLYZi1/SchwKG/e6x3beGqehJ97DwPJa0WH/bGbGiWyN4mMLU8o8
        fCtaW+8YTdTPeskcpYTLP0gngQnCM6RVKb3EXoCnI6940Y6M9ra8oa+dUfZI47m/sZXZx970lj/
        jxRdBja9MDrNrJUwQwlXn
X-Received: by 2002:a05:6214:411c:b0:62b:5410:322d with SMTP id kc28-20020a056214411c00b0062b5410322dmr6797784qvb.6.1688763663954;
        Fri, 07 Jul 2023 14:01:03 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFi3ocgTXjlN1S3jnNJ0aY+HPfd5soOuCrai0nkztgKDiV5HmKoftoqMO6HM1sv+8OME69FPA==
X-Received: by 2002:a05:6214:411c:b0:62b:5410:322d with SMTP id kc28-20020a056214411c00b0062b5410322dmr6797738qvb.6.1688763663680;
        Fri, 07 Jul 2023 14:01:03 -0700 (PDT)
Received: from x1n (cpe5c7695f3aee0-cm5c7695f3aede.cpe.net.cable.rogers.com. [99.254.144.39])
        by smtp.gmail.com with ESMTPSA id b22-20020a05620a127600b0074d60b697a6sm2203149qkl.12.2023.07.07.14.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 14:01:03 -0700 (PDT)
Date:   Fri, 7 Jul 2023 17:00:49 -0400
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
Message-ID: <ZKh9AT96XiZ+6nCC@x1n>
References: <20230706225037.1164380-1-axelrasmussen@google.com>
 <20230706225037.1164380-8-axelrasmussen@google.com>
 <ZKgWOYuIdqa25Qcs@x1n>
 <CAJHvVcj-3gUC3dx4LAVnNr-zgo8+cwjGNafQ480EhDifojrcRA@mail.gmail.com>
 <CAJHvVci6qCv+d7Hz0QkqeuEZze0OFJt0P9qnWgA_cgDeaLmptQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJHvVci6qCv+d7Hz0QkqeuEZze0OFJt0P9qnWgA_cgDeaLmptQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jul 07, 2023 at 01:38:16PM -0700, Axel Rasmussen wrote:
> Ah, so I tried switching back to the {0} initializer, and was reminded
> why I didn't do that in v1. :) Ignoring the missing braces warning I
> talked about before, using {0} here is actually an error
> ("variable-sized object may not be initialized") because this is a
> variable sized array (nr_cpus isn't constant). So, that option is out.
> 
> I'm not a huge fan of adding the free() cleanup and dealing with all
> of the err() calls this function has.

Oh, that's definitely not needed - as long as we know we're going to quit,
we let kernel clean everything is fine.

I just worry in the future there can be a loop of userfaultfd_stress() so
it can OOM a host even if no err() hit but by looping.  I hope I explained
what I meant.. so it's still good we make sure things freed properly when
in success paths and when we're at it.

> 
> Originally I switched to calloc() because I'm not a big fan of VLAs
> anyway. But, as a compromise in v4 I'll leave it a VLA, and switch to
> memset() for initializing it.

That'll be good enough to me.  Thanks a lot,

-- 
Peter Xu


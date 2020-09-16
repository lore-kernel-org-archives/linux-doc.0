Return-Path: <SRS0=XgFW=CZ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AF93C35263
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 20:39:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3544621941
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 20:39:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IW54L6C4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbgIPUjF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Sep 2020 16:39:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726820AbgIPRHy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Sep 2020 13:07:54 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF021C0073EA
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2020 07:01:24 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id k25so5982168ljg.9
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2020 07:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FRVhtc4HDJxT3tTI+nfU2Ow8g0YNTmg1aLTrLZ5GLkM=;
        b=IW54L6C4ApDTRtMrNEJ761WHUDzNh6f0cykv+LQNw3a0CjeHsQ5WSlC5Rdd1ExMO1N
         9cCPBei85IFqoJiNivM/NsFjjRh0jMmXkZvXl8+m0RgCRmfbb0TDaCnnF+l+ISliosij
         42xhIIF5dTIWSliQDXT+pkI5fyEf/ayHu3Oe+m5BM/34X2OuEb+ump86QIYqpwjOVL0Q
         utbl8fBVgonNijf4+Ewdp5i0r8yGAwtjnqQrqxGFjRKnjSlI1VxDbO2bQgpDvt96hDmy
         9e+2V7Ns6VSmkb05MGw2jc+JMVAoe/cs/p230z+fFQn8RLdvy+31kVUd7E1C0vbywnX1
         A1vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FRVhtc4HDJxT3tTI+nfU2Ow8g0YNTmg1aLTrLZ5GLkM=;
        b=qTZMhGB5NjX/iRPd6ShwLa/19QBW9xq//m2j1nOAUTBAN5xZagxt5SDGaDVE8tTeAR
         vQyCT1ha34IWaZJqwlKQgi8GvV6xRvjlmTGrLoEbTN42asxB+Oh3PbJuOJ0MtdzRTvSV
         sa6aZkBMQp4JUQMt1lRIN/VytyjBNf3WiCwBBLIsZxHpiJxukMzjvRoE90ncImu2UsQf
         FvtDY6uICM6PyAZyF6zo40CpYZs4hMr1DhSqq1004CtX5JtB+qybIZz8Lu0lB0awRqBu
         F4AwwClSzv6vMBsM4hMv6Cs4wpGTCf0BF4NIQ7MOU35ro0d6qacigXaF7YI5i0mvL4Tb
         q96Q==
X-Gm-Message-State: AOAM531fUth3tF9KWGGn43B58HbIV2tkGD6DdgBjdxI79JBHhl+5qgz9
        SAvQLP+N+2yg+0/m7VjLYNbsFrG7V1eH0ZR+eWabcg==
X-Google-Smtp-Source: ABdhPJy/DTVcQ+MZ5ulLyFNlm25DBhllwomvUrKSO5bS287if90RTyimJrDNB1ExublVr5ZgN3rtY0o/m8FHLOOU8Ks=
X-Received: by 2002:a2e:b4f5:: with SMTP id s21mr8927547ljm.270.1600264883043;
 Wed, 16 Sep 2020 07:01:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200916100030.71698-1-songmuchun@bytedance.com>
In-Reply-To: <20200916100030.71698-1-songmuchun@bytedance.com>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Wed, 16 Sep 2020 07:01:11 -0700
Message-ID: <CALvZod63j475FM1p_DLOEtKmjFZ=-RbGG0eL1zTH+j4VqCrAeg@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] mm: memcontrol: Fix missing suffix of workingset_restore
To:     Muchun Song <songmuchun@bytedance.com>
Cc:     Tejun Heo <tj@kernel.org>, Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Hocko <mhocko@kernel.org>,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <guro@fb.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Cgroups <cgroups@vger.kernel.org>, linux-doc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Sep 16, 2020 at 3:00 AM Muchun Song <songmuchun@bytedance.com> wrote:
>
> We forget to add the suffix to the workingset_restore string, so
> fix it. And also update the documentation of cgroup-v2.rst.
>
> Fixes: 170b04b7ae49 ("mm/workingset: prepare the workingset detection infrastructure for anon LRU")
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>

Reviewed-by: Shakeel Butt <shakeelb@google.com>

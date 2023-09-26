Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E11B7E7D258
	for <linux-doc@archiver.kernel.org>; Tue, 26 Sep 2023 08:23:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbjIZIXg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 26 Sep 2023 04:23:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232778AbjIZIXe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Sep 2023 04:23:34 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2C1897
        for <linux-doc@vger.kernel.org>; Tue, 26 Sep 2023 01:23:27 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9b2a3fd5764so80452866b.3
        for <linux-doc@vger.kernel.org>; Tue, 26 Sep 2023 01:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695716606; x=1696321406; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j9tTw5sUAPOrchYqA3E5owwjKmHdzzHpZh+gEC9Bxy8=;
        b=sIrkm5fnHq62gxdiLho0PUJxuyqiaaJhNCpRLVeRdyS3virxw6FMkSakOFNGstwHnS
         IJPKspbKgEjUgDLxLHFXVYyiFL/JD7ZE2yYvv7Ibl8wXqFn5uhZBsESOhUXc4ABULXRk
         1PFIQIPxPFZjjiWMloZICYiMEyArrl5WDO1WMb3G5tNUe3Eogh0p4bDqNqvIaarsa8Sb
         tKf/UajuXwcYyjlO4N7Tm85kjCfeOJ/WDXs1+LWOD7a+p0IngBsXa0b0JX7jbS0qoHjA
         OQw9rcWdDar/GyM9lN9X4vssT3B20Psu6yLOKtbZ9eS8g980fenMlTfo40+Ckbb3hC14
         msrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695716606; x=1696321406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j9tTw5sUAPOrchYqA3E5owwjKmHdzzHpZh+gEC9Bxy8=;
        b=XHjxI1KmUcnz5Dy3hc8j81HHMIyOT4GPZ3pw1CGFEjM+QWcvwpz1nBbHlGVhfsELPM
         PrnrVd2GfzAvElc+ciwygCk1Y6D7ldA05ZSROXhubMpryfcwkG5NCSkVf7cLi9TI9k2f
         RlwDNksgQkvlhVW9HfVeT4supXKTG0rBwW1vbWQ6jDhSS4tOzXTHBZ5MCecLx7/1U1mn
         Uetg0a9zPR1l9GlAXlBYRIdiwJJb1uknBOM3K788/CaNCk9ic2/FthQjQ09CiishbnlG
         e0sDEcWE4rtw79pHhn4g2BQ3hNdaoqdo6R+NY+Eoy18MRrYNbycDvj7VsTaazrNsvF80
         RD9g==
X-Gm-Message-State: AOJu0YyrsFJkVhZDC0AhYDCONPks9g51yKbbVbNEtCFKbXk6934QyuTv
        47/j2+lxCc7clC1vbj6HUFDyvd0GQnuPmoB5m3DPsA==
X-Google-Smtp-Source: AGHT+IGkkx1U2rNgqDwWhUXXyiFqJYMFNsgfzF84t+MVL60Zor+PPsTYDtb+H0XGSTY7RJyc59zxkbbMgkgbUR0S9To=
X-Received: by 2002:a17:906:9d1:b0:9ad:ad5a:939b with SMTP id
 r17-20020a17090609d100b009adad5a939bmr7710821eje.7.1695716606170; Tue, 26 Sep
 2023 01:23:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230902100728.3850149-1-liushixin2@huawei.com> <ZRKIdTE+4cm0KDCI@infradead.org>
In-Reply-To: <ZRKIdTE+4cm0KDCI@infradead.org>
From:   Yosry Ahmed <yosryahmed@google.com>
Date:   Tue, 26 Sep 2023 01:22:47 -0700
Message-ID: <CAJD7tkYY7je3x-MRhayyrC0xCFvKZO8CuiEnQHanF5_ErZ2n6Q@mail.gmail.com>
Subject: Re: [PATCH] mm, memcg: expose swapcache stat for memcg v1
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Liu Shixin <liushixin2@huawei.com>, Tejun Heo <tj@kernel.org>,
        Zefan Li <lizefan.x@bytedance.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Hocko <mhocko@kernel.org>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Shakeel Butt <shakeelb@google.com>,
        Muchun Song <muchun.song@linux.dev>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Sep 26, 2023 at 12:30=E2=80=AFAM Christoph Hellwig <hch@infradead.o=
rg> wrote:
>
> On Sat, Sep 02, 2023 at 06:07:28PM +0800, Liu Shixin wrote:
> > Since commit b6038942480e ("mm: memcg: add swapcache stat for memcg v2"=
)
> > adds swapcache stat for the cgroup v2, it seems there is no reason to
> > hide it in memcg v1. Conversely, with swapcached it is more accurate to
> > evaluate the available memory for memcg.
>
> Why are we adding new features to the long deprecated cgroup v1?
>

Technically this is not a new feature, we are just exposing a stat
that the kernel is already tracking (for both cgroup v1 and v2).

The reason I suggested to expose this for cgroup v1 is because a
recent series [1] started using this stat in the kernel to make some
reclaim decisions, for both cgroup v1 and v2. Exposing the stat in v1
will make sure no one assumes the stat is only useful for v2 and break
the tracking for v1 (which might cause some reclaim regressions then).

[1]https://lore.kernel.org/lkml/20230915083417.3190512-1-liushixin2@huawei.=
com/

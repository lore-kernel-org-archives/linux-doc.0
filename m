Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADE1EC43219
	for <linux-doc@archiver.kernel.org>; Wed,  4 May 2022 17:58:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359713AbiEDSCK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 4 May 2022 14:02:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377584AbiEDSBO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 4 May 2022 14:01:14 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C3494E3B1
        for <linux-doc@vger.kernel.org>; Wed,  4 May 2022 10:17:03 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id kq17so4169852ejb.4
        for <linux-doc@vger.kernel.org>; Wed, 04 May 2022 10:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FnWaMtJ2reMZ0hSCzzXuNRbvuXwq8gpuYV5+BFONKAE=;
        b=ebMRE72btSfbTu94JZ+XbYWhvE/t1czQ57kEXj7uZgqVNjU0RU05kt542IcNMw286P
         mZ6xpaFHpoeprnPd/kWTrSQM1G1BlgktJBr4xG6RhrWbvNpjLFl0+ecdobJz9KuMfktV
         UlJP10pRifyYNtb3y8yF7fYoE45nmhJGPuHRr8itCnr4dcm9iT/w1jRlWmB9PS7QeasX
         MBbnOipnG539gw+r56zTNE0rnzgfv4xUxVI+yvcMCj1GqXyXDIgz3lhz/guXrQx5FvT8
         2GLVwiFONxmqgCymujrhnutcpLdrZszCr9yLOce9QDwfXfAXYsJDEcTv/UtDWzRMX6T4
         WUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FnWaMtJ2reMZ0hSCzzXuNRbvuXwq8gpuYV5+BFONKAE=;
        b=gt/+z6RxzrvclxqnXxqBTKp9XzKQirpfsPgo7F7WdI7zeg7YnKhc4eQnzyKwkOnRAY
         XOSZAWrch9T/9auLtuGEqCxgPm+8c1EmE86ZnlzL5Mr8HARf+5H0MViZN0gAz6W2z+m5
         AToeuG1PDUs31wR85SrC5HAyXOAFRe39hH3XWDjuNQO+trp9Oy8xO/wO6QLKzOctk/wc
         Xs0FcgaaFiMSkq2ACO5Iwe8zLV8BKzQnO413MvAO70APq1O5Qf3CQ+3TyGd0Nhn20/WG
         tVaBuES781YKvZKUthVX7XRzCLOKx8+w0eGHrND7No+FUDheiXxhrxG/BBfpYXVzBnRc
         yyFQ==
X-Gm-Message-State: AOAM5308N3gvVDmF0N5h6c5Oaa9cWiSbYxXCoc7el16khUU2zALwAjpm
        +LPgW4tEROu+/6//74dzeKvyJGvukdkYECJrpo7PiA==
X-Google-Smtp-Source: ABdhPJz/zOdjLmIrLFM4P9uo4u+sCzHObiW2BBC9Wwk/Gd0JvieVCy9Z4KHizOYES4jB3khXzoCnClSitVy5oWW1avQ=
X-Received: by 2002:a17:906:3404:b0:6f4:d33d:9d88 with SMTP id
 c4-20020a170906340400b006f4d33d9d88mr2280391ejb.446.1651684621642; Wed, 04
 May 2022 10:17:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220502231944.3891435-1-tjmercier@google.com>
 <20220502231944.3891435-2-tjmercier@google.com> <20220504121052.GA24172@blackbody.suse.cz>
In-Reply-To: <20220504121052.GA24172@blackbody.suse.cz>
From:   "T.J. Mercier" <tjmercier@google.com>
Date:   Wed, 4 May 2022 10:16:50 -0700
Message-ID: <CABdmKX2nbXLrngK8XRFCBCP=Zz-AMgKviiUdpWvEiYc-jOqang@mail.gmail.com>
Subject: Re: [PATCH v6 1/6] gpu: rfc: Proposal for a GPU cgroup controller
To:     =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc:     Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Daniel Vetter <daniel@ffwll.ch>,
        Hridya Valsaraju <hridya@google.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        John Stultz <jstultz@google.com>,
        Todd Kjos <tkjos@android.com>,
        Carlos Llamas <cmllamas@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Kalesh Singh <kaleshsingh@google.com>, Kenny.Ho@amd.com,
        Shuah Khan <skhan@linuxfoundation.org>,
        kernel-team@android.com, cgroups@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 4, 2022 at 5:10 AM Michal Koutn=C3=BD <mkoutny@suse.com> wrote:
>
> Hello.
>
> On Mon, May 02, 2022 at 11:19:35PM +0000, "T.J. Mercier" <tjmercier@googl=
e.com> wrote:
> > --- a/Documentation/admin-guide/cgroup-v2.rst
> > +++ b/Documentation/admin-guide/cgroup-v2.rst
> > [...]
> > +     The device name string is set by a device driver when it register=
s with the
> > +     GPU cgroup controller to participate in resource accounting.
>
> Are these names available anywhere else for the user? (I.e. would
> drivers add respective sysfs attributes or similar?)
>
Hi, this sounds like it could be a good idea but it'd probably be best
to do this inside gpucg_register_bucket instead of requiring drivers
to perform this externally, possibly in a non-uniform way. Maybe a
sysfs file that prints each name of the gpucg_buckets elements?
However the only names that would result from this series are the
names of the dma-buf heaps, with "-heap" appended. So they are
predictable from the /dev/dma_heap/* names, and only the system and
cma heaps currently exist upstream.

For other future uses of this controller I thought we were headed in
the direction of "standardized" names which would be
predefined/hardcoded and documented, so these names wouldn't really
need to be made available to a user at runtime.
https://lore.kernel.org/lkml/CABdmKX3gTAohaOwkNccGrQyXN9tzT-oEVibO5ZPF+eP+V=
q=3DAOg@mail.gmail.com/
>
> > +     Non-unique names will be rejected at the point of registration.
>
> This doesn't seem relevant to the cgroupfs user, does it?
> I think it should be mentioned at the respective API.
>
Yeah you're right. Thank you.

> HTH,
> Michal
>

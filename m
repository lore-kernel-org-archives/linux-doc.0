Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A8CCC433EF
	for <linux-doc@archiver.kernel.org>; Fri, 17 Jun 2022 10:19:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381305AbiFQKTU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 17 Jun 2022 06:19:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380407AbiFQKTS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Jun 2022 06:19:18 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F327566AF4
        for <linux-doc@vger.kernel.org>; Fri, 17 Jun 2022 03:19:17 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-3176b6ed923so37709397b3.11
        for <linux-doc@vger.kernel.org>; Fri, 17 Jun 2022 03:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JQLMzotVPqnvzFyRvy50GKa/chJKSSZVKNq74iFATL4=;
        b=MMFYcwLiSBGM3efNJost8LPIQiNIB7AvovEBjR71wfj7Hw3JzKGq3v9nHjbw8+PYOI
         guljfGv10VDVT+GiyiF1LWKCl2cMLo8ix7XQgdbr3i0WyZBPGP/Ef8wGxXVTGAJ3WLhK
         A76tbHoTbRG/iDL32eLLjpV+KMJMYjK8gsgxK/3qKN+HtG80/1lwQ8vcWEjqCrAQ+49K
         c6s/wRxs4RKbnUxSOlg9QjmPpwe3tT4aBPzOH7qGMWkmkTneEMAHuMviabW8OrZU9upB
         sgY9r3iMEyz289JZcqnHHns5jnLwNedThiV32+STQp8iQNrknulOq0sIWv4NEUyjZMRa
         7g0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JQLMzotVPqnvzFyRvy50GKa/chJKSSZVKNq74iFATL4=;
        b=epBYYIkKJMkZxICfmmR44xDW0aQqa3dWQKS5ISrjWCsiC8o+K79wudESFgalz8VlsR
         lnF3DzAmTffcA2DhD/fV279JLC4/Si3CHtLmZG5wnObdiIHINtRJxr0b4tYWJGXq1fzm
         bRHJRCjYyWZ64Dhi5x71qC4jkkTU84fnxfNxh5hNCvSR9/HUUZGDzA15X5qcNhohUaVV
         0Wj+O/fjb2qBr4azAs4LcIt3z2EHtRVq0/3/ExlqQ2HBEmtF+2/iaT3PjDioUvgcVyPV
         prmunh8DNhvOzOXZbz/StnrNiQXbKrxfdFBR8ZECzxjMd4E6JHqO0pyPhHhO8NobDXZo
         nsGg==
X-Gm-Message-State: AJIora8jICcgLltBpe80BkiQmQ7kQJ667lqeHO4t2r7QXstC12saxWoX
        AUHg1PY2RCZk+S/p8VJS/YZ0TGqSGAn0Zem0SND8BA==
X-Google-Smtp-Source: AGRyM1tdKx1ExiYYppt6HnbCn7siIIN642I4VhkHpcWhumKXyPkKJC/SvoSUVvnc30GsqtXMPxVJMom11hdnXaS9xSw=
X-Received: by 2002:a0d:f4c6:0:b0:30c:8e46:abe5 with SMTP id
 d189-20020a0df4c6000000b0030c8e46abe5mr10802723ywf.333.1655461156939; Fri, 17
 Jun 2022 03:19:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220523113126.171714-1-wangkefeng.wang@huawei.com>
 <20220523113126.171714-2-wangkefeng.wang@huawei.com> <CANpmjNNPf5J2OcVxoMgVtFYjWJhJ2JE+UBFyqnt6+WrPobPOHQ@mail.gmail.com>
 <20220616231350.GA1790663@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20220616231350.GA1790663@paulmck-ThinkPad-P17-Gen-1>
From:   Marco Elver <elver@google.com>
Date:   Fri, 17 Jun 2022 12:18:41 +0200
Message-ID: <CANpmjNMnA0VtExcvpV=Sr57RQ3xxVkHxhrTkvEKeHZ27bhud+w@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] asm-generic: Add memory barrier dma_mb()
To:     paulmck@kernel.org
Cc:     Kefeng Wang <wangkefeng.wang@huawei.com>, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        arnd@arndb.de, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 17 Jun 2022 at 01:13, Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Mon, May 23, 2022 at 01:35:27PM +0200, Marco Elver wrote:
> > On Mon, 23 May 2022 at 13:21, Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
> > >
> > > The memory barrier dma_mb() is introduced by commit a76a37777f2c
> > > ("iommu/arm-smmu-v3: Ensure queue is read after updating prod pointer"),
> > > which is used to ensure that prior (both reads and writes) accesses
> > > to memory by a CPU are ordered w.r.t. a subsequent MMIO write.
> > >
> > > Reviewed-by: Arnd Bergmann <arnd@arndb.de> # for asm-generic
> > > Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> >
> > Reviewed-by: Marco Elver <elver@google.com>
>
> Just checking...  Did these ever get picked up?  It was suggested
> that they go up via the arm64 tree, if I remember correctly.

I don't see them in -next, and as far as I can tell, they're not in
the arm64 tree.

Thanks,
-- Marco

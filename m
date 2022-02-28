Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEFBDC433F5
	for <linux-doc@archiver.kernel.org>; Mon, 28 Feb 2022 15:15:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235785AbiB1PPp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Feb 2022 10:15:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237489AbiB1PPo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Feb 2022 10:15:44 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2C308093F
        for <linux-doc@vger.kernel.org>; Mon, 28 Feb 2022 07:15:04 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id g6so21117684ybe.12
        for <linux-doc@vger.kernel.org>; Mon, 28 Feb 2022 07:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/DGYCHAP536Nvul99EDTG6hckPiPqs15TjdAiXjOtBM=;
        b=tVv4ipPxKA03xgTq4Dk1zw4CZCbm4XSeZKExWKEF2kL+Ubm0tK0Ln/uN0xG/ZAf+32
         SPCvUnyR0gqw+AsgGfTCnYYbi/VGmxyF5OiG6Nre9MBzbGP/LvxPZN9hky45/QD19wDg
         fZmdRtMjQCHCs6rV3Zoj08xvLSGbHvJQOGy2SGADfTfofnGtiRoXny68fLcXENZdG5T4
         H24IaYQPHJ4hyNlZnJnFwwfLO3kXKa2ebKHx7S8txcPIDu4vQfYiQnQwanJm+1vnnsHP
         SfMVdvqF46ReLi28NzQz3Qq4bGX9cCQ99Do+2SdcijBor1wiIfq+f//kjPqZ5BXLBwyI
         HCPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/DGYCHAP536Nvul99EDTG6hckPiPqs15TjdAiXjOtBM=;
        b=yk/HKpVYwUYZwkI3JRMJ+NfpmWwrkmSUdNxYMPvdM/EPGSiJKo7lt2ymYQyVPVC5JH
         uz+0I8b4W1WwqM6yQmp2zfs3Lg4HJOBXtaOQ1WnjjtwttCtYkGxCsUqKli8xHLKKwCco
         xu3REM8h8RJHJghLy9W6KK7e1rcTJhsQQosgQvRhw7URnBCTtp0KvOmYWNYwxN2E9DdZ
         i+2EcqGBPckFdvDN07wWNiAoUWwhECgeBG08rxCZFI+cB4Wml6P4/omnrem5rivZfo97
         3mVyTJxJafzruFx5860dkeF1KQ7estFQVu4bUxs1HpPbBkP+PFGmvnrLqGAjo0zNE+iw
         bcUQ==
X-Gm-Message-State: AOAM5300BgNH9GwSDn33PpWPBi3eN3zy+J3szC/doVmmzVGj10ndfb5B
        YpY9LlZGJ1W47J0R0jfZzsp3q5ffsDM4RPrbPsaHBIoKjvGmpyHr
X-Google-Smtp-Source: ABdhPJxlij0ufjiN92AH1OyL8pyemHJU/TWzZLp6QiY6vkNQ+FWGQvbI5YCIn5OheXrUj61MFz1apjjwLuJHsGh+4O4=
X-Received: by 2002:a25:d2cd:0:b0:61d:6a33:8129 with SMTP id
 j196-20020a25d2cd000000b0061d6a338129mr19241308ybg.246.1646061303068; Mon, 28
 Feb 2022 07:15:03 -0800 (PST)
MIME-Version: 1.0
References: <20220228071022.26143-1-songmuchun@bytedance.com>
 <20220228071022.26143-4-songmuchun@bytedance.com> <YhzfN574YUta3qay@bombadil.infradead.org>
In-Reply-To: <YhzfN574YUta3qay@bombadil.infradead.org>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Mon, 28 Feb 2022 23:14:27 +0800
Message-ID: <CAMZfGtXvLj+DQj=YoN6CcVfHZA-ceB24t8waMZs7KEbOoh0jUA@mail.gmail.com>
Subject: Re: [PATCH 3/3] mm: hugetlb: add hugetlb_free_vmemmap sysctl
To:     Luis Chamberlain <mcgrof@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Xiongchun duan <duanxiongchun@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Feb 28, 2022 at 10:42 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> On Mon, Feb 28, 2022 at 03:10:22PM +0800, Muchun Song wrote:
> > We must add "hugetlb_free_vmemmap=on" to boot cmdline and reboot the
> > server to enable the feature of freeing vmemmap pages of HugeTLB
> > pages. Rebooting usually taske a long time. Add a sysctl to enable
> > the feature at runtime and do not need to reboot.
> >
> > Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> > ---
> >  Documentation/admin-guide/sysctl/vm.rst | 13 +++++++++++++
> >  include/linux/hugetlb.h                 |  5 +++++
> >  include/linux/memory_hotplug.h          |  1 +
> >  kernel/sysctl.c                         | 11 +++++++++++
>
> kernel/sysctl.c is a hot mess with tons of knobs from all over the
> place. And so we've been moving these to their own place. For instance
> all the filesystem knobs are now properly in fs/. So Adding new ones
> to the file is undesirable. If this is going to be added, please add
> it somewhere in mm / hugetlb code.
>

I also have realized this when reading another patch [1]. I will
move this into its hugetlb related code.  Anyway, thanks for
your suggestion.

[1] https://lore.kernel.org/linux-fsdevel/20220220060626.15885-1-tangmeng@uniontech.com/

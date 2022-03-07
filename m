Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31803C433EF
	for <linux-doc@archiver.kernel.org>; Mon,  7 Mar 2022 17:13:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233838AbiCGROp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Mar 2022 12:14:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231767AbiCGROo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Mar 2022 12:14:44 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7585888E1
        for <linux-doc@vger.kernel.org>; Mon,  7 Mar 2022 09:13:49 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id u3so32353877ybh.5
        for <linux-doc@vger.kernel.org>; Mon, 07 Mar 2022 09:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X79+cMNSS1ZIdonvLOYEw31mZ4UOgIRIrMSuxiLNwqs=;
        b=Nd1UyuTvcWJZhAMUVe66Y3LBQ7krURoXNjJyL9N1qvXxDiuG1apnvlZVaERKYOeZCz
         S9BN14kz7JlilZvwPNsWQnbA+LJfF5CBuSx/lDCI8WaFL53mGzaKOhzw43I3p9HDdSor
         rZx1eKHHxcDsNyNS4+CiXfZNDH66pu3jrXPxA6j0vzr7ygp1CavI6Mn9hRe/R+SufDKn
         p+FMRo6UIuWO+HJ9ZysHVqhNZj8rUrshMFd11UjRHuIJ4+kGto/faPFLutotUvNU4pqV
         TxSIshPyAX6kurMeLjuUv8siLleryoFXojmKuS7fmXDqwgWzCvphiFzaR3GPJN8YxwIC
         3DYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X79+cMNSS1ZIdonvLOYEw31mZ4UOgIRIrMSuxiLNwqs=;
        b=flDi1vKzFSTuvtCgveAPSn/u/wA4vCGpoziVnYv8I8De6YLF6aNOoBZ+saFTMdBIiP
         7Xmglb8VWSbGA5DscQ0zxESXytAm030Bw2r21ffM8ovuL7sD4X3Oo7PpsxKAvPKrB8c8
         BfPf3ETfp7XFlrUWabGz/2r1jhYZSzbe5YkKWuZaK5AB77ejB3pVz6vPUNDoP4Z5WARS
         HxGtAJHEFqqdLEhi40Ik78UFFMH0K7K9uX1nAxkhcnz3WUEUelY5fsR9SovhD4/ZY4Dr
         FkCbV2A7e2mBRQYligDJLtl4AQC1leSD6OdwNiSZ2Q6VLyIqd2wb1vHIL+8rMUUQ7eaj
         hvDw==
X-Gm-Message-State: AOAM530y5hCl+XVwNDNbT7A78Mgl1ik2aURhVRKgX0kORA4TYbIW88gd
        OOpm10SLnMEF/PEElbXK8hxHwmyWXsklfmhMm9gjQw==
X-Google-Smtp-Source: ABdhPJwWjHGDU3vKlcY2eVkECJJt/KQSRMof+n3QMrZTHYiiNY/DfKR3JuCdSzZZFz34oLIQv+Fsf2cV4EqROGV7FA0=
X-Received: by 2002:a25:d188:0:b0:628:ba86:ee68 with SMTP id
 i130-20020a25d188000000b00628ba86ee68mr8622549ybg.427.1646673229137; Mon, 07
 Mar 2022 09:13:49 -0800 (PST)
MIME-Version: 1.0
References: <20220307130708.58771-1-songmuchun@bytedance.com>
 <20220307130708.58771-2-songmuchun@bytedance.com> <YiY0QkE+efo1hyda@bombadil.infradead.org>
 <CAMZfGtWHZgvFSE0P1LNprcjt0YAvC5XFAz=aUZw9vJFPGzUTbw@mail.gmail.com>
In-Reply-To: <CAMZfGtWHZgvFSE0P1LNprcjt0YAvC5XFAz=aUZw9vJFPGzUTbw@mail.gmail.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Tue, 8 Mar 2022 01:12:08 +0800
Message-ID: <CAMZfGtWUMLhYtYLNYq8WD5K1YSOegk05vtW4xwLWQcDD7pUJQA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] mm: hugetlb: disable freeing vmemmap pages when
 struct page crosses page boundaries
To:     Luis Chamberlain <mcgrof@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Oscar Salvador <osalvador@suse.de>,
        David Hildenbrand <david@redhat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        Muchun Song <smuchun@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 8, 2022 at 1:03 AM Muchun Song <songmuchun@bytedance.com> wrote:
>
> On Tue, Mar 8, 2022 at 12:35 AM Luis Chamberlain <mcgrof@kernel.org> wrote:
> >
> > On Mon, Mar 07, 2022 at 09:07:05PM +0800, Muchun Song wrote:
> > > If the size of "struct page" is not the power of two and this
> > > feature is enabled, then the vmemmap pages of HugeTLB will be
> > > corrupted after remapping (panic is about to happen in theory).
> >
> > Huh what? If a panic is possible best we prevent this in kconfig
> > all together. I'd instead just put some work into this instead of
> > adding all this run time hacks.
>
> If the size of `struct page` is not power of 2, then those lines added
> by this patch will be optimized away by the compiler, therefore there
> is going to be no extra overhead to detect this.
>
> >
> > Can you try to add kconfig magic to detect if a PAGE_SIZE is PO2?
> >
>
> I agree with you that it is better if we can move this check
> into Kconfig. I tried this a few months ago. It is not easy to
> do this. How to check if a `struct page size` is PO2 in
> Kconfig? If you have any thoughts please let me know.
>
> Thanks.

Here is a discussion [1] from a few months ago.

[1] https://lore.kernel.org/all/CAMZfGtWfz8DcwKBLdf3j0x9Dt6ZvOd+MvjX6yXrAoKDeXxW95w@mail.gmail.com/

Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D051BC04E69
	for <linux-doc@archiver.kernel.org>; Thu, 10 Aug 2023 19:23:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236038AbjHJTXm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Aug 2023 15:23:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235758AbjHJTXm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Aug 2023 15:23:42 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5124D10D
        for <linux-doc@vger.kernel.org>; Thu, 10 Aug 2023 12:23:41 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-977e0fbd742so175926266b.2
        for <linux-doc@vger.kernel.org>; Thu, 10 Aug 2023 12:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691695420; x=1692300220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3sKCHgBg4mxifvM6Xa6BVMbAED3Wj/G0loImdmtFwEk=;
        b=DAMSaiGfdsGZGv3h1zBYsjy/6kNTWZZ2jC6R+Gq/wb3WezwGLerdOYU1/NTBCz+nff
         Pb1fVwIQ8DEgjqYpuP2vO9hxYyRLTiemilsqRmjq2PDFCTFdJ/yIaguegGQFWGlwwOWk
         Ac5PwwJX5zbhqOPWWhUggVVx9vdPW9MaoYS3j2FitmTlfP5SZ2R0eSrF5vw/aa8YXX5n
         8glBok4T8cHMKBS5lyCUvbayTRkq31XB+sSVzNthfLXdaraoZBAlD+JgX07rapqt71Xl
         LOp7ZHSIvjWH+hCMZZdI9kScmZgVnx9iS1UYtG7wIn2K5vKDOa9b/hL7m4GO+ErEPlUC
         PTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691695420; x=1692300220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3sKCHgBg4mxifvM6Xa6BVMbAED3Wj/G0loImdmtFwEk=;
        b=UF9dZTHp0Ylvs1iSXkJxRsPqdBwzZanpZJ5Jp7LhuaDMCITZAz87o0LZ5uN2RQU5gX
         P1OlEqj48S1wMTJwyVBVlzL1WPYAMUrkcFD8Bptzs7VK6ro0AVupFVrQ4IxBIfGwSoVA
         JOS+p4dSIjohPP40NaVSHKQhtqRP7Li2PVjALcccQl73WUcNPV4Q3woaPzJd7JydPlum
         gT7t02Iq+02i3Eml8uVEwtsHKR3L7tlhPKkEG6r6omljYrkYSdwUadn4cX81jRI+YrjW
         IxK1H9lv1V3MO3sYyC6R41ZWhVaeg1FOr+RYNyH5Emw5/GjTgPlNflo2IF4I6IIEXRkk
         787Q==
X-Gm-Message-State: AOJu0YwjxK0yhbejqClpMZhtf032Nfr9D5oA4K4KLfOQ1mIQCXN1ndOX
        hRic27x9lXWrplmG3ab/It8HS+nHxJmA6E7UC4RG+g==
X-Google-Smtp-Source: AGHT+IHVLgL4hiCPcMn3G6OBC3NriMVoW4IgYUhiDT6aFvxlngYQ56xk71JfHlvM9pNfiVbx4Pnnj3sTDxi0Tkvfwhg=
X-Received: by 2002:a17:906:5357:b0:997:e9a3:9c59 with SMTP id
 j23-20020a170906535700b00997e9a39c59mr2962918ejo.6.1691695419686; Thu, 10 Aug
 2023 12:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230714182932.2608735-1-axelrasmussen@google.com>
 <8fbb5965-28f7-4e9a-ac04-1406ed8fc2d4@arm.com> <6a7bff41-259b-89f3-1a46-5b5b73d3fea1@redhat.com>
In-Reply-To: <6a7bff41-259b-89f3-1a46-5b5b73d3fea1@redhat.com>
From:   Axel Rasmussen <axelrasmussen@google.com>
Date:   Thu, 10 Aug 2023 12:23:03 -0700
Message-ID: <CAJHvVci_m8FcDrAeMXU8mw2OJm2fm7UbeyuLm_g3jEXDBWSMvg@mail.gmail.com>
Subject: Re: [PATCH mm-unstable fix] mm: userfaultfd: check for start + len
 overflow in validate_range: fix
To:     David Hildenbrand <david@redhat.com>
Cc:     Ryan Roberts <ryan.roberts@arm.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Brian Geffon <bgeffon@google.com>,
        Christian Brauner <brauner@kernel.org>,
        Gaosheng Cui <cuigaosheng1@huawei.com>,
        Huang Ying <ying.huang@intel.com>,
        Hugh Dickins <hughd@google.com>,
        James Houghton <jthoughton@google.com>,
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
        Peter Xu <peterx@redhat.com>, Shuah Khan <shuah@kernel.org>,
        Steven Barrett <steven@liquorix.net>,
        Suleiman Souhlal <suleiman@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        "T.J. Alumbaugh" <talumbau@google.com>,
        Yu Zhao <yuzhao@google.com>,
        ZhangPeng <zhangpeng362@huawei.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
        syzbot+42309678e0bc7b32f8e9@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 10, 2023 at 9:49=E2=80=AFAM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 10.08.23 17:53, Ryan Roberts wrote:
> > On 14/07/2023 19:29, Axel Rasmussen wrote:
> >> This commit removed an extra check for zero-length ranges, and folded =
it
> >> into the common validate_range() helper used by all UFFD ioctls.
> >>
> >> It failed to notice though that UFFDIO_COPY *only* called validate_ran=
ge
> >> on the dst range, not the src range. So removing this check actually l=
et
> >> us proceed with zero-length source ranges, eventually hitting a BUG
> >> further down in the call stack.
> >>
> >> The correct fix seems clear: call validate_range() on the src range to=
o.
> >>
> >> Other ioctls are not affected by this, as they only have one range, no=
t
> >> two (src + dst).
> >>
> >> Reported-by: syzbot+42309678e0bc7b32f8e9@syzkaller.appspotmail.com
> >> Closes: https://syzkaller.appspot.com/bug?extid=3D42309678e0bc7b32f8e9
> >> Signed-off-by: Axel Rasmussen <axelrasmussen@google.com>
> >> ---
> >>   fs/userfaultfd.c | 3 +++
> >>   1 file changed, 3 insertions(+)
> >>
> >> diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
> >> index 53a7220c4679..36d233759233 100644
> >> --- a/fs/userfaultfd.c
> >> +++ b/fs/userfaultfd.c
> >> @@ -1759,6 +1759,9 @@ static int userfaultfd_copy(struct userfaultfd_c=
tx *ctx,
> >>                         sizeof(uffdio_copy)-sizeof(__s64)))
> >>              goto out;
> >>
> >> +    ret =3D validate_range(ctx->mm, uffdio_copy.src, uffdio_copy.len)=
;
> >> +    if (ret)
> >> +            goto out;
> >>      ret =3D validate_range(ctx->mm, uffdio_copy.dst, uffdio_copy.len)=
;
> >>      if (ret)
> >>              goto out;
> >
> >
> > Hi Axel,
> >
> > I've just noticed that this patch, now in mm-unstable, regresses the mk=
dirty mm
> > selftest:
> >
> > # [INFO] detected THP size: 2048 KiB
> > TAP version 13
> > 1..6
> > # [INFO] PTRACE write access
> > ok 1 SIGSEGV generated, page not modified
> > # [INFO] PTRACE write access to THP
> > ok 2 SIGSEGV generated, page not modified
> > # [INFO] Page migration
> > ok 3 SIGSEGV generated, page not modified
> > # [INFO] Page migration of THP
> > ok 4 SIGSEGV generated, page not modified
> > # [INFO] PTE-mapping a THP
> > ok 5 SIGSEGV generated, page not modified
> > # [INFO] UFFDIO_COPY
> > not ok 6 UFFDIO_COPY failed
> > Bail out! 1 out of 6 tests failed
> > # Totals: pass:5 fail:1 xfail:0 xpass:0 skip:0 error:0
> >
> > Whereas all 6 tests pass against v6.5-rc4.
> >
> > I'm afraid I don't know the test well and haven't looked at what the is=
sue might
> > be, but noticed and thought I should point it out.
>
> That test (written by me ;) ) essentially does
>
> src =3D malloc(pagesize);
> dst =3D mmap(NULL, pagesize, PROT_READ, MAP_PRIVATE|MAP_ANON, -1, 0)
> ...
>
> uffdio_copy.dst =3D (unsigned long) dst;
> uffdio_copy.src =3D (unsigned long) src;
> uffdio_copy.len =3D pagesize;
> uffdio_copy.mode =3D 0;
> if (ioctl(uffd, UFFDIO_COPY, &uffdio_copy)) {
> ...
>
>
> So src might not be aligned to a full page.
>
> According to the man page:
>
> "EINVAL Either dst or len was not a multiple of the system page size, or
> the range specified by src and len or dst and len was invalid."
>
> So, AFAIKT, there is no requirement for src to be page-aligned.
>
> Using validate_range() on the src is wrong.

Thanks for the report and the suggestions! I sent a fixup patch which
should resolve this [1]. At least, I ran the test in question a bunch
of times and it passed reliably with this fix.

[1]: https://patchwork.kernel.org/project/linux-mm/patch/20230810192128.185=
5570-1-axelrasmussen@google.com/

>
> --
> Cheers,
>
> David / dhildenb
>

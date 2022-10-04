Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC92AC4332F
	for <linux-doc@archiver.kernel.org>; Tue,  4 Oct 2022 15:40:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbiJDPkA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 4 Oct 2022 11:40:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbiJDPj5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Oct 2022 11:39:57 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5D38DFDC
        for <linux-doc@vger.kernel.org>; Tue,  4 Oct 2022 08:39:54 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id z4so21710484lft.2
        for <linux-doc@vger.kernel.org>; Tue, 04 Oct 2022 08:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=4t0N2bprBniMQRcB/3qFmooQSc3A7XC7fAMoxb8s4/g=;
        b=C32agy2ULzvIFgr79jFj59nUVP8RorH8QzYqciN6EgVs+VNKdcz7q4CV/cJPDoLkap
         pVTwYnTBSzV/xbP8DR8g+Dr1SHKCjwbo4G9hBlXcZSlyQG6x3rI5yk5KP4hhxK51maiq
         GP4iRrKEtjAkaonVPyD30GbmgQGksw1icwsTsXjv/kNyrKGTYdP6fKKGZgSaiUqI3juO
         TyeWtPibkqaL2vZDx0wGOtu2LSjjCW1+OvOFPT1TJy4tZObbK3E+/gzHjnf3ezE02F3Y
         hBrNuVTSe81htxqDyxYC1pzaQL1kYbCggbjBGk/VdPqGw0kb39aLFZdyhvA2ugVE0H/d
         e/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=4t0N2bprBniMQRcB/3qFmooQSc3A7XC7fAMoxb8s4/g=;
        b=Ad0E1a1DJkk9fvqqnq+cDnYlmNQLnn6+OTP2Y6KXKV1xCHSK90PQTnyHYJR5eJz6Q+
         l4if7mmknxKA/IevIKpAOpak3f2xycyshegOD9jigTiFpmoGRrghpukY/O38J9QsuKUE
         KsN4qM8bmwlVJH4OeI8QfqtPOoHnuBNsvytLw+UKtsGNhz/lXXrUvPpixmEqqEPCNsJq
         3Jo7UXLv0pANNMYcOC8LAaeUKKWA+7phXlk3yvDQDgowbLqOyuqQTpP5AMrSbm+LRGXg
         grFDbijmMAMxg+rcpSmmanvsjSe9sfHnPClh3mMcWZhoj5L7Hq/vkYr1wFcmAwtWiYtC
         xvVg==
X-Gm-Message-State: ACrzQf0ik2atCfWBskSPVOHRRxbsyL5wul6nNCqLos9HYVIm4kJDkLLU
        jVip6NmtuPqicQZo9iLpLcSPi7koTu6l7eDfX6HUgQ==
X-Google-Smtp-Source: AMsMyM5k0EwfNM7bE4QTJeF9u69v1+y2xAlpFHPuF6waoo+QftXzYBsJvVbwshD+nLREU1ta1b6NNHSmr8A/Tz3xiMY=
X-Received: by 2002:a05:6512:2392:b0:4a2:550a:e21d with SMTP id
 c18-20020a056512239200b004a2550ae21dmr1274483lfv.550.1664897992505; Tue, 04
 Oct 2022 08:39:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220915142913.2213336-1-chao.p.peng@linux.intel.com>
 <20220915142913.2213336-2-chao.p.peng@linux.intel.com> <CA+EHjTyrexb_LX7Jm9-MGwm4DBvfjCrADH4oumFyAvs2_0oSYw@mail.gmail.com>
 <20220930162301.i226o523teuikygq@box.shutemov.name> <CA+EHjTyphrouY1FV2NQOBLDG81JYhiHFGBNKjT1K2j+pVNij+A@mail.gmail.com>
 <20221003110129.bbee7kawhw5ed745@box.shutemov.name>
In-Reply-To: <20221003110129.bbee7kawhw5ed745@box.shutemov.name>
From:   Fuad Tabba <tabba@google.com>
Date:   Tue, 4 Oct 2022 16:39:15 +0100
Message-ID: <CA+EHjTzS1YDS0DxMyKaUqgykKp5G637NoGPQxdORQfLfKRNqrQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/8] mm/memfd: Introduce userspace inaccessible memfd
To:     "Kirill A. Shutemov" <kirill@shutemov.name>
Cc:     "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
        linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
        Hugh Dickins <hughd@google.com>,
        Jeff Layton <jlayton@kernel.org>,
        "J . Bruce Fields" <bfields@fieldses.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Steven Price <steven.price@arm.com>,
        "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
        Vlastimil Babka <vbabka@suse.cz>,
        Vishal Annapurve <vannapurve@google.com>,
        Yu Zhang <yu.c.zhang@linux.intel.com>, luto@kernel.org,
        jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
        david@redhat.com, aarcange@redhat.com, ddutile@redhat.com,
        dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
        Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
        Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Mon, Oct 3, 2022 at 12:01 PM Kirill A. Shutemov <kirill@shutemov.name> wrote:
>
> On Mon, Oct 03, 2022 at 08:33:13AM +0100, Fuad Tabba wrote:
> > > I think it is "don't do that" category. inaccessible_register_notifier()
> > > caller has to know what file it operates on, no?
> >
> > The thing is, you could oops the kernel from userspace. For that, all
> > you have to do is a memfd_create without the MFD_INACCESSIBLE,
> > followed by a KVM_SET_USER_MEMORY_REGION using that as the private_fd.
> > I ran into this using my port of this patch series to arm64.
>
> My point is that it has to be handled on a different level. KVM has to
> reject private_fd if it is now inaccessible. It should be trivial by
> checking file->f_inode->i_sb->s_magic.

Yes, that makes sense.

Thanks,
/fuad

> --
>   Kiryl Shutsemau / Kirill A. Shutemov

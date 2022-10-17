Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E03D0C4321E
	for <linux-doc@archiver.kernel.org>; Mon, 17 Oct 2022 10:32:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230060AbiJQKcG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 Oct 2022 06:32:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230040AbiJQKcF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Oct 2022 06:32:05 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C5E35FDEE
        for <linux-doc@vger.kernel.org>; Mon, 17 Oct 2022 03:31:58 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id b1so16790120lfs.7
        for <linux-doc@vger.kernel.org>; Mon, 17 Oct 2022 03:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5nozSFDmTVpu8GTMuUa17TgcVMpawH1V5x78PIRZetg=;
        b=SDSplUZ2VPkr2D1rPark9w6rINsj4QsGj8mIaHHj3cG7qqYj2xeg5bRcHWiAiCGNxn
         GsUn6i3U2OjLAFYiVGFUliiR7Eg727DK3wDSXfnbZMZbfbIZ31+HdQCxkX49ygkx2h2T
         JvvJpr3zkIRAU4V1EE328YM6hb7KitEqUGTlUdtUSKdTXZdHKruA7oQebxjBvB7yCdng
         14amkvXgB/TlF3oG6EUoWuZ8TnSYQkSfag7jNPXgHEtx3NHXccP4GhcHXIeI1JTCLuLR
         Ff1yL/Q300jH2Amjcw85DuxVyH90T6VnZoMTJKObTmi2YSvh5JYckhqKh2RO00z96P+I
         iG8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5nozSFDmTVpu8GTMuUa17TgcVMpawH1V5x78PIRZetg=;
        b=bRMg9raMiBwjuZfGK0wyYLiAtQbdnr/psUqWK7qoMn1phNLyQx9Xwe8sAEAphjRNxA
         2QFGQQyKUhDrk/ZYOos/70TIdyYX+sVi9N4fkO/LvQfcL+QqQzEE4Pwa/0zUD9R5zqTr
         9DLDL/s5hRyjqxfh3cuYA+5hVhVVnJyV488dDPZ4I7SYE/m3uH7HA19EHIxJC4GjTPoo
         KXnADSXLNK4aWF3UOVuSDYCOD3tIsgl8PLWw73FIzD2rJ4VZBCNtd+CZ0fKrAY4JWCIV
         gAFMR8bQMEMYoEZ4qc94ZzEbxZzWvlH2b4k0SaotstCNecVL/frsEde1xrrmpcgibFfv
         fZ5g==
X-Gm-Message-State: ACrzQf1dUu9X68Ds86A2LKRFHgK3GtJ41ELi/OxOwFN3VyJj6XiJajq6
        6La1z3ym1ib6KCDKGZjGXoyL5V+VE0aHchoahWDwIw==
X-Google-Smtp-Source: AMsMyM5QQdeoCZqf4USHrTYZuLKFaoT483vufBzxBArWmR3pEEZFNUg/KtF5cabXdDzXtcRyF9bfuHIHJTBpaJKALKA=
X-Received: by 2002:a05:6512:4cb:b0:4a2:25b6:9e73 with SMTP id
 w11-20020a05651204cb00b004a225b69e73mr3967251lfq.30.1666002715568; Mon, 17
 Oct 2022 03:31:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220915142913.2213336-1-chao.p.peng@linux.intel.com>
 <20220915142913.2213336-2-chao.p.peng@linux.intel.com> <d16284f5-3493-2892-38e6-f1fa5c10bdbb@redhat.com>
 <Yyi+l3+p9lbBAC4M@google.com> <CA+EHjTzy4iOxLF=5UX=s5v6HSB3Nb1LkwmGqoKhp_PAnFeVPSQ@mail.gmail.com>
 <20220926142330.GC2658254@chaop.bj.intel.com> <CA+EHjTz5yGhsxUug+wqa9hrBO60Be0dzWeWzX00YtNxin2eYHg@mail.gmail.com>
 <YzN9gYn1uwHopthW@google.com> <CA+EHjTw3din891hMUeRW-cn46ktyMWSdoB31pL+zWpXo_=3UVg@mail.gmail.com>
 <20221013133457.GA3263142@chaop.bj.intel.com>
In-Reply-To: <20221013133457.GA3263142@chaop.bj.intel.com>
From:   Fuad Tabba <tabba@google.com>
Date:   Mon, 17 Oct 2022 11:31:19 +0100
Message-ID: <CA+EHjTzZ2zsm7Ru_OKCZg9FCYESgZsmB=7ScKRh6ZN4=4OZ3gw@mail.gmail.com>
Subject: Re: [PATCH v8 1/8] mm/memfd: Introduce userspace inaccessible memfd
To:     Chao Peng <chao.p.peng@linux.intel.com>
Cc:     Sean Christopherson <seanjc@google.com>,
        David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
        linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
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
        Yu Zhang <yu.c.zhang@linux.intel.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
        ak@linux.intel.com, aarcange@redhat.com, ddutile@redhat.com,
        dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
        Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
        Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com,
        Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

> >
> > Actually, for pKVM, there is no need for the guest memory to be
> > GUP'able at all if we use the new inaccessible_get_pfn().
>
> If pKVM can use inaccessible_get_pfn() to get pfn and can avoid GUP (I
> think that is the major concern?), do you see any other gap from
> existing API?

Actually for this part no, there aren't any gaps and
inaccessible_get_pfn() is sufficient.

> > This of
> > course goes back to what I'd mentioned before in v7; it seems that
> > representing the memslot memory as a file descriptor should be
> > orthogonal to whether the memory is shared or private, rather than a
> > private_fd for private memory and the userspace_addr for shared
> > memory. The host can then map or unmap the shared/private memory using
> > the fd, which allows it more freedom in even choosing to unmap shared
> > memory when not needed, for example.
>
> Using both private_fd and userspace_addr is only needed in TDX and other
> confidential computing scenarios, pKVM may only use private_fd if the fd
> can also be mmaped as a whole to userspace as Sean suggested.

That does work in practice, for now at least, and is what I do in my
current port. However, the naming and how the API is defined as
implied by the name and the documentation. By calling the field
private_fd, it does imply that it should not be mapped, which is also
what api.rst says in PATCH v8 5/8. My worry is that in that case pKVM
would be mis/ab-using this interface, and that future changes could
cause unforeseen issues for pKVM.

Maybe renaming this to something like "guest_fp", and specifying in
the documentation that it can be restricted, e.g., instead of "the
content of the private memory is invisible to userspace" something
along the lines of  "the content of the guest memory may be restricted
to userspace".

What do you think?

Cheers,
/fuad

>
> Thanks,
> Chao
> >
> > Cheers,
> > /fuad

Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B249EC677F1
	for <linux-doc@archiver.kernel.org>; Tue, 17 Jan 2023 14:33:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231184AbjAQOdE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 17 Jan 2023 09:33:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231950AbjAQOdA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Jan 2023 09:33:00 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 909A07AA5
        for <linux-doc@vger.kernel.org>; Tue, 17 Jan 2023 06:32:58 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id j17so47382214lfr.3
        for <linux-doc@vger.kernel.org>; Tue, 17 Jan 2023 06:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7yhLGsprr4iGbKzba+JN1VXXF3TeC3cedN8+F9epKwY=;
        b=BWKfON0ONcZ0E/73kUupX7eOFbsTtnf5zb0RLvmJL0YAhZl6oEvSZL3c/NoN0rNReU
         TIh5gjrwA6Bj/3YkDzJiL+Gls11L2i8ze76yowGZvwzeuvcwTzbo+PdTF5RRopZcOu67
         rqK/5DXAz0Cu8iK48baqurCP3Q8SHLQ3+La3MGi7OSiOLM50rap2pv9+NepuA7fvXVkZ
         JbAIYTYmlyf3SaXzCtregYhzAezlqMgzZgLa7aRWrX3Ls8Vi1NxO2mSedec1z7gAhtZm
         CjRS/N1ff7V0fQ/RSJMzu/O50kqFBmQcx8Ep1MMWXZfAdBITG7gqeNKqSuVwb7ryK8UD
         4kmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7yhLGsprr4iGbKzba+JN1VXXF3TeC3cedN8+F9epKwY=;
        b=pYxlCRxAv9owuT/UpV4snkF86vbbdZYCr1gLz9z7LZAeFNwZ/C9mfD1Xo2kxzDvlvv
         9UvcpBd00lLgHPMsgY0iVOeu7nivKHjh7u8AIDZnd7AJfiu7D8EPqh0ipQfd57ylCgzs
         AC9WkI5Ow15CnlZOiNLxn9sy2/UmaPUCskDvo1V2goTqSIqz3VBsFufo02YZGCSDt6zk
         gCjVXPiysUHJLkoIpBYXG1L01AbU+SeRNm0E1McCyMu1AyfyBD25q8xlsuIQXDKYar0l
         01yAdsCcmk0M2elQ5X3dNAXU41KUVtT6bKrHZYVrgPVjRkRT0wm3DB6wziwxMw+7kq+e
         dUlA==
X-Gm-Message-State: AFqh2kovTmEsWJodhqQ702azQggYp6mp6aLK4+FignKpwGgtqfz7tn8W
        jeJnAx+B0EgcEoHcxnx3CWGIAffb5rcczGe3m86XmQ==
X-Google-Smtp-Source: AMrXdXsPS/EHa9ll4sjoGtdooNfVuEuQvNaydQDhDfaDKMnyvvZ6mWGGNpzl0ThBONl2d+/I1rYOtZu/xqsiIx9Cz3Y=
X-Received: by 2002:a05:6512:3b9b:b0:4d5:850a:8330 with SMTP id
 g27-20020a0565123b9b00b004d5850a8330mr128086lfv.665.1673965976657; Tue, 17
 Jan 2023 06:32:56 -0800 (PST)
MIME-Version: 1.0
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com> <Y8H5Z3e4hZkFxAVS@google.com>
In-Reply-To: <Y8H5Z3e4hZkFxAVS@google.com>
From:   Fuad Tabba <tabba@google.com>
Date:   Tue, 17 Jan 2023 14:32:19 +0000
Message-ID: <CA+EHjTyVfm5L0kch2rT1HwaDHjVOxnZozV2PKWViKY00igHawg@mail.gmail.com>
Subject: Re: [PATCH v10 0/9] KVM: mm: fd-based approach for supporting KVM
To:     Sean Christopherson <seanjc@google.com>
Cc:     Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
        qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Naoya Horiguchi <naoya.horiguchi@nec.com>,
        Miaohe Lin <linmiaohe@huawei.com>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
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
        ak@linux.intel.com, david@redhat.com, aarcange@redhat.com,
        ddutile@redhat.com, dhildenb@redhat.com,
        Quentin Perret <qperret@google.com>,
        Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
        wei.w.wang@intel.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Sean,

On Sat, Jan 14, 2023 at 12:38 AM Sean Christopherson <seanjc@google.com> wrote:
>
> On Fri, Dec 02, 2022, Chao Peng wrote:
> > This patch series implements KVM guest private memory for confidential
> > computing scenarios like Intel TDX[1]. If a TDX host accesses
> > TDX-protected guest memory, machine check can happen which can further
> > crash the running host system, this is terrible for multi-tenant
> > configurations. The host accesses include those from KVM userspace like
> > QEMU. This series addresses KVM userspace induced crash by introducing
> > new mm and KVM interfaces so KVM userspace can still manage guest memory
> > via a fd-based approach, but it can never access the guest memory
> > content.
> >
> > The patch series touches both core mm and KVM code. I appreciate
> > Andrew/Hugh and Paolo/Sean can review and pick these patches. Any other
> > reviews are always welcome.
> >   - 01: mm change, target for mm tree
> >   - 02-09: KVM change, target for KVM tree
>
> A version with all of my feedback, plus reworked versions of Vishal's selftest,
> is available here:
>
>   git@github.com:sean-jc/linux.git x86/upm_base_support
>
> It compiles and passes the selftest, but it's otherwise barely tested.  There are
> a few todos (2 I think?) and many of the commits need changelogs, i.e. it's still
> a WIP.
>
> As for next steps, can you (handwaving all of the TDX folks) take a look at what
> I pushed and see if there's anything horrifically broken, and that it still works
> for TDX?
>
> Fuad (and pKVM folks) same ask for you with respect to pKVM.  Absolutely no rush
> (and I mean that).

Thanks for sharing this. I've had a look at the patches, and have
ported them to work with pKVM. At a high level, the new interface
seems fine and it works with the arm64/pKVM port. I have a couple of
comments regarding some of the details, but they can wait until v11 is
posted.

Cheers,
/fuad



> On my side, the two things on my mind are (a) tests and (b) downstream dependencies
> (SEV and TDX).  For tests, I want to build a lists of tests that are required for
> merging so that the criteria for merging are clear, and so that if the list is large
> (haven't thought much yet), the work of writing and running tests can be distributed.
>
> Regarding downstream dependencies, before this lands, I want to pull in all the
> TDX and SNP series and see how everything fits together.  Specifically, I want to
> make sure that we don't end up with a uAPI that necessitates ugly code, and that we
> don't miss an opportunity to make things simpler.  The patches in the SNP series to
> add "legacy" SEV support for UPM in particular made me slightly rethink some minor
> details.  Nothing remotely major, but something that needs attention since it'll
> be uAPI.
>
> I'm off Monday, so it'll be at least Tuesday before I make any more progress on
> my side.
>
> Thanks!

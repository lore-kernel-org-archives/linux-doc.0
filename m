Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89756C77B6E
	for <linux-doc@archiver.kernel.org>; Wed, 12 Apr 2023 22:01:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbjDLWBp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 12 Apr 2023 18:01:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229830AbjDLWBo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Apr 2023 18:01:44 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 408B459E1
        for <linux-doc@vger.kernel.org>; Wed, 12 Apr 2023 15:01:43 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-54f8a3ded60so42670727b3.8
        for <linux-doc@vger.kernel.org>; Wed, 12 Apr 2023 15:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681336902; x=1683928902;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FXF6AhQnwp1n/IhYSnfZVqcASsRtZ9yL6mJXzW8Mi9w=;
        b=itcYyHsTjH+BWioeMOzHRsDUxYxnEou8ifBndkBXI6TNX5xq/HUkT1AyyhCCB+jlgg
         3qhGiIFyP5GPmeAb9F/cGYLL0T6ndH4Anu3KiFTJ2zgUv7rYRpICAgBSTO4SmMWQG2dj
         4lYV/RthfLCJMCgdpXeycR2egix1Qp8q862Y6ehJoE8Zrk7VpCCp7zEkzxGBY8nv1lJY
         RZQCmJ4imt199cSg173cMIapT9cfLep+3yZW0B5b36RF/xqQ9iUnS4egjGE1JSQeu6db
         gbh/vWlrrOQUF9lx8wSU9AC22JYq+cM0a/46K9zgrM+CGG4alQS9oe5dHDfglVggicdO
         Y9Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681336902; x=1683928902;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FXF6AhQnwp1n/IhYSnfZVqcASsRtZ9yL6mJXzW8Mi9w=;
        b=kdK+aZDgX71InSB6lPXKnLbt8o2opDnuMIB2EIf2pjhZcRH82acKRhaoyf/2f9j0Hd
         fT/nT5ihf3jn3CvS+GSbmIO6o2JD/cUJb4R/4RvrseoatIsbwEMQiLAyYKB3vv13v4PO
         /A1I5e3KvM46FMGgpw3/gzN+LmH+6k4FbNQriyKl1bibW6z8l+7oBsCoNZOY7cjUh6CR
         4EoxfLwF1R3bISbOVPKOB6S3Nr+pBvrInvxFzfmLgOW+8+/oca/XZanltPC4egCPO7qa
         nrSJXCiGtJ2XQXxEAWagHzdq/gJvTFTBmgnL8YbFsiQvfubVPhmhAggBcI+7tE8Vzkfu
         OzOA==
X-Gm-Message-State: AAQBX9dAu+k4C5dfCBM0WiefWgA06Jy44d3Wn4LXCzHVQLBQm8POq+El
        tYD6LBcuDWM7SNVU7y1h3nI46JYw3E8=
X-Google-Smtp-Source: AKy350artxVLouCy5UXXqGRd6vaUaGCzjJlbptUimGvT0630mPFw3RBlFaQsm42qDt42zFcnXgHxxlmRTKU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:cc07:0:b0:b8b:fe5f:2eaa with SMTP id
 l7-20020a25cc07000000b00b8bfe5f2eaamr43241ybf.2.1681336902548; Wed, 12 Apr
 2023 15:01:42 -0700 (PDT)
Date:   Wed, 12 Apr 2023 15:01:41 -0700
In-Reply-To: <20230323012737.7vn4ynsbfz7c2ch4@amd.com>
Mime-Version: 1.0
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <Y8H5Z3e4hZkFxAVS@google.com> <20230119111308.GC2976263@ls.amr.corp.intel.com>
 <Y8lg1G2lRIrI/hld@google.com> <20230119223704.GD2976263@ls.amr.corp.intel.com>
 <Y880FiYF7YCtsw/i@google.com> <20230213130102.two7q3kkcf254uof@amd.com>
 <20230221121135.GA1595130@chaop.bj.intel.com> <20230323012737.7vn4ynsbfz7c2ch4@amd.com>
Message-ID: <ZDcqRY6UMmpyf/so@google.com>
Subject: Re: [PATCH v10 0/9] KVM: mm: fd-based approach for supporting KVM
From:   Sean Christopherson <seanjc@google.com>
To:     Michael Roth <michael.roth@amd.com>
Cc:     Chao Peng <chao.p.peng@linux.intel.com>,
        Isaku Yamahata <isaku.yamahata@gmail.com>, kvm@vger.kernel.org,
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
        Quentin Perret <qperret@google.com>, tabba@google.com,
        mhocko@suse.com, wei.w.wang@intel.com
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Mar 22, 2023, Michael Roth wrote:
> On Tue, Feb 21, 2023 at 08:11:35PM +0800, Chao Peng wrote:
> > >   *fixup (upm_base_support): KVM: use inclusive ranges for restrictedmem binding/unbinding
> > >   *fixup (upm_base_support): mm: restrictedmem: use inclusive ranges for issuing invalidations
> > 
> > As many kernel APIs treat 'end' as exclusive, I would rather keep using
> > exclusive 'end' for these APIs(restrictedmem_bind/restrictedmem_unbind
> > and notifier callbacks) but fix it internally in the restrictedmem. E.g.
> > all the places where xarray API needs a 'last'/'max' we use 'end - 1'.
> > See below for the change.
> 
> Yes I did feel like I was fighting the kernel a bit on that; your
> suggestion seems like it would be a better fit.

Comically belated +1, XArray is the odd one here.

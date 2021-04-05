Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0339AC433B4
	for <linux-doc@archiver.kernel.org>; Mon,  5 Apr 2021 00:30:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C946C6136A
	for <linux-doc@archiver.kernel.org>; Mon,  5 Apr 2021 00:30:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231716AbhDEAaY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 4 Apr 2021 20:30:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231708AbhDEAaX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 4 Apr 2021 20:30:23 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96DACC061788
        for <linux-doc@vger.kernel.org>; Sun,  4 Apr 2021 17:30:17 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id o16so11121790ljp.3
        for <linux-doc@vger.kernel.org>; Sun, 04 Apr 2021 17:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4djxblumYsM0MYjaTI3gAeclQoo4tMzFZGJUydviNoY=;
        b=k9XPOH16pkp6wIhN6fUXTfgtf00C1nX1vfWzkAoJCwZhTPryGhPETEbWtKNuql8dcT
         J66HvvN+nGIGX/hWkB2rtYjC7ogWFD4Rd4IZkQ0bS/rYf5HmIGTyE/ZylI39cDqXlZLQ
         DrwfgJgtrdAYa4RnReHlFBjkf09I61p5QCpFtdcJBiTqN5do0FBlf/GNBAM4Sa4K9fTt
         O0Sc6EJP96oqfCYeJaor+ktU4xDDekqEt6oEKns8rGYAeQWl4AQoPK1E7sIISi8w1r2q
         CU1BS4YW9udqw0T/oEayc0e8nZsTv0pujP4QcRjuay7oCDxyx5293bIck4CW+rAYTTaJ
         a32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4djxblumYsM0MYjaTI3gAeclQoo4tMzFZGJUydviNoY=;
        b=VMzr3CA24eN88SF+4025UBV3Av/OxxPiBQzVzlVsCIk6EWX6SHyaAu/aJD/FpNGkEN
         qMst6hVJRiDEgOQy5qr+Jc23+x2dDzh0spBWhcgjDLfmpz4jL6JyKfDhQI1aAI9f9oe1
         ZlZq8g1jaJfJzkMcuhVVK9ZfdS7RKtyJnAjhqRe3CI+dH6o6nB0hC6GHOGbRfTR5Knl7
         3SotWe3VZPdSK6d2YBFE6VzJZHDoiaJQZJ9okd0uaE2cp46KDcsW/LtjHte3Mtjg1zQh
         OKNnLzoYMDHDUe4o0m+T8Q2lku7CAW3yl2aAiGaC0BZzVgqS1GvzImaHr3bPXdMOAMh8
         zTWg==
X-Gm-Message-State: AOAM530zZIwvkkwsnVithpvxT2zPaIKhub/OwYwS+U3jSkZcwLew/xdf
        AhgSrNmJDa7xbhnCVxm5ROb3ZFl2Z95UVhPyda54Gg==
X-Google-Smtp-Source: ABdhPJya1pQ3m+PBzENKSEcDzB6ja6iy+5Hr6CE5/UQqlDXSenL4ol3iYtZBtv3DVLGum6BVeQ8oNUuY6m+mGf4u65w=
X-Received: by 2002:a2e:87d8:: with SMTP id v24mr14196684ljj.387.1617582615756;
 Sun, 04 Apr 2021 17:30:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210330044206.2864329-1-vipinsh@google.com> <YGn42SKCPg2HWtQc@mtj.duckdns.org>
In-Reply-To: <YGn42SKCPg2HWtQc@mtj.duckdns.org>
From:   Vipin Sharma <vipinsh@google.com>
Date:   Sun, 4 Apr 2021 17:29:59 -0700
Message-ID: <CAHVum0fhWSOFRS-t7cF=zCRf_SUoMN5UOYBChWSpmhJVcuMbsg@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] cgroup: New misc cgroup controller
To:     Tejun Heo <tj@kernel.org>
Cc:     =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
        Jacob Pan <jacob.jun.pan@intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Brijesh <brijesh.singh@amd.com>, Jon <jon.grimm@amd.com>,
        Eric <eric.vantassell@amd.com>, pbonzini@redhat.com,
        hannes@cmpxchg.org, Janosch Frank <frankja@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>, corbet@lwn.net,
        Sean Christopherson <seanjc@google.com>, vkuznets@redhat.com,
        wanpengli@tencent.com, Jim Mattson <jmattson@google.com>,
        joro@8bytes.org, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, hpa@zytor.com, Matt Gingell <gingell@google.com>,
        David Rientjes <rientjes@google.com>, kvm@vger.kernel.org,
        x86@kernel.org, cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Apr 4, 2021 at 10:35 AM Tejun Heo <tj@kernel.org> wrote:
>
> Applied to cgroup/for-5.13. If there are further issues, let's address them
> incrementally.
>
> Thanks.
>
> --
> tejun

Thanks Tejun for accepting and guiding through each version of this
patch series.

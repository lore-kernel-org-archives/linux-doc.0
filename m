Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB43DC433E0
	for <linux-doc@archiver.kernel.org>; Thu, 18 Feb 2021 14:42:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6CC7E64EAE
	for <linux-doc@archiver.kernel.org>; Thu, 18 Feb 2021 14:42:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbhBROlY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 18 Feb 2021 09:41:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233143AbhBRMjz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Feb 2021 07:39:55 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8F04C061756
        for <linux-doc@vger.kernel.org>; Thu, 18 Feb 2021 04:39:11 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id 7so2848309wrz.0
        for <linux-doc@vger.kernel.org>; Thu, 18 Feb 2021 04:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=b4Hk9Xkt4Q3LlvCihgo4WN89RwASW9sNa4+yXZPWHPw=;
        b=e2wBy1MEwC/GnkPUKP18oTIaZeV+3cuJQuXXon38Nat/uZM3dk0R0b47WOIe0tSJDk
         5rqG7MssU6N82c00g4XY/bDJNn2rOyyoq2l7UaVohob9V0PgKH4ng+CoWaekt5KnzBXf
         9vFYK65ZKg0hp8mEF4FBAv0A5XJy0Ga3q8wVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=b4Hk9Xkt4Q3LlvCihgo4WN89RwASW9sNa4+yXZPWHPw=;
        b=PGF5Ol6apyF9nDrgj/mqHgmeUl1AF5UP53ZxJYTZtbaF9Vr7hW2Uk05Y0S5HnWM+S/
         V2HeYJkxBWDfiXpWv+kz6ILHrUk4fJ0Kto2pebQptQAApXJFXcq45PZgpq/iEJFMmZzw
         rnMChjgZgThBPbBtMrDT0JDqXnpUAUgmTC4yJcYizf0d9MXpW9Yp/p3tPQVj8Dvs7/Ps
         ZzEGfyA0zrNIyKhweSvCl/nH3g1iNqu/3Yjq0LC8Z9jnobQ+/mkZMeBq+riVP4gnQBNs
         idlZP6NgB735HzbjWPTLO6/K+Akt/4Z/gBtK3qQLTUj/Y481v2z58N3l5wS0NxCvmPt2
         XuSg==
X-Gm-Message-State: AOAM531jXrQl+2hBELA+lN/NdUBvHf3MhfU1YtSpJujuttPryEQb3FRo
        i8SjncoCLflxDwkGRgiyCwEIyQ==
X-Google-Smtp-Source: ABdhPJwUakPH1ZbGEB2SO4sHsjmVQffVAVDx0FvlBYPTCQdYSSxqg/qebMbkRC6RmykPuzbcG3Ur4g==
X-Received: by 2002:adf:fb51:: with SMTP id c17mr4302952wrs.145.1613651950397;
        Thu, 18 Feb 2021 04:39:10 -0800 (PST)
Received: from localhost ([2620:10d:c093:400::4:f7e9])
        by smtp.gmail.com with ESMTPSA id z63sm7641374wme.8.2021.02.18.04.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 04:39:09 -0800 (PST)
Date:   Thu, 18 Feb 2021 12:39:09 +0000
From:   Chris Down <chris@chrisdown.name>
To:     Eiichi Tsukata <eiichi.tsukata@nutanix.com>
Cc:     Michal Hocko <mhocko@suse.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "mcgrof@kernel.org" <mcgrof@kernel.org>,
        "keescook@chromium.org" <keescook@chromium.org>,
        "yzaikin@google.com" <yzaikin@google.com>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
        Felipe Franciosi <felipe@nutanix.com>,
        "shakeelb@google.com" <shakeelb@google.com>
Subject: Re: [RFC PATCH] mm, oom: introduce vm.sacrifice_hugepage_on_oom
Message-ID: <YC5f7SalbXhemwV7@chrisdown.name>
References: <20210216030713.79101-1-eiichi.tsukata@nutanix.com>
 <YCt+cVvWPbWvt2rG@dhcp22.suse.cz>
 <bb3508e7-48d1-fa1b-f1a0-7f42be55ed9c@oracle.com>
 <YCzMVa5QSyUtlmnI@dhcp22.suse.cz>
 <D66DC6A7-C708-4888-8FCF-E4EB0F90ED48@nutanix.com>
 <YC0MiqwCGp90Oj4N@dhcp22.suse.cz>
 <99FF105C-1AAB-40F3-9C13-7BDA23AD89D9@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <99FF105C-1AAB-40F3-9C13-7BDA23AD89D9@nutanix.com>
User-Agent: Mutt/2.0.5 (da5e3282) (2021-01-21)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Eiichi Tsukata writes:
>>> But that comes with a challenge: despite listening on cgroup for
>>> pressure notifications (which happen from those runtime events we do
>>> not control),
>>
>> We do also have global pressure (PSI) counters. Have you tried to look
>> into those and try to back off even when the situation becomes critical?
>
>Yes. PSI counters help us to some extent. But we've found that in some cases
>OOM can happen before we observe memory pressure if memory bloat occurred
>rapidly. The proposed failsafe mechanism can cover even such a situation.
>Also, as I mentioned in commit message, oom notifiers doesn't work if OOM
>is triggered by memory allocation for kernel.

Hmm, do you have free swap? Without it, we can trivially go from fine to OOM in 
a totally binary fashion. As long as there's some swap space available, there 
should be a clear period where pressure is rising prior to OOM.

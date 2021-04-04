Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 951EDC433B4
	for <linux-doc@archiver.kernel.org>; Sun,  4 Apr 2021 17:35:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4559E61287
	for <linux-doc@archiver.kernel.org>; Sun,  4 Apr 2021 17:35:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbhDDRfi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 4 Apr 2021 13:35:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229861AbhDDRfb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 4 Apr 2021 13:35:31 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77543C061756;
        Sun,  4 Apr 2021 10:35:24 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id i9so9696949qka.2;
        Sun, 04 Apr 2021 10:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=33J8OtutelowSioLnJ+BV370Ve8/xBpuUEz5H46uwPQ=;
        b=DpC5OcjNicGSE5IHLbNl9o0O/n6y7SZQIRP1OF7pZYWEW8TYxgpEXUHI0e7ZPfxSEm
         A+O7GebbfT58u7Lpmiv6sBL3Yk+EujsWCCzrB3aDx97xfLrwLc7CEIA8SeXMDdCVwmsY
         BPqIQTgWEwBURoGagdqHuCG92UlwBGsrjntu1SWK8cLpRmxtUAgouhJt3WpC0vh9OdW9
         /I9txAgZWSB1mY1LSilQo4XMQDZA+0riwckuXe5LjY1cgRMODU/Q+/YhfbHA3JSSUHSn
         Ns1fZL7rLbr7viGLe8jOTv5XiK3tpOFOFQJ5gwIh9kukMUGZbtQgthNUDTrY1AdaBS8H
         2Dkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=33J8OtutelowSioLnJ+BV370Ve8/xBpuUEz5H46uwPQ=;
        b=lahu8UBP+wAlQNbXaTnty0HzuPumwn1j963aHKGjtUzkgd3zo3js0O7n74sRrMq7yw
         nL6GxG3mi+jSxSwBD8/B4xjZRnw3OA7GE0mieggtWoHilIkpL6BER5ZTiaayYahWGfSE
         Gxgmr8H5BVGHmRA6UgNDTShWhhTgeQiEz3FKlxcu5qaZ+rHtJZ0AYtTtJFzv5YQn0kuL
         0hG+9fz+2/KtQgPlAfp8topDJCA7Iim3soM6F2q6GFaS8yMQIaNS1yITErah+izfxnVD
         upfdfazB2h58wHG5lKpmo3hHzv14MBr4KkX/OmDgHLt/AtfF2HABEDkzVBKleKXV7it+
         tfYw==
X-Gm-Message-State: AOAM531C/ff+++GgUF3IBQab2MP9E6XE86ctgWoFyuFCdQx/MPoUAKfE
        2A5npCrxLr86kTfY/NV0cy8=
X-Google-Smtp-Source: ABdhPJzymD6qe59ckoaxT0GUwxUpiC8bP3gyvGuaN3f4jU+CgDo/aeVmQ14oOVOMQ13+4UWZAekMYA==
X-Received: by 2002:a05:620a:14f:: with SMTP id e15mr21094562qkn.315.1617557723397;
        Sun, 04 Apr 2021 10:35:23 -0700 (PDT)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [199.96.183.179])
        by smtp.gmail.com with ESMTPSA id w5sm11732174qkc.85.2021.04.04.10.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 10:35:22 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date:   Sun, 4 Apr 2021 13:35:21 -0400
From:   Tejun Heo <tj@kernel.org>
To:     Vipin Sharma <vipinsh@google.com>
Cc:     mkoutny@suse.com, jacob.jun.pan@intel.com, rdunlap@infradead.org,
        thomas.lendacky@amd.com, brijesh.singh@amd.com, jon.grimm@amd.com,
        eric.vantassell@amd.com, pbonzini@redhat.com, hannes@cmpxchg.org,
        frankja@linux.ibm.com, borntraeger@de.ibm.com, corbet@lwn.net,
        seanjc@google.com, vkuznets@redhat.com, wanpengli@tencent.com,
        jmattson@google.com, joro@8bytes.org, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, hpa@zytor.com, gingell@google.com,
        rientjes@google.com, kvm@vger.kernel.org, x86@kernel.org,
        cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] cgroup: New misc cgroup controller
Message-ID: <YGn42SKCPg2HWtQc@mtj.duckdns.org>
References: <20210330044206.2864329-1-vipinsh@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210330044206.2864329-1-vipinsh@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Applied to cgroup/for-5.13. If there are further issues, let's address them
incrementally.

Thanks.

-- 
tejun

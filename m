Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B158CC433EF
	for <linux-doc@archiver.kernel.org>; Tue, 28 Jun 2022 12:34:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344096AbiF1MeQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 28 Jun 2022 08:34:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245663AbiF1MeQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Jun 2022 08:34:16 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 341BF2DAB6
        for <linux-doc@vger.kernel.org>; Tue, 28 Jun 2022 05:34:15 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id c4so10932648plc.8
        for <linux-doc@vger.kernel.org>; Tue, 28 Jun 2022 05:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AgtvVhfkB9MFjPDZk0eW6qF15/HI/14VLMJggWohgtE=;
        b=FzhYTx698OOjOlAKVGM1J4TElebsB4vmarv8/HnHUHhC7cxyADcBoWzbyvHI+muvdi
         37QqLTEMcNFXXEZeBiit0D6jJmcl+D+fogXsNTlgq1xvuTT4uNE97ebrSBBMq3d9MgBa
         BX2DT6gtYAl1Xyn2/dIDFHx039BQrHp+P/bwXZoXsw2aNMXOP5W+PXG7KJoDbLe/7aLN
         JNmYI/N87eI/KIxN4vsm7RGs119nknLqjrl5j7++iuDy/t7piYtzd22zX/BnzClkrGeR
         b6uFhQkmAgi09s6rh0Wg4+QSC06ZqH6s1M6BkiC4XSKiXfyPermoWXK1gBNmNK0fJIua
         9xcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AgtvVhfkB9MFjPDZk0eW6qF15/HI/14VLMJggWohgtE=;
        b=VAzJFeooo6J8aqlHUwIlQ9yhxT1m0LspY0uVEDb6aRu+wN/mIjIJyPUpA4pLlIhcTK
         G4wE4dsoH0l7qM2CA6rub4T4/cTSNpHNeCqElk0nVYcTjho5qGRD92K4+GPBgVq87NiY
         Q3lOnOkm+4Of/Cj7bomhUTwnmNLdG9Dbs6QOX27MbTmVb+5JXja5BC5Ovk8iLXoJKQ29
         J4XQm1fi/9ywerUXs+Ja9J3S2unspsK5pi3czHuUZ2zGQ1BTibtxehP03rsFouYNGP6b
         FXREGkS81bFzTIX3QNLmHgc2b//La1KqBTVlrZPl7gyq37iaLazGeoMuk7/SCnlx9gDt
         TN4Q==
X-Gm-Message-State: AJIora9Ej3ZG6mIy4fs6tp9Mc9t1t10FqtiGe5nswyqii1g0XgzIKibN
        pY8/Qt7w4XloS4EAvAkQlc49/A==
X-Google-Smtp-Source: AGRyM1s45gTXj2HZCAEzzkN9IeQD+456rgjNd0s9t9KrgatOucowm4Ql5Rn52HnVu3lNsc2JcGW+Vw==
X-Received: by 2002:a17:90b:1982:b0:1ec:e2fa:99ae with SMTP id mv2-20020a17090b198200b001ece2fa99aemr26478986pjb.228.1656419654716;
        Tue, 28 Jun 2022 05:34:14 -0700 (PDT)
Received: from MacBook-Pro.local.net ([139.177.225.225])
        by smtp.gmail.com with ESMTPSA id t5-20020a17090abc4500b001ea629a431bsm9409454pjv.8.2022.06.28.05.34.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jun 2022 05:34:14 -0700 (PDT)
From:   lizhe.67@bytedance.com
To:     hpa@zytor.com
Cc:     bp@alien8.de, dave.hansen@intel.com, dave.hansen@linux.intel.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        lizefan.x@bytedance.com, lizhe.67@bytedance.com, mingo@redhat.com,
        tglx@linutronix.de, x86@kernel.org
Subject: Re: [RFC] memmap: introduce cmdline parameter "memmap=nn[KMG]$" without start addr
Date:   Tue, 28 Jun 2022 20:34:02 +0800
Message-Id: <20220628123402.14573-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <0EA9CBD4-D083-4546-BFAC-9C3A97420E5B@zytor.com>
References: <0EA9CBD4-D083-4546-BFAC-9C3A97420E5B@zytor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 23 Jun 2022 11:22:52, H. Peter Anvin <hpa@zytor.com> wrote:
>>On 6/22/22 23:24, lizhe.67@bytedance.com wrote:
>>> In our scenario, we need reserve or alloc large continous memory like
>>> 256M in machine which have different memory specification at just
>>> boot phase for a user land process.
>>
>>Just marking the memory reserved doesn't do any good by itself.  There
>>must be some *other* kernel code to find this reserved area and make it
>>available to userspace.
>>
>>It seems kinda silly to add this to the kernel without also adding the
>>other half of the solution.  Plus, we don't really even know what this
>>is for.  Are there other, better solutions?  I certainly can't offer any
>>because this changelog did not provide a full picture of the problem
>>this solves.
>
>Don't we already have a large contiguous physical memory allocator for this reason (misdesigned hardware?)

Yes we have already considered using CMA to realize the requirement. But CMA
only provides several kernel space interface for memory allocation. It seems
that userspace do not have a way to access those memory at current kernel.
In our scenario, we need to reserve large continuous physical memory for a
userspace program. It stores some data into memory and a hardware will consume
them. So allocing an area of large continuous memory for userspace program is
the best way for us.

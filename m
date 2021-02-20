Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 650D1C433E0
	for <linux-doc@archiver.kernel.org>; Sat, 20 Feb 2021 22:47:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 234F264DEC
	for <linux-doc@archiver.kernel.org>; Sat, 20 Feb 2021 22:47:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbhBTWr0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 20 Feb 2021 17:47:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbhBTWrZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 20 Feb 2021 17:47:25 -0500
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0267DC061786
        for <linux-doc@vger.kernel.org>; Sat, 20 Feb 2021 14:46:45 -0800 (PST)
Received: by mail-qt1-x832.google.com with SMTP id b24so6728033qtp.13
        for <linux-doc@vger.kernel.org>; Sat, 20 Feb 2021 14:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:subject:message-id:mime-version:content-disposition;
        bh=hA34I866ynxoTjdulLiMwJenXHpza28qpIFLUyFZEYQ=;
        b=I6XGSqe8v4NDadVxkCD3LBkTapnh8hZOUG+uLGH42uz4mqnuFXT/Gx8ex84OtyUHra
         0+74Rydbr5yiQ5kHq7kHBXtKNez53fa3XJcGrsa0qB81ttfnsFu4f2CO1qb9rlzabfMv
         PeprxlY9UxE4RjIHuiWkQ4O2EOEKR/4pbhb+ROOiHerIuKtnK8ONQvjWomvTnH35sVCE
         gaSMWZGwda9d23z1cfQgE9blIkC8jrxAlkgNVSoS8cfsDPzkWPfID/VY9/5PioHQR8R0
         80SAJXC+U/oeM6On8MKiJ3xVkEXsmhnk5lRtg2r/LlzbF8l21w8fuKMhAhiB5XtmNxLO
         9NpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:subject:message-id:mime-version
         :content-disposition;
        bh=hA34I866ynxoTjdulLiMwJenXHpza28qpIFLUyFZEYQ=;
        b=PoyL0lFhYUfIJ0ZxPPm1W6ssrA1r2r8P7JbQdtP9V2XwAJclejRUZD3ef6vWjd+Cq2
         caGFEqiRAsLs2jHt4BClFJ9pYOE9RCwNHZiIPW92euyRYggagDYSc54RowG2m27Pw0Wz
         J5Bvo0ZQLXGR+QY0vLHhNvc0ojO9DOXB4xzk6Q1gNKb/9327HV8IILc9obu7356t2rgi
         iSDRgBQwOqWVgtiVTkcvtooZmOxo8FfZJns94nmVxWMjJdfjK7mEzSE5Eq5Gq98m4Ht5
         AndoMwBrvyIC35PGlWlDNO37bwZKC7hEq+WtHB0fUk7QjrXNDkcL2y62t6ZfwddpuYYd
         zazQ==
X-Gm-Message-State: AOAM530voHLgo90V2StxMzPcp628n4a4XK9ahIrzJd58a8IP2vONbYqs
        jVNsHLv3Ag4SGu+10MbZOBNGWXcEggGm2g==
X-Google-Smtp-Source: ABdhPJwLiMH940DHwDcpjcRLtffk++jRwt+VMViquJIuptI1/PWBKP+yC1ADDqS93S2MqA4xYfxILQ==
X-Received: by 2002:a05:622a:306:: with SMTP id q6mr14546111qtw.15.1613861203760;
        Sat, 20 Feb 2021 14:46:43 -0800 (PST)
Received: from debian-vm ([189.120.76.30])
        by smtp.gmail.com with ESMTPSA id i37sm1892960qtb.46.2021.02.20.14.46.42
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Feb 2021 14:46:43 -0800 (PST)
From:   Igor <igormtorrente@gmail.com>
X-Google-Original-From: Igor <igor>
Date:   Sat, 20 Feb 2021 19:46:40 -0300
To:     linux-doc@vger.kernel.org
Subject: About the .txt docs files
Message-ID: <YDGRUCzcVskYYrVv@debian-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi everyone,

I was converting the memory-barrier.txt to .rst so it can be properly
displayed alongside the rest of the documentation that is already
converted to .rst.

After I started, I realize that is better to ask if is desirable for
these files to be converted in the first place.

So, that is my question, from the files in the following list there
any that would be desirable for the conversion?

memory-barriers.txt
atomic_t.txt
atomic_bitops.txt
admin-guide/spkguide.txt
filesystems/dax.txt
filesystems/path-lookup.txt

Thanks in advance,
Igor M. A. Torrente

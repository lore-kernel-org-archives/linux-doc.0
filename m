Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EAEEC433DB
	for <linux-doc@archiver.kernel.org>; Fri,  5 Feb 2021 11:34:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA44564E50
	for <linux-doc@archiver.kernel.org>; Fri,  5 Feb 2021 11:33:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231602AbhBELdt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 5 Feb 2021 06:33:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231812AbhBELbl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 5 Feb 2021 06:31:41 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C74C1C061786
        for <linux-doc@vger.kernel.org>; Fri,  5 Feb 2021 03:31:00 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id 7so7369497wrz.0
        for <linux-doc@vger.kernel.org>; Fri, 05 Feb 2021 03:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:subject:message-id:user-agent:mime-version;
        bh=Eze089fYNNkgyITOiKbDB1y437c7IX+aSkVMhCqkD6c=;
        b=K2VRVz63+sEjHsALyseBhTZf7iCTLxczSh3tEtPGk2Q9HAQtkcveTITYM1pcSGWki+
         +hZUkFK3JDPsui+9Cj7YlVa3h95/3gLvRi+TF54WxDpISOIidKYlWeAPLCDnMnB8ZcMY
         2pwsnzoiOXqhFuumYlsyWuPxjGtx9m2lrTeSAUX5jG7mCTgcka5IhrCOtiDlWHFF9zjf
         Vv10BBTFz93VFaXByVye6weKb7Ypuf0WBtIHXTs3DwNgXEFANG3oDenJI89C58zp3V5u
         OE3dMlSS0JDYCf8mRoSQUyNHB4ZdrHdWUHgNRVY2rf0yOc4tagDNBa99uZEyUNlFEVpD
         aHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:subject:message-id:user-agent
         :mime-version;
        bh=Eze089fYNNkgyITOiKbDB1y437c7IX+aSkVMhCqkD6c=;
        b=Y6b/pWXh5NDBwTthxLnbE5qsbw5B9OmOF0WIZn9kFJHtykm9KsKyOH14WU1m5tQ1es
         eRc6135j481VKjytmfFPnxTrOLNiMh4M1YLlayLPR6mtDI2PjjE7g680U1DnYIEnuafA
         kg26/nex5nTCs4fub1LWPzLzdO6zEjIfNQnFOdrTPSiBZj8pN9HT62Nrgq6Evh789w7F
         J9mQgCFSe1VJN8VD1M9tr9VNpUaRXsHPVdJQyeOWZQW0s6hPtEkLAtKJXTVoYIyAvDyh
         aWtHFbCKH6JpDJyExocrxaXCljY6xojn0t0Bu1nzGk3j87iwkneD0j6cCk8ReEggmufC
         bHCw==
X-Gm-Message-State: AOAM530OkoQ/LZZuiEGBgYiaqeEHYYw2zwf+DTvCSOA7hp1QLwXg24ex
        3BiJPDTNJFoMYyqb/1d8uow=
X-Google-Smtp-Source: ABdhPJy9/VholD0OzDwE9T+15QHFRMBda5FtVbG6Q6/8yNwb2mF3ScefegcyRgET64hj4HAHP/P+hw==
X-Received: by 2002:a5d:66ce:: with SMTP id k14mr4461098wrw.397.1612524659472;
        Fri, 05 Feb 2021 03:30:59 -0800 (PST)
Received: from felia ([2001:16b8:2ded:6500:7c12:49b0:591a:b2bd])
        by smtp.gmail.com with ESMTPSA id h14sm7836216wmq.39.2021.02.05.03.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 03:30:58 -0800 (PST)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date:   Fri, 5 Feb 2021 12:30:50 +0100 (CET)
X-X-Sender: lukas@felia
To:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-doc@vger.kernel.org
Subject: Patches for a Documentation quick-fix pull request to Linus
Message-ID: <alpine.DEB.2.21.2102051224330.19658@felia>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jonathan,


on the current mainline repository, we currently have the following 
warnings with make htmldocs:

    ./Documentation/virt/kvm/api.rst:4537: WARNING: Unexpected indentation.
    ./Documentation/virt/kvm/api.rst:4539: WARNING: Block quote ends without a blank line; unexpected unindent.

    ./Documentation/ABI/testing/sysfs-firmware-sgi_uv:2: WARNING: Unexpected indentation.

Mauro has already created patches to address them, but these patches here 
have not been picked up by the other subsystem maintainers (within the 
last three weeks):

    a5a20cd7ff9870b5316825fa1abad0b867832700.1610610444.git.mchehab+huawei@kernel.org
    452854f2dd0625b9fee33b9f5e29343d6149781e.1610610444.git.mchehab+huawei@kernel.org

Jonathan, could you pick those two patches and provide them as a  
Documentation quick-fix pull request to Linus?

With that, we are back to zero warnings on mainline.


Just for your information, for linux-next, as of next-20210204, with the 
further already submitted patches, make htmldocs
has zero warnings:

    a5a20cd7ff9870b5316825fa1abad0b867832700.1610610444.git.mchehab+huawei@kernel.org
    452854f2dd0625b9fee33b9f5e29343d6149781e.1610610444.git.mchehab+huawei@kernel.org
    84693a4901efb553dd95fe4909b50d6d8faf8107.1610610444.git.mchehab+huawei@kernel.org
    20210204180059.28360-1-lukas.bulwahn@gmail.com
    20210205095506.29146-1-lukas.bulwahn@gmail.com

So, we are in a good shape for zero-warning documentation build with the 
next -rc1 if those patches are being
picked up in the next few days.


Thanks,

Lukas

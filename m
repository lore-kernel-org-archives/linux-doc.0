Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16244C433E0
	for <linux-doc@archiver.kernel.org>; Fri,  5 Feb 2021 12:03:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B29B064E05
	for <linux-doc@archiver.kernel.org>; Fri,  5 Feb 2021 12:03:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231152AbhBEMCw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 5 Feb 2021 07:02:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232083AbhBEMAr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 5 Feb 2021 07:00:47 -0500
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36208C061786;
        Fri,  5 Feb 2021 04:00:07 -0800 (PST)
Received: by mail-qk1-x735.google.com with SMTP id a12so6517583qkh.10;
        Fri, 05 Feb 2021 04:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4weY+u9DD1CVqLcmyEevXA4RNZ3BUA5TlWK6o1tDfxk=;
        b=SlLdkGQwhAUifze0j0U9bUhsRiv1YEw8s+n5XT0jGgNsZiO1W/QKPQwfhhIMzoYf5W
         Sg4/AkeGhUlq1P9zsU+G669bCx5XQJsNW+gn35Hbb/Z9dJr4gxKCVfAdcBYrl5PCLeL/
         jdkHvy4qQlzJ7LCdRm6aTLkdkHeQ19KeKTQyTdEv7CaIk6h/lKKrkReEBBYS5EJgTx5C
         AOz4oqDX2THcPpIsFEyGnGdmbp6mZ8Sp7TeSYnf3P7FNqIQZwNXJ8gtwxSOp53qjEcuO
         6aHnBwnok44ILIXbUUSTqRQonfH4DoD5MZPDmQ7gq0nxAxCI0BhoWQxIkbHH5KvI4EPg
         /muw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4weY+u9DD1CVqLcmyEevXA4RNZ3BUA5TlWK6o1tDfxk=;
        b=rodmcVcrbBrLYUNcZKgPDrgRsp+Pf7xqZmF4/t63OUZPwV3WdVuob84CrgmYtFPsmu
         zEcYpBKq9IroBmnDvvhbyFwKNhKbC6XeLvNvG/zbW7v3itmH452JmcUuVtJ/frE2NpRT
         0eq9GwkYdH9Ntdf0Wn0XlTzTRYxz3dnwEEB0imCIE/r26i6MbkcrqGnph6naZ3L62SZu
         BAqrUw+fJwthU0S3Wzg63VXtklyM+O4ank3LCV1ujtatXsLdac/0yQTj4NZ9W54NwTZL
         Cc0oL538CmRcIRV0hEE/VX2jbJ4fYZfb2iszkVLAmh8U6FAVZEFnxeC/vlV3YwHB+952
         sraA==
X-Gm-Message-State: AOAM530lyeq2eO0j4PjR0SBA03B3/a5XQIj7ilNhDsJZaOaxXAnU3nOW
        SYDy9I0MxhHpjjjKoi5/nCI=
X-Google-Smtp-Source: ABdhPJymN/imeeCfz+KwDQtnArnTOarWUEIEEaGYt1Ve+mE3Fk0OI1GnXtyul2yNJr0o5/SteF7wTA==
X-Received: by 2002:a05:620a:209a:: with SMTP id e26mr3655162qka.313.1612526406427;
        Fri, 05 Feb 2021 04:00:06 -0800 (PST)
Received: from localhost.localdomain ([138.199.10.106])
        by smtp.gmail.com with ESMTPSA id 17sm9274752qtu.23.2021.02.05.04.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 04:00:05 -0800 (PST)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     corbet@lwn.net, swboyd@chromium.org, tiwai@suse.de,
        nfraprado@protonmail.com, mchehab+huawei@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] docs: kernel-hacking: Remove the word fuck,trying to be civil :)
Date:   Fri,  5 Feb 2021 17:29:51 +0530
Message-Id: <20210205115951.1276526-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


s/fuck//


Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 Documentation/kernel-hacking/locking.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/kernel-hacking/locking.rst b/Documentation/kernel-hacking/locking.rst
index c3448929a824..ed1284c6f078 100644
--- a/Documentation/kernel-hacking/locking.rst
+++ b/Documentation/kernel-hacking/locking.rst
@@ -958,7 +958,7 @@ grabs a read lock, searches a list, fails to find what it wants, drops
 the read lock, grabs a write lock and inserts the object has a race
 condition.

-If you don't see why, please stay the fuck away from my code.
+If you don't see why, please stay away from my code.

 Racing Timers: A Kernel Pastime
 -------------------------------
--
2.30.0


Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40214EB64DC
	for <linux-doc@archiver.kernel.org>; Tue, 11 Jul 2023 20:51:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbjGKUvH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 11 Jul 2023 16:51:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbjGKUvH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Jul 2023 16:51:07 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B371195
        for <linux-doc@vger.kernel.org>; Tue, 11 Jul 2023 13:51:06 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-682eef7d752so843710b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 11 Jul 2023 13:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1689108665; x=1689713465;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4KQjS5IB3HxBUPRZ52PjYkeXdm3xeIYaSrFkecAH7Y8=;
        b=Yg8x27vG/jo6ntfVpqL8SMdc3Am7rOf3C7GPs7yktDM+ZCn1UZeK40SAnkL01dlsV4
         UV3H+VsihfkXwmmDVvR8Bp7NbGejdB7OkPyrboUWGD10jjFZvA7ujOiXM0wKU8ICxCa9
         mhjH+wEBOxEY1/vBCewgN6lm5PkMnN0sfDKN0C8W2jf00OuT7utWoK+M/Yo5mMdlTcb2
         N3Jv/ubTq/TgNQhiTmxnuGB+2RUcCikJDdu/em9DUt8s6T0QbiacuYCWMop1NvbK+fHa
         HykDUrvNmHuUudYMqoYnAO+WTHE+TVMR6migYeCZIoxOePT3b0g7Gnjl/vY/uB85/xqC
         4wtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689108665; x=1689713465;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4KQjS5IB3HxBUPRZ52PjYkeXdm3xeIYaSrFkecAH7Y8=;
        b=AaV8ZAJzKM92LT6UB0f4/ejdKS3TkpmVASlacAkwoCazB8aV81081M3zSgv9PZL6Rd
         eB8lCXCo4mQW42toqCy1gB1lbmsDxGXGSdcBukt/RlwFKC0UWkbMWECE3+RW4He+kXTq
         fcINhIgH6WWob03kCvwTljDkzj76paIxhbYFGhl9/OkqHZBOQlfWF13lYx7QNkjuh1E/
         haegMHmtmrKaugnS0U3/0+pVOLU4IlYMOdYql5FuOP+J2BjtGT+lkkv07VIUdnM2ESaL
         MEVTKvmEOu0ETTx3fjRBR2O88u8GPLscYzySAgazd2x/iBq1nolpanmIPe9K6YJ3fQ9C
         lTcw==
X-Gm-Message-State: ABy/qLaUkOYm5yIDQwy8xTO0P23wuAv3Gj/ZGYM6n5oo9IU54cTQRBlu
        zqoM+Uw7tmczY2WfiVyyBd/rlg==
X-Google-Smtp-Source: APBJJlFiXWlodvDO3oWvF0y1nyHpjI/oSicwjLwdAwZM3FzbLVW/18gjH31OMzxUAL3pjMrR0gZrqg==
X-Received: by 2002:a05:6a00:e8e:b0:677:3439:874a with SMTP id bo14-20020a056a000e8e00b006773439874amr18907425pfb.3.1689108665547;
        Tue, 11 Jul 2023 13:51:05 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id w19-20020aa78593000000b0067886c78745sm2148776pfn.66.2023.07.11.13.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 13:51:04 -0700 (PDT)
From:   Jens Axboe <axboe@kernel.dk>
To:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        io-uring@vger.kernel.org, asml.silence@gmail.com,
        Matteo Rizzo <matteorizzo@google.com>
Cc:     corbet@lwn.net, akpm@linux-foundation.org, keescook@chromium.org,
        ribalda@chromium.org, rostedt@goodmis.org, jannh@google.com,
        chenhuacai@kernel.org, gpiccoli@igalia.com, ldufour@linux.ibm.com,
        evn@google.com, poprdi@google.com, jordyzomer@google.com,
        jmoyer@redhat.com, krisman@suse.de
In-Reply-To: <20230630151003.3622786-1-matteorizzo@google.com>
References: <20230630151003.3622786-1-matteorizzo@google.com>
Subject: Re: [PATCH v3 0/1] Add a sysctl to disable io_uring system-wide
Message-Id: <168910866387.217585.15007808058378960214.b4-ty@kernel.dk>
Date:   Tue, 11 Jul 2023 14:51:03 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On Fri, 30 Jun 2023 15:10:02 +0000, Matteo Rizzo wrote:
> Over the last few years we've seen many critical vulnerabilities in
> io_uring[1] which could be exploited by an unprivileged process to gain
> control over the kernel. This patch introduces a new sysctl which disables
> the creation of new io_uring instances system-wide.
> 
> The goal of this patch is to give distros, system admins, and cloud
> providers a way to reduce the risk of privilege escalation through io_uring
> where disabling it with seccomp or at compile time is not practical. For
> example a distro or cloud provider might want to disable io_uring by
> default and have users enable it again if they need to run a program that
> requires it. The new sysctl is designed to let a user with root on the
> machine enable and disable io_uring systemwide at runtime without requiring
> a kernel recompilation or a reboot.
> 
> [...]

Applied, thanks!

[1/1] io_uring: add a sysctl to disable io_uring system-wide
      commit: d55f54dac19a0cee1818353ab5aa3edac9034db4

Best regards,
-- 
Jens Axboe




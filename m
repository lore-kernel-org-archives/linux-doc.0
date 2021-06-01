Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36716C4708F
	for <linux-doc@archiver.kernel.org>; Tue,  1 Jun 2021 19:17:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 183166135D
	for <linux-doc@archiver.kernel.org>; Tue,  1 Jun 2021 19:17:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234741AbhFATTT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 1 Jun 2021 15:19:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234725AbhFATTT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Jun 2021 15:19:19 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4147AC06175F
        for <linux-doc@vger.kernel.org>; Tue,  1 Jun 2021 12:17:36 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id q16so7427512pls.6
        for <linux-doc@vger.kernel.org>; Tue, 01 Jun 2021 12:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tXSpBBbp8umZDX2eRcS2QwQNb4xIATBt0dQ003Ln9Ig=;
        b=dbBQtsyL8TYI6C8oHFyO/gxmru5zdSVPID98stKWsan84a3hrTx94pddMuc/EtJFbf
         7g7qjEv/I3Rgmqo+peWspvcYBOsNeJgmc7YQUSji77T77/2IQYedZmF96ZtTokyw0Lah
         BtBSmnIcrE/ZD9Nx4C9+joeQIZbsxXvYyvhKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tXSpBBbp8umZDX2eRcS2QwQNb4xIATBt0dQ003Ln9Ig=;
        b=IpcKlykugKib4OTBZrrRtPozzpxuhEgV6AggGxG5HSHU/hCCh9Ln64/uekeKvF3/sB
         ZHcOwF2NjhL7T0OCpNuq53En6AXNz8YvbQs6UhElmf9XtxNb3eruka06JtUkPtPefQYR
         uR/hmCvHji6oz/NUnajOTn5VNVEBF5zDeRWl/udtyBb6DHtlLQfd+uri4m/KXxPMsM1E
         ShpOKqmBwF/jQSOQOYaJSEtHUSh7V5bSpGoIuRsbBgiMt5RllhZBu2vYWk5uHsLadTm1
         OPQYxp/KXmcHEJvTvQacv0gXeG6QYVleLsAe6J6fU2bBwZw2bXdzTiLwk+b0F95mikFd
         VCXA==
X-Gm-Message-State: AOAM533KoiMUP4zrFS+Mho1G3D88p8R7AumxT42QPt7BLrSNoBIEgrII
        pZKkVRw1fBD/ucQsprW6Zhmf+w==
X-Google-Smtp-Source: ABdhPJwS5JdAcmf2q9gCv0Uxt6ES8dGbGW4xYVvGe4pYTtCgcIGIcwbajtWQSQ8dXhv955GtgjCQ0g==
X-Received: by 2002:a17:90a:8902:: with SMTP id u2mr26520768pjn.143.1622575055757;
        Tue, 01 Jun 2021 12:17:35 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s15sm10891489pjr.18.2021.06.01.12.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 12:17:35 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Jonathan Corbet <corbet@lwn.net>,
        clang-built-linux@googlegroups.com,
        Bill Wendling <morbo@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@google.com>, linux-doc@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] pgo: rename the raw profile file to vmlinux.profraw
Date:   Tue,  1 Jun 2021 12:17:24 -0700
Message-Id: <162257504238.1460767.9253353990996275101.b4-ty@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210531202044.426578-1-morbo@google.com>
References: <20210531202044.426578-1-morbo@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 31 May 2021 13:20:44 -0700, Bill Wendling wrote:
> Future PGO features may create other files in /sys/kernel/debug/pgo. So
> rename the kernel's raw profile data file to "vmlinux.profraw" to make
> which part of the kernel the file is for more explicit.
> 
> Note that future files in /sys/kernel/debug/pgo should follow a similar
> naming convention.

Applied to for-next/clang/features, thanks!

[1/1] pgo: rename the raw profile file to vmlinux.profraw
      https://git.kernel.org/kees/c/001eaf3fd0e3

-- 
Kees Cook


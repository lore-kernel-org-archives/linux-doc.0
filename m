Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84ED7C63777
	for <linux-doc@archiver.kernel.org>; Mon, 30 Nov 2020 18:27:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F9E92074A
	for <linux-doc@archiver.kernel.org>; Mon, 30 Nov 2020 18:27:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HXnKmZee"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727805AbgK3S1Y (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 30 Nov 2020 13:27:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726878AbgK3S1Y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Nov 2020 13:27:24 -0500
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CA83C0613CF
        for <linux-doc@vger.kernel.org>; Mon, 30 Nov 2020 10:26:44 -0800 (PST)
Received: by mail-qt1-x84a.google.com with SMTP id r29so8943523qtu.21
        for <linux-doc@vger.kernel.org>; Mon, 30 Nov 2020 10:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=6SFHLyZ3sYbDiiVwNR+ATp4H+5haS+q2T/30J+JE944=;
        b=HXnKmZeegOvioqXFTHGTnMqqFxXIIS2G5aSFawvr65GXD6hsY1at652t2aakKQq3wY
         mR3ivCMZRjLWyhxqBFZm3XMSY3kDaAqZtHFO5tMSHytAn9aVyuIZE6M29hFeuay85mGt
         j608Ulf40muXTaisF0CLSR3KqERAP1A2iQ0+gY7iSb6zOIxch8wxH/aSU9KtGku/+7Mw
         7aFwq/I/5tGqO+VV2V7cs4G7GIHl1uHiLnoCSU2sNVYZfkt4ktoi9+5iA5HaD5+6oPOO
         tt6JMECHyQek1Yb+OJyax1gmOAS8N5b9PLsR+XKDuMOY+R3ZKcbCRVSu1CY+lUcFrrOs
         w8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=6SFHLyZ3sYbDiiVwNR+ATp4H+5haS+q2T/30J+JE944=;
        b=ULDxD4DpXNettSJMbkZjYzQoeHw50aJcCpMgGFQoGL1vzE7z9aFuOnMtyf5sb8QnIf
         UI+RisRXljPfJXxAA8+K9p5q+Qaoi6tN8QOpW4F8tAEst8CCug8n0NBvwEVhnYcAWyTm
         BKuK5Jt7jl/pBkLH29L/NNdjEAX1D4V7GVtM3Y8p23hi4M7FScoPlsG9licpsdAaJ9hN
         gK8udPtcX3U5wvDqpaK/ze8mGzdw2VTIAkLoIsTPDhgfZkK4RWMD48swuUqnul8HLeSd
         yrV610PGNZxcCPLU08REfOFXInuluHWeQT0MocIEikTvJ++yfqbxup1/t+qPGMN9NEzH
         6rnw==
X-Gm-Message-State: AOAM53331n7SZl3jw3HF0jYW3Oc3+xiUkIZCXfxwfViSiqUi4lVx7BPU
        +l3NQaPhYDBl6W6I8MvMcfwmVYPHIMdMiq2fNTA=
X-Google-Smtp-Source: ABdhPJwEFYmPhF4lZX+VLouAsYcNBU1HIibgMDwU7Z53jyjWOKipNANeGUcQch3Yt7aZHBRiC/6Px6iAWQk0t07O8CY=
Sender: "ndesaulniers via sendgmr" 
        <ndesaulniers@ndesaulniers1.mtv.corp.google.com>
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:f693:9fff:fef4:4d25])
 (user=ndesaulniers job=sendgmr) by 2002:a0c:9e43:: with SMTP id
 z3mr24290731qve.2.1606760803272; Mon, 30 Nov 2020 10:26:43 -0800 (PST)
Date:   Mon, 30 Nov 2020 10:26:41 -0800
In-Reply-To: <20201110162211.9207-2-yu-cheng.yu@intel.com>
Message-Id: <20201130182641.29812-1-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20201110162211.9207-2-yu-cheng.yu@intel.com>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: RE: [PATCH v15 01/26] Documentation/x86: Add CET description
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     yu-cheng.yu@intel.com
Cc:     Dave.Martin@arm.com, arnd@arndb.de, bp@alien8.de,
        bsingharora@gmail.com, corbet@lwn.net, dave.hansen@linux.intel.com,
        esyr@redhat.com, fweimer@redhat.com, gorcunov@gmail.com,
        hjl.tools@gmail.com, hpa@zytor.com, jannh@google.com,
        keescook@chromium.org, linux-api@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, luto@kernel.org,
        mike.kravetz@oracle.com, mingo@redhat.com, nadav.amit@gmail.com,
        oleg@redhat.com, pavel@ucw.cz, pengfei.xu@intel.com,
        peterz@infradead.org, ravi.v.shankar@intel.com,
        rdunlap@infradead.org, tglx@linutronix.de,
        vedvyas.shanbhogue@intel.com, weijiang.yang@intel.com,
        x86@kernel.org, maskray@google.com, llozano@google.com,
        clang-built-linux@googlegroups.com, erich.keane@intel.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

(In response to https://lore.kernel.org/lkml/20201110162211.9207-2-yu-cheng.yu@intel.com/)

> These need to be enabled to build a CET-enabled kernel, and Binutils v2.31
> and GCC v8.1 or later are required to build a CET kernel.

What about LLVM? Surely CrOS might be of interest to ship this on (we ship the
equivalent for aarch64 on Android).

> An application's CET capability is marked in its ELF header and can be
> verified from the following command output, in the NT_GNU_PROPERTY_TYPE_0
> field:
>
>     readelf -n <application> | grep SHSTK
>         properties: x86 feature: IBT, SHSTK

Same for llvm-readelf.

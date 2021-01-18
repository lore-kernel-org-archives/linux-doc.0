Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2768C433DB
	for <linux-doc@archiver.kernel.org>; Mon, 18 Jan 2021 16:00:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C37A22AAA
	for <linux-doc@archiver.kernel.org>; Mon, 18 Jan 2021 16:00:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406170AbhARQAF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 18 Jan 2021 11:00:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406164AbhARP7u (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Jan 2021 10:59:50 -0500
Received: from mail-wr1-x449.google.com (mail-wr1-x449.google.com [IPv6:2a00:1450:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C95FC061575
        for <linux-doc@vger.kernel.org>; Mon, 18 Jan 2021 07:59:07 -0800 (PST)
Received: by mail-wr1-x449.google.com with SMTP id m20so8528290wrh.2
        for <linux-doc@vger.kernel.org>; Mon, 18 Jan 2021 07:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=tg+3NwgpjPXKCAU0OOKW/4MEsOw9C1yX+SHheX6GzNo=;
        b=OeEk33HaH6Hbiu6I+b1Q7FWYeeSPLEzZbksFKDPfTxJvMz2iziNXp8justgb+/qOO2
         BmCttwyKayBP3uDNYOUfVlj70h4U62BnyWDdecRhbaiNKeULfiq0So6sBAE6CsF/IOtW
         Yy6TW52Hv4v0RnU27FQzOf6ha3Ey7GE/vNnDFqJaPi1WSwUEzdaiRL3OPPHrEqYbLCDN
         VK8ebVEgHFqFH7Evop0hPWI/SmRGX0JcRkqwiX6zWXcPQXSI+/ZvW6zcdlux8HW2w5KZ
         TSdj/4ofx+XLW6B5MF+TKyrhDGKP5C47CVeyVsDxLS9F2b7KXXgQ9l+V6MIxdYtetGu+
         kzZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=tg+3NwgpjPXKCAU0OOKW/4MEsOw9C1yX+SHheX6GzNo=;
        b=knGUs/1/uNpMBeuDBuVpMRx9STykcPmVLYdyxOXQzTd+0BmUjm277xVkmjsYoeeoG8
         t4AQr7PEWqBOqoqS5vyaP00XNQxA7SO/hyG2uREenVuAYkghN+0XWVPNuQfz0RdjavH5
         N0yTlQex6zttExNx2M70HOJ0J2jKck7aPBhPI+sJNnuO+RRqZnxoRwcNnSyY8Q0G+a/j
         DgeG+cam3rOZWGrB/tHRvomKqPayLWgifgu+cnQbaMYhdiLpZksYaN7WDiTqksf56bnR
         wy8QzaXhBMC8ey8P7ajVt6rnZqR1M8fN7cDVfIVsuuGLR3dlYh9+ZIvzMjhS2R7ke3MI
         2N2Q==
X-Gm-Message-State: AOAM532qoHS+INDBAIptGqaJ1C1itpj4odjrJcItcsqopIoTUIO9u+Dq
        ZPftBgmP6n05Fnv6SmpAh8DubJb66mN0Qw==
X-Google-Smtp-Source: ABdhPJzdYAbwQUMFF8aREpbLcgNopt2loRgSAlU+AdqVByyRoMPeOOxoouLImEHuyt7wAIwdpW2ivErXPiz1Gg==
Sender: "jackmanb via sendgmr" <jackmanb@beeg.c.googlers.com>
X-Received: from beeg.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:11db])
 (user=jackmanb job=sendgmr) by 2002:a1c:2c89:: with SMTP id
 s131mr54945wms.0.1610985545503; Mon, 18 Jan 2021 07:59:05 -0800 (PST)
Date:   Mon, 18 Jan 2021 15:57:33 +0000
Message-Id: <20210118155735.532663-1-jackmanb@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
Subject: [PATCH bpf-next v2 0/2] BPF docs fixups
From:   Brendan Jackman <jackmanb@google.com>
To:     bpf@vger.kernel.org
Cc:     Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii.nakryiko@gmail.com>,
        KP Singh <kpsingh@chromium.org>,
        Florent Revest <revest@chromium.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Difference from v1->v2 [1]:

 * Split into 2 patches

 * Avoided unnecessary ': ::' in .rst source

 * Tweaked wording of the -mcpu=v3 bit a little more

[1] https://lore.kernel.org/bpf/CA+i-1C1LVKjfQLBYk6siiqhxfy0jCR7UBcAmJ4jCED0A9aWsxA@mail.gmail.com/T/#t

Brendan Jackman (2):
  docs: bpf: Fixup atomics markup
  docs: bpf: Clarify -mcpu=v3 requirement for atomic ops

 Documentation/networking/filter.rst | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)


base-commit: 232164e041e925a920bfd28e63d5233cfad90b73
--
2.30.0.284.gd98b1dd5eaa7-goog


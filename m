Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27DB1C433E0
	for <linux-doc@archiver.kernel.org>; Mon, 18 Jan 2021 16:00:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0338C22B4E
	for <linux-doc@archiver.kernel.org>; Mon, 18 Jan 2021 16:00:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406185AbhARQAL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 18 Jan 2021 11:00:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406179AbhARQAH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Jan 2021 11:00:07 -0500
Received: from mail-wm1-x34a.google.com (mail-wm1-x34a.google.com [IPv6:2a00:1450:4864:20::34a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A75FEC0613D6
        for <linux-doc@vger.kernel.org>; Mon, 18 Jan 2021 07:59:11 -0800 (PST)
Received: by mail-wm1-x34a.google.com with SMTP id z12so4698855wmf.9
        for <linux-doc@vger.kernel.org>; Mon, 18 Jan 2021 07:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=6OdTPYEA2p5+e67drhVq+n88z8c6ioQj4MZmywIDAFM=;
        b=eMBuLjmixjlbs4KF0qZwuBWsre4MhQNj8gm7XxkbXIPimS+tmeY3wm5Tke/4fDyObv
         J7FhRpPLOUyZ0NkB7PA9Whh3FFh/p4zRylDnczG+AOHircxNJd35i3cmWageo/SngS6F
         +pW8+PP117T9sFvwjbYfoOL06tsyW6srmnXTBEbbhcpDTG7Hvn0dpBpV39Jx35cmxWr2
         /qLfWcOFJHeCP6JN6sMRxyEmS4zkokORJhKHdr/XW8BoHiv8rm7yiZ0+2V6ABjqFxyNz
         r9Z6s0Lbx39CdrnhmIkAPnCj/h3bH+OuVy3XNiwSKHvJtIqR/06iUUW9y7ilPymgagbD
         8g2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=6OdTPYEA2p5+e67drhVq+n88z8c6ioQj4MZmywIDAFM=;
        b=lAV6vAXov3VUJ6/1cyB7pcMQoe6rWOilUfnOWv6nstXPzghCYe4p+QQYxaupxQ9WsH
         sD5yoTb6lUq7wZcKT8GnqtcNR8dPNI0iMAfSYckCusT9myD2oAjfNTLn3/WFfHhLDOo/
         GswW/R8GHzZ5xcqCQ5JRCD7EAoSwVaig5p00pqhlnbFzpX3xE0NcPV1AirG7yZg8A6WF
         yXNZBY/8b0FV/7i2HPnL77gC06y/ZFs2dOGUYmpn8Qel32H6QHZEIapdTbXv/WItv7KM
         o+TuSuBTO7AVQ75hOk55SjpV4d0aYJW/1nYSGaTKoazlX0G9tScj3ILlFbcrHot+BBLi
         ujng==
X-Gm-Message-State: AOAM531JwL7/Cr+mSBirv9rDfEptJwwYelyBE6oz928OZNeVtdYMAm5a
        Yqg4zuW9oY3+q1flMyUvbIesMT3gJjMvhA==
X-Google-Smtp-Source: ABdhPJx33zg0bqJm2Kmy1Jtk2wZJhRlq1DTndo3IekH3vxXdp0oYMj9T3RZMul5MMDMPA5R/Y/vw0BsdArAwKg==
Sender: "jackmanb via sendgmr" <jackmanb@beeg.c.googlers.com>
X-Received: from beeg.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:11db])
 (user=jackmanb job=sendgmr) by 2002:a1c:6208:: with SMTP id
 w8mr82357wmb.24.1610985550410; Mon, 18 Jan 2021 07:59:10 -0800 (PST)
Date:   Mon, 18 Jan 2021 15:57:35 +0000
In-Reply-To: <20210118155735.532663-1-jackmanb@google.com>
Message-Id: <20210118155735.532663-3-jackmanb@google.com>
Mime-Version: 1.0
References: <20210118155735.532663-1-jackmanb@google.com>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
Subject: [PATCH bpf-next v2 2/2] docs: bpf: Clarify -mcpu=v3 requirement for
 atomic ops
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

Alexei pointed out [1] that this wording is pretty confusing. Here's
an attempt to be more explicit and clear.

[1] https://lore.kernel.org/bpf/CAADnVQJVvwoZsE1K+6qRxzF7+6CvZNzygnoBW9tZNWJELk5c=Q@mail.gmail.com/T/#m07264fc18fdc43af02fc1320968afefcc73d96f4

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 Documentation/networking/filter.rst | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/networking/filter.rst b/Documentation/networking/filter.rst
index 4c2bb4c6364d..b3f457802836 100644
--- a/Documentation/networking/filter.rst
+++ b/Documentation/networking/filter.rst
@@ -1081,9 +1081,10 @@ before is loaded back to ``R0``.
 
 Note that 1 and 2 byte atomic operations are not supported.
 
-Except ``BPF_ADD`` *without* ``BPF_FETCH`` (for legacy reasons), all 4 byte
-atomic operations require alu32 mode. Clang enables this mode by default in
-architecture v3 (``-mcpu=v3``). For older versions it can be enabled with
+Clang can generate atomic instructions by default when ``-mcpu=v3`` is
+enabled. If a lower version for ``-mcpu`` is set, the only atomic instruction
+Clang can generate is ``BPF_ADD`` *without* ``BPF_FETCH``. If you need to enable
+the atomics features, while keeping a lower ``-mcpu`` version, you can use
 ``-Xclang -target-feature -Xclang +alu32``.
 
 You may encounter ``BPF_XADD`` - this is a legacy name for ``BPF_ATOMIC``,
-- 
2.30.0.284.gd98b1dd5eaa7-goog


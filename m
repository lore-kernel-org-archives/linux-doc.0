Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C0DCC4321A
	for <linux-doc@archiver.kernel.org>; Wed, 20 Jan 2021 23:42:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 153592360D
	for <linux-doc@archiver.kernel.org>; Wed, 20 Jan 2021 23:42:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727481AbhATV2M (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Jan 2021 16:28:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728323AbhATNlP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Jan 2021 08:41:15 -0500
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C44CC061786
        for <linux-doc@vger.kernel.org>; Wed, 20 Jan 2021 05:39:55 -0800 (PST)
Received: by mail-qt1-x849.google.com with SMTP id z19so6901442qtv.20
        for <linux-doc@vger.kernel.org>; Wed, 20 Jan 2021 05:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=27UXw1bxwiKbAXZ3HLN6FYGS/3ntG8PaBF+icLAaO9c=;
        b=PnTByR6q94FxjkLS9Uu/r/DisoDcVMH+NWg7D10B2aZq/AH6hIPXNegm9Ds0S+SAOh
         KLRelGJdq8kSbzSYRDu993erSUrPgKVSBB0c24i65pmANw8t7O20tTQIinhJwpGDWJNy
         5GW9VTetU8Wzv2MuyA8SSHsOGQQxWxJ2qAF+9QWo1gV+pThNvzjdRm/nHuJs5ZaqngYE
         0M6FxvAABS4MfaTPqIViNi4ii1bVFuFaWYJLlzJrelKKQoLsDLQay4C6VHDR38EPgxse
         zfkwQJbP8TaGVNJOcUxP8rwXpnJgtxa/Iw2tYTFKc2ub0hhxwptMtRdtub6cI27jkkLS
         6p9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=27UXw1bxwiKbAXZ3HLN6FYGS/3ntG8PaBF+icLAaO9c=;
        b=Nxe0p2XuuCWaMEkXlPnfyN7TzLxNDCC0ThKFL1N7yeTLszVE1wSz+HR0Iw9RJ9R66M
         Hl0DxiuZo4ttyoE2JFz6soPuck0CnSAA5kDf5FoeXSJEVTuuvB6VrF/xO6KNxUfXA/BJ
         CqjWkiLfyRrwh4aQetWeuv+2ultjyROv/Bog8YNRQD6tSTwnIldgoDX0mgT9WDK4Wx7L
         pKXaI7jg87Aemuoh+/2CAyZTV9e+1QJFg8vRIHzMfZOqwdGtcEBNVcSMfP6zOdAsVxg5
         GQbqvoxSK3Insnc+FRMC3STEcvWPLmliTFsgHYYbDF1kaNh4JaX1FxKj04No357kvZXN
         e0+Q==
X-Gm-Message-State: AOAM530Sen/bjd9OOjnypQlEnD91HR4jE/M2PfDLIVCRZgpT8t5zRR5P
        APXfYhzZ0tHUcLWndLnJcyFsjuaM3Fje3Q==
X-Google-Smtp-Source: ABdhPJykVpRhwtQiPMvkHREiKUg5Ra0CWUbH9E6q3jL2Sl8EtPPlEUrX0GiJX+oikJztnUALHWt0KJ023APJLA==
Sender: "jackmanb via sendgmr" <jackmanb@beeg.c.googlers.com>
X-Received: from beeg.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:11db])
 (user=jackmanb job=sendgmr) by 2002:a0c:b526:: with SMTP id
 d38mr9192365qve.7.1611149994304; Wed, 20 Jan 2021 05:39:54 -0800 (PST)
Date:   Wed, 20 Jan 2021 13:39:45 +0000
In-Reply-To: <20210120133946.2107897-1-jackmanb@google.com>
Message-Id: <20210120133946.2107897-2-jackmanb@google.com>
Mime-Version: 1.0
References: <20210120133946.2107897-1-jackmanb@google.com>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
Subject: [PATCH bpf-next v3 1/2] docs: bpf: Fixup atomics markup
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

This fixes up the markup to fix a warning, be more consistent with
use of monospace, and use the correct .rst syntax for <em> (* instead
of _).

Signed-off-by: Brendan Jackman <jackmanb@google.com>
Reviewed-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

---
 Documentation/networking/filter.rst | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/Documentation/networking/filter.rst b/Documentation/networking/filter.rst
index 45f6fde1776c..4c2bb4c6364d 100644
--- a/Documentation/networking/filter.rst
+++ b/Documentation/networking/filter.rst
@@ -1066,12 +1066,12 @@ memory location addresed by ``dst_reg + off`` is atomically modified, with
 immediate, then these operations also overwrite ``src_reg`` with the
 value that was in memory before it was modified.

-The more special operations are:
+The more special operations are::

     BPF_XCHG

 This atomically exchanges ``src_reg`` with the value addressed by ``dst_reg +
-off``.
+off``. ::

     BPF_CMPXCHG

@@ -1081,18 +1081,19 @@ before is loaded back to ``R0``.

 Note that 1 and 2 byte atomic operations are not supported.

-Except ``BPF_ADD`` _without_ ``BPF_FETCH`` (for legacy reasons), all 4 byte
+Except ``BPF_ADD`` *without* ``BPF_FETCH`` (for legacy reasons), all 4 byte
 atomic operations require alu32 mode. Clang enables this mode by default in
 architecture v3 (``-mcpu=v3``). For older versions it can be enabled with
 ``-Xclang -target-feature -Xclang +alu32``.

-You may encounter BPF_XADD - this is a legacy name for BPF_ATOMIC, referring to
-the exclusive-add operation encoded when the immediate field is zero.
+You may encounter ``BPF_XADD`` - this is a legacy name for ``BPF_ATOMIC``,
+referring to the exclusive-add operation encoded when the immediate field is
+zero.

-eBPF has one 16-byte instruction: BPF_LD | BPF_DW | BPF_IMM which consists
+eBPF has one 16-byte instruction: ``BPF_LD | BPF_DW | BPF_IMM`` which consists
 of two consecutive ``struct bpf_insn`` 8-byte blocks and interpreted as single
 instruction that loads 64-bit immediate value into a dst_reg.
-Classic BPF has similar instruction: BPF_LD | BPF_W | BPF_IMM which loads
+Classic BPF has similar instruction: ``BPF_LD | BPF_W | BPF_IMM`` which loads
 32-bit immediate value into a register.

 eBPF verifier
--
2.30.0.284.gd98b1dd5eaa7-goog


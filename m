Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BF9FEB64DA
	for <linux-doc@archiver.kernel.org>; Sat, 24 Jun 2023 16:59:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbjFXQ7U (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 24 Jun 2023 12:59:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbjFXQ7T (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 24 Jun 2023 12:59:19 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D88B9B8
        for <linux-doc@vger.kernel.org>; Sat, 24 Jun 2023 09:59:18 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-c005a8ca4d9so2375865276.3
        for <linux-doc@vger.kernel.org>; Sat, 24 Jun 2023 09:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687625958; x=1690217958;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/hAAUYNjnP2S1iy30W9CZkk4vxwURxlio81YXkKph6Q=;
        b=eiLWHO6WHbfbHlUe7RI0bcCr2w2VXOnINGl/gzmhVqoP9a7651CZ8ZKrRoYUGS9tRg
         3R1Fo7FPQ6aN43KfWnXkdGPAFyZLhmoaOllE2ambJtlJvbEl1dt0r2fby20N9SGyym27
         Hle5CtZ92F91GRisYuUNBZkTU5o3fqUyY0YHOlhRxTlyHm7/XQ3Am16FlUQ+cFdJhkAs
         z9D5XUL4zqNhD4vEGW+yq1CmE6Ze82Z75M5m/s9q2xJnm3unR+/xs2s4Icll6X89QHT7
         UjLuuPQgKUhZpUsqkqDwGiku2YOgnpBRhjkS7vf2jDcB3Cgp+Zd7HCXMpJPA5v9dpSs3
         smyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687625958; x=1690217958;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/hAAUYNjnP2S1iy30W9CZkk4vxwURxlio81YXkKph6Q=;
        b=Qggvje0oM7/NcrjRtG/CF31h2T7Q56sqWc4NhTjkVELqpr74vdgFzMpXqpweAyB4Jw
         622mTPOo0lUMRAUigRu9sWXQpTpbjF5wrmPQuzWVKZUStuHkTcL0Jd/irahNReMOD6qO
         gsJUGKkzIJwOOXGQkMMjcutw3waPIsgj/K9qwReSOmdTujP0s0e2Som+IhrTTrFbngDE
         27floGbNv3ai3tysI9RscZVhmVnp4TBKr/Ia+DDqSDBi9mLG4K5MfzvvKlzuniW0wotx
         nrCEqp1N61wAMfx1kOJLocwwZ0t6B65WGvJnt/UhbdeqY2Pkz1rTo1QHIyDniULWpDEv
         ZhcQ==
X-Gm-Message-State: AC+VfDxTwELoBg+Gk9zY30KppgKdwPMDux9C4qHJPotAFlHc368yB70e
        1ODjoiO1BsIZFWHw5im81EXWGjTSLjtUM0R4
X-Google-Smtp-Source: ACHHUZ6azZts3QK00kSufdyFag0FP5ljsAtL5x0I4g8HHA/qUsmGE38b2ifh5MF+YcfCTnWrBrdAGeybw/TXPPCl
X-Received: from changyuanl-desktop.svl.corp.google.com ([2620:15c:2a3:200:8dbb:f089:239b:f460])
 (user=changyuanl job=sendgmr) by 2002:a25:5f06:0:b0:c17:4115:6212 with SMTP
 id t6-20020a255f06000000b00c1741156212mr109794ybb.12.1687625957980; Sat, 24
 Jun 2023 09:59:17 -0700 (PDT)
Date:   Sat, 24 Jun 2023 09:58:57 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Message-ID: <20230624165858.21777-1-changyuanl@google.com>
Subject: [PATCH] Documentation: KVM: SEV: add a missing backtick
From:   Changyuan Lyu <changyuanl@google.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Paolo Bonzini <pbonzini@redhat.com>, linux-doc@vger.kernel.org,
        trivial@kernel.org, Changyuan Lyu <changyuanl@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

``ENOTTY` -> ``ENOTTY``.

Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 Documentation/virt/kvm/x86/amd-memory-encryption.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/x86/amd-memory-encryption.rst b/Documentation/virt/kvm/x86/amd-memory-encryption.rst
index 487b6328b3e7..995780088eb2 100644
--- a/Documentation/virt/kvm/x86/amd-memory-encryption.rst
+++ b/Documentation/virt/kvm/x86/amd-memory-encryption.rst
@@ -57,7 +57,7 @@ information, see the SEV Key Management spec [api-spec]_
 
 The main ioctl to access SEV is KVM_MEMORY_ENCRYPT_OP.  If the argument
 to KVM_MEMORY_ENCRYPT_OP is NULL, the ioctl returns 0 if SEV is enabled
-and ``ENOTTY` if it is disabled (on some older versions of Linux,
+and ``ENOTTY`` if it is disabled (on some older versions of Linux,
 the ioctl runs normally even with a NULL argument, and therefore will
 likely return ``EFAULT``).  If non-NULL, the argument to KVM_MEMORY_ENCRYPT_OP
 must be a struct kvm_sev_cmd::
-- 
2.41.0.162.gfafddb0af9-goog


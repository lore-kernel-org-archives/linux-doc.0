Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2BAA37D071
	for <lwn-linux-doc@archive.lwn.net>; Fri, 20 Jul 2018 23:32:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728398AbeGUAXJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 20 Jul 2018 20:23:09 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:38223 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727812AbeGUAXJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 Jul 2018 20:23:09 -0400
Received: by mail-ed1-f66.google.com with SMTP id t2-v6so10952256edr.5;
        Fri, 20 Jul 2018 16:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uZEtkX0PPZKorG/JXchp6jfbakQsYoY5ofcxslL+ZhE=;
        b=LmsZvUZWQj41rO3IEkuuMK72gV2IIyXbNp+v+sf5wEfKKZ8G9eZfREAMan4wpiIBiH
         4G1U1EiK8IKkBWl/NKPoSYjsM3OVSbkVqv2V72V/h4lOzlje+lsP0teVSnk4jnI71sYE
         b0Z+jkcXXtyPTFCX26ckj1ggjmH87o8+MErk4G2l3/wBS3KL9ypdBaZM+Fxb6iZ1PZLx
         pmuLStRf/1Nf6SMmbPesdXbAUAI03vRVbJFPHAvSPb0Z91b4RdgUYuhfY0W0EWERA+UP
         hLbXKu7rF4fIKE8FKpCAGEwtZlLleUJoW4UgkC1hAkWndzf26T+6YQAjSGO3mKrRzy7D
         t4cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=uZEtkX0PPZKorG/JXchp6jfbakQsYoY5ofcxslL+ZhE=;
        b=mL7vo983vHU42BbdkJNDGiUb6uTKqZg8vX41rqnE3pTG3g5g8H4lS+vAqDW8CUM2Z5
         iNNLXPfmPsiDi5Or8BzfR/6s7T7lm0rFBD7qBy88OidQvWuGzs7NCrGA8+0Cvi86yvpd
         IR6+7a+shLxl5f9o6GbdL4IsX6giu6RkvaP6NI9j4BaiP1wQIPkQFtVtsT4qP3+jjw3D
         JzALGxgcqJT7wwCiAqezCZjR+OO5DF8iK3rnso81CmPYinCw5dBAT9MIBGB7rgsJLCOJ
         ZZO+OQkI2KC/mDvitcRdVf/TuzzjnKk+rDSpgBJoe8J1vNfH97OI/RsEzHr7K9KMxQ8F
         X2/w==
X-Gm-Message-State: AOUpUlFdTCdPQ+NQwSYaGkGf3XVf1+fa3G8ZHa/TSUJ0wbULnv1QBpYa
        D4WykD90sSj+BnaRAfA4OKxM6u7ChHE=
X-Google-Smtp-Source: AAOMgpfuB4en0+sTAwTnwUnAy/VSaHuqANm3ig6Gaw2dAiLUr5lwvCwEExWBI3EXiHhECkwq6EoxWw==
X-Received: by 2002:a50:b5a5:: with SMTP id a34-v6mr4288680ede.88.1532129559636;
        Fri, 20 Jul 2018 16:32:39 -0700 (PDT)
Received: from localhost.localdomain ([41.35.209.101])
        by smtp.gmail.com with ESMTPSA id p12-v6sm1117092eds.13.2018.07.20.16.32.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Jul 2018 16:32:39 -0700 (PDT)
From:   Ahmed Abd El Mawgood <ahmedsoliman0x666@gmail.com>
To:     kvm@vger.kernel.org,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        virtualization@lists.linux-foundation.org,
        linux-doc@vger.kernel.org, x86@kernel.org,
        xen-devel@lists.xensource.com
Cc:     Paolo Bonzini <pbonzini@redhat.com>, rkrcmar@redhat.com,
        nathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, hpa@zytor.com,
        Kees Cook <keescook@chromium.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        David Hildenbrand <david@redhat.com>,
        Boris Lukashev <blukashev@sempervictus.com>,
        David Vrabel <david.vrabel@nutanix.com>, nigel.edwards@hpe.com,
        Rik van Riel <riel@surriel.com>,
        Ahmed Abd El Mawgood <ahmedsoliman0x666@gmail.com>
Subject: [PATCH RFC V4 1/3] KVM: X86: Memory ROE documentation
Date:   Sat, 21 Jul 2018 01:31:28 +0200
Message-Id: <20180720233130.14129-2-ahmedsoliman0x666@gmail.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20180720233130.14129-1-ahmedsoliman0x666@gmail.com>
References: <20180720233130.14129-1-ahmedsoliman0x666@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Following up with my previous threads on KVM assisted Anti rootkit
protections.
The current version doesn't address the attacks involving pages
remapping. It is still design in progress, nevertheless, it will be in
my later patch sets.

Signed-off-by: Ahmed Abd El Mawgood <ahmedsoliman0x666@gmail.com>
---
 Documentation/virtual/kvm/hypercalls.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/virtual/kvm/hypercalls.txt b/Documentation/virtual/kvm/hypercalls.txt
index a890529c63ed..affd997eabfe 100644
--- a/Documentation/virtual/kvm/hypercalls.txt
+++ b/Documentation/virtual/kvm/hypercalls.txt
@@ -121,3 +121,17 @@ compute the CLOCK_REALTIME for its clock, at the same instant.
 
 Returns KVM_EOPNOTSUPP if the host does not use TSC clocksource,
 or if clock type is different than KVM_CLOCK_PAIRING_WALLCLOCK.
+
+7. KVM_HC_HMROE
+----------------
+Architecture: x86
+Status: active
+Purpose: Hypercall used to apply Read-Only Enforcement to guest pages
+Usage:
+     a0: Start address aligned to page boundary.
+     a1: Number of pages to be protected.
+This hypercall lets a guest kernel have part of its read/write memory
+converted into read-only.  This action is irreversible. KVM_HC_HMROE can
+not be triggered from guest Ring 3 (user mode). The reason is that user
+mode malicious software can make use of it to enforce read only protection
+on an arbitrary memory page thus crashing the kernel.
-- 
2.16.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

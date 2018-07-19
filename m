Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E18307D072
	for <lwn-linux-doc@archive.lwn.net>; Thu, 19 Jul 2018 21:40:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730749AbeGSWZL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 19 Jul 2018 18:25:11 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:45847 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730638AbeGSWZL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Jul 2018 18:25:11 -0400
Received: by mail-ed1-f65.google.com with SMTP id s16-v6so8161753edq.12;
        Thu, 19 Jul 2018 14:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=327HyreSIU3t0NMMhgDmYnEhDe3Fqqif+MFaxPpE3IA=;
        b=pTTZgt3WWYSD1cnhH1tbigj1uZbPava28SvCUHh0lSyAZ27ssAOm9uB72/U/HwadP3
         pEXVMX3khROmPr2/uyiutGVFN14rAJSTJEFbJ8ngDVaSbM8nGMmbWy5jdZopDRIoNkY+
         sukUOJYvSkEptqGF04VOgO6aeaPv+Qxp3uK7ny1cBE08kXMq5YYCEHhMMIDA7p0+jVvV
         R+XVaESxEDGdUSLWGOdrSvfFO986ZY/vvVkvg+SMrfeIDwy1c202bEQP684Hme6IMxfn
         Q21pRiKmoLEsjLg8Wo91mQYwQFMK2azEW+C3y4GaZFRXjqBGiLC9ezwruhDO+qymWMFt
         Y2/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=327HyreSIU3t0NMMhgDmYnEhDe3Fqqif+MFaxPpE3IA=;
        b=Z+gADXBU/pCOkl2WAPNvaHUT7pkjmw3T02rZwDBcd2epRS6VQ28b7ZY0PUIs/WnAYQ
         0UIO967Kr+cpo3tnlrR2yzBtMLH1uz21WTDWnxbcSCDqnoOfd5PvH4uGuZrXfH7P3qwq
         FeDy2k7vGGKa46VRNsqLsTB2Z+MXtC4qW1ojBNj3QHkcyUvtFsDW5E12NCT6jHzPGvfy
         lt+PXN2Ab/u2VKBHCXuTt9dOmTT47Z7aVaevGr6DIBjCoalL7qwr8SHczzKn86gMcxyC
         qvBxHnWpwzQUNMC9tnIZuelrg1MvsQ4kQz3T/NzTKY3/z4wUUTg6Xa/0cofAIJco2qzz
         RkWA==
X-Gm-Message-State: AOUpUlG5nUBLe5OH2mT1gr3hQTQzM5tV7DCEn7YwoOgvu7reyP6p9lNV
        i8gZAJMFnP96ZvkEtLGZu0VEy6Q9lIU=
X-Google-Smtp-Source: AAOMgpend3XzDS2qgeiYqEeKZKyg/J+bJT0ey+yB4+M83MbGdt6zs7ci6LrCQe4gU8iQMPMmojpwCA==
X-Received: by 2002:a50:aba3:: with SMTP id u32-v6mr12879218edc.69.1532036410589;
        Thu, 19 Jul 2018 14:40:10 -0700 (PDT)
Received: from localhost.localdomain ([41.35.209.101])
        by smtp.gmail.com with ESMTPSA id g9-v6sm224049edq.34.2018.07.19.14.40.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Jul 2018 14:40:10 -0700 (PDT)
From:   Ahmed Abd El Mawgood <ahmedsoliman0x666@gmail.com>
To:     kvm@vger.kernel.org,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        virtualization@lists.linux-foundation.org,
        linux-doc@vger.kernel.org, x86@kernel.org
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
Subject: [PATCH 1/3] [RFC V3] KVM: X86: Memory ROE documentation
Date:   Thu, 19 Jul 2018 23:38:00 +0200
Message-Id: <20180719213802.17161-2-ahmedsoliman0x666@gmail.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20180719213802.17161-1-ahmedsoliman0x666@gmail.com>
References: <20180719213802.17161-1-ahmedsoliman0x666@gmail.com>
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
index a890529c63ed..a9db68adb7c9 100644
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
+     a0: start address of page that should be protected.
+
+This hypercall lets a guest kernel to have part of its read/write memory
+converted into read-only.  This action is irreversible. KVM_HC_HMROE can
+not be triggered from guest Ring 3 (user mode). The reason is that user
+mode malicious software can make use of it enforce read only protection on
+an arbitrary memory page thus crashing the kernel.
-- 
2.16.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

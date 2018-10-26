Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 716CB7D088
	for <lwn-linux-doc@archive.lwn.net>; Fri, 26 Oct 2018 15:16:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726570AbeJZXxa (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 26 Oct 2018 19:53:30 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53125 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726113AbeJZXxa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Oct 2018 19:53:30 -0400
Received: by mail-wm1-f65.google.com with SMTP id 189-v6so1875244wmw.2;
        Fri, 26 Oct 2018 08:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=RWiArh2hS1wXwjmyYMZMynOTmVpcrRnX76eAIdAErZY=;
        b=tSpjXLUYkvGECBMpjjVzObxCt3s5EZgTJ0aSztZyz8E025w37n/NRs3kB+GE3188jp
         fTdsZQfbvuFzROSIJP+UVFwNELo4V8gBintj8Mf8f/SD4Rzvg6JlsBEEbd+4mQmnPX0o
         0/HsnfQXb+D7YSA1aQBJBE1McqIPrfrkpG23D2fKeSZFpDA04tKqrbsbukhu9unQxU4r
         dJ8kCGsCsITterYQmunWwu3Ysombw5Qhk85yijSFIR/8axGxsYH5ggorHg+TaBJ4l8Jp
         nMfCV/0I6J2Ona2I/oMgPwD4p/zn1PeFw4aMz44PIw3CMUecYx2CtblGeK6VmS9hCaRV
         Oi0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=RWiArh2hS1wXwjmyYMZMynOTmVpcrRnX76eAIdAErZY=;
        b=KOn+5OqSdDBVQK0slkOcqOtNjJba+Ojd5aq+kgdaJNwgWeo1ToYve0CFV3FpJth8gE
         hO5ledjm970UtIq42KlAcrfViyy9kJNPtLfFt4uEWYbRd9viTBw5KPoQB5WcLIzb9Mxg
         LZoYqhkDO1lwKdM380yQxkqPdeb9m9/oPmxOwfRBTSIwYrcVzfuwzMgoiTRANoSifUp+
         yWPZT6L0aBQRNjXqsu7dNzQSTdFvbvGCJplZqbJ6amUsHSDIDnglwgSV2Kk5PwLwWIJs
         F1lH4jFiqJDi/6RpUAIPxOF0C6yKI0vdohlglibyl5558kxoMcNCimUz6uvzQbZvaw7o
         EOoA==
X-Gm-Message-State: AGRZ1gL7kSwN3y9QQFG1QbLjTXVS1WCtqlbWc/DYI6Cux5tEyw873HS1
        DL6COXkQWyCSOhF38OMB3S4=
X-Google-Smtp-Source: AJdET5fYQexpLLjeUajYQguwu0usM+rJiMT06j9w6NWd2kJuOr+SF9Qgogy40wwtIc7I+wDEE/wQ0g==
X-Received: by 2002:a1c:a88b:: with SMTP id r133-v6mr5778603wme.97.1540566961476;
        Fri, 26 Oct 2018 08:16:01 -0700 (PDT)
Received: from localhost.localdomain ([156.213.138.111])
        by smtp.gmail.com with ESMTPSA id p7-v6sm10127257wrt.10.2018.10.26.08.15.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Oct 2018 08:16:00 -0700 (PDT)
From:   Ahmed Abd El Mawgood <ahmedsoliman0x666@gmail.com>
To:     Paolo Bonzini <pbonzini@redhat.com>, rkrcmar@redhat.com,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        hpa@zytor.com, x86@kernel.org, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        ahmedsoliman0x666@gmail.com, ovich00@gmail.com,
        kernel-hardening@lists.openwall.com, nigel.edwards@hpe.com,
        Boris Lukashev <blukashev@sempervictus.com>,
        Hossam Hassan <7ossam9063@gmail.com>,
        Ahmed Lotfy <A7med.lotfey@gmail.com>
Subject: [PATCH V5 1/5] KVM: X86: Memory ROE documentation
Date:   Fri, 26 Oct 2018 17:12:19 +0200
Message-Id: <20181026151223.16810-2-ahmedsoliman0x666@gmail.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181026151223.16810-1-ahmedsoliman0x666@gmail.com>
References: <20181026151223.16810-1-ahmedsoliman0x666@gmail.com>
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
 Documentation/virtual/kvm/hypercalls.txt | 31 ++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/virtual/kvm/hypercalls.txt b/Documentation/virtual/kvm/hypercalls.txt
index da24c138c8d1..8af64d826f03 100644
--- a/Documentation/virtual/kvm/hypercalls.txt
+++ b/Documentation/virtual/kvm/hypercalls.txt
@@ -141,3 +141,34 @@ a0 corresponds to the APIC ID in the third argument (a2), bit 1
 corresponds to the APIC ID a2+1, and so on.
 
 Returns the number of CPUs to which the IPIs were delivered successfully.
+
+7. KVM_HC_ROE
+----------------
+Architecture: x86
+Status: active
+Purpose: Hypercall used to apply Read-Only Enforcement to guest memory and
+registers
+Usage 1:
+     a0: ROE_VERSION
+
+Returns non-signed number that represents the current version of ROE
+implementation current version.
+
+Usage 2:
+
+     a0: ROE_MPROTECT	(requires version >= 1)
+     a1: Start address aligned to page boundary.
+     a2: Number of pages to be protected.
+
+This configuration lets a guest kernel have part of its read/write memory
+converted into read-only.  This action is irreversible.
+Upon successful run, the number of pages protected is returned.
+
+Error codes:
+	-KVM_ENOSYS: system call being triggered from ring 3 or it is not
+	implemented.
+	-EINVAL: error based on given parameters.
+
+Notes: KVM_HC_ROE can not be triggered from guest Ring 3 (user mode). The
+reason is that user mode malicious software can make use of it to enforce read
+only protection on an arbitrary memory page thus crashing the kernel.
-- 
2.18.1


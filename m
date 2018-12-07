Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4831B7D8A5
	for <lwn-linux-doc@archive.lwn.net>; Fri,  7 Dec 2018 12:49:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbeLGMtJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 7 Dec 2018 07:49:09 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43082 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726194AbeLGMtI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Dec 2018 07:49:08 -0500
Received: by mail-wr1-f66.google.com with SMTP id r10so3666221wrs.10
        for <linux-doc@vger.kernel.org>; Fri, 07 Dec 2018 04:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mena-vt-edu.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S5NVvoOgAgdZo8wmN11QDMw/7RKccGkERCz5dFRhs3I=;
        b=HsAo0n5ZNHZaaJaRpG3bq8GeB9YXcLdfGtEPiqJR7TiK9RyHGc09ZiBOLVU2/W+GE0
         V5xYVxwH0yMcAuvTT3IRWHgbtyrUSJjJzeMXPG/c6Dl1235iHf6MF6F7qX3JO7jHRj0n
         bQjlCVGAQt81pNjjoJSFNzVRYe8zmL8APySTvaZrLtQNWX/ZSF6bRA8M1TcoReAIk29r
         yVPaYrUMimHnqJ5kgHtagJ+L9KMndIbDBFw7ZFg1lOKmc8PE6RkiyIJqBdovX3EYwv8J
         1tX5uw0LgZjnd0xFISAw71qw72AJlRkQhrupmJBtsifpJMophzJ+rkWe+16yl4pBfKDt
         jjDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S5NVvoOgAgdZo8wmN11QDMw/7RKccGkERCz5dFRhs3I=;
        b=flPnuzCU7WaY+AsrDhWVYWmLN9HORZZ6cqMr1V8S9yRfrRD/OyUVnwVT9wHy5RwsE7
         FC4gLpv7pCfu2+GGAPwTtSOd5MktOLqHe4nYtb+pT0JduYJRBnIjH7QKMXBp78loJ6oR
         vZ+c5pGPNiO5ywiIzgEMVMK1QbooCdw0PT5w7vNLodLB47v/709fj0jmW/2R44Ld6Doy
         +GsG3p9cTPYZh/tMWVb95hK/RvMc67OvtjHDfrPCezOzFMEMbCG4/g/nUUVueGltRKpI
         b3gVvC6983q+JcOkM0sx34Ihb+tBDlEDXzPjbkespTg7ZGzx+9hjhAlAdxewajKCQU41
         zWnw==
X-Gm-Message-State: AA+aEWZHzFyIV2GzZfnv4yg3u8466kvhPmbirb0K32Z8e6OGuPwdxMLn
        2FFOpcL72lIfl3vPr4CrhkBlmA==
X-Google-Smtp-Source: AFSGD/Xg0iVjxrHzmepdWCYZL5IIBms+bQjq3bJau9vmc8enLf7nlyrhxgrAgU168RFf41hftAmKlg==
X-Received: by 2002:adf:fd03:: with SMTP id e3mr1640907wrr.280.1544186947022;
        Fri, 07 Dec 2018 04:49:07 -0800 (PST)
Received: from localhost.localdomain ([156.213.98.90])
        by smtp.gmail.com with ESMTPSA id i192sm4362949wmg.7.2018.12.07.04.49.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Dec 2018 04:49:06 -0800 (PST)
From:   Ahmed Abd El Mawgood <ahmedsoliman@mena.vt.edu>
To:     Paolo Bonzini <pbonzini@redhat.com>, rkrcmar@redhat.com,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        hpa@zytor.com, x86@kernel.org, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        ahmedsoliman0x666@gmail.com, ovich00@gmail.com,
        kernel-hardening@lists.openwall.com, nigel.edwards@hpe.com,
        Boris Lukashev <blukashev@sempervictus.com>,
        Igor Stoppa <igor.stoppa@gmail.com>
Cc:     Ahmed Abd El Mawgood <ahmedsoliman@mena.vt.edu>
Subject: [PATCH 04/10] KVM: Document Memory ROE
Date:   Fri,  7 Dec 2018 14:47:57 +0200
Message-Id: <20181207124803.10828-5-ahmedsoliman@mena.vt.edu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181207124803.10828-1-ahmedsoliman@mena.vt.edu>
References: <20181207124803.10828-1-ahmedsoliman@mena.vt.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

ROE version documented here is implemented in the next 2 patches
Signed-off-by: Ahmed Abd El Mawgood <ahmedsoliman@mena.vt.edu>
---
 Documentation/virtual/kvm/hypercalls.txt | 40 ++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/Documentation/virtual/kvm/hypercalls.txt b/Documentation/virtual/kvm/hypercalls.txt
index da24c138c8..a31f316ce6 100644
--- a/Documentation/virtual/kvm/hypercalls.txt
+++ b/Documentation/virtual/kvm/hypercalls.txt
@@ -141,3 +141,43 @@ a0 corresponds to the APIC ID in the third argument (a2), bit 1
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
+Usage 3:
+     a0: ROE_MPROTECT_CHUNK	(requires version >= 2)
+     a1: Start address aligned to page boundary.
+     a2: Number of bytes to be protected.
+This configuration lets a guest kernel have part of its read/write memory
+converted into read-only with bytes granularity. ROE_MPROTECT_CHUNK is
+relatively slow compared to ROE_MPROTECT. This action is irreversible.
+Upon successful run, the number of bytes protected is returned.
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
2.19.2


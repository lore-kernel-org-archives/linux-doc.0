Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DD4B67D910
	for <lwn-linux-doc@archive.lwn.net>; Mon, 21 Jan 2019 07:59:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728631AbfAUH7x (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 21 Jan 2019 02:59:53 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52071 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728085AbfAUH7x (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Jan 2019 02:59:53 -0500
Received: by mail-wm1-f65.google.com with SMTP id b11so9792104wmj.1
        for <linux-doc@vger.kernel.org>; Sun, 20 Jan 2019 23:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mena-vt-edu.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S5NVvoOgAgdZo8wmN11QDMw/7RKccGkERCz5dFRhs3I=;
        b=BdDxLGM1dmo0GQ+oCKzyAyW/P0iJv04mOqd5KTQC7iP2RnAShme5aGa8+eljPHQD5R
         9UmVk6y1JS7PQ1SLhctISAowhr2r0ah2arCKYzHwcPIMBUI450ApL7L8k0GqISPqpioD
         UxI4E6VVT0p3jaEWvnULiJntikx2nuzcq1kWXgGHNp3baPwmjmhoIgkO7KuC6y813yud
         zvXyPUwiIOeN+gu9q5I5gKTTvdXNundyTG6tPOqDVEezJVRkPGQ+ow29IgF9qiH/lwsP
         cnQMPZD9X9blbOT7wc7fTFkK8bEjOwn4Wu1NeUueXVV60brUtY0RSwlBTv9y0t/tG3Nh
         GlJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S5NVvoOgAgdZo8wmN11QDMw/7RKccGkERCz5dFRhs3I=;
        b=qAzCdWyrhesNGw46JYaPa43Qv0A98sYI3UGyI+9DTQ4k59phE0IMTqxJCEPOTfh7uQ
         dgJNEf8XVU/kWaRqjZlzy/9X0bktj7DYU0S5s38UY0nzhk7QcD4wskR6kbz8XQ8B+FRF
         yVD0tmvsfCJc65Dug0ETkltiqfrzNV08aG6LbBVusHC1XFyxDFT3umU17+Gzvi4v3woE
         2dRwjf4+s3EXENpMHFA9HfkEcZRS6jJV4lyWzhlyr5yL2jr59zfZ3++FphfrEBIfvWIr
         Z5YaBm2LbWDkZ9834pM2Po8K5g63vyyoo7RsuxVJQcwXPFgdvqEv2rTbMHu7r9+216Du
         uLFw==
X-Gm-Message-State: AJcUukdYCBnd7AHXMNxHOASv9G1CaE22zNbRRjLx2wbbROmVUCXK89x7
        w+bUrqWYWGyYdHm4A6G4GOjJaECi9V4=
X-Google-Smtp-Source: ALg8bN4kc5ObGqv6NoNo2QHDN6CCtu/mF6luBJqOGiE2VJKAp52yGhiJxl9kbMkt/ISKNQ1uC0ZBkw==
X-Received: by 2002:a1c:7409:: with SMTP id p9mr23272500wmc.136.1548027677700;
        Sun, 20 Jan 2019 15:41:17 -0800 (PST)
Received: from localhost.localdomain ([156.212.82.83])
        by smtp.gmail.com with ESMTPSA id e9sm76576753wro.16.2019.01.20.15.41.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 20 Jan 2019 15:41:17 -0800 (PST)
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
Subject: [RESEND PATCH V8 04/11] KVM: Document Memory ROE
Date:   Mon, 21 Jan 2019 01:39:33 +0200
Message-Id: <20190120233940.15282-5-ahmedsoliman@mena.vt.edu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190120233940.15282-1-ahmedsoliman@mena.vt.edu>
References: <20190120233940.15282-1-ahmedsoliman@mena.vt.edu>
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


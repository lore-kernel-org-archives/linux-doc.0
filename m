Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9B14E7D91A
	for <lwn-linux-doc@archive.lwn.net>; Mon,  8 Jul 2019 21:15:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732362AbfGHVPf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 8 Jul 2019 17:15:35 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:43696 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405281AbfGHVPe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Jul 2019 17:15:34 -0400
Received: by mail-qt1-f196.google.com with SMTP id w17so16378850qto.10
        for <linux-doc@vger.kernel.org>; Mon, 08 Jul 2019 14:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VdsesycGrscxvl9VUJv2OrYGiO6I5hjIVNNGDZpPz+A=;
        b=mbcbklPnE9aSK5WgO3DjHoIPCmDRPu0y6gFhVqT2wERSQkqrlINfT1Dum/1YBHqVIA
         MHfCGiZYhNcyqdpiDNvMZSUSkBjk9mmUm2UzAXxyreXwkDarMe79+dMnFwRPOh7+l6Tk
         aB6rNkHgLO7Y1Jiz9NmlCAtxcQsnJZJn3GDc2qcLNW/H2zSoSBaJvjnwMgsVYjZasY6h
         wMgRHG4K4lnwl6PWSVbLTrSouwk/nknjx/sQIWAwaSwgSoByC78yhCB9mcQr5qM4iUFx
         zS5tOkS+Tj8MCjoQW99WEy4HdQ8WxAlpnEJNn0bceuRbwkIodt64QR6c1sZewin18v6i
         Sqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VdsesycGrscxvl9VUJv2OrYGiO6I5hjIVNNGDZpPz+A=;
        b=rRnK5Otn6raagqeI3i4HNVvNiaUfZeKWrkm0LqInsYVrXF9gyXBRmvcFXhpLtR3oNQ
         x354FwUac5bUfFFPiRRDvxFVVmnAFnDEvCcwnU50W8clL4LelxyB/z4Iaf85q1XjPESQ
         hsxYcJoBeQEP+PZC4+KI+Yc8Mx093r2QbRO20n67wY+jWE2Fl1JIfLv+NX8GjYxN4v9G
         dZ2Ije7x8JkWGJgi2J1XpEwchN66v4QNuTJSp/ljhb4RNc5CJ6IJzpY6jkMFFd1c2l6m
         GPC6XvG5d0cZ7CJa/rBwI94cVFQFnRjmdIMNZhbh5Uzk13Ffcn47gVhMVFHhSkzttkFF
         jGaQ==
X-Gm-Message-State: APjAAAXqpcGcyUtep38QqceZHPyhFJ9PTflJ7PdPe9Tug1MF6WA+Sa2X
        J4k8Yq2B3N/PfusWIk6zJksfDg==
X-Google-Smtp-Source: APXvYqxh88FuDHDTA50xcvkZxoDS6gx6EQNHyyvXUFPd1oxFXlmv0rBVOQea/c8sZqigS6xV/quFaw==
X-Received: by 2002:a0c:89b7:: with SMTP id 52mr16660367qvr.199.1562620533833;
        Mon, 08 Jul 2019 14:15:33 -0700 (PDT)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id b67sm8335620qkd.82.2019.07.08.14.15.32
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 08 Jul 2019 14:15:33 -0700 (PDT)
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, jmorris@namei.org, sashal@kernel.org,
        ebiederm@xmission.com, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        catalin.marinas@arm.com, will@kernel.org,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [v1 2/5] kexec: add resource for normal kexec region
Date:   Mon,  8 Jul 2019 17:15:25 -0400
Message-Id: <20190708211528.12392-3-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190708211528.12392-1-pasha.tatashin@soleen.com>
References: <20190708211528.12392-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

crashk_res resource is used to reserve memory for crash kernel. There is
also, however, a benefit to reserve memory for normal kernel to speed up
reboot performance. This is because during regular kexec reboot, kernel
performs relocations to the final destination of the loaded segments, and
the relocation might take a long time especially if initramfs is big.

Therefore, similarly to crashk_res, add kexeck_res that will be used to
reserve memory for normal kexec kernel.

Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/ioport.h | 1 +
 include/linux/kexec.h  | 6 ++++--
 kernel/kexec_core.c    | 9 +++++++++
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/include/linux/ioport.h b/include/linux/ioport.h
index da0ebaec25f0..3b18a3c112f3 100644
--- a/include/linux/ioport.h
+++ b/include/linux/ioport.h
@@ -133,6 +133,7 @@ enum {
 	IORES_DESC_PERSISTENT_MEMORY_LEGACY	= 5,
 	IORES_DESC_DEVICE_PRIVATE_MEMORY	= 6,
 	IORES_DESC_DEVICE_PUBLIC_MEMORY		= 7,
+	IORES_DESC_KEXEC_KERNEL			= 8,
 };
 
 /* helpers to define resources */
diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index b9b1bc5f9669..4c1121b385fb 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -303,12 +303,14 @@ extern int kexec_load_disabled;
 #define KEXEC_FILE_FLAGS	(KEXEC_FILE_UNLOAD | KEXEC_FILE_ON_CRASH | \
 				 KEXEC_FILE_NO_INITRAMFS)
 
-/* Location of a reserved region to hold the crash kernel.
- */
+/* Location of a reserved region to hold the crash kernel. */
 extern struct resource crashk_res;
 extern struct resource crashk_low_res;
 extern note_buf_t __percpu *crash_notes;
 
+/* Location of a reserved region to hold normal kexec kernel. */
+extern struct resource kexeck_res;
+
 /* flag to track if kexec reboot is in progress */
 extern bool kexec_in_progress;
 
diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
index 2c5b72863b7b..932feadbeb3a 100644
--- a/kernel/kexec_core.c
+++ b/kernel/kexec_core.c
@@ -70,6 +70,15 @@ struct resource crashk_low_res = {
 	.desc  = IORES_DESC_CRASH_KERNEL
 };
 
+/* Location of the reserved area for the normal kexec kernel */
+struct resource kexeck_res = {
+	.name  = "Kexec kernel",
+	.start = 0,
+	.end   = 0,
+	.flags = IORESOURCE_BUSY | IORESOURCE_SYSTEM_RAM,
+	.desc  = IORES_DESC_KEXEC_KERNEL
+};
+
 int kexec_should_crash(struct task_struct *p)
 {
 	/*
-- 
2.22.0


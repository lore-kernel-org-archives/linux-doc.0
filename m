Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C710C7D043
	for <lwn-linux-doc@archive.lwn.net>; Mon, 21 May 2018 18:18:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751077AbeEUSS1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 21 May 2018 14:18:27 -0400
Received: from mail-pf0-f196.google.com ([209.85.192.196]:36086 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750954AbeEUSS0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 May 2018 14:18:26 -0400
Received: by mail-pf0-f196.google.com with SMTP id w129-v6so7478036pfd.3
        for <linux-doc@vger.kernel.org>; Mon, 21 May 2018 11:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=Pmsxk/WQ70GNJ1JHYY5h8tos1+ZT4nYDpe6wpiEb1U0=;
        b=MsfD75cYPFh94OJID8WpQHKHncohmLJyrLS0nz27gR3f7r5Fw3fz3TOotPQMK2tzN6
         0e9cfNWhpZvKr8+vlR8pljSLq0tWegzAfwAOKJI8AeEK9UpG912yA0jbe94ltgi//xoj
         6px1nKjpX0jdS4aRzz8Ig8Rlx31hQ0I9j8ZcmtrqaeP8hBBe1ZQOuTcIVGeCoFysvWke
         xImgwy0zRPni4C+UsTbUMj5tSiXaqyFeIkw8H1T5HB0oQ4ikxTbee3/+dZL1W7bmVMTA
         2Itp4in9NVaJ9lKK7l2R32zXhXoqEl+lx7+gwbRjwVBuW9pe3XCNi4aYIXjq63+7QEmY
         6/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Pmsxk/WQ70GNJ1JHYY5h8tos1+ZT4nYDpe6wpiEb1U0=;
        b=X3XwTvJccraY9DJpEQnUIYtkKPlxD8a/7VJ5ajtCwwquKXQn2JpXz8AkRsMx+vTpy7
         ApRVIHq9eVhbtUQF5BNK+oaKzCGEjV/KFZsYNj0to5fkpLr7EjQX4RiFDAb+IJGRQu1w
         Eao9xtmQ8aazDZp9tMF7QVF/47MHVPRWVGwqQJTrh8d0n3iiIidmk0SN60+52zlf3OEf
         nf1f2Dms1KwiAIKUUgclCYkVO66D6joU4yRxOpF9eG/5eDjsPtMZ86coA1cuXXg2xx86
         0V1mr4e8hzelfGMFl4cN56NinDFgkNqqVOOudx87Qzddo8y19Aa7CQoXxuKYPZ84K44g
         adhw==
X-Gm-Message-State: ALKqPwfCdq6JlUzGKYfoXldP3iOmoH5TYthFRz0CbT8w6XGrisNZO/40
        obwJiqvSgWtwEkQ8bg0Hwh1/+Ro5b10=
X-Google-Smtp-Source: AB8JxZqu6gGK65X21ghD0S/5qPVf3E7pUi6uagUTdJIWfa4lMP2KRt0cwpQJaijO4QwNIakrAaG3Gg==
X-Received: by 2002:a62:a096:: with SMTP id p22-v6mr21183533pfl.9.1526926705302;
        Mon, 21 May 2018 11:18:25 -0700 (PDT)
Received: from vader.thefacebook.com ([2620:10d:c090:200::5:8fd0])
        by smtp.gmail.com with ESMTPSA id n5-v6sm23059581pff.134.2018.05.21.11.18.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 May 2018 11:18:24 -0700 (PDT)
From:   Omar Sandoval <osandov@osandov.com>
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, kernel-team@fb.com
Subject: [PATCH] Documentation: document hung_task_panic kernel parameter
Date:   Mon, 21 May 2018 11:18:17 -0700
Message-Id: <53ad4158547699c2d35ba817394750dc2487158a.1526926625.git.osandov@fb.com>
X-Mailer: git-send-email 2.17.0
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Omar Sandoval <osandov@fb.com>

This parameter has been around since commit e162b39a368f ("softlockup:
decouple hung tasks check from softlockup detection") in 2009 but was
never documented.

Signed-off-by: Omar Sandoval <osandov@fb.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 11fc28ecdb6d..4e37bebdc3d0 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1341,6 +1341,16 @@
 			x86-64 are 2M (when the CPU supports "pse") and 1G
 			(when the CPU supports the "pdpe1gb" cpuinfo flag).
 
+	hung_task_panic=
+			[KNL] Should the hung task detector generate panics.
+			Format: <integer>
+
+			A nonzero value instructs the kernel to panic when a
+			hung task is detected. The default value is controlled
+			by the CONFIG_BOOTPARAM_HUNG_TASK_PANIC build-time
+			option. The value selected by this boot parameter can
+			be changed later by the kernel.hung_task_panic sysctl.
+
 	hvc_iucv=	[S390] Number of z/VM IUCV hypervisor console (HVC)
 			       terminal devices. Valid values: 0..8
 	hvc_iucv_allow=	[S390] Comma-separated list of z/VM user IDs.
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

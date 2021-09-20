Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE18C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 20 Sep 2021 20:57:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A0FD60F70
	for <linux-doc@archiver.kernel.org>; Mon, 20 Sep 2021 20:57:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236748AbhITU7K (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 20 Sep 2021 16:59:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26016 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231777AbhITU5K (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Sep 2021 16:57:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632171342;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gGG4Fa5Smycs29b77eteLeOLTMiK3YmJo+qPCM0YDLQ=;
        b=Jb6Wm7KbqS3HDdV8kRmoFVnUxf6nXAacuVIJOyBzF/wCNZlEuWJm+xDZc8ndeM2lARdJ6m
        67RqMtUggRbwzVsx36anh5wObd+dXrsqRFIvim9vtMpfsCUGhRCMs95onUGFEStIjFVL/M
        bTxXGBOEURV4UN8l+1+NV65Vk59iPkg=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-MQ6Qcwh-P0WdeGOyqc7N1Q-1; Mon, 20 Sep 2021 16:55:41 -0400
X-MC-Unique: MQ6Qcwh-P0WdeGOyqc7N1Q-1
Received: by mail-io1-f69.google.com with SMTP id e2-20020a056602044200b005c23c701e26so43669801iov.21
        for <linux-doc@vger.kernel.org>; Mon, 20 Sep 2021 13:55:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gGG4Fa5Smycs29b77eteLeOLTMiK3YmJo+qPCM0YDLQ=;
        b=qadz10ARx9j3RwCCVpvV17EdyRxGx/jfxgvKNgg3PtqIGQWmKp9YkYUcc4mFKm6P2V
         MaPQKNgRAKJT99ajHwXJQn4ffujxLCDrjMZsTNqp//4rmWAe0d9wdhxJNQYgU0NgXMta
         yy0p4KKssIvcQFyDENOxZeXlYmYQwKokRSAxQmploXDCKzL1Z90A2CvzWL0STx6z8S1t
         tfCjCQpjk/BHbY2gEyJw2qr5fGeKKIub00N6yaNg0m/lgXB/rZs5APBKzoLapZqzcPOZ
         SR4Q5X0lMKC/5XIoIoI6LcruSFhaFC5E1ifgHy7p37TeuBggIkCarB7DL84vCzq7mghv
         Q/MA==
X-Gm-Message-State: AOAM5331RXyjUoQ0PL21QCR+QG6QgsUtxuMNtDr0vOr+GBIcw9RgMxOr
        jUJSWtjomXBLGs/1kOrAyAe2Qy1aPTvL+3A8d3643MceJb5bL89lT/dl+SDPoWhSebM92iPRwSi
        Wdp+xWEqi/KVH4PzuWFFf
X-Received: by 2002:a05:6e02:1d0c:: with SMTP id i12mr19819225ila.209.1632171340235;
        Mon, 20 Sep 2021 13:55:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDKfMpj8cq7GhlsXwG1CjbZWqXyz04Jbgy+lToeDrSaZKUoEBUGTMtxZB5pQaNXzRHe5ybDw==
X-Received: by 2002:a05:6e02:1d0c:: with SMTP id i12mr19819214ila.209.1632171340044;
        Mon, 20 Sep 2021 13:55:40 -0700 (PDT)
Received: from halaneylaptop.redhat.com (068-184-200-203.res.spectrum.com. [68.184.200.203])
        by smtp.gmail.com with ESMTPSA id v9sm9268905ilc.16.2021.09.20.13.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 13:55:39 -0700 (PDT)
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Jason Baron <jbaron@akamai.com>, Jonathan Corbet <corbet@lwn.net>,
        Jim Cromie <jim.cromie@gmail.com>
Cc:     Andrew Halaney <ahalaney@redhat.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] dyndbg: Remove support for ddebug_query param
Date:   Mon, 20 Sep 2021 15:54:43 -0500
Message-Id: <20210920205444.20068-3-ahalaney@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920205444.20068-1-ahalaney@redhat.com>
References: <20210920205444.20068-1-ahalaney@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This param has been deprecated for a very long time now, let's rip it
out.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 .../admin-guide/dynamic-debug-howto.rst       |  6 ++---
 .../admin-guide/kernel-parameters.txt         |  5 ----
 lib/dynamic_debug.c                           | 25 -------------------
 3 files changed, 2 insertions(+), 34 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index b119b8277b3e..d0911e7cc271 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -249,8 +249,7 @@ Debug messages during Boot Process
 
 To activate debug messages for core code and built-in modules during
 the boot process, even before userspace and debugfs exists, use
-``dyndbg="QUERY"``, ``module.dyndbg="QUERY"``, or ``ddebug_query="QUERY"``
-(``ddebug_query`` is obsoleted by ``dyndbg``, and deprecated).  QUERY follows
+``dyndbg="QUERY"`` or ``module.dyndbg="QUERY"``.  QUERY follows
 the syntax described above, but must not exceed 1023 characters.  Your
 bootloader may impose lower limits.
 
@@ -270,8 +269,7 @@ this boot parameter for debugging purposes.
 
 If ``foo`` module is not built-in, ``foo.dyndbg`` will still be processed at
 boot time, without effect, but will be reprocessed when module is
-loaded later. ``ddebug_query=`` and bare ``dyndbg=`` are only processed at
-boot.
+loaded later. Bare ``dyndbg=`` is only processed at boot.
 
 
 Debug Messages at Module Initialization Time
diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 91ba391f9b32..9c0c57d1ca78 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -841,11 +841,6 @@
 			Format: <port#>,<type>
 			See also Documentation/input/devices/joystick-parport.rst
 
-	ddebug_query=	[KNL,DYNAMIC_DEBUG] Enable debug messages at early boot
-			time. See
-			Documentation/admin-guide/dynamic-debug-howto.rst for
-			details.  Deprecated, see dyndbg.
-
 	debug		[KNL] Enable kernel debugging (events log level).
 
 	debug_boot_weak_hash
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 84c16309cc63..130ce0eb550d 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -746,21 +746,6 @@ EXPORT_SYMBOL(__dynamic_ibdev_dbg);
 
 #endif
 
-#define DDEBUG_STRING_SIZE 1024
-static __initdata char ddebug_setup_string[DDEBUG_STRING_SIZE];
-
-static __init int ddebug_setup_query(char *str)
-{
-	if (strlen(str) >= DDEBUG_STRING_SIZE) {
-		pr_warn("ddebug boot param string too large\n");
-		return 0;
-	}
-	strlcpy(ddebug_setup_string, str, DDEBUG_STRING_SIZE);
-	return 1;
-}
-
-__setup("ddebug_query=", ddebug_setup_query);
-
 /*
  * Install a noop handler to make dyndbg look like a normal kernel cli param.
  * This avoids warnings about dyndbg being an unknown cli param when supplied
@@ -1133,16 +1118,6 @@ static int __init dynamic_debug_init(void)
 		 entries, modct, (int)((modct * sizeof(struct ddebug_table)) >> 10),
 		 (int)((entries * sizeof(struct _ddebug)) >> 10));
 
-	/* apply ddebug_query boot param, dont unload tables on err */
-	if (ddebug_setup_string[0] != '\0') {
-		pr_warn("ddebug_query param name is deprecated, change it to dyndbg\n");
-		ret = ddebug_exec_queries(ddebug_setup_string, NULL);
-		if (ret < 0)
-			pr_warn("Invalid ddebug boot param %s\n",
-				ddebug_setup_string);
-		else
-			pr_info("%d changes by ddebug_query\n", ret);
-	}
 	/* now that ddebug tables are loaded, process all boot args
 	 * again to find and activate queries given in dyndbg params.
 	 * While this has already been done for known boot params, it
-- 
2.31.1


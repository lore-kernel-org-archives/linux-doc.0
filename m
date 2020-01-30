Return-Path: <SRS0=+hQT=3T=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 541C8C35246
	for <linux-doc@archiver.kernel.org>; Thu, 30 Jan 2020 23:08:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2A512214D8
	for <linux-doc@archiver.kernel.org>; Thu, 30 Jan 2020 23:08:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Cea+74kK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727795AbgA3XIu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 30 Jan 2020 18:08:50 -0500
Received: from mail-pf1-f201.google.com ([209.85.210.201]:53490 "EHLO
        mail-pf1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727784AbgA3XIr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Jan 2020 18:08:47 -0500
Received: by mail-pf1-f201.google.com with SMTP id c17so2752588pfi.20
        for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2020 15:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=dCX2LQDaoIcwFmYSq3cgmAkx+Exp0YNCPmOsw4OCxis=;
        b=Cea+74kKLR/GteXq64Op60MuNDLPdMizqbgVfNpoWkuF8hmEB2KWidlL87tYLsXrua
         8Xzbo2dCO77srQ679vBOopPPaT5k/SDDfLFgk2PVYP32VYXEliWcHSPQQvW7RJouxHAe
         hc+sUOuQ6TRmwjFRtbnmDP2UOQJ2LzmbdTH38wKl5fTpIu7RcFxSIOf2vAfgqu8CZAVW
         GLEzOaHOLVt2EVc2azlbEU9baY7XraTtjjWlZ/jKsLTm/MLozD7uXkqirkr8AYc/6GXF
         us3u/wuW2oRnrheLqJLro/pS7keuZISgD+5hxQQ9fLdo+8fcCY/HdMmki7Y+kyw+/l1K
         d+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=dCX2LQDaoIcwFmYSq3cgmAkx+Exp0YNCPmOsw4OCxis=;
        b=f1DkpbLVm/09P80zhinTxMuydciuFMjHLfD/Vgt63bY9vHruOvQeuENUZarqQHn28o
         x15d+pQClxOg1wMNB4Pgxplg41Dg/zkyKOxsxDx07iUTKsUMtlIubcdJ8d2V/9CWOWGV
         pBS/8p4cqUcufQ+Xk7k3jzXTo6Wflt27Gk+m88FrLyxrwBZ9USfHYyKzDJgVBQ1EhS53
         Y3OV8gQsr9JisV+cNK4kaDR8ov9KM4qg+wNcPgwrIsJbvlLOaPZFvGtQuSCN26s0RL5r
         pzwYZ+khFZGPgpg2lDH1GlnjuqgsrM1S74itP1eAupywH9/iDE0Hu8tjFOBJXu97Hfc3
         Fmzg==
X-Gm-Message-State: APjAAAWi72oRD7MQILOulU1fVFbRaxRxnSGVVpg3bZG825lHURTI7Jmh
        iQr3ndQocQt/OwjOphVWggCCMli49WomQEbar0vLZg==
X-Google-Smtp-Source: APXvYqx+2ri6MUmVYy6ptSJgWKOGMVZfjLQX0JTmgMuADBux9koL0KUnaGALzsStF3tXii//z0M3FTNmV1ggHaNXMBaSXw==
X-Received: by 2002:a63:78cf:: with SMTP id t198mr6898466pgc.287.1580425727146;
 Thu, 30 Jan 2020 15:08:47 -0800 (PST)
Date:   Thu, 30 Jan 2020 15:08:12 -0800
In-Reply-To: <20200130230812.142642-1-brendanhiggins@google.com>
Message-Id: <20200130230812.142642-8-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20200130230812.142642-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
Subject: [PATCH v2 7/7] Documentation: Add kunit_shutdown to kernel-parameters.txt
From:   Brendan Higgins <brendanhiggins@google.com>
To:     jdike@addtoit.com, richard@nod.at, anton.ivanov@cambridgegreys.com,
        arnd@arndb.de, keescook@chromium.org, skhan@linuxfoundation.org,
        alan.maguire@oracle.com, yzaikin@google.com, davidgow@google.com,
        akpm@linux-foundation.org, rppt@linux.ibm.com,
        frowand.list@gmail.com
Cc:     gregkh@linuxfoundation.org, sboyd@kernel.org, logang@deltatee.com,
        mcgrof@kernel.org, knut.omang@oracle.com,
        linux-um@lists.infradead.org, linux-arch@vger.kernel.org,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add kunit_shutdown, an option to specify that the kernel shutsdown after
running KUnit tests, to the kernel-parameters.txt documentation.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index ade4e6ec23e03..522fd8bdec949 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2054,6 +2054,13 @@
 			0: force disabled
 			1: force enabled
 
+	kunit_shutdown	[KERNEL UNIT TESTING FRAMEWORK] Shutdown kernel after
+			running tests.
+			Default:	(flag not present) don't shutdown
+			poweroff:	poweroff the kernel after running tests
+			halt:		halt the kernel after running tests
+			reboot:		reboot the kernel after running tests
+
 	kvm.ignore_msrs=[KVM] Ignore guest accesses to unhandled MSRs.
 			Default is 0 (don't ignore, but inject #GP)
 
-- 
2.25.0.341.g760bfbb309-goog


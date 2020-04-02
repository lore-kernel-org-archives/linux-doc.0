Return-Path: <SRS0=YY78=5S=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32152C43331
	for <linux-doc@archiver.kernel.org>; Thu,  2 Apr 2020 17:27:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B979C20757
	for <linux-doc@archiver.kernel.org>; Thu,  2 Apr 2020 17:27:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sTraeY2r"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389044AbgDBR1K (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 2 Apr 2020 13:27:10 -0400
Received: from mail-lj1-f169.google.com ([209.85.208.169]:44145 "EHLO
        mail-lj1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389166AbgDBR1K (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 2 Apr 2020 13:27:10 -0400
Received: by mail-lj1-f169.google.com with SMTP id p14so4073755lji.11
        for <linux-doc@vger.kernel.org>; Thu, 02 Apr 2020 10:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3W+buJsESUayv23SzMAgW7TvxvOEzmP6QCmlj5LEu6U=;
        b=sTraeY2rqlHwKPNB8WaBCq7OFWW8CdY0qdSIK9m+8rrZy1JFdVOBSKp/RrRrq8AGLw
         G25Nlr6ux0sVzzVX7AKx7u0VlbKr4ICERJomBNS6Q1Wvsz8HGJJ+s3QzHUFoXtDmtBrs
         gv7RX5HIG9tnserxnCq3kR9IxXNn3ia4n00KPWZKpOfTBj+1/ax87+7PkNv/CcVrUR4X
         g6ZwlGIZGaNK2zxQIdGAkJdkcTPnwazHpVm56U5Jgq1T98K4fl4ilgB7pb2ycK6teJ0C
         5pW0hL5DFoA9eJlC29RR+LFsFklAsHNAtBXSvWbQaGKdkAmiBXbUzlkHm5h98uyXok0E
         sb8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3W+buJsESUayv23SzMAgW7TvxvOEzmP6QCmlj5LEu6U=;
        b=m6QEMKl21QBsYx174o3BrMoCO9P5KVVbxAyJgTNoBiSamIhQeZhW7B0mn4VZbZpTZb
         QwZjGu5qR2BUrZxuEZLE3ub2Xb+gJQW2FnNnwAyatYcuFGKC+1zocSLtLzGjauSjTzIh
         nScRnHHJutdHb8dY0vYGd1neyN5LDm0gw3y9iGbUpOt01BBFeQ6WPC4t0TrbyqpXN8EM
         fvIcGeqilu3ItffedmSCdA7ylXNtUt+rL4k8KqeL6/k92YM35BeqoKeCVSPS0HMcBBVR
         w+HzPDK4tf9xb6YzT54R7DTUUOXbAmKq7rZbIu1L7eVploXSjmu8wm1EhFsm7kh0cFc2
         zhpQ==
X-Gm-Message-State: AGi0PubI7eAGUHCEb6F6M32oL9FMQ6pln3MajtNd7dxnoL5FTlK+AY95
        MUMjb0szDTv8SxlYDJKPaSd0CQuYPT0=
X-Google-Smtp-Source: APiQypJd9iffOJ5RnCOXSFKD7oPzR8tYauR9r9ZilW8/yO4dMn7YD5FyWSLFJ+9io9AVIA1ZyNCSXw==
X-Received: by 2002:a2e:a16d:: with SMTP id u13mr2612341ljl.140.1585848427530;
        Thu, 02 Apr 2020 10:27:07 -0700 (PDT)
Received: from localhost.localdomain (h-4-68-234.A785.priv.bahnhof.se. [155.4.68.234])
        by smtp.gmail.com with ESMTPSA id s10sm3832280ljp.87.2020.04.02.10.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2020 10:27:07 -0700 (PDT)
From:   Jimmy Assarsson <jimmyassarsson@gmail.com>
To:     linux-doc@vger.kernel.org
Cc:     Jimmy Assarsson <jimmyassarsson@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 2/2] docs: kernel-parameters.txt: Fix broken references
Date:   Thu,  2 Apr 2020 19:26:14 +0200
Message-Id: <20200402172614.3020-2-jimmyassarsson@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200402172614.3020-1-jimmyassarsson@gmail.com>
References: <20200402172614.3020-1-jimmyassarsson@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix remaining broken references in kernel-parameters.txt.

Cc: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Jimmy Assarsson <jimmyassarsson@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index e98750227fb2..856a17b7170d 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -683,7 +683,7 @@
 	coredump_filter=
 			[KNL] Change the default value for
 			/proc/<pid>/coredump_filter.
-			See also Documentation/filesystems/proc.txt.
+			See also Documentation/filesystems/proc.rst.
 
 	coresight_cpu_debug.enable
 			[ARM,ARM64]
@@ -960,7 +960,7 @@
 			edid/1680x1050.bin, or edid/1920x1080.bin is given
 			and no file with the same name exists. Details and
 			instructions how to build your own EDID data are
-			available in Documentation/driver-api/edid.rst. An EDID
+			available in Documentation/admin-guide/edid.rst. An EDID
 			data set will only be used for a particular connector,
 			if its name and a colon are prepended to the EDID
 			name. Each connector may use a unique EDID data
-- 
2.26.0


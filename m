Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3B0987D2F0
	for <lwn-linux-doc@archive.lwn.net>; Tue,  9 Jul 2019 18:20:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727419AbfGISUS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 9 Jul 2019 14:20:18 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:44492 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727072AbfGISUS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Jul 2019 14:20:18 -0400
Received: by mail-qt1-f193.google.com with SMTP id 44so18751850qtg.11
        for <linux-doc@vger.kernel.org>; Tue, 09 Jul 2019 11:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=O8sp7Ivz1alrz3xXygPalicyjdu3OPu+GkykS7h2DZg=;
        b=XSW61kWTCXRdscVw0OH+r9e4vwdXvYbKjBz6k2VZ4GjxPw4990pNb4BAwrNmmRtsKa
         WtJJtAVYm0yQyc0gT9qSB2/HJ82+H/MyS3XC9ctMBPbmW7oIgk6eANZnGVKs2HBNiQ31
         /bHZn6IWmWrVDAl4L6vMC+WdnQz/McJp0xLy9cq1x0N7urntIF/8qUhPuZMeitTr6tYj
         seq7y1K4rV+ZnPT/cE9I0rwd7rtanJ3jIDMOql2+Ikg4jcapC2ZEhDEL5dbgh2nC9Yd7
         7VxNW+sDRKWTWxuTciOBY6N/SjEJM6T2DfzfKRi5ZSX4eCt/ImtICLCJ7wV7q6H4hJ/t
         hxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O8sp7Ivz1alrz3xXygPalicyjdu3OPu+GkykS7h2DZg=;
        b=Ximt4kDyQ9afDsBIaJakTjyeC+HYQo3O3QifNIEI1TUuJCY7x45My69HYyAfC1Reku
         G0FHTOTcWwZi3YbGgMpCxh/H4M+QDFTOOG3S2pJrN32WmkwyfU1WhA0wElI7JZfWIzgQ
         UPMGWGVkzQzDApdUd3eFfLoJtyJjrPS8/Ds7SLhdH2TVUTYiLRSTUrcE4nulKWp9JU/d
         rpk3PNHfOaCehpTwjBlQPlt3VW6u+GxtfaiK0EwOT7gxhCOUcH8qDohUJeX8KWZMY/uJ
         HJ2kJKE+VDyFwCjL7yB6q/RLRY80qlwyY7Ct3rvPhTPkMbnihbM0NheE6Kep+q+qHDoZ
         0TVg==
X-Gm-Message-State: APjAAAVZsKxN5n6pe3US9wKyNeyZpvQ0E4zI3Ex5/ty1ErmY/ldWznp+
        AAvHsWzksRv6sxBRpd21q/N1fw==
X-Google-Smtp-Source: APXvYqwK3sHb+R0eRvj6/WADS1T4iF+JrbGV2Q7udh84kzeXGKKiVV5f5NzGnIT7DBMyye2cxX8F5w==
X-Received: by 2002:ac8:4758:: with SMTP id k24mr19729228qtp.20.1562696417894;
        Tue, 09 Jul 2019 11:20:17 -0700 (PDT)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id k123sm9113056qkf.13.2019.07.09.11.20.16
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 09 Jul 2019 11:20:17 -0700 (PDT)
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, jmorris@namei.org, sashal@kernel.org,
        ebiederm@xmission.com, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        catalin.marinas@arm.com, will@kernel.org,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [v2 1/5] kexec: quiet down kexec reboot
Date:   Tue,  9 Jul 2019 14:20:10 -0400
Message-Id: <20190709182014.16052-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190709182014.16052-1-pasha.tatashin@soleen.com>
References: <20190709182014.16052-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Here is a regular kexec command sequence and output:
=====
$ kexec --reuse-cmdline -i --load Image
$ kexec -e
[  161.342002] kexec_core: Starting new kernel

Welcome to Buildroot
buildroot login:
=====

Even when "quiet" kernel parameter is specified, "kexec_core: Starting
new kernel" is printed.

This message has  KERN_EMERG level, but there is no emergency, it is a
normal kexec operation, so quiet it down to appropriate KERN_NOTICE.

Machines that have slow console baud rate benefit from less output.

Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: Simon Horman <horms@verge.net.au>
---
 kernel/kexec_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
index d5870723b8ad..2c5b72863b7b 100644
--- a/kernel/kexec_core.c
+++ b/kernel/kexec_core.c
@@ -1169,7 +1169,7 @@ int kernel_kexec(void)
 		 * CPU hotplug again; so re-enable it here.
 		 */
 		cpu_hotplug_enable();
-		pr_emerg("Starting new kernel\n");
+		pr_notice("Starting new kernel\n");
 		machine_shutdown();
 	}
 
-- 
2.22.0


Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6B9547D910
	for <lwn-linux-doc@archive.lwn.net>; Mon,  8 Jul 2019 21:15:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405279AbfGHVPe (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 8 Jul 2019 17:15:34 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:40714 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727662AbfGHVPd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Jul 2019 17:15:33 -0400
Received: by mail-qt1-f196.google.com with SMTP id a15so19479911qtn.7
        for <linux-doc@vger.kernel.org>; Mon, 08 Jul 2019 14:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=O8sp7Ivz1alrz3xXygPalicyjdu3OPu+GkykS7h2DZg=;
        b=n8BIhwWJ9zh0jUg2RW2/uYQy7FXCgRGeTdMBO55KXOXgAIespxSPLZq0PYdQHargu4
         8/6ZmX6+n021l86aooEGRSG6OOh9z87P2hsOb//zkA6XSfbnLwX1J6q9EqiRDhiSEkei
         37/LIxbZzFCypM5/mZYla7j/sFWUIrbc8e3qhgO4wFofOmUK0lhXe4tr6tDxWT0nr2tS
         QQ0+d7Qy7D/REmw0t12Dt0EtWx80RzWMBAEUOejhW8CkeW2/+kE8QKMZkyyV8nLai6eQ
         0uWgAgMS4TLYACEQUE8stDXIn7xumtxeI3mjoGdxI0wMvKfmReYsVjRk6sJfFqriuHbY
         Us6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O8sp7Ivz1alrz3xXygPalicyjdu3OPu+GkykS7h2DZg=;
        b=rjB6zvXSC7iPZYc/WdQ1RsvRatERD3rPizbR8SM0GTkqwtUZk1ClBfxpT6SIciYkkO
         nf90qcKP6l1IeGiP6OtOm9EnjGBLcCkOQUkKbwNrbsJ7ovud4wfjj0QxR4DTN/JVpx6q
         IYCeBiqX8C6NzKoMawUbJLLUHm5kS/8ss3eSMaO3sAZQkT1vHYi1c0Xv72F1txIvpT8y
         vhdw+paaWfnnp26fVBz8OTsez1KbrgQHbi05cWzHvSCJB3b6CzWw/fOvYznWk2bbQU45
         6Ho7djfhlh0JU9c1biRlm/GLHF55yEDIwXmQ/l6koSpjHrZ1mYTi9OnsDassMqH1h1XQ
         OsFw==
X-Gm-Message-State: APjAAAW5trL/ecYn0dRzLkX3yXOaf7cxzoh1OqHGegYKSTdERl4dXqtL
        5IS7jS9V+Rw8WaH+bnbrcGU7LQ==
X-Google-Smtp-Source: APXvYqyKqoOHu6EcUgIJIytE2kcvp422ziKgpaW7euQ8lCRv+YnhnmdNGlmL0VXgx8QTvMj1RSZ8nQ==
X-Received: by 2002:a0c:b148:: with SMTP id r8mr16207600qvc.240.1562620532517;
        Mon, 08 Jul 2019 14:15:32 -0700 (PDT)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id b67sm8335620qkd.82.2019.07.08.14.15.31
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 08 Jul 2019 14:15:31 -0700 (PDT)
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, jmorris@namei.org, sashal@kernel.org,
        ebiederm@xmission.com, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        catalin.marinas@arm.com, will@kernel.org,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [v1 1/5] kexec: quiet down kexec reboot
Date:   Mon,  8 Jul 2019 17:15:24 -0400
Message-Id: <20190708211528.12392-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190708211528.12392-1-pasha.tatashin@soleen.com>
References: <20190708211528.12392-1-pasha.tatashin@soleen.com>
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


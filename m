Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B9AEC7D912
	for <lwn-linux-doc@archive.lwn.net>; Wed, 31 Jul 2019 15:39:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729373AbfGaPjC (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 31 Jul 2019 11:39:02 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:46456 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729104AbfGaPjB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 31 Jul 2019 11:39:01 -0400
Received: by mail-qt1-f196.google.com with SMTP id h21so66968153qtn.13
        for <linux-doc@vger.kernel.org>; Wed, 31 Jul 2019 08:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=O8sp7Ivz1alrz3xXygPalicyjdu3OPu+GkykS7h2DZg=;
        b=f/mj0qEdjPvowxzxCkz1WBHsoz6X08MjhaCvOP9JKChUzdvXGCDjmIksTr75NmrETe
         GR0NJA4z1vIEH0dzoq8OvrHbM6EdjK+AohOXseaucGCyJn1Xewil/BIr2BORcK8Y8r+W
         B1JzbU1hdtMsW+Qq72doDnCa9Cyf/4J1EsfdmNeeVCidWQbLHt+DkzFZUp2EXOkbnkdG
         EvW/gLPfttAw50rqtj3FU3JdgGfBzBnstUC/k66NtOwuC0Nqlg1fr2V9VIaZji8gnYBA
         Oa1jc7STRN3fH47wz3Yk1rreSvslGvBiO2R7vofvw5mmc48VryeJE4V7i1rRlbMbWKxH
         l5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O8sp7Ivz1alrz3xXygPalicyjdu3OPu+GkykS7h2DZg=;
        b=c2rtpr8RCRIIWopvCwpCqFj0nXcSSBFjlVE20nGj7C5iMHfI0tYRoskdBD9kbFFfaZ
         id9syMuD4/ysEkupTXLYPlWLAXDUMpZBIHIQZBBJHyntSp9LNrjDfDeVNfdX44QGxbEu
         PgJmpAe5gh+pwykfXx0+8drmZJxSTCHKcOlL7guK2dWnWv4zlpzqp0DHiBeA9guvlORK
         Y4MEoWSYSefhFEdcWkGRzv0y134NT7WwxZa6vT3J1AlnWHnh0aI+g0EqVflM5ij3gJSv
         c0AMPdQ+LPKRTaZ8rX/1cp4ZAwElWmVWoxEeLR/5Dh2THze+5o6w8IhbavSpeeQvzQYf
         X4ew==
X-Gm-Message-State: APjAAAXLkzlRwXAWYjjPtSdnsnxCt4nIQbSdLOuJBg5XBHzXlMthOJdd
        3MgFzZgiNWjSAcAASf11gUI=
X-Google-Smtp-Source: APXvYqxvBo52tjJ6/0c0xwHoZtK9MewLNPfKHRcGHVWsI64uRmnRR/4lWkfMBAzaWutbGo9baKuA9g==
X-Received: by 2002:a0c:afd5:: with SMTP id t21mr88223958qvc.105.1564587540796;
        Wed, 31 Jul 2019 08:39:00 -0700 (PDT)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id f25sm35116803qta.81.2019.07.31.08.38.59
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 08:39:00 -0700 (PDT)
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, jmorris@namei.org, sashal@kernel.org,
        ebiederm@xmission.com, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        catalin.marinas@arm.com, will@kernel.org,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        marc.zyngier@arm.com, james.morse@arm.com, vladimir.murzin@arm.com,
        matthias.bgg@gmail.com, bhsharma@redhat.com
Subject: [RFC v2 1/8] kexec: quiet down kexec reboot
Date:   Wed, 31 Jul 2019 11:38:50 -0400
Message-Id: <20190731153857.4045-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190731153857.4045-1-pasha.tatashin@soleen.com>
References: <20190731153857.4045-1-pasha.tatashin@soleen.com>
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


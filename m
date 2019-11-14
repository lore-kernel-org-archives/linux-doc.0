Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 299637D90D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 14 Nov 2019 22:16:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726910AbfKNWQx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 14 Nov 2019 17:16:53 -0500
Received: from mail-pg1-f202.google.com ([209.85.215.202]:38340 "EHLO
        mail-pg1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726613AbfKNWQx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Nov 2019 17:16:53 -0500
Received: by mail-pg1-f202.google.com with SMTP id s8so5696863pgv.5
        for <linux-doc@vger.kernel.org>; Thu, 14 Nov 2019 14:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=RIRCCMERSX60DPHxGjGXa+inq5I/jJQr4eEYO43s6dg=;
        b=b9yORXv/tdkFLcUZLkE2uzdHVIAtpfolnXmlTeaiVz2ryjjkEh/t2kNaI789QpRTvE
         O9WsLv6IF3fN3uBMbxzQywCTFZSMufT4FIute2CLGCs1UWc8vO+k1HXXyPVRiY6EyPL6
         5smqPjl6obIK+mHGIlbVYQWEp5HN0XgRQ/Fh9hsHOlKKpAfCJM1Syzugol+2omkoUwIY
         nHXGmn0dCv0LGM904hExXWxqyT31nnHQopgdJII4RmQqrVN7mg7yTCZc/K9L+Rjb3qtG
         jLAhT7lazS8wGJZV/qaEIlk7HCS9pzEuHTmW8m4RSU5JuVDahNOW02KBJXLBNH0F+kxx
         fEdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=RIRCCMERSX60DPHxGjGXa+inq5I/jJQr4eEYO43s6dg=;
        b=CFP27q9rI4TzG100yh4kPF1EXdCGB/Rb698a9VOIUSrbQZCSX2JatVK0tTkvJhdrnN
         ohaGuHGax/PqSxmxYnVALeRM6LYSj/hMXOlsnT/0lvyuV6EBxI0h8i7OM9Tp49O1lRo6
         E8UHJE8SpBsdmIBhOVZcqRyw2AG+N7SPEOB1AkYXQNE3lcJgnc3/v2CeqTo56BthUi8g
         MY9/Fh0D+Gtw8guoAQC6eoLUA9unrkC3ilfK3No0vofR9HNjdVmDB4pG2XKxV59i+H34
         9qMqaIwnMiQFIepeqflOPdL9tdo51RTeHiSJQ9LvgIYw1daMWMwigCPtmxMBrL6aEdhF
         /hUA==
X-Gm-Message-State: APjAAAV1tngXC+sZO/yR57A8unybQPjTzs+8/Vdqm0lCaXrj/pm6NhDE
        ieinFrthbmaVmEinfGWkiUgTgtQlMRVJI1Y1yw==
X-Google-Smtp-Source: APXvYqxWfMGrMQWNfScxPQ8PK0aNqLSflhxN3kaSIb2n9bqGp3hJU1d5cougJeT1MB1d3dZzeSupTC5WQY6PSGv3xSs=
X-Received: by 2002:a65:41cd:: with SMTP id b13mr12783514pgq.385.1573769812744;
 Thu, 14 Nov 2019 14:16:52 -0800 (PST)
Date:   Thu, 14 Nov 2019 14:16:34 -0800
Message-Id: <20191114221634.258799-1-asteinhauser@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
Subject: [PATCH] Mention PowerPC in the L1TF documentation.
From:   asteinhauser@google.com
To:     corbet@lwn.net, tglx@linutronix.de
Cc:     linux-doc@vger.kernel.org,
        Anthony Steinhauser <asteinhauser@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Anthony Steinhauser <asteinhauser@google.com>

There is a false negative that L1TF is Intel specific while it affects
also PowerPC:
https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=8e6b6da91ac9b9ec5a925b6cb13f287a54bd547d
Another false negative is that the kernel is unconditionally protected
against L1TF attacks from userspace. That's true only on x86 but not on
PowerPC where you can turn the protection off by nopti.
Signed-off-by: Anthony Steinhauser <asteinhauser@google.com>
---
 Documentation/admin-guide/hw-vuln/l1tf.rst | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/hw-vuln/l1tf.rst b/Documentation/admin-guide/hw-vuln/l1tf.rst
index f83212fae4d5..243e494b337a 100644
--- a/Documentation/admin-guide/hw-vuln/l1tf.rst
+++ b/Documentation/admin-guide/hw-vuln/l1tf.rst
@@ -9,10 +9,11 @@ for the access, has the Present bit cleared or other reserved bits set.
 Affected processors
 -------------------
 
-This vulnerability affects a wide range of Intel processors. The
-vulnerability is not present on:
+This vulnerability affects a wide range of Intel and PowerPC processors.
+The vulnerability is not present on:
 
-   - Processors from AMD, Centaur and other non Intel vendors
+   - Processors from AMD, Centaur and other non Intel vendors except for
+     PowerPC
 
    - Older processor models, where the CPU family is < 6
 
@@ -125,7 +126,7 @@ mitigations are active. The relevant sysfs file is:
 
 /sys/devices/system/cpu/vulnerabilities/l1tf
 
-The possible values in this file are:
+The possible values in this file on x86 are:
 
   ===========================   ===============================
   'Not affected'		The processor is not vulnerable
@@ -158,8 +159,10 @@ The resulting grade of protection is discussed in the following sections.
 Host mitigation mechanism
 -------------------------
 
-The kernel is unconditionally protected against L1TF attacks from malicious
-user space running on the host.
+On x86 the kernel is unconditionally protected against L1TF attacks from
+malicious user space running on the host. On PowerPC the kernel is
+protected by flushing the L1D cache on each transition from kernel to
+userspace unless the 'nopti' boot argument turns this mitigation off.
 
 
 Guest mitigation mechanisms
-- 
2.24.0.432.g9d3f5f5b63-goog


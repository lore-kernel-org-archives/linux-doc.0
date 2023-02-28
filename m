Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A7F6C64ED6
	for <linux-doc@archiver.kernel.org>; Tue, 28 Feb 2023 19:06:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbjB1TGC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 28 Feb 2023 14:06:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbjB1TGB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Feb 2023 14:06:01 -0500
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E844305FF
        for <linux-doc@vger.kernel.org>; Tue, 28 Feb 2023 11:06:00 -0800 (PST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-53852143afcso302334477b3.3
        for <linux-doc@vger.kernel.org>; Tue, 28 Feb 2023 11:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jp-hosting.net; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T5YAkEgvaiCl9tX6YlYNUEiVKoTeTiZHoRI7PUW6hZQ=;
        b=B19osipC0T3RM+yR8sKkH/sNrtUXHUPsK0N9fVIDlgf/8Soq7DerG/LbV6EXBYPcIS
         NVlw18qWttckm9e1xB+TP4kt8fFHMn434MMFhlYQEB8dEq89t7zJc2iFa7+pTIPg7ZNE
         +pb2GdZsVIcYa5Rs8ichQ+NRtp1l8zY8y/a3xe28LWeHVIAgxQCCpZPnPkh9Zbnko0ip
         TRWlh1lqf6Z53KjcC1YpdXRI2eFX8L2adRTAC/LtexW9W2XfMl6FGJBHmrurOQFVaouc
         d78e44HrQe6C/V4nUvWhq7JCYmjO+TOy1nNJu/gPbmMddhyQSvILH3Bcoay1yN/qZ80s
         g3Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T5YAkEgvaiCl9tX6YlYNUEiVKoTeTiZHoRI7PUW6hZQ=;
        b=VFQf7YVKQdDaNXygDM8y7Kru/sTtl6ciThJtwKHkkdP199YLmqur6zp58l6wGIZ3/V
         J7ROtSWg0PG/J6EOvajdOzThYX0+CKvSO+87J+WEZMLTeGn3wpojsxlFcEYqAnsCYI3Z
         oYWiIL/TwXHsRcgKDLzjDwyPTqTM+yHNdbVLG7fjFea/0kJlNrnYZ45TWsEGGyCoYuZj
         RL9zIP9l0FSduKQQBmJs1207rgm8LzQD2nl8FHaYXsgoR91+3/nuIyHbpRexOing940k
         P965TJbvjpO06AXAF09sj4/ndH4BlazdmrqjyJmmiCVaT6tvqujuKqoD0S25aCoBei/O
         zTaA==
X-Gm-Message-State: AO0yUKWrnW4sdttV0yUQDL6lPQ3uok1r/rS02s4zuMRT/YJLqe4HlzFS
        H6sEC5LtF6kvP5XiMQix85wW7aQHteltmaRJavh69E2svDTkK98Db1U=
X-Google-Smtp-Source: AK7set9auwWfF3wIN1q30rRtpdUmkonwyBMuaaRudbnZmPSKptNoCJ89EPkxhe1jBNWNXlbDVVv0W0QLvsyRWKtr9wg=
X-Received: by 2002:a05:6902:1205:b0:a09:314f:9f09 with SMTP id
 s5-20020a056902120500b00a09314f9f09mr3766092ybu.6.1677611159575; Tue, 28 Feb
 2023 11:05:59 -0800 (PST)
MIME-Version: 1.0
From:   James Addison <jay@jp-hosting.net>
Date:   Tue, 28 Feb 2023 19:05:48 +0000
Message-ID: <CALDQ5Ny1mbcUSk8pDL6HEq0Cgqze1tidyOeAgVxc5tyZNb+P_g@mail.gmail.com>
Subject: [PATCH RESEND] Documentation: update kernel parameter limit notes
To:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     corbet@lwn.net, Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There does appear to be a limit on the number of parameters accepted by the
kernel at boot-time, so this changeset updates the kernel-parameters.rst
documentation to reflect that.

Signed-off-by: James Addison <jay@jp-hosting.net>
---
 Documentation/admin-guide/kernel-parameters.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.rst
b/Documentation/admin-guide/kernel-parameters.rst
index 19600c502..a3a099127 100644
--- a/Documentation/admin-guide/kernel-parameters.rst
+++ b/Documentation/admin-guide/kernel-parameters.rst
@@ -203,7 +203,8 @@ be entered as an environment variable, whereas its
absence indicates that
 it will appear as a kernel argument readable via /proc/cmdline by programs
 running once the system is up.

-The number of kernel parameters is not limited, but the length of the
+The number of kernel parameters is limited to 32 by default (128 in User Mode
+Linux), and is defined in ./init/main.c as MAX_INIT_ARGS. The length of the
 complete command line (parameters including spaces etc.) is limited to
 a fixed number of characters. This limit depends on the architecture
 and is between 256 and 4096 characters. It is defined in the file

base-commit: e492250d5252635b6c97d52eddf2792ec26f1ec1
-- 
2.39.2

Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 25C837D08A
	for <lwn-linux-doc@archive.lwn.net>; Sat, 29 Dec 2018 21:00:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbeL2VAW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 29 Dec 2018 16:00:22 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:40450 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726643AbeL2VAW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 29 Dec 2018 16:00:22 -0500
Received: by mail-qk1-f193.google.com with SMTP id y16so14183742qki.7
        for <linux-doc@vger.kernel.org>; Sat, 29 Dec 2018 13:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=geciauskas-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=Nbvt2JbNrBkjyHvWPTN7JE8gLjEXoIKmEBiZDXg+0Ps=;
        b=WxXIaUVh6l7Z75gL0hc3soJCyp7//COEF0rQ7UtJb+r05Hf0i6JVE/CFFCc4lNak1N
         uJe7A//ZIJrRK3NRjU7ovGLzzuS7WxxNbylICoZ4n2gd6d8yi6AfA5tdOFn4hslr7wNl
         B0Rir58cWnn9L+OSmGhc9SgjcFDHqGkAZXNTXTetarhMjhhaN1lrefrps95mvRwpiVC9
         FVI7AJT8qj8gzzfC4LgRBz0QDYlZ/ru/37YnBkyBT6AIBVir8uHkjpQ21zh2Zf+NO3hm
         U4eXBHkBmr5JHwVbwzXUQOuHwPoCucamlVpFOguAXgwWGEyqqCzce6wa1Cb6uzrVWrVk
         9sGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Nbvt2JbNrBkjyHvWPTN7JE8gLjEXoIKmEBiZDXg+0Ps=;
        b=qC8TqtXAxvZ5kgfzZP1yFOg3ycezt7/VxuO73cOI35jV4l01cPqzdkABBv2HKW6loX
         NVnWoMywVYLu168ApzffiKAxTtxQcy1QGbpp8/1vcU2MSVTAH3a8bPrUB+phdp89qSlq
         42lZRjsHNRWDV6o9I5gtLzmFv7NTb8lg1+oD6z3VfJtYbnO/5mvlfqIOWcJf47N4tB+1
         7AZ75NzQlz0qMHrkfSywCTI+rvF9AAvREEkmRBS4sKDWTZ05dWheuUR0awFe1QVeVZ9G
         oatoBZyOlhPXOBAPGR3z28r7SNN+4Vk6DulYgJyLImj9ZgLOdwLKyqtiEeJLpdPfGRhS
         VuIA==
X-Gm-Message-State: AJcUuke0S4121UsWqf4sgOFUYTObZ3FzTlg/tzp9H5FTZoPf0M1FQTgo
        0Fn9C1moAnTchSH5ayk59+23hLXgxGY=
X-Google-Smtp-Source: ALg8bN7q7hvuqcexZNqX8k3jJvodpoE2Fj3lmWpPG8d2KSN8pBKO67nvXMaB0cF8w4QPRwzVmtv4Aw==
X-Received: by 2002:a37:b201:: with SMTP id b1mr28367573qkf.306.1546117221346;
        Sat, 29 Dec 2018 13:00:21 -0800 (PST)
Received: from triton ([2601:18d:8800:7790:9deb:c7c:226:32fc])
        by smtp.gmail.com with ESMTPSA id q184sm15798326qkb.23.2018.12.29.13.00.20
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sat, 29 Dec 2018 13:00:20 -0800 (PST)
From:   Ramunas Geciauskas <kernel@geciauskas.com>
To:     corbet@lwn.net, linux-doc@vger.kernel.org
Cc:     Ramunas Geciauskas <kernel@geciauskas.com>
Subject: [PATCH] Documentation/admin-guide: update URL of LKML information link
Date:   Sat, 29 Dec 2018 16:00:00 -0500
Message-Id: <20181229210000.1132-1-kernel@geciauskas.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Information regarding linux-kernel mailing list is no longer hosted on tux.org
Update the link to point to the one available at kernel.org

Signed-off-by: Ramunas Geciauskas <kernel@geciauskas.com>
---
 Documentation/admin-guide/reporting-bugs.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/reporting-bugs.rst b/Documentation/admin-guide/reporting-bugs.rst
index 4650edb8840a..49ac8dc3594d 100644
--- a/Documentation/admin-guide/reporting-bugs.rst
+++ b/Documentation/admin-guide/reporting-bugs.rst
@@ -67,7 +67,7 @@ If you can't figure out which subsystem caused the issue, you should file
 a bug in kernel.org bugzilla and send email to
 linux-kernel@vger.kernel.org, referencing the bugzilla URL.  (For more
 information on the linux-kernel mailing list see
-http://www.tux.org/lkml/).
+http://vger.kernel.org/lkml/).
 
 
 Tips for reporting bugs
-- 
2.11.0


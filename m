Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 067277D90D
	for <lwn-linux-doc@archive.lwn.net>; Fri, 26 Jul 2019 16:27:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728816AbfGZQ1t (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 26 Jul 2019 12:27:49 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:36143 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727554AbfGZQ1t (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Jul 2019 12:27:49 -0400
Received: by mail-qt1-f193.google.com with SMTP id z4so53210519qtc.3
        for <linux-doc@vger.kernel.org>; Fri, 26 Jul 2019 09:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=+flrQWy2KGFI4SxCaeB54nPAr/NqfEOeifyj08nzCzk=;
        b=eWcpH7e1rxiO1zNcJrSgc0LDNIpJJD4vA7AV92db7hvo6LORnzmYF55ACc2j2kfTTY
         8kx7bgIc3lSch4Rlim9ZD7E/IZDrnCgUKYctFYOqDFP5z58H8j43HJq5+yT0CYCiohZd
         4JPjmG+u5raoIJWfTJHioVoSayMv4XMvK7bxUGukvC9n2R5rHSS+lAuIN586a5lrYY6r
         AFur9CJl9RxeMYpFUNQdn8tQnDfTn9eDgBs1Xd83hRJd8OGU70fHY/FFR7G/JGfZkPfH
         t529zT5TCo6iV7dVHkfCkUR84Mm2Os17weeJPLv96wELjDLnbHEFZIMKfdBeaNvyH4L6
         jduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=+flrQWy2KGFI4SxCaeB54nPAr/NqfEOeifyj08nzCzk=;
        b=HKW+ZPX9tRN+xmLecaBdH+rq6mKxc5S392ymC54Iqmvpj0HjXrZhjo/5jqyWlESPsD
         Ko/Ov/0Ayah4ZbviNdqrpAiWtKeISlluYXfBw1WcVGNQfZ87YL2PGVmrkppdVlEZIIqS
         Y2X+LS9LrX8NmMNyQERbV2FLtVfKjuYhXL3xg+76a/z3qdsClyPhuP9bhGY1eJyi01IK
         IjmcEV8cVBPwRU+dq1ON4TstTHbv3YY691o96NcUCiAZgOBCYpe8h/Qf8E6310L4Eded
         4i0GBOZ+MIdF5kZ8UsS/14q+3cZDIFoXOGnZ3dc5b0i9VZdTpjroJhRaUU7tETTgbmxU
         oYDA==
X-Gm-Message-State: APjAAAW6cNGvfYlAOZnMTO97jP/3xQg5rTABjz/1Cx6IqcEHXoCSoyUe
        OqF6IkRkyPpcMPYdwc41RY4=
X-Google-Smtp-Source: APXvYqxxSq3yFpUsIVtVmbPCTNrVFeqA6RgXjw6FgxWJUaB/MTX+FVyDZBHEpo9wDmAsoeE/9z6tRQ==
X-Received: by 2002:a0c:afeb:: with SMTP id t40mr67376764qvc.28.1564158468381;
        Fri, 26 Jul 2019 09:27:48 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:22a:18a2:7b63:4439:1287])
        by smtp.gmail.com with ESMTPSA id 6sm25805086qkp.82.2019.07.26.09.27.46
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 09:27:47 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     corbet@lwn.net
Cc:     mchehab+samsung@kernel.org, linux-doc@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] docs: admin-guide: Adjust title underline length
Date:   Fri, 26 Jul 2019 13:27:54 -0300
Message-Id: <20190726162754.5341-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The following warning is seen when building 'make htmldocs':

Documentation/admin-guide/sysctl/kernel.rst:397: WARNING: Title underline too short.

Fix it by adjusting the title underline length appropriately.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 Documentation/admin-guide/sysctl/kernel.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index 2e36620ec1e4..8af424dd0364 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -394,7 +394,7 @@ This file shows up if CONFIG_DETECT_HUNG_TASK is enabled.
 
 
 hung_task_interval_warnings:
-===================
+============================
 
 The same as hung_task_warnings, but set the number of interval
 warnings to be issued about detected hung tasks during check
-- 
2.17.1


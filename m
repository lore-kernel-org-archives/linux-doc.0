Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FSL_HELO_FAKE,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 704127D90D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 14 Oct 2019 11:00:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731676AbfJNLAR (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 14 Oct 2019 07:00:17 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:43631 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731503AbfJNLAR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Oct 2019 07:00:17 -0400
Received: by mail-pf1-f193.google.com with SMTP id a2so10188761pfo.10
        for <linux-doc@vger.kernel.org>; Mon, 14 Oct 2019 04:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=roe1CpFLkTcfs32fZAZpd1QcNOQgIY0DvYHb9nRUS68=;
        b=nA1AgfnHwbmrIJRx8cUGaiegFnrTQeGfnQ3V6g2WGJwbHNacCXMruS7Eh01Jf2keVv
         48N72od5O5+UO7DianRK5LYKNxDUMxkxlwkNBArPwqGjeqE5tTAH736GCurQT3CEq23t
         BrM9zsLzepBkXWedFcai68YIt6A35thmMSdIgI7xQlLuJLsI0Tpl7/Sv1CW/zv+i6B41
         8Z02998mEaKdkf2kgXcFmDDlYfkYqm9j2fXnuTjMy+dVgh/S3rFWRYl/pTUfcBgpWT+U
         GrD8b17U7HlXjXPU0mnT/X4DsnBjX9TdSS7vntKB/8RAW192l8isJ8GW5uxlOHyz9kcI
         dOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=roe1CpFLkTcfs32fZAZpd1QcNOQgIY0DvYHb9nRUS68=;
        b=cx2YOunJnONYt84k0oTUUqmB3zsI7s5xgxbpu+sEvjgg8mj511u1OFxPhrOkYGvF98
         VOFI1PfV6ephj9Bcn59ibUK0WgSutwJGWDvLK0+6nTvjBYiYo7nhQf59JVWn6pSvwp3I
         vbbM30VWBYO+zvMMpD3q/sGDvXPkxcIJP5Efg7XdHNhPjP8vZJLs1FSJHjlNEH9gbTGJ
         NiHXZtz2eknMq4RucQhvyBU3DXUH9+AC18KQc928MqsSM9yxdcmXDRsfvbkaC5moWjux
         un2wvxFMQIdYpITtHs4u0TSPBS0UjrIhEyybt4TZ5naLwC4JHM+vYnjbEfn6qxLLMxod
         PpfQ==
X-Gm-Message-State: APjAAAXfn/Ihtfzjrl0/6/yreZzNVW7wowmeVJknn02Xev2cmhN9zkbx
        wsq2GrZ39KeLP8Lj68/edA0V0yLyt9lt9Q==
X-Google-Smtp-Source: APXvYqyH5I+Y2IVKZoVwKIlJBKJCMm5YE419GKAD5fbEsLT7gtEqZQOmAkOB1ChKASlJKB7mNcmXng==
X-Received: by 2002:a62:1454:: with SMTP id 81mr33013086pfu.214.1571050816786;
        Mon, 14 Oct 2019 04:00:16 -0700 (PDT)
Received: from gmail.com (ip-103-85-37-165.syd.xi.com.au. [103.85.37.165])
        by smtp.gmail.com with ESMTPSA id z3sm19199398pjd.25.2019.10.14.04.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 04:00:16 -0700 (PDT)
Date:   Mon, 14 Oct 2019 22:00:08 +1100
From:   Adam Zerella <adam.zerella@gmail.com>
Cc:     corbet@lwn.net, gor@linux.ibm.com, akpm@linux-foundation.org,
        linux-doc@vger.kernel.org, adam.zerella@gmail.com
Subject: [PATCH] docs: admin-guide: Extend short title underline in sysctl
Message-ID: <20191014110008.GA3814@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Title underlines should extend the full length of a title,
Sphinx is currently displaying the following warning when
building the htmldocs:

sysctl/kernel.rst:397: WARNING: Title underline too short.

hung_task_interval_warnings:
===================

Signed-off-by: Adam Zerella <adam.zerella@gmail.com>
---
 Documentation/admin-guide/sysctl/kernel.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index 614179dc79a9..383eda89f411 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -394,7 +394,7 @@ This file shows up if CONFIG_DETECT_HUNG_TASK is enabled.
 
 
 hung_task_interval_warnings:
-===================
+============================
 
 The same as hung_task_warnings, but set the number of interval
 warnings to be issued about detected hung tasks during check
-- 
2.21.0


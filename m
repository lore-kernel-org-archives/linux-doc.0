Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,SPOOFED_FREEMAIL autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9BA047D2F0
	for <lwn-linux-doc@archive.lwn.net>; Sun, 15 Sep 2019 08:28:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725951AbfIOI2B (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 15 Sep 2019 04:28:01 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:33284 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbfIOI2B (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 15 Sep 2019 04:28:01 -0400
Received: by mail-pg1-f193.google.com with SMTP id n190so17578157pgn.0
        for <linux-doc@vger.kernel.org>; Sun, 15 Sep 2019 01:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JpNS31nsmsqFBqnf+qh3e5Ku6+2UQD4hUdN6Gd34CgU=;
        b=MZ8bCKDJWqG+mVVG+moRMLqUdGxiRKizy/2yVPSpS4ZmItmIsm2Zy3ZvqqKGKbAgpK
         2zMkCFO7OcsFLqjo1ZQTcOMi+qtzFdAktZLsTLEt1Gmt/urlZeQlhaWWthEIeRONhe3J
         gulWgyoUuqdu4kudqaFVcdkmR4y84uYPuYYFs5c84+fwia8h4h1DdcipBZl0molt1Z6Y
         vTBnfumO/OqycAmdw00sQHE52C5XPQTVCbsjKclFqLpw0/1hijZLGOxgzslRY527iveb
         VFgSIgrMDgGjK/DnRt4K+w+6zq9Cmxzk2eEYCv8mFwTEmSOP7UBoJ+GOvQTuVa84Wykd
         Wlsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JpNS31nsmsqFBqnf+qh3e5Ku6+2UQD4hUdN6Gd34CgU=;
        b=RtDC7ipmlHZ/nj9W1K91XrA8pYshqUiovaKcMfYMSskriNZEp1Eu9qIG/x8AjcumpB
         c2h4b1w/7gZ5e3WVZny64RLtRj1F8Xw6fML8Ow5Iw2CRIu8TkGdeTQ0zOKO3WIVlf/6P
         +/M4ORz2GuY6q6AksoG21Pj6/WI1Rmiix5plt3jWNZjdwaJfurl8ApRUS6fhzHxVpil5
         BY7PlxFMTEr+EMlcVYlkHh+yKl9ETduH73I4VXgnYdv1gb1A7laIPaHcxC7ABifmo9aY
         beMqbm2vxQEufNi1JnhR53DYuwhYHFqZU4jWjxy7GFh5i3Lkcgim+4f4VvWryiJVeOzd
         x4bA==
X-Gm-Message-State: APjAAAVKZJG8I+tAV4gBGCAX1Os6CMAULxTQwNFfMhtCOq7g7sXhO/tY
        KKdWVMmu9CJP+B25BfZqMTA=
X-Google-Smtp-Source: APXvYqzCNzMEa8Oc1WnB7sabiqMURsZqIwN4TBOe5pj6HgunAezueYGIzoe68XHuggUcIYqh8r5y9w==
X-Received: by 2002:a62:7d54:: with SMTP id y81mr5524639pfc.86.1568536079888;
        Sun, 15 Sep 2019 01:27:59 -0700 (PDT)
Received: from localhost.localdomain (ip-103-85-37-119.syd.xi.com.au. [103.85.37.119])
        by smtp.gmail.com with ESMTPSA id k31sm7816547pjb.14.2019.09.15.01.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2019 01:27:59 -0700 (PDT)
From:   Adam Zerella <adam.zerella@gmail.com>
Cc:     corbet@lwn.net, jdelvare@suse.com, linux-doc@vger.kernel.org,
        Adam Zerella <adam.zerella@gmail.com>
Subject: [PATCH] docs: hwmon: Suppress Sphinx warning
Date:   Sun, 15 Sep 2019 18:27:18 +1000
Message-Id: <20190915082718.3590-1-adam.zerella@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When generating documentation output Sphinx
outputs a warning for not including
the page 'inspur-ipsps1.rst' in 'index.rst'.
Assuming this documentation is useful it
should be included in the index

Signed-off-by: Adam Zerella <adam.zerella@gmail.com>
---
 Documentation/hwmon/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 8147c3f218bf..230ad59b462b 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -7,6 +7,7 @@ Linux Hardware Monitoring
 
    hwmon-kernel-api
    pmbus-core
+   inspur-ipsps1
    submitting-patches
    sysfs-interface
    userspace-tools
-- 
2.21.0


Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 101B67DE78
	for <lwn-linux-doc@archive.lwn.net>; Fri, 13 Apr 2018 17:44:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751021AbeDMRoT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 13 Apr 2018 13:44:19 -0400
Received: from mail-ot0-f201.google.com ([74.125.82.201]:44446 "EHLO
        mail-ot0-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751775AbeDMRnM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Apr 2018 13:43:12 -0400
Received: by mail-ot0-f201.google.com with SMTP id z39-v6so5504413ota.11
        for <linux-doc@vger.kernel.org>; Fri, 13 Apr 2018 10:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:date:in-reply-to:message-id:references:subject:from:to
         :cc;
        bh=hKxJhawwzbYRxsHsQcSrUslS6fC9ujgoX5pHxaifmXA=;
        b=qx+gg0g0sw+6VGNH53p2chQTtTfY/kJ/VSSZbq5sGtAw10hZG5lfUQOUVPs+TPBp2h
         B7S1eN/HsaHyb9GnDaDkU+mqsbbmSdl1ETKLA6uRxdgWdALE6jd0PCz6yuXVH6WcMQbi
         UwAJZUw5Fug9JQOn+IwuDvkwFBCo7u1frCk91j8HhCdjlkZDx0xcgPzA6PXpqcTEIU40
         KOswMmymBSg2CcB2LEQBThVosyVNTNG+PDajPlQWXEPGGbaldo3Qj7OsUSicX/ZWLCZI
         AKfLCqMbtddbnmZvXJ8b9PedlhjPoGWepYRZCROrzRRCEfjPXBrd1Wgp7aBxaXn8ObmR
         ZmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id
         :references:subject:from:to:cc;
        bh=hKxJhawwzbYRxsHsQcSrUslS6fC9ujgoX5pHxaifmXA=;
        b=lFmoVntHKOIR8mzb/l+CQLMOvs4KSckf+gkBd5YDl6mHt3CxktV71IM8FPGam/ptyO
         5TrgJFoKTBWr7wN//4gNBr103ECvzMbAwbWSAgIsg0r8632dopioq2NwgcZZQLTHuUhr
         rb7v3ZyMvj+V5yd9PamSxv6bJfw0vwgNqVgQyXwWTXhlp/RqipEeC1UbGp2jGS9OICdq
         quCk8oB5i4M4Asb3tirtG2vpyePGugx1TOPpc6sS2wq2E7s4N4MvCfnY6Mx6/Z8Wv/Fc
         yfRW8jD8a6X5ntSe01OFCR2i4v3uoTLNeKVmJ9FOlfATFhhrg1c6eQddj7Ic3mbzF62V
         PbuQ==
X-Gm-Message-State: ALQs6tBzPruRCXDnEZ8dSwacEmwlhmoMvX8BEwOg+/dA7fec2paZLcy5
        TEC65IVuaL8zvdrXvBkDanQ0215/HCIU
X-Google-Smtp-Source: AIpwx48txAh4PDZtm9qwqIDsxAUPXWGBPTqZy5bvbyr51YV+ZWxkouD9EdCgw/342lDF+o99ZzEsaMlAeu3v
MIME-Version: 1.0
X-Received: by 2002:a9d:1a1a:: with SMTP id a26-v6mr2742424ote.117.1523641392060;
 Fri, 13 Apr 2018 10:43:12 -0700 (PDT)
Date:   Fri, 13 Apr 2018 10:42:56 -0700
In-Reply-To: <20180413174257.139182-1-hansens@google.com>
Message-Id: <20180413174257.139182-2-hansens@google.com>
References: <20180413174257.139182-1-hansens@google.com>
X-Mailer: git-send-email 2.17.0.484.g0c8726318c-goog
Subject: [PATCH v3 2/3] Documentation/i2c: sync docs with current state of i2c-tools
From:   Sam Hansen <hansens@google.com>
To:     linux-i2c@vger.kernel.org, hansens@google.com, wsa@the-dreams.de,
        corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Sam Hansen <hansens@google.com>, wsa@the-dreams.de, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Currently, Documentation/i2c/dev-interface describes the use of
i2c_smbus_* helper routines as static inlined functions provided by
linux/i2c-dev.h.  Work has been done to refactor the linux/i2c-dev.h file
in the i2c-tools project out into its own library.  As a result, these
docs have become stale.

This patch corrects the discrepancy and directs the reader to the
i2c-tools project for more information.

Signed-off-by: Sam Hansen <hansens@google.com>
---
No changes from v2.

 Documentation/i2c/dev-interface | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/Documentation/i2c/dev-interface b/Documentation/i2c/dev-interface
index c8737d502791..f92ee1f59914 100644
--- a/Documentation/i2c/dev-interface
+++ b/Documentation/i2c/dev-interface
@@ -23,11 +23,6 @@ First, you need to include these two headers:
   #include <linux/i2c-dev.h>
   #include <i2c/smbus.h>
 
-(Please note that there are two files named "i2c-dev.h" out there. One is
-distributed with the Linux kernel and the other one is included in the
-source tree of i2c-tools. They used to be different in content but since 2012
-they're identical. You should use "linux/i2c-dev.h").
-
 Now, you have to decide which adapter you want to access. You should
 inspect /sys/class/i2c-dev/ or run "i2cdetect -l" to decide this.
 Adapter numbers are assigned somewhat dynamically, so you can not
@@ -140,8 +135,8 @@ ioctl(file, I2C_RDWR, struct i2c_rdwr_ioctl_data *msgset)
   set in each message, overriding the values set with the above ioctl's.
 
 ioctl(file, I2C_SMBUS, struct i2c_smbus_ioctl_data *args)
-  Not meant to be called  directly; instead, use the access functions
-  below.
+  If possible, use the provided i2c_smbus_* methods described below instead
+  of issuing direct ioctls.
 
 You can do plain i2c transactions by using read(2) and write(2) calls.
 You do not need to pass the address byte; instead, set it through
@@ -166,10 +161,9 @@ what happened. The 'write' transactions return 0 on success; the
 returns the number of values read. The block buffers need not be longer
 than 32 bytes.
 
-The above functions are all inline functions, that resolve to calls to
-the i2c_smbus_access function, that on its turn calls a specific ioctl
-with the data in a specific format. Read the source code if you
-want to know what happens behind the screens.
+The above functions are made available by linking against the libi2c library,
+which is provided by the i2c-tools project.  See:
+https://git.kernel.org/pub/scm/utils/i2c-tools/i2c-tools.git/.
 
 
 Implementation details
-- 
2.17.0.484.g0c8726318c-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

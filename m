Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E2A527E22E
	for <lwn-linux-doc@archive.lwn.net>; Fri, 13 Apr 2018 16:45:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752847AbeDMQo3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 13 Apr 2018 12:44:29 -0400
Received: from mail-vk0-f73.google.com ([209.85.213.73]:35585 "EHLO
        mail-vk0-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752775AbeDMQoZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Apr 2018 12:44:25 -0400
Received: by mail-vk0-f73.google.com with SMTP id q201so5759236vke.2
        for <linux-doc@vger.kernel.org>; Fri, 13 Apr 2018 09:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:date:in-reply-to:message-id:references:subject:from:to
         :cc;
        bh=/cQG5fMyjTKgaTF5o99Hyxb1ueFdyv6k9Tkoro1zbX0=;
        b=JIRKbEsSN+Ea8loxOWMXNNkHe4hCfn31yMKbFbfiLFYsNmQX1fPOFugaNzUe3kvpkz
         3/GYf7nNf8cSPPBeDLs5YipesnrUfQAk/30ZJ0zLWltN5Avpmsz7nykQ1q/SX7Y1H915
         luCPuDPeOzzsCCKHSTjUWKFsvFLcdW2Hlk9Ilu6VYPWCHpJWgU7sRsDeIJzJaHjWtCOp
         Q3H+wuoCda/MkN34hHadR+jlReLUcPmflvh6VOPp2uhcki3xJxyHYYQsJjS3yAd9OVfl
         7xgkumFCawW21sIxvkX8duLeX4tSvcnmadFNNmbkFeD80DATxtKjV9osSDC5vyLmqDOV
         9hzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id
         :references:subject:from:to:cc;
        bh=/cQG5fMyjTKgaTF5o99Hyxb1ueFdyv6k9Tkoro1zbX0=;
        b=QQibHSXkka85O2GBj4aVK7MM6vAj98xfUOYgqPBFXsIIHEEy+ygPTceVllEPxIU8Gw
         KqPJGGd1T0skxYeRqTMpIIeGgv8T2xTcuPDonVKj9qfDgQcQd16Lfi2FEGwRljyWjjRn
         2eVT7BhfmvyPNpsTxHRdO8U0SuqQv6yV+p8J+70lYb5+4cBNHridEzgZSNYDgwdw48Og
         92BN3g8ITnFk/BifFG1rC8ZjQb12Ghg9VTYW8NA956mEFMHCL3jHkYN6E05JzdSnXQco
         xHzvlHvZeqplal60i8nfDfMgc8aJnYZG7U83NvAdhn1TRXa4EZvaXHiC32xJHcnPYt5T
         6++A==
X-Gm-Message-State: ALQs6tD3+jc/2ukUVgAH0zd6mDr7K0dBWgEWh/JC/cRc9z2i4SQ8ahkc
        LxJYKhffMi3rgIT3DQ+vK9AfN5m5kGIk
X-Google-Smtp-Source: AIpwx4+Jh3DNCB357yZN44ys3aOxo4R4VjJnGXEBz40t1YG+Fo/kTBjtPgtf6pIRjm9AkZ1orLsPogEBQ9v+
MIME-Version: 1.0
X-Received: by 10.176.72.49 with SMTP id b46mr2728017uad.107.1523637864603;
 Fri, 13 Apr 2018 09:44:24 -0700 (PDT)
Date:   Fri, 13 Apr 2018 09:44:04 -0700
In-Reply-To: <20180413164405.127522-1-hansens@google.com>
Message-Id: <20180413164405.127522-2-hansens@google.com>
References: <CAP9bUy7rONNHYeRkYtaWHcfqoZcGKXJz-JocED26zBj9n+-ZbQ@mail.gmail.com>
 <20180413164405.127522-1-hansens@google.com>
X-Mailer: git-send-email 2.17.0.484.g0c8726318c-goog
Subject: [PATCH v2 2/3] Documentation/i2c: sync docs with current state of i2c-tools
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

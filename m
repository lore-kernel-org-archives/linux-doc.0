Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4789A7E88A
	for <lwn-linux-doc@archive.lwn.net>; Fri, 13 Apr 2018 17:43:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751154AbeDMRnN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 13 Apr 2018 13:43:13 -0400
Received: from mail-ua0-f202.google.com ([209.85.217.202]:41936 "EHLO
        mail-ua0-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751134AbeDMRnK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Apr 2018 13:43:10 -0400
Received: by mail-ua0-f202.google.com with SMTP id y14so5686233uai.8
        for <linux-doc@vger.kernel.org>; Fri, 13 Apr 2018 10:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:date:message-id:subject:from:to:cc;
        bh=ldP8NVqp9BpXTCa05n0IGO12AWxt7OcdLd1QP+R/kZo=;
        b=jHhqsaf3wK8zyTtuRv9AfY0Csr/nZE4p3G9HkJd+ibeIKsyRd2aPdUF2FmzO6tYEww
         G/1t0uSsnfxdjS/Eo2aNJch4rkSCV4lnFEpUVh2zWQr9+pNBe8Fco11eVjQYXoHwMpc4
         2YCJnRu/+hjbBva1mLI/DX4HD8sq5p4fUo8RuywcZIAsxB5zjywUiPg+k5kxE3FzZCJo
         VDfEcsNBFxDqNsPTV0tUMCKVnqUA5q4G+GuvzyY4XvDd7vTcgG5f7+pZH9rZ3mCFa7o3
         dPOnuOeTWxKER4q1w6M6dmn89y4i+yKGjbJjWF6L2e+IWTsh+hq9nwJ19/4nEM/1VvWz
         KoQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to:cc;
        bh=ldP8NVqp9BpXTCa05n0IGO12AWxt7OcdLd1QP+R/kZo=;
        b=Erra5r5+KBmmNhX5T+7p01zfRB6zNZLmwAiQ3T33HG9d+//cRIYmvOiSDhccoOEqwg
         zroSm2K4HwaR4DZyOioQxeU4KarsDIU+jNDF6ojDhzdi7BK3L1BHP9AYtnjH5NY3P/Qh
         oJXeYhjyFeqVL7M2BWeEWxtMS9I9dSSVGAnuyHAAsnqSPGY94GmweldDyVIsZ2Bxsai4
         I/7pNz6pm+xhaNSDl6AI2Pc6WlM1AcbPqg6NU6dw3Ny20uXWIYjJzRS9/DG4St9tL019
         4QfS9Pgbh+0FPa9mrqSxVSYTZzZPefHmSj4DwPWW1oK+wN3kSTOtPc9jP0BiSVSQkKji
         GuxA==
X-Gm-Message-State: ALQs6tAr9JPJjeyHvLz4/KHN3OYsuVeDTMtYGtWerl4+eGGx0oCb+0LW
        qkl0ibamY5brYP0a12MG7GAhsB6wQRpA
X-Google-Smtp-Source: AIpwx493ipXFMAk1ggwcQ3qirGRwP04qEf1M7hnD1M/d6qwIdAR0Fp5zhBpynLCKA0HatUC+VmTf22rVseM8
MIME-Version: 1.0
X-Received: by 10.31.238.70 with SMTP id m67mr3085233vkh.82.1523641389694;
 Fri, 13 Apr 2018 10:43:09 -0700 (PDT)
Date:   Fri, 13 Apr 2018 10:42:55 -0700
Message-Id: <20180413174257.139182-1-hansens@google.com>
X-Mailer: git-send-email 2.17.0.484.g0c8726318c-goog
Subject: [PATCH v3 1/3] Documentation/i2c: whitespace cleanup
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

This strips trailing whitespace in Documentation/i2c/dev-interface.

Signed-off-by: Sam Hansen <hansens@google.com>
---
No changes from v2.

 Documentation/i2c/dev-interface | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/i2c/dev-interface b/Documentation/i2c/dev-interface
index d04e6e4964ee..c8737d502791 100644
--- a/Documentation/i2c/dev-interface
+++ b/Documentation/i2c/dev-interface
@@ -9,8 +9,8 @@ i2c adapters present on your system at a given time. i2cdetect is part of
 the i2c-tools package.
 
 I2C device files are character device files with major device number 89
-and a minor device number corresponding to the number assigned as 
-explained above. They should be called "i2c-%d" (i2c-0, i2c-1, ..., 
+and a minor device number corresponding to the number assigned as
+explained above. They should be called "i2c-%d" (i2c-0, i2c-1, ...,
 i2c-10, ...). All 256 minor device numbers are reserved for i2c.
 
 
@@ -38,7 +38,7 @@ Next thing, open the device file, as follows:
   int file;
   int adapter_nr = 2; /* probably dynamically determined */
   char filename[20];
-  
+
   snprintf(filename, 19, "/dev/i2c-%d", adapter_nr);
   file = open(filename, O_RDWR);
   if (file < 0) {
@@ -72,7 +72,7 @@ the device supports them. Both are illustrated below.
     /* res contains the read word */
   }
 
-  /* Using I2C Write, equivalent of 
+  /* Using I2C Write, equivalent of
      i2c_smbus_write_word_data(file, reg, 0x6543) */
   buf[0] = reg;
   buf[1] = 0x43;
@@ -147,7 +147,7 @@ You can do plain i2c transactions by using read(2) and write(2) calls.
 You do not need to pass the address byte; instead, set it through
 ioctl I2C_SLAVE before you try to access the device.
 
-You can do SMBus level transactions (see documentation file smbus-protocol 
+You can do SMBus level transactions (see documentation file smbus-protocol
 for details) through the following functions:
   __s32 i2c_smbus_write_quick(int file, __u8 value);
   __s32 i2c_smbus_read_byte(int file);
@@ -158,7 +158,7 @@ for details) through the following functions:
   __s32 i2c_smbus_write_word_data(int file, __u8 command, __u16 value);
   __s32 i2c_smbus_process_call(int file, __u8 command, __u16 value);
   __s32 i2c_smbus_read_block_data(int file, __u8 command, __u8 *values);
-  __s32 i2c_smbus_write_block_data(int file, __u8 command, __u8 length, 
+  __s32 i2c_smbus_write_block_data(int file, __u8 command, __u8 length,
                                    __u8 *values);
 All these transactions return -1 on failure; you can read errno to see
 what happened. The 'write' transactions return 0 on success; the
-- 
2.17.0.484.g0c8726318c-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

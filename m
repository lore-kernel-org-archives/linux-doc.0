Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4DCD57E22E
	for <lwn-linux-doc@archive.lwn.net>; Fri, 13 Apr 2018 16:45:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752015AbeDMQpb (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 13 Apr 2018 12:45:31 -0400
Received: from mail-it0-f74.google.com ([209.85.214.74]:41948 "EHLO
        mail-it0-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752815AbeDMQo2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Apr 2018 12:44:28 -0400
Received: by mail-it0-f74.google.com with SMTP id r124-v6so2772468itb.6
        for <linux-doc@vger.kernel.org>; Fri, 13 Apr 2018 09:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:date:in-reply-to:message-id:references:subject:from:to
         :cc;
        bh=iW/lEm1r6sXfbnmPOMlS69wSqyrir3KZl+bSQnz9Axw=;
        b=HmOUR326ol3V7O2Qf7iRzrnAIqcO2Fdc8xyVmtCg/F9hjKnibIvnAwgL/TYph4vDz1
         5qEIyv1IGeTvMktoKHxSm1EPaZ+qyO6lGeCzq7/JVAAIlHMfzKh+nNWTqyurml1dmGsa
         ea519Ps2D9KCnZLjYD23psVKNzr0N82jyfc94T4TGK92LyqslsvRanjenubLbcj2yce7
         gg4b0PqW4YfbG9AzRqUM+BIXBF4hdwNXSNk8Hf1nfL6EXTWF8jGMG/MA/bvMf9Df1cZC
         /VqKaup8Rj38lJfHTdbKq8X0dmUXvnKzkGnXdkoMHYZGLxuKkbw4Yf6adR5ihQGaK2We
         zJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id
         :references:subject:from:to:cc;
        bh=iW/lEm1r6sXfbnmPOMlS69wSqyrir3KZl+bSQnz9Axw=;
        b=DziSq5xzimeYtjFr79DN47mbZd1HvHptcDnz5UMAeLk0O6dBHl+WUIj0J/M22pHx1B
         CaZdI2/5RHHShIryXLzsi3LN0BP9JoPK5mOEckJcziqgj6HqflDbJAmCsn90PbluRAGP
         S1+cCYC1QkfNO8V8s1V0YT1BgSSsKUx/CyovJiSykK/gx7J2yMYgKVDMwliuqte8vnJm
         h8cYGyxwqLnNyxkZUf1wBVT2UAGLJAYRf2mvPWzlze/j/mrEouQbHT7g5D/L/eXdNb3v
         HmT73bktP2wl//1YKmYRukP8exnufrVoC9ijX3QPJhEAoysfTjpTiYAFMhO6z9bxe+Jr
         N+Vg==
X-Gm-Message-State: ALQs6tAs+FaVmePZ6d/EmN8rIpX6mw4t9mrGVJgwSO4BxP3Qrd9oL7mS
        6XTX09dSGFtv3Xrt0VnukDVv8H/crRwf
X-Google-Smtp-Source: AIpwx49tk00eZ2U0SMSgkPfTd7wF76U9r2SYGH8ZomcUM+wKAazadZC+DUCZaot48nGURNOhsfLmjqEeMfMb
MIME-Version: 1.0
X-Received: by 2002:a24:6e4e:: with SMTP id w75-v6mr3017386itc.46.1523637868202;
 Fri, 13 Apr 2018 09:44:28 -0700 (PDT)
Date:   Fri, 13 Apr 2018 09:44:05 -0700
In-Reply-To: <20180413164405.127522-1-hansens@google.com>
Message-Id: <20180413164405.127522-3-hansens@google.com>
References: <CAP9bUy7rONNHYeRkYtaWHcfqoZcGKXJz-JocED26zBj9n+-ZbQ@mail.gmail.com>
 <20180413164405.127522-1-hansens@google.com>
X-Mailer: git-send-email 2.17.0.484.g0c8726318c-goog
Subject: [PATCH v2 3/3] Documentation/i2c: adopt kernel commenting style in examples
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

The example I2C code is rewritten to adopt the preferred kernel block
commenting style.

Signed-off-by: Sam Hansen <hansens@google.com>
---
 Documentation/i2c/dev-interface | 57 +++++++++++++++++++++++++--------
 1 file changed, 43 insertions(+), 14 deletions(-)

diff --git a/Documentation/i2c/dev-interface b/Documentation/i2c/dev-interface
index f92ee1f59914..e17f5814c199 100644
--- a/Documentation/i2c/dev-interface
+++ b/Documentation/i2c/dev-interface
@@ -30,24 +30,34 @@ assume much about them. They can even change from one boot to the next.
 
 Next thing, open the device file, as follows:
 
+  /*
+   * The adapter is probably dynamically determined.
+   */
   int file;
-  int adapter_nr = 2; /* probably dynamically determined */
+  int adapter_nr = 2;
   char filename[20];
 
   snprintf(filename, 19, "/dev/i2c-%d", adapter_nr);
   file = open(filename, O_RDWR);
   if (file < 0) {
-    /* ERROR HANDLING; you can check errno to see what went wrong */
+    /*
+     * ERROR HANDLING; you can check errno to see what went wrong.
+     */
     exit(1);
   }
 
 When you have opened the device, you must specify with what device
 address you want to communicate:
 
-  int addr = 0x40; /* The I2C address */
+  /*
+   * The I2C address.
+   */
+  int addr = 0x40;
 
   if (ioctl(file, I2C_SLAVE, addr) < 0) {
-    /* ERROR HANDLING; you can check errno to see what went wrong */
+    /*
+     * ERROR HANDLING; you can check errno to see what went wrong.
+     */
     exit(1);
   }
 
@@ -55,32 +65,51 @@ Well, you are all set up now. You can now use SMBus commands or plain
 I2C to communicate with your device. SMBus commands are preferred if
 the device supports them. Both are illustrated below.
 
-  __u8 reg = 0x10; /* Device register to access */
+  /*
+   * The device register to access.
+   */
+  __u8 reg = 0x10;
   __s32 res;
   char buf[10];
 
-  /* Using SMBus commands */
+  /*
+   * Using SMBus commands.
+   */
   res = i2c_smbus_read_word_data(file, reg);
   if (res < 0) {
-    /* ERROR HANDLING: i2c transaction failed */
+    /*
+     * ERROR HANDLING: i2c transaction failed.
+     */
   } else {
-    /* res contains the read word */
+    /*
+     * res contains the read word.
+     */
   }
 
-  /* Using I2C Write, equivalent of
-     i2c_smbus_write_word_data(file, reg, 0x6543) */
+  /*
+   * Using I2C Write, equivalent of
+   * i2c_smbus_write_word_data(file, reg, 0x6543).
+   */
   buf[0] = reg;
   buf[1] = 0x43;
   buf[2] = 0x65;
   if (write(file, buf, 3) != 3) {
-    /* ERROR HANDLING: i2c transaction failed */
+    /*
+     * ERROR HANDLING: i2c transaction failed.
+     */
   }
 
-  /* Using I2C Read, equivalent of i2c_smbus_read_byte(file) */
+  /*
+   * Using I2C Read, equivalent of i2c_smbus_read_byte(file).
+   */
   if (read(file, buf, 1) != 1) {
-    /* ERROR HANDLING: i2c transaction failed */
+    /*
+     * ERROR HANDLING: i2c transaction failed.
+     */
   } else {
-    /* buf[0] contains the read byte */
+    /*
+     * buf[0] contains the read byte.
+     */
   }
 
 Note that only a subset of the I2C and SMBus protocols can be achieved by
-- 
2.17.0.484.g0c8726318c-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

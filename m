Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EE8337DE78
	for <lwn-linux-doc@archive.lwn.net>; Fri, 13 Apr 2018 17:43:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751947AbeDMRnS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 13 Apr 2018 13:43:18 -0400
Received: from mail-qt0-f202.google.com ([209.85.216.202]:35404 "EHLO
        mail-qt0-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751208AbeDMRnP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Apr 2018 13:43:15 -0400
Received: by mail-qt0-f202.google.com with SMTP id u9so5976580qtg.2
        for <linux-doc@vger.kernel.org>; Fri, 13 Apr 2018 10:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:date:in-reply-to:message-id:references:subject:from:to
         :cc;
        bh=E8A8S1Fj8tNBzcqBi+4nvoxoD13j0/diG2uBJuzM7H4=;
        b=RmLJnspQGy14k+Z4tluHA5IUnaVtwAWPMTTPP1SzOKArxn83kKTea1DTSnK9LzT0DO
         n4wZTlCsWrIrSOl6w54lDMT+G0KpZKka4wPn+0n1UBRRcSEtGsARaI6973Eskrugq5eJ
         kSr0qvmYLMPwoIbefBs2KUybReLg1YjP7kp8Sfv6m6aiIwP7o24+aWf18hx3CG54/g1e
         iA7d4QcysZcGJ+n9ryirigysp3FGHj0x53Q8fuJ9pb5Ll4mTrUDgkwFNwaf6tLNZ7h9F
         IiK180NENsBIyb/P7FdfRQ9Jue9zbMwWrVzVv2zVtrFlCLb52Suq/VjpXK2NJ2RHNaIN
         /gYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id
         :references:subject:from:to:cc;
        bh=E8A8S1Fj8tNBzcqBi+4nvoxoD13j0/diG2uBJuzM7H4=;
        b=MOVyQfiBi5xgv18TvoxfcpqG5/uFrFVsmJyW+g5IkJei8HyagmLZ9qc1toLO7SW0V1
         OWzyF5p06PzsbPiVgRZ5y12tbgZO6W1id36gSzLx/qdMfSH7dPAeXUqpVCSRhubiXHHc
         8hjFDRgv2GBgflfW1tBs4wou5r0hrH/ijtpE1aoSb73pDU4ZtUl+0LbbCOsIHSS1Gxj4
         SEuHkhtb9C5gWINEIfl+tSshCdXExTm2xKRYwz3G5z2uFD+bItgf1tDK96h9KqRTfUed
         rLsihlVMXmAT1Lz0TdtiTM4OmWcOUkQRa+fP8E6v6Sas6HkEK6eH9MtQt7A/swUt4z7V
         Zdng==
X-Gm-Message-State: ALQs6tCm5EQBw7a1DPqt17SSdNu4ZTKQQQPcz7eCbuTpLzRyBgFfdLlF
        isXnn2eJKSCWxFtmGA1SgGBAAC2/m40i
X-Google-Smtp-Source: AIpwx4+j20zA1e0rTjp/y3MenFoLGODhXVhc1YW0omiJU9mUnWkfMgZ0JIohx6dq7+wl5LmxFal9uBuRM+PB
MIME-Version: 1.0
X-Received: by 10.55.39.202 with SMTP id n193mr4534048qkn.14.1523641394384;
 Fri, 13 Apr 2018 10:43:14 -0700 (PDT)
Date:   Fri, 13 Apr 2018 10:42:57 -0700
In-Reply-To: <20180413174257.139182-1-hansens@google.com>
Message-Id: <20180413174257.139182-3-hansens@google.com>
References: <20180413174257.139182-1-hansens@google.com>
X-Mailer: git-send-email 2.17.0.484.g0c8726318c-goog
Subject: [PATCH v3 3/3] Documentation/i2c: adopt kernel commenting style in examples
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
Changes from v2:
  1. only the block comment is updated.
  2. one-line comments are reverted to prior form.

 Documentation/i2c/dev-interface | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/i2c/dev-interface b/Documentation/i2c/dev-interface
index f92ee1f59914..fbed645ccd75 100644
--- a/Documentation/i2c/dev-interface
+++ b/Documentation/i2c/dev-interface
@@ -67,8 +67,10 @@ the device supports them. Both are illustrated below.
     /* res contains the read word */
   }
 
-  /* Using I2C Write, equivalent of
-     i2c_smbus_write_word_data(file, reg, 0x6543) */
+  /*
+   * Using I2C Write, equivalent of
+   * i2c_smbus_write_word_data(file, reg, 0x6543)
+   */
   buf[0] = reg;
   buf[1] = 0x43;
   buf[2] = 0x65;
-- 
2.17.0.484.g0c8726318c-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

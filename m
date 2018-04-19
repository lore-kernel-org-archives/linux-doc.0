Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id F037D7E279
	for <lwn-linux-doc@archive.lwn.net>; Thu, 19 Apr 2018 08:43:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751995AbeDSInN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 19 Apr 2018 04:43:13 -0400
Received: from mail-pl0-f68.google.com ([209.85.160.68]:35800 "EHLO
        mail-pl0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750937AbeDSInA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Apr 2018 04:43:00 -0400
Received: by mail-pl0-f68.google.com with SMTP id w21-v6so2826044plq.2;
        Thu, 19 Apr 2018 01:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=re8PC2Grh8ZUMomy29bfcbNYrJ/EtkBKQ5b8oMcFyyk=;
        b=a0+utwHmvY9xLoNc735A55J9TfhZ2trZMQj4H6xaqSszp0SDEMtSp2cStsTtjSfTdz
         8OiMz1YoQPk38gb7AiTOi15a9AO3pHxNwt8/vISimoMHZmHU2ImYNvpPcHw8DBfHYWzW
         /yK2saDGWKImNj+/vJXkfxSbT0hzoFdhFmHx+ouF5q76BQ6a4JWkWUgw1nxlZ0bpjxBo
         witSK9byzASx3cSUCuVMt8tE4O4tow9NtdbVatflbdbXwzltybFydu/+QbuQonAubolt
         ZASj5qKIWLqqPpKyqbhhw9Tpzii1RFn93p1Ds6hx9YXIdIXtGT4dWTXirfolIFVjAVvT
         hYVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=re8PC2Grh8ZUMomy29bfcbNYrJ/EtkBKQ5b8oMcFyyk=;
        b=E3qY/Tm9enFEmnZtA/2vz5aBcljPSc4gA5dDwX5mlz8lc05iMKMzBpQRTkVxTYntiG
         Ksv2Vu3w6fxM6mNbBvhVNbOJr/a+D+HGAu9C8NbIhSdyjF9SXGv17Ez1pM+UFy4Ab7mi
         yaEh5UzWnv/rSFds2Aw2ArnvWEJldqPQAjCsVX06VwRDoy5+JuC2B57RZhetdxu/CCuX
         lKWl6pmdzoZYDV4FWAtY8RGzXaR0bd/c2cOw0PcBTiY/TZkg7xes7UuW9pghFTNuGZKw
         2z56zsxMcy+acDK1n4X0bmHvnYTbRlUfhwGW374MQTY6ZzSPFHFM4Ued24LP4F73eV4F
         jkQw==
X-Gm-Message-State: ALQs6tBZBsSXF2Xtye9ry8jXx3hpRZugNXmyyE8G9rS1azqNEOZyGuJN
        Hxl/SylRDtEz1XLyCwW2K3/m/t7+
X-Google-Smtp-Source: AIpwx497LhZQFzeif/fowDCe1PTrAvKlIFbd6IGMHucY6D5cBAjAgICF8NsuR3Qoac92Zh4RQP3bqw==
X-Received: by 2002:a17:902:d88a:: with SMTP id b10-v6mr5337238plz.172.1524127380037;
        Thu, 19 Apr 2018 01:43:00 -0700 (PDT)
Received: from localhost.localdomain ([147.46.241.218])
        by smtp.gmail.com with ESMTPSA id h6sm6584067pgn.65.2018.04.19.01.42.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 19 Apr 2018 01:42:59 -0700 (PDT)
From:   SeongJae Park <sj38.park@gmail.com>
To:     paulmck@linux.vnet.ibm.com, corbet@lwn.net
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 2/2] atomic_ops.rst: Use `warning` rst directive
Date:   Thu, 19 Apr 2018 17:42:45 +0900
Message-Id: <20180419084245.17096-2-sj38.park@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20180419084245.17096-1-sj38.park@gmail.com>
References: <20180419084245.17096-1-sj38.park@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

One warning message in 'atomic_ops.rst' is not using 'warning' rst
directive while others does.  This commit modifies the message to use
'warning' rst directive.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 Documentation/core-api/atomic_ops.rst | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/core-api/atomic_ops.rst b/Documentation/core-api/atomic_ops.rst
index 4ea4af71e68a..2e7165f86f55 100644
--- a/Documentation/core-api/atomic_ops.rst
+++ b/Documentation/core-api/atomic_ops.rst
@@ -466,10 +466,12 @@ Like the above, except that these routines return a boolean which
 indicates whether the changed bit was set _BEFORE_ the atomic bit
 operation.
 
-WARNING! It is incredibly important that the value be a boolean,
-ie. "0" or "1".  Do not try to be fancy and save a few instructions by
-declaring the above to return "long" and just returning something like
-"old_val & mask" because that will not work.
+
+.. warning::
+        It is incredibly important that the value be a boolean, ie. "0" or "1".
+        Do not try to be fancy and save a few instructions by declaring the
+        above to return "long" and just returning something like "old_val &
+        mask" because that will not work.
 
 For one thing, this return value gets truncated to int in many code
 paths using these interfaces, so on 64-bit if the bit is set in the
-- 
2.13.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

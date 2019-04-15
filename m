Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E930E7D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 15 Apr 2019 14:17:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725789AbfDOORl (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 15 Apr 2019 10:17:41 -0400
Received: from mail-ot1-f73.google.com ([209.85.210.73]:57249 "EHLO
        mail-ot1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727364AbfDOORl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Apr 2019 10:17:41 -0400
Received: by mail-ot1-f73.google.com with SMTP id c26so9089873otr.23
        for <linux-doc@vger.kernel.org>; Mon, 15 Apr 2019 07:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=tYUX4z3a9vnhDDPclH29VM7BoMseyyZGQ648ccgyB7k=;
        b=UQNV1AfQmZWIcprEZbMd4jl6liPToQm1PvJERbLxkuCd743QR1Mf6SgZ/LVqZfXjWM
         uzxJy1QOApMdpC+uDKuYcD4u+Qh6IX+7ejwOKy4u7Fxi8L5sJc5sXNcvpYA0InyhdmNL
         BJAFwjq/2flyAzImqe1aQNIvbEpDgE5d/yTGuCZJzZvkYog879STkVJoCzEnlzoJDdFB
         s9Ev4nDeIhaP1Q99z+2VgRoJ9KahdGJOJ06ZkTEPSu4otZyCWUHAYW/D2YMcKl6tuaO9
         1/XtHgeTEJlRqffXjvyIwa+JEoySz4Re2mwjPwl8yGevp+ae7zbqiynHjnkQL+cQSzfk
         9gew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=tYUX4z3a9vnhDDPclH29VM7BoMseyyZGQ648ccgyB7k=;
        b=Fm+CbtpnGJiu3/UcU3Vm3eHZ606CE8/lmw4S+GpCflPMq5KpNbTrjxDTFwlOhRNp1v
         MsHb9eyISlHVGWmqHXiioGNKQYN4TgeIOi+i/98C98pDacnDgzTfU2h+CEplftbh35Fh
         ubC5Ymm4Nx0rtDghRCv9JR+irfa8kWF7BWIoRG/I6Fw7Uh6IxJZrHX67LlxfKnytjvIj
         SerrSZtukuoPdXGYksc81+rwxtybeMmeEfhN68rMlbKaQ79nK8Bx7YVR612nmA0hNihF
         15CICgyCPYpyNzYdNHWMcEM1N1H94bfrTm8M+vIJpkJfHiOrP8ftdaYPsKmgLv1xpWtO
         qVyA==
X-Gm-Message-State: APjAAAXz8RaM1qw/ZbehskI5g9vDnLV0sGkoWZxcW3BprpOhsR5ZnPJB
        qW0jMABsqwEUtUpjtnVv99kKqv06X+9U
X-Google-Smtp-Source: APXvYqx8ThQGTWHaDJHu9suGwS422jNrj9DDS6gUoloiBOLYoULr7RIAFFLaqMMcNnWR2GNWvAyZN9XYo9qX
X-Received: by 2002:a9d:6a53:: with SMTP id h19mr5916188otn.33.1555337860451;
 Mon, 15 Apr 2019 07:17:40 -0700 (PDT)
Date:   Mon, 15 Apr 2019 07:17:28 -0700
Message-Id: <20190415141728.133110-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.21.0.392.gf8f6787159e-goog
Subject: [PATCH] hwmon: (ir38064) delete incorrect line
From:   Patrick Venture <venture@google.com>
To:     venture@google.com, jdelvare@suse.com, linux@roeck-us.net,
        corbet@lwn.net
Cc:     linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Delete line indicating the datasheet was not publicly available.  This
line was originally present as a default during the write-up and was
subsequently not removed once the datasheet was located.

Signed-off-by: Patrick Venture <venture@google.com>
---
 Documentation/hwmon/ir38064 | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/hwmon/ir38064 b/Documentation/hwmon/ir38064
index c3697d7aaaa44..9f218c39bfe6f 100644
--- a/Documentation/hwmon/ir38064
+++ b/Documentation/hwmon/ir38064
@@ -8,9 +8,6 @@ Supported chips:
     Datasheet: Publicly available at the Infineon webiste
       https://www.infineon.com/dgdl/Infineon-IR38064MTRPBF-DS-v03_07-EN.pdf?fileId=5546d462584d1d4a0158db0d9efb67ca
 
-Datasheet is not publicly available.
-
-
 Authors:
         Maxim Sloyko <maxims@google.com>
         Patrick Venture <venture@google.com>
-- 
2.21.0.392.gf8f6787159e-goog


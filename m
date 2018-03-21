Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 917977DD32
	for <lwn-linux-doc@archive.lwn.net>; Wed, 21 Mar 2018 20:04:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753397AbeCUUEN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 21 Mar 2018 16:04:13 -0400
Received: from mail-wm0-f66.google.com ([74.125.82.66]:53346 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753165AbeCUUEK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Mar 2018 16:04:10 -0400
Received: by mail-wm0-f66.google.com with SMTP id e194so11897429wmd.3;
        Wed, 21 Mar 2018 13:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=up1jiCv+3ui3VmW5fFsxBdSKAU3vhSTNaI4YzACUGY8=;
        b=Q5JH/+7/zQkSCF+E9PEWHrBRV0s+wdOtiRWQrFJHnW4Cs7xhpRjxoW0lJLj7PFMcPL
         hIh96097GvPCH597BYLuvqxJJjxWWUDBKxCsDCBZ4VHwOpCsBoF9jh66omFZAmd9xiR8
         lpWGMHtHJpabtm6xsVsh6XuvkT/4yUhvg1WL+vSyk9aQfWEh/ZfcJV3AQvMvOweQHNNt
         JYs9LhciDFDtKVKKULuDR9HpHIXe7QxYV2Hh0L9DqXAtSdCLnjwiXYBbiwQbr7/PVldq
         vJQZ2v1Dc5/e8MIvcLNiwgj/zYKljiJgA/CxJd/67WW8kkf7gIQvlGU03s+5PHjetoPS
         cJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=up1jiCv+3ui3VmW5fFsxBdSKAU3vhSTNaI4YzACUGY8=;
        b=HhqIqUhUB7czyUsuVIpaX3sEc9iaCAAW+LVQpYIb8EIRGyxg+c284cdFhDAyijikxR
         cJJ0FDXrx/w7MBSTHon1Wi7azl7fZ7m+sV5yDUW16MRffTIfs6LtH9qbqU2BuSG35gpC
         RSJhvd1hmtHjgE2Ac5Y4Mful/65RxfXUBM6BRRveTWAsTwoxIKqIRLcHrT8gQcX/avUt
         fM7Z7J9dzP1Cd8GeCbgC1/Zv7YSp/yibTGp0ZB4L9sF5QSp2ejkNjlfRxNWlEXKsv3GQ
         EtUbM6EJctLgalabI6B8VkzQpHyw9/we3W/nchy0l//v16p0bDg0f6JcSHZjnN+/OzV1
         fjuw==
X-Gm-Message-State: AElRT7H1quBupWjyXAa3L9vqy82J0D9TMeDu1PvalE1AjaQ3zuGnn9qu
        z5HEvcn3qlNar5sGf+Wg+Fh/Hg==
X-Google-Smtp-Source: AG47ELuWLk9GVLsWMU9GNuZUtj81G8EkPy71rbIh9OOOg2tyk9RtdbDvTptuiS6IMDDtPcTdCZ4Frg==
X-Received: by 10.28.48.70 with SMTP id w67mr3598472wmw.47.1521662648735;
        Wed, 21 Mar 2018 13:04:08 -0700 (PDT)
Received: from Pali-Latitude.lan (pali.kolej.mff.cuni.cz. [78.128.193.202])
        by smtp.gmail.com with ESMTPSA id y42sm6228206wry.97.2018.03.21.13.04.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Mar 2018 13:04:08 -0700 (PDT)
From:   =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Masaki Ota <masaki.ota@jp.alps.com>
Cc:     linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Input: alps - Update documentation for trackstick v3 format
Date:   Wed, 21 Mar 2018 21:03:36 +0100
Message-Id: <20180321200336.32035-1-pali.rohar@gmail.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Bits for M, R and L buttons are already processed in alps. Other newly
documented bits not yet.

Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
---
This is based on information which Masaki Ota provided to us.
---
 Documentation/input/devices/alps.rst | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/input/devices/alps.rst b/Documentation/input/devices/alps.rst
index 6779148e428c..b556d6bde5e1 100644
--- a/Documentation/input/devices/alps.rst
+++ b/Documentation/input/devices/alps.rst
@@ -192,10 +192,13 @@ The final v3 packet type is the trackstick packet::
  byte 0:    1    1   x7   y7    1    1    1    1
  byte 1:    0   x6   x5   x4   x3   x2   x1   x0
  byte 2:    0   y6   y5   y4   y3   y2   y1   y0
- byte 3:    0    1    0    0    1    0    0    0
- byte 4:    0   z4   z3   z2   z1   z0    ?    ?
+ byte 3:    0    1   TP   SW    1    M    R    L
+ byte 4:    0   z6   z5   z4   z3   z2   z1   z0
  byte 5:    0    0    1    1    1    1    1    1
 
+TP means Tap SW status when tap processing is enabled or Press status when press
+processing is enabled. SW means scroll up when 4 buttons are available.
+
 ALPS Absolute Mode - Protocol Version 4
 ---------------------------------------
 
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

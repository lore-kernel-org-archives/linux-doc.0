Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2A4047DD32
	for <lwn-linux-doc@archive.lwn.net>; Wed, 28 Mar 2018 15:00:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753561AbeC1O7T (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 28 Mar 2018 10:59:19 -0400
Received: from mail-pg0-f67.google.com ([74.125.83.67]:46695 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753544AbeC1O7S (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Mar 2018 10:59:18 -0400
Received: by mail-pg0-f67.google.com with SMTP id t12so1017397pgp.13;
        Wed, 28 Mar 2018 07:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=LJ3R5EqtmeSAynPaRVeD/qdckWGvNZ2pe2I6pbITrBY=;
        b=PIpGhTS76Ai5uyYIKmDPadraZONNAjx8XxU8/14TuKI2bshJ4/n8uocXVYMjknYFLX
         vab5QPL7jZ7MXEmNJdMj7h2vWBumQ1VaTPFNXcC76Iu0SXrRyqaMuqzvlZ6XnL4bjALt
         E2zZ12VD2/qePiOEfv4dN1oA98Z8x2BZOfLRr6zn99EMQpfLz4i/Im+pZ01N+yU7cxno
         QHcJnGZBGnr+7MElSa/wVwzfbFiDmshNOtQYhFI3gdNOg+eqW8+236RdBYl+wquwDYaY
         bLn/8dZUmGuo0s/9IVh6imjy/zaneIBCYsExse2eE7cyecn5rmO9Lzp7kNX9Ygjkx6qg
         Kafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=LJ3R5EqtmeSAynPaRVeD/qdckWGvNZ2pe2I6pbITrBY=;
        b=jlDHaf5io+ooHev82xCAU0ZKiT5+ys10tHB5zXmRepqTlTPRUcnmZCLPPj29gNYde1
         on1Q9EB7TYJtJhXcmUxoE7f5wu8MRQVCYJPUvUuSd5q08sEmAR1xGdOU5v17uxe7F0CU
         6+qQxd2tFO9MNFTVUMfKnEqhNmmMsQysP+DQ3u3KTOOqkjZHOyUwT8FG0kz2V4ikzl1r
         nQXWISRcxwNzfQnWF9Lr1sb8p0jjq89liC+TdKyXou/QJDoK3VsYEPXl7780WRIICODh
         2QGFCygQaZtRX2VHTDUQi3LodfqM+Pr2WXSs8iD4aS4jVsf7ChJxQIZoIL7wB/H8ExzG
         sY1w==
X-Gm-Message-State: AElRT7GRZEPy9nYSX89Lh4LKsQV9zDZxf6Tfz45YX09+WKQFiLNr9N7Y
        yGkrtwYJ6Jvvj5ZXEhi/3YdsNw==
X-Google-Smtp-Source: AIpwx4848yEnuLjoplBjcOZl2HP5T6WBQsEGs+3tbX/cFuA0xfA7PAe60dbT0p0ZodLXLzruPxRo8A==
X-Received: by 10.98.66.203 with SMTP id h72mr3272916pfd.156.1522249157613;
        Wed, 28 Mar 2018 07:59:17 -0700 (PDT)
Received: from arty-430G2 ([2001:470:36:117e:a038:3853:c974:4e7])
        by smtp.gmail.com with ESMTPSA id c187sm8591696pfa.181.2018.03.28.07.59.14
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Mar 2018 07:59:17 -0700 (PDT)
Received: by arty-430G2 (sSMTP sendmail emulation); Wed, 28 Mar 2018 22:59:13 +0800
From:   Sanjeev Gupta <ghane0@gmail.com>
To:     corbet@lwn.net, linux-pm@vger.kernel.org
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        viresh.kumar@linaro.org
Subject: [PATCH] Documentation/thermal: Check links and convert to https
Date:   Wed, 28 Mar 2018 22:59:13 +0800
Message-Id: <20180328145913.14026-1-ghane0@gmail.com>
X-Mailer: git-send-email 2.15.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

All links working.

Signed-off-by: Sanjeev Gupta <ghane0@gmail.com>
---
 Documentation/thermal/cpu-cooling-api.txt | 2 +-
 Documentation/thermal/nouveau_thermal     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/thermal/cpu-cooling-api.txt b/Documentation/thermal/cpu-cooling-api.txt
index 7df567eaea1a..32917d178c51 100644
--- a/Documentation/thermal/cpu-cooling-api.txt
+++ b/Documentation/thermal/cpu-cooling-api.txt
@@ -5,7 +5,7 @@ Written by Amit Daniel Kachhap <amit.kachhap@linaro.org>
 
 Updated: 6 Jan 2015
 
-Copyright (c)  2012 Samsung Electronics Co., Ltd(http://www.samsung.com)
+Copyright (c)  2012 Samsung Electronics Co., Ltd (https://www.samsung.com)
 
 0. Introduction
 
diff --git a/Documentation/thermal/nouveau_thermal b/Documentation/thermal/nouveau_thermal
index 6e17a11efcb0..502b0b95c2e2 100644
--- a/Documentation/thermal/nouveau_thermal
+++ b/Documentation/thermal/nouveau_thermal
@@ -79,4 +79,4 @@ Thermal management on Nouveau is new and may not work on all cards. If you have
 inquiries, please ping mupuf on IRC (#nouveau, freenode).
 
 Bug reports should be filled on Freedesktop's bug tracker. Please follow
-http://nouveau.freedesktop.org/wiki/Bugs
+https://nouveau.freedesktop.org/wiki/Bugs
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

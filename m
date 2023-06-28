Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D76EB64DC
	for <linux-doc@archiver.kernel.org>; Wed, 28 Jun 2023 09:08:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236515AbjF1JIM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Jun 2023 05:08:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234468AbjF1IyV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Jun 2023 04:54:21 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DA3E30E6
        for <linux-doc@vger.kernel.org>; Wed, 28 Jun 2023 01:54:20 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id 46e09a7af769-6b5f362f4beso5131899a34.2
        for <linux-doc@vger.kernel.org>; Wed, 28 Jun 2023 01:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=saviah-com.20221208.gappssmtp.com; s=20221208; t=1687942459; x=1690534459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FzpucOKusMK2wTNYrtP4LhYMpmeXTJSQi3XxzYtYylI=;
        b=OezRWM4mqIadoFOGYoBQtU3PEBAP23iDGdweFBuyxq324SK6/sX7pdAM0pMwYrjaYX
         yAMQQvLPFW3jGyXSwpCEwcvgf9mlyBulGiSQ3CbYDkid66ek7um20AumyRjsPciFSUNe
         zgMj7WEhNv7cEiHRKCm3651OQNj2ARgTtWAG8yHrX/VeOpENSUT4kEOrBMfSe4PYw2zB
         xIf25noPxXxlCA2oSEnwHpS++cG0+OVySrd/a+Oy/CNkNtvvXGAunqYSBY1gbuXZPjbj
         B6SPjVvQZVBOS4M6pOJ4r2zkuY1tFA6ikQ3pYZWqOgXVJBWLPMRK1JsACVcl3CkOIuko
         k9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687942459; x=1690534459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FzpucOKusMK2wTNYrtP4LhYMpmeXTJSQi3XxzYtYylI=;
        b=OFLpaakkkX8p6sZaeP3GamGqx2toohTBRfHKY17EvgDhWvc3lHIZMBm1aECETvqA8V
         Z8q+y6XUOb1TpgOQu+jFx6B2Ac9U6Q8M6acIfA0XVAH0pUNsL7Wg/okSS8GTTj9uKdV/
         Ag5FIshcsAsJFITOFb/dcGyYvleAKQ65L5CGg5T6Z7Jq+2eDifYURHwk8zYH5SwVCo36
         8bWoEgJnAE2nl1hrgY7pxpwvSf1gb9wiKW4w6mvOfEgCLWulvYLmqc88CXaJ8tKMeRby
         7wMYNM1YJMhG9U6zN5nv6FpmXkD8ny0hpCUx1A99zndntoGiNeublqtbgiUujHLyoSDF
         iS3w==
X-Gm-Message-State: AC+VfDxYfuo8T3EqBdle1cP/7AnHZgDeOoJJBReFqCJd2gjIjvSvO+7R
        tD0+rQOZarFapCLOGkfzSqFFxg==
X-Google-Smtp-Source: ACHHUZ6iQ8wx97tAv9h9KoxBd8wmNDPP8jmvHzDqdq4y8g+/TEi84IqBehsy/FzhEBxuoCgRi7VZGA==
X-Received: by 2002:a05:6830:1d66:b0:6b7:378d:7daa with SMTP id l6-20020a0568301d6600b006b7378d7daamr12244531oti.4.1687942459633;
        Wed, 28 Jun 2023 01:54:19 -0700 (PDT)
Received: from localhost.localdomain (NCTU-Wireless-NAT220.nctu.edu.tw. [140.113.136.220])
        by smtp.gmail.com with ESMTPSA id s11-20020a63dc0b000000b0053031f7a367sm7022025pgg.85.2023.06.28.01.54.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Jun 2023 01:54:19 -0700 (PDT)
From:   Ian Chen <yi.chen@saviah.com>
To:     davem@davemloft.net
Cc:     edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        corbet@lwn.net, netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ian Chen <yi.chen@saviah.com>
Subject: [PATCH] Documentation: networking: add UPF (User Plane Function in 5GC) description
Date:   Wed, 28 Jun 2023 16:53:51 +0800
Message-Id: <20230628085351.84016-1-yi.chen@saviah.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add the content of User Plane Function (UPF),
which was defined in 3GPP specifications since release 15.

Signed-off-by: Ian Chen <yi.chen@saviah.com>
---
 Documentation/networking/gtp.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/networking/gtp.rst b/Documentation/networking/gtp.rst
index 9a7835cc1..c02aa34c4 100644
--- a/Documentation/networking/gtp.rst
+++ b/Documentation/networking/gtp.rst
@@ -31,12 +31,12 @@ payload, such as LLC/SNDCP/RLC/MAC.
 
 At some network element inside the cellular operator infrastructure
 (SGSN in case of GPRS/EGPRS or classic UMTS, hNodeB in case of a 3G
-femtocell, eNodeB in case of 4G/LTE), the cellular protocol stacking
+femtocell, eNodeB in case of 4G/LTE, gNobeB in case of 5G), the cellular protocol stacking
 is translated into GTP *without breaking the end-to-end tunnel*.  So
 intermediate nodes just perform some specific relay function.
 
-At some point the GTP packet ends up on the so-called GGSN (GSM/UMTS)
-or P-GW (LTE), which terminates the tunnel, decapsulates the packet
+At some point the GTP packet ends up on the so-called GGSN (GSM/UMTS),
+P-GW (LTE), or UPF (5G), which terminates the tunnel, decapsulates the packet
 and forwards it onto an external packet data network.  This can be
 public internet, but can also be any private IP network (or even
 theoretically some non-IP network like X.25).
@@ -60,7 +60,7 @@ payload, called GTP-U.  It does not implement the 'control plane',
 which is a signaling protocol used for establishment and teardown of
 GTP tunnels (GTP-C).
 
-So in order to have a working GGSN/P-GW setup, you will need a
+So in order to have a working GGSN/P-GW/UPF setup, you will need a
 userspace program that implements the GTP-C protocol and which then
 uses the netlink interface provided by the GTP-U module in the kernel
 to configure the kernel module.
@@ -162,7 +162,7 @@ Local GTP-U entity and tunnel identification
 GTP-U uses UDP for transporting PDU's. The receiving UDP port is 2152
 for GTPv1-U and 3386 for GTPv0-U.
 
-There is only one GTP-U entity (and therefore SGSN/GGSN/S-GW/PDN-GW
+There is only one GTP-U entity (and therefore SGSN/GGSN/S-GW/PDN-GW/UPF
 instance) per IP address. Tunnel Endpoint Identifier (TEID) are unique
 per GTP-U entity.
 
-- 
2.38.1


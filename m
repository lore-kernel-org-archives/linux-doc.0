Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1D3CEB64D7
	for <linux-doc@archiver.kernel.org>; Wed, 28 Jun 2023 09:08:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236969AbjF1JIQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Jun 2023 05:08:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232663AbjF1IvV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Jun 2023 04:51:21 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC184129
        for <linux-doc@vger.kernel.org>; Wed, 28 Jun 2023 01:51:19 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id d2e1a72fcca58-6687466137bso3171169b3a.0
        for <linux-doc@vger.kernel.org>; Wed, 28 Jun 2023 01:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=saviah-com.20221208.gappssmtp.com; s=20221208; t=1687942279; x=1690534279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/vZJ9KZ0nORDwUa8rVOPplQDUftdsKPRXoJD7pWWR6w=;
        b=ZOr18CgDS7iAPXjfKCD67Vd6O0PRJdvitrvl6bv2E6OPbSWSPfkpB8RjenKKMW3YaE
         OPaqIY68K4uurf/0ymdUsafRkohJGtySAizEuFBzl9ncZ4EDUpi8sXlS9NQspqTk8vYD
         69xt4u1xbIEU/Pktj/oxLY6Qg9uwa1fvKWRRNb5dEusy02xqbcXZhH+2Ar4oN+yrZhqX
         Zi3XFRUTxdN3w+fVhzPl//0aexBxB9nJJB45+LWUNAi7KDY0D5/6H1CPKUdvx9U3EazA
         gfebVRKc9fCsfRRqfnrNlfs4WXDYMGWf9rJnnF/Q7n4ZIEFXXTMOqfS0qyR0chicbW8a
         hnwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687942279; x=1690534279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/vZJ9KZ0nORDwUa8rVOPplQDUftdsKPRXoJD7pWWR6w=;
        b=d4Mc1+mxUv2++vg8n6uddrH7nE9qx8NiYT12WNFG01j2v2WxATwhniAtcKyRajumA4
         beAGQ4//B57rvNLkZV3W9BoMOAUhSRTadsVAYcH9CHGoFpGlAskm2wrEdFPPbb9FM2mr
         1QUlkG1T5Tk2539JP31gHqx6zq5X/y6DRT5IU0/EZ6aN8k8S8zMOVVY/4JJ7Zn80d0Oz
         ZrpbP8FSULCHvm2xPMgGJwf6u7dpkURyKIIdWd4vdWaJAO3bznQhsjxUUD/Vxog3eF1A
         jsRE6/dgsj4zaNxUj3vMIeQnwHNHr1sVUIyukdFmZjpGLX9SANrl5QMJQUXBZYiRPvBk
         dqzw==
X-Gm-Message-State: AC+VfDymNa66SumUmlvCq7b7T5rXt0/57EP9by/OM4jQ4WZGkGogbn+N
        2+VmtZODB8aRCIft7t9lxiwRdQ==
X-Google-Smtp-Source: ACHHUZ5XIlLdxi7pC8cJXFTN1+imiG3XKOQHdumh9hhxiPOzklzqNxuEyCBs6PfPRxTMRrODCAqglw==
X-Received: by 2002:a05:6a20:914a:b0:10b:8e96:561 with SMTP id x10-20020a056a20914a00b0010b8e960561mr26391135pzc.62.1687942279331;
        Wed, 28 Jun 2023 01:51:19 -0700 (PDT)
Received: from localhost.localdomain (NCTU-Wireless-NAT220.nctu.edu.tw. [140.113.136.220])
        by smtp.gmail.com with ESMTPSA id jj11-20020a170903048b00b001b80e07989csm4244899plb.200.2023.06.28.01.51.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Jun 2023 01:51:18 -0700 (PDT)
From:   Ian Chen <yi.chen@saviah.com>
To:     davem@davemloft.net
Cc:     edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        corbet@lwn.net, netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ian Chen <yi.chen@saviah.com>
Subject: [PATCH] Documentation: networking: add UPF (User Plane Function in 5GC) description
Date:   Wed, 28 Jun 2023 16:50:49 +0800
Message-Id: <20230628085049.83803-1-yi.chen@saviah.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add the content of User Plnae Function (UPF),
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


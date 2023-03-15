Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12771C6FD1D
	for <linux-doc@archiver.kernel.org>; Wed, 15 Mar 2023 07:02:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbjCOHCV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Mar 2023 03:02:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230348AbjCOHCT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Mar 2023 03:02:19 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0A1855060
        for <linux-doc@vger.kernel.org>; Wed, 15 Mar 2023 00:02:11 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id p6so19107979plf.0
        for <linux-doc@vger.kernel.org>; Wed, 15 Mar 2023 00:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678863731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A68M7/xfFbhoMwUouBQ3PR/BIfF4GewV1Ba+f2zbZVY=;
        b=JVj+evaMTD3GF/zeu0xHYfqII5cf4h7HjS9AtsHYIcw+Q0hpoU82yQp/dG9gXUI71A
         zTi1Lr7zWLu/ZKNpoZ/Z17SbidMiJR/W+x5/LBKGTqwWhUxcrHyb1le0DvmGf6R803z0
         gAgEBSI6+ixkn3qsfizKXPu167A0CfE4wN46pFTgrDqc60gBPscmgr5NIP8CnJX0GeN2
         giEviEMKAk6asw7euYScwICFaQg/qd+yG80/6i8lrm0eFdaa/xABKUxioWZsz/g+fz4a
         hudiCS91VML+zwkSShcv1A3YdpIVRWQsvAX684xICkSDCvZ8DpoO1vtbaeXV20J98zqV
         OIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678863731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A68M7/xfFbhoMwUouBQ3PR/BIfF4GewV1Ba+f2zbZVY=;
        b=H8RdhA884QF02nt5yEqbavDbCZBYjWrGW5rZVqxW99QtHQtwbHZzNG5xv6oKKa8rjP
         BQFrqkt8q29Hi91WeOyxUcmwlGgeFaLRuJrIjVXRNWxOiRdZujylVHqV05lNMMwux5Tl
         yCZtyU5avjYwYHdDPjSMkk1wLlLMdP9ZAODe+NKSh5jLqT9DOxzkgx2D7nLHKsgsHbDC
         DYrvQhbsf09pUKdLLAMZ0UTZWZMng3woJvAr3McDeoiXJ+FVXnroojGTPzXor4IpeeqO
         xo0JKtKRMxiqBHHs10Nr4sYuy7wk4L9De0eAMyoSPOm6licF8URpGdB7CDiSNZCUTMwM
         SNFQ==
X-Gm-Message-State: AO0yUKUG6bJmRNhnnt1q/Np1fLD6NDd+doM3pj/YfBi8+KREhJEKEKRc
        0Da5HwKbPPS49lmreltyXLsaUIh3rlc=
X-Google-Smtp-Source: AK7set/cKa2+IOFwrdTaat6s60LGg+tuE6aoJ/PUx+xw8s0A/Cf2yj4PbMxTYcWsvhl1tu3vfhXlqw==
X-Received: by 2002:a17:902:d1cd:b0:1a0:7655:2153 with SMTP id g13-20020a170902d1cd00b001a076552153mr1400121plb.41.1678863731422;
        Wed, 15 Mar 2023 00:02:11 -0700 (PDT)
Received: from localhost.localdomain ([167.220.238.138])
        by smtp.googlemail.com with ESMTPSA id i3-20020a170902c94300b0019f232619d7sm2823081pla.173.2023.03.15.00.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 00:02:11 -0700 (PDT)
From:   bharathsm.hsk@gmail.com
To:     bagasdotme@gmail.com, edumazet@google.com, davem@davemloft.net,
        kuba@kernel.org, pabeni@redhat.com, dhowells@redhat.com,
        linux-doc@vger.kernel.org, corbet@lwn.net
Cc:     Bharath SM <bharathsm@microsoft.com>
Subject: [PATCH v2] dns_resolver: correct documentation error in dns resolver
Date:   Wed, 15 Mar 2023 07:01:08 +0000
Message-Id: <20230315070108.1539587-1-bharathsm.hsk@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bharath SM <bharathsm@microsoft.com>

Fix incorrect sysfs path in dns_resolver documentation

Signed-off-by: Bharath SM <bharathsm@microsoft.com>
Acked-by: David Howells <dhowells@redhat.com>
---
 Documentation/networking/dns_resolver.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/dns_resolver.rst b/Documentation/networking/dns_resolver.rst
index add4d59a99a5..99bf72a6ed45 100644
--- a/Documentation/networking/dns_resolver.rst
+++ b/Documentation/networking/dns_resolver.rst
@@ -152,4 +152,4 @@ Debugging
 Debugging messages can be turned on dynamically by writing a 1 into the
 following file::
 
-	/sys/module/dnsresolver/parameters/debug
+	/sys/module/dns_resolver/parameters/debug
-- 
2.25.1


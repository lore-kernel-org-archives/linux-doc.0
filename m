Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05159C46467
	for <linux-doc@archiver.kernel.org>; Tue, 10 Jan 2023 15:03:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234067AbjAJPDI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 10 Jan 2023 10:03:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233300AbjAJPDE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Jan 2023 10:03:04 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C1155AC70;
        Tue, 10 Jan 2023 07:02:38 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id n12so12666627pjp.1;
        Tue, 10 Jan 2023 07:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hnA+uHCy6P7PsRxtJOnvckRetO3eFNxuDZZIKa1zGWA=;
        b=dhgyhtsB5aZlrR6UFvRwSLqV6ez6fA1AQxxivKlkF5lUcN1PMBqReoL8t5AZTpqGvi
         UCBKIzURulQig3MfXAyebDMzTRJqgUduJGsszrybT8zYH+WY0avP8ch2bufY+DmIaAaD
         5/XO0WULz3Xlf4Cei6Eh7uviB6LxrdSI/roctxmwXUhHRPP/sKpYwDeWpY1ITsAVHCfz
         IW5uPiM2kLC7x4c0ZlhZEAGgM9KHi3UawsugGer8SPXd796TUjOedpxdxSf6MKUgzoAz
         ecyP2q8F5mxr3ZTq7ECE8hpY0DUbFRn0dOBkK9yCo8C95HVCoIh1MoZTWYKgZvECqc03
         pDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hnA+uHCy6P7PsRxtJOnvckRetO3eFNxuDZZIKa1zGWA=;
        b=gP0x8kxkgpwZ7NN/OpDkQcsBW9e2fSsqVuTim36zMK666c59cOaciToWOOZKbB3qKx
         p4UZD2KXH2Ep6+kzdRS3x+MRdzhM4KGT6lO8dlbvD7DmjHacXUTqohq5w3fnsUQfw08T
         yRCVM/9yV7Duucqz6rHsCGiMPxajNxy2UiXeB0K2yDB7MCJrT0ed7Uas2O7A0Z814Gwo
         fFm3uhy+kC4nogKV7vrhrTAcdJGDXB3xOnITVno9x60wuoS+nfeDBVJbwqcdDzvISlq0
         PC3xSnTdJ8GKkZEYa/MnV54FaujwlpXvJXJwCfxWpBuU7E2CQNxvm/ads9PY2Rrh9soZ
         sHMQ==
X-Gm-Message-State: AFqh2krFAy7LzHoZu/5oldyWFfGSzzZgsT64GiUoND5I54co+KCZ8+4F
        z99CeKcfjwWMVTTyFYZPov17lkCsbnxIFA==
X-Google-Smtp-Source: AMrXdXt5tCuAAgKwaXBm87V1iTA5iPygkUHNDS3T7BPy7wXrUHqdHL9awf4YImc6EgBEH8F54ej01g==
X-Received: by 2002:a17:90b:3758:b0:225:d698:69b9 with SMTP id ne24-20020a17090b375800b00225d69869b9mr61179882pjb.17.1673362958320;
        Tue, 10 Jan 2023 07:02:38 -0800 (PST)
Received: from localhost.localdomain ([185.216.119.110])
        by smtp.googlemail.com with ESMTPSA id qe9-20020a17090b4f8900b001df264610c4sm2534681pjb.0.2023.01.10.07.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 07:02:38 -0800 (PST)
From:   Wang Yong <yongw.kernel@gmail.com>
To:     corbet@lwn.net, pbonzini@redhat.com, kchamart@redhat.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kvm@vger.kernel.org, Wang Yong <yongw.kernel@gmail.com>
Subject: [PATCH] Documentation: KVM: fix typos in running-nested-guests.rst
Date:   Tue, 10 Jan 2023 15:00:46 +0000
Message-Id: <20230110150046.549755-1-yongw.kernel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

change "gues" to "guest" and remove redundant ")".

Signed-off-by: Wang Yong <yongw.kernel@gmail.com>
---
 Documentation/virt/kvm/x86/running-nested-guests.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/x86/running-nested-guests.rst b/Documentation/virt/kvm/x86/running-nested-guests.rst
index a27e6768d900..71136fe1723b 100644
--- a/Documentation/virt/kvm/x86/running-nested-guests.rst
+++ b/Documentation/virt/kvm/x86/running-nested-guests.rst
@@ -150,7 +150,7 @@ able to start an L1 guest with::
     $ qemu-kvm -cpu host [...]
 
 The above will pass through the host CPU's capabilities as-is to the
-gues); or for better live migration compatibility, use a named CPU
+guest, or for better live migration compatibility, use a named CPU
 model supported by QEMU. e.g.::
 
     $ qemu-kvm -cpu Haswell-noTSX-IBRS,vmx=on
-- 
2.25.1


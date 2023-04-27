Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 190B7C7EE22
	for <linux-doc@archiver.kernel.org>; Thu, 27 Apr 2023 08:38:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243173AbjD0Iih (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Apr 2023 04:38:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243162AbjD0Iig (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Apr 2023 04:38:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 219F34ECB
        for <linux-doc@vger.kernel.org>; Thu, 27 Apr 2023 01:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682584668;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=FT26bsZTksy9w0Z5ZkQBGS3kpOjEM/lIdHfF+ktDpPI=;
        b=BcKGl1KoXj0TKaqryAjfZYX+zc/IlwU9MqKw8ce58arZ+ciZU/7GVmYjl+nWvuKeIKEumc
        HQGmocSGhL/Z2VQlrvrmEAiIqvmxiJLprZwtxfYa4aSVxkAsgdUXlgK3GAU0tE66f0DZfA
        GYtKM9SRweJXjyT+EC0xfTItALZLaTE=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-272--zYOfHtrNZG8Xq9HiHkYyg-1; Thu, 27 Apr 2023 04:37:46 -0400
X-MC-Unique: -zYOfHtrNZG8Xq9HiHkYyg-1
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-63b5e149e1fso5533818b3a.3
        for <linux-doc@vger.kernel.org>; Thu, 27 Apr 2023 01:37:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682584666; x=1685176666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FT26bsZTksy9w0Z5ZkQBGS3kpOjEM/lIdHfF+ktDpPI=;
        b=c/R64yqBcaUDjk/HRncKGGqSk87n/meotRPb9L0Elp6wh2Xjk7PxFoQ7myKhzJIJqb
         XxXlPG95QzNf+VufSrXxuBbClHpM/NFQUTOYgG94nmkP7Dxp0H/gUs5WnnEJ9u1DbZ72
         +2VxOG1mgugiM60q+MlcyKhbJG/X9B0Ja3TMfhltePVTAYlLwtukfonZbqbpa/7z7wj7
         zfU4bQ3fdTSxGhr+flSKEdgh8PC4wNBGlTL7nNVZLg1mIosbBczbbKuglgrvq9wPkItD
         vjuCq2DSg/+Vrns6RlbP5fs+rdc1+epxKUr5zmSLg9aS/YQjzmzugQdW1UZ8cAd72qO2
         ZbyQ==
X-Gm-Message-State: AC+VfDy5gzL7V3iBeSdtTnSLrbE4uDO0fA/V1s9LKlAFr8UQdCyJW8M2
        5Q3J/kMGH2g7bOBsj7/cQeBNh1dqkPb2KEB08Z9BhlDwAaMDU6x/qQ5DW3HF80xu0T1Cccxgh3E
        oMOUrTM/dE3UWDzw41EcR
X-Received: by 2002:a05:6a00:18a6:b0:63b:854e:8459 with SMTP id x38-20020a056a0018a600b0063b854e8459mr1320904pfh.31.1682584665848;
        Thu, 27 Apr 2023 01:37:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ40DrCNhHatZ2coz2Ut05aumESlJ+c2+DlbJvx0NkNxsZ6d1inQLpc7uIfqPl1ShuB2Djet7g==
X-Received: by 2002:a05:6a00:18a6:b0:63b:854e:8459 with SMTP id x38-20020a056a0018a600b0063b854e8459mr1320882pfh.31.1682584665497;
        Thu, 27 Apr 2023 01:37:45 -0700 (PDT)
Received: from nsharma-mac.redhat.com ([2405:201:a400:c036:a55b:cfa9:5cf:adad])
        by smtp.gmail.com with ESMTPSA id t2-20020a628102000000b0063b1e7ffc5fsm12591223pfd.39.2023.04.27.01.37.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 27 Apr 2023 01:37:44 -0700 (PDT)
From:   Natesh Sharma <nsharma@redhat.com>
To:     corbet@lwn.net, chenhuacai@kernel.org, dave.hansen@linux.intel.com,
        geert@linux-m68k.org, axboe@kernel.dk, linux@zary.sk
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Natesh Sharma <nsharma@redhat.com>
Subject: [PATCH] docs: admin-guide: Add information about intel_pstate active mode
Date:   Thu, 27 Apr 2023 14:07:06 +0530
Message-Id: <20230427083706.49882-1-nsharma@redhat.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Information about intel_pstate active mode is added in the doc.
This operation mode could be used to set on the hardware when it's
not activated. Status of the mode could be checked from sysfs file
i.e., /sys/devices/system/cpu/intel_pstate/status.
The information is already available in cpu-freq/intel-pstate.txt
documentation.

Link: https://www.kernel.org/doc/Documentation/cpu-freq/intel-pstate.txt

Signed-off-by: Natesh Sharma <nsharma@redhat.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index bbecbd5797a3..10f3c8d1bb46 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2104,6 +2104,14 @@
 			disable
 			  Do not enable intel_pstate as the default
 			  scaling driver for the supported processors
+                        active
+                          Use intel_pstate driver to bypass the scaling governors
+                          layer of cpufreq and provides it own algorithms for p-state
+                          selection. There are two P-state selection algorithms provided
+                          by intel_pstate in the active mode: powersave and performance.
+                          The way they both operate depends on whether or not the hardware
+                          managed P-states (HWP) feature has been enabled in the processor
+                          and possibly on the processor model.
 			passive
 			  Use intel_pstate as a scaling driver, but configure it
 			  to work with generic cpufreq governors (instead of
-- 
2.39.2 (Apple Git-143)


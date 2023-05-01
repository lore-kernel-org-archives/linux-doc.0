Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 914DBC77B61
	for <linux-doc@archiver.kernel.org>; Mon,  1 May 2023 08:21:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232272AbjEAIVx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 1 May 2023 04:21:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232208AbjEAIVw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 May 2023 04:21:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BD8211C
        for <linux-doc@vger.kernel.org>; Mon,  1 May 2023 01:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682929263;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=FT26bsZTksy9w0Z5ZkQBGS3kpOjEM/lIdHfF+ktDpPI=;
        b=X6E3kYC0JxZztsypqXX0y5JongHs2b5hlUsjjsB6tiKiJWQk+sm9/unk7MxRO0arQV+zWk
        MEf6jdHgYUT2Q5jVhTOkVYXgRu6DD9gUqs8foxb9H7xJbVEuSJIP3WkVMn7rBLoWm+TMOX
        eBfGhi1ulPd3MyZkqJnXj0iNlGSwi+I=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-RWXqx7JAM6O91p_9GWIxwA-1; Mon, 01 May 2023 04:21:02 -0400
X-MC-Unique: RWXqx7JAM6O91p_9GWIxwA-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-24de504c5fcso1594303a91.2
        for <linux-doc@vger.kernel.org>; Mon, 01 May 2023 01:21:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682929261; x=1685521261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FT26bsZTksy9w0Z5ZkQBGS3kpOjEM/lIdHfF+ktDpPI=;
        b=ZDniL/qMBZbF+AbCrrvEaBf4lxYmPronLLDgyqvsNBMa/nzFI9q2m/xVazgUP1QnE/
         Myiyy1dOFfQwz2MIXCp5Z0yp3MIR9rQ6GU/PpeQ+6CidRanbeftWITosAHvWvuXpejLp
         sPWsHH4Pf+zMnJSuzJW1NGIaFkVqeGUHVefMqvY2Fv9w5GDQEJ9VSTkQthxGnN7conud
         7ePhM8og9cEsu9li4+3OGgnsMVlLzyQqOIUVsh0YrS4M4PlI4wojX6gK+NzrPn7BWR6x
         SfK/V5i7cHx8nhiWToOj/ars//iV8tY/o4jKDr9OnjgrxnfLPthkDBGx395R4sQaiAll
         j7CA==
X-Gm-Message-State: AC+VfDxIWlnM14Hj2j+QcS8W47kWIwCB0NUR53QJTeZq27A7+tXXsRbV
        /wEQV6ohCi4BhLGSBAYvi/Sib/JRdQ70vYRFfK1gY88UfXbSX/mRqBfVdMB2Ggr3L/Qosibgyt9
        R5uTrsWwgxHBtWsH+rGG3
X-Received: by 2002:a17:902:9a48:b0:19a:b754:4053 with SMTP id x8-20020a1709029a4800b0019ab7544053mr14265284plv.26.1682929261473;
        Mon, 01 May 2023 01:21:01 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6HfJhry47T9KbwOD+9oM8pm5mDg19vNl2hJAA8LhH1GM6W6FydZaTthxFQQf7IjvvgqsJGVQ==
X-Received: by 2002:a17:902:9a48:b0:19a:b754:4053 with SMTP id x8-20020a1709029a4800b0019ab7544053mr14265271plv.26.1682929261227;
        Mon, 01 May 2023 01:21:01 -0700 (PDT)
Received: from nsharma-mac.redhat.com ([49.37.74.43])
        by smtp.gmail.com with ESMTPSA id j1-20020a17090276c100b001a80ae1196fsm17375015plt.39.2023.05.01.01.20.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 01 May 2023 01:21:00 -0700 (PDT)
From:   Natesh Sharma <nsharma@redhat.com>
To:     corbet@lwn.net, chenhuacai@kernel.org, dave.hansen@linux.intel.com,
        geert@linux-m68k.org, axboe@kernel.dk, linux@zary.sk
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Natesh Sharma <nsharma@redhat.com>
Subject: [PATCH] docs: admin-guide: Add information about intel_pstate active mode
Date:   Mon,  1 May 2023 13:50:50 +0530
Message-Id: <20230501082050.74131-1-nsharma@redhat.com>
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


Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CEF447D043
	for <lwn-linux-doc@archive.lwn.net>; Mon, 11 Jun 2018 16:15:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933248AbeFKQPQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 11 Jun 2018 12:15:16 -0400
Received: from mail-pg0-f67.google.com ([74.125.83.67]:34721 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933120AbeFKQPM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 Jun 2018 12:15:12 -0400
Received: by mail-pg0-f67.google.com with SMTP id q4-v6so8923681pgr.1
        for <linux-doc@vger.kernel.org>; Mon, 11 Jun 2018 09:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=keqn+229SBus/F711ElacOgKgpQOxHNTPwATX7IzJMw=;
        b=j89aEuS80vWbJaBOEuw3Hkk3oCmefPT1D3djJfDMt80l5ZKzmQX4g3Kxj6Ch2/MMK+
         3P/fkS/fleurKv0/p3ccQ+D+CRxud2Y3YljWmlx27gQrN0ehUQJSA5cSKQ31v4bxn4GQ
         muEJpvjehINNgYl51SwRihzXDn8tHM2Sk8kqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=keqn+229SBus/F711ElacOgKgpQOxHNTPwATX7IzJMw=;
        b=J2TkuhXCiH2F5qZozpumGTfB8q4ljyE62jFu9XXJvWXMLANYb2coFcs71A277VI5mO
         yj8PoCcHPG7DtnGjElTTD7ORhdrzUyJJ5YiZqoqkU1OpEyfVBnmGEcNK4PYS4++4M4Qd
         2c5/i0j6Y6NVJIg7yIxsA1f8lySoDRw7Q/7XBoZP1VNzdDT8i03eHWABHNYSbPft4Udh
         PrmidtlYufnbYkkmtgut43EvZ34k5tzVrqRd4xdYXzCAREfSBs0ReJUpB2iLD4a/RIsX
         hxUpAV2OXtlGHE2KfMS3nMIQdNbq21EKYWra0VDq8gkWgsgylFjoz0K87+ejoTPp3Jlw
         EQWA==
X-Gm-Message-State: APt69E32fHptmqLmKxtk8qlM0VomD5TdrByJ80E2V2cluQ/rL4E/UAOo
        fIIV+t9qUCpQ2xoNlfR9YCuf44b49n4=
X-Google-Smtp-Source: ADUXVKKJPagO9BFn3OWOs2PdYW7aMbRXqWwHebO2MmL8lsBsra9de8/6AJqNqMgG8rDIQJyphVW2XA==
X-Received: by 2002:a63:6ecd:: with SMTP id j196-v6mr15043902pgc.12.1528733711109;
        Mon, 11 Jun 2018 09:15:11 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id y2-v6sm26253136pfk.82.2018.06.11.09.15.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 11 Jun 2018 09:15:10 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     corbet@lwn.net, joe@perches.com
Cc:     tom.saeger@oracle.com, changbin.du@intel.com,
        alexander.shishkin@linux.intel.com,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: Fix reference to stm.txt
Date:   Mon, 11 Jun 2018 10:15:08 -0600
Message-Id: <1528733708-9999-1-git-send-email-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Commit "1606f8d8e75b trace doc: convert trace/stm.txt to rst format"
changed stm.txt to stm.rst but references to it in other files have not
been modified, something that is corrected in this patch.

Reported-by: Joe Perches <joe@perches.com>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 Documentation/trace/coresight.txt | 2 +-
 Documentation/trace/intel_th.rst  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/trace/coresight.txt b/Documentation/trace/coresight.txt
index 1d74ad0202b6..efbc832146e7 100644
--- a/Documentation/trace/coresight.txt
+++ b/Documentation/trace/coresight.txt
@@ -426,5 +426,5 @@ root@genericarmv8:~#
 Details on how to use the generic STM API can be found here [2].
 
 [1]. Documentation/ABI/testing/sysfs-bus-coresight-devices-stm
-[2]. Documentation/trace/stm.txt
+[2]. Documentation/trace/stm.rst
 [3]. https://github.com/Linaro/perf-opencsd
diff --git a/Documentation/trace/intel_th.rst b/Documentation/trace/intel_th.rst
index 990f13265178..fdb34114ee20 100644
--- a/Documentation/trace/intel_th.rst
+++ b/Documentation/trace/intel_th.rst
@@ -38,7 +38,7 @@ description is at Documentation/ABI/testing/sysfs-bus-intel_th-devices-gth.
 
 STH registers an stm class device, through which it provides interface
 to userspace and kernelspace software trace sources. See
-Documentation/trace/stm.txt for more information on that.
+Documentation/trace/stm.rst for more information on that.
 
 MSU can be configured to collect trace data into a system memory
 buffer, which can later on be read from its device nodes via read() or
@@ -89,7 +89,7 @@ Quick example
 
 	$ echo 1 > /sys/bus/intel_th/devices/0-msc0/active
 
-# .. send data to master 33, see stm.txt for more details ..
+# .. send data to master 33, see stm.rst for more details ..
 # .. wait for traces to pile up ..
 # .. and stop the trace::
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

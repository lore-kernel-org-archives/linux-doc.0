Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 404C87D923
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 Oct 2019 17:58:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726602AbfJaR6j (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 31 Oct 2019 13:58:39 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:35550 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729117AbfJaR6j (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 31 Oct 2019 13:58:39 -0400
Received: by mail-pg1-f195.google.com with SMTP id c8so4540848pgb.2
        for <linux-doc@vger.kernel.org>; Thu, 31 Oct 2019 10:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/ws48OPfYIJsP3hLi0od0xxVO+NdaAYQZFQkL5nisiM=;
        b=ATidlEjEqD00UPJarL+ncmaSsGAlcuIP8YB2LTb+0EVSJWNqesZQj6dFeAV7iSzX91
         BvzrjMRoTBs2lfTwKEYXe1AaDvKWhphMavrmAx2ZYd0y/qHStcqHTKuY9klBNyRDp0j3
         q2YmpFczqJajz69+imTNDU0LtX4QTyHZXLV6dtzD+Ya50UY7DaX8YXNtRWGQaBopGBsx
         s8AtgTZTQZnO7FZ+f7A9fbcxsCQUnsTIY5Ba3i+Gxs/cfmQvb7hxQu035hpAq+jaakyJ
         4Vo1yK6PH210LLJPYdll0hlBzeYvNDkd3//aqYIpb++z5Xwas2SMkC0E0aBx9AUuY7Rx
         Sbnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/ws48OPfYIJsP3hLi0od0xxVO+NdaAYQZFQkL5nisiM=;
        b=NNFu74wJWpZtiLyc9NnDFgVJbf1ov5Sjdk0zQ1vGQLvfRacRYlkB1CMtA5Ch8rbiyy
         Ty4JGp6tomsMmQplOzlK29v7cgXUjGKaCah4E3qIObUc8YgyApKPzV3jYsbdDVnzyEYJ
         yWeS2aoOuEbMLv3RVrbl2g7uAPZpef92U/R1typNIZ0oO3vgpLmNl/WneF33TZlE1LmS
         jbjp+M0fJMdxkVelqLZxH958aDxcmy9AXXuQDkZv1J/UN+phz5VCiZlNZdXvKzSOQnL3
         cyYDy9zZ8PhYONNCQUVQPL+cPbr9HF70Ig13h4qRWalYi/0ERqSRnY5SMeYCSTdcRjWU
         rkyw==
X-Gm-Message-State: APjAAAWrgkLB0s/Y3P/Yey8e7NoTQPM44/Ndoman1+IzXoDTg/MAENnI
        82G0u5l3NFhxf/9dTVSfSklUCw==
X-Google-Smtp-Source: APXvYqxQs8ZQ5Ruv/C9/lnpJ42h8VwAa6x+pIpe8aXf0grM0GwA7KunaMBdVfcWHB/0EeZDApjFciA==
X-Received: by 2002:a63:65c6:: with SMTP id z189mr7889040pgb.433.1572544717693;
        Thu, 31 Oct 2019 10:58:37 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id c6sm4382210pfj.59.2019.10.31.10.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2019 10:58:37 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     corbet@lwn.net
Cc:     mike.leach@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-doc@vger.kernel.org
Subject: [PATCH 2/4] coresight: etm4x: docs: Update ABI doc for new sysfs etm4 attributes
Date:   Thu, 31 Oct 2019 11:58:32 -0600
Message-Id: <20191031175834.17548-3-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191031175834.17548-1-mathieu.poirier@linaro.org>
References: <20191031175834.17548-1-mathieu.poirier@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Mike Leach <mike.leach@linaro.org>

This updates the ABI document to reflect recent additions to the ETM4.X
driver sysfs interface.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
[Updated Date and KernelVersion fields]
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 .../testing/sysfs-bus-coresight-devices-etm4x | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x
index 9290010e973e..614874e2cf53 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x
@@ -282,6 +282,53 @@ Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(RW) Mask for all 8 virtual machine ID comparator value
 		registers (if implemented).
 
+What:		/sys/bus/coresight/devices/etm<N>/addr_exlevel_s_ns
+Date:		December 2019
+KernelVersion:	5.5
+Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
+Description:	(RW) Set the Exception Level matching bits for secure and
+		non-secure exception levels.
+
+What:		/sys/bus/coresight/devices/etm<N>/vinst_pe_cmp_start_stop
+Date:		December 2019
+KernelVersion:	5.5
+Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
+Description:	(RW) Access the start stop control register for PE input
+		comparators.
+
+What:		/sys/bus/coresight/devices/etm<N>/addr_cmp_view
+Date:		December 2019
+KernelVersion:	5.5
+Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
+Description:	(R) Print the current settings for the selected address
+		comparator.
+
+What:		/sys/bus/coresight/devices/etm<N>/sshot_idx
+Date:		December 2019
+KernelVersion:	5.5
+Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
+Description:	(RW) Select the single shot control register to access.
+
+What:		/sys/bus/coresight/devices/etm<N>/sshot_ctrl
+Date:		December 2019
+KernelVersion:	5.5
+Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
+Description:	(RW) Access the selected single shot control register.
+
+What:		/sys/bus/coresight/devices/etm<N>/sshot_status
+Date:		December 2019
+KernelVersion:	5.5
+Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
+Description:	(R) Print the current value of the selected single shot
+		status register.
+
+What:		/sys/bus/coresight/devices/etm<N>/sshot_pe_ctrl
+Date:		December 2019
+KernelVersion:	5.5
+Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
+Description:	(RW) Access the selected single show PE comparator control
+		register.
+
 What:		/sys/bus/coresight/devices/etm<N>/mgmt/trcoslsr
 Date:		April 2015
 KernelVersion:	4.01
-- 
2.17.1


Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6247D7D90D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 28 Oct 2019 17:37:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730790AbfJ1RhF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 28 Oct 2019 13:37:05 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45575 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725773AbfJ1RhF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Oct 2019 13:37:05 -0400
Received: by mail-wr1-f67.google.com with SMTP id q13so10784119wrs.12
        for <linux-doc@vger.kernel.org>; Mon, 28 Oct 2019 10:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=5e9SBnpRUamAh+I5HrYlGgS5LyU4NETekxC5h4r3LQA=;
        b=YKX7xlF/+96dr6LPc8LL8xdN3YYhEMgmVo5zozdhEbj6Tlv8LfhSYmYGzkHvqbHmhR
         p21VePlLvcptpmmmye04Y9NiqMAF9+uB5zEPbyXehcNqlrjRV8323PgJtN2sDadArWHh
         CcH7A0Kl0Qj6eVqg9ziqQyRof7QWtA7A5iXQq/T8q9gAWqfKZk0mmEhxhtK6+6TYYmLy
         TXg2W+qmTDxBG1U7vUAHjJWyDoMDB7Ufc/yGDUS2l7fSj2njsVn0b9v5NoAamqSFAFwW
         2Nbh1zgi3S/9zZHxmpsgu4RDk5zLQZskjqIytsOPIh6XDdPjsA3A1i4f0MfWVrDtKXKa
         +Cvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=5e9SBnpRUamAh+I5HrYlGgS5LyU4NETekxC5h4r3LQA=;
        b=YH1cc6gFV0gEIYBjo6LKuxsdcoGsBzurCl7e5vGkQsmfpU+Y0mGy9p7QV5SXCNbBrs
         lB3MaWOMC69aOI6OUJ/PT44i+BAA62sb2lXJlFJFqibXhlUOEqyAtLrmYZ8N5DgJvJbN
         zJfPlhmOaYdmyYRnqisjNDbO3B319yFk1s2Apgtq+MCd0sPTMu1glDvViBBy3a2XDDay
         YoWBihIYDPjrjL7BUMoxThA7E324F5xaf9faLFwdUbizqjpOQpbUfZarjeRBmvrGe682
         7qmK6q6rM25tYWr3sB6Gb/un7soqxucgyw1SNqroWV2S3WhwQ9kP4ZhZXVEskaoQHb0w
         pQNA==
X-Gm-Message-State: APjAAAUpJly6HQq8PINcgitNsqMobJQSNzigpDbBtuCmLytxJAmgl5F+
        JtGE8IBAsNqMgyvaEsFrS2s+TWA0Gy4=
X-Google-Smtp-Source: APXvYqzznjvuSs1Br8xsj7CAq70J24mIinmMbFKkXYrkbS6l9tzRFp04fz7Av1znWjjY0wXAbg/2PA==
X-Received: by 2002:adf:ecc7:: with SMTP id s7mr15834826wro.305.1572283773663;
        Mon, 28 Oct 2019 10:29:33 -0700 (PDT)
Received: from linaro.org ([2a00:23c5:6815:3901:a072:1d10:8dba:cbb])
        by smtp.gmail.com with ESMTPSA id r19sm14273295wrr.47.2019.10.28.10.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 10:29:33 -0700 (PDT)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-doc@vger.kernel.org, corbet@lwn.net
Cc:     mathieu.poirier@linaro.org, linux-arm-kernel@lists.infradead.org,
        coresight@lists.linaro.org, Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v4 2/4] coresight: etm4x: docs: Update ABI doc for new sysfs etm4 attributes
Date:   Mon, 28 Oct 2019 17:29:17 +0000
Message-Id: <20191028172919.19662-3-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191028172919.19662-1-mike.leach@linaro.org>
References: <20191028172919.19662-1-mike.leach@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This updates the ABI document to reflect recent additions to the ETM4.X
driver sysfs interface.

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 .../testing/sysfs-bus-coresight-devices-etm4x | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x
index 9290010e973e..112c50ae9986 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x
@@ -282,6 +282,53 @@ Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(RW) Mask for all 8 virtual machine ID comparator value
 		registers (if implemented).
 
+What:		/sys/bus/coresight/devices/etm<N>/addr_exlevel_s_ns
+Date:		August 2019
+KernelVersion:	5.4
+Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
+Description:	(RW) Set the Exception Level matching bits for secure and
+		non-secure exception levels.
+
+What:		/sys/bus/coresight/devices/etm<N>/vinst_pe_cmp_start_stop
+Date:		August 2019
+KernelVersion:	5.4
+Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
+Description:	(RW) Access the start stop control register for PE input
+		comparators.
+
+What:		/sys/bus/coresight/devices/etm<N>/addr_cmp_view
+Date:		August 2019
+KernelVersion:	5.4
+Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
+Description:	(R) Print the current settings for the selected address
+		comparator.
+
+What:		/sys/bus/coresight/devices/etm<N>/sshot_idx
+Date:		August 2019
+KernelVersion:	5.4
+Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
+Description:	(RW) Select the single shot control register to access.
+
+What:		/sys/bus/coresight/devices/etm<N>/sshot_ctrl
+Date:		August 2019
+KernelVersion:	5.4
+Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
+Description:	(RW) Access the selected single shot control register.
+
+What:		/sys/bus/coresight/devices/etm<N>/sshot_status
+Date:		August 2019
+KernelVersion:	5.4
+Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
+Description:	(R) Print the current value of the selected single shot
+		status register.
+
+What:		/sys/bus/coresight/devices/etm<N>/sshot_pe_ctrl
+Date:		August 2019
+KernelVersion:	5.4
+Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
+Description:	(RW) Access the selected single show PE comparator control
+		register.
+
 What:		/sys/bus/coresight/devices/etm<N>/mgmt/trcoslsr
 Date:		April 2015
 KernelVersion:	4.01
-- 
2.17.1


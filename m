Return-Path: <SRS0=kPt+=37=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4917BC352A3
	for <linux-doc@archiver.kernel.org>; Tue, 11 Feb 2020 10:58:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1855020848
	for <linux-doc@archiver.kernel.org>; Tue, 11 Feb 2020 10:58:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o9REiGwv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727956AbgBKK6Z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 11 Feb 2020 05:58:25 -0500
Received: from mail-wr1-f43.google.com ([209.85.221.43]:36615 "EHLO
        mail-wr1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727558AbgBKK6Z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Feb 2020 05:58:25 -0500
Received: by mail-wr1-f43.google.com with SMTP id z3so11758621wru.3
        for <linux-doc@vger.kernel.org>; Tue, 11 Feb 2020 02:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=M6xq/OxJSWfSTPvEoweukyF8MINoDGNxuW+L6ZQztPM=;
        b=o9REiGwvSPNR/g1Cq5hByCtYy8T9Rnf88hnGfwRNoSJKpw+DmpGOLV1vWzpSsPuWED
         GaHauWwmfpvL7QKBT2AG/NxVhxpzIQ6H5rtfp/RZScgYYJfV9lq0BtRQgJzMEgjiCkHO
         z61N6wQZ6jN9ewWiMyIkvg6kCv/2rOJnqL7DdBr7v5CXQBtTGEJ+FjkR1WpZ4pdLaJ6C
         Ou2ILlM0zKRPLuaJxuMnyM7lg0EtBZgnxVQAF24tUOsAFJE85a/GB/ceVjjEVU50fmTJ
         AH5vYkHvGyQSBrtzyz/mkYAG2aQuToPcsj0QBOZTVxHr1Urvqwmwt8BxYRff9kbd+QNR
         oBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=M6xq/OxJSWfSTPvEoweukyF8MINoDGNxuW+L6ZQztPM=;
        b=MhRvEC9qfvn5rQNSdZjNPy715wwSr8kmrRc+JDTbSPcI/JObTM8MsvXbxxDKH+lBi5
         79DnA6k1lH/5lJXgRVDZOj7cg0CfX7TfHCNFMbYU/IXXQXjrho9hK0m/4GxDp661offT
         FZIpoRKmaNa/1WeSYtSQC+cYEIv/bCA4ee+xT01QMfeDhxBYqrYkl6O1905FTcv1Rc50
         fAf8Tgkt9eyVpTmjGhv+XDSgbBePbMJGsrH0vZ9oYF4PRuZK17qGrIAHvi8gDUkc39tl
         CNdUNgJMKx4zCImgksIYtxBYr3yRoYxwO3i7lK6+krt2TI2RJ4AhlhSbXc8Dj+DGZdvT
         d55A==
X-Gm-Message-State: APjAAAUAU6g28hN7HBqEoCgHsoxoZrOW9CeoLoBkGu4enBUX7+8wip3W
        wznuxIy7mqcB0QoznGPWCmB6tF0LLeo=
X-Google-Smtp-Source: APXvYqxZhJedOIVtgpr6JvsCzPcDmeNJnY75P/JUMOwUUZ2QqThZYaJLjAdCNuPyV0wLn2/l3jy/Eg==
X-Received: by 2002:a5d:4446:: with SMTP id x6mr7838462wrr.312.1581418702081;
        Tue, 11 Feb 2020 02:58:22 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:a1cf:b00b:5683:ed40])
        by smtp.gmail.com with ESMTPSA id g21sm3171291wmh.17.2020.02.11.02.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 02:58:21 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org
Cc:     mathieu.poirier@linaro.org, suzuki.poulose@arm.com,
        Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v4 6/6] coresight: docs: Add information about the topology representations.
Date:   Tue, 11 Feb 2020 10:58:08 +0000
Message-Id: <20200211105808.27884-7-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211105808.27884-1-mike.leach@linaro.org>
References: <20200211105808.27884-1-mike.leach@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update the CoreSight documents to describe the new connections directory
and the links between CoreSight devices in this directory.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 .../trace/coresight/coresight-ect.rst         |  5 +-
 Documentation/trace/coresight/coresight.rst   | 85 +++++++++++++++++++
 2 files changed, 89 insertions(+), 1 deletion(-)

diff --git a/Documentation/trace/coresight/coresight-ect.rst b/Documentation/trace/coresight/coresight-ect.rst
index 067cee91c857..3539af895832 100644
--- a/Documentation/trace/coresight/coresight-ect.rst
+++ b/Documentation/trace/coresight/coresight-ect.rst
@@ -71,7 +71,7 @@ capable of generating or using trigger signals.::
 
   >$ ls /sys/bus/coresight/devices/etm0/cti_cpu0
   channels  ctmid  enable  nr_trigger_cons mgmt  power  regs  subsystem
-  triggers0 triggers1  uevent
+  connections triggers0 triggers1  uevent
 
 *Key file items are:-*
    * ``enable``: enables/disables the CTI.
@@ -84,6 +84,9 @@ capable of generating or using trigger signals.::
    * ``channels``: Contains the channel API - CTI main programming interface.
    * ``regs``: Gives access to the raw programmable CTI regs.
    * ``mgmt``: the standard CoreSight management registers.
+   * ``connections``: Links to connected *CoreSight* devices. The number of
+     links can be 0 to ``nr_trigger_cons``. Actual number given by ``nr_links``
+     in this directory.
 
 
 triggers<N> directories
diff --git a/Documentation/trace/coresight/coresight.rst b/Documentation/trace/coresight/coresight.rst
index 108600ee1e12..0b73acb44efa 100644
--- a/Documentation/trace/coresight/coresight.rst
+++ b/Documentation/trace/coresight/coresight.rst
@@ -241,6 +241,91 @@ to the newer scheme, to give a confirmation that what you see on your
 system is not unexpected. One must use the "names" as they appear on
 the system under specified locations.
 
+Topology Representation
+-----------------------
+
+Each CoreSight component has a ``connections`` directory which will contain
+links to other CoreSight components. This allows the user to explore the trace
+topology and for larger systems, determine the most appropriate sink for a
+given source. The connection information can also be used to establish
+which CTI devices are connected to a given component. This directory contains a
+``nr_links`` attribute detailing the number of links in the directory.
+
+For an ETM source, in this case ``etm0`` on a Juno platform, a typical
+arrangement will be::
+
+  linaro-developer:~# ls - l /sys/bus/coresight/devices/etm0/connections
+  <file details>  cti_cpu0 -> ../../../23020000.cti/cti_cpu0
+  <file details>  nr_links
+  <file details>  out:0 -> ../../../230c0000.funnel/funnel2
+
+Following the out port to ``funnel2``::
+
+  linaro-developer:~# ls -l /sys/bus/coresight/devices/funnel2/connections
+  <file details> in:0 -> ../../../23040000.etm/etm0
+  <file details> in:1 -> ../../../23140000.etm/etm3
+  <file details> in:2 -> ../../../23240000.etm/etm4
+  <file details> in:3 -> ../../../23340000.etm/etm5
+  <file details> nr_links
+  <file details> out:0 -> ../../../20040000.funnel/funnel0
+
+And again to ``funnel0``::
+
+  linaro-developer:~# ls -l /sys/bus/coresight/devices/funnel0/connections
+  <file details> in:0 -> ../../../220c0000.funnel/funnel1
+  <file details> in:1 -> ../../../230c0000.funnel/funnel2
+  <file details> nr_links
+  <file details> out:0 -> ../../../20010000.etf/tmc_etf0
+
+Finding the first sink ``tmc_etf0``. This can be used to collect data
+as a sink, or as a link to propagate further along the chain::
+
+  linaro-developer:~# ls -l /sys/bus/coresight/devices/tmc_etf0/connections
+  <file details> cti_sys0 -> ../../../20020000.cti/cti_sys0
+  <file details> in:0 -> ../../../20040000.funnel/funnel0
+  <file details> nr_links
+  <file details> out:0 -> ../../../20150000.funnel/funnel4
+
+via ``funnel4``::
+
+  linaro-developer:~# ls -l /sys/bus/coresight/devices/funnel4/connections
+  <file details> in:0 -> ../../../20010000.etf/tmc_etf0
+  <file details> in:1 -> ../../../20140000.etf/tmc_etf1
+  <file details> nr_links
+  <file details> out:0 -> ../../../20120000.replicator/replicator0
+
+and a ``replicator0``::
+
+  linaro-developer:~# ls -l /sys/bus/coresight/devices/replicator0/connections
+  <file details> in:0 -> ../../../20150000.funnel/funnel4
+  <file details> nr_links
+  <file details> out:0 -> ../../../20030000.tpiu/tpiu0
+  <file details> out:1 -> ../../../20070000.etr/tmc_etr0
+
+Arriving at the final sink in the chain, ``tmc_etr0``::
+
+  linaro-developer:~# ls -l /sys/bus/coresight/devices/tmc_etr0/connections
+  <file details> cti_sys0 -> ../../../20020000.cti/cti_sys0
+  <file details> in:0 -> ../../../20120000.replicator/replicator0
+  <file details> nr_links
+
+As described below, when using sysfs it is sufficient to enable a sink and
+a source for successful trace. The framework will correctly enable all
+intermediate links as required.
+
+Note: ``cti_sys0`` appears in two of the connections lists above.
+CTIs can connect to multiple devices and are arranged in a star topology
+via the CTM. See (:doc:`coresight-ect`) [#fourth]_ for further details.
+Looking at this device we see 4 connections::
+
+  linaro-developer:~# ls -l /sys/bus/coresight/devices/cti_sys0/connections
+  <file details> nr_links
+  <file details> stm0 -> ../../../20100000.stm/stm0
+  <file details> tmc_etf0 -> ../../../20010000.etf/tmc_etf0
+  <file details> tmc_etr0 -> ../../../20070000.etr/tmc_etr0
+  <file details> tpiu0 -> ../../../20030000.tpiu/tpiu0
+
+
 How to use the tracer modules
 -----------------------------
 
-- 
2.17.1


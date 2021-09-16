Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3FFCC433EF
	for <linux-doc@archiver.kernel.org>; Thu, 16 Sep 2021 09:00:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8CEAC61164
	for <linux-doc@archiver.kernel.org>; Thu, 16 Sep 2021 09:00:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235766AbhIPJB2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Sep 2021 05:01:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:36296 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235425AbhIPJBX (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 16 Sep 2021 05:01:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B3A6A61288;
        Thu, 16 Sep 2021 09:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631782802;
        bh=ODO2r6fXlSuBc5pJU0V029ak3DPbM/oaWIHhdM+QTvc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IO9qWLn7SSsnCwDewKGt2zLMbCxlfhfZFhbzbIeXbROKWOldKiQy40kvsN8bEdpoA
         ECUxCrPefTaNGarYXhtV3GGEkLb2mSlk8Q0vE5Z1w5pPbE68sSe/nu11fCBmsVTLUE
         fSFrZu7hzMQMyM1Ohw8s/M0WClGTUfZL/EeydU6PqxUqvcxR0++tafceHfddfjGAFD
         G7LwcAHQetQQq3rXqeJAEu8XD2hyLeje1GrC3TamcRyFz1kBW/ZC0Jg8EOJZ/wt/D5
         Ol8PTm3FEzTCBawugdrMj3Qfit0JC3MeP8XZXX9cbSP9S+2DWoalM5U/2ZhDHvkYQ/
         muqIQyDQmiHWg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mQnFQ-001qkW-Ut; Thu, 16 Sep 2021 11:00:00 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 15/30] ABI: sysfs-bus-soundwire-master: use wildcards on What definitions
Date:   Thu, 16 Sep 2021 10:59:42 +0200
Message-Id: <eb62c19ce92c0dc1a50eb57c1052866256250644.1631782432.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631782432.git.mchehab+huawei@kernel.org>
References: <cover.1631782432.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

An "N" upper letter is not a wildcard, nor can easily be identified
by script, specially since the USB sysfs define things like.
bNumInterfaces. Use, instead, <N>, in order to let script/get_abi.pl
to convert it into a Regex.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../ABI/testing/sysfs-bus-soundwire-master    | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-soundwire-master b/Documentation/ABI/testing/sysfs-bus-soundwire-master
index 46ef038d8722..d2342911ffbb 100644
--- a/Documentation/ABI/testing/sysfs-bus-soundwire-master
+++ b/Documentation/ABI/testing/sysfs-bus-soundwire-master
@@ -1,13 +1,13 @@
-What:		/sys/bus/soundwire/devices/sdw-master-N/revision
-		/sys/bus/soundwire/devices/sdw-master-N/clk_stop_modes
-		/sys/bus/soundwire/devices/sdw-master-N/clk_freq
-		/sys/bus/soundwire/devices/sdw-master-N/clk_gears
-		/sys/bus/soundwire/devices/sdw-master-N/default_col
-		/sys/bus/soundwire/devices/sdw-master-N/default_frame_rate
-		/sys/bus/soundwire/devices/sdw-master-N/default_row
-		/sys/bus/soundwire/devices/sdw-master-N/dynamic_shape
-		/sys/bus/soundwire/devices/sdw-master-N/err_threshold
-		/sys/bus/soundwire/devices/sdw-master-N/max_clk_freq
+What:		/sys/bus/soundwire/devices/sdw-master-<N>/revision
+		/sys/bus/soundwire/devices/sdw-master-<N>/clk_stop_modes
+		/sys/bus/soundwire/devices/sdw-master-<N>/clk_freq
+		/sys/bus/soundwire/devices/sdw-master-<N>/clk_gears
+		/sys/bus/soundwire/devices/sdw-master-<N>/default_col
+		/sys/bus/soundwire/devices/sdw-master-<N>/default_frame_rate
+		/sys/bus/soundwire/devices/sdw-master-<N>/default_row
+		/sys/bus/soundwire/devices/sdw-master-<N>/dynamic_shape
+		/sys/bus/soundwire/devices/sdw-master-<N>/err_threshold
+		/sys/bus/soundwire/devices/sdw-master-<N>/max_clk_freq
 
 Date:		April 2020
 
-- 
2.31.1


Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE683C433B4
	for <linux-doc@archiver.kernel.org>; Wed, 28 Apr 2021 10:55:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9DB9D6008E
	for <linux-doc@archiver.kernel.org>; Wed, 28 Apr 2021 10:55:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239585AbhD1Kzq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Apr 2021 06:55:46 -0400
Received: from u164.east.ru ([195.170.63.164]:53132 "EHLO u164.east.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239583AbhD1Kzq (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 28 Apr 2021 06:55:46 -0400
X-Greylist: delayed 367 seconds by postgrey-1.27 at vger.kernel.org; Wed, 28 Apr 2021 06:55:45 EDT
Received: by u164.east.ru (Postfix, from userid 1000)
        id B423CCFDB3; Wed, 28 Apr 2021 13:48:51 +0300 (MSK)
Date:   Wed, 28 Apr 2021 13:48:51 +0300
From:   Anatoly Pugachev <matorola@gmail.com>
To:     linux-doc@vger.kernel.org
Cc:     Linux Kernel list <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH] docs: correct URL to bios and kernel developer's guide
Message-ID: <20210428104851.GA10572@u164.east.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

correct URL to bios and kernel developer's guide on amd.com site

Signed-off-by: Anatoly Pugachev <matorola@gmail.com>
---
 Documentation/ABI/testing/sysfs-devices-system-cpu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-devices-system-cpu b/Documentation/ABI/testing/sysfs-devices-system-cpu
index 0eee30b27ab6..f2fff6020439 100644
--- a/Documentation/ABI/testing/sysfs-devices-system-cpu
+++ b/Documentation/ABI/testing/sysfs-devices-system-cpu
@@ -285,7 +285,7 @@ Description:        Disable L3 cache indices

                All AMD processors with L3 caches provide this functionality.
                For details, see BKDGs at
-               http://developer.amd.com/documentation/guides/Pages/default.aspx
+               https://www.amd.com/en/support/tech-docs?keyword=bios+kernel


 What:          /sys/devices/system/cpu/cpufreq/boost
--
2.31.1

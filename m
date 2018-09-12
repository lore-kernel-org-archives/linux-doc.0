Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B50A07D87A
	for <lwn-linux-doc@archive.lwn.net>; Wed, 12 Sep 2018 14:45:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbeILTui (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 12 Sep 2018 15:50:38 -0400
Received: from imap.cs.msu.ru ([188.44.42.39]:53604 "EHLO mail.cs.msu.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726819AbeILTuh (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 12 Sep 2018 15:50:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=altlinux.org; s=dkim; h=Subject:References:In-Reply-To:Message-Id:Date:Cc:
        To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=CWsqSmIMPWBFvVvKCoNum4PZxSKGuZ0Mr0CV1A/MXT4=; b=MXXP0j2qezdg0/U4Ls/R0fBozV
        wdnSz90n97BZLfaAdzGpt998izY4XLjEI1VpU86sRlJ1QrApFi/YTE7/VtFLUysX/zAzYTx9RZo+u
        YEMSdEJDxR+PaF7ACSOO7fG7awDbaiSkmKddnzgMISPRlNSxo4RX10UuzQxO5ehQ8MvbjGqxvhYfN
        ZhUdR3g6GZfjRAQtJ9QUUM80koQ+XmU9L8YscsuBP3HVbdd+WnsK4PCc5YLvos4gRvYXlkKw7Q7v1
        vR0NdE+4vxYHpkAOSPPbGKApU2QMrXBd48OaMe7PHnKlVj+Aj4QzPkIIHunUhJ9hHC7a4He3c4969
        0kM0Q87g==;
Received: from [185.6.174.98] (port=33924 helo=portlab.office.basealt.ru)
        by mail.cs.msu.ru with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.91 (FreeBSD))
        (envelope-from <vseleznv@altlinux.org>)
        id 1g06Om-000Ovv-Om; Wed, 12 Sep 2018 17:45:45 +0300
From:   "Vladimir D. Seleznev" <vseleznv@altlinux.org>
To:     linux-pm@vger.kernel.org, linux-doc@vger.kernel.org,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     vseleznv@altlinux.org
Date:   Wed, 12 Sep 2018 17:45:36 +0300
Message-Id: <20180912144536.21091-1-vseleznv@altlinux.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180901045115.18338-1-vseleznv@altlinux.org>
References: <20180901045115.18338-1-vseleznv@altlinux.org>
X-SA-Exim-Connect-IP: 185.6.174.98
X-SA-Exim-Mail-From: vseleznv@altlinux.org
Subject: [PATCH] Documentation: fix image_size default value
X-SA-Exim-Version: 4.2
X-SA-Exim-Scanned: Yes (on mail.cs.msu.ru)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This commit updates the default value of /sys/power/image_size in
the documentation.

Since ac5c24ec1e983313ef0015258fba6f630e54e7cn the `image_size' value is
set to about 2/5 of RAM, according to kernel/power/snapshot.c:

	image_size = ((totalram_pages * 2) / 5) * PAGE_SIZE;

but this change was not reflected everywhere in the documentation.

Signed-off-by: Vladimir D. Seleznev <vseleznv@altlinux.org>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
 Documentation/ABI/testing/sysfs-power | 2 +-
 Documentation/power/swsusp.txt        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-power b/Documentation/ABI/testing/sysfs-power
index 2f813d644c69..18b7dc929234 100644
--- a/Documentation/ABI/testing/sysfs-power
+++ b/Documentation/ABI/testing/sysfs-power
@@ -99,7 +99,7 @@ Description:
 		this file, the suspend image will be as small as possible.
 
 		Reading from this file will display the current image size
-		limit, which is set to 500 MB by default.
+		limit, which is set to around 2/5 of available RAM by default.
 
 What:		/sys/power/pm_trace
 Date:		August 2006
diff --git a/Documentation/power/swsusp.txt b/Documentation/power/swsusp.txt
index cc87adf44c0a..236d1fb13640 100644
--- a/Documentation/power/swsusp.txt
+++ b/Documentation/power/swsusp.txt
@@ -56,7 +56,7 @@ If you want to limit the suspend image size to N bytes, do
 
 echo N > /sys/power/image_size
 
-before suspend (it is limited to 500 MB by default).
+before suspend (it is limited to around 2/5 of available RAM by default).
 
 . The resume process checks for the presence of the resume device,
 if found, it then checks the contents for the hibernation image signature.
-- 
2.17.1


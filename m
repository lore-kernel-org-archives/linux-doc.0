Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 190D7C2B9F4
	for <linux-doc@archiver.kernel.org>; Thu, 17 Jun 2021 10:50:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC159613CA
	for <linux-doc@archiver.kernel.org>; Thu, 17 Jun 2021 10:50:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbhFQKw1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Jun 2021 06:52:27 -0400
Received: from mail1.bemta26.messagelabs.com ([85.158.142.114]:48315 "EHLO
        mail1.bemta26.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229716AbhFQKw1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Jun 2021 06:52:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
        s=170520fj; t=1623927018; i=@fujitsu.com;
        bh=EqB+5W6KRZK1HGwbng4Mnfm/myR2ESZ/Gdx+BFt+8XM=;
        h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
        b=th8LtlM1tbP7i4TFyiKqFbgLqynat/ZJLJG7JW65EeRXyISv9rKYPQyvrnMPdtJNH
         bU626mUAZj97WK1dD1MRVpy266G3htkd4XadReA57ROKzy+7itkmhV1KRZfkuI5EBz
         rKZJRfTXKKOhE8CCnuZrTH8Fmyv1KxFE/cLQOPPpwOV1MvY9vdP5tLPKmDM7b5jHNU
         Kr/CHjXODiKrfL0+dGqzD+Br+RNkUV+fn5MZCRuaG0qFokXibgPmwNGIGyMjHrLSJZ
         lmivT1Y5K7acENt9nERpb8k8wXEGc0EpbEGOrWbRGgcome06Xf/VtDMiZadZBGnLbZ
         c7+toicPKnOvg==
Received: from [100.113.4.24] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-b.eu-central-1.aws.symcld.net id A3/00-38619-AE82BC06; Thu, 17 Jun 2021 10:50:18 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MRovtK43S
  Cwf4PKhYL25awODB6fN4kF8AYxZqZl5RfkcCa8XlmL1PBWu6K5otvWBoYz3B2MXJyCAl0M0ks
  XaHaxcgFZO9hlFi4Yg0TSIJNQFPiWecCZhBbREBeorPzNVicWUBdYvmkX2C2sECAxOmzDewgN
  ouAqsTCWf9ZQWxeAQ+JHfuPsIHYEgIKElMevmeGiAtKnJz5hAVijoTEwRcvmCFqFCUudXxjhL
  ArJGbM2MY2gZF3FpKWWUhaFjAyrWK0TCrKTM8oyU3MzNE1NDDQNTQ01jXXNTI10kus0k3SSy3
  VTU7NKylKBMrqJZYX6xVX5ibnpOjlpZZsYgSGV0oh+58djNdff9A7xCjJwaQkyjv7/akEIb6k
  /JTKjMTijPii0pzU4kOMMhwcShK8IsCAFRIsSk1PrUjLzAGGOkxagoNHSYTXSh0ozVtckJhbn
  JkOkTrFqCglzvtWDSghAJLIKM2Da4PF1yVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwhDbeT
  LzSuCmvwJazAS0uE3oFMjikkSElFQD0wyDhNg10XuPtnwL32yZ2eNUOWVFwMKjnxKCPy+4fXx
  vIv/URwJrWl4bGqfHfhDJtvmo+vuWM099p+sttwDJZTvmeLfuun3peEb3OfEjM51S/yxjW2sm
  u+Sf4ew5KQ5bU0t09WJe3rFJrqlv+Wkhv2d9X8uftNx3p/ce5TW42sw48frBr8smcQT6bd7xg
  d9anPXbvoVeV95HKe/7qiZYtsYguq2lPX35LtUgvRTB9avlLlryPBb66Fliu+XYvpLpGyYyaF
  Tt1U++xeh21u/L3BnOMT4Mv5rZcg61xzkEHchrZjTWWdhsaSye/OiBkeb3HSG+3x6tFdtdF5u
  75LXYBqu/V6Rm1/3SeKrgdPeEmxJLcUaioRZzUXEiAG1gd50qAwAA
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-12.tower-248.messagelabs.com!1623927018!2104!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20890 invoked from network); 17 Jun 2021 10:50:18 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-12.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jun 2021 10:50:18 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
        by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15HAoFM8010186
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
        for <linux-doc@vger.kernel.org>; Thu, 17 Jun 2021 11:50:17 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 17 Jun 2021 11:50:13 +0100
From:   Yang Xu <xuyang2018.jy@fujitsu.com>
To:     <linux-doc@vger.kernel.org>
CC:     Yang Xu <xuyang2018.jy@fujitsu.com>
Subject: [PATCH] admin-guide/cputopology.rst: Remove non-existed cpu-hotplug.txt
Date:   Thu, 17 Jun 2021 18:45:32 +0800
Message-ID: <1623926732-2167-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Since kernel commit ff58fa7f556c ("Documentation: Update CPU hotplug and move it to core-api"),
cpu_hotplug.txt has been removed. We should update it in here.

Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 Documentation/admin-guide/cputopology.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/cputopology.rst b/Documentation/admin-guide/cputopology.rst
index b90dafcc8237..09efbde11478 100644
--- a/Documentation/admin-guide/cputopology.rst
+++ b/Documentation/admin-guide/cputopology.rst
@@ -135,9 +135,9 @@ source for the output is in brackets ("[]").
 		[NR_CPUS-1]
 
     offline:	CPUs that are not online because they have been
-		HOTPLUGGED off (see cpu-hotplug.txt) or exceed the limit
-		of CPUs allowed by the kernel configuration (kernel_max
-		above). [~cpu_online_mask + cpus >= NR_CPUS]
+		HOTPLUGGED off or exceed the limit of CPUs allowed by the
+		kernel configuration (kernel_max above).
+		[~cpu_online_mask + cpus >= NR_CPUS]
 
     online:	CPUs that are online and being scheduled [cpu_online_mask]
 
@@ -173,5 +173,5 @@ online.)::
        possible: 0-127
         present: 0-3
 
-See cpu-hotplug.txt for the possible_cpus=NUM kernel start parameter
-as well as more information on the various cpumasks.
+See Documentation/core-api/cpu_hotplug.rst for the possible_cpus=NUM
+kernel start parameter as well as more information on the various cpumasks.
-- 
2.23.0


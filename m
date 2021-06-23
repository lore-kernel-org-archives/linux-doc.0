Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADC2CC2B9F4
	for <linux-doc@archiver.kernel.org>; Wed, 23 Jun 2021 01:38:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 89B9A61375
	for <linux-doc@archiver.kernel.org>; Wed, 23 Jun 2021 01:38:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbhFWBkR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 22 Jun 2021 21:40:17 -0400
Received: from mail1.bemta25.messagelabs.com ([195.245.230.3]:11765 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229769AbhFWBkR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Jun 2021 21:40:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
        s=170520fj; t=1624412279; i=@fujitsu.com;
        bh=qIMVxIz7odvjcWgsM3liSH5kZGjYvSgPsxum6XKB7GY=;
        h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
        b=SlXihESmfdzbZ+06EOjdvBnRfD8fIOyoGe9mgyuThUTSd/r3fdIOsZwCOKhjmvekL
         ErVUGkui+hcihn8qz0dEfOjweYS+MZtDa8nN+Kt0J+bLZT1Td4zt51gFS9NeXhuWah
         jOSypz/f55Z6aw+R1uVkMmfRsYyKA1YDak2jfVhE+PthoHPG3zV7uhOxORCqMZF7K+
         7SyzCqfUJ0zMQ+plGXsbq49Q4EZaIthcC2NL6vA6LrnJCcv00aDdRdW0SuAPieWHC/
         2vP50JgbffcXRPiT0/oNM3fkpTfegjWF4pEkvde2ZfPHStId5IuueQEtAbKoWlNU5R
         Mo3B2mtfd9W5g==
Received: from [100.112.192.137] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-a.eu-west-1.aws.symcld.net id 63/CF-11164-67092D06; Wed, 23 Jun 2021 01:37:58 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRWlGSWpSXmKPExsViZ8MRqls64VK
  CwaHvWhZz1q9hs5h2cRKzxZMD7YwWC9uWsFi8/9TJ5MDqsWlVJ5vHu3Pn2D1OzPjN4rG4bzKr
  x+dNcgGsUayZeUn5FQmsGSs3TWYvWMtdcWjxG9YGxjOcXYxcHEICrxklPu7Zxgzh7GGUeH9nL
  VMXIycHm4CmxLPOBcwgtoiAvETTl0fsIEXMAlOBihY/YQRJCAsESuzftxWsgUVAVeL2hRXsID
  avgKfEr8NnWUFsCQEFiSkP3zNDxAUlTs58wgJiMwtISBx88YIZokZR4lLHN0YIu0JixoxtbBM
  YeWchaZmFpGUBI9MqRoukosz0jJLcxMwcXUMDA11DQyNdQ0sgNjLTS6zSTdRLLdUtTy0u0TXU
  Sywv1iuuzE3OSdHLSy3ZxAgM2JSCA3U7GB+8/qB3iFGSg0lJlPd6+6UEIb6k/JTKjMTijPii0
  pzU4kOMMhwcShK8y/qAcoJFqempFWmZOcDogUlLcPAoifD29QKleYsLEnOLM9MhUqcYFaXEeV
  +D9AmAJDJK8+DaYBF7iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iwr0k/0BSezLwSuOmvgBY
  zAS1W+H0RZHFJIkJKqoGpwyTc6/Th+RtC876f6+Y7K/DTV6W5pP9M3O+6o7FcHr/rljUKvZvV
  5xPl9/isiv3UE9Fcyx69/Djnc+/e8ju7GQ6vvppY9/3VtlklUxI5r7U6S9vp33z/58CXNQYP7
  fzsnwq9Xf9i3synLxT37RNqKer49MpyW5aScOXFJEb5yTKvrtxnV2DnWy0c2VcudCyrfUbCNB
  dtO8t3nLeP63qsfZjAuNlynssLh3pv5lB/yfrTyx4r7/3x5HLFqQpnJYkph/6oFb14d/qh6vW
  d1kKiIY+m1B0MWFplELbXeYH6JcvH3nt8dO5/jmW/qmn8sGdC5t5dfnKFcRzTJGLFLu7f1TRR
  KF1lf6vE1vvVO5WklFiKMxINtZiLihMBzie+TVMDAAA=
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-8.tower-267.messagelabs.com!1624412277!191883!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12817 invoked from network); 23 Jun 2021 01:37:57 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-8.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Jun 2021 01:37:57 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
        by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15N1bXw6015321
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
        Wed, 23 Jun 2021 02:37:33 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Wed, 23 Jun 2021 02:37:29 +0100
From:   Yang Xu <xuyang2018.jy@fujitsu.com>
To:     <akpm@linux-foundation.org>
CC:     <mchehab+samsung@kernel.org>, <bigeasy@linutronix.de>,
        <corbet@lwn.net>, <linux-doc@vger.kernel.org>,
        Yang Xu <xuyang2018.jy@fujitsu.com>
Subject: [RESEND] admin-guide/cputopology.rst: Remove non-existed cpu-hotplug.txt
Date:   Wed, 23 Jun 2021 09:37:48 +0800
Message-ID: <1624412269-13155-1-git-send-email-xuyang2018.jy@fujitsu.com>
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
index b90dafcc8237..cc28b1a16371 100644
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


Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 836EDC32771
	for <linux-doc@archiver.kernel.org>; Thu, 29 Sep 2022 00:25:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233235AbiI2AZM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Sep 2022 20:25:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233350AbiI2AZI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Sep 2022 20:25:08 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB1142AC57
        for <linux-doc@vger.kernel.org>; Wed, 28 Sep 2022 17:25:05 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id n10so22083586wrw.12
        for <linux-doc@vger.kernel.org>; Wed, 28 Sep 2022 17:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=z1ygdZwW7ZMPvazhzZFrvbRpuwFWoXGDK8RmI0UsUoU=;
        b=S2RKLmUnQy3TXM/lvIVIW1mn9EV/n7twX1uZJvKc37XLYFxv2sgtuR+ROHPErCdN/b
         4WqpM+vb3QFtUTV0//b7DWIIgveXqFfht/GUCMFjPa8b9qps0faRHGzLFNHvJbKw2mze
         yDHfR79hQJNPiaAV+CtFpSPJloyklFoDGHCGUYMvxPGfRosb4PikdNT4+vsdH8CvGqWc
         ytD+605wZ5V+6XYpim2cGBVzjDeuqH5iTYm4M0Z78aBOTh60O7ucfm78IZ42OoCy537r
         b7oL9aU0sTmWcvUwQwyFI3wDQKy0O+lGxWLrWo+8160U0gFGrfZx0+w+5dD0NQxyGOAB
         RI2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=z1ygdZwW7ZMPvazhzZFrvbRpuwFWoXGDK8RmI0UsUoU=;
        b=DcyBEqeVi61XNyYZm1FOppB/6D5YCw7WR6OaQUd/m8oUXTJ3f1RUgZblyzhKORyPRy
         BeZskR4pymi2ZpuacVeqmsL/arLN7EaSt0D8R4G2LgCaoT08VG4gA/E+wVwgMOPjZbHB
         xroltIm1gjcxt/5D73O+xiFRbWUG8D/lHPx1R3lRjvd4DDt+SKHhJBGmXJNvQGKpl+PW
         cUZ/fdUzLT8JGE4oIkPCDzjruetF3Nh9PiN+dEssFEE81RlhncNqQrl1DPvtXgnI2Ypf
         LtoJqLIQ8HY5SftkRVhajU39H2F3ZPrZwyHmWDTtC0GAOWZySvZGVogwqMnjaiHFHSiF
         HLFg==
X-Gm-Message-State: ACrzQf3CdIqKGafvyIdQaRnIMJxTPQsfwmFm7I/KQykHqpcuZdpE84D3
        wx/bctXyzuMqBT3tm9ImmwSrLw==
X-Google-Smtp-Source: AMsMyM5bVBQYhxnCnwEuIYU6x7uuP0dVbd0IhrEs+tf4kmv5TVRCEGaAaPaUmFtog/99yUhzQf6dsg==
X-Received: by 2002:a5d:4dd1:0:b0:228:e3c3:67a with SMTP id f17-20020a5d4dd1000000b00228e3c3067amr247455wru.411.1664411103802;
        Wed, 28 Sep 2022 17:25:03 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id t187-20020a1c46c4000000b003b4a699ce8esm3033841wma.6.2022.09.28.17.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 17:25:03 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     corbet@lwn.net, linux@leemhuis.info,
        konstantin@linuxfoundation.org, krzysztof.kozlowski@linaro.org,
        linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v2 1/2] get_maintainer: Describe supporters and maintainers as required email recipients
Date:   Thu, 29 Sep 2022 01:24:59 +0100
Message-Id: <20220929002500.283481-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929002500.283481-1-bryan.odonoghue@linaro.org>
References: <20220929002500.283481-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The output of get_maintainer.pl doesn't make clear that a supporter is a
type of maintainer who should be mailed when generating a patch.

In various places in the documentation we make reference to the necessity
to remember to include the appropriate maintainers when sending your patch
but, we confusingly don't call out supporters as maintainers in our
automation utility.

Fix that up now by having get_maintainers.pl print 'maintainer[volunteer]'
or 'maintainer[supporter]'.

Suggested-by: Thorsten Leemhuis <linux@leemhuis.info>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 scripts/get_maintainer.pl | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
index ab123b498fd9b..f1a081806bf82 100755
--- a/scripts/get_maintainer.pl
+++ b/scripts/get_maintainer.pl
@@ -1283,9 +1283,9 @@ sub get_maintainer_role {
 
     $role = lc($role);
     if      ($role eq "supported") {
-	$role = "supporter";
+	$role = "maintainer[supporter]";
     } elsif ($role eq "maintained") {
-	$role = "maintainer";
+	$role = "maintainer[volunteer]";
     } elsif ($role eq "odd fixes") {
 	$role = "odd fixer";
     } elsif ($role eq "orphan") {
-- 
2.37.3


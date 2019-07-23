Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D07A77D919
	for <lwn-linux-doc@archive.lwn.net>; Tue, 23 Jul 2019 06:14:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388178AbfGWGOx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 23 Jul 2019 02:14:53 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:39929 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388177AbfGWGOx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 Jul 2019 02:14:53 -0400
Received: by mail-pg1-f193.google.com with SMTP id u17so18863083pgi.6
        for <linux-doc@vger.kernel.org>; Mon, 22 Jul 2019 23:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pE9tUu3P/8w1bftggmV11VxGbS0rl+eqvKACn21icvM=;
        b=ukFG103PF/bL7cLvjS/DEUm8Y+TFfzbryVSM7lnY7E2JAgqNadFQXZ+zzONmjxQRvN
         /UNtFxcDJE9E6GT1fFhmaNEdT0U6LY+fM7OLyuzdFbiF9pq/AOtrPPYgpCD7pQyMpqT8
         RxNXI3sOAH+3hgE3B2gEyn6lDVa9opE8HSLJBn14tv10YYA8aPxKAtF8dkorCTcbJOLV
         JO7eYBtRjWSkQ5J09nJfN2iaEb1vbuaov0kgzMGIN6hiJzic3uaEe2jgeHQrAJIqdUZn
         DjqcHIFUYDCeqAjsTvjUIo5ZGlM7ySIuaLaeWa7YvtT2/mQ9Y+PamXkRp5Yyii2rH4zi
         ipuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pE9tUu3P/8w1bftggmV11VxGbS0rl+eqvKACn21icvM=;
        b=aR1m2WBEQBBXp+gcHsF/TxgoOcNU60FYyeWlPl58z9aDcizdpC8b/TvF/VTsBxC3bi
         TytB/FTRc06zIN36Mq9kLyCPE+J/WjfICgAVYd2TZ3eL8vNrG9/V9gPlvMiysnWwldzx
         2Hr51JPJHUyJJiY3DHAShqt0MoVtPRPCSh2kXJB9JOCNCZ3Xw85TrypbvhLN3D3suZqJ
         Kvfq8NZAKxy3XCVCvm+aH272Byl8O6XbQIs9pFZcyyDupbXWleX/zGVRYrM3kINcGcnL
         wY9i4QW8sGJD5ZhDGtUsj1H4o0QLkOpPFSlHm4ff+VhO3IM0Rzh5iTXsK6splRJ5NB0t
         D6MQ==
X-Gm-Message-State: APjAAAUaTiPZ2qaEg34S1QBol27Li0q63093jiOkbFYeXw+0eoRtUAqa
        TsB3iNpr21XqP3787eGnm7c7eA==
X-Google-Smtp-Source: APXvYqwGQ+U0AMsik4H8UPxZf/Ydr0V0LliUR9Neva7b1FE5jVZtVNnSanLdcxXeoCgYKlNZL4RE1w==
X-Received: by 2002:aa7:90d8:: with SMTP id k24mr4051781pfk.115.1563862492359;
        Mon, 22 Jul 2019 23:14:52 -0700 (PDT)
Received: from localhost ([122.172.28.117])
        by smtp.gmail.com with ESMTPSA id f3sm65402869pfg.165.2019.07.22.23.14.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 23:14:51 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rafael Wysocki <rjw@rjwysocki.net>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 10/10] Documentation: cpufreq: Update policy notifier documentation
Date:   Tue, 23 Jul 2019 11:44:10 +0530
Message-Id: <c90b601734b9828aeb93b8317205aff791660a2d.1563862014.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1563862014.git.viresh.kumar@linaro.org>
References: <cover.1563862014.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update documentation with the recent policy notifier updates.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 Documentation/cpu-freq/core.txt | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/Documentation/cpu-freq/core.txt b/Documentation/cpu-freq/core.txt
index 55193e680250..ed577d9c154b 100644
--- a/Documentation/cpu-freq/core.txt
+++ b/Documentation/cpu-freq/core.txt
@@ -57,19 +57,11 @@ transition notifiers.
 2.1 CPUFreq policy notifiers
 ----------------------------
 
-These are notified when a new policy is intended to be set. Each
-CPUFreq policy notifier is called twice for a policy transition:
+These are notified when a new policy is created or removed.
 
-1.) During CPUFREQ_ADJUST all CPUFreq notifiers may change the limit if
-    they see a need for this - may it be thermal considerations or
-    hardware limitations.
-
-2.) And during CPUFREQ_NOTIFY all notifiers are informed of the new policy
-   - if two hardware drivers failed to agree on a new policy before this
-   stage, the incompatible hardware shall be shut down, and the user
-   informed of this.
-
-The phase is specified in the second argument to the notifier.
+The phase is specified in the second argument to the notifier.  The phase is
+CPUFREQ_CREATE_POLICY when the policy is first created and it is
+CPUFREQ_REMOVE_POLICY when the policy is removed.
 
 The third argument, a void *pointer, points to a struct cpufreq_policy
 consisting of several values, including min, max (the lower and upper
-- 
2.21.0.rc0.269.g1a574e7a288b


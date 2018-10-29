Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 936307D099
	for <lwn-linux-doc@archive.lwn.net>; Mon, 29 Oct 2018 07:17:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729283AbeJ2QFO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 29 Oct 2018 12:05:14 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:36668 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729248AbeJ2QFO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Oct 2018 12:05:14 -0400
Received: by mail-pl1-f195.google.com with SMTP id y11-v6so3362507plt.3
        for <linux-doc@vger.kernel.org>; Mon, 29 Oct 2018 00:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FDlV+Xbz1j+NaR368L2vTpe24uF3g5mlaQe0xzBflGQ=;
        b=gI1N7dBtcaiUljcwKUPdD0lhNurPTNaQ728+UNi7gvxJ9tn08e3Hm9+efVxFd0rBys
         42/qKw4i8NM/Sfjbc7JzC25VK7t8intb8J4+L6fWaZ5K1BvEDUSDCE1T7qsBBebA4EEr
         NQRzQ6Iq6VRZ6d1kjnvDcJg+Io97QQKRXkeWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FDlV+Xbz1j+NaR368L2vTpe24uF3g5mlaQe0xzBflGQ=;
        b=ENwr5+wYI9A1JNb84DCTWAlU0mjYDhpWTr97UeA0eN9JW2bjeTgMD9YN2eka5k1KS6
         KBu+EGwIUPeGHwG2r038+iNge9pKPc+rL+AUSt/jdnRraZbT1/HaSBsplBdpbX8GF4gx
         nswbGSaxdiylRPbb3RBhYq96Ss0agLTs/pwUga2hob1qNWFesz9LZLmpMwA7m7VCGKvy
         5+dzpUMIkz74MBNiApkpW/+yid3+hxIZPf2wAEYzk0X5qYVxHCfOZex5ZOBBZ46HcazT
         ojfap4JE3xCbugTCUtBl3Rp0Z44JsFNr+VNsrie4NEZIwuJHzpRnSD0GehLnR2TmyOeC
         7xYg==
X-Gm-Message-State: AGRZ1gKlbm8BtJ/8lPOiHaBzqnvoqPg6S7vGlDJL7wutvNcJMrcVx9bZ
        cl/i4RGab0M5mI5xyFgj4A4Vkg==
X-Google-Smtp-Source: AJdET5c8ObvQnCb8owdZb7slfRkHgqpPhewVlNYQGEQVn9ck0BMr+blRI5Y2ueprqD5ApFe0r8RTeA==
X-Received: by 2002:a17:902:f203:: with SMTP id gn3mr12600884plb.93.1540797469909;
        Mon, 29 Oct 2018 00:17:49 -0700 (PDT)
Received: from localhost ([122.172.56.94])
        by smtp.gmail.com with ESMTPSA id b16-v6sm21538679pfm.145.2018.10.29.00.17.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Oct 2018 00:17:48 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rafael Wysocki <rjw@rjwysocki.net>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Pavel <pavel2000@ngs.ru>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: cpu-freq: Frequencies aren't always sorted
Date:   Mon, 29 Oct 2018 12:47:40 +0530
Message-Id: <844626b372018192fd0e9fe399343e09ef4dc842.1540797432.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.19.1.568.g152ad8e3369a
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The order in which the frequencies are displayed in cpufreq stats
depends on the order in which the frequencies were sorted in the
frequency table provided to cpufreq core by the cpufreq driver. They can
be completely unsorted as well.

The documentation's claim that the stats will be sorted in descending
order is hence incorrect and here is an attempt to fix it.

Reported-by: Pavel <pavel2000@ngs.ru>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 Documentation/cpu-freq/cpufreq-stats.txt | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/cpu-freq/cpufreq-stats.txt b/Documentation/cpu-freq/cpufreq-stats.txt
index a873855c811d..14378cecb172 100644
--- a/Documentation/cpu-freq/cpufreq-stats.txt
+++ b/Documentation/cpu-freq/cpufreq-stats.txt
@@ -86,9 +86,11 @@ transitions.
 This will give a fine grained information about all the CPU frequency
 transitions. The cat output here is a two dimensional matrix, where an entry
 <i,j> (row i, column j) represents the count of number of transitions from 
-Freq_i to Freq_j. Freq_i is in descending order with increasing rows and 
-Freq_j is in descending order with increasing columns. The output here also 
-contains the actual freq values for each row and column for better readability.
+Freq_i to Freq_j. Freq_i rows and Freq_j columns follow the sorting order in
+which the driver has provided the frequency table initially to the cpufreq core
+and so can be sorted (ascending or descending) or unsorted.  The output here
+also contains the actual freq values for each row and column for better
+readability.
 
 If the transition table is bigger than PAGE_SIZE, reading this will
 return an -EFBIG error.
-- 
2.19.1.568.g152ad8e3369a


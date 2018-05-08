Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1DBDC7DE74
	for <lwn-linux-doc@archive.lwn.net>; Tue,  8 May 2018 15:13:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754971AbeEHPNI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 8 May 2018 11:13:08 -0400
Received: from mail-wr0-f196.google.com ([209.85.128.196]:42295 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754882AbeEHPNH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 May 2018 11:13:07 -0400
Received: by mail-wr0-f196.google.com with SMTP id v5-v6so32667333wrf.9
        for <linux-doc@vger.kernel.org>; Tue, 08 May 2018 08:13:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=AsLHlghrEvpQkh0HuFkzwsK80GpQkO16pzDmCzipwxc=;
        b=aixkKTjf/bw/eesQw7WtG2x/kl74Xmsvev4v0vHSj3qkttfvpWLObjZvOmrwnmjg6X
         Q4VgzsKlfWJdkNWhxxhSV/U0oC+JqHwgLBNU+V5gOumS5kyhg7jSkg2CUU7H4o0EmZSa
         t6KeZluohh9dIkxZFtkkuuF/PUZdGP10fcuushKCER5EmCBXbUMrO9l95YHUsyBUxQfa
         6kd0nBoJj861sJsfeBS+S2bh1/arR5GFryqJ+sre7x1hLpoOQCtrU+FI3YJemwDeysMV
         LtVssbRK5+Ip2j4CkldJn+hbyQ0enkoySs0Sj7+YP0FEcW/PKdAibUm2kA2QEaxbPBGX
         Qdbw==
X-Gm-Message-State: ALQs6tBQYxQ+q9FvhtSW7hT74JzJk04BonG5ZBw+7SbBryiR9Kdcqthj
        ZIS5Vo/h4G2vH3urvds2U321GA==
X-Google-Smtp-Source: AB8JxZrdxBdN+hhkf/Lg8UmubvmIb9UDkZyKTFEIbwdFIJBS1oO+gH9L5YEhkwoBsXagVdc913cxjg==
X-Received: by 2002:adf:87ab:: with SMTP id b40-v6mr35677803wrb.156.1525792385865;
        Tue, 08 May 2018 08:13:05 -0700 (PDT)
Received: from localhost.localdomain.com ([151.15.207.48])
        by smtp.gmail.com with ESMTPSA id w40-v6sm42696982wrc.69.2018.05.08.08.13.04
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 May 2018 08:13:05 -0700 (PDT)
From:   Juri Lelli <juri.lelli@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Juri Lelli <juri.lelli@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        linux-doc@vger.kernel.org, linux-pm@vger.kernel.org
Subject: [PATCH] Documentation/admin-guide/pm/intel_pstate: fix Active Mode w/o HWP paragraph
Date:   Tue,  8 May 2018 17:12:09 +0200
Message-Id: <20180508151209.9314-1-juri.lelli@redhat.com>
X-Mailer: git-send-email 2.14.3
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

P-state selection algorithm (powersave or performance) is selected by
echoing the desired choice to scaling_governor sysfs attribute and not
to scaling_cur_freq (as currently stated).

Fix it.

Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: linux-doc@vger.kernel.org
Cc: linux-pm@vger.kernel.org

---
 Documentation/admin-guide/pm/intel_pstate.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/pm/intel_pstate.rst b/Documentation/admin-guide/pm/intel_pstate.rst
index d2b6fda3d67b..ab2fe0eda1d7 100644
--- a/Documentation/admin-guide/pm/intel_pstate.rst
+++ b/Documentation/admin-guide/pm/intel_pstate.rst
@@ -145,7 +145,7 @@ feature enabled.]
 
 In this mode ``intel_pstate`` registers utilization update callbacks with the
 CPU scheduler in order to run a P-state selection algorithm, either
-``powersave`` or ``performance``, depending on the ``scaling_cur_freq`` policy
+``powersave`` or ``performance``, depending on the ``scaling_governor`` policy
 setting in ``sysfs``.  The current CPU frequency information to be made
 available from the ``scaling_cur_freq`` policy attribute in ``sysfs`` is
 periodically updated by those utilization update callbacks too.
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

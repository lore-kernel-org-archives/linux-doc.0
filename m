Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DACC57D90F
	for <lwn-linux-doc@archive.lwn.net>; Wed, 29 May 2019 22:25:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbfE2WZI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 29 May 2019 18:25:08 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:41353 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726240AbfE2WZE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 May 2019 18:25:04 -0400
Received: by mail-lj1-f195.google.com with SMTP id q16so4100524ljj.8
        for <linux-doc@vger.kernel.org>; Wed, 29 May 2019 15:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ugedal.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DK/ogr6pZZUphW9lU4h1f+fFgOabCak3KXyja9ZoLt0=;
        b=EtEkBupWZk2J/O72xoPMmoNFOSLqen/od3RSkObixQLiBW0S7B4LBoMgiN1OJs5lTI
         7eQsLP01PJJoMg2Rx3TXT2fHK9oKRyTMsSxuM14Bv/AhGUfZbEp+jOWiJjg08NWOPWIn
         60jXRmoCOn7ULv9kGZ6Qa3BukeR4KLALFfbLjl+hFFUdKHdpARIjb7oq/IA0fCdMe6Jw
         CGumH0h5cYi/VpKQ+Q0RElMr9yUgKn5Qljab6cDKdX0txp1pFfhPYKT+HwcU8Rt1cCYS
         WLSjSr5B2qq/nQyorb4FdVBSJC+ONV8G5I9EocBK2BtkSCoIadihUFJo7fO60LGyljtK
         4pKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DK/ogr6pZZUphW9lU4h1f+fFgOabCak3KXyja9ZoLt0=;
        b=O+hwgB2BRzlmE2ZKMLmbED7TXVm4liZpkuScbxo+NyDdHUhXntE/9VKiCDziaUlBtn
         uwZ0A8KJZPBP2BT+aqXMiDGm0nQfe+1BoVYPS4enKQlE7KXvSHqvlPS77bRbz/1KLggc
         PrPOiUf5C2+ZrRKmBlKfDDGrY0VXCuv0rB2DxGNlYdYHMGteIm2Udn48i8o7SHoqpMNN
         61E3RmNSqjUqsi0RnSqtFZgqHc8PihPHTqDNMxZdchNB8mCHZ6YEyuAyK5acnmWv3K53
         rPDwrWwEHWJuOvM1KrXl5qw1On4nuDK3PDr8NV2WHMLNWPLzmtrHdXj35JbJ6MQot7YN
         j8JQ==
X-Gm-Message-State: APjAAAVsZwmYgVoPUBaJBSQZ9NAddsqnaxPH6HouZNHO8kC7kYwdKmUb
        68EUw8K1INGz9ylzIHXYn4xYPA==
X-Google-Smtp-Source: APXvYqy0RN6ic0nj6bgyH0NezC2bwxY/JEYIDLewQ/OEvI+10SkZ2sUZRbFizdUdOEoeHXmIvT/NkA==
X-Received: by 2002:a2e:b0e1:: with SMTP id h1mr118902ljl.171.1559168702343;
        Wed, 29 May 2019 15:25:02 -0700 (PDT)
Received: from xps13.ZyXEL-USG (84-52-230.83.3p.ntebredband.no. [84.52.230.83])
        by smtp.gmail.com with ESMTPSA id s12sm113843lji.34.2019.05.29.15.25.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2019 15:25:00 -0700 (PDT)
From:   Odin Ugedal <odin@ugedal.com>
To:     odin@ugedal.com
Cc:     Tejun Heo <tj@kernel.org>, Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        cgroups@vger.kernel.org (open list:CONTROL GROUP (CGROUP)),
        linux-doc@vger.kernel.org (open list:DOCUMENTATION),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] docs cgroups: add another example size for hugetlb
Date:   Thu, 30 May 2019 00:24:25 +0200
Message-Id: <20190529222425.30879-1-odin@ugedal.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add another example to clarify that HugePages smaller than 1MB will
be displayed using "KB", with an uppercased K (eg. 20KB), and not the
normal SI prefix kilo (small k).

Because of a misunderstanding/copy-paste error inside runc
(see https://github.com/opencontainers/runc/pull/2065), it tried
accessing the cgroup control file of a 64kB HugePage using
"hugetlb.64kB._____" instead of the correct "hugetlb.64KB._____".

Adding a new example will make it clear how sizes smaller than 1MB are
handled.

Signed-off-by: Odin Ugedal <odin@ugedal.com>
---
 Documentation/cgroup-v1/hugetlb.txt | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/Documentation/cgroup-v1/hugetlb.txt b/Documentation/cgroup-v1/hugetlb.txt
index 106245c3aecc..1260e5369b9b 100644
--- a/Documentation/cgroup-v1/hugetlb.txt
+++ b/Documentation/cgroup-v1/hugetlb.txt
@@ -32,14 +32,18 @@ Brief summary of control files
  hugetlb.<hugepagesize>.usage_in_bytes     # show current usage for "hugepagesize" hugetlb
  hugetlb.<hugepagesize>.failcnt		   # show the number of allocation failure due to HugeTLB limit
 
-For a system supporting two hugepage size (16M and 16G) the control
+For a system supporting three hugepage sizes (64k, 32M and 1G), the control
 files include:
 
-hugetlb.16GB.limit_in_bytes
-hugetlb.16GB.max_usage_in_bytes
-hugetlb.16GB.usage_in_bytes
-hugetlb.16GB.failcnt
-hugetlb.16MB.limit_in_bytes
-hugetlb.16MB.max_usage_in_bytes
-hugetlb.16MB.usage_in_bytes
-hugetlb.16MB.failcnt
+hugetlb.1GB.limit_in_bytes
+hugetlb.1GB.max_usage_in_bytes
+hugetlb.1GB.usage_in_bytes
+hugetlb.1GB.failcnt
+hugetlb.64KB.limit_in_bytes
+hugetlb.64KB.max_usage_in_bytes
+hugetlb.64KB.usage_in_bytes
+hugetlb.64KB.failcnt
+hugetlb.32MB.limit_in_bytes
+hugetlb.32MB.max_usage_in_bytes
+hugetlb.32MB.usage_in_bytes
+hugetlb.32MB.failcnt
-- 
2.21.0


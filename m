Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4DA0F7D08E
	for <lwn-linux-doc@archive.lwn.net>; Wed, 21 Nov 2018 09:15:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729284AbeKUTs6 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 21 Nov 2018 14:48:58 -0500
Received: from mga12.intel.com ([192.55.52.136]:52892 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729282AbeKUTs6 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 21 Nov 2018 14:48:58 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Nov 2018 01:15:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,260,1539673200"; 
   d="scan'208";a="101990104"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga003.jf.intel.com with ESMTP; 21 Nov 2018 01:15:17 -0800
Received: from [10.125.252.12] (abudanko-mobl.ccr.corp.intel.com [10.125.252.12])
        by linux.intel.com (Postfix) with ESMTP id 217E9580460;
        Wed, 21 Nov 2018 01:15:12 -0800 (PST)
Subject: [PATCH v2 2/2] Documentation/admin-guide: update admin-guide
 index.rst
From:   Alexey Budankov <alexey.budankov@linux.intel.com>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Kees Cook <keescook@chromium.org>,
        Jann Horn <jannh@google.com>, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Andi Kleen <ak@linux.intel.com>,
        Jonatan Corbet <corbet@lwn.net>
Cc:     Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "kernel-hardening@lists.openwall.com" 
        <kernel-hardening@lists.openwall.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <259a9cd2-5c56-4f8d-57c4-cabaeaa774bc@linux.intel.com>
Organization: Intel Corp.
Message-ID: <8b37e342-2276-d68a-f770-4e608f96a574@linux.intel.com>
Date:   Wed, 21 Nov 2018 12:15:11 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <259a9cd2-5c56-4f8d-57c4-cabaeaa774bc@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Extend index.rst index file at admin-guide root directory with
the reference to perf-security.rst file being introduced.

Signed-off-by: Alexey Budankov <alexey.budankov@linux.intel.com>
---
 Documentation/admin-guide/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
index 965745d5fb9a..0a491676685e 100644
--- a/Documentation/admin-guide/index.rst
+++ b/Documentation/admin-guide/index.rst
@@ -76,6 +76,7 @@ configure specific aspects of kernel behavior to your liking.
    thunderbolt
    LSM/index
    mm/index
+   perf-security
 
 .. only::  subproject and html
 

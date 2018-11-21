Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5CCA27D08E
	for <lwn-linux-doc@archive.lwn.net>; Wed, 21 Nov 2018 08:57:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727006AbeKUTbA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 21 Nov 2018 14:31:00 -0500
Received: from mga18.intel.com ([134.134.136.126]:9262 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728149AbeKUTbA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 21 Nov 2018 14:31:00 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Nov 2018 00:57:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,260,1539673200"; 
   d="scan'208";a="101986096"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga003.jf.intel.com with ESMTP; 21 Nov 2018 00:57:21 -0800
Received: from [10.125.252.12] (abudanko-mobl.ccr.corp.intel.com [10.125.252.12])
        by linux.intel.com (Postfix) with ESMTP id 527A258040F;
        Wed, 21 Nov 2018 00:57:17 -0800 (PST)
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
From:   Alexey Budankov <alexey.budankov@linux.intel.com>
Subject: [PATCH v2 0/2] Documentation/admin-guide: introduce perf-security.rst
 file and extend perf_event_paranoid documentation
Organization: Intel Corp.
Message-ID: <259a9cd2-5c56-4f8d-57c4-cabaeaa774bc@linux.intel.com>
Date:   Wed, 21 Nov 2018 11:57:12 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


To facilitate informed decision making by system administrators [1]
to permit and manage access to Perf Events (perf_events) / Perf tool (Perf) [2],[3] 
performance monitoring for multiple users perf-security.rst document 
suggested by Thomas Gleixner is introduced [4] that:

a) states perf_events/Perf access security concerns for multi user environment
b) refers to base Linux access control and management principles
c) extends documentation of possible perf_event_paranoid knob settings 

The file serves as single knowledge source for perf_events/Perf security and 
access control related matter according to decisions, discussion and  
PoC prototype previously made here [5],[6].

The file can later be extended with information describing:

a) perf_events/Perf usage models and its security implications
b) perf_events/Perf user interface, its changes and related security implications
c) security related implications of monitoring by a specific perf_events PMU [2]

---
Alexey Budankov (2):
  Documentation/admin-guide: introduce perf-security.rst file
  Documentation/admin-guide: update admin-guide index.rst

 Documentation/admin-guide/index.rst         |  1 +
 Documentation/admin-guide/perf-security.rst | 77 +++++++++++++++++++++
 2 files changed, 78 insertions(+)
 create mode 100644 Documentation/admin-guide/perf-security.rst

Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6CD2E7DE78
	for <lwn-linux-doc@archive.lwn.net>; Wed,  4 Apr 2018 15:03:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751350AbeDDPDv (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 4 Apr 2018 11:03:51 -0400
Received: from mga02.intel.com ([134.134.136.20]:1116 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751251AbeDDPDv (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 4 Apr 2018 11:03:51 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Apr 2018 08:03:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,406,1517904000"; 
   d="scan'208";a="31487919"
Received: from bee.sh.intel.com (HELO bee) ([10.239.97.14])
  by orsmga006.jf.intel.com with ESMTP; 04 Apr 2018 08:03:45 -0700
Received: from kbuild by bee with local (Exim 4.84_2)
        (envelope-from <fengguang.wu@intel.com>)
        id 1f3jwu-00063G-Uo; Wed, 04 Apr 2018 23:03:44 +0800
Date:   Wed, 4 Apr 2018 23:03:39 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>
Cc:     kbuild-all@01.org, mhiramat@kernel.org, oleg@redhat.com,
        peterz@infradead.org, srikar@linux.vnet.ibm.com,
        rostedt@goodmis.org, acme@kernel.org, ananth@linux.vnet.ibm.com,
        akpm@linux-foundation.org, alexander.shishkin@linux.intel.com,
        alexis.berlemont@gmail.com, corbet@lwn.net,
        dan.j.williams@intel.com, jolsa@redhat.com, kan.liang@intel.com,
        kjlx@templeofstupid.com, kstewart@linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, milian.wolff@kdab.com, mingo@redhat.com,
        namhyung@kernel.org, naveen.n.rao@linux.vnet.ibm.com,
        pc@us.ibm.com, tglx@linutronix.de, yao.jin@linux.intel.com,
        fengguang.wu@intel.com, jglisse@redhat.com,
        Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 6/9] trace_uprobe: Support SDT markers having
 reference count (semaphore)
Message-ID: <201804042247.DQrDzGk7%fengguang.wu@intel.com>
References: <20180404083110.18647-7-ravi.bangoria@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180404083110.18647-7-ravi.bangoria@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: fengguang.wu@intel.com
X-SA-Exim-Scanned: No (on bee); SAEximRunCond expanded to false
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Ravi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tip/perf/core]
[also build test WARNING on v4.16 next-20180404]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Ravi-Bangoria/trace_uprobe-Support-SDT-markers-having-reference-count-semaphore/20180404-201900
reproduce:
        # apt-get install sparse
        make ARCH=x86_64 allmodconfig
        make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)

   kernel/trace/trace.h:1298:38: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct event_filter *filter @@    got struct event_filtstruct event_filter *filter @@
   kernel/trace/trace.h:1298:38:    expected struct event_filter *filter
   kernel/trace/trace.h:1298:38:    got struct event_filter [noderef] <asn:4>*filter
>> kernel/trace/trace_uprobe.c:1001:6: sparse: symbol 'trace_uprobe_mmap' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

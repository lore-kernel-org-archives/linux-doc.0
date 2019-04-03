Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 579E57D08A
	for <lwn-linux-doc@archive.lwn.net>; Wed,  3 Apr 2019 22:10:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726580AbfDCWKi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 3 Apr 2019 18:10:38 -0400
Received: from cloudserver094114.home.pl ([79.96.170.134]:50828 "EHLO
        cloudserver094114.home.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726547AbfDCWKh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Apr 2019 18:10:37 -0400
Received: from 79.184.254.219.ipv4.supernova.orange.pl (79.184.254.219) (HELO aspire.rjw.lan)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.213)
 id 2b21326c5f5448ae; Thu, 4 Apr 2019 00:10:35 +0200
From:   "Rafael J. Wysocki" <rjw@rjwysocki.net>
To:     Linux PM <linux-pm@vger.kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linux ACPI <linux-acpi@vger.kernel.org>,
        Linux Documentation <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH 0/4] Documentation: PM: Assorted updates
Date:   Thu, 04 Apr 2019 00:02:14 +0200
Message-ID: <4546107.fVFrecLk33@aspire.rjw.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi All,

There patches make some changes in the PM documentation:

- Add "references" sections to cpufreq-related documents (patch [1/4]).
- Add SPDX license tags to multiple PM-related documents (patch [2/4]).
- Unify copyright notices in PM-related documents (patch [3/4]).
- Add an SPDX license tag and a copyright notice to the new
  intel_epb doc (in linux-next only ATM).

Thanks,
Rafael


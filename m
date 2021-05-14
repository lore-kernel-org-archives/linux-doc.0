Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 860E8C433B4
	for <linux-doc@archiver.kernel.org>; Fri, 14 May 2021 15:06:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 47B2B61175
	for <linux-doc@archiver.kernel.org>; Fri, 14 May 2021 15:06:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230521AbhENPHw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 14 May 2021 11:07:52 -0400
Received: from mga04.intel.com ([192.55.52.120]:45426 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229524AbhENPHv (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 14 May 2021 11:07:51 -0400
IronPort-SDR: 0bYSdfgtYvonDQ6lRPbo3/ntiKxYc+XfbfWduxwOBksEN/zI8fZ4uG1sCD/t2LBV1Rn4NqL5S5
 SrpmiAf31t0w==
X-IronPort-AV: E=McAfee;i="6200,9189,9984"; a="198235265"
X-IronPort-AV: E=Sophos;i="5.82,300,1613462400"; 
   d="scan'208";a="198235265"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2021 08:06:33 -0700
IronPort-SDR: 3gr0MkUI3Sq3rsrEgNeY9cqGw1RilVLLgpUSyqoCCtosvSJjcu1Ck9UGe3NtSY8SZmPcJZFH3U
 9Shzm6twr5Jg==
X-IronPort-AV: E=Sophos;i="5.82,300,1613462400"; 
   d="scan'208";a="624728800"
Received: from gna-dev.igk.intel.com (HELO localhost) ([10.102.80.34])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2021 08:06:29 -0700
References: <20210513110040.2268-1-maciej.kwapulinski@linux.intel.com> <20210513110040.2268-12-maciej.kwapulinski@linux.intel.com> <20210514101253.1037-1-hdanton@sina.com>
User-agent: mu4e 1.4.13; emacs 26.3
From:   Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
To:     Hillf Danton <hdanton@sina.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Tomasz Jankowski <tomasz1.jankowski@intel.com>,
        Savo Novakovic <savox.novakovic@intel.com>,
        Jianxun Zhang <jianxun.zhang@linux.intel.com>
Subject: Re: [PATCH v3 11/14] intel_gna: add ioctl handler
In-reply-to: <20210514101253.1037-1-hdanton@sina.com>
Date:   Fri, 14 May 2021 17:06:26 +0200
Message-ID: <85lf8hicct.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Hillf Danton <hdanton@sina.com> writes:

> On Thu, 13 May 2021 13:00:37 +0200 Tomasz Jankowski wrote:
Greg, Matthew, Hillf

thank You for Your comments.

Next week I'll start applying them to code 

regards,
Maciej

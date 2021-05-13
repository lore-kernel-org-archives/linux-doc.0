Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D803C433B4
	for <linux-doc@archiver.kernel.org>; Thu, 13 May 2021 11:30:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5256D60E0B
	for <linux-doc@archiver.kernel.org>; Thu, 13 May 2021 11:30:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231682AbhEMLbi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 May 2021 07:31:38 -0400
Received: from mga12.intel.com ([192.55.52.136]:2476 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232053AbhEMLbh (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 13 May 2021 07:31:37 -0400
IronPort-SDR: dTFj5oE8xMuBDBPU/DS+xPDqWf8Zhe/h5bUUW/Vj9gYRWqonQnnroZAS42iq8vgbrD1KnEQ+2C
 L259qXcitLSg==
X-IronPort-AV: E=McAfee;i="6200,9189,9982"; a="179518689"
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; 
   d="scan'208";a="179518689"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2021 04:30:19 -0700
IronPort-SDR: yvf6jmwwr4tssydRHtpls6ps19cYX91aDvI5CVQgi41mr56EZAWCfvYzUbAuZfmGwHSi/nV5F9
 ZHgrE5KKYWZw==
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; 
   d="scan'208";a="431201788"
Received: from gna-dev.igk.intel.com (HELO localhost) ([10.102.80.34])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2021 04:30:16 -0700
References: <20210324183610.4574-1-maciej.kwapulinski@linux.intel.com> <20210324183610.4574-2-maciej.kwapulinski@linux.intel.com> <CAHp75Vf54GNsw_xWqiOhZx5aHHnQ_-wUWugQ8w9vJPRheLxHFA@mail.gmail.com>
User-agent: mu4e 1.4.13; emacs 26.3
From:   Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Documentation List <linux-doc@vger.kernel.org>,
        Tomasz Jankowski <tomasz1.jankowski@intel.com>,
        Savo Novakovic <savox.novakovic@intel.com>,
        Jianxun Zhang <jianxun.zhang@linux.intel.com>
Subject: Re: [PATCH v2 01/13] intel_gna: add driver module
In-reply-to: <CAHp75Vf54GNsw_xWqiOhZx5aHHnQ_-wUWugQ8w9vJPRheLxHFA@mail.gmail.com>
Date:   Thu, 13 May 2021 13:30:13 +0200
Message-ID: <85tun6j2gq.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Andy Shevchenko <andy.shevchenko@gmail.com> writes:

> On Wed, Mar 24, 2021 at 8:38 PM Maciej Kwapulinski
> <maciej.kwapulinski@linux.intel.com> wrote:
>>
....
>> +static int recovery_timeout = 60;
>> +module_param(recovery_timeout, int, 0644);
>> +MODULE_PARM_DESC(recovery_timeout, "Recovery timeout in seconds");
>
> Why module parameters?!
>

Used for testing on slower FPGA boards - in v3, it is present under
CONFIG_DEBUG_INTEL_GNA flag.

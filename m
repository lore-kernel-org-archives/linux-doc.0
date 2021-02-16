Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D2EFC433E0
	for <linux-doc@archiver.kernel.org>; Tue, 16 Feb 2021 17:39:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 717FA64E07
	for <linux-doc@archiver.kernel.org>; Tue, 16 Feb 2021 17:39:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbhBPRjN convert rfc822-to-8bit (ORCPT
        <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 16 Feb 2021 12:39:13 -0500
Received: from mga01.intel.com ([192.55.52.88]:41647 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230216AbhBPRjM (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 16 Feb 2021 12:39:12 -0500
IronPort-SDR: 0jERC9NgPd1uWnVtOxp1EXid92qG/tFp89ygxfuu8BK1S3kcrVr7dKGgR1qELdXCRpheDz3d2L
 YN9l2dZ7Sl/g==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="202153228"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="202153228"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 09:37:24 -0800
IronPort-SDR: 2Xgh563DtrWCeP2htDOm9Ihv9YNP64eKai8aR187ZdtjMy0Y4VPSVtjMqoHHPz2NjBdeHOumSY
 12HG6PFotzAA==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="512599751"
Received: from marambux-mobl.amr.corp.intel.com ([10.209.93.6])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 09:37:23 -0800
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.17\))
Subject: Re: [PATCH v1 01/12] gna: add driver module
From:   Jianxun Zhang <jianxun.zhang@linux.intel.com>
In-Reply-To: <CAHp75Vep0Fm1k_7gJcozk4t316QmUgt5Qe3PauwDg=py5VnHfQ@mail.gmail.com>
Date:   Tue, 16 Feb 2021 09:37:23 -0800
Cc:     Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Documentation List <linux-doc@vger.kernel.org>,
        Tomasz Jankowski <tomasz1.jankowski@intel.com>,
        Savo Novakovic <savox.novakovic@intel.com>
Content-Transfer-Encoding: 8BIT
Message-Id: <0941CBCA-0760-4017-AE65-47FB3E213974@linux.intel.com>
References: <20210216160525.5028-1-maciej.kwapulinski@linux.intel.com>
 <20210216160525.5028-2-maciej.kwapulinski@linux.intel.com>
 <CAHp75Vep0Fm1k_7gJcozk4t316QmUgt5Qe3PauwDg=py5VnHfQ@mail.gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
X-Mailer: Apple Mail (2.3445.104.17)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



> On Feb 16, 2021, at 8:54 AM, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> 
>> +config INTEL_GNA
>> +       tristate "Intel(R) Gaussian & Neural Accelerator (Intel(R) GNA)"
> 
> Intel (R) Intel (R) RRR!
This is (from my interpretation) of requirements and guidance specific on how to address this HW IP from Intel’s legal before upstream.

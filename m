Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F7C7C4338F
	for <linux-doc@archiver.kernel.org>; Thu,  5 Aug 2021 17:58:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 786DA61163
	for <linux-doc@archiver.kernel.org>; Thu,  5 Aug 2021 17:58:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240924AbhHER7C (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 Aug 2021 13:59:02 -0400
Received: from mga12.intel.com ([192.55.52.136]:44864 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240920AbhHER7B (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 5 Aug 2021 13:59:01 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10067"; a="193810592"
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; 
   d="scan'208";a="193810592"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2021 10:58:47 -0700
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; 
   d="scan'208";a="437874741"
Received: from akleen-mobl1.amr.corp.intel.com (HELO [10.212.183.241]) ([10.212.183.241])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2021 10:58:46 -0700
Subject: Re: [PATCH v1] driver: base: Add driver filter support
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Dan Williams <dan.j.williams@intel.com>,
        Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20210804174322.2898409-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <YQrqhYEL64CSLRTy@kroah.com>
 <f2b1d564-8174-f8e9-9fee-12e938c6d846@linux.intel.com>
 <YQuYCePPZEmVbkfc@kroah.com> <YQuZdVuaGG/Cr62y@kroah.com>
 <YQuaJ78y8j1UmBoz@kroah.com>
 <fdf8b6b6-58c3-8392-2fc6-1908a314e991@linux.intel.com>
 <YQwlHrJBw79xhTSI@kroah.com>
From:   Andi Kleen <ak@linux.intel.com>
Message-ID: <21db8884-5aa1-3971-79ef-f173a0a95bef@linux.intel.com>
Date:   Thu, 5 Aug 2021 10:58:46 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQwlHrJBw79xhTSI@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 8/5/2021 10:51 AM, Greg Kroah-Hartman wrote:
>
> It's controlled by whatever you want to use in userspace.  usbguard has
> been handling this logic in userspace for over a decade now just fine.


So how does that work with builtin USB drivers? Do you delay the USB 
binding until usbguard starts up?

>
>> This doesn't help us handle builtin drivers that initialize before user
>> space is up.
> Then have the default setting for your bus be "unauthorized" like we
> allow for some busses today.

We need some early boot drivers, just not all of them. For example in 
your scheme we would need to reject all early platform drivers, which 
would break booting. Or allow all early platform drivers, but then we 
exactly get into the problem that there are far too many of them to 
properly harden.


> There is a platform bus, it's just a fake one.  The platform bus code
> does the binding just like any other bus does, why is platform somehow
> "special"?  Except for how it is abused...

For once it's usually all initialized early, so there's no way for user 
space to do anything.


-andi


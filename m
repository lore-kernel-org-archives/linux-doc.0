Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59533C4338F
	for <linux-doc@archiver.kernel.org>; Thu,  5 Aug 2021 13:52:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F75761158
	for <linux-doc@archiver.kernel.org>; Thu,  5 Aug 2021 13:52:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239749AbhHENwl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 Aug 2021 09:52:41 -0400
Received: from mga03.intel.com ([134.134.136.65]:53451 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233033AbhHENwl (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 5 Aug 2021 09:52:41 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10067"; a="214183645"
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; 
   d="scan'208";a="214183645"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2021 06:52:26 -0700
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; 
   d="scan'208";a="437798795"
Received: from akleen-mobl1.amr.corp.intel.com (HELO [10.212.183.241]) ([10.212.183.241])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2021 06:52:25 -0700
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
From:   Andi Kleen <ak@linux.intel.com>
Message-ID: <fdf8b6b6-58c3-8392-2fc6-1908a314e991@linux.intel.com>
Date:   Thu, 5 Aug 2021 06:52:25 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQuaJ78y8j1UmBoz@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


> Both thunderbolt and USB have the idea of "authorized" devices, that is
> the logic that should be made generic and available for all busses to
> use, by moving it to the driver core, just like the "removable" logic
> got moved to the driver core recently (see 70f400d4d957 ("driver core:
> Move the "removable" attribute from USB to core")

This looks like it's controlled by udev?  Have a default per bus, and 
let user space override it before setting up the device.

This doesn't help us handle builtin drivers that initialize before user 
space is up.

We need something that works for all drivers. Also cannot just use a 
default at bootup because some drivers (like virtio or rtc) need to be 
initialized in early boot to make the system functional at all. So you 
need a way to distinguish these two cases in the pre user space boot.

That's basically what this patch implements the infrastructure for.

>
> Please use that type of interface, as we already have userspace tools
> using it, and expand it for all busses in the system to use if they
> want.  Otherwise with this proposal you will end up with multiple ways
> to control the same bus type with different types of "filtering",
> ensuring a mess.

How would such a proposal work for a platform driver that doesn't have a 
bus?

-Andi


Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE6FCC4338F
	for <linux-doc@archiver.kernel.org>; Thu,  5 Aug 2021 04:45:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C7ECD610A0
	for <linux-doc@archiver.kernel.org>; Thu,  5 Aug 2021 04:45:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234505AbhHEEqM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 Aug 2021 00:46:12 -0400
Received: from mga06.intel.com ([134.134.136.31]:2899 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231143AbhHEEqM (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 5 Aug 2021 00:46:12 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10066"; a="275119206"
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; 
   d="scan'208";a="275119206"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2021 21:45:58 -0700
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; 
   d="scan'208";a="522336613"
Received: from akleen-mobl1.amr.corp.intel.com (HELO [10.209.32.138]) ([10.209.32.138])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2021 21:45:57 -0700
Subject: Re: [PATCH v1] driver: base: Add driver filter support
To:     Dan Williams <dan.j.williams@intel.com>,
        Matthew Wilcox <willy@infradead.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
References: <20210804174322.2898409-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <YQrqhYEL64CSLRTy@kroah.com>
 <CAPcyv4iEEDCz5719d0vNi=zi=6oN5vctcVfY5P=WQ9j_Zpz6eA@mail.gmail.com>
 <YQsBfAVPomaC97Rm@casper.infradead.org>
 <CAPcyv4gSsL5hk=CSk=9duqCN3VDS_T2LaYRL+_zK9VOkO8NB+A@mail.gmail.com>
From:   Andi Kleen <ak@linux.intel.com>
Message-ID: <e96bc698-89ca-3c67-d0ba-adecc50e8a53@linux.intel.com>
Date:   Wed, 4 Aug 2021 21:45:56 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAPcyv4gSsL5hk=CSk=9duqCN3VDS_T2LaYRL+_zK9VOkO8NB+A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 8/4/2021 2:28 PM, Dan Williams wrote
> The "hardware" in this case is virtual devices presented by the VMM to
> the VM. So if a driver misbehaves in a useful way for an attacker to
> exploit, they can stimulate that behavior with a custom crafted
> virtual device, and that driver will autoload unaware of the threat
> without this filter for vetted drivers.

Another way to see it is: the confidential guest is protected against 
the host, except for the places where it chooses to communicate with the 
host through MMIOs, port IOs, some (not all) MSRs. It's somewhat 
analogous to a network server in a hostile network which can be attacked 
through network packets. We typically use a firewall to limit the 
network exposure only to especially hardened network services. Each low 
level MMIO etc. is like a network access communicating with a hostile 
network. The device filter is the firewall for these vulnerable low 
level interactions. It reduces the hardening problem from being 
completely infeasible to tractable.

-Andi




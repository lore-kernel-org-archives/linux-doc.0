Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85C2AC4332D
	for <linux-doc@archiver.kernel.org>; Tue, 16 Mar 2021 01:30:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B82164F9E
	for <linux-doc@archiver.kernel.org>; Tue, 16 Mar 2021 01:30:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbhCPB2P (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 15 Mar 2021 21:28:15 -0400
Received: from mga09.intel.com ([134.134.136.24]:38036 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229467AbhCPB2J (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 15 Mar 2021 21:28:09 -0400
IronPort-SDR: pMIkg6+eyF5UoBXZyTIqqVq3ag9NE890TM2PhBfgKi9F92rlYeZJ6no4TwjgeeecLhgLgJtFOg
 71Kh1wzRszrQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9924"; a="189273244"
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; 
   d="scan'208";a="189273244"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2021 18:28:09 -0700
IronPort-SDR: BbfDahb851UEsqIlHonZF+pw536xdmk6SIHATK0iFLJXSSUnSL/tkYVdroBa1309upxmGE5BK4
 fLMGVZCZqjyQ==
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; 
   d="scan'208";a="412036602"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2021 18:28:09 -0700
Date:   Mon, 15 Mar 2021 18:30:30 -0700
From:   Jacob Pan <jacob.jun.pan@intel.com>
To:     Tejun Heo <tj@kernel.org>
Cc:     Vipin Sharma <vipinsh@google.com>, mkoutny@suse.com,
        rdunlap@infradead.org, thomas.lendacky@amd.com,
        brijesh.singh@amd.com, jon.grimm@amd.com, eric.vantassell@amd.com,
        pbonzini@redhat.com, hannes@cmpxchg.org, frankja@linux.ibm.com,
        borntraeger@de.ibm.com, corbet@lwn.net, seanjc@google.com,
        vkuznets@redhat.com, wanpengli@tencent.com, jmattson@google.com,
        joro@8bytes.org, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, hpa@zytor.com, gingell@google.com,
        rientjes@google.com, dionnaglaze@google.com, kvm@vger.kernel.org,
        x86@kernel.org, cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Tian, Kevin" <kevin.tian@intel.com>,
        "Liu, Yi L" <yi.l.liu@intel.com>,
        "Raj, Ashok" <ashok.raj@intel.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Jacob Pan <jacob.jun.pan@linux.intel.com>,
        "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
        jacob.jun.pan@intel.com
Subject: Re: [RFC v2 2/2] cgroup: sev: Miscellaneous cgroup documentation.
Message-ID: <20210315183030.5b15aea3@jacob-builder>
In-Reply-To: <YE/zvLkL1vM8/Cdm@slm.duckdns.org>
References: <YECfhCJtHUL9cB2L@slm.duckdns.org>
        <20210312125821.22d9bfca@jacob-builder>
        <YEvZ4muXqiSScQ8i@google.com>
        <20210312145904.4071a9d6@jacob-builder>
        <YEyR9181Qgzt+Ps9@mtj.duckdns.org>
        <20210313085701.1fd16a39@jacob-builder>
        <YEz+8HbfkbGgG5Tm@mtj.duckdns.org>
        <20210315151155.383a7e6e@jacob-builder>
        <YE/ddx5+ToNsgUF0@slm.duckdns.org>
        <20210315164012.4adeabe8@jacob-builder>
        <YE/zvLkL1vM8/Cdm@slm.duckdns.org>
Organization: OTC
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Tejun,

On Mon, 15 Mar 2021 19:54:36 -0400, Tejun Heo <tj@kernel.org> wrote:

> Hello,
> 
> On Mon, Mar 15, 2021 at 04:40:12PM -0700, Jacob Pan wrote:
> > 2. then we want to move/migrate Process1 to cg_B. so we need uncharge
> > 10 of cg_A, charge 10 of cg_B  
> 
> So, what I don't get is why this migration is necessary. This isn't
> supported as a usage pattern and no one, at least in terms of wide-spread
> usage, does this. Why is this a requirement for your use case?
> 
I don't know if this is required. I thought utilities such as cgclassify
need to be supported.
" cgclassify - move running task(s) to given cgroups "
If no such use case, I am fine with dropping the migration support. Just
enforce limit on allocations.

> Thanks.
> 


Thanks,

Jacob

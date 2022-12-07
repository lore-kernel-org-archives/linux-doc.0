Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA68C352A1
	for <linux-doc@archiver.kernel.org>; Wed,  7 Dec 2022 17:24:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbiLGRY0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Dec 2022 12:24:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbiLGRYZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Dec 2022 12:24:25 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E51C142F74;
        Wed,  7 Dec 2022 09:24:24 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5714A23A;
        Wed,  7 Dec 2022 09:24:31 -0800 (PST)
Received: from [10.1.197.38] (unknown [10.1.197.38])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A93083F73B;
        Wed,  7 Dec 2022 09:24:18 -0800 (PST)
Message-ID: <e9c7cc11-a2d3-e463-d6fe-e780a8fb38c7@arm.com>
Date:   Wed, 7 Dec 2022 17:24:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v8 10/13] x86/resctrl: Add sysfs interface to write
 mbm_total_bytes_config
Content-Language: en-GB
From:   James Morse <james.morse@arm.com>
To:     Babu Moger <babu.moger@amd.com>
Cc:     fenghua.yu@intel.com, dave.hansen@linux.intel.com, x86@kernel.org,
        hpa@zytor.com, paulmck@kernel.org, akpm@linux-foundation.org,
        quic_neeraju@quicinc.com, rdunlap@infradead.org,
        damien.lemoal@opensource.wdc.com, songmuchun@bytedance.com,
        peterz@infradead.org, jpoimboe@kernel.org, pbonzini@redhat.com,
        chang.seok.bae@intel.com, pawan.kumar.gupta@linux.intel.com,
        jmattson@google.com, daniel.sneddon@linux.intel.com,
        sandipan.das@amd.com, tony.luck@intel.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        bagasdotme@gmail.com, eranian@google.com, corbet@lwn.net,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        reinette.chatre@intel.com
References: <166759188265.3281208.11769277079826754455.stgit@bmoger-ubuntu>
 <166759206900.3281208.11975514088019160962.stgit@bmoger-ubuntu>
 <7ce5bcda-bb42-4166-ab7e-8a07b8fb28a7@arm.com>
In-Reply-To: <7ce5bcda-bb42-4166-ab7e-8a07b8fb28a7@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Bah! Sorry, I thought I was looking at v9!
(but the same comments apply)


Thanks,

James

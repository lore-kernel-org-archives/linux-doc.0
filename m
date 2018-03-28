Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E3DF87DD31
	for <lwn-linux-doc@archive.lwn.net>; Wed, 28 Mar 2018 20:55:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752634AbeC1Uzi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 28 Mar 2018 16:55:38 -0400
Received: from mga02.intel.com ([134.134.136.20]:11086 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752090AbeC1Uzh (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 28 Mar 2018 16:55:37 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Mar 2018 13:55:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,373,1517904000"; 
   d="scan'208";a="37661512"
Received: from ray.jf.intel.com (HELO [10.24.9.20]) ([10.24.9.20])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Mar 2018 13:55:34 -0700
Subject: Re: [PATCH v12 07/22] selftests/vm: fixed bugs in
 pkey_disable_clear()
To:     Thiago Jung Bauermann <bauerman@linux.vnet.ibm.com>
References: <1519264541-7621-1-git-send-email-linuxram@us.ibm.com>
 <1519264541-7621-8-git-send-email-linuxram@us.ibm.com>
 <dc5ee0c8-afe3-78aa-001d-7b49b398337b@intel.com>
 <87muys3p2v.fsf@morokweng.localdomain>
Cc:     Ram Pai <linuxram@us.ibm.com>, shuahkh@osg.samsung.com,
        linux-kselftest@vger.kernel.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org, x86@kernel.org,
        linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, mingo@redhat.com,
        akpm@linux-foundation.org, benh@kernel.crashing.org,
        paulus@samba.org, khandual@linux.vnet.ibm.com,
        aneesh.kumar@linux.vnet.ibm.com, bsingharora@gmail.com,
        hbabu@us.ibm.com, mhocko@kernel.org, ebiederm@xmission.com,
        arnd@arndb.de
From:   Dave Hansen <dave.hansen@intel.com>
Message-ID: <34fd1ae9-9697-ac6c-d6bc-7c25b4515a25@intel.com>
Date:   Wed, 28 Mar 2018 13:55:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <87muys3p2v.fsf@morokweng.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 03/28/2018 01:47 PM, Thiago Jung Bauermann wrote:
>>>  	if (flags)
>>> -		assert(rdpkey_reg() > orig_pkey_reg);
>>> +		assert(rdpkey_reg() < orig_pkey_reg);
>>>  }
>>>
>>>  void pkey_write_allow(int pkey)
>> This seems so horribly wrong that I wonder how it worked in the first
>> place.  Any idea?
> The code simply wasn't used. pkey_disable_clear() is called by
> pkey_write_allow() and pkey_access_allow(), but before this patch series
> nothing called either of these functions.
> 

Ahh, that explains it.  Can that get stuck in the changelog, please?
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D3CB77E66E
	for <lwn-linux-doc@archive.lwn.net>; Fri, 16 Mar 2018 22:13:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751917AbeCPWNQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 16 Mar 2018 18:13:16 -0400
Received: from mga14.intel.com ([192.55.52.115]:50632 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750915AbeCPWNP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 16 Mar 2018 18:13:15 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Mar 2018 15:13:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,317,1517904000"; 
   d="scan'208";a="25370198"
Received: from ray.jf.intel.com (HELO [10.7.201.16]) ([10.7.201.16])
  by orsmga007.jf.intel.com with ESMTP; 16 Mar 2018 15:13:13 -0700
Subject: Re: [PATCH v12 09/22] selftests/vm: fix alloc_random_pkey() to make
 it really random
To:     Ram Pai <linuxram@us.ibm.com>, shuahkh@osg.samsung.com,
        linux-kselftest@vger.kernel.org
References: <1519264541-7621-1-git-send-email-linuxram@us.ibm.com>
 <1519264541-7621-10-git-send-email-linuxram@us.ibm.com>
Cc:     mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
        linux-mm@kvack.org, x86@kernel.org, linux-arch@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        mingo@redhat.com, akpm@linux-foundation.org,
        benh@kernel.crashing.org, paulus@samba.org,
        khandual@linux.vnet.ibm.com, aneesh.kumar@linux.vnet.ibm.com,
        bsingharora@gmail.com, hbabu@us.ibm.com, mhocko@kernel.org,
        bauerman@linux.vnet.ibm.com, ebiederm@xmission.com, arnd@arndb.de
From:   Dave Hansen <dave.hansen@intel.com>
Message-ID: <9e410d84-3cd3-edf5-4699-26fcc2bbb393@intel.com>
Date:   Fri, 16 Mar 2018 15:13:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1519264541-7621-10-git-send-email-linuxram@us.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 02/21/2018 05:55 PM, Ram Pai wrote:
> alloc_random_pkey() was allocating the same pkey every time.
> Not all pkeys were geting tested. fixed it.
...
> @@ -602,13 +603,15 @@ int alloc_random_pkey(void)
>  	int alloced_pkeys[NR_PKEYS];
>  	int nr_alloced = 0;
>  	int random_index;
> +
>  	memset(alloced_pkeys, 0, sizeof(alloced_pkeys));
> +	srand((unsigned int)time(NULL));
>  
>  	/* allocate every possible key and make a note of which ones we got */
>  	max_nr_pkey_allocs = NR_PKEYS;
> -	max_nr_pkey_allocs = 1;
>  	for (i = 0; i < max_nr_pkey_allocs; i++) {
>  		int new_pkey = alloc_pkey();

The srand() is probably useful, but won't this always just do a single
alloc_pkey() now?  That seems like it will mean we always use the first
one the kernel gives us, which isn't random.

> -	dprintf1("%s()::%d, ret: %d pkey_reg: 0x%x shadow: 0x%x\n", __func__,
> -			__LINE__, ret, __rdpkey_reg(), shadow_pkey_reg);
> +	dprintf1("%s()::%d, ret: %d pkey_reg: 0x%x shadow: 0x%016lx\n",
> +		__func__, __LINE__, ret, __rdpkey_reg(), shadow_pkey_reg);
>  	return ret;
>  }

This belonged in the pkey_reg_t patch, I think.

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

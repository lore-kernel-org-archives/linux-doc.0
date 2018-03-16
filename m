Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id ABF337E66E
	for <lwn-linux-doc@archive.lwn.net>; Fri, 16 Mar 2018 22:19:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751499AbeCPWTW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 16 Mar 2018 18:19:22 -0400
Received: from mga12.intel.com ([192.55.52.136]:54176 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750915AbeCPWTV (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 16 Mar 2018 18:19:21 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Mar 2018 15:19:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,317,1517904000"; 
   d="scan'208";a="25371125"
Received: from ray.jf.intel.com (HELO [10.7.201.16]) ([10.7.201.16])
  by orsmga007.jf.intel.com with ESMTP; 16 Mar 2018 15:19:20 -0700
Subject: Re: [PATCH v12 11/22] selftests/vm: pkey register should match shadow
 pkey
To:     Ram Pai <linuxram@us.ibm.com>, shuahkh@osg.samsung.com,
        linux-kselftest@vger.kernel.org
References: <1519264541-7621-1-git-send-email-linuxram@us.ibm.com>
 <1519264541-7621-12-git-send-email-linuxram@us.ibm.com>
Cc:     mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
        linux-mm@kvack.org, x86@kernel.org, linux-arch@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        mingo@redhat.com, akpm@linux-foundation.org,
        benh@kernel.crashing.org, paulus@samba.org,
        khandual@linux.vnet.ibm.com, aneesh.kumar@linux.vnet.ibm.com,
        bsingharora@gmail.com, hbabu@us.ibm.com, mhocko@kernel.org,
        bauerman@linux.vnet.ibm.com, ebiederm@xmission.com, arnd@arndb.de
From:   Dave Hansen <dave.hansen@intel.com>
Message-ID: <e9270064-4951-26dc-aeb0-1378fd7ab542@intel.com>
Date:   Fri, 16 Mar 2018 15:19:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1519264541-7621-12-git-send-email-linuxram@us.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 02/21/2018 05:55 PM, Ram Pai wrote:
> expected_pkey_fault() is comparing the contents of pkey
> register with 0. This may not be true all the time. There
> could be bits set by default by the architecture
> which can never be changed. Hence compare the value against
> shadow pkey register, which is supposed to track the bits
> accurately all throughout
> 
> cc: Dave Hansen <dave.hansen@intel.com>
> cc: Florian Weimer <fweimer@redhat.com>
> Signed-off-by: Ram Pai <linuxram@us.ibm.com>
> ---
>  tools/testing/selftests/vm/protection_keys.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/vm/protection_keys.c b/tools/testing/selftests/vm/protection_keys.c
> index 254b66d..6054093 100644
> --- a/tools/testing/selftests/vm/protection_keys.c
> +++ b/tools/testing/selftests/vm/protection_keys.c
> @@ -926,10 +926,10 @@ void expected_pkey_fault(int pkey)
>  	pkey_assert(last_pkey_faults + 1 == pkey_faults);
>  	pkey_assert(last_si_pkey == pkey);
>  	/*
> -	 * The signal handler shold have cleared out PKEY register to let the
> +	 * The signal handler shold have cleared out pkey-register to let the

Heh, you randomly changed the formatting and didn't bother with my awful
typo. :)

>  	 * test program continue.  We now have to restore it.
>  	 */
> -	if (__rdpkey_reg() != 0)
> +	if (__rdpkey_reg() != shadow_pkey_reg)
>  		pkey_assert(0);
>  
>  	__wrpkey_reg(shadow_pkey_reg);
> 

I don't think this should be "shadow_pkey_reg".  This was just trying to
double-check that the signal handler messed around with PKRU the way we
expected.

We could also just check that the disable bits for 'pkey' are clear at
this point.  That would be almost as good.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1A6517E66E
	for <lwn-linux-doc@archive.lwn.net>; Fri, 16 Mar 2018 22:06:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751499AbeCPWGy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 16 Mar 2018 18:06:54 -0400
Received: from mga03.intel.com ([134.134.136.65]:26225 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751233AbeCPWGx (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 16 Mar 2018 18:06:53 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Mar 2018 15:06:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,317,1517904000"; 
   d="scan'208";a="25369307"
Received: from ray.jf.intel.com (HELO [10.7.201.16]) ([10.7.201.16])
  by orsmga007.jf.intel.com with ESMTP; 16 Mar 2018 15:06:52 -0700
Subject: Re: [PATCH v12 06/22] selftests/vm: fix the wrong assert in
 pkey_disable_set()
To:     Ram Pai <linuxram@us.ibm.com>, shuahkh@osg.samsung.com,
        linux-kselftest@vger.kernel.org
References: <1519264541-7621-1-git-send-email-linuxram@us.ibm.com>
 <1519264541-7621-7-git-send-email-linuxram@us.ibm.com>
Cc:     mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
        linux-mm@kvack.org, x86@kernel.org, linux-arch@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        mingo@redhat.com, akpm@linux-foundation.org,
        benh@kernel.crashing.org, paulus@samba.org,
        khandual@linux.vnet.ibm.com, aneesh.kumar@linux.vnet.ibm.com,
        bsingharora@gmail.com, hbabu@us.ibm.com, mhocko@kernel.org,
        bauerman@linux.vnet.ibm.com, ebiederm@xmission.com, arnd@arndb.de
From:   Dave Hansen <dave.hansen@intel.com>
Message-ID: <efe141d5-b609-c21e-8860-c0184e167770@intel.com>
Date:   Fri, 16 Mar 2018 15:06:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1519264541-7621-7-git-send-email-linuxram@us.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 02/21/2018 05:55 PM, Ram Pai wrote:
> If the flag is 0, no bits will be set. Hence we cant expect
> the resulting bitmap to have a higher value than what it
> was earlier.
> 
> cc: Dave Hansen <dave.hansen@intel.com>
> cc: Florian Weimer <fweimer@redhat.com>
> Signed-off-by: Ram Pai <linuxram@us.ibm.com>
> ---
>  tools/testing/selftests/vm/protection_keys.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/tools/testing/selftests/vm/protection_keys.c b/tools/testing/selftests/vm/protection_keys.c
> index 83216c5..0109388 100644
> --- a/tools/testing/selftests/vm/protection_keys.c
> +++ b/tools/testing/selftests/vm/protection_keys.c
> @@ -443,7 +443,7 @@ void pkey_disable_set(int pkey, int flags)
>  	dprintf1("%s(%d) pkey_reg: 0x%lx\n",
>  		__func__, pkey, rdpkey_reg());
>  	if (flags)
> -		pkey_assert(rdpkey_reg() > orig_pkey_reg);
> +		pkey_assert(rdpkey_reg() >= orig_pkey_reg);
>  	dprintf1("END<---%s(%d, 0x%x)\n", __func__,
>  		pkey, flags);
>  }

I'm not sure about this one.  Did this cause a problem for you?

Why would you call this and ask no bits to be set?

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

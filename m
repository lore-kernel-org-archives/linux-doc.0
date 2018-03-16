Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D85197E66E
	for <lwn-linux-doc@archive.lwn.net>; Fri, 16 Mar 2018 22:10:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751372AbeCPWKR (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 16 Mar 2018 18:10:17 -0400
Received: from mga14.intel.com ([192.55.52.115]:50519 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751245AbeCPWKQ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 16 Mar 2018 18:10:16 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Mar 2018 15:10:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,317,1517904000"; 
   d="scan'208";a="25369736"
Received: from ray.jf.intel.com (HELO [10.7.201.16]) ([10.7.201.16])
  by orsmga007.jf.intel.com with ESMTP; 16 Mar 2018 15:10:15 -0700
Subject: Re: [PATCH v12 08/22] selftests/vm: clear the bits in shadow reg when
 a pkey is freed.
To:     Ram Pai <linuxram@us.ibm.com>, shuahkh@osg.samsung.com,
        linux-kselftest@vger.kernel.org
References: <1519264541-7621-1-git-send-email-linuxram@us.ibm.com>
 <1519264541-7621-9-git-send-email-linuxram@us.ibm.com>
Cc:     mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
        linux-mm@kvack.org, x86@kernel.org, linux-arch@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        mingo@redhat.com, akpm@linux-foundation.org,
        benh@kernel.crashing.org, paulus@samba.org,
        khandual@linux.vnet.ibm.com, aneesh.kumar@linux.vnet.ibm.com,
        bsingharora@gmail.com, hbabu@us.ibm.com, mhocko@kernel.org,
        bauerman@linux.vnet.ibm.com, ebiederm@xmission.com, arnd@arndb.de
From:   Dave Hansen <dave.hansen@intel.com>
Message-ID: <a884e9eb-4da6-54af-e09e-acac7ceee397@intel.com>
Date:   Fri, 16 Mar 2018 15:10:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1519264541-7621-9-git-send-email-linuxram@us.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 02/21/2018 05:55 PM, Ram Pai wrote:
> When a key is freed, the  key  is  no  more  effective.
> Clear the bits corresponding to the pkey in the shadow
> register. Otherwise  it  will carry some spurious bits
> which can trigger false-positive asserts.
...
> diff --git a/tools/testing/selftests/vm/protection_keys.c b/tools/testing/selftests/vm/protection_keys.c
> index ca54a95..aaf9f09 100644
> --- a/tools/testing/selftests/vm/protection_keys.c
> +++ b/tools/testing/selftests/vm/protection_keys.c
> @@ -582,6 +582,9 @@ int alloc_pkey(void)
>  int sys_pkey_free(unsigned long pkey)
>  {
>  	int ret = syscall(SYS_pkey_free, pkey);
> +
> +	if (!ret)
> +		shadow_pkey_reg &= reset_bits(pkey, PKEY_DISABLE_ACCESS);
>  	dprintf1("%s(pkey=%ld) syscall ret: %d\n", __func__, pkey, ret);
>  	return ret;
>  }

Did this cause problems for you in practice?

On x86, sys_pkey_free() does not affect PKRU, so this isn't quite right.
 I'd much rather have the actual tests explicitly clear the PKRU bits
and also in the process clear the shadow bits.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

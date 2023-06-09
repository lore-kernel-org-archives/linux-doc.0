Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB49C7EE29
	for <linux-doc@archiver.kernel.org>; Fri,  9 Jun 2023 00:15:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237200AbjFIAPW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 8 Jun 2023 20:15:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229981AbjFIAPW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Jun 2023 20:15:22 -0400
Received: from mail.zytor.com (unknown [IPv6:2607:7c80:54:3::138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9229C2D68;
        Thu,  8 Jun 2023 17:15:21 -0700 (PDT)
Received: from [172.27.2.41] ([73.231.166.163])
        (authenticated bits=0)
        by mail.zytor.com (8.17.1/8.17.1) with ESMTPSA id 3590EBwb1069072
        (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
        Thu, 8 Jun 2023 17:14:11 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 3590EBwb1069072
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
        s=2023051001; t=1686269655;
        bh=eETL6+MlMl0BOovD6hR1LxTwJy34pjipmc6N88BiyoY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=nkA2WU9VUv+xW1YPZFGnwcSq6G/5AFtmFSKNwIjsqdU8yMvYEqjQNTyqX7SwXiVdH
         NBPYrXo3KQQt3sVa827d69La1n74ytlWcVlVajaL8C9Aa/GJKWLmPC3I3k3ZRoQWtF
         HHHDwZTANxoHh6iphKSW5D6CL/SzDM9gNwVtD3aUxeaG202qL0zCOAk9RggyxHAG7G
         pSI3NZy+HlPZ5+e0J6tLFutQ8N4LVDO6Qp1aGpHVuSIPQEJGVUEXBQFICFnTAJYA7E
         rz8EFfbtzKrUHpXLd2ssOwJTlvTo9yTLlglJt1XEYPXrhhZ3S8xKGXp9RyefMhXdW+
         BEz71wLR4dAwQ==
Message-ID: <98718c79-d589-3689-3c59-6ca158148641@zytor.com>
Date:   Thu, 8 Jun 2023 17:14:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Direct rdtsc call side-effect
Content-Language: en-US
To:     David Laight <David.Laight@ACULAB.COM>,
        "'Thomas Gleixner'" <tglx@linutronix.de>,
        Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc:     Steven Noonan <steven@uplinklabs.net>,
        "kernel@collabora.com" <kernel@collabora.com>
References: <6719fb05-382c-8ec4-ccda-72798906a54b@collabora.com>
 <87mt1jeax1.ffs@tglx> <353732783fde46919fdcf698c326b7ed@AcuMS.aculab.com>
 <87jzwi55qo.ffs@tglx> <a39d90e45212461bb31738b7156b60a6@AcuMS.aculab.com>
 <4ea6e82c-4761-e0c9-3e75-8ec39eecb30a@zytor.com>
 <cabfcf8a8840410399d2bfc1202e77ce@AcuMS.aculab.com>
From:   "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <cabfcf8a8840410399d2bfc1202e77ce@AcuMS.aculab.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/6/23 01:23, David Laight wrote:
> 
> IIRC the x86 performance counters aren't dependent on anything
> so they tend to execute much earlier than you want.
> OTOH rdtsc is likely to be synchronising and affect what follows.
> ISTR using rdtsc to wait for instructions to complete and then
> the performance clock counter to see how long it took.
> 

RDPMC and RDTSC have the same (lack of) synchronization guarantees; you 
need to fence them appropriately for your application no matter what.

	-hpa


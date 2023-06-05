Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F4DC7EE24
	for <linux-doc@archiver.kernel.org>; Mon,  5 Jun 2023 16:33:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbjFEQdl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Jun 2023 12:33:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235065AbjFEQd3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Jun 2023 12:33:29 -0400
Received: from mail.zytor.com (unknown [IPv6:2607:7c80:54:3::138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C83E5E40;
        Mon,  5 Jun 2023 09:33:17 -0700 (PDT)
Received: from [172.27.2.41] ([73.231.166.163])
        (authenticated bits=0)
        by mail.zytor.com (8.17.1/8.17.1) with ESMTPSA id 355GWORK3938757
        (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
        Mon, 5 Jun 2023 09:32:26 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 355GWORK3938757
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
        s=2023051001; t=1685982748;
        bh=QzKVr2LoBWHFQbC68p/jgagz+vnQECzay1Xuo/y+g/8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=1em2soU6xzrZzWJ6eJ0F2W2ZLTuU2sc0HBqMtwhLc5Bq+9iEO9/Jw3TxE5uJV/nDX
         JGoJMStv6xkvY+yeRCzecEqFQ4rcCOm/S+v7kIw6dQrTmLPdmyQd2AGNLBl5/ez4i1
         59XPlRbiI5YNLiYjT+4UPgzqOeC9P9t65u3I5KLTENI0ZXtkrOzpWu8Vx6h/gHdSe6
         teuwQwPiAACcffhxljJEOPjRWMOHDm1bhpguq/NXQgVUEaSvq46eRH6DoPl9xRumQ2
         fjh5+9VjC/hK32y6y18Z2ftg+ofFCrhl5Nf6JRZA9UH6SqRvsPik1gm6DTc5AsHKgs
         8yGU5xFfYz3DA==
Message-ID: <4ea6e82c-4761-e0c9-3e75-8ec39eecb30a@zytor.com>
Date:   Mon, 5 Jun 2023 09:32:24 -0700
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
From:   "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <a39d90e45212461bb31738b7156b60a6@AcuMS.aculab.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/5/23 08:54, David Laight wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
>> Sent: 05 June 2023 15:44
>>
>> On Mon, Jun 05 2023 at 10:27, David Laight wrote:
>>> It has to be said that using it as a time source was fundamentally
>>> a bad idea.
>>
>> Too bad you weren't around many moons ago and educated us on that. That
>> would have saved us lots of trouble and work.
> 
> Indeed :-)
> I do remember thinking the TSC was really a good time source when
> I first saw it being done about 30 years ago.
> 

The TSC is certainly not perfect; partly because, ironically enough, it 
was introduced just *before* out of order and power management entered 
the x86 world.

It is no secret that it has been slow to catch up. It was easy to put a 
counter in; it is a *lot* harder to make it work in all the possible 
scenarios in the power-managed, out-of-order world.

It is one of my personal pet projects in the architecture work to push 
to get that last distance; we are not yet there.

> 
> I'm thinking of benchmarking the IP checksum code where you are
> trying to find out how many bytes/clock the loop is doing.
> On recent x86-64 the theoretical limit (without fighting AVX) 1s 16
> bytes/clock, I've measured 12, 8 is relatively easy.
> (The current asm code runs at 4 on older cpu, doesn't get
> much above 6 at all.)
> 
> What happens is that the cpu frequency speeds up as soon as the
> test starts but the TSC frequency stays constants.
> So you can only use the TSC to measure time, not execution speed.
> 
> Run enough copies of 'while :; do :; done &' to make all but one
> cpu busy and the cpus all speed up giving completely different
> TSC counts for short loops.
> 

That is the reason for architecturally fixed performance counters.

	-hpa


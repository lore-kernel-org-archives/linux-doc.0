Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCEA2741A0;
	Tue,  3 Feb 2026 15:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770132494; cv=none; b=Dl+mROXDjGQQI67k1s3UYxC1NavRw66RTKrQsO+E2xEXepUmEcs+xfiXtUfMcIIa7iY+AYr2iEpdNf4y7AP/U7eDsCSuB8Qj/N7GiOxvzZs0xuGKQiqdjIjff3zCOA/On1YMldsv76HdlgyN/YfRyNfd/wn62xrbSgHva9yxbnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770132494; c=relaxed/simple;
	bh=+6p143ELtev1Q0EPq1zvLV436kIhzaspuiQqOcld6lY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rFfgbFtlZ4eKKpRDUl13rES8rd1qzlXKGnvbuo2KRk93NKuu1CBdpyjz6QcLT4R3Jfxry2uHOgrIJmFBbAaTnJhsIV3Y/vXBWt//EePs9lTbMgr6X0D6tOIsTlx+MxPoryB9Yz4pfrWzbMuLV1F8gpvl1k3ialtomEr9CanaBd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OKYBtZed; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OKYBtZed"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4C4FC116D0;
	Tue,  3 Feb 2026 15:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770132494;
	bh=+6p143ELtev1Q0EPq1zvLV436kIhzaspuiQqOcld6lY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OKYBtZed69yoxj+qddE06qEbqsm41Vw762oBxTSpV19JigTIwTp8n6UVj7vs1SJkv
	 hT7YAI7LRaz5rXLJN1TzuddQsBn5UteXM0fAWeEHFsSbQhSq9/3JF9dzV2AkNiQ2xo
	 zMZfThhBIOCanPRjOEbVCCPD4qmH0k5gxCQZabWjNOZYYVOQInqTGvlBphcSyW/o1e
	 W+j+zOSEZ56DOarSmG2XO59jClAVrTDr3ZXl1Wcl72mF1X1H0VcyrPtYmT2Q+RBOyC
	 LR0tVRMaXABxJRUvTMRRKCE8Y9nkCYEtL7Wqb5HtISLMHzm5//bJclyuQqVuRH2Xoa
	 vN8GfnzyQCKsA==
From: Thomas Gleixner <tglx@kernel.org>
To: Alexander Graf <graf@amazon.com>, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Clemens
 Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Hansen
 <dave.hansen@linux.intel.com>, Borislav Petkov <bp@alien8.de>, Ingo Molnar
 <mingo@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Paolo Bonzini
 <pbonzini@redhat.com>, Pasha Tatashin <pasha.tatashin@soleen.com>,
 nh-open-source@amazon.com, Nicolas Saenz Julienne <nsaenz@amazon.es>,
 Hendrik Borghorst <hborghor@amazon.de>, Filippo Sironi <sironi@amazon.de>,
 David Woodhouse <dwmw@amazon.co.uk>, Jan =?utf-8?Q?Sch=C3=B6nherr?=
 <jschoenh@amazon.de>,
 ricardo.neri-calderon@linux.intel.com, Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH 2/2] hpet: Add HPET-based NMI watchdog support
In-Reply-To: <1e13c61d-8581-4ece-b31c-7aa771ba7bc2@amazon.com>
References: <20260202174803.66640-1-graf@amazon.com>
 <20260202174803.66640-3-graf@amazon.com> <87jywu3yov.ffs@tglx>
 <1e13c61d-8581-4ece-b31c-7aa771ba7bc2@amazon.com>
Date: Tue, 03 Feb 2026 16:28:11 +0100
Message-ID: <878qd94zjo.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Feb 03 2026 at 13:36, Alexander Graf wrote:
> On 03.02.26 11:32, Thomas Gleixner wrote:
>> On Mon, Feb 02 2026 at 17:48, Alexander Graf wrote:
>>> (Disclaimer: Some of this code was written with the help of Kiro, an AI
>>> coding assistant)
>> You could have sent your change log through AI too so it conforms with
>> the change log rules ...
>
> Maybe we should introduce an AGENTS.md file in Linux that tells the AI 
> tool to do that automatically? These tools usually don't read README 
> files. :)

I don't care what tools do, but I very much care about what the people
who use the tools do.

>>> +     if (panic_in_progress())
>>> +             return NMI_HANDLED;
>>> +
>>> +     /* Check if this NMI is from our HPET timer by comparing counter value */
>>> +     now = hpet_readl(HPET_COUNTER);
>> And both you and your AI assistant failed to read through the previous
>> discussions on that topic and the 10+ failed attempts to make it work
>> correctly.  Otherwise you would have figured out that reading HPET in
>> the NMI handler is a patently bad idea.
>>
>> I'm not reiterating any of it as it's well documented in the LKML archive.
>
>
> Thanks a bunch for the pointer. I had indeed missed the previous patch 
> set submissions on the same topic. Those look a lot more sophisticated 
> than the quick hacky version I built. Nice! Oh well, at least I 
> (re)learned a few things about the HPET along the way.
>
> Looking at the latest submission [1] (v7), I see patches but no reviews, 
> no acks and no merges. Those patches also seem to address most of your 
> concerns (obviously, since you reviewed them before :)). Reading the 
> side conversation about it [2], it sounds like the buddy hardlockup 
> detector is trying to fill the same gap as the HPET one and hence after 
> that got merged, interest faded?

I don't remember. That thing clearly fell through the cracks. Let me
find it again and reply to that.

As time has advanced there are probably a few things which need to be
addressed. 

Thanks,

        tglx

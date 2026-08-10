Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BA11925BC;
	Mon, 10 Aug 2026 17:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786382865; cv=none; b=WwLGKm1/X5DweWWoHIm5AEQGRZCfrbJV3q4PzJhrz9H1/P3pV7ajGSSerFaS7Vbyici7j/g0NZPjD5hi/shaPmlpEX57nimbENZUiIUglibdguoKMyJLWfthH1OF5/7w5qHdm05bnUAdldyP8Z03gdhvdzpfNy4Euw5mITt4zSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786382865; c=relaxed/simple;
	bh=/1GqHEjvFoRSreA8tPIlY4D6uvbdFlps8RNjxM+MFQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I36RuJnixUfFkWWIo6n9eNwY7/raxwKA5Z4iO1K/dk/weaW/scSrzs3cumIywnTBGIZ8LH5yqgB5A2qSIDbHphe/v/lzg3tFXQmGatFuoCqVIOztr8QfRXivX/Ub5A6xhwMwb2eYvXCGGFulXP1l/P1vynneZpw3oh2ZF3dYvSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fNa8VgEN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fNa8VgEN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7827C1F000E9;
	Mon, 10 Aug 2026 17:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786382864;
	bh=xmaOpK4eYJtLcgoq8H9MXv4nodL1OBS5iwdh10/FuHY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=fNa8VgENVLWeBzgwc4d24oegKZNQEDcGoac/L6qhNUtjJQuWqRvptFA4gNk2msJ4N
	 4b+83jTHxY17brQMIfDD7RKVwTnALyqH7zr21X/HBU02//S8tT5t9nlEZQoom61GNM
	 +KoUxA8mDH9SKUaZzappphl6q6a8JyskTNcHVKfKyvwwKOs1FYVCNpNEW9ZZbjw341
	 fy1NxDIFPdXUI71hEwNRtgnkZavOuWD4xBi+MnvDmHYlBCvjFNNQXViqpzLiQe+Ty6
	 z0AOjrSnlqUsWIzEX0o5jgWVpjNVTtpSFim5MpTatBbzgY5RuA2wSHZTgSXA38ek1X
	 4t1lSMgTuMwDA==
Message-ID: <05d560cb-d218-4638-bfcb-d3e549720b16@kernel.org>
Date: Mon, 10 Aug 2026 12:27:42 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Documentation/arch/x86/amd-debugging: Add section
 about delay_suspend
Content-Language: en-US
To: Borislav Petkov <bp@alien8.de>, Daniel Gibson <daniel@gibson.sh>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
References: <20260624124326.746525-1-daniel@gibson.sh>
 <20260624124326.746525-3-daniel@gibson.sh>
 <b784820c-a027-44fd-a47a-ba51e52de7ea@gibson.sh>
 <20260805224017.GCanO70QxPHpDxW2-c@fat_crate.local>
 <87aa8f40-2c99-4bbc-88f4-1ef6d54f3c60@gibson.sh>
 <20260806014151.GFanPmX5VhBUG_6DLS@fat_crate.local>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260806014151.GFanPmX5VhBUG_6DLS@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/5/26 20:41, Borislav Petkov wrote:
> On Thu, Aug 06, 2026 at 12:54:04AM +0200, Daniel Gibson wrote:
>> That document mainly talks about s2idle issues and lists issues that have
>> been quirked in the past, so IMHO it fits there?
> 
> Did you not read the first sentence of that document?
> 
>> Also, Mario Limonciello (of AMD) suggested documenting it there in:
>> https://lore.kernel.org/platform-driver-x86/f86d9af4-6415-427a-9f4e-639b2ae6203e@kernel.org/
> 
> Maybe he needs to read the first sentence of that document too.
> 
>> However, if there's a specific Wiki you think would be appropriate to
>> document this in, I should probably document it there as well.
> 
> You have a pretty good commit message in
> 
>    428b9fd2dce5 ("platform/x86/amd/pmc: Add delay_suspend module parameter")
> 
> You have a bugzilla entry, you have a mailing list thread, you have a module
> param documentation.
> 
> How much more do you need to document this? People should be able to use
> search engines or AI, right?
> 
> The problem with adding some hints as to how suspend can be fixed on some
> laptops is that we'll open the floodgates. Do you know how many laptops need
> quirks and fixes for suspend?
> 
> In any case, this doc is not for that.
> 
> Sorry.
> 

I guess I have a different opinion here.  If someone very technical 
comes to me and says I want to debug an issue with suspend or shutdown I 
want to give them a single link that has all the information they can 
use to learn.

I thought this could fit in well at 18.7, and then even if a search 
engine or AI tool stumbles on that page it can learn about the debugging 
parameter too.

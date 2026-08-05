Received: from smtp-42af.mail.infomaniak.ch (smtp-42af.mail.infomaniak.ch [84.16.66.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8621841D113
	for <linux-doc@vger.kernel.org>; Wed,  5 Aug 2026 22:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785970453; cv=none; b=DmrSdhxlzeUStruWXPpOGMpjuvSY+W3IeOj7vsBQFj90vN2V56C9zaT9t5IbW2+ncRYzvMlboeRWuneh5fztLGzxCxPNnziGNsI39Kda5U9Nt629W6lwmB7/cJW2m2rszbHLmLyCnFaxr11edkSdUVl7nTtBZEaf8ja+StiIH6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785970453; c=relaxed/simple;
	bh=oewnEe14kaB8XDm5GpkaVLZkIwiHqy+X0QsiWm4/w9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hbyee8GCHPJFl1d65kuHzXOPpPj/N16OklqyZv+FFEjr6YfItOruXlIKNxvHH4Y2O9XnADCZ73eChehwgrmprkRWMEjOyT5FJzQ4qRozg3udauh8WijH+Y8jgGP6ldzprGWz423Pt4rnr6ROsNLD3VUv3ASqp4g+2dBn+YfC0Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh; spf=pass smtp.mailfrom=gibson.sh; dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b=RIuOM2rm; arc=none smtp.client-ip=84.16.66.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gibson.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b="RIuOM2rm"
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4hFm1W3LbmzZhn;
	Thu,  6 Aug 2026 00:54:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gibson.sh;
	s=20260228; t=1785970447;
	bh=wr9bTNYWG8k3rN54Rtif7YaEf7FLcyiOPBHegMBXBmA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RIuOM2rm3v5AXidPunWQmbk+hwmQyjrGZMQX0XAa6bGhgTCMsMrDGh49eKeWiSOR8
	 OGoblVAQ7efkVN9vz7+bfnhOMFBo44HVOU8QdHBYGOqUU4Z491YCdus6rgnouLneK8
	 9w4UFQcHfDEUWW42HXqqSKQgr+uM+46eSRYX3J5MTi3ijFimii7gT2g0gPUkGOdlOp
	 7cNucTvO/qpc9PFzBncYVbyFqfkzIO17ssVumJI883l5YEOaE89SCOt56nSTcJKrcC
	 m2QYnVcceNmfIWuVu7yveq9P2ZoHmk14uDxBotn0L6lRnMGae9uPSpfDRWxQe7159k
	 6rCs3w3NBpwqw==
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4hFm1T1lfZzQ3S;
	Thu,  6 Aug 2026 00:54:05 +0200 (CEST)
Message-ID: <87aa8f40-2c99-4bbc-88f4-1ef6d54f3c60@gibson.sh>
Date: Thu, 6 Aug 2026 00:54:04 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Documentation/arch/x86/amd-debugging: Add section
 about delay_suspend
To: Borislav Petkov <bp@alien8.de>, Mario Limonciello <superm1@kernel.org>
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
Content-Language: en-US
From: Daniel Gibson <daniel@gibson.sh>
In-Reply-To: <20260805224017.GCanO70QxPHpDxW2-c@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Infomaniak-Routing: alpha



On 06/08/2026 12:40 am, Borislav Petkov wrote:
> On Thu, Aug 06, 2026 at 12:09:13AM +0200, Daniel Gibson wrote:
>> any chance to get this merged?
>> As the delay_suspend parameter for the amd_pmc module are in all the current
>> stable kernels >= 6.6 now (6.6.147, 6.12.100 etc) it would be great if the
>> documentation was also available.
> 
> I'm not sure this belongs here. More likely on some wiki page or so, but not
> in a document which talks about techniques how to debug AMD machines.
> 

That document mainly talks about s2idle issues and lists issues that 
have been quirked in the past, so IMHO it fits there?

Also, Mario Limonciello (of AMD) suggested documenting it there in:
https://lore.kernel.org/platform-driver-x86/f86d9af4-6415-427a-9f4e-639b2ae6203e@kernel.org/

However, if there's a specific Wiki you think would be appropriate to 
document this in, I should probably document it there as well.

Cheers,
Daniel

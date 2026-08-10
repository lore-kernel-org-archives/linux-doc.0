Received: from smtp-42a8.mail.infomaniak.ch (smtp-42a8.mail.infomaniak.ch [84.16.66.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF9737F300
	for <linux-doc@vger.kernel.org>; Mon, 10 Aug 2026 20:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786393704; cv=none; b=MX18NhQTI5nuYx6AZaPujKd58bD2f5e2dBPMoUaBhBFX3ko1UntqW5xozldWzT4tbzBJXinT9BBZ9ZDwv6JNg5YnlGFhuHyJ2X6IBF/z3eXlQrEEx/dMZuDl1qdAhPKbZr5H5Ipti7dAFQGxP1rnQOlEXbl66DO5XwigCz79rPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786393704; c=relaxed/simple;
	bh=WaHj5Zt+OlrXBWAOx8cwo6TE6HgBE+TGhfmUqd6RUV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gBuc0NzpOigxm5D11zmIqwZvXviuGZTrQO7NdXQRdkOSvFlAxpEhdhtsM9H2C6ebJXTiceKR+BDdukR7N24r9uMJLfArWzZfXpmCKrHgu/nyAamwDHSZEG2P0RBIt1tsJI5luH+ffUUTaF/DnbWzg7FoV9aio5ubYVvuWcI4PZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh; spf=pass smtp.mailfrom=gibson.sh; dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b=NtRLau8F; arc=none smtp.client-ip=84.16.66.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gibson.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b="NtRLau8F"
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4hJmXt1QZwznq9;
	Mon, 10 Aug 2026 22:28:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gibson.sh;
	s=20260228; t=1786393693;
	bh=bzHOf4RkDtrbhzhDZ0OVVDaP9rUzza8uKqcWI8q1P8I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NtRLau8FChXR/HKlcAHAwtecTUfpMkCd+zT8JC5r8y+mQzvT1C7LP4YYDKYjT++fs
	 yL3N3K9zLQfND3pMDlnPN1iwFyEw1XZUDr/Ka6hiFVMvYWcrHdM5sngwuGbGh+1OU1
	 7Lf7zDUn2dhkkIvs9bY5QPQmQSU9J0kTG0IgHz9GpZTx2l18SfQs+TUWFnyb1oCp/q
	 9ycpnX6iAfmyoLTG8YlYbYdQ6xa84y1CQGketONKCciJh5lovqZgBqYV7sCqcrOv+H
	 AtvPfVjq27ATygQxhHpA/igev4bIcA5X40NA+/kuISHMxC7g6pq0TiMeJPQ8ReQz4c
	 nbB0so/t6mDzQ==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4hJmXr0QBXzwxT;
	Mon, 10 Aug 2026 22:28:11 +0200 (CEST)
Message-ID: <6a9c7f9e-600c-490e-86e6-9f358b0c1a82@gibson.sh>
Date: Mon, 10 Aug 2026 22:28:11 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Documentation/arch/x86/amd-debugging: Add section
 about delay_suspend
To: Mario Limonciello <superm1@kernel.org>, Borislav Petkov <bp@alien8.de>
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
 <05d560cb-d218-4638-bfcb-d3e549720b16@kernel.org>
Content-Language: de-DE, en-GB
From: Daniel Gibson <daniel@gibson.sh>
In-Reply-To: <05d560cb-d218-4638-bfcb-d3e549720b16@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

On 10.08.26 19:27, Mario Limonciello wrote:
> On 8/5/26 20:41, Borislav Petkov wrote:
>> On Thu, Aug 06, 2026 at 12:54:04AM +0200, Daniel Gibson wrote:
>>> That document mainly talks about s2idle issues and lists issues that
>>> have
>>> been quirked in the past, so IMHO it fits there?
>>
>> Did you not read the first sentence of that document?
>>
>>> Also, Mario Limonciello (of AMD) suggested documenting it there in:
>>> https://lore.kernel.org/platform-driver-x86/
>>> f86d9af4-6415-427a-9f4e-639b2ae6203e@kernel.org/
>>
>> Maybe he needs to read the first sentence of that document too.
>>
>>> However, if there's a specific Wiki you think would be appropriate to
>>> document this in, I should probably document it there as well.
>>
>> You have a pretty good commit message in
>>
>>    428b9fd2dce5 ("platform/x86/amd/pmc: Add delay_suspend module
>> parameter")
>>
>> You have a bugzilla entry, you have a mailing list thread, you have a
>> module
>> param documentation.
>>
>> How much more do you need to document this? People should be able to use
>> search engines or AI, right?
>>
>> The problem with adding some hints as to how suspend can be fixed on some
>> laptops is that we'll open the floodgates. Do you know how many
>> laptops need
>> quirks and fixes for suspend?
>>
>> In any case, this doc is not for that.
>>
>> Sorry.
>>
> 
> I guess I have a different opinion here.  If someone very technical
> comes to me and says I want to debug an issue with suspend or shutdown I
> want to give them a single link that has all the information they can
> use to learn.
> 
> I thought this could fit in well at 18.7, and then even if a search
> engine or AI tool stumbles on that page it can learn about the debugging
> parameter too.

The assumption that commit messages or bug reports are documentation
sure explains why Linux official documentation is so lacking and users
(have to) rely on AI and Reddit and distro forums and the like, where
like half of the information is outdated or even misunderstood hearsay.

Even as a very technical users with strong coding skills (compared to
normal users, not to kernel developers), using git blame to figure out
the context of kernel module parameter's one-line documentation is very
annoying.

I thought that AMD debugging document was a step in the right direction
(and wondered if I just haven't found the proper documentation in
similar cases in the past), but seems like it's just a glitch in the matrix…


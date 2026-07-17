Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 430613F8230;
	Fri, 17 Jul 2026 12:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784291596; cv=none; b=UygR87DR9AtQGbPsg1e3w2S/9x4sopht0c+XDYOPY1Uiq31n6ZKoOHs0nQfnovZfKhj1I4jBU/JhNauQU6UlnOudZLD0W/CM7u2Qll26SOyPSPX3w7YVbRNz1MZGLmct/B1JDZE8aIhKEuQB1Q+w+1c8ZxcFX9YJ8zj1itod41g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784291596; c=relaxed/simple;
	bh=RDpVVg8kFR8tLzOuRdIhEL58jET3NKRROOt/Z0gxSao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZI2H6N2XsKW49DZHtiMUaIXfAvHhqWRQ7bNLju1VqCFFL73mcXAq89fb6rdUBL7pvySqyEKR/lPjXjW40eSwG/0hozhlZeqrWBbzMSxKL7L5MtOnBWR/LBimfeRGSYZFdRaxREoHf0ca6bWTrafvFZvuC5AvminwMJSOn3tz7Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=hMWp8GwJ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="hMWp8GwJ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A85021476;
	Fri, 17 Jul 2026 05:33:07 -0700 (PDT)
Received: from [10.57.84.220] (unknown [10.57.84.220])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 467C23F7B4;
	Fri, 17 Jul 2026 05:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784291591; bh=RDpVVg8kFR8tLzOuRdIhEL58jET3NKRROOt/Z0gxSao=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hMWp8GwJzRF5UZIO7llWHBXTN/HLu31bPfKJMWbDqFPVX/ABCDP7Uv8E3nfr/pgz6
	 mz93o+2LPGP9NgzF7GOkgmnMKpHPVuOlv83VrSes5m+va/CFG+etb0rtKfkR6zbW0B
	 a1EOO8mqxjWKsUm2Nf3s27A0ZKvy/CA6wT5MW1T8=
Message-ID: <a39b2bef-8fb5-444d-8ab8-3882224a3311@arm.com>
Date: Fri, 17 Jul 2026 13:33:07 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 0/8] Arm Core Local Accelerator Driver
Content-Language: en-GB
To: Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Jean-Philippe Brucker <jpb@kernel.org>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 oupton@kernel.org, hch@infradead.org, jgg@nvidia.com
References: <20260717104759.123203-1-ryan.roberts@arm.com>
 <aloS_T3LQvpHeZUV@willie-the-truck> <87ech1rf6n.wl-maz@kernel.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <87ech1rf6n.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/07/2026 13:09, Marc Zyngier wrote:
> Thanks Will for roping me in.

Sorry - I intentionally didn't include you because last time we spoke you said
you were only really interested in discussions on the virt side of things and I
didn't want to spam your inbox. Perhaps the wrong decision...

> 
> On Fri, 17 Jul 2026 12:33:17 +0100,
> Will Deacon <will@kernel.org> wrote:
>>
>>> I'm deliberately constraining the scope to bare-metal support for now.
>>> Virtualization is something we are considering (and have prototyped), but plan
>>> to post a separate RFC for that as follow-up, once we have agreement on
>>> direction for the bare-metal driver.
>>
>> I'd actually like to see what the virtualisation part looks like first
>> because doing it as a bolt-on later feels like the wrong approach. The
>> structure you have at the moment is remarkably clean, given the
>> architectural/CPU interactions (this thing even apparently builds as a
>> module, nice!), but I'm unsure how far you can push the separation once
>> you need to start hacking at KVM. Maybe the MMU notifiers are enough,
>> but I can't tell.
> 
> +1.
> 
> Virtualisation cannot be a "bolt on the side" exercise. It is an
> integral part of the arm64 tree, particularly for memory management
> and scheduling, all of which have a direct impact on KVM.
> 
> I don't think we can really evaluate anything here without looking at
> the full picture.

OK understood - as per reply to Will, we'll prioritise doing a version with virt
support.

Thanks,
Ryan


> 
> Thanks,
> 
> 	M.
> 


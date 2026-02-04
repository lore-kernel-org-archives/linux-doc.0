Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF143DAC02;
	Wed,  4 Feb 2026 10:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770201262; cv=none; b=Wrgf3xIncb76+Mu6PBDTQliZbk2w/rzU3/vONbXjf4JofXWw3KqK1YUnGzUqywSbKnOhRsWX0gfoCH95FETwHPpcvyobPZoKK2OjqeATwhKLJM9VSuh4fEnSsAWxccreFX+QgJxPssrp0G8Fa/h7r/95mtHVPqznnD4Zvpy2sms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770201262; c=relaxed/simple;
	bh=6LVvhhN7OrPbSfPoAw0XiTmkyIgZ6z/ZrIxoempBPGo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VoCBzr+PKGYFJgUk6GhcbJc7ymZ8s9YUPTqCsTL98Nr7870it4NSIsvgrSq3NxQK5p/Lb5v0P4QtYHYCkAzwGhsJkB5ASA8GaWp+HW0SlTAvDNsLeTXbBlbsjKLcrKe5Wre+8fupDQACTPKZr0t/CAnye/cx8/7QrlVuSD2sEcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u/nAKrnx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u/nAKrnx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDF38C4CEF7;
	Wed,  4 Feb 2026 10:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770201262;
	bh=6LVvhhN7OrPbSfPoAw0XiTmkyIgZ6z/ZrIxoempBPGo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=u/nAKrnxfM7NAqLhJp41ZCOAHN/RlZdXNO7ppdSjq81NiirhHjmXnVaSDXBNxF3BY
	 9n6yw63+AxgicR09I/hfmULj3ogWMU75QooBEAfrbpV/jSftKzfF9I88ITXiO0oxtl
	 ao5EKNOR2Lsd60xUXqXY2j1KZe38r90GOq/y756LzHoJIzZ7f8JOfFgokJXecQ1lhA
	 352B+ZKtFHi/acV+BCNpamHu+8BZImO/BZAEFpWmVhIH5zCtx/SjncQKSqQtGzpt1e
	 xbY1743U8Hgj0mxlOB85Nvr95PPPB2oKpdC6WGrlP2yNAbonWF75XY/tCB3CtZyzLh
	 JvMRCgdo3WJhg==
From: Thomas Gleixner <tglx@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>, Alexander Graf <graf@amazon.com>,
 Sasha Levin <sashal@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Hansen
 <dave.hansen@linux.intel.com>, Borislav Petkov <bp@alien8.de>, Ingo Molnar
 <mingo@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Paolo Bonzini
 <pbonzini@redhat.com>, Pasha Tatashin <pasha.tatashin@soleen.com>,
 nh-open-source@amazon.com, Nicolas Saenz Julienne <nsaenz@amazon.es>,
 Hendrik Borghorst <hborghor@amazon.de>, Filippo Sironi <sironi@amazon.de>,
 Jan =?utf-8?Q?Sch=C3=B6nherr?= <jschoenh@amazon.de>,
 ricardo.neri-calderon@linux.intel.com
Subject: Re: [PATCH 2/2] hpet: Add HPET-based NMI watchdog support
In-Reply-To: <4539d23f9f857da28d3414f512afe3c8bfe6c426.camel@infradead.org>
References: <20260202174803.66640-1-graf@amazon.com>
 <20260202174803.66640-3-graf@amazon.com> <87jywu3yov.ffs@tglx>
 <1e13c61d-8581-4ece-b31c-7aa771ba7bc2@amazon.com> <aYIhJWiBtiCF4UCr@laps>
 <1d74c3cc-d125-49cb-af05-43ca7d15f3f8@amazon.com>
 <be0ea0adfabcca5c191e07ca5a3811604633f70b.camel@infradead.org>
 <87fr7h368r.ffs@tglx>
 <4539d23f9f857da28d3414f512afe3c8bfe6c426.camel@infradead.org>
Date: Wed, 04 Feb 2026 11:34:18 +0100
Message-ID: <87zf5o23x1.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Feb 03 2026 at 23:13, David Woodhouse wrote:
> On Tue, 2026-02-03 at 21:46 +0100, Thomas Gleixner wrote:
>> On Tue, Feb 03 2026 at 17:43, David Woodhouse wrote:
>> > Honestly, even when I've explicitly told Kiro three times *not* to do
>> > something, *and* implemented a git commit hook to catch it out, it has
>> > a tendency just to automatically override the commit hook!
>> 
>> Anarchic Intelligence :)
>> 
>> > If it was made of meat, I'd have stabbed it by now.
>> 
>> rm -rf solves that problem too once and forever.
>
> There *are* cases where it's actually an accelerating function,
> especially where there's a bunch of boilerplate/infrastructure code to
> be generated. But by $DEITY you have to keep a close eye on it. It has
> absolutely no taste whatsoever.
>
> And I've watched it spend quarter of an hour failing to use its own
> file read/write tools to edit C files, falling back to sed and then
> python scripts to make the simple changes it wanted to make. Sometimes
> needing to be prompted because it thought its sed script had worked
> when in fact it hadn't. It's... impressive :)

You clearly proved the point that this is accelerating the time and
energy waste.

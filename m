Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93646242D89;
	Tue, 23 Jun 2026 13:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782220238; cv=none; b=lYC83TTo4hw2dS+WWAdVvgnCVtZ2pcZuZE1I8+Yi+c5tHlZVF1FRJ2jNXy/98vXhJCoXBoqpit1cUalqrccrZPP8gsk3gdkkmqJJs3IghPUToYOXDDSjOP3ach+Tiru+jsbjjsyCsAOuX0WAMCmhMLVR2+g8I4MHjmo7wHWVZhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782220238; c=relaxed/simple;
	bh=ehvcB8FcpHiQIksCTY93P4bH53TLUVXohknjUrd54d8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rLbs1lHan2oMo7P+o7E120OHmRDO4YHBgQY+2TclRGwne0Zcopvb9YZG0mRS6YXh0nW4d/x3N+9M/qgyTwk/pYOQGy60YVt3FlmkF4iy+J2Z4uP5BZw4XS93j3kAMAiAfJ9zHOIKJndnpYs3xGHJjoZd+dBlDQmQd9ixTKOsj9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lwcGsVlG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lwcGsVlG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52B001F000E9;
	Tue, 23 Jun 2026 13:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782220237;
	bh=ySc/aU88S6zSpYP9xtAHR5MOl3lswAD1LvzVMh44STc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=lwcGsVlGmcwleSUa+A8hLzj+NGdzH6Y2I1/rOJSzYRIIYezzYMYMPVrPRQ48p6ryN
	 HCeIPZwTqvHv4bxVit2bpZ55mELXNbC8DnshsrQFi3O/nr5a1TOjfhBl4rzNPpYYaG
	 s0IkZTPen5kAJlYWNL6QNcraZhJlNtSCVnW82hygriTiFyfQFrJGRiImoU9gcgIftg
	 91+c3VMiEF2pVllwdflj8jRMREiydmr57VoaewxsYyrDnc7iwxHs4M43/J1C00L5J2
	 Kx+/vvUqLJwW10wZhEOwJC5uuoRDHWjXZ1iIR3iQuiqlWCA/7XQkBrG6AWazz4oE5y
	 DAyh7BgcnFbIA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Shyam Saini <shyamsaini@linux.microsoft.com>
Cc: linux-mm@kvack.org,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org,  rppt@kernel.org,
  akpm@linux-foundation.org,  kees@kernel.org,  tony.luck@intel.com,
  gpiccoli@igalia.com,  bp@alien8.de,  rdunlap@infradead.org,
  peterz@infradead.org,  feng.tang@linux.alibaba.com,
  dapeng1.mi@linux.intel.com,  elver@google.com,  enelsonmoore@gmail.com,
  kuba@kernel.org,  lirongqing@baidu.com,  ebiggers@kernel.org
Subject: Re: [RFC PATCH] reserve_mem: add support for static memory
In-Reply-To: <20260618224018.117978-1-shyamsaini@linux.microsoft.com> (Shyam
	Saini's message of "Thu, 18 Jun 2026 15:40:18 -0700")
References: <20260618224018.117978-1-shyamsaini@linux.microsoft.com>
Date: Tue, 23 Jun 2026 15:10:32 +0200
Message-ID: <2vxzpl1hmmgn.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Jun 18 2026, Shyam Saini wrote:

> reserve_mem relies on dynamic memory allocation, this limits the
> usecase where memory and its address is required to be preserved
> across the boots. Eg: ramoops memory reservation on ACPI platforms
>
> So add support to pass a pre-determined static address and reserve
> memory at this specified address. This enables use case like ramoops
> on ACPI platforms to reliably access ramoops region across the boots.

Doesn't memmap= do exactly this? How is this different?

I always thought the point of reserve_mem was that you _don't_ have to
provide an explicit address, one is chosen for your machine
automatically.

>
> Also skip parsing of "align" parameter when static address is passed.
>
> Example syntax for static address
>  reserve_mem=4M@0x1E0000000:oops ramoops.mem_name=oops
>
> Signed-off-by: Shyam Saini <shyamsaini@linux.microsoft.com>
[...]

-- 
Regards,
Pratyush Yadav

Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D30461DC992;
	Thu, 16 Jan 2025 09:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737020544; cv=none; b=kLNxib2sA6EZjE6rr+F2jqPI7OsxHTOCplu+R+FuP8pkmXRHBh3tVwfvd7nNePWgUbP9/NmzJftQipQugsU3pCWQ7tt6UlncaCxbq+rfrNqdwnpy+AG+kf1GJAagg4o3zuSc3Prw8wGqPof7hdw+EcNsNVcpGzpcEUo/NYv6q6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737020544; c=relaxed/simple;
	bh=gnxOFJOM8CNYAjk4xA/dsYa1z5NyVGDLkQ1iJ28kAZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f0ZgtrzJDgoa8+wW0EROAkpjZAOT9qtjhE0tutKo8+HXoVW/2Wvbcc1g+6q+crAOaMajLaHGmpSM2dXgcDihhXAfLjiUEJvUKdYZZYZb8XLy4/t0LtaeZ1j4rO6KpvjJ//ZD01mpieUcS4ifW5YkA01L2ZUU19VGJQJaiDQITeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Ho1GwvoF; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Ho1GwvoF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=cUqHVNrmDfYtjRqmvOtPuIvVp19cP0owYo/njoMzqhs=;
	b=Ho1GwvoF6bHATqdUwZWI5PoLHdH6Za6Ag9MKgRByZyxd/gr72qseWHhcvawil7
	uxi7DaM1es9CtPLxEViCZxLcUbKRDNfqtS18yPvQjAyjmgUo6ZcQ65bfncWXHwNz
	a9oUAfEJXCeacScMN6eGnehsHI79tfOUY59VEqd8riXkE=
Received: from osx (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wAH+INI1Ihnzb7sGA--.6422S2;
	Thu, 16 Jan 2025 17:41:29 +0800 (CST)
Date: Thu, 16 Jan 2025 17:41:28 +0800
From: Jiayuan Chen <mrpre@163.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] docs/arch: remove deprecated function name
Message-ID: <bhmgv3myrraschcaenvaq2sfpslcbedcsca2hirxau6gu56xbu@a54h2sj2xoz3>
References: <20250114094832.350073-1-mrpre@163.com>
 <8734hl9v8a.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8734hl9v8a.fsf@trenco.lwn.net>
X-CM-TRANSID:_____wAH+INI1Ihnzb7sGA--.6422S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrur13CFW8JFW8JF4DJw47Jwb_yoWfGwbEga
	4DXF9Yyw1FkF1DCw13Jay8Za9rKw47Ary8Jw1DXrW3Zw1rAanxWrn8ArnrZFn3Jr1FyFWY
	9wnakw1DtasIvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUhvKUUUUUU==
X-CM-SenderInfo: xpus2vi6rwjhhfrp/1tbiWwzWp2eIyy1pIwABsk

On Tue, Jan 14, 2025 at 10:11:01AM +0800, Jonathan Corbet wrote:
> Jiayuan Chen <mrpre@163.com> writes:
> 
> >  
> >  The question about the '?' preceding function names in an x86 stacktrace
> >  keeps popping up, here's an indepth explanation. It helps if the reader
> > -stares at print_context_stack() and the whole machinery in and around
> > +stares at 'question mark' and the whole machinery in and around
> >  arch/x86/kernel/dumpstack.c.
> 
> Maybe - probably - I'm missing something, but I don't see how this is
> going to help our readers?  If there *is* a function that will, by
> virtue of being stared at, help bring enlightenment, why wouldn't we
> name it?
> 
> Thanks,
> 
> jon
You're right.
As Randy mentioned, printk_stack_address() can probably be used as a
drop-in replacement for the original function, and I found that it hasn't
been touched since 3.12 anyway.


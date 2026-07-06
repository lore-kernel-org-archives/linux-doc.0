Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B649737C0E9
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 01:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783302183; cv=none; b=XH9+Lzvq7IsCio1hT2AsjOLxn8Wa8WLIBkvXK8BZlgI/ujZKplttkTMEXA0eU17GJABGR+TgfBb/Zq8uPdzu8fyFAb04HFaIAuy9/zNfd1fi9M3uaPJ0vN/nVOuel3Ak8uao9PT47L28iMoRWC9YqYK7A+jRCbs7t9A6XjpaSq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783302183; c=relaxed/simple;
	bh=auuE+qiAeK/cs6i3yewtCQh7qLdHLrn/RcPLhuqu/K0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EE52/yhekez4I1slj9WUe75e7xEeqITZbl0Z1pING6yB0f6vzBvjBlwkXH+c3+XAHD0haFqAJW73E+tIXiy+MfkgwfLx8hB7d5f+7PjxKMSdp/gVD/5OYTVFXWKSe++LvG5hO+lcMPEQAdhklRGJOxhAyMvM5oKQw/Rf7NuZ8i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=X6HU2VVf; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="X6HU2VVf"
Message-ID: <b10aeafe-3263-4683-b318-2afd498c927d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783302168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fs3PDk+ICzT5JmREAjpkl1+i96EjXK1gwBqdT/2GxVA=;
	b=X6HU2VVf9Rmd+xYkCimrMRYONFxHlj1FLzMdWaDQIJ4CIisKe6O4ebHBhIO8xFtEpzsw1V
	if9clW5afwlt64H2wgInX7C2clZrNM4KB9RbhlwJBI4/bl5XISTBr2BGjRLv8fXIxd6+qZ
	HNfDAc3wBC6KybvkkcQAmn7/fpWtHpI=
Date: Mon, 6 Jul 2026 09:42:36 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] mm/mseal: fix mseal documentation for 32-bit kernels
Content-Language: en-US
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-mm@kvack.org, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R . Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Alice Ryhl <aliceryhl@google.com>, Douglas Anderson <dianders@chromium.org>,
 Gary Guo <gary@garyguo.net>, Anand Moon <linux.amoon@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260703022507.187457-1-leon.hwang@linux.dev>
 <akhWKJSZLfDusVcL@casper.infradead.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <akhWKJSZLfDusVcL@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 4/7/26 08:39, Matthew Wilcox wrote:
> On Fri, Jul 03, 2026 at 10:25:07AM +0800, Leon Hwang wrote:
>> Document the -EINTR return from mmap_write_lock_killable(), fix the
> 
> No, you don't understand the whole concept of "killable".  If a
> task receives a fatal signal, it dies before it returns to userspace.
> So userspace never gets to see the -EINTR.  It's fine to document inside
> the kernel that function foo() can return -EINTR, but it's pointless to
> document it for userspace.
> 
> This is how "killable" differs from "interruptible".  Interruptible allows
> non-fatal signals to wake a task, and then the task can see the -EINTR.
> But many processes do not check the error code, and so read() and write()
> (despite being documented as being able to return EINTR!)  do not do so
> in practise.


Thanks for your explanation.

Will drop the -EINTR documentation change from mseal.rst.

Thanks,
Leon


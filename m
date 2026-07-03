Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8163737DE98;
	Fri,  3 Jul 2026 09:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783071862; cv=none; b=MKjYBLDnf9d4HRjJQ3l70IM1ndlinc91GbkBJbIvke0ySi030klcEClc05eJA7cm1TOBaF5cLwhaxUvc+04P+evYRU6/kZY1KApzXHL1psT9AGaQglPkxT+tJ5exURxtH83jgHGTrSZokNSfeOTfgvHBsTd3QWgLuYYK8sIMGZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783071862; c=relaxed/simple;
	bh=oz37Y/0GOHWFUcqNs1P/DYdKXzwtMlTlYXT0X7nYfxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iTo9jX55WhZg4duZTu+PekCVxSnAiQiECxJtYztQ34Nqj9i8lXILkKRPVAunUIlGLKSaAzRsVTel9PIcd3TIPf7UNhjHzkPsy2UQXXUqothCEYunYu/zXsxQWxWRYv1wtLoLeuPl052U3UoqF/w4CK8lGkoUm7ErCh9VAIfHJY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3wx+GZN3; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=whrD/Ixm; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3wx+GZN3";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="whrD/Ixm"
Date: Fri, 3 Jul 2026 11:44:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783071859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vbkc8C6vPfuFCPiBlHwfq26ZgkZnTR7YZfJ6x+U6dgw=;
	b=3wx+GZN3lUFtMi+zC9r4PUHex2Hrj5bj/px96NRFCJxYeFrkRhdZG9a3JlWoIIwuWfBB83
	NpUbJBYKtbr4ddLbrNs4614/5mxWlN05qbtSQd6qkg4lSMTrgqGvwZmIHZsaP1toX3NAek
	3QTdMQwVqxC5axCIplVnugf8z8LiXafTIE4g36P2y7qPSIWuErov/HgzcSaUrr72jtDC7s
	fxKwEfoe0OmdhQWbw6qxKWo1xYy6m6CfkjRgZTFRW0/ka6CXtzjYQb58xn2gTZ4k844eGN
	vOYXyPHHNEgyt1STYuuxIFlmwOVqk9dndhYl0jB/QpI5kA1XMlU5IAlDsqPTAA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783071859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vbkc8C6vPfuFCPiBlHwfq26ZgkZnTR7YZfJ6x+U6dgw=;
	b=whrD/IxmYah58ALJenVjpQsAGHKeODZYizVPDeOc6rM12TMi1TbQNAexWnah0bkE32iMFF
	08t3rz9pX05lChAw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Leon Hwang <leon.hwang@linux.dev>
Cc: linux-mm@kvack.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Douglas Anderson <dianders@chromium.org>, Gary Guo <gary@garyguo.net>, Anand Moon <linux.amoon@gmail.com>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] mm/mseal: fix mseal documentation for 32-bit kernels
Message-ID: <20260703114128-2a7a4723-0060-436b-99d9-7499bd90fa82@linutronix.de>
References: <20260703022507.187457-1-leon.hwang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703022507.187457-1-leon.hwang@linux.dev>

On Fri, Jul 03, 2026 at 10:25:07AM +0800, Leon Hwang wrote:
(...)

>    The following architectures currently support this feature: x86-64, arm64,
> -  loongarch and s390.
> +  loongarch, riscv, and s390.

For per-architecture feature documentation we also have
Documentation/features/. Maybe move it there.

>  
>    WARNING: This feature breaks programs which rely on relocating
>    or unmapping system mappings. Known broken software at the time

(...)

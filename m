Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC7B288BA;
	Sat,  4 Jul 2026 00:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783125559; cv=none; b=E4pXqZ4aX9ignCKvaIyiIDCu9ADTVI3In3HlhLrCd8TcuhYkQsPhVmFb4o+9q5v38TJVKd1NgL1qLYbULKFVCqJ/nQ+nPIeH8BrDfY/zbUviQOotwKF1TDARQJgEz9Gm10DU9LSar99QUsWXf4gdZob8MZGIA0Rwi39ftiPfcwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783125559; c=relaxed/simple;
	bh=wK5Mx1WvMe+v5HmoKXvSIZwHtJJducoIql6m7VG9ezw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dto8g1/NlS6CrZrgHMyeEezNbZYtzGhu9xkBMYW3Hbehxetd9v9xe6SKrg33F5g7WQQTSFUMl9pyzs3Yc2FpUpYHEHrUdrsR5kDJrGFt1Zdy+FgHfYYDJSNXhaar3zO7sRXZeBIM+UQOJnYUEqUIGsZyE5ZFub3ZZGycVX5J5co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=OsAtGgpf; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OsAtGgpf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Tmeyv+yKDLe4sMQPHYRfOsYX6yQ2MKLh3F1KPVmHY7E=; b=OsAtGgpfn2ZZr0zNc4ly0ohzMQ
	Z1saVpSbGF+o9EzTKmnHyHDrG1P94ZdjNxe/AYOxM5ySV4WyAMi5CExkGLqhrGWsyK45WZfXv1apn
	W1x1PEsN80UGsHRRAwiIODsvazzWi3XAygJQe1DUvSE8nsEea3L6Duq1274b1yJOisaPgEAlvTYaH
	Nt5TLyFBGOpqcudWTvSSKo0929jLnRELP+TeHSGdJojjcBA8986JvN6uf4/QU1H6sIJa1hQ3TnePo
	ugM72E4JglvxCjXwU3XF8q9nG36o59d8rFIGxrH10IIPiljDGFd29QxUqaJsMkAjMYeKA21TPfsVN
	tlQYC2dw==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfoPQ-0000000B5D1-34RK;
	Sat, 04 Jul 2026 00:39:04 +0000
Date: Sat, 4 Jul 2026 01:39:04 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Leon Hwang <leon.hwang@linux.dev>
Cc: linux-mm@kvack.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Alice Ryhl <aliceryhl@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	Gary Guo <gary@garyguo.net>, Anand Moon <linux.amoon@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] mm/mseal: fix mseal documentation for 32-bit kernels
Message-ID: <akhWKJSZLfDusVcL@casper.infradead.org>
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
> Document the -EINTR return from mmap_write_lock_killable(), fix the

No, you don't understand the whole concept of "killable".  If a
task receives a fatal signal, it dies before it returns to userspace.
So userspace never gets to see the -EINTR.  It's fine to document inside
the kernel that function foo() can return -EINTR, but it's pointless to
document it for userspace.

This is how "killable" differs from "interruptible".  Interruptible allows
non-fatal signals to wake a task, and then the task can see the -EINTR.
But many processes do not check the error code, and so read() and write()
(despite being documented as being able to return EINTR!)  do not do so
in practise.

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E589233A9E2;
	Sat, 22 Aug 2026 16:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787416748; cv=none; b=HOfYbm8VNdAZ2cpIoAL8KOrAov//gnfkpXaN+MmYVt6F3VJCaDfG6en2+lQ9p7HwRdBZObp3O/kcdkgTOJHh0hlVFzDXz4gIz/Rn+cV2ezjy/8bMMnwAE90jpSXpO6T7xfaXg4kl9fLrLL+Cg4cwyiQpSQGVJ4dkYIVIZbLZukE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787416748; c=relaxed/simple;
	bh=Nzj3j4IgZ49mqsfukgw8gZNxG73mt8LrRpV//3KTMvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=teTcK4yj0II+VFdoQNh9dka2qW0BUNBiN5DM1AQ5ja1tsDw7ogv6R5NKXHNb5ulsoChmThoZHXaJQDOXYRrFL1GTgisH8o+72TVUZWnYFMFCmX87OWrX0jzGwCdHEgsKTlvBehjSMfHq7R3zFwDwFP4tQOLK0CguQDZ1pi4igo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QHC+rDgB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QHC+rDgB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22C5B1F000E9;
	Sat, 22 Aug 2026 16:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787416746;
	bh=4s9u2WN0f4NPDWTK3ew4FU+LtINwv+CGJFTA6JAlljg=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=QHC+rDgBaM3gVUz/yLt2tnlVvdhYPOaBmYhIwW7YAL542RNi7hQuxaiqTu3ItT825
	 Cu+qvoHB8lmd9QogFn21GhiJzACF6JTl/947UkmqvHC9v8ev78fbXLkREBAPNnvzBc
	 RPn3IWQUCEA9gh0NxN0S/1jOAUXAtfL36NM7hljudQeloByXlCyNPNjcVWnoAr2aFt
	 220QV3OY0mS8pcpEKOEV2YYU6S88Llm/N9gS6BCt6jbeSyBDemOwip76TFA8SxSJkf
	 kBIyWIL9ceowLDiTGsxPrF+g/1SMloHbooR0MREButdDUurlemRkywZ7qylWS2xuFM
	 1xS5U4cuxPizA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id D76D5CE1D6C; Sat, 22 Aug 2026 09:39:05 -0700 (PDT)
Date: Sat, 22 Aug 2026 09:39:05 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Boqun Feng <boqun@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] docs: this_cpu_ops: Fix SRCU helper names
Message-ID: <656d37b7-e41b-4a49-8f8b-84a000cb0406@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20260822121651.1559-1-kmehltretter@gmail.com>
 <20260822121651.1559-6-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260822121651.1559-6-kmehltretter@gmail.com>

On Sat, Aug 22, 2026 at 02:16:49PM +0200, Karl Mehltretter wrote:
> Use the actual srcu_read_lock_nmisafe() and atomic_long_inc()
> helper names.
> 
> Fixes: df0cee43114b ("docs: Improve discussion of this_cpu_ptr(), add raw_cpu_ptr()")
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Paul E. McKenney <paulmck@kernel.org>

> ---
>  Documentation/core-api/this_cpu_ops.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/core-api/this_cpu_ops.rst b/Documentation/core-api/this_cpu_ops.rst
> index 533ac5dd57507..367706d1714b1 100644
> --- a/Documentation/core-api/this_cpu_ops.rst
> +++ b/Documentation/core-api/this_cpu_ops.rst
> @@ -150,10 +150,10 @@ preemptible code are addressed by raw_cpu_ptr(), but such use cases need
>  to handle cases where two different CPUs are accessing the same per cpu
>  variable, which might well be that of a third CPU.  These use cases are
>  typically performance optimizations.  For example, SRCU implements a pair
> -of counters as a pair of per-CPU variables, and rcu_read_lock_nmisafe()
> +of counters as a pair of per-CPU variables, and srcu_read_lock_nmisafe()
>  uses raw_cpu_ptr() to get a pointer to some CPU's counter, and uses
> -atomic_inc_long() to handle migration between the raw_cpu_ptr() and
> -the atomic_inc_long().
> +atomic_long_inc() to handle migration between the raw_cpu_ptr() and
> +the atomic_long_inc().
>  
>  Per cpu variables and offsets
>  -----------------------------
> -- 
> 2.53.0
> 

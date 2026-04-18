Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A22327C09;
	Sat, 18 Apr 2026 09:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776503250; cv=none; b=M0lYhfIEGRVahPQO2yRF1yZW0n2RtL6zlOPW5bQqwN/7loKh/o7oMKqZDkfsq76p7kmbRMRyZNPzQ/R/fmRMRr/xusgTFW/4TcCE8yYRVPxA7/RveAQ3CQklOTnh3PzoR9VT7KnTlFVUsLRQcnuSOPvgVsu5sJeTRKnwqOKXS+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776503250; c=relaxed/simple;
	bh=YA5a7LW/8SIrN7QzNwi1X4GpsR9ltQhDlTH0dSO7vFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zn9bGRe3uO8WKoCv5QL+XpVukb3U5NtfiSNe2YymE1qh/A5IiGHwrQ0xfWdA6IjVvQ+i0Dlh3pCEtaZiQAOiT4AwlWj0BkXDIOYM3xlA0AZ6wMXvzRqlIDcAKd+CnxbBZe0UrheqQ3rqVklBl4tIQBwrNJMDe+Qq8EpMXlNC6Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TG7KWcuZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TG7KWcuZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 736CDC19424;
	Sat, 18 Apr 2026 09:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776503249;
	bh=YA5a7LW/8SIrN7QzNwi1X4GpsR9ltQhDlTH0dSO7vFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TG7KWcuZ4i7DPajHSII/lpzC5PZ4KQUeHsHChwpJ1RTY6ap325/2WSvpnBZwKP/QT
	 JcPyTwh0zZCMKaBTNRIDsOKvBeC/6ZX/6tyzFxi0TEYLCGqhjW70vI0NW0xfe4qCRl
	 LHK0ordRGNSG6KbAC1PPjahDiUzUdqyut9xrWdCG7nkU3PA3T1pY8TlZwIXqXf9L5y
	 pE0lggIZby7ILLId6Ff/EKWvMCE+E2gOk7JnXKwj3CgIaXJkuVxEfp9rE0+QA39LgT
	 UTfGP8jtZZ55qxBERh7/5KdkPDJdea7UBcA9T+HWRVC1X+uPWmrqgzf5WUvee4SVtz
	 UUqxsEIGmb/Ag==
Date: Sat, 18 Apr 2026 10:07:22 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Nick Huang <sef1548@gmail.com>
Cc: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: Add overview and SLUB allocator sections to slab
 documentation
Message-ID: <aeNGbNyPxJssnkbO@lucifer>
References: <20260418000635.17499-1-sef1548@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260418000635.17499-1-sef1548@gmail.com>

NAK to obvious, disrespectful, AI slop garbage.

Go read https://docs.kernel.org/process/generated-content.html - especially the
bit about dismissing crap like this.

On Sat, Apr 18, 2026 at 12:06:19AM +0000, Nick Huang wrote:
> - Add "Overview" section explaining the slab allocator's role and purpose
> - Document the three main slab allocator implementations (SLAB, SLUB, SLOB)

The fact you're insanely wrong about the current state of slab only makes this
worse.

> - Highlight SLUB as the default allocator on modern systems

Not default. Only...

> - Add "SLUB Allocator" subsection with detailed information:

There's nothing detailed...

> - Explain SLUB's design goals and advantages over legacy SLAB

Irrelevant, SLAB doesn't exist.

> - Document its focus on simplification and performance

Who cares? This isn't linked in?

> - Note support for both uniprocessor and SMP systems

Uniprocessor? Seriously?

>
> Signed-off-by: Nick Huang <sef1548@gmail.com>
> ---
>  Documentation/mm/slab.rst | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/Documentation/mm/slab.rst b/Documentation/mm/slab.rst
> index 2bcc58ada302..2d1d093afb7b 100644
> --- a/Documentation/mm/slab.rst
> +++ b/Documentation/mm/slab.rst
> @@ -4,6 +4,32 @@
>  Slab Allocation
>  ===============
>
> +Overview
> +========
> +
> +The slab allocator is responsible for efficient allocation and reuse of
> +small kernel objects. It reduces internal fragmentation and improves
> +performance by caching frequently used objects.

This sentence doesn't even make any sense.

> +
> +The Linux kernel provides multiple slab allocator implementations,
> +including SLAB, SLUB, and SLOB. Among these, SLUB is the default
> +allocator on most modern systems.

WRONG. WRONG. WRONG.

> +
> +SLUB Allocator
> +==============
> +
> +Overview
> +--------
> +
> +SLUB is a slab allocator designed to replace the legacy SLAB allocator
> +(mm/slab.c). It addresses the complexity, scalability limitations, and
> +memory overhead of the SLAB implementation.

This is useless crap? 'X is designed to replace Y which doesn't exist but let's
mention it anyway'. How is this an overview?

> +
> +The primary goal of SLUB is to simplify slab allocation while improving
> +performance on both uniprocessor (UP) and symmetric multiprocessing (SMP)
> +systems.

This is meaningless noise too.

> +
> +
>  Functions and structures
>  ========================
>
> --
> 2.43.0
>

You've wasted my time, your time and other people's time. Have a think about
that.

Lorenzo

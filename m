Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E752561A7;
	Sat, 18 Apr 2026 06:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776493156; cv=none; b=c+7gzi8kRNZAVIAsGw8KM8pwF+U1cB52h/Kj0DO+bi7eHSkDnu1OLgxB32c6eoIXLZMjkdk6Y/VdirXnB0Te/+jeKmfMsGFJbJL0F3EVcI0HzjUL15Hqcx+G7Z8VkRcgJoi+I/b3gf520KP50PHO++IgBBkbDmfTRKIbNn5n0cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776493156; c=relaxed/simple;
	bh=7bwfd7Wz2cA6AAEntwBa/cdRZlg7gvWncrrHlcEwoPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UQzlBz+IdpKOPNtNCd76fUzHomdmy3kqDsLNWwe6i7/vamrZ8cl13fIsZMXNi9jWuOzM4Ei3r9oPhvwa+cth4i4g0/g+5Knxd2n6OnEEwy4/S/8P990RuZw0zXnLJtiHRw/LaYDNnL60/1i54TNI8lg4qlo07w1skPi6XgBSyDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HODc1NWH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HODc1NWH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AB04C19424;
	Sat, 18 Apr 2026 06:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776493155;
	bh=7bwfd7Wz2cA6AAEntwBa/cdRZlg7gvWncrrHlcEwoPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HODc1NWHzwxT/VimCpckBa0AcH1O1C0eO9At/6LbFXnk/ARfnMekp09ppJHs41Bin
	 on7+qc2ga4uN7/1sHNeOtzE7S8HV4afiplJFLoLb+fYQ/+xhEasYfI4ebNJzCvxjPD
	 KPAjIocEZq1Q/NhkAA0T4FpB6+Xd7hn/bGXztJZBW+spPAYAATbTo12XlNjFji05f5
	 X2vmhr8oy+eao2ucRnZGxWDyawd3Kxcr30J1CkzeauVH98ekHCPMUUBiPYcnJyt5pd
	 5ZKoqsjV4GoL8+l+0SRNEid/IcTXNm1vir2pVSbkYd6js9VnhqeUYz648h/FTPf0Va
	 lXA5gJM2NSTdA==
Date: Sat, 18 Apr 2026 15:19:13 +0900
From: "Harry Yoo (Oracle)" <harry@kernel.org>
To: Nick Huang <sef1548@gmail.com>
Cc: Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: Add overview and SLUB allocator sections to slab
 documentation
Message-ID: <aeMiYXOXuZmB1Tje@hyeyoo>
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

Hi, Nick.

On Sat, Apr 18, 2026 at 12:06:19AM +0000, Nick Huang wrote:
> - Add "Overview" section explaining the slab allocator's role and purpose
> - Document the three main slab allocator implementations (SLAB, SLUB, SLOB)
> - Highlight SLUB as the default allocator on modern systems
> - Add "SLUB Allocator" subsection with detailed information:
> - Explain SLUB's design goals and advantages over legacy SLAB
> - Document its focus on simplification and performance
> - Note support for both uniprocessor and SMP systems
>
> Signed-off-by: Nick Huang <sef1548@gmail.com>
> --0

In case this was assisted by AI or other tools, please disclose that
according to the process document:

  https://docs.kernel.org/process/generated-content.html
  https://docs.kernel.org/process/coding-assistants.html

Mentioning because some people using tools to develop/document
the kernel are not aware that they need to disclose the fact.
It's better to remind people.

Tools can help only if, you, as a person, understand the design and
tradeoff behind it. I don't think it'd be useful to spend time on
improving document if this is driven by AI tools or something,
not you.

If you're using AI or not, the fact that you're not following recent
changes of the slab allocator worries me a little bit, to be honest.

Well-written design documentation is hard to come by without
understanding the current design.

If you're still willing to improve the doc, please do more research.

>  Documentation/mm/slab.rst | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/Documentation/mm/slab.rst b/Documentation/mm/slab.rst
> index 2bcc58ada302..2d1d093afb7b 100644
> --- a/Documentation/mm/slab.rst
> +++ b/Documentation/mm/slab.rst
> @@ -4,6 +4,32 @@
> +SLUB Allocator
> +==============
> +
> +Overview
> +--------
> +
> +SLUB is a slab allocator designed to replace the legacy SLAB allocator

As Matthew mentioned, SLAB and SLOB were gone.
Also, it isn't really the traditional SLUB we have had anymore.

> +(mm/slab.c). It addresses the complexity, scalability limitations, and
> +memory overhead of the SLAB implementation.

Stating "Compared to SLAB, SLUB addresses X, Y, and Z" is
worth adding only if with a reason explaining why.

If you think SLUB addresses certain problems of SLAB, please explain
what problems are and why they exist, and how SLUB addresses that.

Please make more solid arguments with explanations to support.

> +The primary goal of SLUB is to simplify slab allocation while improving

I don't think traditional SLUB was particularily simple compared
to SLAB, to be honest. It was probably simple at the beginning,
but then more and more complexity has been added later.

> +performance on both uniprocessor (UP) and symmetric multiprocessing (SMP)
> +systems.

SLAB also supported UP and had features to provide scalability on
SMP. Why do you think SLUB particularly improved performance on
them?

> +
>  Functions and structures
>  ========================

-- 
Cheers,
Harry / Hyeonggon

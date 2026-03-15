Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94174365A0D
	for <linux-doc@vger.kernel.org>; Sun, 15 Mar 2026 20:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773607706; cv=none; b=ifG7/VznTN7+DcYAqHkVbTlesVnRLziQUSuj1IecX0RHGJWsC69RhB4W17QwL7DlfSEoueOoGQ+6+Rvp4SgSOezeb4TMJJ2Y3qXEIhbkvh1ido796j8gCya6yEJscJXCbWSrSDG5BlDXibEtGfSzHREWSBYLyt/9wK9RwfNS6ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773607706; c=relaxed/simple;
	bh=AKmldbxaY791aD9Xfil/Ru0vWSAymPxRXmxXjFu7b4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eP9rSyS6WFDSnMc/63RD30RWNSRK1bVMBuPUfZY/9U23CiObSfnR95DGkRqwWfNFwrdHzCPRg/ukT4w5hVZ3j0UoiIpWIYe4NQQc4t4OA8jnUJsz8Z/oK6cCzuC4BKKV/OyHLujaz4MToVEenYDEjE84g8/J2jNg0qnl5z+hO9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lHIdGpox; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lHIdGpox"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93439C4CEF7;
	Sun, 15 Mar 2026 20:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773607706;
	bh=AKmldbxaY791aD9Xfil/Ru0vWSAymPxRXmxXjFu7b4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lHIdGpox9WtCzyIYJU69aXY52aRr6S/+Jtpm4Uj3GMYvPIe/DbAbkhO2KTdk9isdk
	 AKigtKpt+XI0v1CkX1wEF1tZQ4VMhtnuZYM4O1DtCogSwx5ndxAQ/h+ZjeStqx7CyA
	 g+SYgZFMm79yVu4f0CKWufIdrZrSeIRqAM8r0st4Bt8SH2Xtym/Ta2V0Ap0RWM3mtc
	 qM/lUbt+vKwjfC0MPnzrCVBDSnQ4VjG1omxkeSBWD3bJQ2CW9svPUNXKjddNRwGS5r
	 M9kFLqt2NSyezpiP9CVe+UnnktWuJML5TAQysTAeIAZPyygY13u1jXZ8KgLqKIgV8I
	 5jH+57S6cRiSg==
Date: Sun, 15 Mar 2026 20:48:22 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Kit Dallege <xaum.io@gmail.com>
Cc: akpm@linux-foundation.org, david@kernel.org, corbet@lwn.net, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org, Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH] Docs/mm: document the OOM killer
Message-ID: <fbee0ca1-4de6-4182-865b-a33d9ed32ee4@lucifer.local>
References: <20260314152518.100194-1-xaum.io@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260314152518.100194-1-xaum.io@gmail.com>

NAK for being AI slop again, obviously.

Again, +cc the OOM maintainer you failed to bother to look up.

Reasons, as the rest:
- Worthless documentation
- Everything about patch screams 'zero effort, Claude did it all'
- Bad etiquette

As with all the rest it'd need to be totally rewritten and it's not worth the
maintainer time.

On Sat, Mar 14, 2026 at 04:25:18PM +0100, Kit Dallege wrote:
> Fill in the oom.rst stub that was created in commit 481cc97349d6
> ("mm,doc: Add new documentation structure") as part of the structured
> memory management documentation following Mel Gorman's book outline.

I mean the more I see it the more annoying it is.

>
> Cover the scoring heuristic, allocation constraints, OOM reaper,
> process_mrelease syscall, and sysctl knobs.

This sentence contains almost as much content as the patch.

>
> Signed-off-by: Kit Dallege <xaum.io@gmail.com>
> ---
>  Documentation/mm/oom.rst | 67 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
>
> diff --git a/Documentation/mm/oom.rst b/Documentation/mm/oom.rst
> index 18e9e40c1ec1..2259f871a4a7 100644
> --- a/Documentation/mm/oom.rst
> +++ b/Documentation/mm/oom.rst
> @@ -3,3 +3,70 @@
>  ======================
>  Out Of Memory Handling
>  ======================
> +
> +When the kernel cannot satisfy a memory allocation after exhausting reclaim,
> +compaction, and memory reserves, it invokes the OOM killer to terminate a

I mean this is just actively wrong to start with.

> +process and free memory.  The implementation is in ``mm/oom_kill.c``.

Terminate a 'process', even what that is tricky in kernel vs userland...

> +
> +Victim Selection
> +================
> +
> +The OOM killer scores every eligible process and kills the one with the
> +highest score.  The score is the sum of the process's resident pages, swap
> +entries, and page table pages.  This sum is then adjusted by the per-process
> +``oom_score_adj`` tunable (range -1000 to 1000, default 0), which biases
> +the score by ``oom_score_adj * totalpages / 1000``.  Setting
> +``oom_score_adj`` to -1000 disables OOM killing for that process entirely.
> +
> +The ``totalpages`` baseline depends on the allocation constraint:
> +
> +- **Unconstrained**: all RAM plus swap.
> +- **Cpuset**: memory on nodes in the current cpuset.
> +- **Memory policy**: memory on nodes in the current mempolicy.
> +- **Memory cgroup**: the cgroup's memory limit.
> +
> +Only processes that can use memory within the constraint are considered.
> +Kernel threads and init are never eligible.
> +
> +OOM Reaper
> +==========
> +
> +Sending SIGKILL does not immediately free memory — the victim must be
> +scheduled, unwind its stack, and tear down its address space.  To speed
> +this up, the OOM reaper kernel thread (available on MMU systems) proactively
> +unmaps the victim's anonymous and private pages without waiting for the

Anonymous AND private eh?

> +victim to exit.

Actually there IS some waiting for a specific futex case :)) though maybe
removed now.

> +
> +The reaper gives the victim a short window to exit naturally before
> +intervening.  It walks the victim's VMAs in reverse and calls

Why in reverse? Moon walk?

I mean etc. etc. this is really not helpful.

> +``unmap_page_range()`` to release physical pages.  Once reaping completes
> +(or is no longer possible), the mm is marked ``MMF_OOM_SKIP`` so the OOM
> +killer skips it in future invocations.
> +
> +Before reaping, the mm is marked ``MMF_UNSTABLE`` to signal page fault
> +handlers that private mappings may have been zeroed and are no longer
> +reliable.
> +
> +process_mrelease
> +================
> +
> +The ``process_mrelease(pidfd, flags)`` system call lets userspace OOM
> +managers (such as systemd-oomd or Android's lmkd) trigger the same reaping
> +mechanism on a dying process without waiting for the kernel OOM killer.
> +It operates on a process that is already exiting and performs the same
> +address space teardown that the OOM reaper would.
> +
> +Sysctl Knobs
> +============
> +
> +``vm.panic_on_oom``
> +  0 (default): kill a process.  1: panic on unconstrained OOM only.
> +  2: always panic.
> +
> +``vm.oom_kill_allocating_task``
> +  When non-zero, kill the task that triggered the OOM rather than scanning
> +  for the largest process.
> +
> +``vm.oom_dump_tasks``
> +  When non-zero (default), dump a table of all eligible tasks and their
> +  memory usage to the kernel log before killing.
> --
> 2.53.0
>
>
>

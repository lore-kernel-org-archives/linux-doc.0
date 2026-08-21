Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB10217993;
	Fri, 21 Aug 2026 01:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787275641; cv=none; b=AMtXPixnQNbyqqVTZF5zJiYDePmKijLMN0Wp9vvn9WQENTt2+hwYXVTv2LTLYwvNcZUVDoEJSLOo/+/R+uZcqrypsYhoMK2M+zQQScKDDGqHBySn6N52oDcwnEOI4otw0yC+pWrvWHwm7gGVyiae5BTK+ZmiMF5AXHPwggYsH5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787275641; c=relaxed/simple;
	bh=CtRWr9E0txCRMTfVLDIW+2dB/vjNrn9dZynOY1ipWBE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XC019/zA1WFAPTpMsRQDxQCNrVuXjiPv+MBnraE+Im08nIndwqU4C19lMAHmg/7NHKxG3ULxB0phXzy9gZFLlihkkS+ch4HGCSQuWZPdXmFPcxM3N9HwLX8xf4bIR4mmho3ohm9VvMOeBe4klDYzn13SBtU1ZFl0EiGAOj3wngM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G6PPtaLk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G6PPtaLk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 320B91F000E9;
	Fri, 21 Aug 2026 01:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787275639;
	bh=/YvkqO1Co8rgXsGiEEuyiIzaT5tlySRac/ZA+XW5nAU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=G6PPtaLkflZk3MTvspaS+cIYDyds2Bql7vWVSowsj9PNZLKEOHqY20F3VBht+OmDG
	 Lry/15CZ5gFe31X80DSUoQ1tpbI6z83yCLGwfnfZCQxS5pQV68fqYELjtOli9J45nf
	 OxhlIinkSrsqdgmJLwHJ9RWFWygnrGjIaCGfOwZKQdsL2tUJ2dNMcuQDNa95GKg5TY
	 EmxDYSNOpuLe+L7Xk69DS6kjVF9HMLzkTVoMc4emBCGXglXqr8FwnPQFqZQzOezhLs
	 mAnoM4uDW2LgiLudE6yHax2WzwLAAUnuf1Tp/UmZ9veCFtrjI98umQl8YsX3aYF7AE
	 4HcVId5PTEnfA==
Date: Thu, 20 Aug 2026 19:27:16 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Xie Bo <xb@ultrarisc.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, Dennis Zhou <dennis@kernel.org>, 
    Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, 
    Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
    linux-mm@kvack.org, linux-doc@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Add native this_cpu_cmpxchg() support
In-Reply-To: <20260730094407.16588-1-xb@ultrarisc.com>
Message-ID: <8b8cbb4a-474d-1de4-eaf2-dd8b4e6ca8ec@kernel.org>
References: <20260730094407.16588-1-xb@ultrarisc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi, 

On Thu, 30 Jul 2026, Xie Bo wrote:

> RISC-V falls back to the generic this_cpu_cmpxchg() implementation,
> which serializes the operation by disabling local interrupts.
> Consequently, HAVE_CMPXCHG_LOCAL is unset and users such as
> percpu_counter cannot use their cmpxchg-based fast paths.
> 
> Implement the 4-byte this_cpu_cmpxchg() operation with cmpxchg_local(),
> and provide the 8-byte operation on RV64. Pin execution while resolving
> the current CPU pointer so the LR/SC loop operates on one per-CPU
> instance, while allowing interrupt-context updates to race through the
> atomic operation.
> 
> Copy the old and new values to private temporaries before invoking
> cmpxchg_local(). This avoids collisions between local variable names in
> nested statement-expression macros.
> 
> The 1- and 2-byte operations continue to use the generic fallback.
> 
> Select HAVE_CMPXCHG_LOCAL and update the architecture feature matrix.
> 
> A percpu_counter_add() benchmark using the default batch value reduced
> the median time per operation by 77.3% (10 runs of 5,000,000
> operations).
> 
> In three 60-second stress-ng fork runs, median throughput increased by
> 4.6%. A 120-second combined fork and VM stress test completed without
> rss-counter errors or validation failures.
> 
> Signed-off-by: Xie Bo <xb@ultrarisc.com>

This patch seems to be missing 128-bit cmpxchg support.  Care to add it?


thanks,

- Paul

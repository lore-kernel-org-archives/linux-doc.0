Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792462481;
	b=CqO/azgEZtlTewYAGu7iejDbXFh+Y6a4OgB1G884wnPO4schoC71MDHPS4zpO4zfGFmj
	 sigBTKzUYVlbE8ca0topaCQk6k/LpA+lPiO61AoH+QAN+G9Vqc31V6y215p8s4Mf0XRjx
	 uI8Qf0CnaPJsgVcnSficifAt+zmaLnME+7YL20q3Kx3o5ej+fardA11/1ZLc365047pae
	 vm/Y+NCfDz3wL/X9aDPr+uLJsSaW6T30JlkJDEgZyqndlvi6ClXU2Nr8IcZ4/HNdTNr0F
	 2Oljqgj31WzF/O4Dv3rX5J7NwWR/LVIN4mMzgBW6VpuerUiNOGX5BZDxBO4g85QztVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792462481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5Iwx53FddK31aCeF3yTsYcRGG3DAdKI2xVbjXFtQkwA=;
	b=Ye3z3JH51EACwgULzMXbDZe8s5sV1FSm5bEWNKKaWPVU+3+WHjZSYKGI3dnzS5emvBVP
	 YWf2kzsAmXgsmhb/JcXC87zov6Zm6U3JOfGtEfgur6uU1CqJ2D3gMwEh5OXZxLteXfjZw
	 ovitGTudZ4+ZtgB3gYZg5OrrBh+KjOiyUXQi0rw8/jjmniWqBdV+V9JIL4QlFKWPesfVV
	 kQc4RrY26EVSj56L7/aTCLTVodact/OaxsmZn7RZjka0P1XfC6+mcbzoN3T3eq65oL/yR
	 2SOHkwvXOv3oqfwe0o4v2xNrlz8XdHBhwYQvKdNYahjRlNoAlNXiZVwfkRnzb3osvbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oBihJ65C;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8E7606A31A
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 02:14:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA8E7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oBihJ65C
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48bbb06e746so1348755f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 19:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792462479; x=1793067279; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Iwx53FddK31aCeF3yTsYcRGG3DAdKI2xVbjXFtQkwA=;
        b=oBihJ65CMLYBqYHD9hPzlwUnnU21Djjlk+0ywA8lRRGdNyRHqBkmkB2lVi7j7VuJ1l
         MPwAaFfom20siTmykpM4ACL2ty3lpQ6vyWJJmpPI8ZNX5UWUMWNCT76IcffFNMOUGFTk
         ORdK+O3A4W904mNRG0BhTfAQ3NjS8YqXkkKvnV12Bxd9kRss/cY1Tv6b9jyxrJCeHjml
         1UVPVfEtj0r/j8yx2gjVcG3pxob+11ZYhiUZjgUj33HkXufAXfebmxat2Oeiaf2Mav0z
         Vvwv6t7UGKyBpY9zHG+AYKsyBiV69wdVVX/+3Y2olVz6L5eDY0ngAgoqozcmxhtarnNO
         JaXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792462479; x=1793067279;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Iwx53FddK31aCeF3yTsYcRGG3DAdKI2xVbjXFtQkwA=;
        b=r3FsrKtl9LE31B9LbQQ/riKDA8N3+j8/cfEbFxzlI2gjx/dKS82HV9C5Bb8ddNm2gL
         7KVbd+PCJOI/UCYO+1vTCr4B2jXIk4BGhjpbqb9KGn27pCLwpgAKoyYNU3qon1yO9QHW
         4obBXuBnySdNLFiiKKOP/Ou+c4KkRDOv3XZmdvhCbY/lwvinfPgcV601CslZktv64wqW
         +fmRtWkLe6Hf6kAS/u50ZSf6Nx47Aycugms8tjXzBotxO51FHaXV9r7jX12DESL8bLvw
         Vro0BaGW/EgnflKL/3KdNOek3j3wblQTttADWX9aFEcYlTPbzDZe1FE/2IsidFt9O53K
         +/5A==
X-Forwarded-Encrypted: i=1; AKwUvBzv3Oho5ZpFWzRwyXoUWaD6LrFbprkBoj1I+f7RCIYpI2TTrjUnawRC4SuJ4qx4qz3JsRrzpvpK4ic=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjXI9u/+Z3G2oeO/s9FLbG7zN6gdVAStuUsSoo5A3B70DrcOb7
	F7Anp61G4EzhRie0uS1F4jGIEiTO0aTLIHR6aA1w4thVRddiCKS33725
X-Gm-Gg: AYBFou2ycx+jnTK0dN26v76SjRVd1MqBHFL9W//XdhmxlK4SoXxSvr/tf5qaShXSUOn
	o8ziF0x4fXUYQOSBqFW3Eqthj1wnO0DAwVpugdy5aAtjiURtW3+A/7gRmJ6ryDcu41Ss2dJG8sO
	LGuWrXWyB4pwQ8cFesEnTP6qP9n1HaE13UCGhst2GUtfk9Ae2KZI+UG72LgWpiKLj8jJKKo8wNH
	8EQyB7xTHYUTLBnQYRoMYOGpzE6r+ork1fSTnuxnk56j796YyODrjCThJjk2ql86QAfCnfF3hjy
	EvLOYY4beyrP4UQIH92EZ+qZ1VOquyWBcrTNQV2DxyYlGoVEczba2lcVdKEBp11f//6nJwuGPGj
	7lF3qdSW+b8kTqpFNQzHdQUBbdFwc6nhrmv0V+vn60+pWweVuMf8flHkuGEE+IFV2EUpI6upivx
	GTKwJGrGdC837GVGapVteZAk1MSyGHryOnDVKBrz4NZHTsvW9m8cDe+R5g76TiISMqdStcA1MOW
	PcypmvsvBj7x4fxisqr/0GaICs7D10FmrbUzAq1hZotYh6EuIM6cz6DyB4Au2cybG0sqY+KVc/9
	BuOoH2onQ/PFgrvbZsr5pll0MVtMjJ9gk0rsW3qxf+etY/D1ha2t1+hyPzUwFh0Tj59acDFM6ka
	HIYQ5+IeKoQ==
X-Received: by 2002:a05:6000:491d:b0:488:5852:6ee3 with SMTP id ffacd0b85a97d-48e07bc2f43mr19882172f8f.34.1792462478968;
        Mon, 19 Oct 2026 19:14:38 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-9c92-6501-cda9-90cd-4e49-75d9.310.pool.telefonica.de. [2a02:3100:9c92:6501:cda9:90cd:4e49:75d9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8208b1sm2879816f8f.33.2026.10.19.19.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 19:14:38 -0700 (PDT)
Date: Tue, 20 Oct 2026 04:14:36 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Harry Yoo <harry@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, David Hildenbrand <david@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	David Stevens <stevensd@google.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Shuah Khan <shuah@kernel.org>, Amery Hung <ameryhung@gmail.com>, 
	Swaraj Gaikwad <swarajgaikwad1925@gmail.com>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-rt-devel@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, cgroups@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/3] locking, mm: Add atomic allocator trylocks on
 RT
Message-ID: <atbOS2rs94fB2red@gmail.com>
References: <20261005070625.8871-1-kmehltretter@gmail.com>
 <asZ8jmWNoGk5tYce@thinkpad>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asZ8jmWNoGk5tYce@thinkpad>

On Wed, Oct 07, 2026 at 07:15:29PM +0100, Harry Yoo wrote:
> On Mon, Oct 05, 2026 at 09:06:22AM +0200, Karl Mehltretter wrote:
> > On PREEMPT_RT, a BPF task-storage program attached to sched_waking
> > can deadlock when kmalloc_nolock() obtains an rtmutex-backed allocator
> > spinlock while try_to_wake_up() holds p->pi_lock. Releasing the allocator
> > lock can enter priority-inheritance or wakeup code and re-enter scheduler
> > locking.
> > 
> > The first RFC [1] rejected every non-preemptible caller. That prevents the
> > deadlock, but it also rejects BPF arena allocation and faults under the
> > arena's ordinary raw lock.
> > 
> > This RFC instead adds an atomic owner state for bounded PREEMPT_RT spinlock
> > trylocks. Atomic acquisition succeeds only from the completely free state.
> 
> Please don't skip discussion stage and jump into submitting a very
> intrusive change across locking and mm, assisted by LLM? :/
> 
> I don't think attempts to tackle this problem will make progress without
> discussing and getting buy-in from (PREEMPT_RT) locking folks.
> 

Sebastian, Peter, Thomas, did you have a chance to look at the locking
direction here?

Thanks,
Karl

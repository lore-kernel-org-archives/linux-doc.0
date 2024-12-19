Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FBD320F;
	Thu, 19 Dec 2024 00:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734568559; cv=none; b=kyYzvEkdTWHQNBBJFq9DpJl3vMx9EJc1fbOYJ4StrRGUYjGFlh9VH1NGoYix6eje6YS3fbfYPTRMKHlmlCR36O4LvryYzFGkstySGt9Y0yrVzzhcIsNXRqzLzyiG+bQMwKtFFnnBFm54Xz0wYgzLmUGhGFWFqj0iemT8L/99VQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734568559; c=relaxed/simple;
	bh=TXP771HUZawEfmxGAQbJyWJ74PlkNXYsTIGiQeRlqMo=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=VmRtq8NwkRJN5qhGfBe1Wv72Q6FCWT1Y1akId8NfD/1OFS85nQYpE/88xIiJ6ae53pJdxilbbj2JPUc1p5w5eXSWv0yASv3HaMJTtfKGnYLx/aeFrjgBtY0hIa2rpWY7tGyP9X5qcoKjsXrTBAm/63EJBKE8nHqM0MJJxxDbDSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Avm3K4Ps; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Avm3K4Ps"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D86EC4CED4;
	Thu, 19 Dec 2024 00:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1734568559;
	bh=TXP771HUZawEfmxGAQbJyWJ74PlkNXYsTIGiQeRlqMo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Avm3K4Ps3AW+axzTX2rRPBy8ZoqYOC1lbN67asCh+uLy0vNXcGAno0shFWz8sZ9nz
	 eFoGUleHED0sfU9ud0O+5qDsa2uG7z1u9HCWH/GckOGOFXxdW54ll4jbHa7/Ny7fqH
	 7wv4IDQiRP6LyW9w0Y9usbaYPLc4OaJDFPkM3aQk=
Date: Wed, 18 Dec 2024 16:35:57 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Peter Zijlstra
 <peterz@infradead.org>, willy@infradead.org, lorenzo.stoakes@oracle.com,
 mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com,
 oliver.sang@intel.com, mgorman@techsingularity.net, david@redhat.com,
 peterx@redhat.com, oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org,
 brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com,
 hughd@google.com, lokeshgidra@google.com, minchan@google.com,
 jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com,
 pasha.tatashin@soleen.com, klarasmodin@gmail.com, corbet@lwn.net,
 linux-doc@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v6 10/16] mm: replace vm_lock and detached flag with a
 reference count
Message-Id: <20241218163557.1ce2d68cacd3d800c1fea1af@linux-foundation.org>
In-Reply-To: <CAJuCfpHXRX=LLa67eWYvrK=UDxKMaOequFXfqOqDHbRrmsT9SQ@mail.gmail.com>
References: <CAJuCfpFYZkc===SXF35s3C0xg3q5RjpCiOQhwK=9_3RnFUye1g@mail.gmail.com>
	<20241218161850.GG2354@noisy.programming.kicks-ass.net>
	<CAJuCfpHDRCoaBfE8y6AppKveSTgayyTNfDyQWH=gMzO-Pkuqpw@mail.gmail.com>
	<20241218174428.GQ2354@noisy.programming.kicks-ass.net>
	<CAJuCfpEKg_h5pw2AxdF1wmFMt4xdOxYqv7U1uVMYcuSCB4kHuA@mail.gmail.com>
	<r7polqnhdguxrz6npklag5kjy7ipbj5lrnqai2qm3jt7x56hci@cfrcom746iae>
	<CAJuCfpGeRi73E94VCDPDGAGG+5-Sj-_YGf3JNnf6Bh4GH_M6jA@mail.gmail.com>
	<CAJuCfpHJwVXanjG0WGjo0KHHEbg1-T0HWTZqDpssoq3FvfG++A@mail.gmail.com>
	<jes252u5qfhla2bdmg6pdkfpi4a2jfhf7d5b6ra6ol2bmt352x@gunhzaca56df>
	<CAJuCfpFSD98fw=844AJPy+LT5y=zREQGtSEVj3_FCXiZ5cFR_A@mail.gmail.com>
	<ulbspoec633hfm54f3jzvoqs6ilskxou3qykk2u727pbaltvfl@lb53vjcaxnuf>
	<CAJuCfpHXRX=LLa67eWYvrK=UDxKMaOequFXfqOqDHbRrmsT9SQ@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 18 Dec 2024 13:53:17 -0800 Suren Baghdasaryan <surenb@google.com> wrote:

> > There is a loop for_each_vma_range() that does:
> >
> > vma_start_write(next);
> > mas_set(mas_detach, vms->mas_count++);
> > mas_store_gfp(mas_detach, next, GFP_KERNEL);
> 
> Ah, ok I see now. I completely misunderstood what for_each_vma_range()
> was doing.

I'll drop the v6 series from mm-unstable.

Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7A735E1D4
	for <linux-doc@vger.kernel.org>; Thu, 28 May 2026 21:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780004556; cv=pass; b=qevLm9mkneb5XVEeH1FROX+emjkdU0GY6oXQDQkOcOSmH+a7IxJIyQUopmW8BJM5cYFCv7HMrzMCkmZpDU+23qPD/IXLuokDECyk8OSgyT7wtTWrKY6xUUDJVDyPftmewdyb0AJHEUeGJASAR497cSXIfA7IN+WVfYvKMKOAnSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780004556; c=relaxed/simple;
	bh=9q/ZTSfTHT3ONJVmwny5oeOHsuAhfuQbux3JGsklk0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zr4UG/PKQx7XjJX1F0HHIoVzVdK6fLNZVNi34O1I7QkNbvByIZO9rPSCFZROxat8hp3SFr4GQylPpuYFzULqnqvP+Go/s//7i/QsUCpumX53M30w3PIk8e0s+yeAH5PpXBvyWZjyDCyNFwG6r2qbI6DmcgakyhnXM+kjTY5PVe8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ls8wq3x8; arc=pass smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ls8wq3x8"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-393d6025f99so125513581fa.0
        for <linux-doc@vger.kernel.org>; Thu, 28 May 2026 14:42:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780004552; cv=none;
        d=google.com; s=arc-20240605;
        b=Gt1WCV1SW0RvZnNK0TJJPycdHW3pjm+tfhk7QB2sMKCg61kAFwnIVSp9X/B4vZq0Nw
         JrRj3TUHNleK5NzOPPpM9gXuii9uPPn3CHA2c9gx0c7eNsz0gvFuqj9pxYPtiPYOv4Z8
         LieX9yHT5LpILdgmb2teD9W+V80D7SgsnKtjyMvyYtnSjQAqarvVdGH8UhC3jU3aU15n
         Tlb21a1G3jGP8U6Vdk4tKl69juCyLtO4LHCBO8aEzxvW1Ctt8pjwlPlL5oLBWAwC09OL
         RW5YOQAxMtOn/SRy9T/dfPw7jNWG0A81W3NWOzzkzgj/dIjW3ViFjNVFUhE5jvSxQI6/
         7kRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9q/ZTSfTHT3ONJVmwny5oeOHsuAhfuQbux3JGsklk0A=;
        fh=HgIrQ/Fu1RhJfxiAbtXK/jvH16MF4YQPu1OoDCE790M=;
        b=OvJ1agn1BZl1jUNazNbJ/1g6fCy03MVFYb7B4sx24y4hOjXfe2RJ1FJLa/fyHNjQPB
         fRmhcfyM0m7pgn5be98TdeVoxWl3b8XXTadDrbPYpp0zE3vgdSkjJCInAMNlq83Hytqw
         0GHkMyCU3CDx8HDUIuGYqRBwrLF6erFvP9ZcSFtKKUtiVknMIL+6GfYOo/ytGkAc5+Fe
         cAS5qusg3nocrQ8f5JYSVnAG+tMgYx6nrLx10t7pS/OJ5aa5yH/WAf1y6nshCEneiUpl
         PeaFQKEwJIGw2fd9/cKIvx7EEf/MyXX3N4e5Og8x8ZC+jy1aajEDCYk/f2WnUwyKVVoL
         HXvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780004552; x=1780609352; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9q/ZTSfTHT3ONJVmwny5oeOHsuAhfuQbux3JGsklk0A=;
        b=ls8wq3x8kzyt7HiA06z5ov+GmK03Y5FbkxXShtTR8+zDslhmsPgzDkJItOwIO6496P
         XusRh2vZG8XbLp2bgEzTyavSpAKV2yNT//DBY1++FtyRKsFYwrHrrJHuLQwegE5BCcge
         2XXXa0IhGyzmQ23dNpLmvZ7gL5m55u2i6xcE4z3HpnPnj6BX6aHMThdRsKDvnhY78z1l
         c33mfHCdz3R8dVtuKD4rfjNhu/sX/EpgxRhmliR+AhQgciqyKu5q+4q4EUryG802VElJ
         n4kZbfpqnoA8XqN1jrhsMNdZ7paFJP9M//gZsLn3zZ97PJeucpT4TFYmt6Evwuygkvmc
         bLeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780004552; x=1780609352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9q/ZTSfTHT3ONJVmwny5oeOHsuAhfuQbux3JGsklk0A=;
        b=q89wJki7xIa4+FvMCZbRkfCmAPxnUi+Le/3oJc7wx1x9DPNnkoKpE/qoHJaacbwSls
         duHbgcB9x8VkdMmcI3r0w5sXx8b3ZwqcGADbD9eleF/Ts8ug9YMUl/y+a1Svmx0RH6RU
         kpvihY1tEywZozeGmsWYr60ULKWfyA7mxGDRbrYhYKmoaOehXAJHmRaS9h1Yrpq04irK
         OEU3hWoKDBDv1uVQ+vQBJ/MmzNFXHk+3NSbu0EvvVHv3Ue3FjhHMa5wJm3xTTeQfieMw
         Ti9rNkQt9Uk/PQIm5WaIYNsWFpx99hwNrAFRfgEvaZUsf8tVqrorePg8/w86g4xwSykH
         fDPQ==
X-Forwarded-Encrypted: i=1; AFNElJ+t2qFOsaa/Z4WP0/14LEci8L6LLNA63a9RCArvP1i/9J/TYI2xusUusVj8gaVAhmITJv5wO9dNra0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd/lCXdhJuqPFxLqyHl14O/IGtons3lrGerr4qzJFCMuWCWMAa
	lZgBXzzlnLnUin4zGAy7/GuGtQmWY5LBoD4rsuwbQRcCxRDcbaQyCxVQ1mVy01hmrUF5+wG/JeG
	rBtcpnRbC8S8nXkdIsd9ejO7S4LgMeDA=
X-Gm-Gg: Acq92OGKHhJUghBn+Krwd3ZJVY4PLS4IweNN+2PMaljdro5AWKkgT4aPNRjCr/kW4JB
	FXhdBBj4P5k1T6uKpkPWzUU8sJDs3TyBCzRYS7KBLCU6ygqOpjs2T4B8B8MCwB1ZDCky/iI7uQZ
	TALRD8E2eNmeg6BEPQMecBtK9ivYQCieISRxeV5bV/v4RoNsEVgw6dg+QFODGn62FNLTGYchPuJ
	5LcCk0LCNOFKMB6qO+TDZg6XGy3Ao4Y1MTwlcvwSaIWB0MUpN4tszrnF4UYXymkFzDyWRlsq1DD
	AcwWF+r8xfIYYKT/OUVqKkPsbJBGYAtmZDtwqymZkvHN3uo18w==
X-Received: by 2002:a2e:a695:0:b0:38a:2a56:9546 with SMTP id
 38308e7fff4ca-396536f3de0mr174701fa.13.1780004551665; Thu, 28 May 2026
 14:42:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505153854.1612033-1-nphamcs@gmail.com> <20260505153854.1612033-2-nphamcs@gmail.com>
 <agJcCZuLqWwU_sSR@google.com>
In-Reply-To: <agJcCZuLqWwU_sSR@google.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 28 May 2026 14:42:19 -0700
X-Gm-Features: AVHnY4IQjMrNxr5cCHgyMIwBGAESeNQ717suquaX-CqDf9_dL7Z_N08muuwMcik
Message-ID: <CAKEwX=PZnKqfriUsPV2whZyqxfCRNy67z7gyrHObEvztDF0_zg@mail.gmail.com>
Subject: Re: [PATCH v6 01/22] mm/swap: decouple swap cache from physical swap infrastructure
To: Yosry Ahmed <yosry@kernel.org>
Cc: kasong@tencent.com, Liam.Howlett@oracle.com, akpm@linux-foundation.org, 
	apopple@nvidia.com, axelrasmussen@google.com, baohua@kernel.org, 
	baolin.wang@linux.alibaba.com, bhe@redhat.com, byungchul@sk.com, 
	cgroups@vger.kernel.org, chengming.zhou@linux.dev, chrisl@kernel.org, 
	corbet@lwn.net, david@kernel.org, dev.jain@arm.com, gourry@gourry.net, 
	hannes@cmpxchg.org, hughd@google.com, jannh@google.com, 
	joshua.hahnjy@gmail.com, lance.yang@linux.dev, lenb@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-pm@vger.kernel.org, lorenzo.stoakes@oracle.com, matthew.brost@intel.com, 
	mhocko@suse.com, muchun.song@linux.dev, npache@redhat.com, pavel@kernel.org, 
	peterx@redhat.com, peterz@infradead.org, pfalcato@suse.de, rafael@kernel.org, 
	rakie.kim@sk.com, roman.gushchin@linux.dev, rppt@kernel.org, 
	ryan.roberts@arm.com, shakeel.butt@linux.dev, shikemeng@huaweicloud.com, 
	surenb@google.com, tglx@kernel.org, vbabka@suse.cz, weixugc@google.com, 
	ying.huang@linux.alibaba.com, yosry.ahmed@linux.dev, yuanchu@google.com, 
	zhengqi.arch@bytedance.com, ziy@nvidia.com, kernel-team@meta.com, 
	riel@surriel.com, haowenchao22@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 3:46=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> On Tue, May 05, 2026 at 08:38:30AM -0700, Nhat Pham wrote:
> > When we virtualize the swap space, we will manage swap cache at the
> > virtual swap layer. To prepare for this, decouple swap cache from
> > physical swap infrastructure.
> >
> > We will also remove all the swap cache related helpers of swap table. W=
e
> > will keep the rest of the swap table infrastructure, which will be
> > repurposed to serve as the rmap (physical -> virtual swap mapping)
> > later.
>
> I didn't look through the entire series, but let me ask the same
> high-level question I asked before. Instead of moving things out of the
> swap table, why not reuse the swap table as the representation of the
> virtual swap space? Seems like most/all metadata is already moved there
> in a nice concise format.

The honest answer is I wasn't sure it would work, so I was hacking
quietly a prototype on my own time :)

I finally got something that survives stress-ng and constant
memory.reclaim thrown at it though. I figured I should send it out to
get feedback before digging myself deeper into that hole:

https://lore.kernel.org/all/20260528212955.1912856-1-nphamcs@gmail.com/

There is still a small problem left (the metadata duplication issue
that Johannes brought up). It is potentially fixable, but I haven't
actually tried it out yet, so I don't want to overstate here. But take
a look at it and let me know how you feel about this alternative
approach!

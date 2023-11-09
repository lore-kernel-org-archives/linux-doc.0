Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F06539B
	for <linux-doc@vger.kernel.org>; Thu,  9 Nov 2023 02:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E1/PhaLR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FFC1C433C8
	for <linux-doc@vger.kernel.org>; Thu,  9 Nov 2023 02:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699497731;
	bh=TS4NArmNX08QlaEz4GZTMc0gnSDo8pxfWNHZHMsNNlk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=E1/PhaLRfJf+zxfg9ScH+/8bdDuFGGbkbizoW9oCiRkj5alN2svu6m/17pXKGv6WL
	 DnchPn3iFBVM0HDAh4+F3Dt3vRFMIaX1snqQEZSKmNBnV6NDtwfG0f6KbXpfZBnWs0
	 /ohx4fPRGkIrc2BPwVUzIr7FyWkjnI4/THZoMbeVOIhSFASSsCyJfEan5cTTWbFUkx
	 3gr6BROLw/aP4F/uwrTCf2LHW2o6LRjY03t+Foz4pPUn7+r2A2GwZOX4xXA7zLFIZZ
	 EcAW/EnTknByLUCYqFkECMha+EC4o2etMF80zzAqLDnbechjSGWaRTgedajl78xJ0A
	 Rf3NigEOk/nhw==
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-41cc7b67419so2550301cf.2
        for <linux-doc@vger.kernel.org>; Wed, 08 Nov 2023 18:42:11 -0800 (PST)
X-Gm-Message-State: AOJu0YxL/EiHSqI8YvLm1kZgn8Lapz8svQfVRgoVUpJqtFU2Vfg3kPWJ
	bAq56rcqgn5aGx5rmJX8iRZpeqM/pA1mRiBJ2VUM3w==
X-Google-Smtp-Source: AGHT+IGcIFSAFrs0qInF0exuNbYq2osAesSeB/kePPuC9Ov8rDxwXdDduiIXr8vTvgnCEBXZl0IY9dxfmxJYahnastI=
X-Received: by 2002:a17:90b:1c88:b0:27c:f80a:2c8a with SMTP id
 oo8-20020a17090b1c8800b0027cf80a2c8amr374608pjb.0.1699497709899; Wed, 08 Nov
 2023 18:41:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231102234236.1784543-1-nphamcs@gmail.com> <CAJD7tkapfHVvF1KCm4iUDWGP0n5zV3GBcNAGDiYNHrpuODPPqQ@mail.gmail.com>
 <CAKEwX=MunYMKQXsV58vBXROKnJFDhViCpQgC7RnrLExa_U=n2g@mail.gmail.com>
In-Reply-To: <CAKEwX=MunYMKQXsV58vBXROKnJFDhViCpQgC7RnrLExa_U=n2g@mail.gmail.com>
From: Chris Li <chrisl@kernel.org>
Date: Wed, 8 Nov 2023 18:41:38 -0800
X-Gmail-Original-Message-ID: <CAF8kJuPgWjim82+HmEgkkWrDNwi2co-3ay-35fjoLb8-k9rNXQ@mail.gmail.com>
Message-ID: <CAF8kJuPgWjim82+HmEgkkWrDNwi2co-3ay-35fjoLb8-k9rNXQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3] zswap: memcontrol: implement zswap writeback disabling
To: Nhat Pham <nphamcs@gmail.com>
Cc: Yosry Ahmed <yosryahmed@google.com>, akpm@linux-foundation.org, tj@kernel.org, 
	lizefan.x@bytedance.com, hannes@cmpxchg.org, cerasuolodomenico@gmail.com, 
	sjenning@redhat.com, ddstreet@ieee.org, vitaly.wool@konsulko.com, 
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeelb@google.com, 
	muchun.song@linux.dev, hughd@google.com, corbet@lwn.net, 
	konrad.wilk@oracle.com, senozhatsky@chromium.org, rppt@kernel.org, 
	linux-mm@kvack.org, kernel-team@meta.com, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, david@ixit.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nhant,

On Fri, Nov 3, 2023 at 12:24=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrote=
:
> >
> > Would it be more convenient if the initial value is inherited from the
> > parent (the root starts with true)?
> >
> > I can see this being useful if we want to set it to false on the
> > entire machine or one a parent cgroup, we can set it before creating
> > any children instead of setting it to 0 every time we create a new
> > cgroup.
>
> I'm not 100% sure about the benefit or have a strong opinion one way
> or another, but this sounds like a nice-to-have detail to me, and a relat=
ively
> low cost one (both in effort and at runtime) at that too.
>
> Propagating the change everytime we modify the memory.zswap.writeback
> value of the ancestor might be data race-prone (and costly, depending on
> how big the cgroup subtree is), but this is just a one-time-per-cgroup
> propagation (at the new cgroup creation time).

I think Yosary was suggesting inheriting the initial value from
parents. That is just one level look up when you create the new
cgroup, using the parent value as default. No recursive.
What you described above seems different to me. I understand what you
are suggesting is that writing to the parent cgroup will recursively
write to all child cgroup.
>
> Can anyone come up with a failure case for this change, or why it might b=
e
> a bad idea?

I would suggest against recursive changing value behavior.
What if you want the parent but also want the child to keep its value
not changed? Every change to the parent will have to go through the
child to flip it back.
Inherit from the parent seems fine.

Chris

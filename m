Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884D0328255
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 18:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779214072; cv=pass; b=TV0P0ZIWMlBnPHL7xGFkcbZDk0UzxlSLpac/5dbUPcG+EZRsuZMoZW151wLMu4ssGEtB7qWy7pH/Px/sv080wqRkzg6MiWkDGI5x5vdkNpUV/q/x/DpIMF9hlw2LAK8IPRQewtxFrt3oM/+O1UkvmiHL9p/FExB/kEhDkEA9iOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779214072; c=relaxed/simple;
	bh=xssGkiKE0NLLgIm8hq0sx4z1JVWvwtNlxiDz+CYQuyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rL9SEJkjvg0lO5K54g9IFf/MkcPKAS/vmzOvFlfmY5ji/shFznQcKFutiOxLggeyDTtD/EW5FGDFkkvqoEmKSkHJU6L2fOE+4HdBOnQVn09sAe/I9gzuRu+qDqZ4cEnlqi14ZrFRP9/lcvX6p0xamBBjZlgI6NovXNdTiAh/H6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eWeWeIWF; arc=pass smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eWeWeIWF"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4891ca4ce02so515e9.1
        for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 11:07:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779214069; cv=none;
        d=google.com; s=arc-20240605;
        b=VKxQRZgnOonHdFrINvYYdhL+h/hJ/0n7ClRZeamymUQlL9FU56dyssmSCdisuznob6
         oJvGcGkmZnQwuxpKeAIhLbs29pd8iitHhjvbpHrJO3i+/Epw5QC+miYvW2IRLEw6rVGp
         b5jJ96C2r1KpzRxbK/85a1Nm8dEbSEwVBmsk0e013DscToNOQX9gAqIheAkDLEtbdLqr
         /q0EbDWlv5Lg+GVmEPxbdieRcJhYOiRdLnVjUx6pS+SBxYY7HrHgTCU6QI7VoCxG2Tbe
         R6/TYTnoIEAt+yUeU08ZGLVvNOhxc1cL8ttIC7vvstAW4T57Ksz+gZqnKROBvg8emY30
         tvkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xssGkiKE0NLLgIm8hq0sx4z1JVWvwtNlxiDz+CYQuyY=;
        fh=WnoS4cYnO3iQ5ARoxZs8YR2QoeNNBer4//gA7HcHBRI=;
        b=eJ59pAmiOl40BYTGJDGZOq/4aG27jpPnZbnJ0ndP29M8GZKQpUbt1xsGuqo7XgYr3P
         AKsv8hg8FO5UxwKLOmmK2jZOUG71A/pz80MPbxQH/pLcE287vTq2Smrp8YLj1frJ0urt
         kmCei1b73sk4NnrP8KZmdj3qhIG3JS4yvqNtV84dRu3hHZuBYwVFaHhlYHl4zOzxO5ul
         8BGtibD10j2hgVEHiJyHq1a9/24+yM+pxwtq/5hYi4JiPeHDkxBinGDiul9YCf4dL0hf
         Ar9AuOSJ/NnHu7EktT7prY18vQri1NbVZF8wcw12orhuy43qDKxQRUvH+vtmPZx4hbSR
         l7PA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779214069; x=1779818869; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xssGkiKE0NLLgIm8hq0sx4z1JVWvwtNlxiDz+CYQuyY=;
        b=eWeWeIWFQkhgJUMtdPmPfch1gHn6y0RMODHat6KPHaMDF1OFqbY09x0XUxRQFve3Tw
         GKjCah7Z65qJy9VtD0Xk6PUxhM5gbnnmPIGPlCEpuxQohywyZ9YAuoDmCOa+72a1xeKs
         S5qZzMKHV2zKB0B9JpYcPsctQUH8Gb9XlVy0HShMsnSXwU9pIA+pP9rjSi9x+ZD9Bs3Y
         xBy3CLTe7d2Swwrnwd+u7NE7MUJinmvcZbLWYQOcJWO1eQ/orFirzO/2qg5Fq/nAfiyC
         1yInXJBRFkQP2HD67p/H19TSSyUE2k1fRPB2hpYAyVhjvkSF0KrJKlfI3BtcNnVD4Hai
         iiQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779214069; x=1779818869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xssGkiKE0NLLgIm8hq0sx4z1JVWvwtNlxiDz+CYQuyY=;
        b=q88lftwECpExc4Aa4S9uelJlJq5KRB9zTLwpqqq4tyi7jtNFLt3B6W72C6rqIRcWdi
         NdeQRkGwrp6Xj792LCArLWW7nq/+4vEymsjM7gB03oQK3cqtosGKdC9rAK/WgNxUrI0L
         qOmkb1gx8SFN9IQXaTF13IywUONlh3NY4LVZKF44HYiKClNnG6x7FqWPwCeJziqSGofJ
         NZuLUxVk+w8nBwhZqBVAAaHyCu163wzcWaSlqac4ie+X7ddk2QY3zAbJjvsgZySVeGhq
         w8c4Qvzj/rRTjrXSinTIfo7V3iZFN6B8MXM6J6QwFWltRpufrumMz6DEqzJztGX/3RwJ
         F71w==
X-Forwarded-Encrypted: i=1; AFNElJ96ah++DRQcHqGFMUasmSjLSbx4gdlaaIEYHS7xJA73aTvwtrc8PFp/aXES63O7uf5mHJ0ZWLdk280=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSJq+HzmIoCklug392ERJ67PDb7YHTdQsV4gFzaJ4LQfNFCRsi
	EArH5e5dLSWMdrf71GdgDlfnfwojF5IU/N6k7xpM2vhB70zz5Ljd5XGapvRdhOGkncE6uw7a6Zv
	4A3pbI67tdypf+o5fS9v1mZzUPgEQvPsnosKFohUJ
X-Gm-Gg: Acq92OHLAmxSMlY6zBLedlecjO7GETW3pMMf3XJDPKJx/DYR/4UG6DrKYn8QFIAIyz+
	yYExEQOrtLt3QK5PcKs6ZYjySzoMqLFaa+8dcDNOaSUXEvtW2u+N9VTtNMlzLBLTLv4yygQZjKN
	bfDV6DeFgFNjHHcetHbbOc5EQ2G3ulwupO2z8Sul/cgC1z6MTexCTsPtj4zvTH28j5S5c6NivNr
	3bpmflN0EDcXlvD6RZbSDP4Ka5ytmQz0tIINt+j02bhkkNm6Hhd6aAax1XChFI7toBU6/SStAnw
	EKXCF6GTLeIYb42deT+0hFd88eXvM5Kr2jU7c0JRL1YOMd7I
X-Received: by 2002:a7b:cc8b:0:b0:48f:de33:777a with SMTP id
 5b1f17b1804b1-48ffd857abfmr3637845e9.11.1779214068422; Tue, 19 May 2026
 11:07:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512-v2_20230123_tjmercier_google_com-v1-0-6326701c3691@redhat.com>
 <20260512-v2_20230123_tjmercier_google_com-v1-2-6326701c3691@redhat.com>
 <20260515-hinschauen-effizient-9e3a05a94f2e@brauner> <CABdmKX0d6Zsg+_TxXjB80UZR23ZvXzxYoWzORgwmx=ZiuE+Nzw@mail.gmail.com>
 <208fb820-d8eb-4832-a343-ef8b360e8120@amd.com> <CADSE00Lh95ygoXGKJGsYvQGEsFV8sVmwEC3uvh8M6r3ERzaJwg@mail.gmail.com>
 <88efe10a-8b93-4a81-8279-4a5559d0f17c@amd.com> <CABdmKX3yZubjDKbVqwrjHAiKyj_ioHzOoxd0wzFbJK=PAGOqcQ@mail.gmail.com>
 <01b6eefc-c107-4f8c-9d7c-3b86f54cabaa@amd.com>
In-Reply-To: <01b6eefc-c107-4f8c-9d7c-3b86f54cabaa@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 19 May 2026 11:07:36 -0700
X-Gm-Features: AVHnY4JsuFzXOj8AzAQ7jEDe53JgzbJyOG548qhgZV3zTdsbu0QldI49eMqYz9w
Message-ID: <CABdmKX1wLoLuWPUEY3D7afQhO0AUnOE7c3iE-VkPuKdeQixBxA@mail.gmail.com>
Subject: Re: [PATCH RFC 2/5] dma-heap: charge dma-buf memory via explicit memcg
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Albert Esteve <aesteve@redhat.com>, Christian Brauner <brauner@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-mm@kvack.org, linux-security-module@vger.kernel.org, 
	selinux@vger.kernel.org, linux-kselftest@vger.kernel.org, mripard@kernel.org, 
	echanude@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 12:19=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 5/19/26 01:39, T.J. Mercier wrote:
> > On Mon, May 18, 2026 at 7:07=E2=80=AFAM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >>
> >> On 5/18/26 14:50, Albert Esteve wrote:
> >>> On Mon, May 18, 2026 at 9:20=E2=80=AFAM Christian K=C3=B6nig
> >>> <christian.koenig@amd.com> wrote:
> >>>>
> >>>> On 5/15/26 19:06, T.J. Mercier wrote:
> >>>>> On Fri, May 15, 2026 at 6:53=E2=80=AFAM Christian Brauner <brauner@=
kernel.org> wrote:
> >>>>>>
> >>>>>> On Tue, May 12, 2026 at 11:10:44AM +0200, Albert Esteve wrote:
> >>>>>>> On embedded platforms a central process often allocates dma-buf
> >>>>>>> memory on behalf of client applications. Without a way to
> >>>>>>> attribute the charge to the requesting client's cgroup, the
> >>>>>>> cost lands on the allocator, making per-cgroup memory limits
> >>>>>>> ineffective for the actual consumers.
> >>>>>>>
> >>>>>>> Add charge_pid_fd to struct dma_heap_allocation_data. When set to
> >>>>>>
> >>>>>> Please be aware that pidfds come in two flavors:
> >>>>>>
> >>>>>> thread-group pidfds and thread-specific pidfds. Make sure that you=
r API
> >>>>>> doesn't implicitly depend on this distinction not existing.
> >>>>>
> >>>>> Hi Christian,
> >>>>>
> >>>>> Memcg is not a controller that supports "thread mode" so all thread=
s
> >>>>> in a group should belong to the same memcg.
> >>>>
> >>>> BTW: Exactly that is the requirement automotive has with their nativ=
e context use case.
> >>>>
> >>>> The use case is that you have a deamon which has multiple threads we=
re each one is acting on behalve of some other process.
> >>>>
> >>>> At the moment we basically say they are simply not using cgroups for=
 that use case, but it would be really nice if we could handle that as well=
.
> >>>>
> >>>> Summarizing the requirement of that use case: You need a different c=
group for each thread of a process.
> >>>
> >>> Hi Christian,
> >>>
> >>> Thanks for sharing this atuomotive usecase. If I understand correctly=
,
> >>> the actual requirement is attributing dma-buf charges to the right
> >>> client, not putting each daemon thread in a different cgroup?
> >>
> >> Nope, exactly that's the difference.
> >>
> >> The thread acts as a filtering agent for both memory allocation and co=
mmand submission for somebody else, the process on which behalve the daemon=
 does things can even be in a client VM, completely remote over some networ=
k or even something like a microcontroller.
> >>
> >> Everything the thread does regarding CPU time, GPU driver memory alloc=
ation as well as resources like GPU processing and I/O time etc.. needs to =
be accounted to one client which can be different for each thread of the pr=
ocess.
> >>
> >> The only thing which is shared with the main process thread is CPU mem=
ory resources, e.g. malloc() because that is basically just needed for hous=
ekeeping and pretty much irrelevant for this kind of use case.
> >>
> >> The problem is now you can't do that with cgroups at the moment but un=
fortunately only the kernel has the information you need to know to do this=
.
> >>
> >> So what you end up with is to define tons of interfaces just to get th=
e necessary information from the kernel into userspace and then essentially=
 duplicate the same infrastructure cgroup provides in the kernel in userspa=
ce again.
> >>
> >>> If so,
> >>> the `charge_pid_fd` approach achieves this directly by passing the
> >>> client's `pid_fd`, without needing to add per-thread cgroup
> >>> infrastructure.
> >>
> >> Well it's already a massive improvemt, we could basically stop doing t=
he whole duplication part for the GPU driver stack and just use cgroups for=
 this part.
> >>
> >> Doing that automatically for CPU and I/O time would just be nice to ha=
ve additionally.
> >>
> >> Regards,
> >> Christian.
> >
> > Hopefully I'm following correctly here.... So you are duplicating the
> > GPU driver stack to achieve remote accounting on a per-thread basis?
>
> Not quite, we are duplicating the handling cgroup provides in the kernel =
in userspace.
>
> For this memory usage information as well as execution times of the GPU k=
ernel driver is exposed in fdinfo for example.

Oh I see, thanks.

> > Does this mean for GPU allocations you currently have some GFP_ACCOUNT
> > magic in your driver to attribute GPU memory to the correct remote
> > client?
>
> No, we just expose what the kernel driver has allocated for itself. E.g. =
page tables, buffers etc...
>
> When userspace allocates something using memfd_create() for example we ju=
st ignore that.
>
> > So this series would close the gap for dma-buf allocations,
> > but what about private GPU driver memory allocated on behalf of a
> > client?
>
> Well we would need a cgroup which isn't associated with any process were =
we could charge the GPU driver allocations against.
>
> But good point, charging against a pid wouldn't work in this use case.

It would be pretty low overhead to put a process doing while(1)
pause(); in a separate cgroup for this purpose, but I guess a fd for
the actual cgroup would be a little cleaner in this case.

> Regards,
> Christian.

Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABDE368D62
	for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 15:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584184; cv=pass; b=WDgK0K+XClM3/Lq1MB1UVoBJohT4GFjNEMNwLI0fYSzKbQE45rWVQeDXO8KiF9wS1zmgGMPlaVImfmAhyALtjfbmX3Po3OW61AsJBNL1QBR5FT+LmHc7Wo1L9Zrwkg6nQI6qTQgqD7FCsaSfiul5zjnvvJOlSubHkJnV2ay1KIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584184; c=relaxed/simple;
	bh=jV6t4K1f7KF57ErfkTlsXbCkvry3AsToveZsXjsa/0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dG1BzwMMGLOnJVJnthDXSQNm4Ws5oU/n2oUVTqvf60H1V1Wjbh71J914WxqXuz1NXMeH7YkLJ78RWHyDXlyBHGSF5M4sY56Smxblz7nonkXdbZz1WS7VxjP0EDEQSzapLiBmZoHrrOEMCqf0cqWsBQ+N2RdPvCeHLjb5/RkWb+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rPNV6lNY; arc=pass smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rPNV6lNY"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4954df200ddso19939355e9.0
        for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 08:09:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787584179; cv=none;
        d=google.com; s=arc-20260327;
        b=ATnrQtwvLZ/0TlFSLPvpnf4NRega0+ezSoqgYgukDFcNLmtENioZjtFiVowdGRTttL
         DKNCS9RacjyWgUn/wz5T5mmmxzaTPPAhsvU4S0UniXPNRG47QdNLEDhNDtKO7V6rSxVm
         C7AToxOkLHC+8dlhAL9k3WMYnJS5q2I2T5tOM+tAtwNLoRlKye23xz5nag59ALUM86Rd
         9GvH8F0hs9YtjcKqpeh/+8HSzUyBXrgNYRwWLwczvsKYZznO43c8YllUiUBhUCHqBKbC
         NuXcSPvlqVz6auwibnTU/CkOJIlWskAixdGH55Wr929LqfL1CA7Y+Avpi1zn0XrRg5HQ
         HuLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xCITwuJY/5I+fZvxebAJG0MATII2H/0d6uwBA3oASW8=;
        fh=mr8huedu9B3YV4LNGXt8eTNLMtP34hUMY9GT/snu2I8=;
        b=r/YlcB9XvfbsiQDvt4d6u9/o3yqKknIWt0QBxX0i4V2+5Qp5pnh7/SzhcmJ/pr/0Gx
         H8HRsxkFAxD8dALwDYEeGF00nn96cp1+UbTnpCZPvZ4odX05rKS8RlkpPqgkoNQfux0d
         arqPV6SHX4o0IHj8Ey7EH6PX1ibshTRVldNyC6DFGGJA9leNY68lEsIRP32Ot6gYtBsX
         bDvQO9sSeZyv63FsEKzWtROWQvUlm4/xuPqmhbRPZz0czPy4WVmW1Wzvfj5xrzmGbrBm
         IDf/HpjgiRadudJ0v4hCX6KVVGwb4JWJXn6o0k/MVpqRvuIHjTghQ13FVJqrmPKJf7tj
         WOxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787584179; x=1788188979; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xCITwuJY/5I+fZvxebAJG0MATII2H/0d6uwBA3oASW8=;
        b=rPNV6lNY8us22pzCxOj4iqgd4+W8CPwzVeOWosdankMtbnigGR+cOxM8kyF/iGLRmC
         8TLc51hvBp6spRFz/jiVllEdvUoklHQwf1HkzHdw/peJSY7s4d0sAO8MesvYy75zh8VQ
         dys8+fPA/l9gqkekqUoCqKUtmJwjm8hjZa9NrU97MEfF+4txRJtjGOpBNIOi7fj5Z2zw
         qk15yy4nTg9QMln/V2pbxO+X2zxEEisGFBIis2qdoCE7g+QZsx2eJuGRqa5/PmD4ycpl
         8cvoESIjTH/r+MAQHy3vgAV23Oxk3eHUTUc0QhrvkRxPI2DPdHgk6GUgrXDtnGkEDvoK
         uaHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584179; x=1788188979;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xCITwuJY/5I+fZvxebAJG0MATII2H/0d6uwBA3oASW8=;
        b=TQssLna47gn0ooSFdeJL7KAVVWJpOKRPNw6eg9B5qJdvYYfNphv59vslWyytAwlkBg
         yVNNwhq9Ll37lpMIWAKygffnYEesxmznHaI4XVRgmsEvu2xXqIlFvym+hLs6olAvHM4Y
         01ptKrHO9d5WzH/J1PsuOZ9r1i84oE7F0/LSC82Xjbx5kmerYQDS0otp64WkZpmLCHqh
         6plfy/cTDnmDA95BSrJ6criQiRTOGhBbLgYCwKZT+jsr2DqPY45QeDpLdngFhFFd5KS4
         0P98LaDW79q2GnFWh2HflrKNX6/J9+iRHTI+qJDoKq8/gR3QuDVPRJf7tgedU1M2R/hH
         lp/A==
X-Forwarded-Encrypted: i=1; AHgh+RqJedDokHA5QmphC7+VCV6u42FpnZBRHEbJ/T2XZche+dtk+JzXBIl71SHIJyiarPBdQoeLKNUh9Vk=@vger.kernel.org
X-Gm-Message-State: AFuF++ntO1LnasL7vup1bmNmo/4DIunnIrqwBXGfy/+6eGJbpSAc08hs
	8kGwUwICzlKz7lE4d1tnELZgnwA0yJJGCCXYTcP3ENTt15GeGWdicaMMONHRytQ2w9wm/LNMJ5c
	yA8zI+Vvo4HqGOHl0eRMqIb6tEGDtF4c=
X-Gm-Gg: AR+sD12REvLfV9BG5avJhteRWRPuhxIhAHD2b8ruemyjXJHvZ6xlDi9hk3wsTIlU7N0
	Roz6poWCSWx7Mv0+b9ubXUfS+CfWK+LCoDvBzRUJPAN6T1o09Rs2AJywkT7qZCysiboU7oCb3Oo
	rtgLMUiOQkWbeE4+D5rIPxlQyDcnChEMUdCoQvc09UE5Y+mGVQebM+VGf3vJwAwWqNTviH4pw84
	5LaFvc7ReNKzw7cDG2auU3VvKnovQIL74YCr+aMNjF49BfPNhF6pa7bqBzCJmFe5srQ1vG1VlRn
	94ZQtgx9HOn5f4PALHxDGPyz9ySupLosXlatBNVyNZiYUg==
X-Received: by 2002:a05:600c:4ece:b0:499:484a:81d0 with SMTP id
 5b1f17b1804b1-499c19e973fmr212050255e9.9.1787584178832; Mon, 24 Aug 2026
 08:09:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529165640.820-1-ravis.opensrc@gmail.com> <20260818073546.832476-1-kunwu.chan@linux.dev>
 <CALa+Y16xODsaFZDfh7ZeP3gWbycK92gvP5N8_NFpOvW=R2BWbg@mail.gmail.com>
 <CAN_Opa_h2W1hRimy2YXPC4EgueCi2UNwnZ5gSYV=cr8M7yfCmA@mail.gmail.com> <CALa+Y15zNhpubyH5GQgu_BHesrwRdH0B8k5cqT3o_U0h5A2e-w@mail.gmail.com>
In-Reply-To: <CALa+Y15zNhpubyH5GQgu_BHesrwRdH0B8k5cqT3o_U0h5A2e-w@mail.gmail.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Mon, 24 Aug 2026 23:09:26 +0800
X-Gm-Features: AcwNN1Un4mBIKrUBo5pV6pSoeblVjDHYRZMA2eMa4t47pkuOoxnZ-4altPzxyQc
Message-ID: <CAN_Opa_JorKoVcyhPPLOnFOOGOMCd0r4Lr-eU1e1OraRq-FAMg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] mm/damon: hardware-sampled access reports
To: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Cc: Kunwu Chan <kunwu.chan@linux.dev>, sj@kernel.org, akinobu.mita@gmail.com, 
	damon@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, akpm@linux-foundation.org, corbet@lwn.net, 
	bijan311@gmail.com, ajayjoshi@micron.com, honggyu.kim@sk.com, 
	yunjeong.mun@sk.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 22, 2026 at 12:32=E2=80=AFAM Ravi Jonnalagadda
<ravis.opensrc@gmail.com> wrote:
>
> On Fri, Aug 21, 2026 at 2:55=E2=80=AFAM KunWu Chan <kunwu.chan@gmail.com>=
 wrote:
> >
> > Hi Ravi,
> >
> > Thanks for the detailed reply.  The fan-in diagnosis makes perfect sens=
e.
> >
> > > Your series is based on the v1 substrate, and the way an event is
> > > configured is the part that moves most.
> > >
> > > [...]
> >
> > Glad to hear v2 is on the way.  The probe-based model is actually
> > something I encountered while building the AUX backend. When multiple
> > sources can feed the same region (e.g. PTE scanning + SPE/IBS), the
> > question of how to combine their reports becomes interesting.
> >
> > For example, CXL tiering may care about physical-address locality, whil=
e
> > per-process monitoring may need virtual-address attribution.  How do yo=
u
> > see probe weights being determined =E2=80=94 is that expected to be
> > scenario-specific, or is there a more general principle behind the
> > weighting?
>
> Hello KunWu,
>
> SJ can answer that authoritatively -- the probe and weight interface
> is his. Here is my understanding which SJ can confirm later:
>

Hi Ravi,

Thanks for your detailed reply and for sharing your understanding.
The probe-weight framing clears up the part I had backwards.

> Weights are relative, and only among probes. A context can hold up to fou=
r;
> each report carries its probe index and credits that probe's own hit coun=
t,
> so two PMU-based probes in one context are scored in proportion to their
> weights, and that is where a scenario-specific choice belongs.
>

This makes sense. I had initially been thinking about using the weights to
tune SPE against PTE scanning within the same context. I now understand tha=
t
the weights are for combining multiple PMU probes within a context, rather
than blending PMU reports with the existing PTE-based access checking.

> What does not mix is a weighted probe with the other two sources. Any
> nonzero weight switches the whole context to probe-weighted scoring, whic=
h
> turns page-table access checking off -- so SPE cannot be blended with PTE
> scanning, it replaces it. Page-fault reports carry no probe index; they
> credit the region's access rate but have no hit count, so under weighted
> scoring they are not part of the score either. Both coexist with a probe
> only at weight zero, where everything feeds the same access rate and is
> indistinguishable afterwards.
>

The "replace, not blend" distinction was the key correction for me.
For PA locality versus VA attribution, using separate contexts therefore
makes more sense.

> So for your case I would read it as: PA locality and VA attribution are
> different targets and different address kinds, which points at separate
> contexts rather than one context with tuned weights.
>
> >
> > > 2. The 67.9% drop rate is fan-in, not sizing
> > >
> > > ---
> > >
> > > [...]
> >
> > I completely missed this.  The observability framework showed the
> > symptom (67.9% drop) but got the root cause wrong =E2=80=94 it's not a =
ring
> > sizing issue, it's a fan-in problem.  With a single kdamond thread
> > draining the per-CPU sources, the samples effectively get funneled
> > into a single ring, which explains the numbers.
> >
> > The per-CPU drain approach using `system_percpu_wq` and `queue_work_on(=
)`
> > looks like the right fix.  Our AUX backend already carries a CPU argume=
nt
> > through the ops, so adapting it should be straightforward.  I'll take a
> > look at your v2 branch and re-test with the per-CPU drain.
> >
> > Two questions:
> > 1. Is `damon/perf-rfc-v2-08-20-26` ready for me to rebase the
> >    AUX backend and observability framework on top of it?  I'd like to
> >    validate the per-CPU drain fix with real SPE hardware.
> >
>
> Yes:
>
>   https://github.com/ravis-opensrc/linux.git
>   branch damon/perf-rfc-v2-08-20-26, tip 9c0410564596
>
> That is the branch I used to exercise the AUX path. It carries all five o=
f
> your AUX kernel-consumer API patches unmodified, and from the SPE series,
> patch 1/4 plus the generic half of 2/4. 2/4's SPE backend and parser, and
> 3/4 and 4/4 which test them, are SPE-specific and I used an x86 box
> with virtual PMU.
>

Thanks for making the testing branch available. I'll use it as the base
for the rebase and testing below.

> The branch is force-updated post fixing two trailers please re-fetch
> if necessary.
>
> None of it is meant for my v2 posting.
> This branch is only the vehicle for testing the AUX report path.
>
> The SHAs you will care about:
>
>   808519650a7a  the per-CPU report side
>   e3323a3bdc75  your AUX interface, ported to the probe model
>   1c347519c626  parse each CPU's AUX buffer on that CPU
>   9c0410564596  perf/core: balance the AUX buffer reference on kernel
>                 release
>

Thanks for this detailed information.

> 1c347519c626 drains with one work item per CPU in the event's cpumask, vi=
a
> queue_work_on() on system_percpu_wq -- system_wq would not do, being
> unbound it silently ignores the CPU targeting.
>

Understood. This also matches the fan-in issue you pointed out earlier.
I'll keep the CPU-local drain model when reworking the AUX backend.

> Two things came out of a quick test in a VM:
>
> - spe_backend_init() calls perf_event_setup_aux(), but I could not find a=
ny
>   path calling perf_event_release_aux() -- spe_backend_cleanup() frees on=
ly
>   st->win, and your kerneldoc says the release must happen before
>   perf_event_release_kernel(). Left alone on my branch.
>

Thanks for catching this. I'll trace the cleanup path and make sure the
missing `perf_event_release_aux()` is called at the appropriate point befor=
e
`perf_event_release_kernel()`, then re-test the lifetime path.

> - 9c0410564596: the explicit ring_buffer_put() in perf_event_release_aux(=
)
>   is one too many, since ring_buffer_attach(event, NULL) just above alrea=
dy
>   drops the event's reference.
>

Thanks for catching this as well. I'll keep `9c0410564596` when
rebasing the AUX work.

> > 2. For the probe-based configuration, does the `prep_action =3D "perf_e=
vent"`
> >    model preserve the same event lifecycle?  Our AUX path needs to crea=
te
> >    and bind the event during apply, keep it disabled initially, and ena=
ble
> >    it when kdamond starts.
> >
>
> Yes -- created disabled during apply, bound, then enabled. Per CPU, on th=
e
> kdamond turn-on path:
>
>   perf_event_create_kernel_counter()   attr has .pinned =3D 1, .disabled =
=3D 1,
>                                        so the counter is installed but no=
t
>                                        yet schedulable
>   ops->init(event, cpu, perf_event)    your backend attaches the AUX buff=
er
>                                        here, via perf_event_setup_aux()
>   perf_event_enable()                  only now can the PMU be scheduled =
in
>
> So the buffer is always attached before the counter starts. If ops->init(=
)
> fails the counter is released without ever being enabled.
> kernel/watchdog_perf.c uses the same pinned + disabled-then-enable pairin=
g.
>

This lifecycle is exactly what the AUX path needs: the AUX buffer is
attached during `ops->init()` while the event is still disabled, and
the event is only enabled after successful initialization.

> Sanity-tested both report paths in a VM.
>
> Best Regards,
> Ravi.
>

I'm looking forward to the formal v2 as well. I'll continue working on
the perf-side changes so that the new model can be exercised with
hardware-sampled access reports in practice.

My next steps are:

1. Re-fetch `damon/perf-rfc-v2-08-20-26` and rebase my AUX backend and
   observability framework onto the probe model, including the SPE-specific
   backend/parser and tests.

2. Integrate the per-CPU AUX drain from `1c347519c626`, using
   `queue_work_on()` on `system_percpu_wq`, and validate that the fan-in
   problem is gone.

3. Fix the AUX lifetime path by making sure `perf_event_release_aux()`
   is called at the appropriate point before `perf_event_release_kernel()`.
   I'll also keep `9c0410564596` for the `ring_buffer_put()` fix.

4. Re-test the complete lifecycle and the per-CPU drain on real ARM SPE,
   including stop/restart, CPU hotplug, and failure paths, and compare the
   observability counters with the previous 67.9% drop result.

I'll report back with the results.

Thanks,
KunWu

Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689EF35203A
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 16:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787329938; cv=pass; b=cOohLXLkc0GWxLzVhG0/t0ocGEvDcrHPKN6lJMOv2AwKDeca+pulTe9NnewkO2FiIOabUjpRZq62vKw2S2gL/kBAZ8EvDSdvM8sHQurRfAo7dtLs92Bk9DG4G6QJv05s3FBikM0I5LiyVC06yfEyEHQ3Tw8ml12kc4mTcia44C4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787329938; c=relaxed/simple;
	bh=GR3jitzuEK6kbLhbeRalr0pMmm+B53ViUUVAq1gI7w8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ekW45WZUf7DsmQNYr7esA5Mh4WLvH4g9Rkta6gxEMlkbeccxwIffoqXEZVJ+Ge8O5MhGIOzsqgqKuaxXJquSAt72l8z/rtDoy6kJjj6M8mCxR3tsUsQ5NLAoM119lXtr6onkYpPCv+z6gtmsfmKuzEfM0nq/SVILzSv2qE48uNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A2unVZoM; arc=pass smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2unVZoM"
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-38dc4f9462cso362166a91.0
        for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 09:32:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787329935; cv=none;
        d=google.com; s=arc-20260327;
        b=PLA+PW1LIOAE3yspOf2quaQy9nJENmCqRJHZ9WDPtUAz6g3ZORyVkTQRhxhpnmbtc7
         05xa7V04LyC77AQrk5DHMiN0+XdLaWprPRqbma2xl2h9EORPZvuLrXdASp1sAlfnTLyB
         oIF0O1FcIhx2BmQYEdkHL76ux2z8sBcmeioekdPQBhsgN8/16iq+yevKdLQgcbdMqUwl
         pn5+PXZRhPVdBPaMmH0a21hJ7iIYa965mVlq+c3UobjzRNRFL8cU9ovAZxc1f1+w4wHN
         88dOCg5btF7mtQisXygk4u+JZoI3rZwbUKnXA309EbWgW/r+OfTxkNqjST0/Qxj4hykt
         q1uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uKrunJMg40NjeuxUGrFsyHBAkzDtHd4//4PJzcyrA7w=;
        fh=RQ3rW7+HUQeHuy/9K60Ref0yFfRX9UF9F8OIB8OD42w=;
        b=pa2NppvnKCd3Qgfnf0JPTZJ5fyh9EBKhUl8mAjx8wGUZl+G2xvdjzyV9Ti2qQxAkYr
         JHnV68z1riGs9afNhBdu802wQkGy4p7soC3neVOwZCJawBI+Yka/Dbod5ZZjf2FCSsIZ
         Zs/zTuDOt46HLYcUYtAQqSbT9brZRpF2aiVURZ9ncN7tWkeXROikEHwxKcF/D6ixKwWo
         +VLcyfwNq7/RGcOQJ6jvhU1k9+28PZzcoZ29raUQFOjzWS9as0RRjZSTL/HDx3XX7q8w
         VaRPPxlcE986BCksgDsQGl2Qsb6ROT8BvjRK8VRukzBlVvzyO9l6ebN1gsSI940UKeY3
         Jbwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787329935; x=1787934735; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uKrunJMg40NjeuxUGrFsyHBAkzDtHd4//4PJzcyrA7w=;
        b=A2unVZoMhR4ouYjV9Rolf+BdNU0YWx1OMVL3C40H1uSYizsM+ouC0mW9uAbZEHYc6d
         t/unKDVtYWuBhYrQanxeRzgpyHNkwkT0Xd1mqZwcjshC6BwU9wHon/gWvz6EzoktyuGm
         uDqspgrbWdbrk4x4XgX85Y7toj3M8fDK4yzqf2uS782arQOudL3ITlrCxTDwagmAjDBh
         JCdtXz18ZMxF4oz1EnytAHL8iNHdjSdfuezfRJ9l713UFt/fzpVpENRMIP4ghhhlo5wI
         YFZNoiijsTe0BbKYVjxkyw48JNJZ5wK9lrBMVI0t4N35ygtxkWOdKwbSNYHgJiW1IXRA
         Dz4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787329935; x=1787934735;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uKrunJMg40NjeuxUGrFsyHBAkzDtHd4//4PJzcyrA7w=;
        b=hd//X7XaOY3Qqog70G0iwGFI3q9tzva7lfLdkNQSsYFkLW7p62SN3JpVcV/BNiUqfK
         wo1S7w/kni06bcD1ApSy2YWT5yMNu75rF9CxfzAKz3xEWL4NmYgzhxRsNYwzqPMAQL3o
         zSEjo8ZyxE6LUtBTEnfyNGo5LgmgWTBjnjREf3JGazccBLUuOJ9XpPQmx/V5te43QIfM
         C8dXHiOyqq2HXarvncg0Gh5MTs5HJYLCX3IjzBR1coHbEgIcFVvs/DuvIEO0KWXNEefa
         Y72IAtN331vVnZPajhP6Lwvf6YjCNNA01G7K9JUfqVMA3jVMXSJPyKUx6KjVQ1mIMVBH
         w33g==
X-Forwarded-Encrypted: i=1; AHgh+RrQslY5/mo1nv84SZTZ6iup+JG0O/uDSPVMkHw2WQ/XVzQLXJZW5scynFZulmdecxj25sz+sBrHcTY=@vger.kernel.org
X-Gm-Message-State: AFuF++niENvaOHDaaV7gHFDetCm8m9LvMWqKVZFfbRRNFzSWI/cKzALO
	luol0rYlqCAbYzeUpFO8gomvlXhASYRDn58HE3QcKHFseX01CAHx564K8n95owogHqVijSrWl9i
	GJKW4OnsJlLbf0pMO5aCnYzqlK3q1Kg==
X-Gm-Gg: AR+sD10jJ+9cyQYYLPsmHmZmCI36qtFXvoDMlnE4wxKLxebzmQf0pUSAAXctu8hucBS
	rVsGLJx/TuBT9C+CnhAFBNfg1wJ7ov0rYbbPAOVHKs6TarMmT6MRSpJ4ll7zRiS41K+kCd6xKHg
	FkKxhR2rzF4GCXlLL7U7uXDoXTwgssEkHIY4M9aROh3IP8I+D09GXwdAFf2AxkX5AG2BbV1pziF
	eB124J5xtdtnQdodtoT2waqCzx3j6huSuPnrchZD85Qw8xyxqOSbwULDAR+eJ+2RGRIA6D0VuE1
	85DD1CogpYyphw4L9LqdotpBe1m5/yUlI8F9nyB/dXv2pVQgLKgrDACElk0=
X-Received: by 2002:a17:90b:55cd:b0:38e:97f0:aa4b with SMTP id
 98e67ed59e1d1-395c35f0a85mr14515030a91.13.1787329935050; Fri, 21 Aug 2026
 09:32:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529165640.820-1-ravis.opensrc@gmail.com> <20260818073546.832476-1-kunwu.chan@linux.dev>
 <CALa+Y16xODsaFZDfh7ZeP3gWbycK92gvP5N8_NFpOvW=R2BWbg@mail.gmail.com> <CAN_Opa_h2W1hRimy2YXPC4EgueCi2UNwnZ5gSYV=cr8M7yfCmA@mail.gmail.com>
In-Reply-To: <CAN_Opa_h2W1hRimy2YXPC4EgueCi2UNwnZ5gSYV=cr8M7yfCmA@mail.gmail.com>
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Date: Fri, 21 Aug 2026 09:32:02 -0700
X-Gm-Features: AcwNN1W_2JZ34i4ktwhmNpUgZM8oH3GEFi2Bi6orDDuwSTf-FJjTXej5NTLTNnE
Message-ID: <CALa+Y15zNhpubyH5GQgu_BHesrwRdH0B8k5cqT3o_U0h5A2e-w@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] mm/damon: hardware-sampled access reports
To: KunWu Chan <kunwu.chan@gmail.com>
Cc: Kunwu Chan <kunwu.chan@linux.dev>, sj@kernel.org, akinobu.mita@gmail.com, 
	damon@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, akpm@linux-foundation.org, corbet@lwn.net, 
	bijan311@gmail.com, ajayjoshi@micron.com, honggyu.kim@sk.com, 
	yunjeong.mun@sk.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 2:55=E2=80=AFAM KunWu Chan <kunwu.chan@gmail.com> w=
rote:
>
> Hi Ravi,
>
> Thanks for the detailed reply.  The fan-in diagnosis makes perfect sense.
>
> > Your series is based on the v1 substrate, and the way an event is
> > configured is the part that moves most.
> >
> > [...]
>
> Glad to hear v2 is on the way.  The probe-based model is actually
> something I encountered while building the AUX backend. When multiple
> sources can feed the same region (e.g. PTE scanning + SPE/IBS), the
> question of how to combine their reports becomes interesting.
>
> For example, CXL tiering may care about physical-address locality, while
> per-process monitoring may need virtual-address attribution.  How do you
> see probe weights being determined =E2=80=94 is that expected to be
> scenario-specific, or is there a more general principle behind the
> weighting?

Hello KunWu,

SJ can answer that authoritatively -- the probe and weight interface
is his. Here is my understanding which SJ can confirm later:

Weights are relative, and only among probes. A context can hold up to four;
each report carries its probe index and credits that probe's own hit count,
so two PMU-based probes in one context are scored in proportion to their
weights, and that is where a scenario-specific choice belongs.

What does not mix is a weighted probe with the other two sources. Any
nonzero weight switches the whole context to probe-weighted scoring, which
turns page-table access checking off -- so SPE cannot be blended with PTE
scanning, it replaces it. Page-fault reports carry no probe index; they
credit the region's access rate but have no hit count, so under weighted
scoring they are not part of the score either. Both coexist with a probe
only at weight zero, where everything feeds the same access rate and is
indistinguishable afterwards.

So for your case I would read it as: PA locality and VA attribution are
different targets and different address kinds, which points at separate
contexts rather than one context with tuned weights.

>
> > 2. The 67.9% drop rate is fan-in, not sizing
> >
> > ---
> >
> > [...]
>
> I completely missed this.  The observability framework showed the
> symptom (67.9% drop) but got the root cause wrong =E2=80=94 it's not a ri=
ng
> sizing issue, it's a fan-in problem.  With a single kdamond thread
> draining the per-CPU sources, the samples effectively get funneled
> into a single ring, which explains the numbers.
>
> The per-CPU drain approach using `system_percpu_wq` and `queue_work_on()`
> looks like the right fix.  Our AUX backend already carries a CPU argument
> through the ops, so adapting it should be straightforward.  I'll take a
> look at your v2 branch and re-test with the per-CPU drain.
>
> Two questions:
> 1. Is `damon/perf-rfc-v2-08-20-26` ready for me to rebase the
>    AUX backend and observability framework on top of it?  I'd like to
>    validate the per-CPU drain fix with real SPE hardware.
>

Yes:

  https://github.com/ravis-opensrc/linux.git
  branch damon/perf-rfc-v2-08-20-26, tip 9c0410564596

That is the branch I used to exercise the AUX path. It carries all five of
your AUX kernel-consumer API patches unmodified, and from the SPE series,
patch 1/4 plus the generic half of 2/4. 2/4's SPE backend and parser, and
3/4 and 4/4 which test them, are SPE-specific and I used an x86 box
with virtual PMU.

The branch is force-updated post fixing two trailers please re-fetch
if necessary.

None of it is meant for my v2 posting.
This branch is only the vehicle for testing the AUX report path.

The SHAs you will care about:

  808519650a7a  the per-CPU report side
  e3323a3bdc75  your AUX interface, ported to the probe model
  1c347519c626  parse each CPU's AUX buffer on that CPU
  9c0410564596  perf/core: balance the AUX buffer reference on kernel
                release

1c347519c626 drains with one work item per CPU in the event's cpumask, via
queue_work_on() on system_percpu_wq -- system_wq would not do, being
unbound it silently ignores the CPU targeting.

Two things came out of a quick test in a VM:

- spe_backend_init() calls perf_event_setup_aux(), but I could not find any
  path calling perf_event_release_aux() -- spe_backend_cleanup() frees only
  st->win, and your kerneldoc says the release must happen before
  perf_event_release_kernel(). Left alone on my branch.

- 9c0410564596: the explicit ring_buffer_put() in perf_event_release_aux()
  is one too many, since ring_buffer_attach(event, NULL) just above already
  drops the event's reference.

> 2. For the probe-based configuration, does the `prep_action =3D "perf_eve=
nt"`
>    model preserve the same event lifecycle?  Our AUX path needs to create
>    and bind the event during apply, keep it disabled initially, and enabl=
e
>    it when kdamond starts.
>

Yes -- created disabled during apply, bound, then enabled. Per CPU, on the
kdamond turn-on path:

  perf_event_create_kernel_counter()   attr has .pinned =3D 1, .disabled =
=3D 1,
                                       so the counter is installed but not
                                       yet schedulable
  ops->init(event, cpu, perf_event)    your backend attaches the AUX buffer
                                       here, via perf_event_setup_aux()
  perf_event_enable()                  only now can the PMU be scheduled in

So the buffer is always attached before the counter starts. If ops->init()
fails the counter is released without ever being enabled.
kernel/watchdog_perf.c uses the same pinned + disabled-then-enable pairing.

Sanity-tested both report paths in a VM.

Best Regards,
Ravi.

> Thanks,
> KunWu

Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB5935979
	for <linux-doc@vger.kernel.org>; Sat, 11 Apr 2026 12:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775909914; cv=pass; b=YppLQ4SpfSFAbmc/HJ2DmP5JvdZtVoGVaL1tJUNQdvQLhPwzD1eMgeIrG69DgIkn0CwUSwGgLfOJM/E/aJkjeT0pK+xSfEJVJzQ8BRboeUp4wgZb88wML0bjVQ0fd+xaEYZwGthjd+NYtBLP7yElW6Ms/vi/rEhWoGFNosBz5ig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775909914; c=relaxed/simple;
	bh=o9pvVML98Gqf2gFn5f/lNJOnbXinGwxFoyhcSkjB79w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ea9gw42eqxs2nQVKi4UlQq8apa2/cwyKoS/MZsuIac5mB0UM0BwqGtENy2AV3VWDU27ZkpN35C02+lXPRSV1pTDIklH87Sx4aiNqAcsctJfCx/gOUkSpFnWRFVSgPMu+uvYvpgWKOLgPLoV8VoO3kynzxl1I0aPSm8IHoAnxuzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B8MdyCu6; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=TzutB2ex; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B8MdyCu6";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="TzutB2ex"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775909911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5+xvUAJcV8ebKCCjTOIM7WjB6sjy3LokZRm3IrUu8sE=;
	b=B8MdyCu63548+0B8U0nZ6MCHIuvGwUGRDMAZWvFjFox2aXgH9t1LHOtzgbb/TZFtFkAkS0
	UQ9NMMGerIZU6uItNaJfJ0jbkoYdhEU6VLsm4PTfK5fbho1w0Hz4eF/1rgcezDuSjUbEXv
	PB5RDGsoIKMXD/vkeeUUpOm4X+ayAgE=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-aTlG4g_zPKOeYjaO0149Rg-1; Sat, 11 Apr 2026 08:18:30 -0400
X-MC-Unique: aTlG4g_zPKOeYjaO0149Rg-1
X-Mimecast-MFC-AGG-ID: aTlG4g_zPKOeYjaO0149Rg_1775909910
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-604eba0f2f8so1526138137.3
        for <linux-doc@vger.kernel.org>; Sat, 11 Apr 2026 05:18:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775909909; cv=none;
        d=google.com; s=arc-20240605;
        b=iEmFdMHx9DNPHiqgSnyjPoTiuwSYe4q1aw052q6Db3U9tBFeCgmieLhy03uPsjbB/L
         oxI4KmUYGk9SmNVxpl6IcNfmqTpGYgOCD0s7Gubig5RWpcPuXQIlUwpQwqf4OQkC7msa
         yDy4YPfcWP80U4qQpaMGGOpTWguDTUjtYGJGq3w4ygdLENCfpPs6xQ7+RqwNk83Z+WQA
         Y7/zPDyZBp8bK3BqrtiAM6h9f2bTlrvfv/IVf7h4luyqZKCzf/Un7VKCYx6FOqdHIpl5
         XzGI7OnWaxMW0a0hcJvBk0Ua6g9WH2rpnRBIG/ZmKR4KVE/gc2wzpoOu6mxCFeBlWF3D
         bLZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5+xvUAJcV8ebKCCjTOIM7WjB6sjy3LokZRm3IrUu8sE=;
        fh=78fND230eZu8HZXSRHXBF9MNRPycODTeyCW8QZg3Rqk=;
        b=bFn+JhFvVDouAzwxZnV0oN9MoExVQhbx7hS5AesVaBwVLyucWPgSRt/vUtG2q6iMxj
         TY8yDgciVRxnUoah0DeYyfQmp4wVuvBhla9Gf1FWEM+bLSSpfkEDFBVZtbQ2i/oykWec
         6bhrX0n9c1kxUh7YIZiO1JN0ww0NM5bnbd7qo6WyiC1D9bP8q9GibmHB/SUMJtsIifd/
         726K8KLxbe0P4GkPdQDGzMkwOuZy7d/Olb0Kq72YAgq7UF4a+pKVHHVnJUZZ//hK3mm4
         ZqanzAOcp3kD96B34YkwuZ4gsUBWf1taBeBYIdtYiUy5EmjBPljyLR7MhRnPsEvOtlv+
         VMyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775909909; x=1776514709; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+xvUAJcV8ebKCCjTOIM7WjB6sjy3LokZRm3IrUu8sE=;
        b=TzutB2exzZkBAGRmFU/wydgYYhCh5IC9PGCQqZeejDqFgkl+0T2CgtqHdhkIq1v86s
         r8xdEjbfyTgFwsds8cnXRmJf/eIuRwNETgttU48ajVjxWUvvEUg3aw8UrHfFXeT1G7ra
         VjILfrSIBX8McO3P+uWqRT1uuW0ksz3Sk10dPqnZ13L5flqBe0IR2Avb1lYAPLrP+5BJ
         wBR9OOPwoqBV55E7eYw74hd01FZJR0DHcBs/D4lop9CKGMpMILEYImvSQ2PyyzdhQ06L
         ZSjw+/kf0NQQdz1VFdqfIQ+IRekOPFCdpZB4SO/ABFgapdHnbF3weNOphi5OEqnpf1mC
         alNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775909909; x=1776514709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5+xvUAJcV8ebKCCjTOIM7WjB6sjy3LokZRm3IrUu8sE=;
        b=NOGxV5ryvGL3xjyhwprpqV9p3KiYPU8CRWGnbv/rYVtIjCxHo4+pd+qKc40wXEHJbb
         bz1ZbrxnFKXnWOP2f4PTq4ocnlxRt7p6UQjBvHwOvIBdA3g/1suAwHM1NY9hL2uhSjEC
         U4uEOwnu5qdi8Rg8T2f/v5rsHrszynqFbXuiLSsRVlRxXh4+pV0gWjMwDWegkNHS0Hdl
         C1Z6wEOtqnDuuQuWG3d8lkMI9ERLnF2SI3Y9zOzRjLOii5QsxnICcvqlJKlEmNE7OaOb
         P+MPv2Td28yYYZxw+2+teU26uZuT+PHnmFGEHNsXQ5kB8gCqZ7+tmS/hbFWLXJK1TzrP
         l0bA==
X-Gm-Message-State: AOJu0YyA+hmwpl5Hr2MwD9I5O0hYsC83pHAVw0p2a71kaGrwTBMabCo6
	w1ciznTope1zABv+vwlKtSARnZ0/mhXAdvMUcQGEG1UDAU/eiaY3dLfFeV3T/rf5F6dQzL3i92o
	H74ET+0VADGsACCsP5be1GHiXfO+DjcQBguLy7VBxY4FDjZEUv4auxBwbArPUSuSeI4nA6r5UWB
	S0N+H5ZeMyf+FKUKH3u5wwzon/5Vcy1nwXku9n
X-Gm-Gg: AeBDieuhXZPRoZZlXzl8fsfyfj8luNU6EJTYo/vOSTEo9LgHCkccIJ6pn9u6yqPdCml
	ywlTfZeGiY2gox92tMwsFdYF9gUwQBL6sFzTSrLVlK3TW+CFGlEGm4PXszP3Ox3P+hO6IIq3LyM
	YGJNZz8JSq8tygGp+ddwPmMfetqY9oQ2428JDJn0n9DjMuAGm0PALkBmo5iSfiVooY3h2zhBwqw
	sZ0pM0NICaiKN5twLov59Hp4kz1HpEtv3aNZA==
X-Received: by 2002:a05:6102:b15:b0:605:19ce:9cc7 with SMTP id ada2fe7eead31-60a0136cf09mr2604541137.28.1775909909527;
        Sat, 11 Apr 2026 05:18:29 -0700 (PDT)
X-Received: by 2002:a05:6102:b15:b0:605:19ce:9cc7 with SMTP id
 ada2fe7eead31-60a0136cf09mr2604531137.28.1775909908980; Sat, 11 Apr 2026
 05:18:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401110232.ET5RxZfl@linutronix.de>
In-Reply-To: <20260401110232.ET5RxZfl@linutronix.de>
From: Ming Lei <ming.lei@redhat.com>
Date: Sat, 11 Apr 2026 20:18:17 +0800
X-Gm-Features: AQROBzAZ7phOKQlxLO-_0wBpQIKa3nU5pHrtO4Q8AF-j45fWPsTRJPHDkE5Ar7c
Message-ID: <CAFj5m9La5S0B8o677FmHoXkD-N+kMVdJL7Gn1YG5noy_4Q_jxg@mail.gmail.com>
Subject: Re: [RFC PATCH] Documentation: Add managed interrupts
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Aaron Tomlin <atomlin@atomlin.com>, Christoph Hellwig <hch@lst.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Jens Axboe <axboe@fb.com>, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@kernel.org>, Valentin Schneider <vschneid@redhat.com>, Waiman Long <longman@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, John Ogness <john.ogness@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 7:02=E2=80=AFPM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> I stumbled upon "isolcpus=3Dmanaged_irq" which is the last piece which
> can only be handled by isolcpus=3D and has no runtime knob. I knew roughl=
y
> what managed interrupts should do but I lacked some details how it is
> used and what the managed_irq sub parameter means in practise.
>
> This documents what we have as of today and how it works. I added some
> examples how the parameter affects the configuration. Did I miss
> something?
>
> Given that the spreading as computed group_cpus_evenly() does not take
> the mask of isolated CPUs into account I'm not sure how relevant the
> managed_irq argument is. The virtio_scsi driver has no way to limit the
> interrupts and I don't see this for the nvme. Even if the number of
> queues can be reduced to two (as in the example) it is still spread
> evenly in the system instead and the isolated CPUs are not taken into
> account.
> To make this worse, you can even argue further whether or not the
> application on the isolated CPU wants to receive the interrupt directly
> or would prefer not to.
>
> Given all this, I am not sure if it makes sense to add 'io_queue' to the
> mix or if it could be incorporated into 'managed_irq'.
>
> One more point: Given that isolcpus=3D is marked deprecated as of commit
>    b0d40d2b22fe4 ("sched/isolation: Document isolcpus=3D boot parameter f=
lags, mark it deprecated")
>
> and the 'managed_irq' is evaluated at device's probe time it would
> require additional callbacks to re-evaluate the situation. Probably for
> 'io_queue', too. Does is make sense or should we simply drop the
> "deprecation" notice and allowing using it long term?
> Dynamic partitions work with cpusets, there this (managed_irq)
> limitation but is it really? And if static partition is the use case why
> bother.
>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  Documentation/core-api/irq/index.rst       |   1 +
>  Documentation/core-api/irq/managed_irq.rst | 116 +++++++++++++++++++++
>  2 files changed, 117 insertions(+)
>  create mode 100644 Documentation/core-api/irq/managed_irq.rst
>
> diff --git a/Documentation/core-api/irq/index.rst b/Documentation/core-ap=
i/irq/index.rst
> index 0d65d11e54200..13bd24dd2b1cc 100644
> --- a/Documentation/core-api/irq/index.rst
> +++ b/Documentation/core-api/irq/index.rst
> @@ -9,3 +9,4 @@ IRQs
>     irq-affinity
>     irq-domain
>     irqflags-tracing
> +   managed_irq
> diff --git a/Documentation/core-api/irq/managed_irq.rst b/Documentation/c=
ore-api/irq/managed_irq.rst
> new file mode 100644
> index 0000000000000..05e295f3c289d
> --- /dev/null
> +++ b/Documentation/core-api/irq/managed_irq.rst
> @@ -0,0 +1,116 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +Affinity managed interrupts
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +
> +The IRQ core provides support for managing interrupts according to a spe=
cified
> +CPU affinity. Under normal operation, an interrupt is associated with a
> +particular CPU. If that CPU is taken offline, the interrupt is migrated =
to
> +another online CPU.
> +
> +Devices with large numbers of interrupt vectors can stress the available=
 vector
> +space. For example, an NVMe device with 128 I/O queues typically request=
s one
> +interrupt per queue on systems with at least 128 CPUs. Two such devices
> +therefore request 256 interrupts. On x86, the interrupt vector space is
> +notoriously low, providing only 256 vectors per CPU, and the kernel rese=
rves a
> +subset of these, further reducing the number available for device interr=
upts.
> +In practice this is not an issue because the interrupts are distributed =
across
> +many CPUs, so each CPU only receives a small number of vectors.
> +
> +During system suspend, however, all secondary CPUs are taken offline and=
 all
> +interrupts are migrated to the single CPU that remains online. This can =
exhaust
> +the available interrupt vectors on that CPU and cause the suspend operat=
ion to
> +fail.
> +
> +Affinity=E2=80=91managed interrupts address this limitation. Each interr=
upt is assigned
> +a CPU affinity mask that specifies the set of CPUs on which the interrup=
t may
> +be targeted. When a CPU in the mask goes offline, the interrupt is moved=
 to the
> +next CPU in the mask. If the last CPU in the mask goes offline, the inte=
rrupt
> +is shut down. Drivers using affinity=E2=80=91managed interrupts must ens=
ure that the
> +associated queue is quiesced before the interrupt is disabled so that no
> +further interrupts are generated. When a CPU in the affinity mask comes =
back
> +online, the interrupt is re=E2=80=91enabled.
> +
> +Implementation
> +--------------
> +
> +Devices must provide per=E2=80=91instance interrupts, such as per=E2=80=
=91I/O=E2=80=91queue interrupts
> +for storage devices like NVMe. The driver allocates interrupt vectors wi=
th the
> +required affinity settings using struct irq_affinity. For MSI=E2=80=91X =
devices, this
> +is done via pci_alloc_irq_vectors_affinity() with the PCI_IRQ_AFFINITY f=
lag
> +set.
> +
> +Based on the provided affinity information, the IRQ core attempts to spr=
ead the
> +interrupts evenly across the system. The affinity masks are computed dur=
ing
> +this allocation step, but the final IRQ assignment is performed when
> +request_irq() is invoked.
> +
> +Isolated CPUs
> +-------------
> +
> +The affinity of managed interrupts is handled entirely in the kernel and=
 cannot
> +be modified from user space through the /proc interfaces. The managed_ir=
q
> +sub=E2=80=91parameter of the isolcpus boot option specifies a CPU mask t=
hat managed
> +interrupts should attempt to avoid. This isolation is best=E2=80=91effor=
t and only
> +applies if the automatically assigned interrupt mask also contains onlin=
e CPUs
> +outside the avoided mask. If the requested mask contains only isolated C=
PUs,
> +the setting has no effect.
> +
> +CPUs listed in the avoided mask remain part of the interrupt=E2=80=99s a=
ffinity mask.
> +This means that if all non=E2=80=91isolated CPUs go offline while isolat=
ed CPUs remain
> +online, the interrupt will be assigned to one of the isolated CPUs.

Maybe you can add:

In reality it is fine because IO isn't supposed to submit from isolated CPU=
s.

> +
> +The following examples assume a system with 8 CPUs.
> +
> +- A QEMU instance is booted with "-device virtio-scsi-pci".
> +  The MSI=E2=80=91X device exposes 11 interrupts: 3 "management" interru=
pts and 8
> +  "queue" interrupts. The driver requests the 8 queue interrupts, each o=
f which
> +  is affine to exactly one CPU. If that CPU goes offline, the interrupt =
is shut
> +  down.
> +
> +  Assuming interrupt 48 is one of the queue interrupts, the following ap=
pears::
> +
> +    /proc/irq/48/effective_affinity_list:7
> +    /proc/irq/48/smp_affinity_list:7
> +
> +  This indicates that the interrupt is served only by CPU7. Shutting dow=
n CPU7
> +  does not migrate the interrupt to another CPU::
> +
> +    /proc/irq/48/effective_affinity_list:0
> +    /proc/irq/48/smp_affinity_list:7
> +
> +  This can be verified via the debugfs interface
> +  (/sys/kernel/debug/irq/irqs/48). The dstate field will include
> +  IRQD_IRQ_DISABLED, IRQD_IRQ_MASKED and IRQD_MANAGED_SHUTDOWN.
> +
> +- A QEMU instance is booted with "-device virtio-scsi-pci,num_queues=3D2=
"
> +  and the kernel command line includes:
> +  "irqaffinity=3D0,1 isolcpus=3Ddomain,2-7 isolcpus=3Dmanaged_irq,1-3,5-=
7".
> +  The MSI=E2=80=91X device exposes 5 interrupts: 3 management interrupts=
 and 2 queue
> +  interrupts. The management interrupts follow the irqaffinity=3D settin=
g. The
> +  queue interrupts are spread across available CPUs::
> +
> +    /proc/irq/47/effective_affinity_list:0
> +    /proc/irq/47/smp_affinity_list:0-3
> +    /proc/irq/48/effective_affinity_list:4
> +    /proc/irq/48/smp_affinity_list:4-7
> +
> +  The two queue interrupts are evenly distributed. Interrupt 48 is place=
d on CPU4
> +  because the managed_irq mask avoids CPUs 5=E2=80=937 when possible.
> +
> +  Replacing the managed_irq argument with "isolcpus=3Dmanaged_irq,1-3,4-=
5,7"
> +  results in::
> +
> +    /proc/irq/48/effective_affinity_list:6
> +    /proc/irq/48/smp_affinity_list:4-7
> +
> +  Interrupt 48 is now served on CPU6 because the system avoids CPUs 4, 5=
 and
> +  7. If CPU6 is taken offline, the interrupt migrates to one of the "iso=
lated"
> +  CPUs::
> +
> +    /proc/irq/48/effective_affinity_list:7
> +    /proc/irq/48/smp_affinity_list:4-7
> +
> +  The interrupt is shut down once all CPUs listed in its smp_affinity ma=
sk are
> +  offline.

Nice document, with or without the above change:

Reviewed-by: Ming Lei <tom.leiming@gmail.com>

Thanks,


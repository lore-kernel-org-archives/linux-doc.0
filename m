Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795460872;
	b=RNQKmtZfhX9pPxMHy79Lanqj/VqcBJjBdqVdZTPgZOpHp4O9r7TxmG+WSMqpfU5czoXm
	 LjpGGlB/GFVmqLcnMW7lGcBES97qHg6eJb1sBD5bjx0Z5N3NuKN3uedx+83vqG+6cP0Y6
	 fF4EINpKDI33KBHWzxYNfnZdPidv/pksX84BgCcoGOy8QvvInp0X/f0u+y6a2FpAxC3iO
	 /wsd3xSJsKVHlUC0JTZUZPbExrAr5HeIudT5SEa+Xk3epCpekKpKlf9WGrOMwpXMWnXqo
	 zeiM4H6NsfxSxpe2sIxx3m2+mEiwkxfBw+VOsY4VAPP5usMou/93bHB/aMaR4vHHPtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795460872;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kWqmv7rZviZxwAV6IYLCoh/nbwvKUfSnhaqZW8v00kc=;
	b=ORC/S9/Fr4Zuq3wXfbF+it5edzpRaP6d2ufSvczN49WWfDt6EjQ6fHf59uVSb3yPvW10
	 DcS0uYRMngKXjfOOBtPb7ENpRZ67CcPpjy4kHgRkgBvsRyu2cA6r95gJb8C3L5Ei6vB6U
	 ZJdWTyNE7SgotppdP+AXxk+hbe2MZvN2Vvi5c2dA9k+onIWlN6xHbyxZ4Wzgcs4aXiA+A
	 26mIjr1Wnvcj1hJO+lDikBRcit97AnJp3Ri/WL1OKywYuwzPuZ3LGFKYLQJnHVhg7eP8A
	 RQN7PaM6lB9J03iR+zuQvD/eCN5N1acSodBkY4gN8vdmbBzjMseXC45fpVA9WMJQ2TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q4lJ8uFI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBB6606A31F
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 19:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q4lJ8uFI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 798031F000D4
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 19:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795460871;
	bh=kWqmv7rZviZxwAV6IYLCoh/nbwvKUfSnhaqZW8v00kc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Q4lJ8uFIEp4P2HJ2+afuQ5DiJaBD1FdtMzcpNyEUWZXcfsZSKgBCy4IXSqzzU5Krr
	 KbB+jo9dAFyAV+bMkFQ3sbMyWAfZZPfBSPUvpbToFUWl5kZhrptIR7JhuZKXWlclH4
	 KN7Yd9e7HyRYGVYEYm8FH4WtgE9bXw1QC1XUL26ByCwkGIe8sIB0TcHCtgLJzjyFgt
	 0bqRhp9oUOmeyzNi2I7Xq942ciiLwt8UkD/zymlCCXaTNVINr7Vxjk/QCa1emRurIv
	 eq+ugiCgE1yqxvg1gpXCJZjIoyTDpLLXYLJVX2z19vb/amVwg1jYz5m/wjajVCDIzn
	 AE8sUt7inO2xQ==
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-55d2f5f1e26so42251721cf.3
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 11:07:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEwccjby8Er2igCBcnN+AGZ8qMeK8cNSa81vK++UiCjB9Q6qR1ryMCP5NVOMqHsRIFCAR4Y6U451qQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tfAMwDOEVcVofY+ob0W+yguaMD239+pBieRsbPzQwwX/IuFoY
	dfCgqtnIXnKQvBHgJm9kYYDX5olbGNny+5Mz9vT2DVaw1zapPpEIzPony9H1Jx1yaFWiGY4sWA8
	NWBl+tGW6gHElAdCZnOcdmaqK2qcTqHA=
X-Received: by 2002:a05:622b:cc:20b0:55d:8486:8fba with SMTP id
 d75a77b69052e-55d8486a033mr125240201cf.21.1795460870678; Mon, 23 Nov 2026
 11:07:50 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com> <20260915-arm_cs_support_aux_sample-v1-4-35cf6f297d20@arm.com>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-4-35cf6f297d20@arm.com>
From: Song Liu <song@kernel.org>
Date: Mon, 23 Nov 2026 11:07:37 -0800
X-Gmail-Original-Message-ID: <CAPhsuW665wcpXxE8pfzRMfdxZwh9ogGsvd1aEBFREq61cz4Y5w@mail.gmail.com>
X-Gm-Features: Aa3M54oRjUHwS-SqxP1Lf23z7Eqetpo8inZD1IWbmdRW8zklQQV2JTemygu-EbM
Message-ID: <CAPhsuW665wcpXxE8pfzRMfdxZwh9ogGsvd1aEBFREq61cz4Y5w@mail.gmail.com>
Subject: Re: [PATCH 04/25] coresight: perf: End AUX output when an event is throttled
To: Leo Yan <leo.yan@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	Jonathan Corbet <corbet@lwn.net>, Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>, 
	Ingo Molnar <mingo@kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Leo,

On Tue, Sep 15, 2026 at 8:49=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Since commit 9734e25fbf5a ("perf: Fix the throttle logic for a
> group"), the perf core stops every event in a throttled group by calling
> the PMU stop callback with flags set to zero:
>
>   perf_event_throttle()
>     `> event->pmu->stop(event, 0)
>
> The ETM perf stop callback only ends the AUX output handle when
> PERF_EF_UPDATE was set. For throttling with mode is zero, it skips to
> end the AUX handle. When the event is later unthrottled and ETM tracing
> is started again, perf_aux_output_begin() sees the perf handle is nest
> enabled and triggers a warning:

While testing this patch, we found a crash:

[20122.800818] Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000038
[20122.800836] Mem abort info:
[20122.800839]   ESR =3D 0x0000000096000007
[20122.800842]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
[20122.800845]   SET =3D 0, FnV =3D 0
[20122.800847]   EA =3D 0, S1PTW =3D 0
[20122.800849]   FSC =3D 0x07: level 3 translation fault
[20122.800852] Data abort info:
[20122.800854]   ISV =3D 0, ISS =3D 0x00000007, ISS2 =3D 0x00000000
[20122.800857]   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
[20122.800860]   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
[20122.800862] user pgtable: 64k pages, 48-bit VAs, pgdp=3D00000001683e1800
[...]
[20123.261147] pstate: 034010c9 (nzcv daIF +PAN -UAO +TCO +DIT +SSBS BTYPE=
=3D--)
[20123.275144] pc : arm_trbe_irq_handler+0x58/0x4d8 [coresight_trbe]
[20123.287396] lr : arm_trbe_irq_handler+0x28/0x4d8 [coresight_trbe]
[20123.299645] sp : ffff800083ccff40
[20123.306298] x29: ffff800083ccff40 x28: ffff0000b1bbdb80 x27: 00000000000=
00000
[20123.320645] x26: 0000000000000000 x25: 0000000000000000 x24: 00000000000=
00000
[20123.334992] x23: 0000000000000028 x22: ffff800083095f98 x21: ffff0000e83=
80280
[20123.349338] x20: 0000000000520001 x19: ffff003fe685c8e0 x18: 00000000000=
00000
[20123.363686] x17: ffff803f64150000 x16: ffff800083cc0000 x15: 00000000000=
00000
[20123.378033] x14: 0000000000000000 x13: 000000000000000c x12: 00000000002=
00000
[20123.392380] x11: ffff0000c00010d0 x10: ffff803f64150000 x9 : 00000000000=
00028
[20123.406725] x8 : 0000000000000000 x7 : 0000000000000000 x6 : 00000000000=
00000
[20123.421072] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 00000000000=
00000
[20123.435420] x2 : 0000000000000000 x1 : ffffffdfbf459f58 x0 : 00000000000=
00000
[20123.449766] Call trace:
[20123.454671]  arm_trbe_irq_handler+0x58/0x4d8 [coresight_trbe] (P)
[20123.466920]  handle_percpu_devid_irq+0x80/0x1b0
[20123.476029]  generic_handle_domain_irq+0x3c/0x80
[20123.485308]  gic_handle_irq+0x174/0x328
[20123.493014]  call_on_irq_stack+0x30/0x48
[20123.500894]  do_interrupt_handler+0x50/0x78
[20123.509299]  el0_interrupt+0x48/0x2c8
[20123.516654]  __el0_irq_handler_common+0x14/0x20
[20123.525755]  el0t_64_irq_handler+0xc/0x18
[20123.533807]  el0t_64_irq+0x17c/0x180
[20123.540987] Code: d5381237 927ef6e9 d5181229 d5033fdf (f9401d15)
[20123.553236] SMP: stopping secondary CPUs
[20124.617250] SMP: failed to stop secondary CPUs 60

LLM suggests the following change should fix it. Does this make
sense to you?

Thanks,
Song

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c
b/drivers/hwtracing/coresight/coresight-trbe.c
index 3fa663c7f026..a11381675ef7 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -1060,6 +1060,16 @@ static int arm_trbe_disable(struct
coresight_device *csdev)
  return -EINVAL;

  trbe_drain_and_disable_local(cpudata);
+ /*
+ * The TRBE may have raised an IRQ (e.g. on reaching the limit) that
+ * has not been taken yet, as our caller runs with IRQs disabled. When
+ * the event is stopped without PERF_EF_UPDATE (e.g. on throttling),
+ * update_buffer() did not run to consume it, and the AUX handle and
+ * this buffer may be gone by the time the IRQ is taken. The session
+ * on this CPU is over, so there is nothing left to handle: drop it.
+ */
+ clr_trbe_irq();
+ isb();
  buf->cpudata =3D NULL;
  cpudata->buf =3D NULL;
  cpudata->mode =3D CS_MODE_DISABLED;
@@ -1144,7 +1154,7 @@ static irqreturn_t arm_trbe_irq_handler(int irq,
void *dev)
 {
  struct perf_output_handle **handle_ptr =3D dev;
  struct perf_output_handle *handle =3D *handle_ptr;
- struct trbe_buf *buf =3D etm_perf_sink_config(handle);
+ struct trbe_buf *buf;
  enum trbe_fault_action act;
  u64 status;
  bool truncated =3D false;
@@ -1161,6 +1171,22 @@ static irqreturn_t arm_trbe_irq_handler(int
irq, void *dev)

  /* Prohibit the CPU from tracing before we disable the TRBE */
  trfcr =3D cpu_prohibit_trace();
+
+ /*
+ * The event may have been stopped, and the AUX handle closed or the
+ * sink disabled, after the IRQ was raised but before it was taken.
+ * The TRBE was disabled then and there is nothing to collect, so just
+ * acknowledge the IRQ. Don't touch buf->cpudata, it may be NULL.
+ */
+ buf =3D handle ? etm_perf_sink_config(handle) : NULL;
+ if (!buf || !buf->cpudata) {
+ WARN_ON_ONCE(is_trbe_enabled());
+ clr_trbe_irq();
+ isb();
+ write_trfcr(trfcr);
+ return IRQ_HANDLED;
+ }
+
  /*
  * Ensure the trace is visible to the CPUs and
  * any external aborts have been resolved.
@@ -1169,9 +1195,6 @@ static irqreturn_t arm_trbe_irq_handler(int irq,
void *dev)
  clr_trbe_irq();
  isb();

- if (WARN_ON_ONCE(!handle) || !perf_get_aux(handle))
- return IRQ_NONE;
-
  if (!is_perf_trbe(handle))
  return IRQ_NONE;

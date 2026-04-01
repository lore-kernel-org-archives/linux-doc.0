Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07B73F7864;
	Wed,  1 Apr 2026 11:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775041364; cv=none; b=dY2sXMWBcB4yAiXHuFtM9EzXllnjYiAhL4wNFtJrpVLMMkfDDluzECm88cswLnnuvlWWiFg1cqcCRKDWE83GVegfJnDdmlwkTkhYm1sFlXZqNQnKc9hZ0Soz8eGgNcYLooKqfLKSdj8irRIf3Qqg0HJQ34gHj3C2bbGPPU4uXWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775041364; c=relaxed/simple;
	bh=6Vbx5YhXghc47B9kWe5QcqU40Q4RLkEoJG88iEI+Uco=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uIGXd8NbBs0slRTKlZfSQMeP2ptnudAn2xIJZS2+IusHzm4qgZss38CerqehT6bRNJ8X2wzRjd300sBolryxitnDPUcGwM3xhOVPhTeGwV1lpCtMNDkwuiv58WESze9Ez6qqGgdpGeKEmlf2jirTxIgNOgqY9cM15eu36OTb0Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=g0h/x2XJ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FJg3rgVi; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="g0h/x2XJ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FJg3rgVi"
Date: Wed, 1 Apr 2026 13:02:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1775041354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/FWmH6qJfBlceGCsV5J+GeeiPdPLANO2wxmf5dnKQTc=;
	b=g0h/x2XJrgcv68n5y8Y1JSkV9hPOzf79Mx8gy4oDoG/kVCC3ltrEB/hwl+oawWFrxKruKq
	9iUgR8AqyIdZjX3kvL3If+WExna3D0cjghw3VtXt/eDHYTcjEKsTVLDbNSjCwLOhz5rNXn
	g4PKszaeHX9kjTwHVJ62hNJKMvoZeJ0sppUqpV4Gw1XrvW2HH8s13sxvW47NohGdQPJqlN
	didzdF6WF7GfQ4c3isQkSnrLvuCVSh5WKk9jDQQCmG/+KkiQ8ui0DkaCX8BMmJcW3ciNdW
	1BEzsa0apMjOCZ/KqQNJOmIR4BoeFxIIwr9B/lz73eBemAHm/czfQBMr7aP/AA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1775041354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/FWmH6qJfBlceGCsV5J+GeeiPdPLANO2wxmf5dnKQTc=;
	b=FJg3rgVi5JWHUiLKbqUKC0hNYbagVN0FHa0vJwmwCZtAeu9XP8RUU0bxH1ME16YG4ZM5Fs
	AKLOeYblutMXVRCQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Aaron Tomlin <atomlin@atomlin.com>, Christoph Hellwig <hch@lst.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Jens Axboe <axboe@fb.com>, Jonathan Corbet <corbet@lwn.net>,
	Ming Lei <ming.lei@redhat.com>, Thomas Gleixner <tglx@kernel.org>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	John Ogness <john.ogness@linutronix.de>
Subject: [RFC PATCH] Documentation: Add managed interrupts
Message-ID: <20260401110232.ET5RxZfl@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I stumbled upon "isolcpus=3Dmanaged_irq" which is the last piece which
can only be handled by isolcpus=3D and has no runtime knob. I knew roughly
what managed interrupts should do but I lacked some details how it is
used and what the managed_irq sub parameter means in practise.

This documents what we have as of today and how it works. I added some
examples how the parameter affects the configuration. Did I miss
something?

Given that the spreading as computed group_cpus_evenly() does not take
the mask of isolated CPUs into account I'm not sure how relevant the
managed_irq argument is. The virtio_scsi driver has no way to limit the
interrupts and I don't see this for the nvme. Even if the number of
queues can be reduced to two (as in the example) it is still spread
evenly in the system instead and the isolated CPUs are not taken into
account.
To make this worse, you can even argue further whether or not the
application on the isolated CPU wants to receive the interrupt directly
or would prefer not to.

Given all this, I am not sure if it makes sense to add 'io_queue' to the
mix or if it could be incorporated into 'managed_irq'.

One more point: Given that isolcpus=3D is marked deprecated as of commit
   b0d40d2b22fe4 ("sched/isolation: Document isolcpus=3D boot parameter fla=
gs, mark it deprecated")

and the 'managed_irq' is evaluated at device's probe time it would
require additional callbacks to re-evaluate the situation. Probably for
'io_queue', too. Does is make sense or should we simply drop the
"deprecation" notice and allowing using it long term?
Dynamic partitions work with cpusets, there this (managed_irq)
limitation but is it really? And if static partition is the use case why
bother.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 Documentation/core-api/irq/index.rst       |   1 +
 Documentation/core-api/irq/managed_irq.rst | 116 +++++++++++++++++++++
 2 files changed, 117 insertions(+)
 create mode 100644 Documentation/core-api/irq/managed_irq.rst

diff --git a/Documentation/core-api/irq/index.rst b/Documentation/core-api/=
irq/index.rst
index 0d65d11e54200..13bd24dd2b1cc 100644
--- a/Documentation/core-api/irq/index.rst
+++ b/Documentation/core-api/irq/index.rst
@@ -9,3 +9,4 @@ IRQs
    irq-affinity
    irq-domain
    irqflags-tracing
+   managed_irq
diff --git a/Documentation/core-api/irq/managed_irq.rst b/Documentation/cor=
e-api/irq/managed_irq.rst
new file mode 100644
index 0000000000000..05e295f3c289d
--- /dev/null
+++ b/Documentation/core-api/irq/managed_irq.rst
@@ -0,0 +1,116 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
+Affinity managed interrupts
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
+
+The IRQ core provides support for managing interrupts according to a speci=
fied
+CPU affinity. Under normal operation, an interrupt is associated with a
+particular CPU. If that CPU is taken offline, the interrupt is migrated to
+another online CPU.
+
+Devices with large numbers of interrupt vectors can stress the available v=
ector
+space. For example, an NVMe device with 128 I/O queues typically requests =
one
+interrupt per queue on systems with at least 128 CPUs. Two such devices
+therefore request 256 interrupts. On x86, the interrupt vector space is
+notoriously low, providing only 256 vectors per CPU, and the kernel reserv=
es a
+subset of these, further reducing the number available for device interrup=
ts.
+In practice this is not an issue because the interrupts are distributed ac=
ross
+many CPUs, so each CPU only receives a small number of vectors.
+
+During system suspend, however, all secondary CPUs are taken offline and a=
ll
+interrupts are migrated to the single CPU that remains online. This can ex=
haust
+the available interrupt vectors on that CPU and cause the suspend operatio=
n to
+fail.
+
+Affinity=E2=80=91managed interrupts address this limitation. Each interrup=
t is assigned
+a CPU affinity mask that specifies the set of CPUs on which the interrupt =
may
+be targeted. When a CPU in the mask goes offline, the interrupt is moved t=
o the
+next CPU in the mask. If the last CPU in the mask goes offline, the interr=
upt
+is shut down. Drivers using affinity=E2=80=91managed interrupts must ensur=
e that the
+associated queue is quiesced before the interrupt is disabled so that no
+further interrupts are generated. When a CPU in the affinity mask comes ba=
ck
+online, the interrupt is re=E2=80=91enabled.
+
+Implementation
+--------------
+
+Devices must provide per=E2=80=91instance interrupts, such as per=E2=80=91=
I/O=E2=80=91queue interrupts
+for storage devices like NVMe. The driver allocates interrupt vectors with=
 the
+required affinity settings using struct irq_affinity. For MSI=E2=80=91X de=
vices, this
+is done via pci_alloc_irq_vectors_affinity() with the PCI_IRQ_AFFINITY flag
+set.
+
+Based on the provided affinity information, the IRQ core attempts to sprea=
d the
+interrupts evenly across the system. The affinity masks are computed during
+this allocation step, but the final IRQ assignment is performed when
+request_irq() is invoked.
+
+Isolated CPUs
+-------------
+
+The affinity of managed interrupts is handled entirely in the kernel and c=
annot
+be modified from user space through the /proc interfaces. The managed_irq
+sub=E2=80=91parameter of the isolcpus boot option specifies a CPU mask tha=
t managed
+interrupts should attempt to avoid. This isolation is best=E2=80=91effort =
and only
+applies if the automatically assigned interrupt mask also contains online =
CPUs
+outside the avoided mask. If the requested mask contains only isolated CPU=
s,
+the setting has no effect.
+
+CPUs listed in the avoided mask remain part of the interrupt=E2=80=99s aff=
inity mask.
+This means that if all non=E2=80=91isolated CPUs go offline while isolated=
 CPUs remain
+online, the interrupt will be assigned to one of the isolated CPUs.
+
+The following examples assume a system with 8 CPUs.
+
+- A QEMU instance is booted with "-device virtio-scsi-pci".
+  The MSI=E2=80=91X device exposes 11 interrupts: 3 "management" interrupt=
s and 8
+  "queue" interrupts. The driver requests the 8 queue interrupts, each of =
which
+  is affine to exactly one CPU. If that CPU goes offline, the interrupt is=
 shut
+  down.
+
+  Assuming interrupt 48 is one of the queue interrupts, the following appe=
ars::
+
+    /proc/irq/48/effective_affinity_list:7
+    /proc/irq/48/smp_affinity_list:7
+
+  This indicates that the interrupt is served only by CPU7. Shutting down =
CPU7
+  does not migrate the interrupt to another CPU::
+
+    /proc/irq/48/effective_affinity_list:0
+    /proc/irq/48/smp_affinity_list:7
+
+  This can be verified via the debugfs interface
+  (/sys/kernel/debug/irq/irqs/48). The dstate field will include
+  IRQD_IRQ_DISABLED, IRQD_IRQ_MASKED and IRQD_MANAGED_SHUTDOWN.
+
+- A QEMU instance is booted with "-device virtio-scsi-pci,num_queues=3D2"
+  and the kernel command line includes:
+  "irqaffinity=3D0,1 isolcpus=3Ddomain,2-7 isolcpus=3Dmanaged_irq,1-3,5-7".
+  The MSI=E2=80=91X device exposes 5 interrupts: 3 management interrupts a=
nd 2 queue
+  interrupts. The management interrupts follow the irqaffinity=3D setting.=
 The
+  queue interrupts are spread across available CPUs::
+
+    /proc/irq/47/effective_affinity_list:0
+    /proc/irq/47/smp_affinity_list:0-3
+    /proc/irq/48/effective_affinity_list:4
+    /proc/irq/48/smp_affinity_list:4-7
+
+  The two queue interrupts are evenly distributed. Interrupt 48 is placed =
on CPU4
+  because the managed_irq mask avoids CPUs 5=E2=80=937 when possible.
+
+  Replacing the managed_irq argument with "isolcpus=3Dmanaged_irq,1-3,4-5,=
7"
+  results in::
+
+    /proc/irq/48/effective_affinity_list:6
+    /proc/irq/48/smp_affinity_list:4-7
+
+  Interrupt 48 is now served on CPU6 because the system avoids CPUs 4, 5 a=
nd
+  7. If CPU6 is taken offline, the interrupt migrates to one of the "isola=
ted"
+  CPUs::
+
+    /proc/irq/48/effective_affinity_list:7
+    /proc/irq/48/smp_affinity_list:4-7
+
+  The interrupt is shut down once all CPUs listed in its smp_affinity mask=
 are
+  offline.
--=20
2.53.0


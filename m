Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795761537;
	b=SGcZX2ZkOEAamRHEQJDJ0uygRqA3th4wMu1Ngw97Icodr6/m6MzWOy5I6zZwpR66khBY
	 /BIOsYJzqipcV3KkOLghpT46xmb0I3qaQsM3AoYVsdJBWW1NetmWfTMSGX1HxtgXSXeo6
	 E1dATKEoOV3u+H2tFHM62C6xEevwVwiKJqzseCjj6sqmcul+7NYsI+wSiFDNo4HaNrjXR
	 wO0e/ORic3afKBtkrI4NPCr3YgiAKmrD9p5hHIQDjY7l1TGxuQWcARB0C1PIZdOvw2sRa
	 8mRsPEl/eg2DwM9OK9ipKrTITomHQJRU4nwpN8E6oOpKCu4DOdVciiP8DVvgsSuH2ug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795761537;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=j5Q7pZrmvQvhbdlWYv2qPVTDpmlK2KTDYjZu0DFq3pI=;
	b=VH+B6Z/J3n0rDCiLCf6Cje0qoa4PeotXjhSNZ/3kBRc6w+66q4zJVy7R3gYgwrtKsZ7r
	 MvvUxkx7D0jcrDKxd5Lz13KEEzNjA1V4TALn7mqNJXUkfolSN36EEQMTycLsI4r+va2E8
	 lKksQmC4kHM99uNQN0idhFnDsZGIcV15xVzg9Bgy/r0tzwRK1CFk+bX932o+A/ghFCW/G
	 4gGBF9ijzjmdv6qzZ7bdpxJONJx1DZYtIsqWwphFMKxaxGZkfSUzhaKiqnEld0jncvKde
	 zvt4tABDZj+2AdbJI2a8CkH70AOgq589d6gJpWHshmuMx06tnuhQ86eBoS18mcJjo4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nYFaOBTM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F819606A32F;
	Fri, 27 Nov 2026 06:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nYFaOBTM
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795761537;
	b=ng8pQ8lenOe1xkI8WPp9jzgIoY6cX4TZRKUt2eaDgScSgZ44yrZqRKEz+2SQxyy+3BiX
	 DRpsAw0w7jokgzfQNj1pAXaPbT0sFBUZfdyrzmgI8losNpDFq4Uj+XwaS+DbFsklYlkSS
	 QMCB2GbSXUEDcwlpf1NZy76vgymf/aULflQRq/SNYd1PbJKCGX4NLVjQP0QH/SPUaoUsf
	 3AaDwen5nwaVmcc1H2xkjyR/9QqctU8h0QyK99fiYFnEMvguXuDOAYgvntAlIG0vp3ygq
	 kcf5HHhuyLUCGvtRr1hT0OOo7kQbbGVPr6dTcCZRCQWOVO8SBuml/GNNjkKHLpkXAqg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795761537;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=j5Q7pZrmvQvhbdlWYv2qPVTDpmlK2KTDYjZu0DFq3pI=;
	b=mzRpG8i3XEtHKQfQ6lbKq0StCHetuTIp4H+zBTMmrrDj7xigefH7/PjdhhGhyjyJUBCl
	 /BdxFSHRmMakUpVKXbOqp8mzBYhgsZSaQE1foNzcHAafjjOXjinrxfPVY2qplxFZcXIfg
	 Zt9uuXq/Zb1NqRyDZ4+jclak3rLE4p4XqpZ+63UwWZA8Gu+jXKzAhpOC+xS1to3uOYk7e
	 6mgPOYEPX0Z5Nc+fIfPtoJ3xdYIoTVDdy8dLEQWWNvvaA/yI5Sl59YkMu1UP85T3JDGvq
	 V5bZQnqenTdPaF/6emUuol7Kuyr8U14xn4MXH9P26ifUvu+6TdOsb3bkSVExMs6PMTA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4746D1F00893;
	Fri, 27 Nov 2026 06:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795761537;
	bh=j5Q7pZrmvQvhbdlWYv2qPVTDpmlK2KTDYjZu0DFq3pI=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=nYFaOBTMCzkYhuyJ0fr18FjWmLEiEJcdpl/no7X8Hq5m8Gj49OCkQtVllmFA+6vLo
	 AAbGvbiIoCpTodz+kmoF3rybWntJ09aLvNoMCHtpGXbOyQvo8Xor6fPqm6dW49CyxV
	 jXHrnLRytViXcHGkAyAhAnMwUgj98jC1+4yGtB2+hJSwzIoJjlHw8LLOqPNGoYK/2C
	 yZ1IZrUCUsn1mOTtHXudZ3RFG2MtgW16BrWftxm0Uh/59saciDOIv04fgmRBNHdvXZ
	 GHeB7zbWQA5Y5VAXTC/qt5w5FTGkY79/+wgg/9tBncyyR7+4oKkSKGGftQUC3h7zbw
	 3KrBIVm8Obupg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CCA374B5BC;
	Fri, 27 Nov 2026 06:38:45 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Subject: [PATCH RFC 00/10] coresight: cpu-debug: Sample CPUs that ignore a
 backtrace request
Date: Fri, 27 Nov 2026 08:38:37 +0200
Message-Id: <20261127-b4-coresight-cpu-debug-lockup-v1-0-69d3ad1e0fc8@iav.lv>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG0lCWsC/x3MSwqDMBAA0KvIrDtghvqh20IP4La40HEShxYTk
 qYI4t0bunybd0CSqJLgVh0Q5atJ/VZgLhXwOm1OUJdioJpaY6jD+YrsoyR16wc5ZFxkzg7fnl8
 5oAix7S031NZQjhDF6v7/nzA87jCe5w8AweO2dAAAAA==
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Leo Yan <leo.yan@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Douglas Anderson <dianders@chromium.org>, Petr Mladek <pmladek@suse.com>, 
 Feng Tang <feng.tang@linux.alibaba.com>, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3489; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=gXgmcxVrhW5A349eiU5DHHZZZboqxKqUTaFzFTfYD+g=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDNmcqvmvhBccvul/xsgszyM0T225kmO4EZeQvVHkWgWGs
 DMtb451lLIwiHExyIopskw4pHErY8nVv/4e5g9g5rAygQxh4OIUgIl88mH473hLprH6aOZV43tP
 nhhIZVtUCko9Vpz1ZULV7gv5L6wmujMyHH/QPiN2oX1D9dblcoqy2l8Y3kWceqpX0L5HsqaZXdO
 HEwA=
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv

A CPU locked up with interrupts masked does not answer a backtrace IPI
unless the IPI is an NMI. This series samples its PC through the
external debug interface where nmi_trigger_cpumask_backtrace() gives up
on it, as discussed with Leo [1], and removes the panic notifier: a
panic alone no longer prints the dump, panic_sys_info=all_bt gives it
for the CPUs that do not respond.

Patches 1-4 fix the driver as it is: the documentation, two runtime PM
issues, and an unbounded loop hit at panic today and on a running
system after patch 8. They do not depend on the rest and can go
separately with Fixes: tags. Patch 5 adds the EDPRSR.R check that 8
relies on, 6 prepares 8, 7 adds the notification to lib/nmi_backtrace.c,
8 adds the hook, 9 removes the panic notifier, 10 lowers the log level.

lib/nmi_backtrace.c has no maintainer entry. I would expect the series
to go through the coresight tree with an ack for patch 7, or patch 7
through mm-nonmm first, whichever you prefer.

Tested on RK3399 (helios64), the series applied on 7.4-rc4, buddy hard
lockup detector, no pseudo-NMI: LKDTM HARDLOCKUP on an A53 and on an A72
gives "EDPCSR: lkdtm_HARDLOCKUP+0x14/0x38". SysRq-l with a CPU spinning
in an IPI handler dumps that CPU and the system keeps running; so does
a panic with panic_sys_info=all_bt. With pseudo-NMI the CPU answers and
nothing is dumped. Not tested: the idle path, the notifier in NMI
context, other SoCs, ACPI; arm32 is only built.

In every run idle_cpu() was 0 for the stuck CPU at the time of the
notification, also for a CPU that entered the spin from its idle task
with all movable tasks moved away, so the idle path was never taken. A
test module running the register sequence of debug_read_regs() on an
idle core raises an SError on RK3399. Should the idle path (with the
EDPRCR power request) and skip_idle stay? Without them patch 7 needs
only the cpumask, debug_force_cpu_powered_up() goes away, and a CPU is
sampled only if EDPRSR shows it accessible. skip_idle defaults to 0 as
proposed in [1]; on RK3399 it would have to be 1.

[1] https://lore.kernel.org/r/20261118104917.GW9176@e132581.arm.com

---
Igor Velkov (10):
      Documentation: coresight: cpu-debug: Fix the module parameter name
      coresight: cpu-debug: Make the enable parameter read-only in sysfs
      coresight: cpu-debug: Publish the per-CPU data under debug_lock
      coresight: cpu-debug: Bound the power up retries
      coresight: cpu-debug: Do not sample a core that is in reset
      coresight: cpu-debug: Factor out debug_read_pcsr()
      lib/nmi_backtrace: notify about CPUs that ignore a backtrace request
      coresight: cpu-debug: Dump CPUs that ignore a backtrace request
      coresight: cpu-debug: Remove the panic notifier
      coresight: cpu-debug: Print the dump at the warning level

 Documentation/admin-guide/kernel-parameters.txt    |  10 +
 .../trace/coresight/coresight-cpu-debug.rst        |  55 +++--
 drivers/hwtracing/coresight/Kconfig                |   8 +-
 drivers/hwtracing/coresight/coresight-cpu-debug.c  | 244 +++++++++++++--------
 include/linux/nmi.h                                |  28 +++
 lib/nmi_backtrace.c                                |  56 +++++
 6 files changed, 283 insertions(+), 118 deletions(-)
---
base-commit: b7d7462c7f973b65de511db6bebb99fb29946ed8
change-id: 20261127-b4-coresight-cpu-debug-lockup-ee2cf8fc5260

Best regards,
-- 
Igor Velkov <iav@iav.lv>



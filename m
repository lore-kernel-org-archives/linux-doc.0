Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117CB4F88C
	for <linux-doc@vger.kernel.org>; Tue, 26 Mar 2024 09:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711444585; cv=none; b=MZFoFAJD0kLjF1d+qcBqCnAVMIF+sFiwTG6R59JrsaIQr07dZ2vL9ie6xEXGJgbntFrOUgkXJix6ZPv+o2mAPAYyKqNF3HVnqqDPTBVh3dyD+hl9t0/kLoxACP6BzZfF4Ls0IX/7jKZONDboIgMGG+9QUYtNLPVSGt2+GIgTf6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711444585; c=relaxed/simple;
	bh=MK7HHUtMiaa9A53g7A9QIOnjiYLOXvRotsPfgJa1LLs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y0oIQ4JIrmkWklteb/lBb31oASJodJSJmEZnziZ5R6gr+e3JgltQLz6+5rKPxbvwp7g3hu7qDDuCgNxPVq5lilwkqlTeQDLr/pAHYw7b2WiVzSTRKj8wlaVVBDD7V0ZBuakCq9waqEv0OEbJOftWSJozpYYow4aI1de2qKvzq4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FToa3iYj; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FToa3iYj"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-414903d249aso1036855e9.2
        for <linux-doc@vger.kernel.org>; Tue, 26 Mar 2024 02:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711444580; x=1712049380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QcCk2kfNGvdaBITkM75nEhX5qGXp7x44gB568VCUt38=;
        b=FToa3iYj8JRQTmy1rpESbBA7faZXvO04UFhRCPB/VRuCcNHsSbZXfVj+77rghPv6jV
         qUEjI3W8Ea9exwRmtaXZSBnxsPZt5QmGSslG0XVOZmf08BnNrvuD46cl9jbtRYV0eJdk
         lnzPQoPYJiQ9xYZ4OJQLrzdTaqgLZ+n9jGiV6+QT6xxrZ9X0TMJb/8fICqn/MGzAHd7u
         E5di2fyrCFSdEqRNOTdTKz6P2+gh1Ao0PTpBTr5lhCKmca+n1GAUS5JRKeQZMHhLpP1+
         3IDiAOKPo+kbD2H3oqFOrXNidlZzhQiqibvLkfsG1qsg8RAP9nkyp7R+Tsf/432IJb06
         J+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711444580; x=1712049380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QcCk2kfNGvdaBITkM75nEhX5qGXp7x44gB568VCUt38=;
        b=tTZG80+1KzqtDLDnc/OXx+kZDEQaWN878oOlNSTnjlej6/T6TdDH5dvrBl23OS6Jsw
         +nb25Gzb2iWb302YSBeIjBzikLZxhn1CqhjUnde6jqGuct9PYMhB5N24czGqBFn67iZn
         LuOFMB05+Wxz6cV0ES8SmASSuc9icRY4d/YYMfdHgOFWRCB9lL8LPRI0Gr7NOD1a3JC4
         jLSm4c74c68S63HQ3BruAyRvZFqkYUj+bEagY3Xi9jkU0awkmFSLqAyQbH7R84vt7DNZ
         0Tj1QBqn/tez1CsTMNLubIS1OxzH5S5YCWZET4XzfHghGlV/I6y1/J1hvU87WwnCEYkw
         TPRw==
X-Forwarded-Encrypted: i=1; AJvYcCVmUsVvvzFRyw5EeElh4Vk+1ZuORoH6/YZC/dYlZ0hyjiE4NbFO/JSOwx/Dy4xwCGrLX2+34K4vik96GsC66fzsA05RKSqphomv
X-Gm-Message-State: AOJu0YwTEOL608l6RoH6FNBEN0hz1daH5WXreb4J9esNjWQkAjfIMOC6
	ED2zIsRfKgTrIM2V0WCYXdse1oy4qJoVT7FSwqBvJfRkvAXii/jkS9/whoD6Inc=
X-Google-Smtp-Source: AGHT+IHPIOfByqNHi3u6ysUFuyRgD6rr0wqWolqBcmXXpi2X6rqRrQrQay0Z+FRtQsOrVs94hogLgg==
X-Received: by 2002:adf:f3c9:0:b0:33e:7f51:c2fa with SMTP id g9-20020adff3c9000000b0033e7f51c2famr6482511wrp.47.1711444580402;
        Tue, 26 Mar 2024 02:16:20 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:f:6020:e6b6:c92e:43ff:71d7])
        by smtp.gmail.com with ESMTPSA id m15-20020adffe4f000000b0033e5c54d0d9sm11647606wrs.38.2024.03.26.02.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 02:16:19 -0700 (PDT)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	sudeep.holla@arm.com,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	agross@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
	mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	bristot@redhat.com,
	vschneid@redhat.com,
	lukasz.luba@arm.com,
	rui.zhang@intel.com,
	mhiramat@kernel.org,
	daniel.lezcano@linaro.org,
	amit.kachhap@gmail.com,
	corbet@lwn.net,
	gregkh@linuxfoundation.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v6 0/5] Rework system pressure interface to the scheduler
Date: Tue, 26 Mar 2024 10:16:11 +0100
Message-Id: <20240326091616.3696851-1-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following the consolidation and cleanup of CPU capacity in [1], this serie
reworks how the scheduler gets the pressures on CPUs. We need to take into
account all pressures applied by cpufreq on the compute capacity of a CPU
for dozens of ms or more and not only cpufreq cooling device or HW
mitigiations. We split the pressure applied on CPU's capacity in 2 parts:
- one from cpufreq and freq_qos
- one from HW high freq mitigiation.

The next step will be to add a dedicated interface for long standing
capping of the CPU capacity (i.e. for seconds or more) like the
scaling_max_freq of cpufreq sysfs. The latter is already taken into
account by this serie but as a temporary pressure which is not always the
best choice when we know that it will happen for seconds or more.

[1] https://lore.kernel.org/lkml/20231211104855.558096-1-vincent.guittot@linaro.org/

Change since v5:
- Rebase to fix a conflict in include/linux/cpufreq.h
- Add few more tested and reviewed tags

Change since v4:
- Add READ_ONCE() in cpufreq_get_pressure()
- Add ack and reviewed tags

Change since v3:
- Fix uninitialized variables in cpufreq_update_pressure()

Change since v2:
- Rework cpufreq_update_pressure()

Change since v1:
- Use struct cpufreq_policy as parameter of cpufreq_update_pressure()
- Fix typos and comments
- Make sched_thermal_decay_shift boot param as deprecated

Vincent Guittot (5):
  cpufreq: Add a cpufreq pressure feedback for the scheduler
  sched: Take cpufreq feedback into account
  thermal/cpufreq: Remove arch_update_thermal_pressure()
  sched: Rename arch_update_thermal_pressure into
    arch_update_hw_pressure
  sched/pelt: Remove shift of thermal clock

 .../admin-guide/kernel-parameters.txt         |  1 +
 arch/arm/include/asm/topology.h               |  6 +-
 arch/arm64/include/asm/topology.h             |  6 +-
 drivers/base/arch_topology.c                  | 26 ++++----
 drivers/cpufreq/cpufreq.c                     | 36 +++++++++++
 drivers/cpufreq/qcom-cpufreq-hw.c             |  4 +-
 drivers/thermal/cpufreq_cooling.c             |  3 -
 include/linux/arch_topology.h                 |  8 +--
 include/linux/cpufreq.h                       | 10 +++
 include/linux/sched/topology.h                |  8 +--
 .../{thermal_pressure.h => hw_pressure.h}     | 14 ++---
 include/trace/events/sched.h                  |  2 +-
 init/Kconfig                                  | 12 ++--
 kernel/sched/core.c                           |  8 +--
 kernel/sched/fair.c                           | 63 +++++++++----------
 kernel/sched/pelt.c                           | 18 +++---
 kernel/sched/pelt.h                           | 16 ++---
 kernel/sched/sched.h                          | 22 +------
 18 files changed, 144 insertions(+), 119 deletions(-)
 rename include/trace/events/{thermal_pressure.h => hw_pressure.h} (55%)

-- 
2.34.1


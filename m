Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA73139901C
	for <linux-doc@vger.kernel.org>; Thu,  2 Jul 2026 21:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783027676; cv=pass; b=OswQ1yrng8LWD35qszEX7cJROhWnyVNktmj8RCfOrc8HCIx54WPcC2C+4FFILTEUEQDpIcLRpdoU4RM75+jcS7AFePkXwUNDJv6Ek0O7qYIlKUlAzslVQLHUPtLRUumTqZoipi5kZdfCVShEX6Uwt5jxe5RXhH7BYqZzqQmF9G4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783027676; c=relaxed/simple;
	bh=iHfqVSKBVJJ17dOYemIMOGwikBoir5LnY3YdQVW/J+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P8mR2zW8+DCiC3yuem5Tpxy+SvvjIixCr9Vd3ylrFsQ2AyChwo4zCuO0VIF+5CfOjoJXyXpnTY2Z0sH2Wiqfr8N9d7ea7v8E6tTCKwXV5/k44FkExeEfsAzfUVSHi/KPEObCd2rgLOa91Sz/7w7r+kFPM/jja77BGhWszSTqkpQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CLWNu4Z4; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CLWNu4Z4"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39b2d38b200so12999501fa.1
        for <linux-doc@vger.kernel.org>; Thu, 02 Jul 2026 14:27:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783027673; cv=none;
        d=google.com; s=arc-20260327;
        b=q5n8tz8MSe3MPr2KIF3WAm609JRxC4I7vNgQDFM8wgChZP+XF/dZ2hH/7wc+gqs99q
         TwALJ1hHIiseCeTrvBwCoGAzi5ecX68nkg0S+39j3SdzdJ4t+EgPh7FnaSpB5QX6hxfD
         OxmeN2eVMfxB4/amtkyNWEm0UUDRc/YZw5btL5U3VNxDOveW0BqJIK0Wvav4rsQogYyF
         Lj5PYK5l4LsP9ezANmhpns+1wC1gJWDElWDQP8KBb8h/oRc0w5tAHMWrSnMwOydSYO2u
         U/u317fHHW0yeRonqodBgWlntV34M9QdNh0hRH0rebjky3BpIYzkVwlyckJa/2dNToTp
         nwUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rcAwHmJiuEyn5QlxBrFpWdNCiczpryFO8k1MLRmVpao=;
        fh=v5d5E77dqJQNDt5YxzwZVTKhajwI731N1Mw6G6KUy08=;
        b=L4hCtvcFpwvifoZJpVGCAoqy0W3Xrgfon+H5h91s22DHpFISg+dIHkMkbjqfpib9lE
         U+cIy++JgPa15eXNRPtc9d8yu7ITq1HYdAVUebBKKRHCeG/mCPlSFvWwRdcn98v+jSiv
         mp6Zx9YzlS4vRHVMsgOcYbsWxb3MBY1W2QZambUl/z20MQ3AQ7/utBHjpxDydbZdc4nS
         j7DqPC0dX7Msw+Fmkl6LKQ+iB1xyjIqEu+UES9qqv8PN6STCnE1NkkUyiw0fGXUYFQS8
         abp3BqposGvJlqE88fpbJRvXu3Sqf7dbvgTlfw3GqQRPedoN1vjJIez4Zl6P/yztHE5q
         kgdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783027673; x=1783632473; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rcAwHmJiuEyn5QlxBrFpWdNCiczpryFO8k1MLRmVpao=;
        b=CLWNu4Z4g1jrWFUJ7NXsc8HzJ8UOnGOHAq7XqEAQlzMWCz13KLjsKQLgV5rel01CL0
         RSd/2QXCMCKImanD4z1TN7ltnU0mSRBxNDxgmC7nbibiraf4BJHtxf970cYSq9tN+Cr2
         l4XUI9F0oALfMnEvwp15N8+b3A7nzasTevOIN8/wLEQN3Z28wImsh+7oBw2WKZw7VS/l
         pu6vVGQij5AweHe4eO7VVeTuTWELXHx1CmqjC3cphR1GLuNb00Vl+v0iUcmqlbNNNPmN
         vnZzsNkRPQEGxK5rr3HrAmjli9WHh/vbVRb8N9c1F0hYhqNfo8VWGqtNhd0EuzMIpgVR
         fcwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783027673; x=1783632473;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rcAwHmJiuEyn5QlxBrFpWdNCiczpryFO8k1MLRmVpao=;
        b=Opyo+MUZaWCACRL4YrcsDicuVqCP8GxvcX84mPHBFFORWlxIk67e/zvQzqKgeB8I5x
         9XmSOK3PXVI3jRwtD4ihGaNWeGAoHD0mxhtp9pQlAnld8MnQAzW4O5bXTmLHeuUTrz0h
         ML6Yy9y9opXRW/FinOffsTn5+PAtR0qJv1e2grOjAz4E5LWjAOGJmoD8PxHzbFQ7tRu3
         I+tpUwZ3tb4MzOd29LUbu0unmPCxuwTtk66Aduk2LTc0mmhqK21EMBdmPdvtEv4JAnGJ
         NpRcYBPa/h4tbJREGh+G4glV/BbM56WnpBiUi5nxRHUb05teVDo0vFLMo9UuWiSkhxkC
         7ASA==
X-Forwarded-Encrypted: i=1; AHgh+Rqy009Yoz0FGskVqWKJn8bkhkfqJu2EslcbNd1J2oGoafTaAxWFGsYPRcDt6cOqLAX6lacujefz5dM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvkCQiLQMFq2RITYO+54+bn3JpR6QX0FIR3HRd7n/aM3EXufXx
	VFYoty7f19DcpP/ZpeCcoSXVBoNQdB9CvG9qXQyeZfBPDKQBuv97e8FtA8GOwy0T2q9CjMr3+8X
	bbTsoLZAwEPJLycoZmR5Z3m6Zxv7noyM=
X-Gm-Gg: AfdE7ckw/Nml5OCV6IDW9l23bEw8AHwj7vmXgwPepNA3M+AhyHbX77mqYgHCIW950Ce
	gs5TZiMK+Is2fenwocmgyikx0ygQqId3DWUe/6s3a/g+gUGm9R1h4yRGXeZKsaUlO02mdK+26O8
	ijjTAOQbphiuY7Tby+VRVVDHHpEjos+M881J8Yn9OLkz42deb6o3KjxM1UVdhp0+xZDpuNLtP4z
	WP3tsolAnH2TkiO3YSMPeoD9qYG83Vs3xNAOl5NX1ETP95ELTreCl/QIpJjLPs/USnUPbKPyUCb
	td1U/xJdVJFE2hKJ6+w/nR+K+3Rr+II=
X-Received: by 2002:a05:651c:2123:b0:396:3ca3:4f1b with SMTP id
 38308e7fff4ca-39b453982e3mr3260251fa.19.1783027672830; Thu, 02 Jul 2026
 14:27:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629083542.10041-1-lucaslnobrega38@gmail.com>
 <CAJZ5v0iVD90XPsWgT8B+fw9vmFRZTVL7MasPP-=Ci0OdUmNR=A@mail.gmail.com>
 <6021784.DvuYhMxLoT@rafael.j.wysocki> <CAMVixxV83tSLEi_o1vmHjqfgPnnXDwo2LjP_m-Y7iEWfvUAP2g@mail.gmail.com>
 <CAJZ5v0h=u3dGbujFpU2yObyLXT0ZLZTxpG2+zLZLP7wpKsBvQw@mail.gmail.com> <CAMVixxXpT90bkwGTpL+T-d3ve7BTK3xXwBcaMfhvJ7R+DkxXiw@mail.gmail.com>
In-Reply-To: <CAMVixxXpT90bkwGTpL+T-d3ve7BTK3xXwBcaMfhvJ7R+DkxXiw@mail.gmail.com>
From: Lucas Lima <lucaslnobrega38@gmail.com>
Date: Thu, 2 Jul 2026 18:27:40 -0300
X-Gm-Features: AVVi8Ccol9c8xyIcq94NVubQWNykKY8OP_R3rXWcudbhXoUZzKgbdFd2EKdxliI
Message-ID: <CAMVixxXCOMb330_rvgbx2Zdy4yufW0BiB5jmv04v_icK-TTVpA@mail.gmail.com>
Subject: Re: [PATCH] sched/topology: Allow EAS without schedutil for
 artificial Energy Models
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: viresh.kumar@linaro.org, mingo@redhat.com, peterz@infradead.org, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	linux-pm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

After some testing I found out schedutil is indeed slower to react to load
changes compared to pstate active.

The methodology was to empty a cpu, run a serial float recurrence
(kept non-vectorizable
on purpose, to isolate frequency ramp-up rather than throughput headroom)
and compare the average throughput over several initial time windows
against the steady-state throughput in order to measure the CPU frequency
ramp-up delay under pstate active and schedutil.

### P-core
                                  pstate-eas-balanced
pstate-eas-performance    schedutil-eas-balanced
schedutil-eas-performance
------------------------------------------------------------------------------------------------------------------------------------------
Ramp-up (average throughput at time window / steady):
    0-0.005s (%)                  70.6                      99.4
               59.7                      61.3
    0-0.01s (%)                   83.0                      99.5
               60.2                      62.1
    0-0.02s (%)                   91.3                      99.5
               62.9                      65.7
    0-0.05s (%)                   96.7                      99.8
               74.8                      77.6
    0-0.1s (%)                    98.6                      99.9
               86.9                      88.7
    0-0.5s (%)                    100.0                     100.1
               97.4                      97.8
    0-1.0s (%)                    100.2                     100.1
               98.7                      98.9
  Convergence to 95% (ms)         5                         0
               52                        47
Steady-state:
    Throughput (Mops/s)           649.8                     654.4
               652.3                     651.7
Energy:
    Average Power (W)             9.01                      8.98
               9.10                      9.07
    Efficiency (J/Gop)            13.889                    13.735
               14.000                    13.961

### E-core
                                  pstate-eas-balanced
pstate-eas-performance    schedutil-eas-balanced
schedutil-eas-performance
------------------------------------------------------------------------------------------------------------------------------------------
Ramp-up (average throughput at time window / steady):
    0-0.005s (%)                  75.6                      99.0
               62.3                      57.9
    0-0.01s (%)                   85.1                      99.1
               62.2                      58.8
    0-0.02s (%)                   92.4                      99.3
               64.5                      61.0
    0-0.05s (%)                   97.0                      99.7
               72.9                      69.2
    0-0.1s (%)                    98.6                      99.9
               84.8                      82.1
    0-0.5s (%)                    99.8                      100.0
               96.9                      96.4
    0-1.0s (%)                    100.0                     100.0
               98.5                      98.2
  Convergence to 95% (ms)         8                         0
               67                        72
Steady-state:
    Throughput (Mops/s)           540.6                     540.8
               540.1                     539.7
Energy:
    Average Power (W)             5.46                      5.47
               5.61                      5.51
    Efficiency (J/Gop)            10.119                    10.125
               10.426                    10.241

That alone might make it worth it to use pstate active alongside EAS, as
responsiveness gains are noticeable while busy energy consumption is similar.

Furthermore, I implemented an EPP based EAS compatibility selection: when
EPP is set to 0 (performance), eas_compatible is set to false regardless
of the active cpufreq driver mode -- this also overrides schedutil's own
eas_compatible assignment in sugov_init()/sugov_exit() when running in
passive mode. IMHO that makes more sense than gating only on the governor,
as users selecting the performance power profile are looking for
responsiveness above all, independently of intel_pstate or governor settings.

It's also worth noting that governors already have the ability to change
EPP on their own (via intel_pstate_hwp_set()'s save/restore logic for
CPUFREQ_POLICY_PERFORMANCE), which can lead to a state where the desktop's
power profile indicator becomes inconsistent with the actual EPP value:

  1. Switch governor: powersave -> performance
     (intel_pstate saves the current EPP internally and forces EPP to 0)

  2. Switch power profile: balanced -> performance
     (EPP is explicitly written as 0 again; no visible change, since it
     was already 0)

  3. Switch governor: performance -> powersave
     (intel_pstate restores the EPP to balanced,
     because the current EPP still reads as 0 and the
     restore heuristic cannot tell that this 0 was an explicit choice
     rather than the still-forced value from step 1)

After step 3, EAS becomes re-enabled, since EPP is no longer "performance"
-- but the desktop still shows "performance" as the active power profile,
since nothing told power-profiles-daemon that the EPP changed underneath
it. This isn't something my patch introduces, it's an existing property
of intel_pstate's governor-triggered EPP save/restore, but it is relevant
here.

diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstate.c
index 8f5ab9fa3..6d7133b94 100644
--- a/drivers/cpufreq/intel_pstate.c
+++ b/drivers/cpufreq/intel_pstate.c
@@ -791,6 +791,18 @@
cpufreq_freq_attr_ro(energy_performance_available_preferences);

 static struct cpufreq_driver intel_pstate;

+static inline void update_eas_compatibility(struct cpufreq_policy
*policy, struct cpudata *cpu)
+{
+ bool eas_compatible_was = policy->eas_compatible;
+
+ policy->eas_compatible = hwp_is_hybrid &&
+ cpu->policy != CPUFREQ_POLICY_PERFORMANCE &&
+ intel_pstate_get_epp(cpu, 0) != HWP_EPP_PERFORMANCE;
+
+ if (policy->eas_compatible != eas_compatible_was)
+ em_rebuild_sched_domains();
+}
+
 static ssize_t store_energy_performance_preference(
  struct cpufreq_policy *policy, const char *buf, size_t count)
 {
@@ -856,6 +868,8 @@ static ssize_t store_energy_performance_preference(

  mutex_unlock(&intel_pstate_limits_lock);

+ update_eas_compatibility(policy, cpu);
+
  return ret ?: count;
 }

@@ -2922,10 +2936,7 @@ static int intel_pstate_set_policy(struct
cpufreq_policy *policy)
  intel_pstate_clear_update_util_hook(policy->cpu);
  intel_pstate_hwp_set(policy->cpu);

- policy->eas_compatible = hwp_is_hybrid &&
- cpu->policy != CPUFREQ_POLICY_PERFORMANCE;
- if (policy->eas_compatible)
- em_rebuild_sched_domains();
+ update_eas_compatibility(policy, cpu);
  }
  /*
  * policy->cur is never updated with the intel_pstate driver, but it

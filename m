Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2735A1D63DE
	for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2025 10:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736851426; cv=none; b=ITQXkuxeh3dM4UE7n+H1VE05EW1tHysV/DNWkPQ8h5bmsj8JsUbH5N13OPNrdiiHJXSosyWCeY1LM1pNTO6y0lcdDrhB8lewo8z7gevTT9xv5bMzdGUvO5izW1OzId0f+JxHvUy/GgKwgkhsKQKm+gWBcpOfOU202SUqtk2tZPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736851426; c=relaxed/simple;
	bh=opLeUa4Mp50QF7C5MNp+ICBRsVQEJB72+efA1k81GBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=snGZ84frGU7hHNG+CJ/uBBQZzAp8sQjA77WxUrfKV+7572rObWWyhKt2LJ1KdqFd7LM8XICkwDEEcazrHjXYXVz8bbX7LZrfNtLQayaSb4vUaqBs1lYmaeFwJgBip3l/BihlwUuCmK7BbRm4Rj1mPiXAO8DfknDp7pVD5OT6kzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xpBKAX5m; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xpBKAX5m"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21669fd5c7cso95129765ad.3
        for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2025 02:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736851424; x=1737456224; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U+iFfCSA0esMLhZDHY92zW4RJncb7ADni12U1qFlLKc=;
        b=xpBKAX5mSTcYv0t+8BRG7dcMHHNu9KsMkBfQvYAbfgFxxJcrXKrofePG3INcZhVMz/
         mgj3fU0jCBoJQ8wxJefKYgVWlXPU1YKe0RGkFzeq45nbrwwpGhUySxbBgJlfYkRGj1e+
         NW9jWyXBp0Xj8xy7vtykHe1f23KIGXJEZ241qtxe76Loih5P3wZbNPmlfhmdHmwVBUV4
         sDJ+qBFFo1NbW7uwYCMFnlLqNdaYcghTeLSvzIYwJe4kIiVh+k5GTj7TtXsLX+bLfFko
         hnyhriLzv3jbIAzE4q0t5g7Bu2CgHXCTWf40zDlwxECWWlWDXz6mBulRq3y8455awKi/
         W+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736851424; x=1737456224;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U+iFfCSA0esMLhZDHY92zW4RJncb7ADni12U1qFlLKc=;
        b=RYpIzXMgRS4Vn5Wk1PYhKfs/FNBaDD2XbBoaUM+c2PMjReDWTigZSSp2JHRp1ltn/y
         pklOPVId30Q2LQdAgj9YwUm3sl8zZKQD9o2Al6pdgvDo3FoeshZzCa8dKHBrm3eJOXFw
         qQOHaszL28D07nGv7luMWUZ4cfLh4VSUn8Oqk7GtW0Ov5kSRuw2hRX0Sh2+hGyZWZfSV
         zn/U5nRg3kAZjaqpE4mlVJ8t6VhT0/UK99vjcFUNGYD41ry4U/dNLgd4TRLlkt+I7OF3
         FAsmZOl/gi8L5i+z8KBuZ53/ou0iM+K1OqPXWexZL5vm8LHbQujW/H0F86nXttgZiZ0u
         a1sA==
X-Forwarded-Encrypted: i=1; AJvYcCXGA5gIc24mDNCtX1YnA9umNJJcHdX8kHO1lkGwz7JraruIYFvs/LhBdJodPDDzOaOe39BKUO2RJ7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4HjCsg6R4281dsk6weLGfjddyPMqwzEsgEh6RmZ18Zr5saiWq
	7U/ISAcavDo65PUMV9VYWDxXE4HLIrpXIMYcJ2U6Bnb0XMZ+7aiW3Hc62y0Fgko7MFE7A9NA6NR
	+JiaS8vkkjz2t6FT71N+sLxsvXsI8/EHzP7R3
X-Gm-Gg: ASbGncv7avVUvSmDDDLX3wlkkbRfCeIBzHhv8TJ3X32it6fkLNOZNweEpuTu1XpqbVu
	9e9gK3VcnwcLtBnvVMpF/fyWLqWtFRTUAGprXqvkAl56H2bljTH9YsVOBJw4FtUmY6SKM
X-Google-Smtp-Source: AGHT+IGczXH0RwSvDlb2KRoPip36lSqxyB+OuiMrmApQOWno0b47AQpdfRInLeDgapSvPtkwUC9nyMn+0RAYGxD5H2c=
X-Received: by 2002:a17:90b:540f:b0:2ee:48bf:7dc3 with SMTP id
 98e67ed59e1d1-2f548eb321emr37372999a91.15.1736851424249; Tue, 14 Jan 2025
 02:43:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250114-kcov-v1-0-004294b931a2@quicinc.com>
In-Reply-To: <20250114-kcov-v1-0-004294b931a2@quicinc.com>
From: Marco Elver <elver@google.com>
Date: Tue, 14 Jan 2025 11:43:08 +0100
X-Gm-Features: AbW1kvaVa5-9nPmDbOZJ9N5LtR4pKYs5_Kxyb15S0vct137T7GGOlb18swg2wtM
Message-ID: <CANpmjNPUFnxvY-dnEAv09-qB5d0LY_vmyxhb3ZPJV-T9V9Q6fg@mail.gmail.com>
Subject: Re: [PATCH 0/7] kcov: Introduce New Unique PC|EDGE|CMP Modes
To: "Jiao, Joey" <quic_jiangenj@quicinc.com>
Cc: Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jan 2025 at 06:35, Jiao, Joey <quic_jiangenj@quicinc.com> wrote:
>
> Hi,
>
> This patch series introduces new kcov unique modes:
> `KCOV_TRACE_UNIQ_[PC|EDGE|CMP]`, which are used to collect unique PC, EDGE,
> CMP information.
>
> Background
> ----------
>
> In the current kcov implementation, when `__sanitizer_cov_trace_pc` is hit,
> the instruction pointer (IP) is stored sequentially in an area. Userspace
> programs then read this area to record covered PCs and calculate covered
> edges.  However, recent syzkaller runs show that many syscalls likely have
> `pos > t->kcov_size`, leading to kcov overflow. To address this issue, we
> introduce new kcov unique modes.

Overflow by how much? How much space is missing?

> Solution Overview
> -----------------
>
> 1. [P 1] Introduce `KCOV_TRACE_UNIQ_PC` Mode:
>    - Export `KCOV_TRACE_UNIQ_PC` to userspace.
>    - Add `kcov_map` struct to manage memory during the KCOV lifecycle.
>      - `kcov_entry` struct as a hashtable entry containing unique PCs.
>      - Use hashtable buckets to link `kcov_entry`.
>      - Preallocate memory using genpool during KCOV initialization.
>      - Move `area` inside `kcov_map` for easier management.
>    - Use `jhash` for hash key calculation to support `KCOV_TRACE_UNIQ_CMP`
>      mode.
>
> 2. [P 2-3] Introduce `KCOV_TRACE_UNIQ_EDGE` Mode:
>    - Save `prev_pc` to calculate edges with the current IP.
>    - Add unique edges to the hashmap.
>    - Use a lower 12-bit mask to make hash independent of module offsets.
>    - Distinguish areas for `KCOV_TRACE_UNIQ_PC` and `KCOV_TRACE_UNIQ_EDGE`
>      modes using `offset` during mmap.
>    - Support enabling `KCOV_TRACE_UNIQ_PC` and `KCOV_TRACE_UNIQ_EDGE`
>      together.
>
> 3. [P 4] Introduce `KCOV_TRACE_UNIQ_CMP` Mode:
>    - Shares the area with `KCOV_TRACE_UNIQ_PC`, making these modes
>      exclusive.
>
> 4. [P 5] Add Example Code Documentation:
>    - Provide examples for testing different modes:
>      - `KCOV_TRACE_PC`: `./kcov` or `./kcov 0`
>      - `KCOV_TRACE_CMP`: `./kcov 1`
>      - `KCOV_TRACE_UNIQ_PC`: `./kcov 2`
>      - `KCOV_TRACE_UNIQ_EDGE`: `./kcov 4`
>      - `KCOV_TRACE_UNIQ_PC|KCOV_TRACE_UNIQ_EDGE`: `./kcov 6`
>      - `KCOV_TRACE_UNIQ_CMP`: `./kcov 8`
>
> 5. [P 6-7] Disable KCOV Instrumentation:
>    - Disable instrumentation like genpool to prevent recursive calls.
>
> Caveats
> -------
>
> The userspace program has been tested on Qemu x86_64 and two real Android
> phones with different ARM64 chips. More syzkaller-compatible tests have
> been conducted. However, due to limited knowledge of other platforms,
> assistance from those with access to other systems is needed.
>
> Results and Analysis
> --------------------
>
> 1. KMEMLEAK Test on Qemu x86_64:
>    - No memory leaks found during the `kcov` program run.
>
> 2. KCSAN Test on Qemu x86_64:
>    - No KCSAN issues found during the `kcov` program run.
>
> 3. Existing Syzkaller on Qemu x86_64 and Real ARM64 Device:
>    - Syzkaller can fuzz, show coverage, and find bugs. Adjusting `procs`
>      and `vm mem` settings can avoid OOM issues caused by genpool in the
>      patches, so `procs:4 + vm:2GB` or `procs:4 + vm:2GB` are used for
>      Qemu x86_64.
>    - `procs:8` is kept on Real ARM64 Device with 12GB/16GB mem.
>
> 4. Modified Syzkaller to Support New KCOV Unique Modes:
>    - Syzkaller runs fine on both Qemu x86_64 and ARM64 real devices.
>      Limited `Cover overflows` and `Comps overflows` observed.
>
> 5. Modified Syzkaller + Upstream Kernel Without Patch Series:
>    - Not tested. The modified syzkaller will fall back to `KCOV_TRACE_PC`
>      or `KCOV_TRACE_CMP` if `ioctl` fails for Unique mode.
>
> Possible Further Enhancements
> -----------------------------
>
> 1. Test more cases and setups, including those in syzbot.
> 2. Ensure `hash_for_each_possible_rcu` is protected for reentrance
>    and atomicity.
> 3. Find a simpler and more efficient way to store unique coverage.
>
> Conclusion
> ----------
>
> These patches add new kcov unique modes to mitigate the kcov overflow
> issue, compatible with both existing and new syzkaller versions.

Thanks for the analysis, it's clearer now.

However, the new design you introduce here adds lots of complexity.
Answering the question of how much overflow is happening, might give
better clues if this is the best design or not. Because if the
overflow amount is relatively small, a better design (IMHO) might be
simply implementing a compression scheme, e.g. a simple delta
encoding.

Thanks,
-- Marco

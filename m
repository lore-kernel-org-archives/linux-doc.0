Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9742E7162
	for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 11:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781610259; cv=pass; b=Fj+zvkfBRrHrJ61IX6DXNUVl2M1Q4riLESQZF5XA9jrTru3P0nmq828xSWMJb9NM04sTtUoovVHYRhaRkNWGLVNLJNgSsV7+7DYLIzqL3FQ0xYL7yP782tU/LgIM7PxYN2D2h097RTImb27hMMEJLXHMRWgDBk5PuJEBenAdLN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781610259; c=relaxed/simple;
	bh=sc+ctbMEtPXqnNW2VqGgYbEiSZNF9yzcW9CQDAxrVCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VxGy2EllZGJ8R3gAtMnC9/Ncwok5HA2KtTh4ICfqWxiGyVcti+VYF3afQHqF5tpHEz0N4TASVjxsnooPoezhZzvmpsdkdrrgxQq3ifgF8EpSQ5jqvU01AMIJtX3/pdV/wkgSSAErQoyIyQAy8LAHMswU4iLrEcB9/yvwGHPQb/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QctCZxpK; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=YM/5coRF; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QctCZxpK";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="YM/5coRF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781610254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pe0GDMYgO8x6PXpCGVU4s0eHlaJU+A8ohfueQbK3R8s=;
	b=QctCZxpKeO7QT0RAHDiv+SkfqSJfobiZ+DZmiV6/HdIEU0Ic3PAWVaAGA6qfRq7rc6RchP
	DxM79GRGULbosSERDQQDZGbnhNupxeLdPXgOzUoPa57QhJjSdZ9GColZp91UNEyQ2RfpXL
	9ryxOOq1TXqhdcMK2dg6juH/HjYZYtY=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-333-UBY7lhNdP2yrnQ_6NbAEdw-1; Tue, 16 Jun 2026 07:44:13 -0400
X-MC-Unique: UBY7lhNdP2yrnQ_6NbAEdw-1
X-Mimecast-MFC-AGG-ID: UBY7lhNdP2yrnQ_6NbAEdw_1781610253
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7f5b54da461so69798577b3.3
        for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 04:44:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781610253; cv=none;
        d=google.com; s=arc-20240605;
        b=CbCQFHUV0+4vVDl7Gfd9wyTdIk5+Hv4kJUmFFZG04JkX3wWqttciaCYRmAuG7TfYa9
         PFkhs2yqsdqHxSxn/+adkUujR5jOqucg+pTJJAkyzfTIYxGjD2qISSEdreOF5RRquBHR
         5kvOeWTztBrnMc6WDt9lsTx41rohEn26Jfjh9ZHWGs6ygqUVGsfHlW6zOnbX8SxVnWuw
         0r4gGJx9goO1HlVViJYC79k38eDegmIgEG7iZI40STH9BjgJ8k3f1LHNPj1aG6SNSU/S
         dCmdk2AIcaQL0A9K4EKTCOqyte4gDdclBh0Jm1fU+vva17q561tBC5k7qgUsaTZ4UaoZ
         OPoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pe0GDMYgO8x6PXpCGVU4s0eHlaJU+A8ohfueQbK3R8s=;
        fh=FEHtnXugRY/wfLldvJNHRCEJyX24ujtdUv8ecvUWrh0=;
        b=BnuTaH2p0yYeKuoMjZ/HBVuFsojUbJz6S5wmL/VXLpPOl2nAz40nIuEOuJdWjfG8iK
         Nvl5UqZ9g9eyBZlVWBaZMdraF/sI2jXHeCGBRQRk78iR/a16PuykVI3Pm+BYoEpmFMEg
         VZGuxdt8H+xu0ebWj6PTpBmQPpd8RmBZkAFo29cgJ9zRRBe8HWbNWghQF7Q8WXHKA6dO
         cjC7TAJ+3ocC3OfbwP+aDZCU84BlsnY9ns4OWKzB6f3ZSxVXmXWBjVJRNJ0HTc+g8rpg
         /46Gra1Ayo7rUJMwxpT642uSIeg2V1CXQJxGRjrqDgdUWsANLXfwPEf9hBvGFRBQKDCN
         ZJbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781610253; x=1782215053; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pe0GDMYgO8x6PXpCGVU4s0eHlaJU+A8ohfueQbK3R8s=;
        b=YM/5coRF+FuIC4lhQ8XsiuLR22aUd75M8/Ta4CtB+dwfwcrrOYqxZ5cGoxlKPuFBLA
         Vj3xeeMsnUXIITYxu63edzs2ax4lomDcDGfG/h1gPeMqh7nR0ZHplYmYCg4GZsFrI3ga
         1qQzINu1htS8wjV91IhiwfvplUtXo0MD3mKxdwubatKQP6YfOxvRUL3xOcoU+umwWRph
         rGvfqE6Uxfbdx34w1IAf/14n1VvPfDLB41wUMm7lzaHq+BVxY42klmNwkLyyASpFg4nZ
         4wjzPDWaHGtWT2JmbV3gguNWJNlu7z8deEwqD6ym7BsO+bMI9KAN5ZLwA2dtAcYxtedB
         Umbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781610253; x=1782215053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pe0GDMYgO8x6PXpCGVU4s0eHlaJU+A8ohfueQbK3R8s=;
        b=r5isPeaCSEF/S7TSsuTUbYn1uL8cKx/XotPG0MqcPeQ8F0VP2BI5Ul9AMBRFFzj+jM
         YssYnldnaqvsqn/ySjhVs8fhTAx0mC6JRY2Cv8/yMYs7zwO7gbDO6d/7Wm/ZwY/3vVW6
         h93x8Ph0SBCXx7D3STm9Dgi4eW1+9hzOb4jwZ3jzsUDdRWhUMDrrEV8jgKKf40F2/Dh9
         N8xBk5uCZrLeRscMpK6nXc1Jg5JHN79UI+5gDm6wTduzS+TbDMp4DtPpJV+YsDw6iUBs
         VOomplXb5n4zrdQ23HPaTTxeifhdHJb7SUI84APkJ3GFm422Z+Hc/LDvKf8LjMpsUI3N
         qEgg==
X-Forwarded-Encrypted: i=1; AFNElJ+wsYUBRRB+SFThjd0etboam/qfF0UYs1kXd+6lhGAQHPhCxluuOR5TUPJT7G09btydgCXcL1hWjis=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpsQcv3RuHAZJfI2x9VhbF4TFMjKzPbvLrfRn/53YqRIO2A/WC
	9a8KfbMmjJaYqkp/rVZZEi9f9uC2Mm+lDbXxt/1s6MPzs85bgPTm7GbwXLtACE/YFRqxgOist5G
	ynPhqIOJFE3ps4EE+TDWDGQWens32szS6gb7WNokqKRZI542hM7G4i1opmsXzOu7tEKNGxNQLtQ
	x2EtwhQSi+4PWmOTzJCmFFrbM46uT1IXAvd175
X-Gm-Gg: AfdE7clqTfM9veDV7q0u8/hpRt1SVfzwg8A+K7MrI7eVyMNAs3Ypf220r01fMccc48U
	YHfpPMl6dVf9GpYY/rKfH8bHbNWvh03E1+f278SfGcga0Fxkl1WpWQHLYq7lHFebUWVS2MGerCe
	fg25R53WJ/a9u8k/g9LmZxmFHI7CpM2QU1zhJ4VZNGE3mKjrNmJmB/uE1SbCeKQtEiUbbFp5n+y
	CPmqw==
X-Received: by 2002:a05:690c:e3ef:b0:7ef:dfa0:c6ac with SMTP id 00721157ae682-7fcfd03fb31mr31669287b3.2.1781610253039;
        Tue, 16 Jun 2026 04:44:13 -0700 (PDT)
X-Received: by 2002:a05:690c:e3ef:b0:7ef:dfa0:c6ac with SMTP id
 00721157ae682-7fcfd03fb31mr31668877b3.2.1781610252538; Tue, 16 Jun 2026
 04:44:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515-kunit_add_support-v13-0-18ee42f96e7b@redhat.com>
In-Reply-To: <20260515-kunit_add_support-v13-0-18ee42f96e7b@redhat.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 16 Jun 2026 13:44:01 +0200
X-Gm-Features: AVVi8CdNVq7XqceKqYuD-I39NjX_b_RMajVLLaSPX-I7u2X3eoOcSjHF2FKnres
Message-ID: <CADSE00+typ3Zi5Vf0Z276+e0G7PuS7mt7oA9h5awBu3YgYKw0g@mail.gmail.com>
Subject: Re: [PATCH v13 0/4] kunit: Add support for suppressing warning backtraces
To: Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	dri-devel@lists.freedesktop.org, workflows@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
	peterz@infradead.org, Alessandro Carminati <acarmina@redhat.com>, 
	Guenter Roeck <linux@roeck-us.net>, Kees Cook <kees@kernel.org>, 
	Linux Kernel Functional Testing <lkft@linaro.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Dan Carpenter <error27@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 2:29=E2=80=AFPM Albert Esteve <aesteve@redhat.com> =
wrote:
>
> Some unit tests intentionally trigger warning backtraces by passing bad
> parameters to kernel API functions. Such unit tests typically check the
> return value from such calls, not the existence of the warning backtrace.
>
> Such intentionally generated warning backtraces are neither desirable
> nor useful for a number of reasons:
> - They can result in overlooked real problems.
> - A warning that suddenly starts to show up in unit tests needs to be
>   investigated and has to be marked to be ignored, for example by
>   adjusting filter scripts. Such filters are ad hoc because there is
>   no real standard format for warnings. On top of that, such filter
>   scripts would require constant maintenance.
>
> One option to address the problem would be to add messages such as
> "expected warning backtraces start/end here" to the kernel log.
> However, that would again require filter scripts, might result in
> missing real problematic warning backtraces triggered while the test
> is running, and the irrelevant backtrace(s) would still clog the
> kernel log.
>
> Solve the problem by providing a means to suppress warning backtraces
> originating from the current kthread while executing test code.
> Since each KUnit test runs in its own kthread, this effectively scopes
> suppression to the test that enabled it, without requiring any
> architecture-specific code.
>
> Overview:
> Patch#1 Introduces the suppression infrastructure integrated into
>         KUnit's hook mechanism.
> Patch#2 Adds selftests to validate the functionality.
> Patch#3 Demonstrates real-world usage in the DRM subsystem.
> Patch#4 Documents the new API and usage guidelines.
>
> Design Notes:
> Suppression is integrated into the existing KUnit hooks infrastructure,
> reusing the kunit_running static branch for zero overhead
> when no tests are running. The implementation lives entirely in the
> kunit module; only a static-inline wrapper and a function pointer
> slot are added to built-in code.
>
> Suppression is checked at three points in the warning path:
> - In `warn_slowpath_fmt()` (kernel/panic.c), for architectures without
>   __WARN_FLAGS. The check runs before any output, fully suppressing
>   both message and backtrace.
> - In `__warn_printk()` (kernel/panic.c), for architectures that define
>   __WARN_FLAGS but not their own __WARN_printf (arm64, loongarch,
>   parisc, powerpc, riscv, sh). The check suppresses the warning message
>   text that is printed before the trap enters __report_bug().
> - In `__report_bug()` (lib/bug.c), for architectures that define
>   __WARN_FLAGS. The check runs before `__warn()` is called, suppressing
>   the backtrace and stack dump.
>
> To avoid double-counting on architectures where both `__warn_printk()`
> and `__report_bug()` run for the same warning, the hook takes a bool
> parameter: true to increment the suppression counter, false to suppress
> without counting.
>
> The suppression state is dynamically allocated via kunit_kzalloc() and
> tied to the KUnit test lifecycle via `kunit_add_action()`, ensuring
> automatic cleanup at test exit. Writer-side access to the global
> suppression list is serialized with a spinlock; readers use RCU.
>
> Two API forms are provided:
> - kunit_warning_suppress(test) { ... }: scoped blocks with automatic
>   cleanup. The suppression handle is not accessible outside the block,
>   so warning counts (if needed) must be checked inside. Multiple
>   sequential suppression blocks are allowed.
> - kunit_start/end_suppress_warning(test): direct functions that return
>   an explicit handle. Use when the handle needs to be retained, or passed
>   across helpers. Multiple sequential suppression blocks are allowed.
>
> This series is based on the RFC patch and subsequent discussion at
> https://patchwork.kernel.org/project/linux-kselftest/patch/02546e59-1afe-=
4b08-ba81-d94f3b691c9a@moroto.mountain/
> and offers a more comprehensive solution of the problem discussed there.
>
> Changes since RFC:
> - Introduced CONFIG_KUNIT_SUPPRESS_BACKTRACE
> - Minor cleanups and bug fixes
> - Added support for all affected architectures
> - Added support for counting suppressed warnings
> - Added unit tests using those counters
> - Added patch to suppress warning backtraces in dev_addr_lists tests
>
> Changes since v1:
> - Rebased to v6.9-rc1
> - Added Tested-by:, Acked-by:, and Reviewed-by: tags
>   [I retained those tags since there have been no functional changes]
> - Introduced KUNIT_SUPPRESS_BACKTRACE configuration option, enabled by
>   default.
>
> Changes since v2:
> - Rebased to v6.9-rc2
> - Added comments to drm warning suppression explaining why it is needed.
> - Added patch to move conditional code in arch/sh/include/asm/bug.h
>   to avoid kerneldoc warning
> - Added architecture maintainers to Cc: for architecture specific patches
> - No functional changes
>
> Changes since v3:
> - Rebased to v6.14-rc6
> - Dropped net: "kunit: Suppress lock warning noise at end of dev_addr_lis=
ts tests"
>   since 3db3b62955cd6d73afde05a17d7e8e106695c3b9
> - Added __kunit_ and KUNIT_ prefixes.
> - Tested on interessed architectures.
>
> Changes since v4:
> - Rebased to v6.15-rc7
> - Dropped all code in __report_bug()
> - Moved all checks in WARN*() macros.
> - Dropped all architecture specific code.
> - Made __kunit_is_suppressed_warning nice to noinstr functions.
>
> Changes since v5:
> - Rebased to v7.0-rc3
> - Added RCU protection for the suppressed warnings list.
> - Added static key and branching optimization.
> - Removed custom `strcmp` implementation and reworked
>   __kunit_is_suppressed_warning() entrypoint function.
>
> Changes since v6:
> - Moved suppression checks from WARN*() macros to warn_slowpath_fmt()
>   and __report_bug().
> - Replaced stack-allocated suppression struct with kunit_kzalloc() heap
>   allocation tied to the KUnit test lifecycle.
> - Changed suppression strategy from function-name matching to task-scoped=
:
>   all warnings on the current task are suppressed between START and END,
>   rather than only warnings originating from a specific named function.
> - Simplified macro API: removed KUNIT_DECLARE_SUPPRESSED_WARNING(),
>   the START macro now takes (test) and handles allocation internally.
> - Removed static key and branching optiomization, as by the time it
>   was executed, callers are already in warn slowpaths.
> - Link to v6: https://lore.kernel.org/r/20260317-kunit_add_support-v6-0-d=
d22aeb3fe5d@redhat.com
>
> Changes since v7:
> - Integrated suppression into existing KUnit hooks infrastructure
> - Removed CONFIG_KUNIT_SUPPRESS_BACKTRACE
> - Added suppression check in __warn_printk()
> - Added spinlock for writer-side RCU protection
> - Replaced explicit rcu_read_lock/unlock with guard(rcu)()
> - Added scoped API (kunit_warning_suppress) using __cleanup attribute
> - Updated DRM patch to use scoped API
> - Expanded self-tests: incremental counting, cross-kthread isolation
> - Rewrote documentation covering all three API forms with examples
> - Link to v7: https://lore.kernel.org/r/20260420-kunit_add_support-v7-0-e=
8bc6e0f70de@redhat.com
>
> Changes since v8:
> - Rebased to v7.1-rc2
> - Remove KUNIT_START/END_SUPPRESSED_WARNING() macros
> - Add KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT checks to drm tests
> - Link to v8: https://lore.kernel.org/r/20260504-kunit_add_support-v8-0-3=
e5957cdd235@redhat.com
>
> Changes since v9:
> - Fix silent false-pass when kunit_start_suppress_warning() returns NULL
> - Fix RCU lockdep splat for kunit_is_suppressed_warning() calls
> - Move disable_trace_on_warning() in __report_bug()
> - Make suppress counter atomic
> - Mark helper warn functions in selftest as noinline
> - Add kunit_skip() for CONFIG_BUG=3Dn in selftests
> - Fix potentially uninitialized data.was_active in kthread seltest
> - Add kthread_stop() in kthread selftest early exit
> - Initialize scaling_factor to INT_MIN in DRM scaling tests
> - Add include for bool in test-bug.h to fix CONFIG_KUNIT=3Dn case
> - Link to v9: https://lore.kernel.org/r/20260508-kunit_add_support-v9-0-9=
9df7aa880f6@redhat.com
>
> Changes since v10:
> - Remove synchronize_rcu() to avoid sleeping in atomic context
> - Pin task_struct refcount to prevent ABA false-positive matches
> - Loop in suppression selftest to prevent use-after-free on kthread exit
> - Skip DRM rect tests on CONFIG_BUG=3Dn
> - Link to v10: https://lore.kernel.org/r/20260513-kunit_add_support-v10-0=
-e379d206c8cd@redhat.com
>
> Changes since v11:
> - Use call_rcu() to defer free without blocking
> - Remove #ifdef CONFIG_KUNIT guard in lib/bug.c
> - Remove stale config checks from selftest
> - Replace skip on DRM rect tests with conditional expectation
> - Link to v11: https://lore.kernel.org/r/20260514-kunit_add_support-v11-0=
-b36a530a6d8f@redhat.com
>
> Changes since v12:
> - Reverted to the v9 synchronize_rcu() approach
> - Add in_task() check at the top of __kunit_is_suppressed_warning_impl()
> - Link to v12: https://lore.kernel.org/r/20260515-kunit_add_support-v12-0=
-a216dc228be8@redhat.com

Hi all,

I am not sure if there is a decision to merge this series or if any
work remains to be done.

I reckon I sent a few versions back-to-back last time as I was
struggling with Sashiko. However, there are no significant changes,
the core strategy remains unchanged, involving only the addition of
safety checks and the removal of some redundancies to satisfy the AI.
I am just clarifying in case the last versions/respins were unclear. I
tried running AI reviews locally but Sashiko always found more issues
than my local model could.

BR,
Albert.

> --
> 2.34.1
>
> ---
> To: Brendan Higgins <brendan.higgins@linux.dev>
> To: David Gow <david@davidgow.net>
> To: Rae Moar <raemoar63@gmail.com>
> To: Andrew Morton <akpm@linux-foundation.org>
> To: Paul Walmsley <pjw@kernel.org>
> To: Palmer Dabbelt <palmer@dabbelt.com>
> To: Albert Ou <aou@eecs.berkeley.edu>
> To: Alexandre Ghiti <alex@ghiti.fr>
> To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> To: Maxime Ripard <mripard@kernel.org>
> To: Thomas Zimmermann <tzimmermann@suse.de>
> To: David Airlie <airlied@gmail.com>
> To: Simona Vetter <simona@ffwll.ch>
> To: Jonathan Corbet <corbet@lwn.net>
> To: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-kselftest@vger.kernel.org
> Cc: kunit-dev@googlegroups.com
> Cc: linux-riscv@lists.infradead.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: workflows@vger.kernel.org
> Cc: linux-doc@vger.kernel.org
>
> ---
>
> ---
> Alessandro Carminati (1):
>       bug/kunit: Core support for suppressing warning backtraces
>
> Guenter Roeck (3):
>       kunit: Add backtrace suppression self-tests
>       drm: Suppress intentional warning backtraces in scaling unit tests
>       kunit: Add documentation for warning backtrace suppression API
>
>  Documentation/dev-tools/kunit/usage.rst |  46 +++++++-
>  drivers/gpu/drm/tests/drm_rect_test.c   |  36 +++++-
>  include/kunit/test-bug.h                |  26 +++++
>  include/kunit/test.h                    |  98 ++++++++++++++++
>  kernel/panic.c                          |  11 ++
>  lib/bug.c                               |  12 +-
>  lib/kunit/Makefile                      |   4 +-
>  lib/kunit/backtrace-suppression-test.c  | 192 ++++++++++++++++++++++++++=
++++++
>  lib/kunit/bug.c                         | 127 +++++++++++++++++++++
>  lib/kunit/hooks-impl.h                  |   2 +
>  10 files changed, 544 insertions(+), 10 deletions(-)
> ---
> base-commit: 74fe02ce122a6103f207d29fafc8b3a53de6abaf
> change-id: 20260312-kunit_add_support-2f35806b19dd
>
> Best regards,
> --
> Albert Esteve <aesteve@redhat.com>
>


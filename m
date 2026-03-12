Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9F336896F;
	Thu, 12 Mar 2026 23:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773357754; cv=none; b=n0uuqfcY2MRBIYmc1dU/2eKH37dllbtcaHbDNbqF3olr2vBT+eJnnEl+DeFaCnokygLkGOBUrrS9olnT7+/zmvudMpjLCZew4RywDC+V3+eopaNo6u3InLmf3jjKZkfOvPyhDVwwB68BrpfUu3EPy11aVFnTKI4M+CLIn5eC7eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773357754; c=relaxed/simple;
	bh=0C9RlHTOFqbcqCjBROliem/Yw7tye+blJRKLXZ3MYr0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UePWzb11j5gjn4JEai0DcyOe10tYm8SVbEHhtQxCTIgGXpVjyN+Pa89XnlQlb56D6tW/wfgWtvskwC3bPzfdThz//YFP44EDE76o3pBHX3QziTXo8US0xe/Ni6p13o4vLYTTYndMbOa1foY7MPQJm+3dq3/lJecar3ktvGQgFIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q5iITsrO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q5iITsrO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96399C4CEF7;
	Thu, 12 Mar 2026 23:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773357753;
	bh=0C9RlHTOFqbcqCjBROliem/Yw7tye+blJRKLXZ3MYr0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Q5iITsrO4WHh5DyyzET9p/f5PtI5Wyon5IPI4kF1E7tynS/Ls190FHs4ThpCnkZDF
	 xFydGeDJB8ptmV+m7rvTT+Rp67kUs+g15mJH7SQwbdilVOOnHZt6rS1wzqYmNCBb9s
	 yrGz3ccPyPK7V5pQW8RX8JB04TEiIr7U0p+TEKR+U1nP1su3iLa6R3nAKNKR5ODHhx
	 4ip0M70/Al4xiR8T8I2gYtw+lPuZH7sK3FfZgg/FR7/bBiXctBLVGWkrLtjggbTYTd
	 9whZv3JxsAhpTKI5sHPTLwRZMqeZaLsfaE+btnHVHJawZliW1uCcX6QFzWwAwZGSz7
	 OzJAgbHPwICeA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 830F7FED2F5;
	Thu, 12 Mar 2026 23:22:33 +0000 (UTC)
From: Mayank Rungta via B4 Relay <devnull+mrungta.google.com@kernel.org>
Subject: [PATCH v2 0/5] watchdog/hardlockup: Improvements to hardlockup
 detection and documentation
Date: Thu, 12 Mar 2026 16:22:01 -0700
Message-Id: <20260312-hardlockup-watchdog-fixes-v2-0-45bd8a0cc7ed@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJlKs2kC/32NwQ6CMBBEf4Xs2TVtAVFP/ofh0GyXthEpaRE1h
 H+3knj1+GbyZhZIHD0nOBcLRJ598mHIoHYFkNODZfQmMyihDkJJiU5H0we6PUZ86omcCRY7/+K
 EB1HKpj4dNSkB2R8jb0XWr21m59MU4nu7muU3/a2qP6uzRIFNVXfSEIuKyosNwfa8p3CHdl3XD
 4zqUOPDAAAA
X-Change-ID: 20260211-hardlockup-watchdog-fixes-60317598ac20
To: Petr Mladek <pmladek@suse.com>, Jinchao Wang <wangjinchao600@gmail.com>, 
 Yunhui Cui <cuiyunhui@bytedance.com>, Stephane Eranian <eranian@google.com>, 
 Ian Rogers <irogers@google.com>, Li Huafei <lihuafei1@huawei.com>, 
 Feng Tang <feng.tang@linux.alibaba.com>, 
 Max Kellermann <max.kellermann@ionos.com>, Jonathan Corbet <corbet@lwn.net>, 
 Douglas Anderson <dianders@chromium.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Florian Delizy <fdelizy@google.com>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Mayank Rungta <mrungta@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773357752; l=3297;
 i=mrungta@google.com; s=20260212; h=from:subject:message-id;
 bh=0C9RlHTOFqbcqCjBROliem/Yw7tye+blJRKLXZ3MYr0=;
 b=mU9EhSv8+WaxR4YXyppJ5Px717BoBUtPBdZrV4UizcqmDTcZKcc7EVPMeIdfs3w7U8t+DV4Ku
 dE9CN1UZKmdCcOoISLGFzs4cDN4EOhn2EKmZJ3Rua6kiTANuiExQpaO
X-Developer-Key: i=mrungta@google.com; a=ed25519;
 pk=2Bjwbv/ibL10QnyvK9G7DoKpffXy7z6+M4NawEYgYDI=
X-Endpoint-Received: by B4 Relay for mrungta@google.com/20260212 with
 auth_id=634
X-Original-From: Mayank Rungta <mrungta@google.com>
Reply-To: mrungta@google.com

This series addresses limitations in the hardlockup detector implementations
and updates the documentation to reflect actual behavior and recent changes.

The changes are structured as follows:

Refactoring (Patch 1)
=====================
Patch 1 refactors watchdog_hardlockup_check() to return early if no
lockup is detected. This reduces the indentation level of the main
logic block, serving as a clean base for the subsequent changes.

Hardlockup Detection Improvements (Patches 2 & 4)
=================================================
The hardlockup detector logic relies on updating saved interrupt counts to
determine if the CPU is making progress.

Patch 1 ensures that the saved interrupt count is updated unconditionally
before checking the "touched" flag. This prevents stale comparisons which
can delay detection. This is a logic fix that ensures the detector remains
accurate even when the watchdog is frequently touched.

Patch 3 improves the Buddy detector's timeliness. The current checking
interval (every 3rd sample) causes high variability in detection time (up
to 24s). This patch changes the Buddy detector to check at every hrtimer
interval (4s) with a missed-interrupt threshold of 3, narrowing the
detection window to a consistent 8-12 second range.

Documentation Updates (Patches 3 & 5)
=====================================
The current documentation does not fully capture the variable nature of
detection latency or the details of the Buddy system.

Patch 3 removes the strict "10 seconds" definition of a hardlockup, which
was misleading given the periodic nature of the detector. It adds a
"Detection Overhead" section to the admin guide, using "Best Case" and
"Worst Case" scenarios to illustrate that detection time can vary
significantly (e.g., ~6s to ~20s).

Patch 5 adds a dedicated section for the Buddy detector, which was previously
undocumented. It details the mechanism, the new timing logic, and known
limitations.

Signed-off-by: Mayank Rungta <mrungta@google.com>
---
Changes in v2:
- Added Patch 1 to refactor watchdog_hardlockup_check() by returning
  early (Suggested by Douglas Anderson)
- Introduced the `watchdog_hardlockup_update_reset()` API (Suggested by
  Petr Mladek)
- Shifted original v1 patches to Patches 2-5 and rebased them on top of
  the new refactoring.
- Link to v1: https://lore.kernel.org/r/20260212-hardlockup-watchdog-fixes-v1-0-745f1dce04c3@google.com

---
Mayank Rungta (5):
      watchdog: Return early in watchdog_hardlockup_check()
      watchdog: Update saved interrupts during check
      doc: watchdog: Clarify hardlockup detection timing
      watchdog/hardlockup: improve buddy system detection timeliness
      doc: watchdog: Document buddy detector

 Documentation/admin-guide/lockup-watchdogs.rst | 132 ++++++++++++++++++----
 include/linux/nmi.h                            |   1 +
 kernel/watchdog.c                              | 148 ++++++++++++++-----------
 kernel/watchdog_buddy.c                        |   9 +-
 4 files changed, 199 insertions(+), 91 deletions(-)
---
base-commit: b4f0dd314b39ea154f62f3bd3115ed0470f9f71e
change-id: 20260211-hardlockup-watchdog-fixes-60317598ac20

Best regards,
-- 
Mayank Rungta <mrungta@google.com>



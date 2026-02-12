Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70AAF4F1;
	Thu, 12 Feb 2026 21:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770930733; cv=none; b=GLNR58RTLwXJy6za99OEzGg2yI+AguX++pZRxV4v9zfkLIyXfVcklE9Cg+2cWIzEgz1mlvLTEMMQE8cdshLVfthmfPWxI8TgJpLOPReQ5GMZZXo5JWiVL/E+nXUc7lefK0Yz0MCbUxFXykK0VHmZNwHYurXN/o3IAeL+YvYw1fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770930733; c=relaxed/simple;
	bh=XizmmF3lxxSnLLMxo8fUj4LGwSFbwQ8dvaEF5IhQtZ8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Uf6amrsjZTbQzmaNqAxnbQUsBbSzYEA/P4T09r7u+67RRFYlACo1VNlj7SQnxORlDGx0y7BcZu7x08intVO3HKO+AVVt+k+FLRKFY+t4jGMBKQFvgfH2zt5EIwAKJW0WEyU/e1LAcgvcIYCPJDS6R3WCd80TnetCquDLoZIPCgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I6Q/9GJS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I6Q/9GJS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35475C4CEF7;
	Thu, 12 Feb 2026 21:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770930733;
	bh=XizmmF3lxxSnLLMxo8fUj4LGwSFbwQ8dvaEF5IhQtZ8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=I6Q/9GJSIQPV5d1lTzf6NPguHl0+rsv1qHNopjPyRqppAx7jRCvEGKCc7t97oNUSr
	 kXSh3beaS7bBtvaYAD/+bLP77y4FUEHNfZSfEePv/u/CTDaQddg0mb/ARJNrGHVPl3
	 hiU0/MCeYZa8XfS3nPhSUGYUc1otveR3Ch60O0OgDIZZWKSYF9Kq9D+S/C7Ioe2vbi
	 nkggz9zJIyXBA2dgnry5yQICWhguGYkNO0XjHlpaQ+U+IarU70rneQVH8EO7tof6kQ
	 fyMNinrnVwvIcs1BH8GHRbVqF5q7c2UcdxM4Ea1+nC8MHq+ArlnnMl4Oswx1nrlKz/
	 DuE1Br+HOfEfQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 281CDEEA852;
	Thu, 12 Feb 2026 21:12:13 +0000 (UTC)
From: Mayank Rungta via B4 Relay <devnull+mrungta.google.com@kernel.org>
Subject: [PATCH 0/4] watchdog/hardlockup: Improvements to hardlockup
 detection and documentation
Date: Thu, 12 Feb 2026 14:12:09 -0700
Message-Id: <20260212-hardlockup-watchdog-fixes-v1-0-745f1dce04c3@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAClCjmkC/x3LywqAIBBA0V+JWTegRs9fiRaiUw5FhvaC6N+Tl
 ofLfSBSYIrQZQ8EOjmyXxNknoFxep0I2SaDEqoSSkp0OtjFm/nY8NK7cdZPOPJNEStRyLpsG22
 UgPRvgf6Q9n543w+BGVJ1awAAAA==
X-Change-ID: 20260211-hardlockup-watchdog-fixes-60317598ac20
To: Jonathan Corbet <corbet@lwn.net>, Petr Mladek <pmladek@suse.com>, 
 Jinchao Wang <wangjinchao600@gmail.com>, 
 Yunhui Cui <cuiyunhui@bytedance.com>, Stephane Eranian <eranian@google.com>, 
 Ian Rogers <irogers@google.com>, Li Huafei <lihuafei1@huawei.com>, 
 Feng Tang <feng.tang@linux.alibaba.com>, 
 Max Kellermann <max.kellermann@ionos.com>, Jonathan Corbet <corbet@lwn.net>, 
 Douglas Anderson <dianders@chromium.org>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Mayank Rungta <mrungta@google.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770930732; l=2564;
 i=mrungta@google.com; s=20260212; h=from:subject:message-id;
 bh=XizmmF3lxxSnLLMxo8fUj4LGwSFbwQ8dvaEF5IhQtZ8=;
 b=9cOvWrv+W8cZ9WoLN1hnGKf3VDxgydz3lULolLYHZAMSoALvOyPsWfpwqqUMuZWDybswdJK2u
 dg23qktnDUnBQ7KS2JPBZeSAU34dqvKH4hKKl7wltlGBaOmWMIYxAzK
X-Developer-Key: i=mrungta@google.com; a=ed25519;
 pk=2Bjwbv/ibL10QnyvK9G7DoKpffXy7z6+M4NawEYgYDI=
X-Endpoint-Received: by B4 Relay for mrungta@google.com/20260212 with
 auth_id=634
X-Original-From: Mayank Rungta <mrungta@google.com>
Reply-To: mrungta@google.com

This series addresses limitations in the hardlockup detector implementations
and updates the documentation to reflect actual behavior and recent changes.

The changes are structured as follows:

Hardlockup Detection Improvements (Patches 1 & 3)
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

Documentation Updates (Patches 2 & 4)
=====================================
The current documentation does not fully capture the variable nature of
detection latency or the details of the Buddy system.

Patch 2 removes the strict "10 seconds" definition of a hardlockup, which
was misleading given the periodic nature of the detector. It adds a
"Detection Overhead" section to the admin guide, using "Best Case" and
"Worst Case" scenarios to illustrate that detection time can vary
significantly (e.g., ~6s to ~20s).

Patch 4 adds a dedicated section for the Buddy detector, which was previously
undocumented. It details the mechanism, the new timing logic, and known
limitations.

Signed-off-by: Mayank Rungta <mrungta@google.com>
---
Mayank Rungta (4):
      watchdog/hardlockup: Always update saved interrupts during check
      doc: watchdog: Clarify hardlockup detection timing
      watchdog/hardlockup: improve buddy system detection timeliness
      doc: watchdog: Document buddy detector

 Documentation/admin-guide/lockup-watchdogs.rst | 132 +++++++++++++++++++++----
 include/linux/nmi.h                            |   1 +
 kernel/watchdog.c                              |  41 ++++++--
 kernel/watchdog_buddy.c                        |   9 +-
 4 files changed, 146 insertions(+), 37 deletions(-)
---
base-commit: 0dddf20b4fd4afd59767acc144ad4da60259f21f
change-id: 20260211-hardlockup-watchdog-fixes-60317598ac20

Best regards,
-- 
Mayank Rungta <mrungta@google.com>



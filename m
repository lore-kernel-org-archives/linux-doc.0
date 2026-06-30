Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5ADD344D8D
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 15:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782832886; cv=none; b=d/IYxjA6XBSTkKje6HmpRgJLyIEzR3dPPvURV9O/Zh91xZkK0qjTlW8RhNkoSlo5OXy+JhvzA9dQlcFwc7NAAWM6N+8NwfZd4MfoNXnjLWHfL+EH0xPOpfvfhrLmeRAC/LcJEBwvx3+mldW/4Lt/zlw2sM06jYpj83Ntb0JEObg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782832886; c=relaxed/simple;
	bh=CMTLgB752m4f1oDZT6YVFJZSXI6YOCgYUjx6JnXzmQY=;
	h=Subject:From:To:Cc:Date:Message-ID:MIME-Version:Content-Type; b=fImt3Tt7Ug1HnG64f7T6shZrwq9Xbhj3lAybjLvm8FGD6pPFdVXUWqBpYAzdRnwq69fxCKE3n0wxaqQAtddbDnARdfccs30x0msI9tba+P8k3nahKjDXWjYq6yNF1g7uqrhURgFBdd13d78Lt+A0PAQLFSW3cydLMrogpQkAXy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LLcd2BKU; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LLcd2BKU"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ca64989e64so570875ad.2
        for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 08:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782832884; x=1783437684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :cc:to:from:subject:from:to:cc:subject:date:message-id:reply-to;
        bh=XL7r3nX+4tuUw824gjUa7PzQu/yc0CIJbCIJiAlasd4=;
        b=LLcd2BKU5HkqISA7GpNv2KS/PLSearmPg+7hAVIdUq9uCONcgMUfnTgCpS4epEzElW
         4/y6tDMAambHL0j34w1nzEWZT+XfISWZpnZ6Q1D9g2XCD/JJIV1R5bg60HPPwJT5JcOI
         bmN7b8fisk7BxLC/tagGqHAfSp2z+sPJ8Q8kCRjjho3ZR2s3TYwOiENQoqBWdo9CBEMt
         l4OH/Z4JNG+yjHnagc0RfmLZJEBxesrg/8D7HQjAJ1GPtOaupnsJQCA00npNaFYqSNsq
         eONEGZ79cYxSh9R5iieOmG5+IhpkTroVOAmvoF6CTHkwnFLydoGINEhcyupbX1J3/Hne
         bwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782832884; x=1783437684;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :cc:to:from:subject:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XL7r3nX+4tuUw824gjUa7PzQu/yc0CIJbCIJiAlasd4=;
        b=f/SzhPPz5xVdjnrXl/J1UVUtzCdhLheJkkR87NLx5z0MeYS0UsgdEm8FOJRzBshGK+
         nauDzBcvBjFMSMHFVip5Z55G/M3WrbfbOPhi4Vfzzol6W5zdEWLqDyl4ZbwWf0fTku/9
         v7L1t1V2GcrX07DMeE59vakmzumdrHHF20DIPUWmdetWavpHYndVLmPfRXxJJWB3M5jC
         w3yYzCcgvRPzUTmNesn+235Ko1VJKMrLO2+dWIyomJkPMI9lW9uB2rkUBVGKOU4+byRK
         sUfLnvxbEoS6ZdUgBuYif038gcJh5NY5J/bFdrVrnjRJQEZBz/QwoLpBSASToGHybPh7
         Z4RA==
X-Gm-Message-State: AOJu0Yy2Xu4YiBuzgTWFOXMRu+OkEvwfwAVAWIp9qHIgxJUgUS8dy5og
	eMsf5C30j+8evoHkcobfejviGoY0MN7QMHKwgqFRkxKPmYXYmml1+DDM
X-Gm-Gg: AfdE7cnCrbfdhFhN8C0KnvSUJlEyMMkJ6eYk2QmNGO48LJLzJQLpRgK/XuHymKKQENj
	Qw974C0ysTZjlPxHfgRSXyjQvBrpst88wBI6Mhn1jntY9TfxOb0fMLJob2n4/6f4ppe0roJGbmT
	QcgTYE1JWH+/qjJsGt32R+1XcHS685Z+AtSh7/3aeGGxGky6DV3T+8pYY1E8pMFmM2mlzzHnQYg
	lrc9EyQugjvKeTPqzC28G6i/B/5NrLKnvZgtqqcqTnqYgkBDXPaX4yIRngxdewP7hoEC7zCY/cW
	ehbJuw3UfZ0FkDDVDZFFrQ1k8DtXOjDys2LTdPR/8kP+WTM/QPd4UgTyP4N1ThWD9tompkV9M7+
	/dGmTGvpJJLecxM4XxqXZvR5hvBG8Ehi35LISPFYGqNX1ZIn6HE7TwPxUXrMCMvrfjK/T0vMUtx
	ezrYcKKkHhqRFqlfrREaZ8AK1Vv8LxUrB6Dr+yFJI7qPs5VcLVNdcs/vcuIww=
X-Received: by 2002:a17:903:9cc:b0:2c9:c083:cd49 with SMTP id d9443c01a7336-2ca5a581aaamr8392545ad.14.1782832884074;
        Tue, 30 Jun 2026 08:21:24 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37c930e8sm16720955ad.37.2026.06.30.08.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 08:21:23 -0700 (PDT)
Subject: [PATCH v4 0/3] mm/hmm: Add mmap lock-drop support for
 userfaultfd-backed mappings
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Liam.Howlett@oracle.com, akpm@linux-foundation.org,
 akpm@linux-foundation.org, david@kernel.org, jgg@ziepe.ca, corbet@lwn.net,
 leon@kernel.org, ljs@kernel.org, mhocko@suse.com, rppt@kernel.org,
 shuah@kernel.org, skhan@linuxfoundation.org, surenb@google.com,
 vbabka@kernel.org, skinsburskii@gmail.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mm@kvack.org
Date: Tue, 30 Jun 2026 08:21:21 -0700
Message-ID: <178283277041.183052.6873574850714079228.stgit@skinsburskii>
User-Agent: StGit/0.19
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

This series extends the HMM framework to support userfaultfd-backed memory
by allowing the mmap read lock to be dropped during hmm_range_fault().

Some page fault handlers — most notably userfaultfd — require the mmap lock
to be released so that userspace can resolve the fault. The current HMM
interface never sets FAULT_FLAG_ALLOW_RETRY, making it impossible to fault
in pages from userfaultfd-registered regions.

This series follows the established int *locked pattern from
get_user_pages_remote() in mm/gup.c. A new entry point,
hmm_range_fault_unlockable(), accepts an int *locked parameter. When the
mmap lock is dropped during fault resolution (VM_FAULT_RETRY or
VM_FAULT_COMPLETED), the function returns 0 with *locked = 0, signalling
the caller to restart its walk. The existing hmm_range_fault() is
refactored into a thin wrapper that passes NULL, preserving current
behavior for all existing callers.

Faulting hugetlb pages on the unlockable path is not supported because
walk_hugetlb_range() unconditionally holds and releases
hugetlb_vma_lock_read across the callback; if the mmap lock is dropped
inside the callback, the VMA may be freed before the walk framework's
unlock. Hugetlb pages already present in page tables are handled normally.
Possible approaches to lift this limitation are documented in
Documentation/mm/hmm.rst.

Changes in v4:
 - Rebased on 7.2-rc1

Changes in v3:
 - Return -EFAULT from dmirror_fault_unlockable() when the mirrored mm can
   no longer be pinned.
 - Add an eventfd stop signal for the userfaultfd handler thread to avoid
   waiting for the poll timeout on successful test completion.


Changes in v2:

 - Split into a preparatory refactor (new patch 1) that moves
   handle_mm_fault() out of the walk callbacks, plus a smaller feature
   patch on top.  Suggested by David Hildenbrand.
 - Hugetlb regions are now supported on the unlockable path; the v1
   -EFAULT short-circuit and the hugetlb_vma_lock_read drop/retake
   dance are gone.
 - Distinct internal sentinels for "needs fault" (HMM_FAULT_PENDING)
   and "lock dropped" (HMM_FAULT_UNLOCKED).
 - Outer loop now re-walks after a successful internal fault so the
   faulted pfns end up in range->hmm_pfns.
 - Kernel-doc on hmm_range_fault_unlockable() and the
   Documentation/mm/hmm.rst example match the implementation.
 - Dropped the mshv driver conversion (v1 patch 2); will post
   separately.
 - Selftest converted to drive the path through test_hmm with a
   userfaultfd handler (new HMM_DMIRROR_READ_UNLOCKABLE ioctl).


---

Stanislav Kinsburskii (3):
      mm/hmm: move page fault handling out of walk callbacks
      mm/hmm: add hmm_range_fault_unlockable() for mmap lock-drop support
      selftests/mm: add userfaultfd test for HMM unlockable path


 Documentation/mm/hmm.rst               |   62 +++++++++++
 include/linux/hmm.h                    |    1 
 lib/test_hmm.c                         |  122 +++++++++++++++++++++
 lib/test_hmm_uapi.h                    |    1 
 mm/hmm.c                               |  187 ++++++++++++++++++++++++--------
 tools/testing/selftests/mm/hmm-tests.c |  149 +++++++++++++++++++++++++
 6 files changed, 478 insertions(+), 44 deletions(-)


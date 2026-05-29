Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0426B22A80D;
	Fri, 29 May 2026 21:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780091594; cv=none; b=E7uJrwrf4ZyuSOa1ka59XeuJ2cKn8bUYoK6TGJjb1nwXGPC5tL3ruo3N/m/fgvLMWB5HFhKxkS9GtzvDU4GWX44Fxy9XRJIq4aq6E9Y/ACUWhGzPSN8mXl6H1AhJqH89jyFCABciaMQ8mSymIvN/j5Oe4Y8StoN8DtHi/t/2kmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780091594; c=relaxed/simple;
	bh=5EHEbCQeX7/qQrjklBhLgsdPltKNNhLX/Th8CE3EEj0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=k6XpNvWEuQGJPexlBprZTb4kMfvEBV4QbD2G/i2KlOEnFMJC/ZTJM+2LzS/2t1VT14nSynAHApvKvDT0/PND6pigRS7+wYz6VVTc9oQZ75sRQeNCZ41bS5oHHn+3ERVMzCpLZzj31rGrL0Wecsrk6c/bXwVlueicBqWLgS6IiNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ktSjYOzl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ktSjYOzl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 619531F00893;
	Fri, 29 May 2026 21:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780091593;
	bh=M8sP0nKdhFiScfx1hIMkuFsQE9ZhPuCAyZmUu8LHU+E=;
	h=From:To:Cc:Subject:Date;
	b=ktSjYOzl4qU08K2om7yNm+VDaUE7m37+T7Mxz9ynh3Wha4Uk/uLPpWr8ORUxWS1BU
	 RfJ2nzrE6no2JuN5j6TbCkWYVtLNgO9RDZ7HSKdhaqtc1JnCprwdwb7O4A2eraNgNr
	 fSITmfSIr2rFHQzzL1udEk2zvH5HIZkrqB6nx+wVz8ZTeOp1YfLXb5wjFQKfQAGDCx
	 HntVZKc+q1Key6D5escXQ6DRUa6FvEvTx4eT3XTROUqBZ/VqCvvU7ucENSzy2ThuR1
	 fNcB2od22EiN5PDRgtuVK+c/zi0BL5wXlgwECo0XLQN8GonRVqdw7Gj9Yxsen51f9b
	 9Y2W9iZXBRKsg==
From: Philipp Stanner <phasta@kernel.org>
To: avid Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	dakr@kernel.org,
	christian.koenig@amd.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH] Documentation: drm: Add entry for removing spsc_queue to TODO list
Date: Fri, 29 May 2026 23:52:07 +0200
Message-ID: <20260529215207.115513-2-phasta@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

drm_sched contains a lockless queue (spsc_queue) that seems to be
useless and potentially unsound.

Add a TODO list entry for replacing spsc_queue with a locked list.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 Documentation/gpu/todo.rst | 41 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index cdddf8db35f5..87e082b0eb48 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -948,6 +948,47 @@ Contact: Philipp Stanner <phasta@kernel.org>
 
 Level: Intermediate
 
+Replace the lockless queue with a locked list
+---------------------------------------------
+
+drm_sched is the only user in the entire kernel of a special lockless queue, the
+spsc_queue. This queue utilizes:
+
+- preempt_disable()
+- atomic instructions
+- memory barriers
+- ACCESS_ONCE()
+
+whereas a conventional spinlock utilizes:
+
+- preempt_disable()
+- 1 atomic instruction for taking / releasing the lock
+- memory barriers
+
+Moreover, drm_sched_entity_push_job(), the only user of spsc_queue_push(), has
+to take a lock in some situations anyways and calls to it are often serialized
+with a driver lock.
+
+It is, thus, highly questionable whether the lockless queue grants any advantage
+at all. Considering that its internals are not well documented and its correctness
+is not formally proven, it seems desirable to replace the queue with a mere list
+or hlist that is protected by a spinlock.
+
+Tasks:
+
+- Replace the spsc_queue in drm/sched (and those who might access the scheduler's
+  internal queue) with a spinlock + (h)list.
+- Ideally, check with some micro benchmarks and real world tests (preferably
+  with amdgpu) for relevant performance regressions.
+- Remove the spsc_queue from the kernel altogether.
+
+Contact:
+
+- Philipp Stanner <phasta@kernel.org>
+- Christian König <christian.koenig@amd.com>
+
+Level: Beginner
+
 Outside DRM
 ===========
 
-- 
2.54.0


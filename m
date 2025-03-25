Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205721F463F
	for <linux-doc@vger.kernel.org>; Tue, 25 Mar 2025 17:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742923620; cv=none; b=Ujbi2IKjRS47ysp9EtHnPxHGKzkH4wHqwhqp5qUXg2csVrxA1HHJZGPhHNmLyxeOMy+dgaA8m6FgtY2p3lo+qZ+tOfAOKdZh0ovHI9feQiD8KoImco8HRuVARYuFgosg5TqOESO7Jdo7c0loZqJV46UL8XT8aVvuF5nvonvEjSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742923620; c=relaxed/simple;
	bh=/y7lDbhWEeCOfDKCk2aLYRdTJIUGbyw+5R1P9AO87SE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kzAE8ZsUd8/gLPY4f1ykf9xcZeebWjCrYrvBLyEqsdCK/rdT2soRJk4FN83dmo7iV2gWLEOW9jtEXt5ZJL/ePav/P7yISfBcTOfzgHmW9MP2AbQdrWpaInqPdbiK5Cf2bn4Rhj6Q34sdFLqNqJyO0Fho8nq0t3GY/QVlU8ztpQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=fGEGSKT6; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="fGEGSKT6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ZVmZkjekO9+uWiqt3jqrwTn6BAkroCefAs+ZztmYJ8A=; b=fGEGSKT6NH1kMmIfRGTCrgKRzb
	2qC/TUDIjf0lVDGkTJ4liSvbH4ZE3LcWnSQ+g4CEs8WcIE9KdHVy+lfG3RDiGJv5/o8+8+Jlm5JnQ
	xrIY3MUlqaCLonwV2XDAQXjvpAFJgVUfGOK1huOplyUhrZdGpU3rMtJ1KeoZ2XV8vXb0wBysdeIyc
	H5FfpJCzURx4UGHYcbgZn7AWkDBWw+thBpgPZXjDTuybmkpcATRg9aIDOjKyQ1h6yuA4slL+LENF6
	uagbH2t8x9iv4ub1qqpePctvQuW8Ag48sUz4gERSejHjZaGfC8y8WvVTXptJNsd/aE/YJS8gPD/CF
	AuVmNNEA==;
Received: from d162-157-58-14.abhsia.telus.net ([162.157.58.14] helo=maloca.lan)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tx83B-006FdA-GG; Tue, 25 Mar 2025 18:26:53 +0100
From: Rodrigo Siqueira <siqueira@igalia.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?=27Christian=20K=C3=B6nig=27?= <christian.koenig@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Melissa Wen <mwen@igalia.com>,
	=?UTF-8?q?=27Andr=C3=A9=20Almeida=27?= <andrealmeid@igalia.com>,
	=?UTF-8?q?=27Timur=20Krist=C3=B3f=27?= <timur.kristof@gmail.com>
Cc: amd-gfx@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	kernel-dev@igalia.com,
	Rodrigo Siqueira <siqueira@igalia.com>
Subject: [PATCH 6/6] Documentation/gpu: Add an intro about MES
Date: Tue, 25 Mar 2025 11:18:47 -0600
Message-ID: <20250325172623.225901-7-siqueira@igalia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325172623.225901-1-siqueira@igalia.com>
References: <20250325172623.225901-1-siqueira@igalia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MES is an important firmware that lacks some essential documentation.
This commit introduces an overview of it and how it works.

Signed-off-by: Rodrigo Siqueira <siqueira@igalia.com>
---
 Documentation/gpu/amdgpu/driver-core.rst |  2 ++
 Documentation/gpu/amdgpu/gc/index.rst    |  7 ++++-
 Documentation/gpu/amdgpu/gc/mes.rst      | 38 ++++++++++++++++++++++++
 3 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/gpu/amdgpu/gc/mes.rst

diff --git a/Documentation/gpu/amdgpu/driver-core.rst b/Documentation/gpu/amdgpu/driver-core.rst
index 2af1e919d76a..f39077c44799 100644
--- a/Documentation/gpu/amdgpu/driver-core.rst
+++ b/Documentation/gpu/amdgpu/driver-core.rst
@@ -77,6 +77,8 @@ VCN (Video Core Next)
     decode.  It's exposed to userspace for user mode drivers (VA-API,
     OpenMAX, etc.)
 
+.. _pipes-and-queues-description:
+
 GFX, Compute, and SDMA Overall Behavior
 =======================================
 
diff --git a/Documentation/gpu/amdgpu/gc/index.rst b/Documentation/gpu/amdgpu/gc/index.rst
index f8128cca7028..b115d5883959 100644
--- a/Documentation/gpu/amdgpu/gc/index.rst
+++ b/Documentation/gpu/amdgpu/gc/index.rst
@@ -39,10 +39,15 @@ CP (Command Processor)
         GFX/compute engine.
 
     MES (MicroEngine Scheduler)
-        This is the engine for managing queues.
+        This is the engine for managing queues. For more details check
+        :ref:`MicroEngine Scheduler (MES) <amdgpu-mes>`.
 
 RLC (RunList Controller)
     This is another microcontroller in the GFX/Compute engine. It handles
     power management related functionality within the GFX/Compute engine.
     The name is a vestige of old hardware where it was originally added
     and doesn't really have much relation to what the engine does now.
+
+.. toctree::
+
+   mes.rst
diff --git a/Documentation/gpu/amdgpu/gc/mes.rst b/Documentation/gpu/amdgpu/gc/mes.rst
new file mode 100644
index 000000000000..b99eb211b179
--- /dev/null
+++ b/Documentation/gpu/amdgpu/gc/mes.rst
@@ -0,0 +1,38 @@
+.. _amdgpu-mes:
+
+=============================
+ MicroEngine Scheduler (MES)
+=============================
+
+.. note::
+   Queue and ring buffer are used as a synonymous.
+
+.. note::
+   This section assumes that you are familiar with the concept of Pipes, Queues, and GC.
+   If not, check :ref:`GFX, Compute, and SDMA Overall Behavior<pipes-and-queues-description>`
+   and :ref:`drm/amdgpu - Graphics and Compute (GC) <amdgpu-gc>`.
+
+Every GFX has a pipe component with one or more hardware queues. Pipes can
+switch between queues depending on certain conditions, and one of the
+components that can request a queue switch to a pipe is the MicroEngine
+Scheduler (MES). Whenever the driver is initialized, it creates one MQD per
+hardware queue, and then the MQDs are handed to the MES firmware for mapping
+to:
+
+1. Kernel Queues (legacy): This queue is statically mapped to HQDs and never
+   preempted. Even though this is a legacy feature, it is the current default, and
+   most existing hardware supports it. When an application submits work to the
+   kernel driver, it submits all of the application command buffers to the kernel
+   queues. The CS IOCTL takes the command buffer from the applications and
+   schedules them on the kernel queue.
+
+2. User Queues: These queues are dynamically mapped to the HQDs. Regarding the
+   utilization of User Queues, the userspace application will create its user
+   queues and submit work directly to its user queues with no need to IOCTL for
+   each submission and no need to share a single kernel queue.
+
+In terms of User Queues, MES can dynamically map them to the HQD. If there are
+more MQDs than HQDs, the MES firmware will preempt other user queues to make
+sure each queues get a time slice; in other words, MES is a microcontroller
+that handles the mapping and unmapping of MQDs into HQDs, as well as the
+priorities and oversubscription of MQDs.
-- 
2.49.0


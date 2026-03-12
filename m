Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935D83C2794
	for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 10:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773309869; cv=none; b=j/6bgmKYMGHzYAHYlqfV1DujcUCAzYWuG8MrV4kxphmQK1kUBBWc0YeTaTgchXrUAzabbtgvnp4JhiEKua/NfaoVkjrjtjYQ0dASfuL/2anNoeXMl28DPwr2XErMJIBRpbNTPrcfuodqXIBGfBQHkW+S75BBLakgLygDEQ85eEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773309869; c=relaxed/simple;
	bh=suAlp0+6vIiTYE/DszDuVSfJ/B/GhkXRhq5R0j4plyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SYBDywQg9vqKeYChw7+sTN/OJF21zlGGLGRS68Ql/cIu7WSUvkyomA7ZkY6+XetMoo6tY6/TjSSETrWnxke8UAAJm6r47rdyMqv6pnVytDg8a+6mKkfYV+zaNbzYAbZqgcTn+1EKGiRRLrg5tvcuw72yq5I98+Uc4P6zZX6Chgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=Qj8Mfr9U; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="Qj8Mfr9U"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439a89b6fd0so758526f8f.2
        for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 03:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1773309864; x=1773914664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T3g0UTN2sEfKe2VfEgfWZcWamkZLOLTyGyEUUMk8B8w=;
        b=Qj8Mfr9UwfhRSIgZUQHCZrKZIc0JzTFDaGraVvYFVfiMJeR8SifuCWCbXYITEiPNQS
         0DVGihRcwAKCf9yQciNxuEBl0hi9rx9W5AfHTg5G2AgxZbtwux/rXKdserotbDESUpcc
         hL4gfiQ7Ua6vVNv+5VdsZ+vPgedQhBmJ+BWMC2mFYOnMh3Pwsc1OLa5gAAMK6DMZPi1d
         u5AVVnOMBRnT7hBZip+cSKjEYlAVLUECpjQgReDTnKyx//W2UcST2Ye4czr7hXc+/C+7
         zgDfE9/lR2BDsNGQWPDc/eeb2HSARLJjToo8NDIdosm4igl4SY0zP61MCRbG0o7RTFmT
         8ljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773309864; x=1773914664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T3g0UTN2sEfKe2VfEgfWZcWamkZLOLTyGyEUUMk8B8w=;
        b=weyHEdTPGf9eIf8fUSrDZLQ4oHut9P3PZf1irsOtbeCODYyTie3e1UXw7uCMEJjLDv
         w0uQOcXJx3tJPNoDWXPQe+j5VIhIuHqnbe0vfzFDfxsAbXvqdo76qDqb+cCANFWNb++I
         OHywSBBvsvpBHRBGuX1CNyQkhG2DI0VPUduAJsFvYHEya0Amaok2VjxF0v7NGWhbe8b7
         te12qKiG3TKIHssciroZi2Am8c6z6MWpIVQkHyJYO4essOQVL6SqdjhOqwavvZR3vsc+
         wIUafigja/H4xVh4LZmGaIUwX7rRW1hY9aCD5vp0VWqLFFix0tiIlbIZBg+FcEUMQfth
         0sVA==
X-Forwarded-Encrypted: i=1; AJvYcCUq0E5CSF/p2gavqVU4JuMqOuUonqOXC2DbjOPci6u+G4kluOoHy4H69J+U4AGPdXBmvhDmwMdjLC0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwYsCZrA8N05rbmBzgPovfIZ+Rjr42E06vtRanH2dhEa+pyqB8
	tDh5ly8IoyI0qrYsvie3R/igxlUC2X933PvoyD2aZo3GWQcPYVnMl3HTOSwtPnOuuD8=
X-Gm-Gg: ATEYQzyMDxjKzJqHcz2p9b35XIJEIEz+cf8J5yMvOJA6CzpSwX7FFtlOVeWPGyy50zF
	VQa1HkpM7Ik3154Ixf4Ik/cCov0FmvNUvu+ul0qCKBcs/trzsTt9n2qjYRGasL8ICgX4sVb6rIf
	saXxFIA2HICSEdfsOueiHZ7TA4Aok2xN9A8qz2w+ko2190Vdy/0tCo8n9uKVLccbIK4JZn1+7jw
	2eWbj9lUDj09B3rg85+I47qhqRXirqs6esf7z1ZXRD2ems7IwDntmPP+K2fczjnTecSVTxFLj/I
	hsdc1VAX5nd2o8eDnKr9ev4w23+/aAHCzSUiVUz+uYD95kanjqm55dFDTlSXtSRjVpGUB/8LI4z
	ZegT+y+zC81+lcZRCz44RR72EXLtPIed9SrsEokBvIr/afOpeD3UGDolu3bl5EJR3SybGkKbpCK
	laLS813gIGTSmXmw==
X-Received: by 2002:a05:6000:40db:b0:439:af81:1b2f with SMTP id ffacd0b85a97d-439f821fa57mr10881376f8f.46.1773309863778;
        Thu, 12 Mar 2026 03:04:23 -0700 (PDT)
Received: from localhost ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1b22e7sm7506007f8f.16.2026.03.12.03.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 03:04:23 -0700 (PDT)
From: Jiri Pirko <jiri@resnulli.us>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	donald.hunter@gmail.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	saeedm@nvidia.com,
	leon@kernel.org,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	przemyslaw.kitszel@intel.com,
	mschmidt@redhat.com,
	andrew+netdev@lunn.ch,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	chuck.lever@oracle.com,
	matttbe@kernel.org,
	cjubran@nvidia.com,
	daniel.zahka@gmail.com,
	linux-doc@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH net-next v4 12/13] documentation: networking: add shared devlink documentation
Date: Thu, 12 Mar 2026 11:04:06 +0100
Message-ID: <20260312100407.551173-13-jiri@resnulli.us>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260312100407.551173-1-jiri@resnulli.us>
References: <20260312100407.551173-1-jiri@resnulli.us>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jiri Pirko <jiri@nvidia.com>

Document shared devlink instances for multiple PFs on the same chip.

Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
v2->v3:
- describing 2 models of use os shared device, with and without per-PF
  instances
v1->v2:
- fixed number of "="'s
---
 .../networking/devlink/devlink-shared.rst     | 97 +++++++++++++++++++
 Documentation/networking/devlink/index.rst    |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 Documentation/networking/devlink/devlink-shared.rst

diff --git a/Documentation/networking/devlink/devlink-shared.rst b/Documentation/networking/devlink/devlink-shared.rst
new file mode 100644
index 000000000000..16bf6a7d25d9
--- /dev/null
+++ b/Documentation/networking/devlink/devlink-shared.rst
@@ -0,0 +1,97 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+========================
+Devlink Shared Instances
+========================
+
+Overview
+========
+
+Shared devlink instances allow multiple physical functions (PFs) on the same
+chip to share a devlink instance for chip-wide operations.
+
+Multiple PFs may reside on the same physical chip, running a single firmware.
+Some of the resources and configurations may be shared among these PFs. The
+shared devlink instance provides an object to pin configuration knobs on.
+
+There are two possible usage models:
+
+1. The shared devlink instance is used alongside individual PF devlink
+   instances, providing chip-wide configuration in addition to per-PF
+   configuration.
+2. The shared devlink instance is the only devlink instance, without
+   per-PF instances.
+
+It is up to the driver to decide which usage model to use.
+
+The shared devlink instance is not backed by any struct *device*.
+
+Implementation
+==============
+
+Architecture
+------------
+
+The implementation uses:
+
+* **Chip identification**: PFs are grouped by chip using a driver-specific identifier
+* **Shared instance management**: Global list of shared instances with reference counting
+
+API Functions
+-------------
+
+The following functions are provided for managing shared devlink instances:
+
+* ``devlink_shd_get()``: Get or create a shared devlink instance identified by a string ID
+* ``devlink_shd_put()``: Release a reference on a shared devlink instance
+* ``devlink_shd_get_priv()``: Get private data from shared devlink instance
+
+Initialization Flow
+-------------------
+
+1. **PF calls shared devlink init** during driver probe
+2. **Chip identification** using driver-specific method to determine device identity
+3. **Get or create shared instance** using ``devlink_shd_get()``:
+
+   * The function looks up existing instance by identifier
+   * If none exists, creates new instance:
+     - Allocates and registers devlink instance
+     - Adds to global shared instances list
+     - Increments reference count
+
+4. **Set nested devlink instance** for the PF devlink instance using
+   ``devl_nested_devlink_set()`` before registering the PF devlink instance
+
+Cleanup Flow
+------------
+
+1. **Cleanup** when PF is removed
+2. **Call** ``devlink_shd_put()`` to release reference (decrements reference count)
+3. **Shared instance is automatically destroyed** when the last PF removes (reference count reaches zero)
+
+Chip Identification
+-------------------
+
+PFs belonging to the same chip are identified using a driver-specific method.
+The driver is free to choose any identifier that is suitable for determining
+whether two PFs are part of the same device. Examples include:
+
+* **PCI VPD serial numbers**: Extract from PCI VPD
+* **Device tree properties**: Read chip identifier from device tree
+* **Other hardware-specific identifiers**: Any unique identifier that groups PFs by chip
+
+Locking
+-------
+
+A global mutex (``shd_mutex``) protects the shared instances list during registration/deregistration.
+
+Similarly to other nested devlink instance relationships, devlink lock of
+the shared instance should be always taken after the devlink lock of PF.
+
+Reference Counting
+------------------
+
+Each shared devlink instance maintains a reference count (``refcount_t refcount``).
+The reference count is incremented when ``devlink_shd_get()`` is called and decremented
+when ``devlink_shd_put()`` is called. When the reference count reaches zero, the shared
+instance is automatically destroyed.
diff --git a/Documentation/networking/devlink/index.rst b/Documentation/networking/devlink/index.rst
index 35b12a2bfeba..f7ba7dcf477d 100644
--- a/Documentation/networking/devlink/index.rst
+++ b/Documentation/networking/devlink/index.rst
@@ -68,6 +68,7 @@ general.
    devlink-resource
    devlink-selftests
    devlink-trap
+   devlink-shared
 
 Driver-specific documentation
 -----------------------------
-- 
2.51.1


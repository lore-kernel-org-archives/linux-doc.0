Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE59126F0A
	for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 00:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745971958; cv=none; b=SlHcaEzIBNxk2OYI1MEc5YN/iQmecMVPzD4mdO1nHpF90sIhdwWDGVmNYh+AbtbS4fUytuQ0Riz1uDa9TQ1vC4XgGHHsxu12yivp/nO0Fa1150w9rio8YkCOfKhIBJqoXqKZ4tbe2lELDrGm6lrW+v34C54LaHzuwAnjooVc8sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745971958; c=relaxed/simple;
	bh=qJvAeC9PJ0yrfTjybs1QJ63QO49Ry6kSSEW1PYb/KCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ltBQBEHHaUJLLyOK8IWhdWDa+VcXwwY1y/ieFF9MPX9NW1iNKhSfAPFKLNp7dCWPiYteXu7T8rGAq968h97obP0xdtgsj7dZzrjwzsYYmPWgusyPloJ0YxUtkqd7eRKTNaBs81CjZHfKO3ujMSdLkbodUedjPwsbo+MP1bH/xtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=B5mR4VJV; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="B5mR4VJV"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-476ae781d21so78558411cf.3
        for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 17:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1745971954; x=1746576754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1s5gcOP/bkzD9yLDRr1nu8e/0M24YgRWFUxLhi7LbcA=;
        b=B5mR4VJVK5aZiN3MIE2zDyFkz1/I+UUKDVZ/Jglqg0mM2oAo1Fj3YBFchXnDN2DD90
         OdjBNFWqkeyfTE/oNh20SSTk0CiaYHL7y8K2JXXk5JuDo6ovGpN7BxM0uQdRte6NK/Nz
         koFYtJMacdZ7yVXB35IyAAICy6HRkXUrYt+ZOed6L5BXKnw1z0vwo5/7R1LgLcN4Dmi8
         6/wnPdbv90D4Xt+9X8HB/s7BdpFDevdvWGMT2c/i2bQkirYEK/FnTj2X5QTUGCa+u7q5
         fyykCrkTZmhTsV6vTlxLZq3Oo3GEVsD19y5FHkNZpke2W4Rbi8foDQfvnOca5xhiSN3u
         YXpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745971954; x=1746576754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1s5gcOP/bkzD9yLDRr1nu8e/0M24YgRWFUxLhi7LbcA=;
        b=bfcArc8VHIXp0OUMjGYqr1ubxBp1dIl7hrfLgXlqTDwXMU+pPcNc7HAiIaKJ9UmMw5
         MBDb8t3uR+uljRompmBFmewu+jCd41jAX50SrG6RcgA7k6ye4Y1Pu5hl8ovrdJ8cUgch
         GNuAVLXkUaredpurrMmLjT7tAFWFjgI2lht5DBmlT9GxmCllzYqyK03oV9Kg3FUVYiqt
         v92Dy3sM/dPl6RyFWszPBz1V39Vrc8IjhMG1zZLpmjF1jdeU1krp6+7h9Kx6es6CmZo8
         ojenOuDyyCczZn+4imAge3wE+slHRUtxZ3sc9k4ez+z34Ssobg5CPn1OaS1bkuNE9fUT
         Hlhw==
X-Gm-Message-State: AOJu0YyBgW043osywmSA1orvoEH69sLq1PQHAoG1kpwApbOJm+VeU0G7
	uDjDj5UVySIhJyjkUNO0r0aaY4Q8TiRuDgzwWF0CPdov+VTfa0645953bEsZk/0=
X-Gm-Gg: ASbGncuPHuxHwNHBduY6HDaGAfyjIamnTs2NHAvidunoGf4jsgHpStvwo7SLRnY0CBH
	e6F5i6cMi0RdU1/oHV+FfuCxtD9FTb+8tsbbAN4UKKVT1EhABojWlzdJkNYj3RkG8e6qFX0Dsbd
	hYAOIFLIhWyJrSj9F3ff/00h50VhE1+mWQ63RH20naw7aC1hPpgYdkk5Zqu5SXExHviuouBQZh+
	YrITOg9pqAxWoIuqFnmu9JyG78OUEQeGnwEQIoL3n9KTNxR/j+x3Fs8FjYEmCQTzR9rH6+T0k8Y
	8gVbVSFwkPx4uLjaAlv54k6LmFVbE8cvfhrtw1jw+/zJycvXPgO9AOFvuj2wwM6RS4ebtJBsSOq
	mOzTEcftVp+PsJiyrKML5fVz45V0m
X-Google-Smtp-Source: AGHT+IEKGR2FHHd25LiYQesqqVIWnTFxWxv53o72vrO3uUoe9coBak8e3HrW/K1B4aZLE7+Z/ygLCA==
X-Received: by 2002:ac8:6f10:0:b0:476:79d2:af57 with SMTP id d75a77b69052e-489e4a8942amr9867851cf.22.1745971954008;
        Tue, 29 Apr 2025 17:12:34 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47e9f7a820esm87634411cf.41.2025.04.29.17.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:12:33 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-cxl@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	dave@stgolabs.net,
	jonathan.cameron@huawei.com,
	dave.jiang@intel.com,
	alison.schofield@intel.com,
	vishal.l.verma@intel.com,
	ira.weiny@intel.com,
	dan.j.williams@intel.com,
	corbet@lwn.net
Subject: [RFC PATCH 01/17] cxl: update documentation structure in prep for new docs
Date: Tue, 29 Apr 2025 20:12:08 -0400
Message-ID: <20250430001224.1028656-2-gourry@gourry.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430001224.1028656-1-gourry@gourry.net>
References: <20250430001224.1028656-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Restructure the cxl folder to make adding docs per-page cleaner.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 .../theory-of-operation.rst}                  |  0
 Documentation/driver-api/cxl/index.rst        | 22 ++++++++++++++++---
 .../cxl/{ => linux}/access-coordinates.rst    |  0
 3 files changed, 19 insertions(+), 3 deletions(-)
 rename Documentation/driver-api/cxl/{memory-devices.rst => devices/theory-of-operation.rst} (100%)
 rename Documentation/driver-api/cxl/{ => linux}/access-coordinates.rst (100%)

diff --git a/Documentation/driver-api/cxl/memory-devices.rst b/Documentation/driver-api/cxl/devices/theory-of-operation.rst
similarity index 100%
rename from Documentation/driver-api/cxl/memory-devices.rst
rename to Documentation/driver-api/cxl/devices/theory-of-operation.rst
diff --git a/Documentation/driver-api/cxl/index.rst b/Documentation/driver-api/cxl/index.rst
index 965ba90e8fb7..dfc0a4aa9003 100644
--- a/Documentation/driver-api/cxl/index.rst
+++ b/Documentation/driver-api/cxl/index.rst
@@ -4,12 +4,28 @@
 Compute Express Link
 ====================
 
+CXL device configuration has a complex handoff between platform (Hardware,
+BIOS, EFI), OS (early boot, core kernel, driver), and user policy decisions
+that have impacts on each other.  The docs here break up configurations steps.
+
 .. toctree::
    :maxdepth: 1
+   :caption: Overview
 
-   memory-devices
-   access-coordinates
-
+   self
    maturity-map
 
+.. toctree::
+   :maxdepth: 2
+   :caption: Device Reference
+
+   devices/theory-of-operation
+
+.. toctree::
+   :maxdepth: 1
+   :caption: Linux Kernel Configuration
+
+   linux/access-coordinates
+
+
 .. only::  subproject and html
diff --git a/Documentation/driver-api/cxl/access-coordinates.rst b/Documentation/driver-api/cxl/linux/access-coordinates.rst
similarity index 100%
rename from Documentation/driver-api/cxl/access-coordinates.rst
rename to Documentation/driver-api/cxl/linux/access-coordinates.rst
-- 
2.49.0


Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702351CF7AB
	for <linux-doc@vger.kernel.org>; Fri,  1 Nov 2024 19:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730488329; cv=none; b=LMk53YSuahED9NpXwSjcxSe7ZhRzgrBu5cefvln5Z4q8qdrZhihQK0EDWSHVpMXTVRs4VazLbGylFvygmEDaJ/T/V27uMvdbwAcD+IrVpDWQlpPepr2DyS+gDdiLsnRfg6scyxUMupNzEAKdez66qsPb5kxgwTYYp5M9/bDiEuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730488329; c=relaxed/simple;
	bh=sjWLwU72+TM3wrbCnZk1mLiwGKN++8XAP8RRimOMboo=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Cc:Content-Type; b=oHvhVHXNgDvuXTGpAEPstXZLHtFvicehyIM1en1t/0r/8U1AHANmPnDFAya3bxJ5tRKwcOTKl1tubRmmU2fjQn4erU1tiVb/WAily4MXYI4ZCsJt7GmMOL/8UzhQOZUpNKJy4khccuH7yb5jVeeHTJO4mSO3SFggd4eabB7Lekg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t9xBr4fp; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t9xBr4fp"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e370d76c15so49465357b3.2
        for <linux-doc@vger.kernel.org>; Fri, 01 Nov 2024 12:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730488326; x=1731093126; darn=vger.kernel.org;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ohnZM44rwMZlspoSV7nexQOFx9fd9I0RoLZU+lRn4Jw=;
        b=t9xBr4fp8xOO4y9DFYzoVTUoOyTBVwH2aDwjhEWP8CKvn+GLWiwi3i7YUr/QJFQXOO
         KNHhlsrEs6HuJEqvAlKpQNgFe2uwPMATuDka+VGvViB0Hz6uiYYGYKIYKSJMHvcrPyyC
         7qdzuYgO0ZFYLD39/Aro6lmP2bh3j6cApQIFnOaiTC6ngYIJKQzxKhA3uGBgGiIPsHjH
         ON14E85uokgP33WI5STz1mAdag4Po6YZsZnZKOv6H1HS/6ulGH/P40y6stmj+h4OXoUJ
         AmjpsVLvYeO7SWZOH7DuJ+wxeYwbOfbdzMvMAZyYCiqERaeu+oERwFen0YmtzckNZr0/
         YMKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730488326; x=1731093126;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ohnZM44rwMZlspoSV7nexQOFx9fd9I0RoLZU+lRn4Jw=;
        b=eCkggNLXAbkqPvxq+LbbNUY5c59N6uzJ1QZnc0Bd9WgNhxXsPjaPrNTLwiuWQcMlpO
         8+NtCjL/IvnyoilKxo/+bz4shc86XN74eMcNeD82UQW+imzvTlZMyu/xj0zGwRIchdGF
         PXiqdFK3iBvwBlqvY1T/yi+MWbjsGZ/gKCBMGTL95qKP+J+iPCjxySJnpv3EbMrdkVeV
         ro6knA/HSppbOXqHNpovD3JIC1zvLavtdl590OjEL3F25rKC9VtKpkK8BQmuYxoM0mfv
         lwjm2fdqlmRUYV3aFOzadLyoTwj853yfqtcPZMle9ib6jUEH1rQNoOpc+rIGe27Sk9um
         oWDA==
X-Forwarded-Encrypted: i=1; AJvYcCWydWoHLi2Zqpaxm1q0tDXvEqa+FCO3fVo4AylVCwH61GRur7eUGh0/rPhX5hbbuREdveQ1K+z67Hg=@vger.kernel.org
X-Gm-Message-State: AOJu0YysSu3sorcbw0TsiN/0IA9CLmpo44qTn2pyO1Y5GmttrcT0tO2E
	OguMOGSxmAR0Qk9RJw0dDyZhp5HisvMDcrqJddzvR7vNBYYDmhz2cl5TkcdsbqA3GTnH0jOwEhS
	0B9uagg==
X-Google-Smtp-Source: AGHT+IEuIJAQ2wb2B6bc2za+FDb03I7t2GB4uUnxnQv8Bdi+HQoDpYmPSz/8C2693i9quEq0xJ1kmlxHgSAn
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:f2e6:5ab5:a95f:35cb])
 (user=irogers job=sendgmr) by 2002:a05:690c:6407:b0:6e3:8562:ffa with SMTP id
 00721157ae682-6e9d8b5f046mr14987157b3.5.1730488326506; Fri, 01 Nov 2024
 12:12:06 -0700 (PDT)
Date: Fri,  1 Nov 2024 12:11:56 -0700
In-Reply-To: <20241101191156.1272730-1-irogers@google.com>
Message-Id: <20241101191156.1272730-4-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241101191156.1272730-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
Subject: [PATCH v3 4/4] proc_pid_fdinfo.5: Add DRM subsection
From: Ian Rogers <irogers@google.com>
To: Alejandro Colomar <alx@kernel.org>, "G . Branden Robinson" <g.branden.robinson@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-man@vger.kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Add description of DRM fdinfo information based on the Linux kernel's
`Documentation/gpu/drm-usage-stats.rst`:
https://docs.kernel.org/gpu/drm-usage-stats.html

Signed-off-by: Ian Rogers <irogers@google.com>
---
 man/man5/proc_pid_fdinfo.5 | 94 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/man/man5/proc_pid_fdinfo.5 b/man/man5/proc_pid_fdinfo.5
index 290cae6a6..98ac12f16 100644
--- a/man/man5/proc_pid_fdinfo.5
+++ b/man/man5/proc_pid_fdinfo.5
@@ -301,5 +301,99 @@ fields contain the values that
 .BR timerfd_gettime (2)
 on this file descriptor would return.)
 .RE
+.SS Direct Rendering Manager
+.P
+DRM drivers can optionally choose to expose usage stats through
+/proc/pid/fdinfo/. For example:
+.P
+.in +4n
+.EX
+pos:    0
+flags:  02100002
+mnt_id: 26
+ino:    284
+drm-driver:     i915
+drm-client-id:  39
+drm-pdev:       0000:00:02.0
+drm-total-system0:      6044 KiB
+drm-shared-system0:     0
+drm-active-system0:     0
+drm-resident-system0:   6044 KiB
+drm-purgeable-system0:  1688 KiB
+drm-total-stolen-system0:       0
+drm-shared-stolen-system0:      0
+drm-active-stolen-system0:      0
+drm-resident-stolen-system0:    0
+drm-purgeable-stolen-system0:   0
+drm-engine-render:      346249 ns
+drm-engine-copy:        0 ns
+drm-engine-video:       0 ns
+drm-engine-capacity-video:      2
+drm-engine-video-enhance:       0 ns
+.EE
+.TP
+.IR drm-driver: " .+  (mandatory)"
+The name this driver registered.
+.TP
+.IR drm-pdev: " <aaaa:bb:cc.d>"
+For PCI devices this should contain the PCI slot address of the device
+in question.
+.TP
+.IR drm-client-id: " [0-9]+"
+Unique value relating to the open DRM file descriptor used to
+distinguish duplicated and shared file descriptors.
+.P
+GPUs usually contain multiple execution engines. Each shall be given a
+stable and unique name (<engine_name>), with possible values
+documented in the driver specific documentation.
+.TP
+.IR drm-engine-<engine_name>: " [0-9]+ ns"
+GPU engine utilization, time spent busy executing workloads for this client.
+.TP
+.IR drm-engine-capacity-<engine_name>: " [0-9]+"
+Capacity of the engine if not 1, cannot be 0.
+.TP
+.IR drm-cycles-<engine_name>: " [0-9]+"
+Contains the number of busy cycles for the given engine.  Values are
+not required to be constantly monotonic, but are required to catch up
+with the previously reported larger value within a reasonable
+period. Upon observing a value lower than what was previously read,
+userspace is expected to stay with that larger previous value until a
+monotonic update is seen.
+.TP
+.IR drm-total-cycles-<engine_name>: " [0-9]+"
+Contains the total number cycles for the given engine.  This is a
+timestamp in GPU unspecified unit that matches the update rate of
+drm-cycles-<engine_name>. For drivers that implement this interface,
+the engine utilization can be calculated entirely on the GPU clock
+domain, without considering the CPU sleep time between 2 samples.
+.P
+Each possible memory type which can be used to store buffer objects by
+the GPU in question shall be given a stable and unique name <region>.
+The name "memory" is reserved to refer to normal system memory.
+.TP
+.IR drm-memory-<region>: " [0-9]+ [KiB|MiB]"
+The amount of storage currently consumed by the buffer objects belong
+to this client, in the respective memory region.
+.IP
+Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
+indicating kibi- or mebi-bytes.
+.TP
+.IR drm-shared-<region>: " [0-9]+ [KiB|MiB]"
+The total size of buffers that are shared with another file (e.g., have more
+than a single handle).
+.TP
+.IR drm-total-<region>: " [0-9]+ [KiB|MiB]"
+The total size of buffers that including shared and private memory.
+.TP
+.IR drm-resident-<region>: " [0-9]+ [KiB|MiB]"
+The total size of buffers that are resident in the specified region.
+.TP
+.IR drm-purgeable-<region>: " [0-9]+ [KiB|MiB]"
+The total size of buffers that are purgeable.
+.TP
+.IR drm-active-<region>: " [0-9]+ [KiB|MiB]"
+The total size of buffers that are active on one or more engines.
+
 .SH SEE ALSO
 .BR proc (5)
-- 
2.47.0.199.ga7371fff76-goog


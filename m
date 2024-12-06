Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC581DED74
	for <linux-doc@vger.kernel.org>; Fri,  6 Dec 2024 07:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733470721; cv=none; b=RxRKi0OvpWa2sP8z7E3YMWrlSfmRg8X2vZtflFSwPEAX9BzUxjGj6CHnLbz0/642tTMX6OJ3MHov5TQoHpD7TJFmkEfguTAxW/GQiF9VBIKr49bG/a1+zidS8/xvHG+VYPJeEcH8A8R4yid0RqYPt67zkLL9ASqTbJHz94xZkSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733470721; c=relaxed/simple;
	bh=Eu+TXKTdVF/rr81EhKAUlxAfVv0EUjDZUkx+3iw+f9I=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Cc:Content-Type; b=ja2hFpTG+XtJSWQDk0PO99fJqNKVuGSnZQoY5skdR76yNDQYMZg54xsCl2cj/lygmiNww+Pvu2v0IxS/0elW8UlcNyjOYZKBDfPH/p+kdy40mI7zRtm66MsLWYXXuAiud0KZeJNDXybf8n865m3XuN4hibZNH8lMsKhtPz9KWIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nMJxkAmM; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nMJxkAmM"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6ef542990dbso20970977b3.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Dec 2024 23:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733470719; x=1734075519; darn=vger.kernel.org;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6tcWcwiswh578N5Sbvm8C5ZdbM+ZrqY2qCpqOjcQh4Y=;
        b=nMJxkAmMO0mMqTNjwxSkzUk1UjYMDrOafWq4y3FinQFjki29Z7s9NuOctat1QK5Rhs
         G1vlGRjSaiBFbwM3o06PMtRClMXtkMGKI57Na752wsNDFKQYF3FpYR4UVbIyBuyFIyyd
         0Vv78F5ixBYICRz091gqGI8ciWVzZ2sUvfmwzAOt8UNqKFsF4cVKWfsjxvcptWk5azm5
         aOTQXQPyz1bXfiuzmKagnOGKX648cBBx5aFZp90maeysnlmmpJKyKJdpGLywWokEZx+o
         9fX+DOvZZCtF+u1PquaA1yKsHOIPBVBo0SZGm1jpJNxsYu5BaXGfDAUi/LGYYq8WThnc
         Wo2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733470719; x=1734075519;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6tcWcwiswh578N5Sbvm8C5ZdbM+ZrqY2qCpqOjcQh4Y=;
        b=Q9H5EjkINZDJLn/Rsn9knjHeU5/BGvCjhvByCFAWzql2X52+0oUNVZ6VC0GntbHj7G
         8mKockctUxa5XFKxV15EKLEEAmGmE4DC/1ImCtXAbPqchmRMZ9/ig0F8u2CIaW21gX2i
         4joc2yqv5XgHnz/w1N0xMv2BzrZXmq//SKXn2oTF8jWxA327GfnM6GUWEkLEmlucVjeH
         9sKI0hzkoZwpiWGQZgMZnf/Y3J+c7xvw7jsWKDhrUGg4EdHv/AXlEOP8VhPWG819mFXK
         gYAahFS52A9GNjxtsS0BVIeMpSCd7jM44R0sFVvC2FqAWQjxXjdNDs/7pIyTTVcn8T4P
         hJlA==
X-Forwarded-Encrypted: i=1; AJvYcCWLmRN9bwJUc72Bk4PyQMbhZmLuXST50DXCr3++S23BihomBVS4949N1YMhmiPMfR5Tb4KAuU6fm6E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvWFQWaKjol4Jcjf46qSB5urEpgkwoiaIZbdMxRwKbBshrBpow
	Q8TFJ+4INB7kQ/9BReBGnoHma1Y1t6i4/f7aa12hdcyIpFzfGOE4C94sxWJI9Y3AzKdhy9RHkQn
	XGCWbag==
X-Google-Smtp-Source: AGHT+IHrVWBoiYYD/xmXDfRagPogDl7UXMcm4NMrSYV9vi8DJr6U4VViFkFNqaosBMt+/zmkxpKfltUluk4l
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:bff4:a354:8911:79b3])
 (user=irogers job=sendgmr) by 2002:a05:690c:5a05:b0:6ee:c295:c76e with SMTP
 id 00721157ae682-6efe3c8f290mr8697b3.6.1733470718867; Thu, 05 Dec 2024
 23:38:38 -0800 (PST)
Date: Thu,  5 Dec 2024 23:38:28 -0800
In-Reply-To: <20241206073828.1119464-1-irogers@google.com>
Message-Id: <20241206073828.1119464-4-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241206073828.1119464-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Subject: [PATCH v5 4/4] proc_pid_fdinfo.5: Add DRM subsection
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
---
v5. Update style a suggested-by G. Branden Robinson
    <g.branden.robinson@gmail.com>
---
 man/man5/proc_pid_fdinfo.5 | 107 +++++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/man/man5/proc_pid_fdinfo.5 b/man/man5/proc_pid_fdinfo.5
index c4914f1f3..bb77ee9a7 100644
--- a/man/man5/proc_pid_fdinfo.5
+++ b/man/man5/proc_pid_fdinfo.5
@@ -300,6 +300,113 @@ fields contain the values that
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
+.BR drm\-driver: " .+  (mandatory)"
+The name this driver registered.
+.TP
+.BR drm\-pdev: " [0-9A-F]{4}:[0-9A-F]{2}:[0-9A-F]{2}.[0-9A-F]"
+For PCI devices this should contain the PCI slot address of the device
+in question.
+.TP
+.BR drm\-client-id: " [0-9]+"
+Unique value relating to the open DRM file descriptor used to
+distinguish duplicated and shared file descriptors.
+.P
+GPUs usually contain multiple execution engines. Each shall be given a
+stable and unique name
+.IR engine-name ,
+with possible values documented in the driver specific documentation.
+.TP
+.BI drm\-engine\- engine-name :\c
+\& [0-9]+ ns
+GPU engine utilization, time spent busy executing workloads for this client.
+.TP
+.BI drm\-engine\-capacity\- engine-name :\c
+\& [0-9]+
+Capacity of the engine if not 1, cannot be 0.
+.TP
+.BI drm\-cycles\- engine-name :\c
+\& [0-9]+
+Contains the number of busy cycles for the given engine.  Values are
+not required to be constantly monotonic, but are required to catch up
+with the previously reported larger value within a reasonable
+period. Upon observing a value lower than what was previously read,
+userspace is expected to stay with that larger previous value until a
+monotonic update is seen.
+.TP
+.BI drm\-total\-cycles\- engine-name :\c
+\& [0-9]+
+Contains the total number cycles for the given engine.  This is a
+timestamp in GPU unspecified unit that matches the update rate of
+drm\-cycles\-\fIengine-name\fP.
+For drivers that implement this interface,
+the engine utilization can be calculated entirely on the GPU clock
+domain, without considering the CPU sleep time between 2 samples.
+.P
+Each possible memory type which can be used to store buffer objects by
+the GPU in question shall be given a stable and unique name
+.IR region .
+The name "memory" is reserved to refer to normal system memory.
+.TP
+.BI drm\-memory\- region :\c
+\& [0-9]+ [KiB|MiB]
+The amount of storage currently consumed by the buffer objects belong
+to this client, in the respective memory region.
+.IP
+Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
+indicating kibi- or mebi-bytes.
+.TP
+.BI drm\-shared\- region :\c
+\& [0-9]+ [KiB|MiB]
+The total size of buffers that are shared with another file (e.g., have more
+than a single handle).
+.TP
+.BI drm\-total\- region :\c
+\& [0-9]+ [KiB|MiB]
+The total size of buffers that including shared and private memory.
+.TP
+.BI drm\-resident\- region :\c
+\& [0-9]+ [KiB|MiB]
+The total size of buffers that are resident in the specified region.
+.TP
+.BI drm\-purgeable\- region :\c
+\& [0-9]+ [KiB|MiB]
+The total size of buffers that are purgeable.
+.TP
+.BI drm\-active\- region :\c
+\& [0-9]+ [KiB|MiB]
+The total size of buffers that are active on one or more engines.
+
 .SH HISTORY
 Linux 2.6.22.
 .SH SEE ALSO
-- 
2.47.0.338.g60cca15819-goog


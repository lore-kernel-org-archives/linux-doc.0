Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327B91C700C
	for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 08:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757494747; cv=none; b=OG/dDW6WlkrCNs1f8k5liU8Rnl+aweE6QmXlC1hlyecwYYVni+KE2gn6P2Mn0Wq7r1WeU4EPUmnI1pvEDOSJDkk+GpygFrZGUbnBNan//oYj3viLdp/PRGRqOGgM831solj5O3ZH4OAUJ+kq7gN4dshVCTSE+Xzf/guZXpuVU/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757494747; c=relaxed/simple;
	bh=qVUqCiNWKhbm4OJQ/h1GXQ4Ue76QXxYJE1ZLypTGFuk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JUPBqdZVrDX0JqAnFuFKPh8sjZbnlO54EVFpGkeLCp2GYFF5zPG4b5FGj/UDXD8X+G2sD29YSHIXPRkR/IfhyvEqckdRZcuNiufMjn/NFlapk/WETkI/bkoLdPobDrAOZfW2OesSrVbw3jIqHiL9jjKWitWpYQ0G5h2jqx2SL+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HeqqGFvx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HeqqGFvx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757494745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YbNpi+kDNBgUr3iCBEGx1sOECaER/m1rAGG176HSF7M=;
	b=HeqqGFvxb84KgnFV5/+PBjLBGDuHkIKMBWGuRiR3yl2dm7ht3qjHY7n5D3u3dqq3L235yT
	7FWjL2zXnF4ONFgDajA0lXAYaNN+lgyV9GN8YI8l6jOKUXR4vNWMWgwZXTkVLD5tfAsMMx
	pCnD1YwetWeQ3Hl2bo++EwuZ8dJu0wE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-pjvEexObMpOXY0pMDFoyDQ-1; Wed, 10 Sep 2025 04:59:03 -0400
X-MC-Unique: pjvEexObMpOXY0pMDFoyDQ-1
X-Mimecast-MFC-AGG-ID: pjvEexObMpOXY0pMDFoyDQ_1757494742
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-628f17953c7so4097321a12.3
        for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 01:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757494742; x=1758099542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YbNpi+kDNBgUr3iCBEGx1sOECaER/m1rAGG176HSF7M=;
        b=D/kIRF9eib8CmrHBCBDnNofYZGN4gsEfwNpe3tH/sK4nA4DnVa3fmNx7KxCWtXmDSk
         Yzyrh0J0r2h5CgrdWPcUQHaGw9mKd2mfllTePebpXZXRqPk57yjWdzE+j22Ct+30d8NY
         lqaDjnnQi1hLf/pE0k8j0QHItmu+dWKWBr2cRTgZKTJ8NmkKYIjERF/H5ZWrTNMoefLE
         0rdxiCAcHl+NXx9/hlpsJt1AvL4zCnQHydG2rxU/OlmxUhKzzGAI1FlLJdxumI9+LOU8
         wpH+bJ8fjYzrs4vmJW7G6aHOzSND5yDyROwDJNx9n8vaOk7MP7VL3N37y6f+jIakkLpY
         Fg0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUcfNTorLiZLzMYsk2MY7f0ky8e515+Ua9AdFXGS6/IG7TCScstFiWAjNuJHb843luEPlY6WawqojY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBG0sZzmXJG0M1naWAQeewlCVpF3xQuVE1GkXUwSUOzScTXPqV
	e26QLMU/wjNyn6pIU4orLYCUdb5Ijnz2oCxzc2uSrBqYfpN4XHcF5xPqZeIHCAo+bLN77fds/vb
	o4Nj4IRlaFltGQb5KQh57qhacS2xZxYqmjzyqzdK974iL06hHfV8xBKbarZnOlg==
X-Gm-Gg: ASbGncuRtiBzY9ZHOmlPFd70Qct66Qp23lg5ieiWXeBQGMpdknxnQOYoQHQD4CQQzqQ
	acR0/eDiUuWUXlGX6JEi4ZLs/wpqcH0kMoxDo1UETufpaNCjY7ein3udc6/D+4vUptV6yswLll4
	PeuN3/Wi11QVgkZE4XIEnL6IpQYsA7OGMbbKvgd9lcP5KFAHTA5MQLe7Wg4ipsmUXUq+gPqpzHj
	3m79kbtS2bRFC5ptWbCi3Jlz++S3g/5mHw3kRNYPzAlh0YA8obAgmhBHO0uFtDD5CiJ29VLwVp7
	+cnINc3DkaxiemWsm38LdBKHa1fLA8Hoi+S/7Fcg1H2wZt5Y8cdY6/y6dtdyTGMEn/dV+LEC2vp
	CtvnfZWopHxEAVw==
X-Received: by 2002:a05:6402:1d4c:b0:62c:710d:5600 with SMTP id 4fb4d7f45d1cf-62c710d58b3mr3918123a12.5.1757494742444;
        Wed, 10 Sep 2025 01:59:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIhjF/hQzrKDBiBG++LNsoFWIGNfnxMPAxlcabo5++O/vC/iz8XosvW+jycdz3EyQro8e4TQ==
X-Received: by 2002:a05:6402:1d4c:b0:62c:710d:5600 with SMTP id 4fb4d7f45d1cf-62c710d58b3mr3918105a12.5.1757494741975;
        Wed, 10 Sep 2025 01:59:01 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62c0123f35esm2792862a12.32.2025.09.10.01.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 01:59:01 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-rt-devel@lists.linux.dev,
	linux-doc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] Documentation: update config name in real-time architecture support
Date: Wed, 10 Sep 2025 10:58:59 +0200
Message-ID: <20250910085859.47818-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 14ec35ff5786 ("entry: Rename "kvm" entry code assets to "virt" to
genericize APIs") renames the config KVM_XFER_TO_GUEST_WORK to
VIRT_XFER_TO_GUEST_WORK. In a concurrent development work with commit
f51fe3b7e48c ("Documentation: Add real-time to core-api"), the
documentation on making an architecture support PREEMPT_RT has been
included referring to this config with its previous name.

Adjust the documentation to the current situation, and specifically
refer to the new name of the config.

Fixes: f51fe3b7e48c ("Documentation: Add real-time to core-api")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 Documentation/core-api/real-time/architecture-porting.rst | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/core-api/real-time/architecture-porting.rst b/Documentation/core-api/real-time/architecture-porting.rst
index d822fac29922..3062cff0e5a3 100644
--- a/Documentation/core-api/real-time/architecture-porting.rst
+++ b/Documentation/core-api/real-time/architecture-porting.rst
@@ -35,9 +35,10 @@ POSIX CPU timers and KVM
   POSIX CPU timers must expire from thread context rather than directly within
   the timer interrupt. This behavior is enabled by setting the configuration
   option CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK.
-  When KVM is enabled, CONFIG_KVM_XFER_TO_GUEST_WORK must also be set to ensure
-  that any pending work, such as POSIX timer expiration, is handled before
-  transitioning into guest mode.
+  When virtualization support, such as KVM, is enabled,
+  CONFIG_VIRT_XFER_TO_GUEST_WORK must also be set to ensure that any pending
+  work, such as POSIX timer expiration, is handled before transitioning into
+  guest mode.
 
 Hard-IRQ and Soft-IRQ stacks
   Soft interrupts are handled in the thread context in which they are raised. If
-- 
2.51.0


Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B840175A74
	for <linux-doc@vger.kernel.org>; Fri,  9 Oct 2026 02:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791513283; cv=none; b=kMfF1n9yjUZ/gtMy8OOVuA6qwEqYAUXXe+my/Us3G2dV6btbB6JnlBTVguxKse/4c3iXAeOhe/WMf7R2cYQbLyFdEhZiEs8VJGG4ZvvlLTdWXPy7+zAQHn3wBHjHJELdr1OA44hVpgLdVGgoDVN904yBvi9Vo7MP7RdDR7mCjoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791513283; c=relaxed/simple;
	bh=jpiR0aLhQz9mG3D0OMsxcuino1XjDqzBMsXVOBoP7nc=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=mdK2LGhQbZRKhOg/3rxvHiwIyovbm3MxAXY6JmwAaR4MPu/IyrSA7fONgMuO7wTj7I0EMGZW7xlm7jIyp6Pw7vl5kMAJJHaJ1rj0zC9J7tmd4UDsi4JiRPKjD9BoCtgQN/0E+zbDoytHLglbzMbfs2vdWYAUdds+sy3pZ7lqnAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W0J5wBpA; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W0J5wBpA"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-885cd98d226so662891b3a.1
        for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 19:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791513281; x=1792118081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T1IhimdTnvN9Dj3ritIUyhz+heh3blfQviu7Hl/psV0=;
        b=W0J5wBpAs4pYB4GwYmxwwMvAWQp1pU26U5e2lGfsiNktC0tGVoqZexNUSTA6ton9+j
         mUUwxSF/6jSFBvn9AMcNvhhYNzlPMLXh6WhHUrmzCRj8xhJ/HiDSbcGYC5lgg9VK0sp7
         /E1XWmASu3DvTfkAt1e4rGsI5DzLnPWsglZY/qTne3WgYkMXX5quoSwUjm3UXwEPfMU1
         Ru0aFBMXrf3x+Pmdu8k+fqufYWw19BU7kz1kiVW6g65+hihgrj9Ab65JJpG07blQCFbr
         8+hV8F7trNbtKE9nyAJYfsZ74H7hk2QNWWNZlUr0+7bHiPNBn61w55yaO98ERMCN4piE
         mQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791513281; x=1792118081;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T1IhimdTnvN9Dj3ritIUyhz+heh3blfQviu7Hl/psV0=;
        b=Gg0Pdb/IkSy/TtzbxFDLRCTjMm+cn41jwmMdHHE+8ZJQF0q8IgYH5rzVn51kaYIv9g
         ZjGNMJKlrvUa+Hs2XSGab0k8Dmchl8s3mPkobMZnQnh6TP5gUAIDohZzogyBTsEdWCGx
         Crz7Dx5DPSU6HAl2CYNvt0J9+SUY3AL9iW1Z4Igv1yGVcMA41UIZNZPZNc9x4Irro9jN
         aGh4wC5gUowt0azRkFOEhVsoT6uFeXuvzHBoWBRP0SqQo+6gsMO+S9pt47WAS5u5HfqQ
         at+qUOT+seBRDhxMSLJ5MlYpMOZI4lfohpmnStsyqP+5XshvCtwFUcCFXySJXYk3cH5R
         SIDA==
X-Forwarded-Encrypted: i=1; AKwUvBxtwr/kpAwmasvysELmwYLRS7RjJNYyQDuzgzeGWCLei/lA9zSDc9FsZIzlYyOUL7BPIRA2IkyCr/U=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9BBmgMZrBx23t5236p7V6E+oNWGExMJ5F2ahFlyLFFg8+AGFO
	OL4XgYELizZUKzfi/sv3ZWg/c1+av1Qb8UTokLPr6Eja9KF4gas/GVhYif7+ng==
X-Gm-Gg: AYBFou1qSZ/awHRdLfKeSAMluCrhaiTfF7saw4wG2VC0mZWBbsEd3GKi83ekbZx5pa5
	3YrkPXy8phDp4Kl5hD7AwCxJeTV82Qq3y/D9WOdM4xl+I8PqcWLJi+eyTHL8T9mUKxSFNZSRNvB
	vOkLPQBcH8dnhZkLnpDehNLmNjb3aQbOUKnub3wEUDtsS1mvjzebPTogRtDR7nUKPChENfInZni
	/ftlI/YKG/PymVMzi0sUbg6UrPo6PYkrIZk9GROxjGJC9vkrRxqv/eX5h5fT5CE6mQXUFWiLDwy
	s+ha09xFNwsN2DvALLpGlhxg9JfW+vCqfoYkIydJLW9deNXQEQSxd0tP41i0MCFriMoY9o7nMsJ
	hk78vhPufskIVQ1jHGZpq8c2cpClRp08PVDUb9nfw569bskiWV7q0TxrmGzUC1wGr3BVHfXsYPo
	1PGK8qJ03szSTVTunK48ldJ18z6ec7EeTIqI8TG08nJ5sSLLNS+uiL0tyMyj7qn1+/HUqS4xYUP
	IatOs4StduUwYOWtrOh86rTn8iOAN8iEUpgjbI28TlfjQLWqV5dgaIgF1ID3lMC
X-Received: by 2002:a05:6a00:4307:b0:891:41ae:ad68 with SMTP id d2e1a72fcca58-89695ebf3d9mr752401b3a.23.1791513281482;
        Thu, 08 Oct 2026 19:34:41 -0700 (PDT)
Received: from localhost.localdomain (c-174-165-208-10.hsd1.wa.comcast.net. [174.165.208.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c4a99b28sm296770b3a.59.2026.10.08.19.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 19:34:41 -0700 (PDT)
From: Michael Kelley <mhkelley58@gmail.com>
X-Google-Original-From: Michael Kelley <mhklinux@outlook.com>
To: haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 1/1] Documentation: hyperv: Remove support for guests on Hyper-V 2012/2012R2
Date: Thu,  8 Oct 2026 19:34:37 -0700
Message-Id: <20261009023437.3326-1-mhklinux@outlook.com>
X-Mailer: git-send-email 2.25.1
Reply-To: mhklinux@outlook.com
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support for running Linux guests on Windows Server 2012/2012 R2 Hyper-V
hosts and Windows 8/8.1 hosts has been removed, which includes removing
support for operating Hyper-V synthetic timers in other than Direct Mode.
Update the documentation to reflect these removals.

Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
This patch reflects changes that are already in linux-next for merging
into the 7.4 kernel.

 Documentation/virt/hyperv/clocks.rst   | 8 ++------
 Documentation/virt/hyperv/overview.rst | 6 +++---
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/Documentation/virt/hyperv/clocks.rst b/Documentation/virt/hyperv/clocks.rst
index 176043265803..9527e6073654 100644
--- a/Documentation/virt/hyperv/clocks.rst
+++ b/Documentation/virt/hyperv/clocks.rst
@@ -64,12 +64,8 @@ applying the scale and offset to get the constant 10 MHz clock.
 
 Linux clockevents are based on Hyper-V synthetic timer 0 (stimer0).
 While Hyper-V offers 4 synthetic timers for each CPU, Linux only uses
-timer 0. In older versions of Hyper-V, an interrupt from stimer0
-results in a VMBus control message that is demultiplexed by
-vmbus_isr() as described in the Documentation/virt/hyperv/vmbus.rst
-documentation. In newer versions of Hyper-V, stimer0 interrupts can
-be mapped to an architectural interrupt, which is referred to as
-"Direct Mode". Linux prefers to use Direct Mode when available. Since
+timer 0. stimer0 is operated in what Hyper-V calls "Direct Mode"
+where timer interrupts are mapped to an architectural interrupt. Since
 x86/x64 doesn't support per-CPU interrupts, Direct Mode statically
 allocates an x86 interrupt vector (HYPERV_STIMER0_VECTOR) across all CPUs
 and explicitly codes it to call the stimer0 interrupt handler. Hence
diff --git a/Documentation/virt/hyperv/overview.rst b/Documentation/virt/hyperv/overview.rst
index 77408a89d1a4..c4c262b77aa3 100644
--- a/Documentation/virt/hyperv/overview.rst
+++ b/Documentation/virt/hyperv/overview.rst
@@ -157,9 +157,9 @@ when accessing data shared with Hyper-V.
 Versioning
 ----------
 Current Linux kernels operate correctly with older versions of
-Hyper-V back to Windows Server 2012 Hyper-V. Support for running
-on the original Hyper-V release in Windows Server 2008/2008 R2
-has been removed.
+Hyper-V back to Windows Server 2016 Hyper-V and Windows 10. Support for
+running on Windows Server 2012/2012 R2, Windows Server 2008/2008 R2,
+and Windows 8.1 and earlier has been removed.
 
 A Linux guest on Hyper-V outputs in dmesg the version of Hyper-V
 it is running on.  This version is in the form of a Windows build
-- 
2.25.1


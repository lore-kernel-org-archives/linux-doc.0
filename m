Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BC134B682
	for <linux-doc@vger.kernel.org>; Wed,  4 Mar 2026 15:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772636705; cv=none; b=o9m71IaHbER5YGpN1uN/8zFxEQoD23JPu2IlFuthsy7VzTAxSSmtUY61HIMmgwFrZbWT4VP9v/FTBYl7rKLmxQm11sWn54NtQASi/QIUvmNzmHJ4ydUgN9rhPkx2PoAZ68JclA8qcJkyBArh6g9LvjJ6peaevNJe84Po8FLiQQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772636705; c=relaxed/simple;
	bh=jHAcgKXcKNebtrlpWLGfC+a4usAjvIac1SzYg4lDCRw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XRyI5DwQ2I0Vz/wwPo2Yns/ii+t8QRc1PFQkB/RS+nwzWBsnyuF4SYSYDLsae0I3E7MmHgSmnkqEh3H8z1v+AmCXsQ5ewmYb7J5sOEcMDSAzej3fjstOPg8j5JTu4n8XaCpnTyOTLfcaRGasqMzG1uD0BxF2rw1k8Uhmby9zs1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kQTw27Ii; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQTw27Ii"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35994d84c6dso1266586a91.2
        for <linux-doc@vger.kernel.org>; Wed, 04 Mar 2026 07:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772636701; x=1773241501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fqTYOMIsNClRzqswixiS8WEm00nS5ICygdS6xEi4uwI=;
        b=kQTw27IiEZ4ibhEU5iS8az0NOijK4o9pwKVvcNC+g7wmpWsb/QBjXjyhkyiOf8qC4G
         Qt4CW7yUDVAxiKVemZpR5POxtbHpU6enzu69gRBrf1fN0965ZGdjSAjzYNHyGU9Vv9CQ
         zu5r9eks7mSikUoFWdmRGvqPlKSNzVX/EP4ldpMbvQibN37UESLfgExF1+gU5Dn9OFr6
         Sl0O7n7lXj52jCpGbTwg2PcVkpwl6mYyGwBOlhoIgG75cKXHkRWQmW1R8h4VXHNALbvt
         93zXMkyGwGS1Z7nga21z8uK/gVGtmkhBoZEFj9n3UFb8Q76ZkLVdaujwAJboJK/IOkQ4
         OV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772636701; x=1773241501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fqTYOMIsNClRzqswixiS8WEm00nS5ICygdS6xEi4uwI=;
        b=OeOhUKkXFcXNo2D9ZSq1BgZZ73ku++zc4a2Q5so4bILPFuIFkfoO8U5e+wvSq7335k
         fq/E2PKEVa59Kb+D/Xd29RKL/hbzRNcGH1Q3UuSdQD2Av26Ijf2ItZbiYE8FT5J/RElX
         EbT9b1tDflApLg64HjuCmf0lel9Madu278xgJaTlYESAf9aChRsC/qov2+rH188jyD27
         GAFliJWID7gzSGd0Iac0TLSZfbGz0gFT3kCDT6ry/PxSvkAaXJqMf5IMjAWOr6/icdqB
         9mutEimrbSbbe657wisTss3cphs+EDwlNxWZRNUHWwTgaLgmRumjHd9GLuru10vCKHUf
         252g==
X-Forwarded-Encrypted: i=1; AJvYcCUS/I/SSmGr7On33u+WW+4Vnrrw/caYYxbHODeQnoIKeah4wwe5uB07aSckXk2/7vtNFdLGTTYjVzE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMFB8SIt2FM/11Ug5NJY2mhjUnNASLWpyvwyGJioMCIZv+Peiz
	dlHhaDC2L6kIZG9+F5c7t0tN/OrU4eA1+4757hwME5Fa8/E1bwi3e48S
X-Gm-Gg: ATEYQzzbhXkZVbHkptXIW9XgIyX76yzsPkKQpvQYWqxwLV5sK4SN1LFbKa38sSzLFqw
	jVJ0b2eXSvPB2Oxour+X3WaUfEIIGEoXnnaZfYcPM4LjzrT0H64jHr26FM++3pQ7BcsseBrQoPG
	fZMZ2nWXBkAypB1HQG0GEbsXLpuzXlone+7+y0h1Ez2ytFr3cdtBqJfk89njClv7h/ieudxh4z2
	uETF+m/tKvtltT+aPyC48PldpPLMX1qnMqSgZEOP+wdl/17DA7nhjJ7eE1BpdW5S/YP3EY8zc78
	O0dnqyim/+d1KSavCbq2UVKWuBLU7omnmEIUo97F2Nbm1EGO3jh0eGWdsZao/h59zEl6aanGDku
	ssgYbRdvV6LjfM8eNGJQDjYY3ujzWPtsllHE9aDegx00v2SQJZQ0uP35bGPg46Xl7DJHSnkb5Wf
	3Sxn/lJbe+1C8ZoUVI0xJbyC820nVsAJ2zkLir7rr35Qsjxfg0dZzpa333YrJGUQ==
X-Received: by 2002:a17:90b:48cd:b0:34a:8c77:d37b with SMTP id 98e67ed59e1d1-359a6a21536mr2121281a91.16.1772636701366;
        Wed, 04 Mar 2026 07:05:01 -0800 (PST)
Received: from localhost.localdomain ([47.30.254.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359aa3eb916sm516439a91.11.2026.03.04.07.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 07:05:00 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: corbet@lwn.net,
	jgross@suse.com
Cc: sstabellini@kernel.org,
	boris.ostrovsky@oracle.com,
	linux-doc@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: [PATCH v2] docs: sysctl: Add documentation for /proc/sys/xen/
Date: Wed,  4 Mar 2026 20:34:19 +0530
Message-Id: <20260304150419.16738-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for the Xen hypervisor sysctl controls in
/proc/sys/xen/balloon/.

Documents the hotplug_unpopulated tunable (available when
CONFIG_XEN_BALLOON_MEMORY_HOTPLUG is enabled) which controls
whether unpopulated memory regions are automatically hotplugged
when the Xen balloon driver needs to reclaim memory.

The documentation is based on source code analysis of
drivers/xen/balloon.c.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 Documentation/admin-guide/sysctl/index.rst |  3 ++-
 Documentation/admin-guide/sysctl/xen.rst   | 31 ++++++++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/admin-guide/sysctl/xen.rst

diff --git a/Documentation/admin-guide/sysctl/index.rst b/Documentation/admin-guide/sysctl/index.rst
index 4dd2c9b5d752..aae68373902f 100644
--- a/Documentation/admin-guide/sysctl/index.rst
+++ b/Documentation/admin-guide/sysctl/index.rst
@@ -84,7 +84,7 @@ sunrpc/		SUN Remote Procedure Call (NFS)
 user/		Per user namespace limits
 vm/		memory management tuning
 		buffer and cache management
-xen/		<undocumented>
+xen/		Xen hypervisor controls
 =============== ===============================================================
 
 These are the subdirs I have on my system or have been discovered by
@@ -102,3 +102,4 @@ it :-)
    sunrpc
    user
    vm
+   xen
diff --git a/Documentation/admin-guide/sysctl/xen.rst b/Documentation/admin-guide/sysctl/xen.rst
new file mode 100644
index 000000000000..6c5edc3e5e4c
--- /dev/null
+++ b/Documentation/admin-guide/sysctl/xen.rst
@@ -0,0 +1,31 @@
+===============
+/proc/sys/xen/
+===============
+
+Copyright (c) 2026, Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+
+For general info and legal blurb, please look in
+Documentation/admin-guide/sysctl/index.rst.
+
+------------------------------------------------------------------------------
+
+These files show up in ``/proc/sys/xen/``, depending on the
+kernel configuration:
+
+.. contents:: :local:
+
+balloon/hotplug_unpopulated
+===========================
+
+This flag controls whether unpopulated memory ranges are automatically
+hotplugged as system RAM.
+
+- ``0``: Unpopulated ranges are not hotplugged (default).
+- ``1``: Unpopulated ranges are automatically hotplugged.
+
+When enabled, the Xen balloon driver will add memory regions that are
+marked as unpopulated in the Xen memory map to the system as usable RAM.
+This allows for dynamic memory expansion in Xen guest domains.
+
+This option is only available when the kernel is built with
+``CONFIG_XEN_BALLOON_MEMORY_HOTPLUG`` enabled.
-- 
2.39.5


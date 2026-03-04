Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96C239EF10
	for <linux-doc@vger.kernel.org>; Wed,  4 Mar 2026 14:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633837; cv=none; b=ggypGZ3QrhLZsDGH5sR+kGllj3/+h81Y5MI49bOTrLtmB3EDUVs59xh7iSmexy1OWuJeqZ6xzbglBXidy9u70acqvP12TJW2esFmnHpYWSAWCSwF41V8Bbz0wgkgSmyOxpaMJ5dvPbKgk3jVqzj2rYj08iV9QlSGrY/Pv3kbKCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633837; c=relaxed/simple;
	bh=a67v7clOxOnJ034y/9ps5aCT7nYggDeXwqs818leoG4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HHPe63b1IXAhUDXX3v4e+F+ZRlk8Z7hZ/KTjTBmniMn73LrNl3PvKJDaHBkPfRAQQq/zlPv4lagff3stQQa29SgoWqZ/MGyyqHPBfAMqIuB22r7KMQKtQyFjnX/UbAEsP0DU8AMFXkVF7jtDKdYcVPw9o6sw1XaHpfSpOLIN2IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PB8uCv2Y; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PB8uCv2Y"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c70378ddaafso4498136a12.3
        for <linux-doc@vger.kernel.org>; Wed, 04 Mar 2026 06:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633835; x=1773238635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2HHesXUFzgL5YUe0UTlW0VJee6vfQ7EH/6Wc6oNHvRQ=;
        b=PB8uCv2YmccDUANs9HHQd/bjeKy0n/Hpb9ykGenSR5xGlUVOIkEnsUyG4n4ytRKkTW
         zOi3XsLAvfk8cRiYAAtZWrSXl/rRVL3d1i06JSqzb/8EvPmrv6XHj/ZPXIAIEV8p67IA
         qtlRWpBZeTWtZLbGqUG3cBiiFt5Ymu2OLL2b3WaH47iEYg/a7erirJAhbC05AEh6g2qB
         i/4zeV6ARBAYdzDTAWoNDc/Ktojed6J3BijY6l6lnD+Fkxby0D+bfoBzdh4N4PiSIE0a
         CeCmjvfjgFwmSer2ZE4arE3XGF+f2VNVL/zmgJibEebwVU8b7ty2eg+4QSnecPXMd/lL
         Rusw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633835; x=1773238635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HHesXUFzgL5YUe0UTlW0VJee6vfQ7EH/6Wc6oNHvRQ=;
        b=UnnCsTZt4k8l/Df4juStkj6qqP5HNhoOWTTUttyHdML3UJriNO336HJJigYgkOHHiM
         F7bBfT7tkogwAkNKDlPOZqQtC4rnMEY/6OWuo5dQHpDSRkBWEGIkhRuWHLWR7ckCE36U
         3RoIAMQTv89uteL37nkz7TVfFXGk2Bu7eID5yUXgHTt3S3QdfpGcX5235Dy02Ey8lrGV
         Grt55g8ph9BT4KuolpC6ZSZoVaGnlPKSlWq+bcl4mSWkpiO+4CtnLfnoNlBmFkqva1jh
         p9NrKsjRzZXMPeMZ44efMy9sNzLsegDOt/cOue3FjdtoIHTgF2/f4kT4uD5F667YoMMj
         NXBA==
X-Forwarded-Encrypted: i=1; AJvYcCV5/ALte+iT1UwiIefx71u+4r0uzTQtWZ/Gp/bJyZ1gf4VXxwBeX2qeLId79ZqCCiD7gREY8G2ISg0=@vger.kernel.org
X-Gm-Message-State: AOJu0YysMijRXV8UWnuRxYatkQbqYLYsBF2S6s66dgfjxjXr1QMtzM6+
	HtSj0V05vPcdkEPJ/uNdlpuhSenTSPM4gM8RIEZ9ceGt+4L1CHFt9pl4
X-Gm-Gg: ATEYQzxDE9xm3fAdUcSyNPiD/Df7QChn7KXb8zKSpgNws+HuxCZ1sA4t6v9qXEouFn3
	X3/GbesnoxbvPUgFpcd/GtRhRmeYcZJ+VBNY7rraD2E03oIchEXzVY+9WyA3K64gp+bSL6G+Ic8
	J0tkk1pB6+ywa2J2py01AnchT8WnnYeLkqpvouNpML0UMd0/ovsPpth3/jTTJQoBf2jjXDGXHo8
	abod9+PrN3mhAQGPIex7kqx+1jzOaVlYAKiIvAj0Et4Yh6fixe8Rku12oN3DxUjxr3pn7cseDFK
	xv0ZBa0H0ZfwE6pVZrp/2ngVJfqnNcVYkVMxYzJPHWTxb3AG+JIkue5EqJ7rOEMc7cpgiqt4Nca
	AdVi35myFjhOjAOzHKuJxWmNBFgFabIwRYc8lNhOb/SvzBccxL+LCXnuTjucChL+76gmr9nv7KA
	kWzB+Sk4Zv6Qno3bsaX2qqknjgG6l1tgafB1pTPDCDtDHsDpYpFGA7
X-Received: by 2002:a17:902:e5c6:b0:2ae:50ec:fa35 with SMTP id d9443c01a7336-2ae6aa36151mr22864825ad.24.1772633835197;
        Wed, 04 Mar 2026 06:17:15 -0800 (PST)
Received: from localhost.localdomain ([2409:40e5:116b:88d4:1c32:f854:c933:d139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae3d1b2c51sm128138145ad.19.2026.03.04.06.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:17:12 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: corbet@lwn.net,
	jgross@suse.com
Cc: sstabellini@kernel.org,
	boris.ostrovsky@oracle.com,
	linux-doc@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: [PATCH] docs: sysctl: Add documentation for /proc/sys/xen/
Date: Wed,  4 Mar 2026 19:46:44 +0530
Message-Id: <20260304141644.28777-1-chakrabortyshubham66@gmail.com>
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
 Documentation/admin-guide/sysctl/index.rst |  3 +-
 Documentation/admin-guide/sysctl/xen.rst   | 33 ++++++++++++++++++++++
 2 files changed, 35 insertions(+), 1 deletion(-)
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
index 000000000000..957febd6bab9
--- /dev/null
+++ b/Documentation/admin-guide/sysctl/xen.rst
@@ -0,0 +1,33 @@
+===============
+/proc/sys/xen/
+===============
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
+
+Copyright (c) 2026, Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+
+For general info and legal blurb, please look in
+Documentation/admin-guide/sysctl/index.rst.
+
+.. See scripts/check-sysctl-docs to keep this up to date:
+.. scripts/check-sysctl-docs -vtable="xen" \
+..         $(git grep -l register_sysctl_)
-- 
2.39.5


Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEE51C84BC
	for <linux-doc@vger.kernel.org>; Sun, 28 Jun 2026 11:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782646956; cv=none; b=bVyDHanp2Tgivu768Z+5UrHxDmGWntDZKRU1fmGV0uRo+MPniVHcEAbgPOzivRZNMcM7srwD6BXnAC9HSP4YLrolee2K5dO4dkTfPggN5aY69voxq1bUSGz6JqxgpdH4hV3n+RoNwHXQGcnEjd7G5SLYNq3A8UoJ/926htIMeQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782646956; c=relaxed/simple;
	bh=4UyO2s/d2IlJt9fvxRUT3ebyYuOcpXtX4LGtFLRgSwY=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=p2moF0L8vZhzaucoPXGXXpK1Etnuwk8eOmjWxq/0pUpWyzc2cTFHqP29gnJMLbuaGwrwy3HaA7jrZQpg5WBDGaWCZ34co2XPVblkYjrJqGlH8+Gv5WvFSWJvQJT3pFDuwlddmjGCwfYZMsGGNwXJ8uTtCkrb8Vx3/kF/dFlpbsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=cvARN8gj; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=SFzc4Kdo; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="cvARN8gj";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="SFzc4Kdo"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gp6w12zCFz9t2R;
	Sun, 28 Jun 2026 13:42:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782646945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=N8Qa7qJZtQ/yMjcx4VIcSmavXi+bVKq/6H+1A1mf/6o=;
	b=cvARN8gj03g0bmpwPnzLw7bxfqJqSlXu87W4f3LaMxK8hdHEcO5WHnO3uKqA8Q7exkKI9F
	sQh5oD3bY8LcdlVCT3IbB4gr3h9L2Cgt66EfjzCNHwuAXj5pLuwiDT/sWzey4l23qJuJNF
	VSB6Gc8ANAeGPaL4pi/sHXc2Jg6uzUkWBVLbTcBXh99IPXzQx8jaYWuCSaYtvqLAmz2v4k
	dN4rtKnhKsPnqTJlVRLgYmQHIyaCsAWdiPAGUmROHOnGWxYXhIQoEnh+jvvCrgK+bl+zNO
	lIb03IsR5c3koY6kUnW6/DGnt1sTTr02jV3HpYsFjaRMH9R8BkqxhxytAW7zUw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=SFzc4Kdo;
	spf=pass (outgoing_mbo_mout: domain of manuelebner@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=manuelebner@mailbox.org
Message-ID: <3150bd373177ae566256d388ba86d810193f7f14.camel@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782646943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=N8Qa7qJZtQ/yMjcx4VIcSmavXi+bVKq/6H+1A1mf/6o=;
	b=SFzc4KdoD2cTE4jFOozORIo3YCeQSlxmeoy6/Xi9/tzEQohVMg4bpIfB+Kgo1nELCWx+M/
	+5BengVpXuMBZroeFxdkdTMidsmWlNMjX3Il5IyzRoI/SWyDDy6X1M9KM4fpnFs6pb4c5c
	FJ1KuTyrJW9hcGIGMHGrnKfFa7ljnd1WyIkpFU8XBeSNLg3iFE3SC3BQphGmi3PAoNuVD2
	5q/wEFtFfcs8Hf9InHW+v5yF9t26IuuXbuuRcHYiWZ5CMLvRxZ6er2MVux/efGZ8FEDVrI
	4bidyGUXFkPbS0f5WrKmDWsqhwnI9wEj7+XTAeqABODAnM/HjrNU4bdLbclUOg==
Subject: [RFC] Doc: ABI: add files to MAINTAINERS
From: Manuel Ebner <manuelebner@mailbox.org>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, 	linux-doc@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>, Manuel Ebner
 <manuelebner@mailbox.org>
Date: Sun, 28 Jun 2026 13:42:20 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 8a6a25ffd3c321dd2a4
X-MBO-RS-META: ksf16j553qope66bpwyaag8ikihg5coy
X-Rspamd-Queue-Id: 4gp6w12zCFz9t2R

Due to my last couple patches to /ABI I bumped in the issue of orphaned fil=
es.
This is my effort to improve this. My plan is to send the mail below per
subsystem. Can I add the text as is below or should I add a git-patch?

I will add more files but I wanted to clarify this before continuing.

Thanks
 Manuel

---
Doc: ABI: add files to MAINTAINERS [SUBSYSTEM]

Unfortunately the get_maintainer script didn't return your e-mail-address
for following files below. Because of the output of git log I assume you
are the maintainer. Please consider adding path(s) to file(s) or directorie=
s
to your subsystem in MAINTAINERS. As suggested by Jonathan Cameron [1].

Thanks
 Manuel

[1] https://lore.kernel.org/all/20260611171520.0a96ac83@jic23-huawei/#t
---

INFINIBAND SUBSYSTEM
M:	Jason Gunthorpe <jgg@nvidia.com>
M:	Leon Romanovsky <leonro@nvidia.com>
L:	linux-rdma@vger.kernel.org
S:	Supported
W:	https://github.com/linux-rdma/rdma-core
Q:	http://patchwork.kernel.org/project/linux-rdma/list/
T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git
F:	Documentation/devicetree/bindings/infiniband/
F:	Documentation/infiniband/
F:	drivers/infiniband/
F:	include/rdma/
F:	include/trace/events/ib_mad.h
F:	include/trace/events/ib_umad.h
F:	include/trace/misc/rdma.h
F:	include/uapi/linux/if_infiniband.h
F:	include/uapi/rdma/
F:	samples/bpf/ibumad_kern.c
F:	samples/bpf/ibumad_user.c
F:	tools/testing/selftests/rdma/
+F:	Documentation/ABI/stable/sysfs-class-infiniband


DMI/SMBIOS SUPPORT
M:	Jean Delvare <jdelvare@suse.com>
S:	Maintained
T:	git git://git.kernel.org/pub/scm/linux/kernel/git/jdelvare/staging.git d=
mi-for-
next
F:	Documentation/ABI/testing/sysfs-firmware-dmi-tables
F:	drivers/firmware/dmi-id.c
F:	drivers/firmware/dmi_scan.c
F:	include/linux/dmi.h
+F:	Documentation/ABI/testing/sysfs-firmware-dmi-entries

GOOGLE FIRMWARE DRIVERS
M:	Tzung-Bi Shih <tzungbi@kernel.org>
R:	Brian Norris <briannorris@chromium.org>
R:	Julius Werner <jwerner@chromium.org>
L:	chrome-platform@lists.linux.dev
S:	Maintained
T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.=
git
F:	drivers/firmware/google/
F:	include/linux/coreboot.h
+F:	Documentation/ABI/testing/sysfs-firmware-gsmi

DRIVER CORE, KOBJECTS, DEBUGFS AND SYSFS
M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
M:	"Rafael J. Wysocki" <rafael@kernel.org>
M:	Danilo Krummrich <dakr@kernel.org>
L:	driver-core@lists.linux.dev
S:	Supported
T:	git git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-cor=
e.git
F:	Documentation/core-api/kobject.rst
F:	Documentation/driver-api/driver-model/
F:	drivers/base/
F:	fs/debugfs/
F:	fs/sysfs/
F:	include/linux/device/
F:	include/linux/debugfs.h
F:	include/linux/device.h
F:	include/linux/fwnode.h
F:	include/linux/kobj*
F:	include/linux/ksysfs.h
F:	include/linux/property.h
F:	include/linux/sysfs.h
F:	kernel/ksysfs.c
F:	lib/kobj*
F:	rust/kernel/debugfs.rs
F:	rust/kernel/debugfs/
F:	rust/kernel/device.rs
F:	rust/kernel/device/
F:	rust/kernel/device_id.rs
F:	rust/kernel/devres.rs
F:	rust/kernel/driver.rs
F:	rust/kernel/faux.rs
F:	rust/kernel/platform.rs
F:	rust/kernel/soc.rs
F:	samples/rust/rust_debugfs.rs
F:	samples/rust/rust_debugfs_scoped.rs
F:	samples/rust/rust_driver_platform.rs
F:	samples/rust/rust_driver_faux.rs
F:	samples/rust/rust_soc.rs
+F:	Documentation/ABI/testing/sysfs-uevent

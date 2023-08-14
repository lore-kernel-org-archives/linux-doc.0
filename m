Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09FDFC001DB
	for <linux-doc@archiver.kernel.org>; Mon, 14 Aug 2023 21:29:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232902AbjHNV3M (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 14 Aug 2023 17:29:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232888AbjHNV2k (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Aug 2023 17:28:40 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA822B3;
        Mon, 14 Aug 2023 14:28:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 60C3563565;
        Mon, 14 Aug 2023 21:28:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B092C433C8;
        Mon, 14 Aug 2023 21:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692048516;
        bh=k4gwMI6dbncTSyxgifEVc0j04/2cHKMc+MpMt+zJAVM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HCffCKGdTDSJtbPmy0kC7+RWpVgwqcw1jtI6SCd1M+21SG5iKDpJ4D05Nv480fwch
         pSjvKQrXPpb3quOdzDcq/c9W6jAzf6Bzh2Nk+ESq/axNLaKudjE4UDM+I8zewzkL3a
         Y7JZ7OYylbtFx/1/VgEIzt818Lc9F20fjYw91SOs6+q8HvnR8cp1MGHtABZTeT55o1
         //FI+SohxsQrYzm5Z4NOw9lA8M9vS0M4UJi1Ywo/yX7mudqeIBdJlS/hzKPgL6ilKK
         yrtQH4XRkY7ofrGGzm/BjIWn/dFN0AY1Gcahovyt8vRzQcD5A3teeqBlqZuWgmJYrg
         4icl5osSHN4UA==
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 1/3] Documentation/ABI: Fix typos
Date:   Mon, 14 Aug 2023 16:28:20 -0500
Message-Id: <20230814212822.193684-2-helgaas@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230814212822.193684-1-helgaas@kernel.org>
References: <20230814212822.193684-1-helgaas@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bjorn Helgaas <bhelgaas@google.com>

Fix typos in Documentation/ABI.  The changes are in descriptions or
comments where they shouldn't affect use of the ABIs.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 Documentation/ABI/stable/sysfs-block                      | 2 +-
 Documentation/ABI/stable/sysfs-class-infiniband           | 2 +-
 Documentation/ABI/stable/sysfs-platform-wmi-bmof          | 2 +-
 Documentation/ABI/testing/debugfs-driver-habanalabs       | 2 +-
 Documentation/ABI/testing/procfs-diskstats                | 2 +-
 Documentation/ABI/testing/sysfs-bus-coreboot              | 2 +-
 .../ABI/testing/sysfs-bus-coresight-devices-etm3x         | 8 ++++----
 .../ABI/testing/sysfs-bus-coresight-devices-etm4x         | 2 +-
 .../ABI/testing/sysfs-bus-event_source-devices-events     | 4 ++--
 Documentation/ABI/testing/sysfs-bus-fsi-devices-sbefifo   | 4 ++--
 Documentation/ABI/testing/sysfs-bus-i2c-devices-fsa9480   | 2 +-
 Documentation/ABI/testing/sysfs-bus-nfit                  | 2 +-
 Documentation/ABI/testing/sysfs-bus-papr-pmem             | 2 +-
 Documentation/ABI/testing/sysfs-bus-umc                   | 2 +-
 Documentation/ABI/testing/sysfs-class                     | 2 +-
 Documentation/ABI/testing/sysfs-class-cxl                 | 4 ++--
 Documentation/ABI/testing/sysfs-class-mtd                 | 2 +-
 Documentation/ABI/testing/sysfs-class-net                 | 2 +-
 Documentation/ABI/testing/sysfs-class-net-queues          | 2 +-
 Documentation/ABI/testing/sysfs-class-power-wilco         | 2 +-
 Documentation/ABI/testing/sysfs-class-remoteproc          | 2 +-
 Documentation/ABI/testing/sysfs-class-thermal             | 2 +-
 Documentation/ABI/testing/sysfs-class-uwb_rc-wusbhc       | 2 +-
 Documentation/ABI/testing/sysfs-devices-online            | 2 +-
 Documentation/ABI/testing/sysfs-driver-ge-achc            | 2 +-
 Documentation/ABI/testing/sysfs-driver-tegra-fuse         | 2 +-
 Documentation/ABI/testing/sysfs-firmware-acpi             | 2 +-
 Documentation/ABI/testing/sysfs-firmware-sgi_uv           | 4 ++--
 Documentation/ABI/testing/sysfs-fs-f2fs                   | 8 ++++----
 Documentation/ABI/testing/sysfs-kernel-mm-damon           | 2 +-
 Documentation/ABI/testing/sysfs-memory-page-offline       | 4 ++--
 Documentation/ABI/testing/sysfs-platform-dell-laptop      | 2 +-
 Documentation/ABI/testing/sysfs-platform-dfl-fme          | 2 +-
 Documentation/ABI/testing/sysfs-platform-kim              | 2 +-
 Documentation/ABI/testing/sysfs-platform-sst-atom         | 2 +-
 35 files changed, 46 insertions(+), 46 deletions(-)

diff --git a/Documentation/ABI/stable/sysfs-block b/Documentation/ABI/stable/sysfs-block
index c57e5b7cb532..1fe9a553c37b 100644
--- a/Documentation/ABI/stable/sysfs-block
+++ b/Documentation/ABI/stable/sysfs-block
@@ -295,7 +295,7 @@ Description:
 		capable of executing requests targeting different sector ranges
 		in parallel. For instance, single LUN multi-actuator hard-disks
 		will have an independent_access_ranges directory if the device
-		correctly advertizes the sector ranges of its actuators.
+		correctly advertises the sector ranges of its actuators.
 
 		The independent_access_ranges directory contains one directory
 		per access range, with each range described using the sector
diff --git a/Documentation/ABI/stable/sysfs-class-infiniband b/Documentation/ABI/stable/sysfs-class-infiniband
index ebf08c604336..694f23a03a28 100644
--- a/Documentation/ABI/stable/sysfs-class-infiniband
+++ b/Documentation/ABI/stable/sysfs-class-infiniband
@@ -356,7 +356,7 @@ Description:
 		pkeys/<n>:		(RO) Displays the contents of the physical
 					key table n = 0..126
 
-		mcgs/:			(RO) Muticast group table
+		mcgs/:			(RO) Multicast group table
 
 		<m>/gid_idx/0:		(RO) Display the GID mapping m = 1..2
 
diff --git a/Documentation/ABI/stable/sysfs-platform-wmi-bmof b/Documentation/ABI/stable/sysfs-platform-wmi-bmof
index a786504b6027..2881244e3f09 100644
--- a/Documentation/ABI/stable/sysfs-platform-wmi-bmof
+++ b/Documentation/ABI/stable/sysfs-platform-wmi-bmof
@@ -2,6 +2,6 @@ What:		/sys/bus/wmi/devices/05901221-D566-11D1-B2F0-00A0C9062910[-X]/bmof
 Date:		Jun 2017
 KernelVersion:	4.13
 Description:
-		Binary MOF metadata used to decribe the details of available ACPI WMI interfaces.
+		Binary MOF metadata used to describe the details of available ACPI WMI interfaces.
 
 		See Documentation/wmi/devices/wmi-bmof.rst for details.
diff --git a/Documentation/ABI/testing/debugfs-driver-habanalabs b/Documentation/ABI/testing/debugfs-driver-habanalabs
index 85f6d04f528b..df535780058b 100644
--- a/Documentation/ABI/testing/debugfs-driver-habanalabs
+++ b/Documentation/ABI/testing/debugfs-driver-habanalabs
@@ -95,7 +95,7 @@ What:           /sys/kernel/debug/habanalabs/hl<n>/device_release_watchdog_timeo
 Date:           Oct 2022
 KernelVersion:  6.2
 Contact:        ttayar@habana.ai
-Description:    The watchdog timeout value in seconds for a device relese upon
+Description:    The watchdog timeout value in seconds for a device release upon
                 certain error cases, after which the device is reset.
 
 What:           /sys/kernel/debug/habanalabs/hl<n>/dma_size
diff --git a/Documentation/ABI/testing/procfs-diskstats b/Documentation/ABI/testing/procfs-diskstats
index e58d641443d3..6a719cf2075c 100644
--- a/Documentation/ABI/testing/procfs-diskstats
+++ b/Documentation/ABI/testing/procfs-diskstats
@@ -8,7 +8,7 @@ Description:
 
 		==  ===================================
 		 1  major number
-		 2  minor mumber
+		 2  minor number
 		 3  device name
 		 4  reads completed successfully
 		 5  reads merged
diff --git a/Documentation/ABI/testing/sysfs-bus-coreboot b/Documentation/ABI/testing/sysfs-bus-coreboot
index 9c5accecc470..8e8d6af24a4c 100644
--- a/Documentation/ABI/testing/sysfs-bus-coreboot
+++ b/Documentation/ABI/testing/sysfs-bus-coreboot
@@ -21,7 +21,7 @@ What:		/sys/bus/coreboot/devices/cbmem-<id>/address
 Date:		August 2022
 Contact:	Jack Rosenthal <jrosenth@chromium.org>
 Description:
-		This is the pyhsical memory address that the CBMEM entry's data
+		This is the physical memory address that the CBMEM entry's data
 		begins at, in hexadecimal (e.g., ``0x76ffe000``).
 
 What:		/sys/bus/coreboot/devices/cbmem-<id>/size
diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm3x b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm3x
index 234c33fbdb55..3acf7fc31659 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm3x
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm3x
@@ -31,7 +31,7 @@ Date:		November 2014
 KernelVersion:	3.19
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(RW) Used in conjunction with @addr_idx.  Specifies the range of
-		addresses to trigger on.  Inclusion or exclusion is specificed
+		addresses to trigger on.  Inclusion or exclusion is specified
 		in the corresponding access type register.
 
 What:		/sys/bus/coresight/devices/<memory_map>.[etm|ptm]/addr_single
@@ -304,19 +304,19 @@ What:		/sys/bus/coresight/devices/<memory_map>.[etm|ptm]/mgmt/etmtsscr
 Date:		September 2015
 KernelVersion:	4.4
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
-Description: 	(RO) Print the content of the ETM Trace Start/Stop Conrol
+Description: 	(RO) Print the content of the ETM Trace Start/Stop Control
 		register (0x018). The value is read directly from the HW.
 
 What:		/sys/bus/coresight/devices/<memory_map>.[etm|ptm]/mgmt/etmtecr1
 Date:		September 2015
 KernelVersion:	4.4
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
-Description: 	(RO) Print the content of the ETM Enable Conrol #1
+Description: 	(RO) Print the content of the ETM Enable Control #1
 		register (0x024). The value is read directly from the HW.
 
 What:		/sys/bus/coresight/devices/<memory_map>.[etm|ptm]/mgmt/etmtecr2
 Date:		September 2015
 KernelVersion:	4.4
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
-Description: 	(RO) Print the content of the ETM Enable Conrol #2
+Description: 	(RO) Print the content of the ETM Enable Control #2
 		register (0x01c). The value is read directly from the HW.
diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x
index 08b1964f27d3..a0425d70d009 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x
@@ -446,7 +446,7 @@ Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(Read) Returns the maximum size of the data value, data address,
-		VMID, context ID and instuction address in the trace unit
+		VMID, context ID and instruction address in the trace unit
 		(0x1E8).  The value is taken directly from the HW.
 
 What:		/sys/bus/coresight/devices/etm<N>/trcidr/trcidr3
diff --git a/Documentation/ABI/testing/sysfs-bus-event_source-devices-events b/Documentation/ABI/testing/sysfs-bus-event_source-devices-events
index 505f080d20a1..77de58d03822 100644
--- a/Documentation/ABI/testing/sysfs-bus-event_source-devices-events
+++ b/Documentation/ABI/testing/sysfs-bus-event_source-devices-events
@@ -47,7 +47,7 @@ Description:	Per-pmu performance monitoring events specific to the running syste
 		If a <term> is specified alone (without an assigned value), it
 		is implied that 0x1 is assigned to that <term>.
 
-		Examples (each of these lines would be in a seperate file):
+		Examples (each of these lines would be in a separate file):
 
 			event=0x2abc
 			event=0x423,inv,cmask=0x3
@@ -83,7 +83,7 @@ Description:	Perf event scaling factors
 
 		A string representing a floating point value expressed in
 		scientific notation to be multiplied by the event count
-		recieved from the kernel to match the unit specified in the
+		received from the kernel to match the unit specified in the
 		<event>.unit file.
 
 		Example:
diff --git a/Documentation/ABI/testing/sysfs-bus-fsi-devices-sbefifo b/Documentation/ABI/testing/sysfs-bus-fsi-devices-sbefifo
index 531fe9d6b40a..1329b0bb2882 100644
--- a/Documentation/ABI/testing/sysfs-bus-fsi-devices-sbefifo
+++ b/Documentation/ABI/testing/sysfs-bus-fsi-devices-sbefifo
@@ -5,6 +5,6 @@ Description:
 		Indicates whether or not this SBE device has experienced a
 		timeout; i.e. the SBE did not respond within the time allotted
 		by the driver. A value of 1 indicates that a timeout has
-		ocurred and no transfers have completed since the timeout. A
-		value of 0 indicates that no timeout has ocurred, or if one
+		occurred and no transfers have completed since the timeout. A
+		value of 0 indicates that no timeout has occurred, or if one
 		has, more recent transfers have completed successful.
diff --git a/Documentation/ABI/testing/sysfs-bus-i2c-devices-fsa9480 b/Documentation/ABI/testing/sysfs-bus-i2c-devices-fsa9480
index 42dfc9399d2d..288bc2fa9547 100644
--- a/Documentation/ABI/testing/sysfs-bus-i2c-devices-fsa9480
+++ b/Documentation/ABI/testing/sysfs-bus-i2c-devices-fsa9480
@@ -8,7 +8,7 @@ Description:
 		NONE     no device
 		USB      USB device is attached
 		UART     UART is attached
-		CHARGER  Charger is attaced
+		CHARGER  Charger is attached
 		JIG      JIG is attached
 		=======  ======================
 
diff --git a/Documentation/ABI/testing/sysfs-bus-nfit b/Documentation/ABI/testing/sysfs-bus-nfit
index e7282d184a74..ed483a11c58c 100644
--- a/Documentation/ABI/testing/sysfs-bus-nfit
+++ b/Documentation/ABI/testing/sysfs-bus-nfit
@@ -121,7 +121,7 @@ KernelVersion:	v4.7
 Contact:	nvdimm@lists.linux.dev
 Description:
 		(RO) ACPI specification 6.2 section 5.2.25.9, defines an
-		identifier for an NVDIMM, which refelects the id attribute.
+		identifier for an NVDIMM, which reflects the id attribute.
 
 
 What:		/sys/bus/nd/devices/nmemX/nfit/subsystem_vendor
diff --git a/Documentation/ABI/testing/sysfs-bus-papr-pmem b/Documentation/ABI/testing/sysfs-bus-papr-pmem
index 4ac0673901e7..46cfe02058fd 100644
--- a/Documentation/ABI/testing/sysfs-bus-papr-pmem
+++ b/Documentation/ABI/testing/sysfs-bus-papr-pmem
@@ -30,7 +30,7 @@ Description:
 				  Indicating that contents of the
 				  NVDIMM have been scrubbed.
 		* "locked"
-				  Indicating that NVDIMM contents cant
+				  Indicating that NVDIMM contents can't
 				  be modified until next power cycle.
 
 What:		/sys/bus/nd/devices/nmemX/papr/perf_stats
diff --git a/Documentation/ABI/testing/sysfs-bus-umc b/Documentation/ABI/testing/sysfs-bus-umc
index 948fec412446..80ef88bc5097 100644
--- a/Documentation/ABI/testing/sysfs-bus-umc
+++ b/Documentation/ABI/testing/sysfs-bus-umc
@@ -9,7 +9,7 @@ Description:
                 Controller (UMC).
 
                 The umc bus presents each of the individual
-                capabilties as a device.
+                capabilities as a device.
 
 What:           /sys/bus/umc/devices/.../capability_id
 Date:           July 2008
diff --git a/Documentation/ABI/testing/sysfs-class b/Documentation/ABI/testing/sysfs-class
index 676530fcf747..906735faa1b8 100644
--- a/Documentation/ABI/testing/sysfs-class
+++ b/Documentation/ABI/testing/sysfs-class
@@ -1,5 +1,5 @@
 What:		/sys/class/
-Date:		Febuary 2006
+Date:		February 2006
 Contact:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 Description:
 		The /sys/class directory will consist of a group of
diff --git a/Documentation/ABI/testing/sysfs-class-cxl b/Documentation/ABI/testing/sysfs-class-cxl
index 594fda254130..cfc48a87706b 100644
--- a/Documentation/ABI/testing/sysfs-class-cxl
+++ b/Documentation/ABI/testing/sysfs-class-cxl
@@ -42,7 +42,7 @@ What:           /sys/class/cxl/<afu>/mmio_size
 Date:           September 2014
 Contact:        linuxppc-dev@lists.ozlabs.org
 Description:    read only
-                Decimal value of the size of the MMIO space that may be mmaped
+                Decimal value of the size of the MMIO space that may be mmapped
                 by userspace.
 Users:		https://github.com/ibm-capi/libcxl
 
@@ -155,7 +155,7 @@ What:           /sys/class/cxl/<afu>m/mmio_size
 Date:           September 2014
 Contact:        linuxppc-dev@lists.ozlabs.org
 Description:    read only
-                Decimal value of the size of the MMIO space that may be mmaped
+                Decimal value of the size of the MMIO space that may be mmapped
                 by userspace. This includes all slave contexts space also.
 Users:		https://github.com/ibm-capi/libcxl
 
diff --git a/Documentation/ABI/testing/sysfs-class-mtd b/Documentation/ABI/testing/sysfs-class-mtd
index 3bc7c0a95c92..f77fa4f6d465 100644
--- a/Documentation/ABI/testing/sysfs-class-mtd
+++ b/Documentation/ABI/testing/sysfs-class-mtd
@@ -39,7 +39,7 @@ KernelVersion:	2.6.29
 Contact:	linux-mtd@lists.infradead.org
 Description:
 		Major and minor numbers of the character device corresponding
-		to the read-only variant of thie MTD device (in
+		to the read-only variant of the MTD device (in
 		<major>:<minor> format).  In this case <minor> will be odd.
 
 What:		/sys/class/mtd/mtdX/erasesize
diff --git a/Documentation/ABI/testing/sysfs-class-net b/Documentation/ABI/testing/sysfs-class-net
index 1419103d11f9..ebf21beba846 100644
--- a/Documentation/ABI/testing/sysfs-class-net
+++ b/Documentation/ABI/testing/sysfs-class-net
@@ -82,7 +82,7 @@ KernelVersion:	2.6.12
 Contact:	netdev@vger.kernel.org
 Description:
 		Indicates the current physical link state of the interface.
-		Posssible values are:
+		Possible values are:
 
 		== =====================
 		0  physical link is down
diff --git a/Documentation/ABI/testing/sysfs-class-net-queues b/Documentation/ABI/testing/sysfs-class-net-queues
index 978b76358661..906ff3ca928a 100644
--- a/Documentation/ABI/testing/sysfs-class-net-queues
+++ b/Documentation/ABI/testing/sysfs-class-net-queues
@@ -39,7 +39,7 @@ Contact:	netdev@vger.kernel.org
 Description:
 		Mask of the CPU(s) currently enabled to participate into the
 		Transmit Packet Steering packet processing flow for this
-		network device transmit queue. Possible vaules depend on the
+		network device transmit queue. Possible values depend on the
 		number of available CPU(s) in the system.
 
 What:		/sys/class/<iface>/queues/tx-<queue>/xps_rxqs
diff --git a/Documentation/ABI/testing/sysfs-class-power-wilco b/Documentation/ABI/testing/sysfs-class-power-wilco
index 82af180fcaab..083c4641b4c4 100644
--- a/Documentation/ABI/testing/sysfs-class-power-wilco
+++ b/Documentation/ABI/testing/sysfs-class-power-wilco
@@ -22,7 +22,7 @@ Description:
 		Long Life:
 			Customized charge rate for last longer battery life.
 			On Wilco device this mode is pre-configured in the factory
-			through EC's private PID. Swiching to a different mode will
+			through EC's private PID. Switching to a different mode will
 			be denied by Wilco EC when Long Life mode is enabled.
 
 What:		/sys/class/power_supply/wilco-charger/charge_control_start_threshold
diff --git a/Documentation/ABI/testing/sysfs-class-remoteproc b/Documentation/ABI/testing/sysfs-class-remoteproc
index 0c9ee55098b8..b2b8e2db2503 100644
--- a/Documentation/ABI/testing/sysfs-class-remoteproc
+++ b/Documentation/ABI/testing/sysfs-class-remoteproc
@@ -81,7 +81,7 @@ Description:	Remote processor coredump configuration
 		collected userspace will directly read from the remote
 		processor's device memory. Extra buffer will not be used to
 		copy the dump. Also recovery process will not proceed until
-		all data is read by usersapce.
+		all data is read by userspace.
 
 What:		/sys/class/remoteproc/.../recovery
 Date:		July 2020
diff --git a/Documentation/ABI/testing/sysfs-class-thermal b/Documentation/ABI/testing/sysfs-class-thermal
index 8eee37982b2a..968d89e15e8e 100644
--- a/Documentation/ABI/testing/sysfs-class-thermal
+++ b/Documentation/ABI/testing/sysfs-class-thermal
@@ -4,7 +4,7 @@ Description:
 		This is given by thermal zone driver as part of registration.
 		E.g: "acpitz" indicates it's an ACPI thermal device.
 		In order to keep it consistent with hwmon sys attribute; this
-		shouldbe a short, lowercase string, not containing spaces nor
+		should be a short, lowercase string, not containing spaces nor
 		dashes.
 
 		RO, Required
diff --git a/Documentation/ABI/testing/sysfs-class-uwb_rc-wusbhc b/Documentation/ABI/testing/sysfs-class-uwb_rc-wusbhc
index 55eb55cac92e..130ea5189b02 100644
--- a/Documentation/ABI/testing/sysfs-class-uwb_rc-wusbhc
+++ b/Documentation/ABI/testing/sysfs-class-uwb_rc-wusbhc
@@ -42,7 +42,7 @@ Date:           June 2013
 KernelVersion:  3.11
 Contact:        Thomas Pugliese <thomas.pugliese@gmail.com>
 Description:
-                The device notification time slot (DNTS) count and inverval in
+                The device notification time slot (DNTS) count and interval in
                 milliseconds that the WUSB host should use.  This controls how
                 often the devices will have the opportunity to send
                 notifications to the host.
diff --git a/Documentation/ABI/testing/sysfs-devices-online b/Documentation/ABI/testing/sysfs-devices-online
index f990026c0740..c3359fec2980 100644
--- a/Documentation/ABI/testing/sysfs-devices-online
+++ b/Documentation/ABI/testing/sysfs-devices-online
@@ -17,4 +17,4 @@ Description:
 		After a successful execution of the bus type's .offline()
 		callback the device cannot be used for any purpose until either
 		it is removed (i.e. device_del() is called for it), or its bus
-		type's .online() is exeucted successfully.
+		type's .online() is executed successfully.
diff --git a/Documentation/ABI/testing/sysfs-driver-ge-achc b/Documentation/ABI/testing/sysfs-driver-ge-achc
index a9e7a079190c..c3e77def4b20 100644
--- a/Documentation/ABI/testing/sysfs-driver-ge-achc
+++ b/Documentation/ABI/testing/sysfs-driver-ge-achc
@@ -5,7 +5,7 @@ Description:	Write 1 to this file to update the ACHC microcontroller
 		firmware via the EzPort interface. For this the kernel
 		will load "achc.bin" via the firmware API (so usually
 		from /lib/firmware). The write will block until the FW
-		has either been flashed successfully or an error occured.
+		has either been flashed successfully or an error occurred.
 
 What:		/sys/bus/spi/<dev>/reset
 Date:		Jul 2021
diff --git a/Documentation/ABI/testing/sysfs-driver-tegra-fuse b/Documentation/ABI/testing/sysfs-driver-tegra-fuse
index 69f5af632657..b8936fad2ccf 100644
--- a/Documentation/ABI/testing/sysfs-driver-tegra-fuse
+++ b/Documentation/ABI/testing/sysfs-driver-tegra-fuse
@@ -3,7 +3,7 @@ Date:		February 2014
 Contact:	Peter De Schrijver <pdeschrijver@nvidia.com>
 Description:	read-only access to the efuses on Tegra20, Tegra30, Tegra114
 		and Tegra124 SoC's from NVIDIA. The efuses contain write once
-		data programmed at the factory. The data is layed out in 32bit
+		data programmed at the factory. The data is laid out in 32bit
 		words in LSB first format. Each bit represents a single value
 		as decoded from the fuse registers. Bits order/assignment
 		exactly matches the HW registers, including any unused bits.
diff --git a/Documentation/ABI/testing/sysfs-firmware-acpi b/Documentation/ABI/testing/sysfs-firmware-acpi
index 819939d858c9..5249ad5a96d9 100644
--- a/Documentation/ABI/testing/sysfs-firmware-acpi
+++ b/Documentation/ABI/testing/sysfs-firmware-acpi
@@ -84,7 +84,7 @@ Description:
 			 hotplug events associated with the given class of
 			 devices and will allow those devices to be ejected with
 			 the help of the _EJ0 control method.  Unsetting it
-			 effectively disables hotplug for the correspoinding
+			 effectively disables hotplug for the corresponding
 			 class of devices.
 		======== =======================================================
 
diff --git a/Documentation/ABI/testing/sysfs-firmware-sgi_uv b/Documentation/ABI/testing/sysfs-firmware-sgi_uv
index 12ed843e1d3e..7fe9244b87bb 100644
--- a/Documentation/ABI/testing/sysfs-firmware-sgi_uv
+++ b/Documentation/ABI/testing/sysfs-firmware-sgi_uv
@@ -102,12 +102,12 @@ Description:
 			conn_port
 
 		The conn_hub entry contains a value representing the unique
-		oridinal value of the hub on the other end of the fabric
+		ordinal value of the hub on the other end of the fabric
 		cable plugged into the port. If the port is disconnected,
 		the value returned will be -1.
 
 		The conn_port entry contains a value representing the unique
-		oridinal value of the port on the other end of the fabric cable
+		ordinal value of the port on the other end of the fabric cable
 		plugged into the port. If the port is disconnected, the value
 		returned will be -1.
 
diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 8140fc98f5ae..ad3d76d37c8b 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -54,9 +54,9 @@ Description:	Controls the in-place-update policy.
 		0x00  DISABLE         disable IPU(=default option in LFS mode)
 		0x01  FORCE           all the time
 		0x02  SSR             if SSR mode is activated
-		0x04  UTIL            if FS utilization is over threashold
+		0x04  UTIL            if FS utilization is over threshold
 		0x08  SSR_UTIL        if SSR mode is activated and FS utilization is over
-		                      threashold
+		                      threshold
 		0x10  FSYNC           activated in fsync path only for high performance
 		                      flash storages. IPU will be triggered only if the
 		                      # of dirty pages over min_fsync_blocks.
@@ -117,7 +117,7 @@ Date:		December 2021
 Contact:	"Konstantin Vyshetsky" <vkon@google.com>
 Description:	Controls the number of discards a thread will issue at a time.
 		Higher number will allow the discard thread to finish its work
-		faster, at the cost of higher latency for incomming I/O.
+		faster, at the cost of higher latency for incoming I/O.
 
 What:		/sys/fs/f2fs/<disk>/min_discard_issue_time
 Date:		December 2021
@@ -334,7 +334,7 @@ Description:	This indicates how many GC can be failed for the pinned
 		state. 2048 trials is set by default.
 
 What:		/sys/fs/f2fs/<disk>/extension_list
-Date:		Feburary 2018
+Date:		February 2018
 Contact:	"Chao Yu" <yuchao0@huawei.com>
 Description:	Used to control configure extension list:
 		- Query: cat /sys/fs/f2fs/<disk>/extension_list
diff --git a/Documentation/ABI/testing/sysfs-kernel-mm-damon b/Documentation/ABI/testing/sysfs-kernel-mm-damon
index 2744f21b5a6b..464ac5c41d7a 100644
--- a/Documentation/ABI/testing/sysfs-kernel-mm-damon
+++ b/Documentation/ABI/testing/sysfs-kernel-mm-damon
@@ -152,7 +152,7 @@ Description:	Writing to and reading from this file sets and gets the action
 What:		/sys/kernel/mm/damon/admin/kdamonds/<K>/contexts/<C>/schemes/<S>/access_pattern/sz/min
 Date:		Mar 2022
 Contact:	SeongJae Park <sj@kernel.org>
-Description:	Writing to and reading from this file sets and gets the mimimum
+Description:	Writing to and reading from this file sets and gets the minimum
 		size of the scheme's target regions in bytes.
 
 What:		/sys/kernel/mm/damon/admin/kdamonds/<K>/contexts/<C>/schemes/<S>/access_pattern/sz/max
diff --git a/Documentation/ABI/testing/sysfs-memory-page-offline b/Documentation/ABI/testing/sysfs-memory-page-offline
index e14703f12fdf..00f4e35f916f 100644
--- a/Documentation/ABI/testing/sysfs-memory-page-offline
+++ b/Documentation/ABI/testing/sysfs-memory-page-offline
@@ -10,7 +10,7 @@ Description:
 		dropping it if possible. The kernel will then be placed
 		on the bad page list and never be reused.
 
-		The offlining is done in kernel specific granuality.
+		The offlining is done in kernel specific granularity.
 		Normally it's the base page size of the kernel, but
 		this might change.
 
@@ -35,7 +35,7 @@ Description:
 		to access this page assuming it's poisoned by the
 		hardware.
 
-		The offlining is done in kernel specific granuality.
+		The offlining is done in kernel specific granularity.
 		Normally it's the base page size of the kernel, but
 		this might change.
 
diff --git a/Documentation/ABI/testing/sysfs-platform-dell-laptop b/Documentation/ABI/testing/sysfs-platform-dell-laptop
index 82bcfe9df66e..701529653283 100644
--- a/Documentation/ABI/testing/sysfs-platform-dell-laptop
+++ b/Documentation/ABI/testing/sysfs-platform-dell-laptop
@@ -15,7 +15,7 @@ KernelVersion:	3.19
 Contact:	Gabriele Mazzotta <gabriele.mzt@gmail.com>,
 		Pali Rohár <pali@kernel.org>
 Description:
-		This file allows to specifiy the on/off threshold value,
+		This file allows to specify the on/off threshold value,
 		as reported by the ambient light sensor.
 
 What:		/sys/class/leds/dell::kbd_backlight/start_triggers
diff --git a/Documentation/ABI/testing/sysfs-platform-dfl-fme b/Documentation/ABI/testing/sysfs-platform-dfl-fme
index d6ab34e81b9b..2d5b78d2cf51 100644
--- a/Documentation/ABI/testing/sysfs-platform-dfl-fme
+++ b/Documentation/ABI/testing/sysfs-platform-dfl-fme
@@ -90,7 +90,7 @@ KernelVersion:  5.4
 Contact:	Wu Hao <hao.wu@intel.com>
 Description:	Read-Write. Read this file to get errors detected on FME.
 		Write this file to clear errors logged in fme_errors. Write
-		fials with -EINVAL if input parsing fails or input error code
+		fails with -EINVAL if input parsing fails or input error code
 		doesn't match.
 
 What:		/sys/bus/platform/devices/dfl-fme.0/errors/first_error
diff --git a/Documentation/ABI/testing/sysfs-platform-kim b/Documentation/ABI/testing/sysfs-platform-kim
index 6a52d6d2b601..0a38caa62a32 100644
--- a/Documentation/ABI/testing/sysfs-platform-kim
+++ b/Documentation/ABI/testing/sysfs-platform-kim
@@ -9,7 +9,7 @@ Description:
 		The device name flows down to architecture specific board
 		initialization file from the ATAGS bootloader
 		firmware. The name exposed is read from the user-space
-		dameon and opens the device when install is requested.
+		daemon and opens the device when install is requested.
 
 What:		/sys/devices/platform/kim/baud_rate
 Date:		January 2010
diff --git a/Documentation/ABI/testing/sysfs-platform-sst-atom b/Documentation/ABI/testing/sysfs-platform-sst-atom
index 0154b0fba759..4bb2e6135c2e 100644
--- a/Documentation/ABI/testing/sysfs-platform-sst-atom
+++ b/Documentation/ABI/testing/sysfs-platform-sst-atom
@@ -4,7 +4,7 @@ KernelVersion:	4.10
 Contact:	"Sebastien Guiriec" <sebastien.guiriec@intel.com>
 Description:
 		LPE Firmware version for SST driver on all atom
-		plaforms (BYT/CHT/Merrifield/BSW).
+		platforms (BYT/CHT/Merrifield/BSW).
 		If the FW has never been loaded it will display::
 
 			"FW not yet loaded"
-- 
2.34.1


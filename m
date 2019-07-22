Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5C41A7DE71
	for <lwn-linux-doc@archive.lwn.net>; Mon, 22 Jul 2019 11:08:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729828AbfGVLIJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 22 Jul 2019 07:08:09 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:35590 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729837AbfGVLIA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Jul 2019 07:08:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=gd4J0bbu1ipQCr2My/0fok5HjhzOXzBvJ2dZeAPcXck=; b=Heo5gYOWh3PP18qYx446Ku4xnZ
        x2bDfMImeOFnmEB1gRBo0Qyfa/5kUj628uCm+b/NJ7BhgpEaNXmxD1GtUvPFjBXVhP3ICnqfkbXWS
        OGTGodBx+0uMxTT3+D+xZXVMQ9jFXP5e8wY9APh5tSg50eQnjPHkrHZQgRJzV1IoTCSCdrqxGfSTE
        5j1uFxFUfywwhSzgv35NQRhLy9rq8IGy51iAI/ruk9+sZdoXiF8aVMU2Cj4ZOElz97WQuW2WZPWP1
        LxiAZ6l8KavD0Dvqlbzt/2DPIrfEULvubA3wJ6ka9ic/HE6dOXvt8nfHsUe9Knt9PvZUcXZoR6zJj
        zXk9oh8Q==;
Received: from 177.157.124.3.dynamic.adsl.gvt.net.br ([177.157.124.3] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hpWAh-000255-B1; Mon, 22 Jul 2019 11:07:59 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hpWAa-00041g-Dh; Mon, 22 Jul 2019 08:07:52 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Inaky Perez-Gonzalez <inaky.perez-gonzalez@intel.com>,
        linux-wimax@intel.com, linux-doc@vger.kernel.org
Subject: [PATCH 16/22] docs: wimax: convert to ReST and add to admin-guide
Date:   Mon, 22 Jul 2019 08:07:43 -0300
Message-Id: <01084472b235bdb56304c850dfcf0dfb116c2597.1563792334.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1563792333.git.mchehab+samsung@kernel.org>
References: <cover.1563792333.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Manually convert wimax documentation to ReST and add theit
to the Kernel doc body, inside the admin-guide.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/admin-guide/index.rst           |   1 +
 .../wimax/i2400m.rst}                         | 145 ++++++++++--------
 Documentation/admin-guide/wimax/index.rst     |  19 +++
 .../wimax/wimax.rst}                          |  36 +++--
 MAINTAINERS                                   |   4 +-
 5 files changed, 128 insertions(+), 77 deletions(-)
 rename Documentation/{wimax/README.i2400m => admin-guide/wimax/i2400m.rst} (69%)
 create mode 100644 Documentation/admin-guide/wimax/index.rst
 rename Documentation/{wimax/README.wimax => admin-guide/wimax/wimax.rst} (74%)

diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
index 4a9de9806eaf..6bd211832bd7 100644
--- a/Documentation/admin-guide/index.rst
+++ b/Documentation/admin-guide/index.rst
@@ -110,6 +110,7 @@ configure specific aspects of kernel behavior to your liking.
    pnp
    rtc
    svga
+   wimax/index
    video-output
 
 .. only::  subproject and html
diff --git a/Documentation/wimax/README.i2400m b/Documentation/admin-guide/wimax/i2400m.rst
similarity index 69%
rename from Documentation/wimax/README.i2400m
rename to Documentation/admin-guide/wimax/i2400m.rst
index 7dffd8919cb0..194388c0c351 100644
--- a/Documentation/wimax/README.i2400m
+++ b/Documentation/admin-guide/wimax/i2400m.rst
@@ -1,18 +1,23 @@
+.. include:: <isonum.txt>
 
-   Driver for the Intel Wireless Wimax Connection 2400m
+====================================================
+Driver for the Intel Wireless Wimax Connection 2400m
+====================================================
 
-   (C) 2008 Intel Corporation < linux-wimax@intel.com >
+:Copyright: |copy| 2008 Intel Corporation < linux-wimax@intel.com >
 
    This provides a driver for the Intel Wireless WiMAX Connection 2400m
    and a basic Linux kernel WiMAX stack.
 
 1. Requirements
+===============
 
      * Linux installation with Linux kernel 2.6.22 or newer (if building
        from a separate tree)
      * Intel i2400m Echo Peak or Baxter Peak; this includes the Intel
        Wireless WiMAX/WiFi Link 5x50 series.
      * build tools:
+
           + Linux kernel development package for the target kernel; to
             build against your currently running kernel, you need to have
             the kernel development package corresponding to the running
@@ -22,8 +27,10 @@
           + GNU C Compiler, make
 
 2. Compilation and installation
+===============================
 
 2.1. Compilation of the drivers included in the kernel
+------------------------------------------------------
 
    Configure the kernel; to enable the WiMAX drivers select Drivers >
    Networking Drivers > WiMAX device support. Enable all of them as
@@ -36,37 +43,39 @@
    Compile and install your kernel as usual.
 
 2.2. Compilation of the drivers distributed as an standalone module
+-------------------------------------------------------------------
 
-   To compile
+   To compile::
 
-$ cd source/directory
-$ make
+	$ cd source/directory
+	$ make
 
    Once built you can load and unload using the provided load.sh script;
    load.sh will load the modules, load.sh u will unload them.
 
    To install in the default kernel directories (and enable auto loading
-   when the device is plugged):
+   when the device is plugged)::
 
-$ make install
-$ depmod -a
+	$ make install
+	$ depmod -a
 
    If your kernel development files are located in a non standard
    directory or if you want to build for a kernel that is not the
-   currently running one, set KDIR to the right location:
+   currently running one, set KDIR to the right location::
 
-$ make KDIR=/path/to/kernel/dev/tree
+	$ make KDIR=/path/to/kernel/dev/tree
 
    For more information, please contact linux-wimax@intel.com.
 
 3. Installing the firmware
+--------------------------
 
    The firmware can be obtained from http://linuxwimax.org or might have
    been supplied with your hardware.
 
-   It has to be installed in the target system:
-     *
-$ cp FIRMWAREFILE.sbcf /lib/firmware/i2400m-fw-BUSTYPE-1.3.sbcf
+   It has to be installed in the target system::
+
+	$ cp FIRMWAREFILE.sbcf /lib/firmware/i2400m-fw-BUSTYPE-1.3.sbcf
 
      * NOTE: if your firmware came in an .rpm or .deb file, just install
        it as normal, with the rpm (rpm -i FIRMWARE.rpm) or dpkg
@@ -76,6 +85,7 @@ $ cp FIRMWAREFILE.sbcf /lib/firmware/i2400m-fw-BUSTYPE-1.3.sbcf
        with other types.
 
 4. Design
+=========
 
    This package contains two major parts: a WiMAX kernel stack and a
    driver for the Intel i2400m.
@@ -102,16 +112,17 @@ $ cp FIRMWAREFILE.sbcf /lib/firmware/i2400m-fw-BUSTYPE-1.3.sbcf
    API calls should be replaced with the target OS's.
 
 5. Usage
+========
 
    To load the driver, follow the instructions in the install section;
    once the driver is loaded, plug in the device (unless it is permanently
    plugged in). The driver will enumerate the device, upload the firmware
    and output messages in the kernel log (dmesg, /var/log/messages or
-   /var/log/kern.log) such as:
+   /var/log/kern.log) such as::
 
-...
-i2400m_usb 5-4:1.0: firmware interface version 8.0.0
-i2400m_usb 5-4:1.0: WiMAX interface wmx0 (00:1d:e1:01:94:2c) ready
+	...
+	i2400m_usb 5-4:1.0: firmware interface version 8.0.0
+	i2400m_usb 5-4:1.0: WiMAX interface wmx0 (00:1d:e1:01:94:2c) ready
 
    At this point the device is ready to work.
 
@@ -120,38 +131,42 @@ i2400m_usb 5-4:1.0: WiMAX interface wmx0 (00:1d:e1:01:94:2c) ready
    on how to scan, connect and disconnect.
 
 5.1. Module parameters
+----------------------
 
    Module parameters can be set at kernel or module load time or by
-   echoing values:
+   echoing values::
 
-$ echo VALUE > /sys/module/MODULENAME/parameters/PARAMETERNAME
+	$ echo VALUE > /sys/module/MODULENAME/parameters/PARAMETERNAME
 
    To make changes permanent, for example, for the i2400m module, you can
-   also create a file named /etc/modprobe.d/i2400m containing:
+   also create a file named /etc/modprobe.d/i2400m containing::
 
-options i2400m idle_mode_disabled=1
+	options i2400m idle_mode_disabled=1
 
-   To find which parameters are supported by a module, run:
+   To find which parameters are supported by a module, run::
 
-$ modinfo path/to/module.ko
+	$ modinfo path/to/module.ko
 
    During kernel bootup (if the driver is linked in the kernel), specify
-   the following to the kernel command line:
+   the following to the kernel command line::
 
-i2400m.PARAMETER=VALUE
+	i2400m.PARAMETER=VALUE
 
 5.1.1. i2400m: idle_mode_disabled
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
    The i2400m module supports a parameter to disable idle mode. This
    parameter, once set, will take effect only when the device is
    reinitialized by the driver (eg: following a reset or a reconnect).
 
 5.2. Debug operations: debugfs entries
+--------------------------------------
 
    The driver will register debugfs entries that allow the user to tweak
    debug settings. There are three main container directories where
    entries are placed, which correspond to the three blocks a i2400m WiMAX
    driver has:
+
      * /sys/kernel/debug/wimax:DEVNAME/ for the generic WiMAX stack
        controls
      * /sys/kernel/debug/wimax:DEVNAME/i2400m for the i2400m generic
@@ -163,52 +178,55 @@ i2400m.PARAMETER=VALUE
    /sys/kernel/debug, those paths will change.
 
 5.2.1. Increasing debug output
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
    The files named *dl_* indicate knobs for controlling the debug output
-   of different submodules:
-     *
-# find /sys/kernel/debug/wimax\:wmx0 -name \*dl_\*
-/sys/kernel/debug/wimax:wmx0/i2400m-usb/dl_tx
-/sys/kernel/debug/wimax:wmx0/i2400m-usb/dl_rx
-/sys/kernel/debug/wimax:wmx0/i2400m-usb/dl_notif
-/sys/kernel/debug/wimax:wmx0/i2400m-usb/dl_fw
-/sys/kernel/debug/wimax:wmx0/i2400m-usb/dl_usb
-/sys/kernel/debug/wimax:wmx0/i2400m/dl_tx
-/sys/kernel/debug/wimax:wmx0/i2400m/dl_rx
-/sys/kernel/debug/wimax:wmx0/i2400m/dl_rfkill
-/sys/kernel/debug/wimax:wmx0/i2400m/dl_netdev
-/sys/kernel/debug/wimax:wmx0/i2400m/dl_fw
-/sys/kernel/debug/wimax:wmx0/i2400m/dl_debugfs
-/sys/kernel/debug/wimax:wmx0/i2400m/dl_driver
-/sys/kernel/debug/wimax:wmx0/i2400m/dl_control
-/sys/kernel/debug/wimax:wmx0/wimax_dl_stack
-/sys/kernel/debug/wimax:wmx0/wimax_dl_op_rfkill
-/sys/kernel/debug/wimax:wmx0/wimax_dl_op_reset
-/sys/kernel/debug/wimax:wmx0/wimax_dl_op_msg
-/sys/kernel/debug/wimax:wmx0/wimax_dl_id_table
-/sys/kernel/debug/wimax:wmx0/wimax_dl_debugfs
+   of different submodules::
+
+	# find /sys/kernel/debug/wimax\:wmx0 -name \*dl_\*
+	/sys/kernel/debug/wimax:wmx0/i2400m-usb/dl_tx
+	/sys/kernel/debug/wimax:wmx0/i2400m-usb/dl_rx
+	/sys/kernel/debug/wimax:wmx0/i2400m-usb/dl_notif
+	/sys/kernel/debug/wimax:wmx0/i2400m-usb/dl_fw
+	/sys/kernel/debug/wimax:wmx0/i2400m-usb/dl_usb
+	/sys/kernel/debug/wimax:wmx0/i2400m/dl_tx
+	/sys/kernel/debug/wimax:wmx0/i2400m/dl_rx
+	/sys/kernel/debug/wimax:wmx0/i2400m/dl_rfkill
+	/sys/kernel/debug/wimax:wmx0/i2400m/dl_netdev
+	/sys/kernel/debug/wimax:wmx0/i2400m/dl_fw
+	/sys/kernel/debug/wimax:wmx0/i2400m/dl_debugfs
+	/sys/kernel/debug/wimax:wmx0/i2400m/dl_driver
+	/sys/kernel/debug/wimax:wmx0/i2400m/dl_control
+	/sys/kernel/debug/wimax:wmx0/wimax_dl_stack
+	/sys/kernel/debug/wimax:wmx0/wimax_dl_op_rfkill
+	/sys/kernel/debug/wimax:wmx0/wimax_dl_op_reset
+	/sys/kernel/debug/wimax:wmx0/wimax_dl_op_msg
+	/sys/kernel/debug/wimax:wmx0/wimax_dl_id_table
+	/sys/kernel/debug/wimax:wmx0/wimax_dl_debugfs
 
    By reading the file you can obtain the current value of said debug
    level; by writing to it, you can set it.
 
    To increase the debug level of, for example, the i2400m's generic TX
-   engine, just write:
+   engine, just write::
 
-$ echo 3 > /sys/kernel/debug/wimax:wmx0/i2400m/dl_tx
+	$ echo 3 > /sys/kernel/debug/wimax:wmx0/i2400m/dl_tx
 
    Increasing numbers yield increasing debug information; for details of
    what is printed and the available levels, check the source. The code
    uses 0 for disabled and increasing values until 8.
 
 5.2.2. RX and TX statistics
+^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
    The i2400m/rx_stats and i2400m/tx_stats provide statistics about the
-   data reception/delivery from the device:
+   data reception/delivery from the device::
 
-$ cat /sys/kernel/debug/wimax:wmx0/i2400m/rx_stats
-45 1 3 34 3104 48 480
+	$ cat /sys/kernel/debug/wimax:wmx0/i2400m/rx_stats
+	45 1 3 34 3104 48 480
+
+   The numbers reported are:
 
-   The numbers reported are
      * packets/RX-buffer: total, min, max
      * RX-buffers: total RX buffers received, accumulated RX buffer size
        in bytes, min size received, max size received
@@ -216,9 +234,9 @@ $ cat /sys/kernel/debug/wimax:wmx0/i2400m/rx_stats
    Thus, to find the average buffer size received, divide accumulated
    RX-buffer / total RX-buffers.
 
-   To clear the statistics back to 0, write anything to the rx_stats file:
+   To clear the statistics back to 0, write anything to the rx_stats file::
 
-$ echo 1 > /sys/kernel/debug/wimax:wmx0/i2400m_rx_stats
+	$ echo 1 > /sys/kernel/debug/wimax:wmx0/i2400m_rx_stats
 
    Likewise for TX.
 
@@ -227,14 +245,16 @@ $ echo 1 > /sys/kernel/debug/wimax:wmx0/i2400m_rx_stats
    to the host. See drivers/net/wimax/i2400m/tx.c.
 
 5.2.3. Tracing messages received from user space
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
    To echo messages received from user space into the trace pipe that the
    i2400m driver creates, set the debug file i2400m/trace_msg_from_user to
-   1:
-     *
-$ echo 1 > /sys/kernel/debug/wimax:wmx0/i2400m/trace_msg_from_user
+   1::
+
+	$ echo 1 > /sys/kernel/debug/wimax:wmx0/i2400m/trace_msg_from_user
 
 5.2.4. Performing a device reset
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
    By writing a 0, a 1 or a 2 to the file
    /sys/kernel/debug/wimax:wmx0/reset, the driver performs a warm (without
@@ -242,18 +262,21 @@ $ echo 1 > /sys/kernel/debug/wimax:wmx0/i2400m/trace_msg_from_user
    (bus specific) reset on the device.
 
 5.2.5. Asking the device to enter power saving mode
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
    By writing any value to the /sys/kernel/debug/wimax:wmx0 file, the
    device will attempt to enter power saving mode.
 
 6. Troubleshooting
+==================
 
-6.1. Driver complains about 'i2400m-fw-usb-1.2.sbcf: request failed'
+6.1. Driver complains about ``i2400m-fw-usb-1.2.sbcf: request failed``
+----------------------------------------------------------------------
 
    If upon connecting the device, the following is output in the kernel
-   log:
+   log::
 
-i2400m_usb 5-4:1.0: fw i2400m-fw-usb-1.3.sbcf: request failed: -2
+	i2400m_usb 5-4:1.0: fw i2400m-fw-usb-1.3.sbcf: request failed: -2
 
    This means that the driver cannot locate the firmware file named
    /lib/firmware/i2400m-fw-usb-1.2.sbcf. Check that the file is present in
diff --git a/Documentation/admin-guide/wimax/index.rst b/Documentation/admin-guide/wimax/index.rst
new file mode 100644
index 000000000000..fdf7c1f99ff5
--- /dev/null
+++ b/Documentation/admin-guide/wimax/index.rst
@@ -0,0 +1,19 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===============
+WiMAX subsystem
+===============
+
+.. toctree::
+   :maxdepth: 2
+
+   wimax
+
+   i2400m
+
+.. only::  subproject and html
+
+   Indices
+   =======
+
+   * :ref:`genindex`
diff --git a/Documentation/wimax/README.wimax b/Documentation/admin-guide/wimax/wimax.rst
similarity index 74%
rename from Documentation/wimax/README.wimax
rename to Documentation/admin-guide/wimax/wimax.rst
index b78c4378084e..817ee8ba2732 100644
--- a/Documentation/wimax/README.wimax
+++ b/Documentation/admin-guide/wimax/wimax.rst
@@ -1,12 +1,16 @@
+.. include:: <isonum.txt>
 
-   Linux kernel WiMAX stack
+========================
+Linux kernel WiMAX stack
+========================
 
-   (C) 2008 Intel Corporation < linux-wimax@intel.com >
+:Copyright: |copy| 2008 Intel Corporation < linux-wimax@intel.com >
 
    This provides a basic Linux kernel WiMAX stack to provide a common
    control API for WiMAX devices, usable from kernel and user space.
 
 1. Design
+=========
 
    The WiMAX stack is designed to provide for common WiMAX control
    services to current and future WiMAX devices from any vendor.
@@ -31,6 +35,7 @@
    include/linux/wimax.h.
 
 2. Usage
+========
 
    For usage in a driver (registration, API, etc) please refer to the
    instructions in the header file include/linux/wimax.h.
@@ -40,6 +45,7 @@
    control.
 
 2.1. Obtaining debug information: debugfs entries
+-------------------------------------------------
 
    The WiMAX stack is compiled, by default, with debug messages that can
    be used to diagnose issues. By default, said messages are disabled.
@@ -52,20 +58,22 @@
    create more subentries below it.
 
 2.1.1. Increasing debug output
+------------------------------
 
    The files named *dl_* indicate knobs for controlling the debug output
-   of different submodules of the WiMAX stack:
-     *
-# find /sys/kernel/debug/wimax\:wmx0 -name \*dl_\*
-/sys/kernel/debug/wimax:wmx0/wimax_dl_stack
-/sys/kernel/debug/wimax:wmx0/wimax_dl_op_rfkill
-/sys/kernel/debug/wimax:wmx0/wimax_dl_op_reset
-/sys/kernel/debug/wimax:wmx0/wimax_dl_op_msg
-/sys/kernel/debug/wimax:wmx0/wimax_dl_id_table
-/sys/kernel/debug/wimax:wmx0/wimax_dl_debugfs
-/sys/kernel/debug/wimax:wmx0/.... # other driver specific files
+   of different submodules of the WiMAX stack::
 
-       NOTE: Of course, if debugfs is mounted in a directory other than
+	# find /sys/kernel/debug/wimax\:wmx0 -name \*dl_\*
+	/sys/kernel/debug/wimax:wmx0/wimax_dl_stack
+	/sys/kernel/debug/wimax:wmx0/wimax_dl_op_rfkill
+	/sys/kernel/debug/wimax:wmx0/wimax_dl_op_reset
+	/sys/kernel/debug/wimax:wmx0/wimax_dl_op_msg
+	/sys/kernel/debug/wimax:wmx0/wimax_dl_id_table
+	/sys/kernel/debug/wimax:wmx0/wimax_dl_debugfs
+	/sys/kernel/debug/wimax:wmx0/.... # other driver specific files
+
+   NOTE:
+       Of course, if debugfs is mounted in a directory other than
        /sys/kernel/debug, those paths will change.
 
    By reading the file you can obtain the current value of said debug
@@ -74,7 +82,7 @@
    To increase the debug level of, for example, the id-table submodule,
    just write:
 
-$ echo 3 > /sys/kernel/debug/wimax:wmx0/wimax_dl_id_table
+	$ echo 3 > /sys/kernel/debug/wimax:wmx0/wimax_dl_id_table
 
    Increasing numbers yield increasing debug information; for details of
    what is printed and the available levels, check the source. The code
diff --git a/MAINTAINERS b/MAINTAINERS
index c8c09d4062a1..665c3c1e939b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8346,7 +8346,7 @@ M:	linux-wimax@intel.com
 L:	wimax@linuxwimax.org (subscribers-only)
 S:	Supported
 W:	http://linuxwimax.org
-F:	Documentation/wimax/README.i2400m
+F:	Documentation/admin-guide/wimax/i2400m.rst
 F:	drivers/net/wimax/i2400m/
 F:	include/uapi/linux/wimax/i2400m.h
 
@@ -17348,7 +17348,7 @@ M:	linux-wimax@intel.com
 L:	wimax@linuxwimax.org (subscribers-only)
 S:	Supported
 W:	http://linuxwimax.org
-F:	Documentation/wimax/README.wimax
+F:	Documentation/admin-guide/wimax/wimax.rst
 F:	include/linux/wimax/debug.h
 F:	include/net/wimax.h
 F:	include/uapi/linux/wimax.h
-- 
2.21.0


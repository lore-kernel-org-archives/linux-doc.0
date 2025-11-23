Received: from mail-m1973181.qiye.163.com (mail-m1973181.qiye.163.com [220.197.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA4122D4DD
	for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 07:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763884243; cv=none; b=lauHsuaj4vAZDLlZeUktqjyg7sEK/D8f4sZhhn/Y6MGP5nefvL9LbwEBIOaNE/uu0cIGY9irbAdHWi03iLUO74XjOsLSZtAxQnDKsuNxtyNS6JqsG27F0XbYCz/6kr8DYTIc+2u5iCWWyEzEPfh0BU1Vv0Ydsal/kMBZauUyw2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763884243; c=relaxed/simple;
	bh=hUStUanHOrbd4+yNIoJELN7RATouHa4ox9UlRUXGung=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KovbrHgNt+qF634+4eVygsfCoRKeS5n10gaGh7S4xc6zQeJ4h7EtiNFyulVWku52sW0z/MCTPkdRCOR2w15fOGzMiEeSKL7gibx8HkcaY06re2fUScyhxpH4dSJHwMmPKguLxObGf3W7LrAZz0xuor2/i0cUHdnkgmaqjH6oVlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=XP+PXPYD; arc=none smtp.client-ip=220.197.31.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="XP+PXPYD"
Received: from server001 (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2a8df99c2;
	Sun, 23 Nov 2025 15:45:23 +0800 (GMT+08:00)
From: macrofun <baikefan@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 14/25] docs/zh_CN: Add gadget_uvc.rst translation
Date: Sun, 23 Nov 2025 15:45:29 +0800
Message-ID: <20251123074540.34161-15-baikefan@leap-io-kernel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251123074540.34161-1-baikefan@leap-io-kernel.com>
References: <20251123074540.34161-1-baikefan@leap-io-kernel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9aafacb63c09d5kunm0cca719828664c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDSUIaVhhCTk1OH0NCTx9NQlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0NMVUpLS1
	VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=XP+PXPYDTNDvmkehvVqk1iRA9MTdcxLyhXsiHNQcfTa5GnNW/IrD2w77GkTqEycu6UXfx0AqNVXrLpqRSovSOhGWMmXAT+W84gsQD4C3OQJDloYUqss2HcxKArtsPvUHPEo7acjgovJwmlDuvlWBLix7zzTRqPGZlCMyaXa2WGD76pendeNRV+oy9cB+QSrQSesNYjXdFvEg1cgidnqU3t6IZql0U185gqqHcvl/UMmIlVavb07O7JSpUKzhEKeJSC+kjAVQYF7e3iRS+ex/bOexLawzJn35dk2P6W5jKR5CFjTksnwZVnBYtof1Hc+3LeLF9Vjs2u4Y2e8apS4wLg==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=aaDfUNN4p3scNLTe8T0++gqCK1LffRumO8XAVlwkev4=;
	h=date:mime-version:subject:message-id:from;

Translate .../usb/gadget_uvc.rst into Chinese.

Update the translation through commit 16794ed32de9
("docs: usb: fix reference to nonexistent file in UVC Gadget")

Signed-off-by: macrofun <baikefan@leap-io-kernel.com>
---
 .../translations/zh_CN/usb/gadget_uvc.rst     | 372 ++++++++++++++++++
 1 file changed, 372 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/usb/gadget_uvc.rst

diff --git a/Documentation/translations/zh_CN/usb/gadget_uvc.rst b/Documentation/translations/zh_CN/usb/gadget_uvc.rst
new file mode 100644
index 000000000000..de53a05a2c76
--- /dev/null
+++ b/Documentation/translations/zh_CN/usb/gadget_uvc.rst
@@ -0,0 +1,372 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/usb/gadget_uvc.rst
+:翻译:
+
+ 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
+
+:校译:
+
+
+
+======================
+Linux UVC Gadget 驱动
+======================
+
+概述
+------
+UVC Gadget 驱动是针对 USB 设备端硬件的驱动，
+适用于在具有 USB 设备端硬件（例如带 OTG 接口的开发板）的 Linux 系统上运行。
+
+在设备系统上，一旦驱动绑定成功，它会以 V4L2 设备的形式出现，并具有输出能力。
+
+在主机端（通过 USB 连接后），
+运行 UVC Gadget 驱动的设备（由相应用户空间程序控制）
+应表现为符合 UVC 规范的摄像头，并能与任何支持 UVC 的程序正常工作。
+设备端的用户空间程序可以将来自各种源的图像缓冲区排入队列，
+通过 USB 传输。通常，这意味着转发来自摄像头传感器的缓冲区，
+但缓冲区的来源完全由用户空间程序决定。
+
+配置设备内核
+--------------
+要启用 UVC Gadget 支持，必须在内核 Kconfig 中选择以下选项:
+USB_CONFIGFS, USB_LIBCOMPOSITE, USB_CONFIGFS_F_UVC和
+USB_F_UVC。
+
+通过 configfs 配置 Gadget
+---------------------------
+UVC Gadget 通过 configfs 使用 UVC 功能进行配置。
+这种方式提供了很大灵活性，因为 UVC 设备的许多设置可以通过它控制。
+
+并非所有可用的属性都在此处描述。有关完整的枚举，
+请参阅 Documentation/ABI/testing/configfs-usb-gadget-uvc
+
+前提条件
+~~~~~~~~~~~
+假设你已将 configfs 挂载到 `/sys/kernel/config` 并
+创建了一个 gadget，路径为 `/sys/kernel/config/usb_gadget/g1`。
+
+UVC 功能
+~~~~~~~~~~~
+第一步是创建 UVC 功能：
+
+.. code-block:: bash
+
+	# These variables will be assumed throughout the rest of the document
+	CONFIGFS="/sys/kernel/config"
+	GADGET="$CONFIGFS/usb_gadget/g1"
+	FUNCTION="$GADGET/functions/uvc.0"
+
+	mkdir -p $FUNCTION
+
+格式与帧
+~~~~~~~~~~
+
+必须告诉 gadget 支持哪些格式，以及每种格式支持的帧大小和帧间隔。
+当前实现中，gadget 无法拒绝主机要求设置的格式，
+因此必须准确配置，以确保主机不会请求无法提供的格式。
+
+格式在 streaming/uncompressed 和 streaming/mjpeg configfs 分组下创建，
+帧大小在格式下创建，结构如下：
+
+::
+
+	uvc.0 +
+	      |
+	      + streaming +
+			  |
+			  + mjpeg +
+			  |       |
+			  |       + mjpeg +
+			  |	       |
+			  |	       + 720p
+			  |	       |
+			  |	       + 1080p
+			  |
+			  + uncompressed +
+					 |
+					 + yuyv +
+						|
+						+ 720p
+						|
+						+ 1080p
+
+每个帧都可以配置宽度和高度，以及存储单个帧所需的最大缓冲区大小，
+最后还可以配置该格式和帧大小所支持的帧间隔。
+宽度和高度以像素为单位枚举，
+帧间隔以 100ns 为单位。
+例如，要为每个帧大小创建上面结构中 2、15 和 100 fps 的帧间隔，
+可以这样操作：
+
+.. code-block:: bash
+
+	create_frame() {
+		# 示例用法:
+		# create_frame <width> <height> <group> <format name>
+
+		WIDTH=$1
+		HEIGHT=$2
+		FORMAT=$3
+		NAME=$4
+
+		wdir=$FUNCTION/streaming/$FORMAT/$NAME/${HEIGHT}p
+
+		mkdir -p $wdir
+		echo $WIDTH > $wdir/wWidth
+		echo $HEIGHT > $wdir/wHeight
+		echo $(( $WIDTH * $HEIGHT * 2 )) > $wdir/dwMaxVideoFrameBufferSize
+		cat <<EOF > $wdir/dwFrameInterval
+	666666
+	100000
+	5000000
+	EOF
+	}
+
+	create_frame 1280 720 uncompressed yuyv
+	create_frame 1920 1080 uncompressed yuyv
+
+目前唯一支持的未压缩格式是YUYV，
+详细说明请参见Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst。
+
+颜色匹配描述符
+~~~~~~~~~~~~~~
+可以为你创建的每种格式指定一些色彩信息。
+此步骤为可选操作，如果跳过该步骤，
+将使用默认信息；
+这些默认值遵循UVC规范中Color Matching Descriptor部分的定义。
+
+要创建颜色匹配描述符，需要先创建一个configfs item，
+并将其三个属性设置为你期望的值，然后从希望关联的格式中链接到该item：
+
+.. code-block:: bash
+
+	# Create a new Color Matching Descriptor
+
+	mkdir $FUNCTION/streaming/color_matching/yuyv
+	pushd $FUNCTION/streaming/color_matching/yuyv
+
+	echo 1 > bColorPrimaries
+	echo 1 > bTransferCharacteristics
+	echo 4 > bMatrixCoefficients
+
+	popd
+
+	# Create a symlink to the Color Matching Descriptor from the format's config item
+	ln -s $FUNCTION/streaming/color_matching/yuyv $FUNCTION/streaming/uncompressed/yuyv
+
+有关有效值的详细信息，请参阅UVC规范。
+请注意，存在一个默认的Color Matching Descriptor，
+任何没有链接到其他Color Matching Descriptor的格式都会使用它。
+可以修改默认描述符的属性设置，但请注意，
+如果你这样做，就会改变所有未链接到其他描述符的格式的默认设置。
+
+
+头部链接
+~~~~~~~~~~~~~~~
+
+UVC规范要求Format和Frame描述符之前必须有头部（Header），
+用于描述随后不同Format描述符的数量和累计大小等信息。
+在configfs中，这类操作是通过将表示头部的
+configfs item与表示其他描述符的config item进行链接来实现的，方式如下：
+
+.. code-block:: bash
+
+	mkdir $FUNCTION/streaming/header/h
+
+	# This section links the format descriptors and their associated frames
+	# to the header
+	cd $FUNCTION/streaming/header/h
+	ln -s ../../uncompressed/yuyv
+	ln -s ../../mjpeg/mjpeg
+
+	# This section ensures that the header will be transmitted for each
+	# speed's set of descriptors. If support for a particular speed is not
+	# needed then it can be skipped here.
+	cd ../../class/fs
+	ln -s ../../header/h
+	cd ../../class/hs
+	ln -s ../../header/h
+	cd ../../class/ss
+	ln -s ../../header/h
+	cd ../../../control
+	mkdir header/h
+	ln -s header/h class/fs
+	ln -s header/h class/ss
+
+
+扩展单元支持
+~~~~~~~~~~~~~~~
+
+UVC扩展单元（XU）基本上提供了一个独立的单元，
+可以向其发送控制的set和get请求。
+这些控制请求的含义完全依赖于具体实现，
+但可用于控制UVC规范之外的设置（例如启用或禁用视频效果）。
+XU可以插入到UVC单元链中，也可以保持独立悬挂。
+
+配置扩展单元涉及在相应目录中创建一个条目，并适当地设置其属性，如下所示：
+
+.. code-block:: bash
+
+	mkdir $FUNCTION/control/extensions/xu.0
+	pushd $FUNCTION/control/extensions/xu.0
+
+	# Set the bUnitID of the Processing Unit as the source for this
+	# Extension Unit
+	echo 2 > baSourceID
+
+	# Set this XU as the source of the default output terminal. This inserts
+	# the XU into the UVC chain between the PU and OT such that the final
+	# chain is IT > PU > XU.0 > OT
+	cat bUnitID > ../../terminal/output/default/baSourceID
+
+	# Flag some controls as being available for use. The bmControl field is
+	# a bitmap with each bit denoting the availability of a particular
+	# control. For example to flag the 0th, 2nd and 3rd controls available:
+	echo 0x0d > bmControls
+
+	# Set the GUID; this is a vendor-specific code identifying the XU.
+	echo -e -n "\x01\x02\x03\x04\x05\x06\x07\x08\x09\x0a\x0b\x0c\x0d\x0e\x0f\x10" > guidExtensionCode
+
+	popd
+
+bmControls属性和baSourceID属性是多值属性。
+这意味着你可以向它们写入多个以换行符分隔的值。
+例如，要标记第1、第2、第9和第10个控制可用，
+你需要向bmControls写入两个值，如下所示：
+
+.. code-block:: bash
+
+	cat << EOF > bmControls
+	0x03
+	0x03
+	EOF
+
+baSourceID属性的多值特性暗示了XU可以有多个输入，但请注意，这目前没有显著影响。
+
+bControlSize属性表示bmControls属性的大小，
+类似地，bNrInPins表示baSourceID属性的大小。
+随着你设置bmControls和baSourceID，这两个属性会自动增减。
+也可以手动增加或减少bControlSize，
+这会导致条目被截断到新的大小，或者用0x00填充条目，例如：
+
+::
+
+	$ cat bmControls
+	0x03
+	0x05
+
+	$ cat bControlSize
+	2
+
+	$ echo 1 > bControlSize
+	$ cat bmControls
+	0x03
+
+	$ echo 2 > bControlSize
+	$ cat bmControls
+	0x03
+	0x00
+
+bNrInPins和baSourceID的功能相同。
+
+配置摄像头终端和处理单元的支持控制
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+UVC链中的摄像头终端（Camera Terminal）和处理单元（Processing Unit）
+也具有bmControls属性，其功能与扩展单元（XU）中的相同字段类似。
+然而，与XU不同的是，这些单元的位标志含义在UVC规范中已有定义；
+有关标志的枚举，请参阅“Camera Terminal Descriptor”和
+“Processing Unit Descriptor”部分。
+
+.. code-block:: bash
+
+        # Set the Processing Unit's bmControls, flagging Brightness, Contrast
+        # and Hue as available controls:
+        echo 0x05 > $FUNCTION/control/processing/default/bmControls
+
+        # Set the Camera Terminal's bmControls, flagging Focus Absolute and
+        # Focus Relative as available controls:
+        echo 0x60 > $FUNCTION/control/terminal/camera/default/bmControls
+
+如果你不设置这些字段，则默认情况下摄像头终端（Camera Terminal）
+的自动曝光模式（Auto-Exposure Mode）控制
+和处理单元（Processing Unit）的亮度（Brightness）控制
+会被标记为可用；
+如果不支持这些功能，你应将字段设置为0x00。
+
+请注意，摄像头终端或处理单元的bmControls字段大小由UVC规范固定，
+因此此处的bControlSize属性为只读。
+
+自定义字符串支持
+~~~~~~~~~~~~~~~~~~~~~~~
+
+为USB设备各部分提供文本描述的字符串描述符（String Descriptor）
+可以在USB configfs的常规位置定义，
+然后可以从UVC功能根（UVC function root）或
+扩展单元（Extension Unit）目录中链接这些字符串，
+以将其作为描述符分配：
+
+.. code-block:: bash
+
+	# 在us-EN中创建一个字符串描述符，并从function root链接到它。
+	# 链接的名称在这里很重要，因为它声明该描述符用于Interface Association Descriptor。
+	# function root中其他重要的链接名称包括vs0_desc和vs1_desc，
+	# 用于VideoStreaming接口0/1描述符。
+
+	mkdir -p $GADGET/strings/0x409/iad_desc
+	echo -n "Interface Associaton Descriptor" > $GADGET/strings/0x409/iad_desc/s
+	ln -s $GADGET/strings/0x409/iad_desc $FUNCTION/iad_desc
+
+	# 由于从Extension Unit链接到String Descriptor会明确关联两者，
+	# 因此该链接的名称不重要，可以自由设置。
+
+	mkdir -p $GADGET/strings/0x409/xu.0
+	echo -n "A Very Useful Extension Unit" > $GADGET/strings/0x409/xu.0/s
+	ln -s $GADGET/strings/0x409/xu.0 $FUNCTION/control/extensions/xu.0
+
+中断端点
+~~~~~~~~
+
+VideoControl接口具有一个可选的中断端点，默认情况下处于禁用状态。
+该端点用于支持UVC的延迟响应控制设置请求
+（这些请求应通过中断端点响应，而不是占用端点0）。
+目前尚不支持通过该端点发送数据，因此默认禁用以避免混淆。
+如果你希望启用它，可以通过configfs属性进行设置：
+
+.. code-block:: bash
+
+	echo 1 > $FUNCTION/control/enable_interrupt_ep
+
+带宽配置
+~~~~~~~~
+
+有三个属性控制USB连接的带宽。
+这些属性位于功能根目录中，可以在限制范围内设置：
+.. code-block:: bash
+
+	# streaming_interval sets bInterval. Values range from 1..255
+	echo 1 > $FUNCTION/streaming_interval
+
+	# streaming_maxpacket sets wMaxPacketSize. Valid values are 1024/2048/3072
+	echo 3072 > $FUNCTION/streaming_maxpacket
+
+	# streaming_maxburst sets bMaxBurst. Valid values are 1..15
+	echo 1 > $FUNCTION/streaming_maxburst
+
+
+这里传入的值会根据UVC规范限制在有效范围内（其取值依赖于USB连接速度）。
+要了解这些设置如何影响带宽，应查阅UVC规范，
+但经验法则是：增加streaming_maxpacket设置将提高带宽（从而提高最大可能的帧率），
+如果USB连接运行在SuperSpeed模式下，
+增加streaming_maxburst也有相同效果；
+增加streaming_interval则会降低带宽和帧率。
+
+用户空间应用程序
+---------------------
+单独来看，UVC Gadget驱动本身并没有特别有趣的功能。
+它必须与一个用户空间程序配合使用，该程序负责响应UVC控制请求，
+并向驱动创建的V4L2设备填充待排队的缓冲区。
+这些操作的实现方式依赖具体实现，并超出了本文档的范围，
+但可以在以下位置找到参考应用程序：
+https://gitlab.freedesktop.org/camera/uvc-gadget
--
2.34.1


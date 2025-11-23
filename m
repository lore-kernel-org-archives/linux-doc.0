Received: from mail-m1973191.qiye.163.com (mail-m1973191.qiye.163.com [220.197.31.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2917C186E40
	for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 07:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763883932; cv=none; b=aD9UX2lTkiZy3LyXg9EcMbOLoqfufWwZUzz7Rjo2HF+pr35nFccZ97abWThrkebwG6NRNBvGHo2iL+3T9uv5FPPUvAHkFe7g0/53Dz1lX4FYautFk+6kC8xKY84OVc8NQE5Y/fvkK4uvx7ceGp1Az5a9fNY8L9dNpKASzP6GfNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763883932; c=relaxed/simple;
	bh=OiXVxha5VfzKZoGEvjX9Ii618N+DlT5HkEwp10KXf00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XeCbSlFISJwvU5LXRPgTtTBPzwK3STEWNw5xIS2m3z44I/2Wvt4xWUPyoCHUQ1UG35ZUbJuwC42SEk9sW0HfsGlF789c6rQrGMJfEBB/i5kekGGkMqbHKjy7VtKKjzVh2G1YOzalUp411zPZuygKGw6FZEqOm7meg8zDZpA6Qwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=DaJJesa7; arc=none smtp.client-ip=220.197.31.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="DaJJesa7"
Received: from server001 (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2a8df99c0;
	Sun, 23 Nov 2025 15:45:21 +0800 (GMT+08:00)
From: macrofun <baikefan@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 12/25] docs/zh_CN: Add gadget_printer.rst translation
Date: Sun, 23 Nov 2025 15:45:27 +0800
Message-ID: <20251123074540.34161-13-baikefan@leap-io-kernel.com>
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
X-HM-Tid: 0a9aafacae8d09d5kunm0cca7198286645
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCSUodVksYTkIYGB5OSUNNGVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=DaJJesa7KmPTKBTaxZQNkJhgwZpaYy6r6SySrRtuAIPSTnJBpMVuUgKhpVB6fbVg/Px00SyHcQkqbrl+1EdhJEiOVYXn7FFXVyaEcMsbN54lDVyM/1816AhAsrEGq/rzzjhSXio+ttof8Fea9GPneNhPCAdn+jWsh5AbL9SAtD7mnGSyBdh2aisIULx1q2SyWQHCYjHez1xhgdv8bQVD4NJDe5lPQsiXuYt3e7pdLoYUB0P0UGBWY3SnkEI31dFFUnwUPmcE5hxX+RG15KqPE0keGW50ElQ8EVCm4YjGzsKpH7dROdbP61p7mhkKSiJHmIEL6Wuj+r93YKgGTcoVuQ==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=RT+sVbAR7dXgIDV1bJPR5NPzGzHyrcniYyoFXOWI7kM=;
	h=date:mime-version:subject:message-id:from;

Translate .../usb/gadget_printer.rst into Chinese.

Update the translation through commit 570eb861243c
("docs: usb: replace some characters")

Signed-off-by: macrofun <baikefan@leap-io-kernel.com>
---
 .../translations/zh_CN/usb/gadget_printer.rst | 535 ++++++++++++++++++
 1 file changed, 535 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/usb/gadget_printer.rst

diff --git a/Documentation/translations/zh_CN/usb/gadget_printer.rst b/Documentation/translations/zh_CN/usb/gadget_printer.rst
new file mode 100644
index 000000000000..c4bbbb013d2d
--- /dev/null
+++ b/Documentation/translations/zh_CN/usb/gadget_printer.rst
@@ -0,0 +1,535 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/usb/gadget_printer.rst
+:翻译:
+
+ 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
+
+:校译:
+
+
+
+============================
+Linux USB 打印机 Gadget 驱动
+============================
+
+2007年06月04日
+
+版权所有 (C) 2007 Craig W. Nadler <craig@nadler.us>
+
+
+
+概述
+====
+
+该驱动可用于在 Linux 嵌入式系统中开发打印机固件。
+请注意，它与在 Linux 主机上使用打印机无关。
+
+你需要一个 USB 设备控制器以及其对应的 Linux 驱动，
+该驱动支持使用 Linux USB Gadget API 的 gadget / 设备类驱动。
+加载 USB 设备控制器驱动后，再加载打印机 gadget 驱动。
+这样，连接到 USB 设备端口的主机将看到一个打印机接口。
+
+该驱动针对运行在用户态的打印机固件设计。
+用户态固件通过设备文件与内核态打印机 gadget 驱动读写数据。
+当 USB 主机发送获取打印机状态的请求时，打印机会返回状态字节。
+用户态固件可以通过设备文件 /dev/g_printer 读取或写入该状态字节。
+支持阻塞和非阻塞的读/写操作。
+
+
+
+
+使用方法
+========
+
+要加载 USB 设备控制器驱动和打印机 gadget 驱动。
+以下示例使用 Netchip 2280 USB 设备控制器驱动::
+
+	modprobe net2280
+	modprobe g_printer
+
+
+加载打印机 gadget 时，可指定以下命令行参数
+（例如：modprobe g_printer idVendor=0x0525 idProduct=0xa4a8）：
+
+idVendor
+    设备描述符中的厂商 ID。默认值为 Netchip 的 0x0525。
+    发布产品前必须更改为自己的厂商 ID。
+    如果需要申请厂商 ID，请参考 www.usb.org
+
+idProduct
+    设备描述符中的产品 ID。默认值为 0xa4a8。
+    建议更改为其他未使用的 ID，产品编号可从 0x0001 开始。
+
+bcdDevice
+	产品版本号，建议填写固件版本。
+
+iManufacturer
+	厂商名称字符串。
+
+iProduct
+	产品名称字符串。
+
+iSerialNum
+	序列号字符串，每个产品单元应不同。
+
+iPNPstring
+	打印机使用的 PNP ID 字符串，可在命令行指定或硬编码。
+
+qlen
+	每个端点使用的 8k 缓冲区数量。默认值为 10，
+	你应该根据你的产品进行调整。你也可能想调整
+	每个缓冲区的大小以适应你的产品。
+
+
+
+
+示例代码使用
+============
+
+该示例代码将打印机数据发送到标准输出，而不是打印机引擎。
+
+要编译下面的测试代码：
+
+1) 将其保存为名为 prn_example.c 的文件
+2) 使用以下命令编译代码::
+
+	 gcc prn_example.c -o prn_example
+
+
+
+从主机读取打印机数据到 stdout::
+
+	# prn_example -read_data
+
+
+将打印机数据从文件 (data_file) 写入主机::
+
+	# cat data_file | prn_example -write_data
+
+
+要获取 gadget 驱动的当前打印机状态::
+
+	# prn_example -get_status
+
+	Printer status is:
+	     Printer is NOT Selected
+	     Paper is Out
+	     Printer OK
+
+
+设置打印机为选中/在线::
+
+	# prn_example -selected
+
+
+设置打印机为未选中/离线::
+
+	# prn_example -not_selected
+
+
+设置纸张状态为缺纸::
+
+	# prn_example -paper_out
+
+	# prn_example -paper_out
+
+
+设置纸张状态为有纸::
+
+	# prn_example -paper_loaded
+
+	# prn_example -paper_loaded
+
+
+设置错误状态为打印机正常::
+
+	# prn_example -no_error
+
+
+设置错误状态为错误::
+
+	# prn_example -error
+
+	# prn_example -no_error
+
+
+要设置错误状态为错误::
+
+	# prn_example -error
+
+
+
+
+示例代码
+========
+
+::
+
+
+  #include <stdio.h>
+  #include <stdlib.h>
+  #include <fcntl.h>
+  #include <linux/poll.h>
+  #include <sys/ioctl.h>
+  #include <linux/usb/g_printer.h>
+
+  #define PRINTER_FILE			"/dev/g_printer"
+  #define BUF_SIZE			512
+
+
+  /*
+   * 'usage()' - Show program usage.
+   */
+
+  static void
+  usage(const char *option)		/* I - Option string or NULL */
+  {
+	if (option) {
+		fprintf(stderr,"prn_example: Unknown option \"%s\"!\n",
+				option);
+	}
+
+	fputs("\n", stderr);
+	fputs("Usage: prn_example -[options]\n", stderr);
+	fputs("Options:\n", stderr);
+	fputs("\n", stderr);
+	fputs("-get_status    Get the current printer status.\n", stderr);
+	fputs("-selected      Set the selected status to selected.\n", stderr);
+	fputs("-not_selected  Set the selected status to NOT selected.\n",
+			stderr);
+	fputs("-error         Set the error status to error.\n", stderr);
+	fputs("-no_error      Set the error status to NO error.\n", stderr);
+	fputs("-paper_out     Set the paper status to paper out.\n", stderr);
+	fputs("-paper_loaded  Set the paper status to paper loaded.\n",
+			stderr);
+	fputs("-read_data     Read printer data from driver.\n", stderr);
+	fputs("-write_data    Write printer sata to driver.\n", stderr);
+	fputs("-NB_read_data  (Non-Blocking) Read printer data from driver.\n",
+			stderr);
+	fputs("\n\n", stderr);
+
+	exit(1);
+  }
+
+
+  static int
+  read_printer_data()
+  {
+	struct pollfd	fd[1];
+
+	/* Open device file for printer gadget. */
+	fd[0].fd = open(PRINTER_FILE, O_RDWR);
+	if (fd[0].fd < 0) {
+		printf("Error %d opening %s\n", fd[0].fd, PRINTER_FILE);
+		close(fd[0].fd);
+		return(-1);
+	}
+
+	fd[0].events = POLLIN | POLLRDNORM;
+
+	while (1) {
+		static char buf[BUF_SIZE];
+		int bytes_read;
+		int retval;
+
+		/* Wait for up to 1 second for data. */
+		retval = poll(fd, 1, 1000);
+
+		if (retval && (fd[0].revents & POLLRDNORM)) {
+
+			/* Read data from printer gadget driver. */
+			bytes_read = read(fd[0].fd, buf, BUF_SIZE);
+
+			if (bytes_read < 0) {
+				printf("Error %d reading from %s\n",
+						fd[0].fd, PRINTER_FILE);
+				close(fd[0].fd);
+				return(-1);
+			} else if (bytes_read > 0) {
+				/* Write data to standard OUTPUT (stdout). */
+				fwrite(buf, 1, bytes_read, stdout);
+				fflush(stdout);
+			}
+
+		}
+
+	}
+
+	/* Close the device file. */
+	close(fd[0].fd);
+
+	return 0;
+  }
+
+
+  static int
+  write_printer_data()
+  {
+	struct pollfd	fd[1];
+
+	/* Open device file for printer gadget. */
+	fd[0].fd = open (PRINTER_FILE, O_RDWR);
+	if (fd[0].fd < 0) {
+		printf("Error %d opening %s\n", fd[0].fd, PRINTER_FILE);
+		close(fd[0].fd);
+		return(-1);
+	}
+
+	fd[0].events = POLLOUT | POLLWRNORM;
+
+	while (1) {
+		int retval;
+		static char buf[BUF_SIZE];
+		/* Read data from standard INPUT (stdin). */
+		int bytes_read = fread(buf, 1, BUF_SIZE, stdin);
+
+		if (!bytes_read) {
+			break;
+		}
+
+		while (bytes_read) {
+
+			/* Wait for up to 1 second to sent data. */
+			retval = poll(fd, 1, 1000);
+
+			/* Write data to printer gadget driver. */
+			if (retval && (fd[0].revents & POLLWRNORM)) {
+				retval = write(fd[0].fd, buf, bytes_read);
+				if (retval < 0) {
+					printf("Error %d writing to %s\n",
+							fd[0].fd,
+							PRINTER_FILE);
+					close(fd[0].fd);
+					return(-1);
+				} else {
+					bytes_read -= retval;
+				}
+
+			}
+
+		}
+
+	}
+
+	/* Wait until the data has been sent. */
+	fsync(fd[0].fd);
+
+	/* Close the device file. */
+	close(fd[0].fd);
+
+	return 0;
+  }
+
+
+  static int
+  read_NB_printer_data()
+  {
+	int		fd;
+	static char	buf[BUF_SIZE];
+	int		bytes_read;
+
+	/* Open device file for printer gadget. */
+	fd = open(PRINTER_FILE, O_RDWR|O_NONBLOCK);
+	if (fd < 0) {
+		printf("Error %d opening %s\n", fd, PRINTER_FILE);
+		close(fd);
+		return(-1);
+	}
+
+	while (1) {
+		/* Read data from printer gadget driver. */
+		bytes_read = read(fd, buf, BUF_SIZE);
+		if (bytes_read <= 0) {
+			break;
+		}
+
+		/* Write data to standard OUTPUT (stdout). */
+		fwrite(buf, 1, bytes_read, stdout);
+		fflush(stdout);
+	}
+
+	/* Close the device file. */
+	close(fd);
+
+	return 0;
+  }
+
+
+  static int
+  get_printer_status()
+  {
+	int	retval;
+	int	fd;
+
+	/* Open device file for printer gadget. */
+	fd = open(PRINTER_FILE, O_RDWR);
+	if (fd < 0) {
+		printf("Error %d opening %s\n", fd, PRINTER_FILE);
+		close(fd);
+		return(-1);
+	}
+
+	/* Make the IOCTL call. */
+	retval = ioctl(fd, GADGET_GET_PRINTER_STATUS);
+	if (retval < 0) {
+		fprintf(stderr, "ERROR: Failed to set printer status\n");
+		return(-1);
+	}
+
+	/* Close the device file. */
+	close(fd);
+
+	return(retval);
+  }
+
+
+  static int
+  set_printer_status(unsigned char buf, int clear_printer_status_bit)
+  {
+	int	retval;
+	int	fd;
+
+	retval = get_printer_status();
+	if (retval < 0) {
+		fprintf(stderr, "ERROR: Failed to get printer status\n");
+		return(-1);
+	}
+
+	/* Open device file for printer gadget. */
+	fd = open(PRINTER_FILE, O_RDWR);
+
+	if (fd < 0) {
+		printf("Error %d opening %s\n", fd, PRINTER_FILE);
+		close(fd);
+		return(-1);
+	}
+
+	if (clear_printer_status_bit) {
+		retval &= ~buf;
+	} else {
+		retval |= buf;
+	}
+
+	/* Make the IOCTL call. */
+	if (ioctl(fd, GADGET_SET_PRINTER_STATUS, (unsigned char)retval)) {
+		fprintf(stderr, "ERROR: Failed to set printer status\n");
+		return(-1);
+	}
+
+	/* Close the device file. */
+	close(fd);
+
+	return 0;
+  }
+
+
+  static int
+  display_printer_status()
+  {
+	char	printer_status;
+
+	printer_status = get_printer_status();
+	if (printer_status < 0) {
+		fprintf(stderr, "ERROR: Failed to get printer status\n");
+		return(-1);
+	}
+
+	printf("Printer status is:\n");
+	if (printer_status & PRINTER_SELECTED) {
+		printf("     Printer is Selected\n");
+	} else {
+		printf("     Printer is NOT Selected\n");
+	}
+	if (printer_status & PRINTER_PAPER_EMPTY) {
+		printf("     Paper is Out\n");
+	} else {
+		printf("     Paper is Loaded\n");
+	}
+	if (printer_status & PRINTER_NOT_ERROR) {
+		printf("     Printer OK\n");
+	} else {
+		printf("     Printer ERROR\n");
+	}
+
+	return(0);
+  }
+
+
+  int
+  main(int  argc, char *argv[])
+  {
+	int	i;		/* Looping var */
+	int	retval = 0;
+
+	/* No Args */
+	if (argc == 1) {
+		usage(0);
+		exit(0);
+	}
+
+	for (i = 1; i < argc && !retval; i ++) {
+
+		if (argv[i][0] != '-') {
+			continue;
+		}
+
+		if (!strcmp(argv[i], "-get_status")) {
+			if (display_printer_status()) {
+				retval = 1;
+			}
+
+		} else if (!strcmp(argv[i], "-paper_loaded")) {
+			if (set_printer_status(PRINTER_PAPER_EMPTY, 1)) {
+				retval = 1;
+			}
+
+		} else if (!strcmp(argv[i], "-paper_out")) {
+			if (set_printer_status(PRINTER_PAPER_EMPTY, 0)) {
+				retval = 1;
+			}
+
+		} else if (!strcmp(argv[i], "-selected")) {
+			if (set_printer_status(PRINTER_SELECTED, 0)) {
+				retval = 1;
+			}
+
+		} else if (!strcmp(argv[i], "-not_selected")) {
+			if (set_printer_status(PRINTER_SELECTED, 1)) {
+				retval = 1;
+			}
+
+		} else if (!strcmp(argv[i], "-error")) {
+			if (set_printer_status(PRINTER_NOT_ERROR, 1)) {
+				retval = 1;
+			}
+
+		} else if (!strcmp(argv[i], "-no_error")) {
+			if (set_printer_status(PRINTER_NOT_ERROR, 0)) {
+				retval = 1;
+			}
+
+		} else if (!strcmp(argv[i], "-read_data")) {
+			if (read_printer_data()) {
+				retval = 1;
+			}
+
+		} else if (!strcmp(argv[i], "-write_data")) {
+			if (write_printer_data()) {
+				retval = 1;
+			}
+
+		} else if (!strcmp(argv[i], "-NB_read_data")) {
+			if (read_NB_printer_data()) {
+				retval = 1;
+			}
+
+		} else {
+			usage(argv[i]);
+			retval = 1;
+		}
+	}
+
+	exit(retval);
+  }
--
2.34.1


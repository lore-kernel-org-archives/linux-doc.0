Received: from mail-m1973176.qiye.163.com (mail-m1973176.qiye.163.com [220.197.31.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DE41C695
	for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 07:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763884238; cv=none; b=SEiPTDAZGSQO5vx4zIxb9psywu1GjdgGNQDO5RSAHHsgdxwOionpGvF3DqniiPMxoxkr92ShxU7JA/IL4X0w/L3e3LqTyTlxe8fepzFUF0hg+yCQl37DW6Ovhk0MFMhH0rhHU64ILcJTzYPUqtsLERuTeHUH8LEuFD7XWir27Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763884238; c=relaxed/simple;
	bh=zyayboLmrkwqNHa6Z1Ep88E8vIhTZ1nlTSQsAcj1Ii0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dsbreQLS/9HD8kzl8sCuEC4BLXf61JMoFSLGEpjR5+Ai/9Dr3jaq+k2jIvnc8o1qWsRiNs7aqHXW+IYtHOk1VGmt/FoW6lczVXhDrdMDrP+J1xvjnMElU1yZGgHou/2TW2Qbmlf2LDpQnZwsbe5c6s91FeX/h1mSrotBPnGYscs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=tv48fLxO; arc=none smtp.client-ip=220.197.31.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="tv48fLxO"
Received: from server001 (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2a8df99b9;
	Sun, 23 Nov 2025 15:45:19 +0800 (GMT+08:00)
From: macrofun <baikefan@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 10/25] docs/zh_CN: Add gadget_hid.rst translation
Date: Sun, 23 Nov 2025 15:45:25 +0800
Message-ID: <20251123074540.34161-11-baikefan@leap-io-kernel.com>
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
X-HM-Tid: 0a9aafaca6c009d5kunm0cca719828662a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCTUlOVk0fSk8fQ0hJSh9ITVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0NMVUpLS1
	VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=tv48fLxOiRiUIWOWkNZCmifp6H/JeAfQp+GITwgln3L2e4RNHw2Mb0wECDINKNOAMzcfyKueWZOzPuwlxMa8u2o/4FOEZwXogB+se3HyuUmZ8IQOymUzig+PHq9lwFSqKKYc4M4hfv1p94SkhD1a38+6MLlDPR9MJ2ZUStIwTBgUO81UZLLHLay1ZGn5X91AzdGD3vQegLCJg+f7VohVxnfi5ELza4SKh+kXucnFmzIfMQxCVpDL3bthQ3YUrSdpeNl6U7X2bMCEM90LKydzasUqWMgBUO5LqFoEAemR5NF3X1Hcs7jJpg68FK/jZy15fSFUClpCDp+xArXcDrEC2A==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=FppOWiJlVxX5s6eP3aB95kUfUAvagKZzGY50I/VzOOA=;
	h=date:mime-version:subject:message-id:from;

Translate .../usb/gadget_hid.rst into Chinese.

Update the translation through commit ffeb1e9e897b
("USB: Replace HTTP links with HTTPS ones")

Signed-off-by: macrofun <baikefan@leap-io-kernel.com>
---
 .../translations/zh_CN/usb/gadget_hid.rst     | 462 ++++++++++++++++++
 1 file changed, 462 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/usb/gadget_hid.rst

diff --git a/Documentation/translations/zh_CN/usb/gadget_hid.rst b/Documentation/translations/zh_CN/usb/gadget_hid.rst
new file mode 100644
index 000000000000..3c1fa8ed3979
--- /dev/null
+++ b/Documentation/translations/zh_CN/usb/gadget_hid.rst
@@ -0,0 +1,462 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/usb/gadget_hid.rst
+:翻译:
+
+ 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
+
+:校译:
+
+
+
+===========================
+Linux USB HID gadget驱动
+===========================
+
+简介
+====
+HID Gadget驱动提供USB人机接口设备（HID）的模拟实现。
+基础的HID处理由内核完成，
+HID报告可以通过对 /dev/hidgX 字符设备进行I/O来发送/接收。
+
+关于HID的更多细节请参考开发者页面：
+https://www.usb.org/developers/hidpage/
+
+配置
+====
+g_hid是一个 platform driver，因此要使用它，
+你需要在平台代码中添加 struct platform_device，
+定义你想要使用的HID功能描述符 —— 例如如下代码：::
+
+  #include <linux/platform_device.h>
+  #include <linux/usb/g_hid.h>
+
+  /* hid descriptor for a keyboard */
+  static struct hidg_func_descriptor my_hid_data = {
+	.subclass		= 0, /* 无子类 */
+	.protocol		= 1, /* 键盘 */
+	.report_length		= 8,
+	.report_desc_length	= 63,
+	.report_desc		= {
+		0x05, 0x01,	/* USAGE_PAGE (Generic Desktop)	          */
+		0x09, 0x06,	/* USAGE (Keyboard)                       */
+		0xa1, 0x01,	/* COLLECTION (Application)               */
+		0x05, 0x07,	/*   USAGE_PAGE (Keyboard)                */
+		0x19, 0xe0,	/*   USAGE_MINIMUM (Keyboard LeftControl) */
+		0x29, 0xe7,	/*   USAGE_MAXIMUM (Keyboard Right GUI)   */
+		0x15, 0x00,	/*   LOGICAL_MINIMUM (0)                  */
+		0x25, 0x01,	/*   LOGICAL_MAXIMUM (1)                  */
+		0x75, 0x01,	/*   REPORT_SIZE (1)                      */
+		0x95, 0x08,	/*   REPORT_COUNT (8)                     */
+		0x81, 0x02,	/*   INPUT (Data,Var,Abs)                 */
+		0x95, 0x01,	/*   REPORT_COUNT (1)                     */
+		0x75, 0x08,	/*   REPORT_SIZE (8)                      */
+		0x81, 0x03,	/*   INPUT (Cnst,Var,Abs)                 */
+		0x95, 0x05,	/*   REPORT_COUNT (5)                     */
+		0x75, 0x01,	/*   REPORT_SIZE (1)                      */
+		0x05, 0x08,	/*   USAGE_PAGE (LEDs)                    */
+		0x19, 0x01,	/*   USAGE_MINIMUM (Num Lock)             */
+		0x29, 0x05,	/*   USAGE_MAXIMUM (Kana)                 */
+		0x91, 0x02,	/*   OUTPUT (Data,Var,Abs)                */
+		0x95, 0x01,	/*   REPORT_COUNT (1)                     */
+		0x75, 0x03,	/*   REPORT_SIZE (3)                      */
+		0x91, 0x03,	/*   OUTPUT (Cnst,Var,Abs)                */
+		0x95, 0x06,	/*   REPORT_COUNT (6)                     */
+		0x75, 0x08,	/*   REPORT_SIZE (8)                      */
+		0x15, 0x00,	/*   LOGICAL_MINIMUM (0)                  */
+		0x25, 0x65,	/*   LOGICAL_MAXIMUM (101)                */
+		0x05, 0x07,	/*   USAGE_PAGE (Keyboard)                */
+		0x19, 0x00,	/*   USAGE_MINIMUM (Reserved)             */
+		0x29, 0x65,	/*   USAGE_MAXIMUM (Keyboard Application) */
+		0x81, 0x00,	/*   INPUT (Data,Ary,Abs)                 */
+		0xc0		/* END_COLLECTION                         */
+	}
+  };
+
+  static struct platform_device my_hid = {
+	.name			= "hidg",
+	.id			= 0,
+	.num_resources		= 0,
+	.resource		= 0,
+	.dev.platform_data	= &my_hid_data,
+  };
+
+你可以添加任意数量的HID功能，
+唯一的限制是gadget驱动所支持的中断端点数量。
+
+使用configfs进行配置
+======================
+
+与其通过添加虚拟的platform device和driver来向内核传递数据，不如这样做：
+如果HID是由configfs组成的gadget的一部分，
+hidg_func_descriptor.report_desc可以直接通过
+向configfs属性写入相应的字节流来传递给内核。
+
+发送和接收HID报告
+====================
+
+HID报告可以通过对/dev/hidgX字符设备执行
+read/write来发送或接收。下面是一个示例程序展示如何实现。
+
+hid_gadget_test是一个用于测试HID gadget驱动的小型交互程序。
+使用方式是指定一个hidg设备并设置设备类型（keyboard / mouse / joystick）
+—— 例如::
+
+	# hid_gadget_test /dev/hidg0 keyboard
+
+现在你进入了hid_gadget_test的提示界面。
+你可以输入任意组合的选项和值。
+可用的选项和值会在程序启动时列出。
+在键盘模式下，你最多可以发送六个值。
+
+例如输入： g i s t r --left-shift
+
+按回车后，会由HID gadget发送对应的报告。
+
+另一个有趣的例子是大小写锁定（caps lock）测试。
+输入--caps-lock 然后回车，gadget 会发送一个报告，
+并且你将收到主机端的回应，对应于 caps lock LED 的状态::
+
+	--caps-lock
+	recv report:2
+
+使用以下命令::
+
+	# hid_gadget_test /dev/hidg1 mouse
+
+你可以测试鼠标模拟。数值是两个有符号数。
+
+
+示例代码::
+
+    /* hid_gadget_test */
+
+    #include <pthread.h>
+    #include <string.h>
+    #include <stdio.h>
+    #include <ctype.h>
+    #include <fcntl.h>
+    #include <errno.h>
+    #include <stdio.h>
+    #include <stdlib.h>
+    #include <unistd.h>
+
+    #define BUF_LEN 512
+
+    struct options {
+	const char    *opt;
+	unsigned char val;
+  };
+
+  static struct options kmod[] = {
+	{.opt = "--left-ctrl",		.val = 0x01},
+	{.opt = "--right-ctrl",		.val = 0x10},
+	{.opt = "--left-shift",		.val = 0x02},
+	{.opt = "--right-shift",	.val = 0x20},
+	{.opt = "--left-alt",		.val = 0x04},
+	{.opt = "--right-alt",		.val = 0x40},
+	{.opt = "--left-meta",		.val = 0x08},
+	{.opt = "--right-meta",		.val = 0x80},
+	{.opt = NULL}
+  };
+
+  static struct options kval[] = {
+	{.opt = "--return",	.val = 0x28},
+	{.opt = "--esc",	.val = 0x29},
+	{.opt = "--bckspc",	.val = 0x2a},
+	{.opt = "--tab",	.val = 0x2b},
+	{.opt = "--spacebar",	.val = 0x2c},
+	{.opt = "--caps-lock",	.val = 0x39},
+	{.opt = "--f1",		.val = 0x3a},
+	{.opt = "--f2",		.val = 0x3b},
+	{.opt = "--f3",		.val = 0x3c},
+	{.opt = "--f4",		.val = 0x3d},
+	{.opt = "--f5",		.val = 0x3e},
+	{.opt = "--f6",		.val = 0x3f},
+	{.opt = "--f7",		.val = 0x40},
+	{.opt = "--f8",		.val = 0x41},
+	{.opt = "--f9",		.val = 0x42},
+	{.opt = "--f10",	.val = 0x43},
+	{.opt = "--f11",	.val = 0x44},
+	{.opt = "--f12",	.val = 0x45},
+	{.opt = "--insert",	.val = 0x49},
+	{.opt = "--home",	.val = 0x4a},
+	{.opt = "--pageup",	.val = 0x4b},
+	{.opt = "--del",	.val = 0x4c},
+	{.opt = "--end",	.val = 0x4d},
+	{.opt = "--pagedown",	.val = 0x4e},
+	{.opt = "--right",	.val = 0x4f},
+	{.opt = "--left",	.val = 0x50},
+	{.opt = "--down",	.val = 0x51},
+	{.opt = "--kp-enter",	.val = 0x58},
+	{.opt = "--up",		.val = 0x52},
+	{.opt = "--num-lock",	.val = 0x53},
+	{.opt = NULL}
+  };
+
+  int keyboard_fill_report(char report[8], char buf[BUF_LEN], int *hold)
+  {
+	char *tok = strtok(buf, " ");
+	int key = 0;
+	int i = 0;
+
+	for (; tok != NULL; tok = strtok(NULL, " ")) {
+
+		if (strcmp(tok, "--quit") == 0)
+			return -1;
+
+		if (strcmp(tok, "--hold") == 0) {
+			*hold = 1;
+			continue;
+		}
+
+		if (key < 6) {
+			for (i = 0; kval[i].opt != NULL; i++)
+				if (strcmp(tok, kval[i].opt) == 0) {
+					report[2 + key++] = kval[i].val;
+					break;
+				}
+			if (kval[i].opt != NULL)
+				continue;
+		}
+
+		if (key < 6)
+			if (islower(tok[0])) {
+				report[2 + key++] = (tok[0] - ('a' - 0x04));
+				continue;
+			}
+
+		for (i = 0; kmod[i].opt != NULL; i++)
+			if (strcmp(tok, kmod[i].opt) == 0) {
+				report[0] = report[0] | kmod[i].val;
+				break;
+			}
+		if (kmod[i].opt != NULL)
+			continue;
+
+		if (key < 6)
+			fprintf(stderr, "unknown option: %s\n", tok);
+	}
+	return 8;
+  }
+
+  static struct options mmod[] = {
+	{.opt = "--b1", .val = 0x01},
+	{.opt = "--b2", .val = 0x02},
+	{.opt = "--b3", .val = 0x04},
+	{.opt = NULL}
+  };
+
+  int mouse_fill_report(char report[8], char buf[BUF_LEN], int *hold)
+  {
+	char *tok = strtok(buf, " ");
+	int mvt = 0;
+	int i = 0;
+	for (; tok != NULL; tok = strtok(NULL, " ")) {
+
+		if (strcmp(tok, "--quit") == 0)
+			return -1;
+
+		if (strcmp(tok, "--hold") == 0) {
+			*hold = 1;
+			continue;
+		}
+
+		for (i = 0; mmod[i].opt != NULL; i++)
+			if (strcmp(tok, mmod[i].opt) == 0) {
+				report[0] = report[0] | mmod[i].val;
+				break;
+			}
+		if (mmod[i].opt != NULL)
+			continue;
+
+		if (!(tok[0] == '-' && tok[1] == '-') && mvt < 2) {
+			errno = 0;
+			report[1 + mvt++] = (char)strtol(tok, NULL, 0);
+			if (errno != 0) {
+				fprintf(stderr, "Bad value:'%s'\n", tok);
+				report[1 + mvt--] = 0;
+			}
+			continue;
+		}
+
+		fprintf(stderr, "unknown option: %s\n", tok);
+	}
+	return 3;
+  }
+
+  static struct options jmod[] = {
+	{.opt = "--b1",		.val = 0x10},
+	{.opt = "--b2",		.val = 0x20},
+	{.opt = "--b3",		.val = 0x40},
+	{.opt = "--b4",		.val = 0x80},
+	{.opt = "--hat1",	.val = 0x00},
+	{.opt = "--hat2",	.val = 0x01},
+	{.opt = "--hat3",	.val = 0x02},
+	{.opt = "--hat4",	.val = 0x03},
+	{.opt = "--hatneutral",	.val = 0x04},
+	{.opt = NULL}
+  };
+
+  int joystick_fill_report(char report[8], char buf[BUF_LEN], int *hold)
+  {
+	char *tok = strtok(buf, " ");
+	int mvt = 0;
+	int i = 0;
+
+	*hold = 1;
+
+	/* set default hat position: neutral */
+	report[3] = 0x04;
+
+	for (; tok != NULL; tok = strtok(NULL, " ")) {
+
+		if (strcmp(tok, "--quit") == 0)
+			return -1;
+
+		for (i = 0; jmod[i].opt != NULL; i++)
+			if (strcmp(tok, jmod[i].opt) == 0) {
+				report[3] = (report[3] & 0xF0) | jmod[i].val;
+				break;
+			}
+		if (jmod[i].opt != NULL)
+			continue;
+
+		if (!(tok[0] == '-' && tok[1] == '-') && mvt < 3) {
+			errno = 0;
+			report[mvt++] = (char)strtol(tok, NULL, 0);
+			if (errno != 0) {
+				fprintf(stderr, "Bad value:'%s'\n", tok);
+				report[mvt--] = 0;
+			}
+			continue;
+		}
+
+		fprintf(stderr, "unknown option: %s\n", tok);
+	}
+	return 4;
+  }
+
+  void print_options(char c)
+  {
+	int i = 0;
+
+	if (c == 'k') {
+		printf("	keyboard options:\n"
+		       "		--hold\n");
+		for (i = 0; kmod[i].opt != NULL; i++)
+			printf("\t\t%s\n", kmod[i].opt);
+		printf("\n	keyboard values:\n"
+		       "		[a-z] or\n");
+		for (i = 0; kval[i].opt != NULL; i++)
+			printf("\t\t%-8s%s", kval[i].opt, i % 2 ? "\n" : "");
+		printf("\n");
+	} else if (c == 'm') {
+		printf("	mouse options:\n"
+		       "		--hold\n");
+		for (i = 0; mmod[i].opt != NULL; i++)
+			printf("\t\t%s\n", mmod[i].opt);
+		printf("\n	mouse values:\n"
+		       "		Two signed numbers\n"
+		       "--quit to close\n");
+	} else {
+		printf("	joystick options:\n");
+		for (i = 0; jmod[i].opt != NULL; i++)
+			printf("\t\t%s\n", jmod[i].opt);
+		printf("\n	joystick values:\n"
+		       "		three signed numbers\n"
+		       "--quit to close\n");
+	}
+  }
+
+  int main(int argc, const char *argv[])
+  {
+	const char *filename = NULL;
+	int fd = 0;
+	char buf[BUF_LEN];
+	int cmd_len;
+	char report[8];
+	int to_send = 8;
+	int hold = 0;
+	fd_set rfds;
+	int retval, i;
+
+	if (argc < 3) {
+		fprintf(stderr, "Usage: %s devname mouse|keyboard|joystick\n",
+			argv[0]);
+		return 1;
+	}
+
+	if (argv[2][0] != 'k' && argv[2][0] != 'm' && argv[2][0] != 'j')
+	  return 2;
+
+	filename = argv[1];
+
+	if ((fd = open(filename, O_RDWR, 0666)) == -1) {
+		perror(filename);
+		return 3;
+	}
+
+	print_options(argv[2][0]);
+
+	while (42) {
+
+		FD_ZERO(&rfds);
+		FD_SET(STDIN_FILENO, &rfds);
+		FD_SET(fd, &rfds);
+
+		retval = select(fd + 1, &rfds, NULL, NULL, NULL);
+		if (retval == -1 && errno == EINTR)
+			continue;
+		if (retval < 0) {
+			perror("select()");
+			return 4;
+		}
+
+		if (FD_ISSET(fd, &rfds)) {
+			cmd_len = read(fd, buf, BUF_LEN - 1);
+			printf("recv report:");
+			for (i = 0; i < cmd_len; i++)
+				printf(" %02x", buf[i]);
+			printf("\n");
+		}
+
+		if (FD_ISSET(STDIN_FILENO, &rfds)) {
+			memset(report, 0x0, sizeof(report));
+			cmd_len = read(STDIN_FILENO, buf, BUF_LEN - 1);
+
+			if (cmd_len == 0)
+				break;
+
+			buf[cmd_len - 1] = '\0';
+			hold = 0;
+
+			memset(report, 0x0, sizeof(report));
+			if (argv[2][0] == 'k')
+				to_send = keyboard_fill_report(report, buf, &hold);
+			else if (argv[2][0] == 'm')
+				to_send = mouse_fill_report(report, buf, &hold);
+			else
+				to_send = joystick_fill_report(report, buf, &hold);
+
+			if (to_send == -1)
+				break;
+
+			if (write(fd, report, to_send) != to_send) {
+				perror(filename);
+				return 5;
+			}
+			if (!hold) {
+				memset(report, 0x0, sizeof(report));
+				if (write(fd, report, to_send) != to_send) {
+					perror(filename);
+					return 6;
+				}
+			}
+		}
+	}
+
+	close(fd);
+	return 0;
+  }
--
2.34.1


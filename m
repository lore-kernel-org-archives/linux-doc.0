Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794568960;
	b=0wn42sULmQXZLsbWeAyZ7S17TOHf4x7DxZ35WC9HCpNXoWgHDvPcKx+lzAfSEN9TEUgr
	 n2JZNkLx/59Y0gChuy9wO4J+KsswZWjQQEwleeUv1uJfUFZm9jiWi1NV+rc5Gav88vItw
	 lmOMfCixdUZKdQ6khCW99oVldbnKHf7yy6/NL/m/0459lB8XeFFRVC5QnXlp7DBLEtYnz
	 5RDhuy8ja7M5acFQ1zIsQS4LcAyZ65GLGuxrWEwSlj0gqwoUWRljRRJ/mtZgXaAv9IP9A
	 CMFZ7nNRRyNxRaA41jbVDF3RVBYL428OpajUkTOqOdlAqj0YPBv4LPIiX68SGDZViXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794568960;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=Bd6ULjrWggWK7iKB9HyqhnYjH7dTT0/WSVYmzVab/ng=;
	b=pciAWFh3TNEMZhsjF5fbksDAFpjpJ/tof8OfhlG9ehMZKlN7pm9NkwF22PXyhhXGZOdZ
	 N2EF7lyy1UOkIC4TcG/VbEEP5CcGjdlX/V3jU/DDhoJdmOviYLW4U3p17rfvpwob7oc4w
	 02dDIvvBWOVHwHH1TAUkX48jaZyFB7XAMqObLaF0A3ShotUEL3ZcRvi+ZdgmxVfGUOGOR
	 JdRvo4GvptD+jVfoL21OuPj0fipbdK1Cnfd/wRrxQD5G77L07afcu7nG0LfjhYlXFv3Y2
	 2ROx8CO7gw/tva11QX9sPDleediEJtpDp8HZ0AI37nnT/UCbhVpmEBD6RVTbBqF4vew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=126.com;
	spf=pass smtp.mailfrom=126.com;
	dkim=pass header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=L082l+on;
	arc=none smtp.remote-ip=117.135.210.9
Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456F6606A327
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 11:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 456F6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=L082l+on
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=Bd6ULjrWggWK7iKB9HyqhnYjH7dTT0/WSVYmzVab/ng=;
	b=L082l+onkfN+uZbva2BngzLPtPb3gN/3u82KyR1okA5KuSDgmkTmwhtbhQu8OW
	C1TazBt4PM80ESawmwAPogxzKR0Efvf3BhGD1ms/T1tcaIMAL3m+D89AHjT/hOyA
	zwa0IJRDzxUfUMtdmneQjGQKly9n7QbXjIvVL7yHZFYzs=
Received: from peter-desktop.. (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3H83c8vZqhhA8DA--.30901S2;
	Fri, 13 Nov 2026 19:22:05 +0800 (CST)
From: YikunWei <YikunWei@126.com>
To: alexs@kernel.org
Cc: si.yanteng@linux.dev,
	dzm91@hust.edu.cn,
	linux-doc@vger.kernel.org,
	Yikun Wei <YikunWei@126.com>
Subject: [PATCH] docs/zh_CN: Add contribution maturity model translation
Date: Fri, 13 Nov 2026 19:21:31 +0800
Message-ID: <20261113112200.16790-1-YikunWei@126.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3H83c8vZqhhA8DA--.30901S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCFW3KF1xuFW5Gw13AFyxXwb_yoWrKr47pF
	ZFgFySga18XrWrKrWxGFyIgF1fXa4rAF4kXry7X3WaqF1fJrn7JrW3KF98K3s7WFWrAay8
	XF48CrZ8GrW8uwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j5NVkUUUUU=
X-CM-SenderInfo: p1ln30xzhlqiyswou0bp/xtbBlB1MTmr28t1lTQAA3Q

From: Yikun Wei <YikunWei@126.com>

Translate .../process/contribution-maturity-model.rst into Chinese.

Update the translation through commit 10a29eb658b3
("Documentation/process: Add Linux Kernel Contribution Maturity Model")

Signed-off-by: Yikun Wei <YikunWei@126.com>
---
 .../process/contribution-maturity-model.rst   | 104 ++++++++++++++++++
 .../translations/zh_CN/process/index.rst      |   2 +-
 2 files changed, 105 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/process/contribution-maturity-model.rst

diff --git a/Documentation/translations/zh_CN/process/contribution-maturity-model.rst b/Documentation/translations/zh_CN/process/contribution-maturity-model.rst
new file mode 100644
index 000000000000..c3ae93e7d627
--- /dev/null
+++ b/Documentation/translations/zh_CN/process/contribution-maturity-model.rst
@@ -0,0 +1,104 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/process/contribution-maturity-model.rst
+
+:翻译:
+
+ Yikun Wei <YikunWei@126.com>
+
+Linux 内核贡献成熟度模型
+========================
+
+背景
+====
+
+在 2021 年 Linux 内核维护者峰会上，与会者围绕
+内核维护者招募以及维护者接棒这一难题展开了
+讨论。讨论形成的一项共识是：作为 Linux 内核
+社区一员的各家公司，应当允许工程师把担任
+维护者纳入本职工作，使其得以成长为受人尊重
+的领导者，并最终成为内核维护者。为了维系
+一条稳固的人才梯队，应当允许并鼓励开发者
+承担上游贡献，例如审阅他人的补丁、重构内核
+基础设施以及编写文档。
+
+为此，Linux 基金会技术顾问委员会（TAB）提出
+了本《Linux 内核贡献成熟度模型》。这些针对
+上游社区参与的共同期望，旨在提升个体开发者
+的影响力、加强组织间的协作，并改善 Linux
+内核生态的整体健康度。
+
+TAB 敦促各组织持续评估自身的开源成熟度模型，
+并承诺做出改进以与该模型对齐。为使评估真正
+见效，评估应吸纳来自组织各层面的反馈，包括
+管理层以及各个资历层级的开发者。本着开源的
+精神，我们鼓励各组织公开其评估结果以及改善
+上游社区参与度的计划。
+
+第 0 级
+=======
+
+* 不允许软件工程师向 Linux 内核贡献补丁。
+
+第 1 级
+=======
+
+* 允许软件工程师向 Linux 内核贡献补丁，无论是
+  作为本职工作的一部分，还是利用个人时间。
+
+第 2 级
+=======
+
+* 期望软件工程师将向上游 Linux 内核贡献作为
+  本职工作的一部分。
+* 支持软件工程师将参加 Linux 相关的会议纳入
+  工作范畴。
+* 在晋升与绩效评估中，将考量软件工程师的上游
+  代码贡献。
+
+第 3 级
+=======
+
+* 期望软件工程师将审阅补丁（包括由其他公司
+  工程师撰写的补丁）作为本职工作的一部分。
+* 向 Linux 相关会议或学术会议（例如由 Linux
+  基金会、Usenix、ACM 等组织的会议）提交演讲
+  或论文，被视为工程师工作的一部分。
+* 在晋升与绩效评估中，将考量软件工程师的社区
+  贡献。
+* 组织应定期汇报其开源贡献的度量指标，并对这些
+  指标长期跟踪。这些指标可以仅限组织内部发布，
+  也可由组织自行决定部分或全部对外公开。强烈
+  建议纳入的度量指标包括：
+
+  * 团队或组织的上游内核贡献数量（例如，向某
+    位经理、总监或副总裁汇报的所有人员）。
+  * 组织内做出过上游贡献的内核开发者，占组织
+    内核开发者总数的比例。
+  * 组织服务器和/或产品中所用内核，与内部内核
+    所基于的上游内核发布日期之间的时间间隔。
+  * 内部内核中存在的树外（out-of-tree）提交数量。
+
+第 4 级
+=======
+
+* 鼓励软件工程师将一部分工作时间投入到“上游
+  工作”中。此处“上游工作”指：审阅补丁、担任
+  程序委员会委员、改进核心项目基础设施（如
+  编写或维护测试）、削减上游技术债务、编写
+  文档等。
+* 支持软件工程师协助组织 Linux 相关的会议。
+* 组织将在正式的绩效评估中，考量社区成员的
+  反馈。
+
+第 5 级
+=======
+
+* 将上游内核开发视为一个正式的工作岗位，工程师
+  至少要将三分之一的时间用于上游工作。
+* 组织将主动征求社区成员的反馈，并将其作为正式
+  绩效评估的一项考量因素。
+* 组织将在内部定期汇报：上游工作与直接追求
+  业务目标的工作之间的时间比例。
diff --git a/Documentation/translations/zh_CN/process/index.rst b/Documentation/translations/zh_CN/process/index.rst
index 3a36ca7d9333..4fbc2c4eb605 100644
--- a/Documentation/translations/zh_CN/process/index.rst
+++ b/Documentation/translations/zh_CN/process/index.rst
@@ -66,6 +66,7 @@ TODOLIST:
    stable-kernel-rules
    submit-checklist
    researcher-guidelines
+   contribution-maturity-model
 
 TODOLIST:
 
@@ -73,7 +74,6 @@ TODOLIST:
 * kernel-docs
 * deprecated
 * maintainers
-* contribution-maturity-model
 
 
 这些是一些总体性技术指南，由于不大好分类而放在这里：
-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916570;
	b=3GgQgpZksSK6YxnHymoLstz23/c4paADANe2ThEoWpW6aC4N0B6JYOnFR5sJ/fLI0k8U
	 H+d2PcyG0KAfrJhMbyO0xtCfzcJOm4CGrEB1FFsLxiKb0LHGQQwujegU24G0sFssiPDD2
	 eFy6+tRJg5koPriuItknBD/geHPRapTq+1kVEKSah469KdkV3G04AJPg4rgsyRtQbi+T8
	 vJCU+Z+zsp8nwu2YQuQm46fdc6pHnefyLQAGBj+k0pUgrWhvk36KWEAUXxYXmK9ATSVMf
	 KdIWGFve5p98MuikcMs9V4XSWYpfVLq+mcZTcS+Nz/CZnkDEO6qf0M3q1Iah8h6a3fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916570;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=Db0m+EJqI8KdExKdGFVVNTX7OcgHi2rGj4q2VO0kAvU=;
	b=XcnBOXFggnTaxr3Gkz6IlEZiATJzHvbvn8y3oSZjqKA8JcIke7Trn99CCr0jFqqOfvD0
	 h0XJYyZ8Rdq0FKMP9MRFL2iEw2GruSo9ea3acqkAH2MP1qEi7Z4qoVYTM6U+ydvsI8+hG
	 m8BnLa9PlTpKVxDjVMh0Tp8zraeRoDc1DyC/nAYOgik9XgwMXBhTiG5QyuPp6uARythtx
	 WooXTB5FhUbdNGbtBAeVSx2IKjHjxiEtn3pgBWlEbTeDAwv3BlVWPK+Zo1Leo/VDffIY+
	 efBQx3NNFAMdPzRp64m6SltMSH+vZH/MquUVGmGmdlfLquCln7k1uP4gFz4H4P57WJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=126.com;
	spf=pass smtp.mailfrom=126.com;
	dkim=pass header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=DNBZpLme;
	arc=none smtp.remote-ip=117.135.210.8
Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12865606A330
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 11:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12865606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=DNBZpLme
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=Db0m+EJqI8KdExKdGFVVNTX7OcgHi2rGj4q2VO0kAvU=;
	b=DNBZpLmeY+oYMl74HtZYWZj6XL99ZJzPhFmeOj1dzH0vG/WDUcshd9323KWlPQ
	q61fJARMeZacBoYevOeW8nG1zxtthHm/H8mVfpA07ndtHNqSHCEQUNsZCT9roOcw
	SoxFxO3VMc5iSQBlZ1R51Ghdgljjb4I5ws8/BLMLb7YEI=
Received: from peter-desktop.. (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDnj9KxQPxqdB4NDQ--.49363S3;
	Tue, 17 Nov 2026 19:55:32 +0800 (CST)
From: YikunWei <YikunWei@126.com>
To: alexs@kernel.org
Cc: si.yanteng@linux.dev,
	dzm91@hust.edu.cn,
	linux-doc@vger.kernel.org,
	Yikun Wei <YikunWei@126.com>
Subject: [PATCH v2 1/4] docs/zh_CN: Add contribution maturity model translation
Date: Tue, 17 Nov 2026 19:55:22 +0800
Message-ID: <20261117115527.27937-2-YikunWei@126.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117115527.27937-1-YikunWei@126.com>
References: <20261117115527.27937-1-YikunWei@126.com>
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
X-CM-TRANSID:_____wDnj9KxQPxqdB4NDQ--.49363S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxCFW3KF1xuF4DCw43Zw4fZrb_yoWrKrW3pF
	Wq9FySga10qryrKrWxGFyxWF1fXa4rAF4kZFyxX3WaqF93Jrn7JrW3KF98K3s7WF4rAay8
	XF4rGrZ8GrWxZwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j0ApnUUUUU=
X-CM-SenderInfo: p1ln30xzhlqiyswou0bp/xtbBlBYXGWr8QLbFdwAA3e

From: Yikun Wei <YikunWei@126.com>

Translate .../process/contribution-maturity-model.rst into Chinese.

Update the translation through commit 10a29eb658b3
("Documentation/process: Add Linux Kernel Contribution Maturity Model")

Signed-off-by: Yikun Wei <YikunWei@126.com>
---
 .../process/contribution-maturity-model.rst   | 83 +++++++++++++++++++
 .../translations/zh_CN/process/index.rst      |  2 +-
 2 files changed, 84 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/process/contribution-maturity-model.rst

diff --git a/Documentation/translations/zh_CN/process/contribution-maturity-model.rst b/Documentation/translations/zh_CN/process/contribution-maturity-model.rst
new file mode 100644
index 000000000000..3bc410386006
--- /dev/null
+++ b/Documentation/translations/zh_CN/process/contribution-maturity-model.rst
@@ -0,0 +1,83 @@
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
+作为 2021 年 Linux 内核维护者峰会的一部分，与会者围绕内核维护者招募以及维护者
+接棒这一难题展开了 `讨论 <https://lwn.net/Articles/870581/>`_。讨论形成的一项
+共识是：作为 Linux 内核社区一员的各家公司，应当允许工程师把担任维护者纳入本职
+工作，使其得以成长为受人尊重的领导者，并最终成为内核维护者。为了维系一条稳固的
+人才梯队，应当允许并鼓励开发者承担上游贡献，例如审阅他人的补丁、重构内核基础设施
+以及编写文档。
+
+为此，Linux 基金会技术顾问委员会（TAB）提出了本《Linux 内核贡献成熟度模型》。
+这些针对上游社区参与的共同期望，旨在提升个体开发者的影响力、加强组织间的协作，
+并改善 Linux 内核生态的整体健康度。
+
+TAB 敦促各组织持续评估自身的开源成熟度模型，并承诺做出改进以与该模型对齐。为使
+评估真正见效，评估应吸纳来自组织各层面的反馈，包括管理层以及各个资历层级的开发者。
+本着开源的精神，我们鼓励各组织公开其评估结果以及改善上游社区参与度的计划。
+
+第 0 级
+=======
+
+* 不允许软件工程师向 Linux 内核贡献补丁。
+
+第 1 级
+=======
+
+* 允许软件工程师向 Linux 内核贡献补丁，无论是作为本职工作的一部分，还是利用
+  个人时间。
+
+第 2 级
+=======
+
+* 期望软件工程师将向上游 Linux 内核贡献作为本职工作的一部分。
+* 支持软件工程师将参加 Linux 相关的会议纳入工作范畴。
+* 在晋升与绩效评估中，将考量软件工程师的上游代码贡献。
+
+第 3 级
+=======
+
+* 期望软件工程师将审阅补丁（包括由其他公司工程师撰写的补丁）作为本职工作的
+  一部分。
+* 向 Linux 相关会议或学术会议（例如由 Linux 基金会、Usenix、ACM 等组织的会议）
+  提交演讲或论文，被视为工程师工作的一部分。
+* 在晋升与绩效评估中，将考量软件工程师的社区贡献。
+* 组织应定期汇报其开源贡献的度量指标，并对这些指标长期跟踪。这些指标可以仅限
+  组织内部发布，也可由组织自行决定部分或全部对外公开。强烈建议纳入的度量指标
+  包括：
+
+  * 团队或组织的上游内核贡献数量（例如，向某位经理、总监或副总裁汇报的所有人员）。
+  * 组织内做出过上游贡献的内核开发者，占组织内核开发者总数的比例。
+  * 组织服务器和/或产品中所用内核，与内部内核所基于的上游内核发布日期之间的
+    时间间隔。
+  * 内部内核中存在的树外（out-of-tree）提交数量。
+
+第 4 级
+=======
+
+* 鼓励软件工程师将一部分工作时间投入到“上游工作”中。此处“上游工作”指：审阅补丁、
+  担任程序委员会委员、改进核心项目基础设施（如编写或维护测试）、削减上游技术债务、
+  编写文档等。
+* 支持软件工程师协助组织 Linux 相关的会议。
+* 组织将在正式的绩效评估中，考量社区成员的反馈。
+
+第 5 级
+=======
+
+* 将上游内核开发视为一个正式的工作岗位，工程师至少要将三分之一的时间用于上游
+  工作。
+* 组织将主动征求社区成员的反馈，并将其作为正式绩效评估的一项考量因素。
+* 组织将在内部定期汇报：上游工作与直接追求业务目标的工作之间的时间比例。
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


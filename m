Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=13.76.78.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839916;
	b=fXWYXOgMDVUp5xbiFdDAMVZDnCrZD9xAWlV/p6r3e4XC3O44n5zCmFDNuCCZncLwNDTV
	 4UkXr6UEz7ms01wdtTk4Z/2udJMeA/4mwhKsFLXfdtKbc2AVkQaJ5OciPFl9/5+3tuHTp
	 Pk/mGDWnQDSYRQ+ti9Qw4nCX0Mbcgg87KplyJkL5g5z0E6rRVfFf6ig+wUBZ5jqfpAgMG
	 WNTcRkXft1Tz0FIalumBk7xrXJiQAY5L3vtFuefk7xJgyHczpXHkrXLF9kHuEHRnXZf4+
	 4hHWWaFKnzaIL8AtR7dTVt9BUCC2A0YGZfLM0ga9Hg+1YadDmp/67p0U7Qx64eAeNfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839916;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=n1OBCMHu4LyP6e8nV9012UGzHst9KleLMzA6EyU4i1Y=;
	b=yUSmjMIKjBVguOigGMPXQFQ/D2erOFH/l30nCai4JKm6O4bdtEVvtn32cVhYWmuK2KcP
	 8aaWMfywJLC3u/ts0b78NlcYvqHh7MXJnXCQSaQTYQXJLlB0QWpDJXcSlV2JNATamt33G
	 sMEDlAF15Z5XAeuhvlWbQCLl8SKD9rdmU09Rgahwmotavct9BdrTDT/pkvNHaAy5pam88
	 PVQKwMn7VCfXynEqROwYRslvehOT3blscLL4cf9WFBrdtBDGQYHERxlCYNURdVi82Dvyv
	 1+Tae4JrjxgAnYb25dOpZaWGRh43XsKCEYnvdD6smY2lD6ktQ5zyDxTuHEkKDC98Ekg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=13.76.78.106
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.76.78.106])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D32B3606A31C
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 14:38:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D32B3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with UTF8SMTP id IAEQrMC2fWlhFftqd+5cAA--.13071S2;
	Mon, 16 Nov 2026 22:38:25 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wCHgDdcFftq2rdNAA--.14046S2;
	Mon, 16 Nov 2026 22:38:21 +0800 (CST)
Message-ID: <0b283f1a-d516-4fb6-b5bc-e3171d9c291a@hust.edu.cn>
Date: Mon, 16 Nov 2026 22:38:20 +0800
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/zh_CN: Add contribution maturity model translation
To: YikunWei <YikunWei@126.com>, alexs@kernel.org
Cc: si.yanteng@linux.dev, linux-doc@vger.kernel.org
References: <20261113112200.16790-1-YikunWei@126.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20261113112200.16790-1-YikunWei@126.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IAEQrMC2fWlhFftqd+5cAA--.13071S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW3GF17tw45GFy7uw1xXw1xGrg_yoWxCrWxpF
	yDKFyftF1xtryava47GFy8u3Z3WF4xGay7tF1rWa4Syw1xG39rt34UK3sxWrWfWFyxAas5
	Zrn8Wry5C34xurJanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmGb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	1Y6r17M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY02Avz4vE-syl42xK82IYc2Ij64
	vIr41l42xK82IY6x8ErcxFaVAv8VW8uFyUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMxCI
	bckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
	I_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
	6r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj4
	0_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8
	JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0X_-JUUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 11/13/26 7:21 PM, YikunWei wrote:
> From: Yikun Wei <YikunWei@126.com>
>
> Translate .../process/contribution-maturity-model.rst into Chinese.
>
> Update the translation through commit 10a29eb658b3
> ("Documentation/process: Add Linux Kernel Contribution Maturity Model")
>
> Signed-off-by: Yikun Wei <YikunWei@126.com>
> ---
>   .../process/contribution-maturity-model.rst   | 104 ++++++++++++++++++
>   .../translations/zh_CN/process/index.rst      |   2 +-
>   2 files changed, 105 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/process/contribution-maturity-model.rst
>
> diff --git a/Documentation/translations/zh_CN/process/contribution-maturity-model.rst b/Documentation/translations/zh_CN/process/contribution-maturity-model.rst
> new file mode 100644
> index 000000000000..c3ae93e7d627
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/process/contribution-maturity-model.rst
> @@ -0,0 +1,104 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/process/contribution-maturity-model.rst
> +
> +:翻译:
> +
> + Yikun Wei <YikunWei@126.com>
> +
> +Linux 内核贡献成熟度模型
> +========================
> +
> +背景
> +====
> +
> +在 2021 年 Linux 内核维护者峰会上，与会者围绕

Your line is too short. Please double check how-to.rst for line length.

It seems like another patch from you has no problem with line length. 
Does your agent make a mistake?

> +内核维护者招募以及维护者接棒这一难题展开了
> +讨论。讨论形成的一项共识是：作为 Linux 内核

Please retain the link to the 2021 Maintainers’ Summit discussion 
(https://lwn.net/Articles/870581/).

The English source links to that discussion, but the translation renders 
it as plain text, so readers cannot follow the reference.

Dongliang Mu

> +社区一员的各家公司，应当允许工程师把担任
> +维护者纳入本职工作，使其得以成长为受人尊重
> +的领导者，并最终成为内核维护者。为了维系
> +一条稳固的人才梯队，应当允许并鼓励开发者
> +承担上游贡献，例如审阅他人的补丁、重构内核
> +基础设施以及编写文档。
> +
> +为此，Linux 基金会技术顾问委员会（TAB）提出
> +了本《Linux 内核贡献成熟度模型》。这些针对
> +上游社区参与的共同期望，旨在提升个体开发者
> +的影响力、加强组织间的协作，并改善 Linux
> +内核生态的整体健康度。
> +
> +TAB 敦促各组织持续评估自身的开源成熟度模型，
> +并承诺做出改进以与该模型对齐。为使评估真正
> +见效，评估应吸纳来自组织各层面的反馈，包括
> +管理层以及各个资历层级的开发者。本着开源的
> +精神，我们鼓励各组织公开其评估结果以及改善
> +上游社区参与度的计划。
> +
> +第 0 级
> +=======
> +
> +* 不允许软件工程师向 Linux 内核贡献补丁。
> +
> +第 1 级
> +=======
> +
> +* 允许软件工程师向 Linux 内核贡献补丁，无论是
> +  作为本职工作的一部分，还是利用个人时间。
> +
> +第 2 级
> +=======
> +
> +* 期望软件工程师将向上游 Linux 内核贡献作为
> +  本职工作的一部分。
> +* 支持软件工程师将参加 Linux 相关的会议纳入
> +  工作范畴。
> +* 在晋升与绩效评估中，将考量软件工程师的上游
> +  代码贡献。
> +
> +第 3 级
> +=======
> +
> +* 期望软件工程师将审阅补丁（包括由其他公司
> +  工程师撰写的补丁）作为本职工作的一部分。
> +* 向 Linux 相关会议或学术会议（例如由 Linux
> +  基金会、Usenix、ACM 等组织的会议）提交演讲
> +  或论文，被视为工程师工作的一部分。
> +* 在晋升与绩效评估中，将考量软件工程师的社区
> +  贡献。
> +* 组织应定期汇报其开源贡献的度量指标，并对这些
> +  指标长期跟踪。这些指标可以仅限组织内部发布，
> +  也可由组织自行决定部分或全部对外公开。强烈
> +  建议纳入的度量指标包括：
> +
> +  * 团队或组织的上游内核贡献数量（例如，向某
> +    位经理、总监或副总裁汇报的所有人员）。
> +  * 组织内做出过上游贡献的内核开发者，占组织
> +    内核开发者总数的比例。
> +  * 组织服务器和/或产品中所用内核，与内部内核
> +    所基于的上游内核发布日期之间的时间间隔。
> +  * 内部内核中存在的树外（out-of-tree）提交数量。
> +
> +第 4 级
> +=======
> +
> +* 鼓励软件工程师将一部分工作时间投入到“上游
> +  工作”中。此处“上游工作”指：审阅补丁、担任
> +  程序委员会委员、改进核心项目基础设施（如
> +  编写或维护测试）、削减上游技术债务、编写
> +  文档等。
> +* 支持软件工程师协助组织 Linux 相关的会议。
> +* 组织将在正式的绩效评估中，考量社区成员的
> +  反馈。
> +
> +第 5 级
> +=======
> +
> +* 将上游内核开发视为一个正式的工作岗位，工程师
> +  至少要将三分之一的时间用于上游工作。
> +* 组织将主动征求社区成员的反馈，并将其作为正式
> +  绩效评估的一项考量因素。
> +* 组织将在内部定期汇报：上游工作与直接追求
> +  业务目标的工作之间的时间比例。
> diff --git a/Documentation/translations/zh_CN/process/index.rst b/Documentation/translations/zh_CN/process/index.rst
> index 3a36ca7d9333..4fbc2c4eb605 100644
> --- a/Documentation/translations/zh_CN/process/index.rst
> +++ b/Documentation/translations/zh_CN/process/index.rst
> @@ -66,6 +66,7 @@ TODOLIST:
>      stable-kernel-rules
>      submit-checklist
>      researcher-guidelines
> +   contribution-maturity-model
>   
>   TODOLIST:
>   
> @@ -73,7 +74,6 @@ TODOLIST:
>   * kernel-docs
>   * deprecated
>   * maintainers
> -* contribution-maturity-model
>   
>   
>   这些是一些总体性技术指南，由于不大好分类而放在这里：


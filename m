Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [40.65.178.148])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16A543ACA5C
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 14:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=40.65.178.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787321515; cv=none; b=GveifP08L5JkC5FWAo+ZslxiYnqdWnKQmM8oofGai65y1BcC935yrwQQNHr/DWPY5C06UY39dvRbyrvHeAXjZcurK1j5NnV0QuPk8XgFsXB8iS6Ef1kq0UfmManr2YZZWHsXdE19I+CxFs430e+7wZJPg+leca/NTslawxRvwJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787321515; c=relaxed/simple;
	bh=ozAASdczWlsQh9dMpQHGR6VWpAJT5Nw4dLDfjL1B6ZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ILzfwWBx+FUa31bJYy38dknSdSxHoMROXwGqTxi0z0lWSDKwPJLtG/OEpHuAGUaulYMw8Znwn6JaGJ+c7T0jVHdr2RW88UkdtRGJ6bDNxWfQlMSZnbpao5frmf384lP4dC7pyrUuiHVsPkyNnNIqbd9MeFeDS6kbm4i270S4QXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=40.65.178.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app2 (Coremail) with SMTP id HwEQrAC3jjWUXIhqKQ6+AA--.13723S2;
	Fri, 21 Aug 2026 22:11:32 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wC3lNGNXIhq_TkDAA--.4111S2;
	Fri, 21 Aug 2026 22:11:27 +0800 (CST)
Message-ID: <ae0b74c4-e6c2-4240-96b4-66c3415e8f79@hust.edu.cn>
Date: Fri, 21 Aug 2026 22:11:25 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: What's cooking in Chinese docs (Aug 2026, #01)
To: Weijie Yuan <wy@wyuan.org>, linux-doc@vger.kernel.org
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Chen-Yu Yeh <chenyou910331@gmail.com>
References: <aoLkMBQszbzqYowy@wyuan.org>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <aoLkMBQszbzqYowy@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:HwEQrAC3jjWUXIhqKQ6+AA--.13723S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW3GFW8tr4fXw15JF4ktr17GFg_yoW3uw13pF
	ZxJr47KF18Zw18trs7Ww4UZF48Xa45GrnrXw1rJwn3tF4vyr18WF1UKryIgFW2qr929F15
	Xa4xZF1q9rWUZFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPab7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAac4AC62xK8x
	CEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0U
	Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VACjcxG62k0Y48FwI0_Gr1j6F4UJwAv7VCjz4
	8v1sIEY20_GFW3Jr1UJwAv7VCY1x0262k0Y48FwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_
	Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uF
	yUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr
	0_Gr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxU
	srWFUUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 8/17/26 6:36 PM, Weijie Yuan wrote:
> Here are the topics waiting to be merged.
>
> Sorry for the late update.
>
> Last time, a contributor mentioned that he did not want to be copied, so
> this time I will only send it to the maintainer. Meanwhile, I am looking
> forward to the emergence of an automated system for our work. ;-)
>
>
> Copies of the source code to Chinese documentation development tree live
> in here:
>
>      git://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git
>      https://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git
>      https://kernel.googlesource.com/pub/scm/linux/kernel/git/alexs linux.git
>
> Mirrors:
>
>      https://mirrors.hust.edu.cn/git/kernel-doc-zh.git
>      https://mirror.nju.edu.cn/git/kernel-doc-zh.git (experimental)
>
> Please report any mirror instability to linux-doc@vger.kernel.org
>
> -----------------------------------------------------------------------
>
> [Cooking]
>
> * Siwei Chen 2026-08-17 5 commits
>    [PATCH v4 1/5] docs/zh_CN: Add networking team documentation Chinese translation
>    [PATCH v4 2/5] docs/zh_CN: Add NIC SR-IOV APIs Chinese translation
>    [PATCH v4 3/5] docs/zh_CN: Add Softnet Driver Issues Chinese translation
>    [PATCH v4 4/5] docs/zh_CN: Add ipv6 Chinese translation
>    [PATCH v4 5/5] docs/zh_CN: Add LSM/SeLinux secid Chinese translation
>
>    Needs review & final round?
>
>    source: https://lore.kernel.org/linux-doc/20260817021340.17318-1-anka@stu.cdut.edu.cn/
>
>
> * Weijie Yuan 2026-08-16 3 commits
>    [PATCH v3 0/2] docs/zh_CN: translate process/applying-patches.rst into Chinese
>    [PATCH v3 1/2] docs/zh_CN: add process/applying-patches Chinese translation
>    [PATCH v3 2/2] docs/zh_CN: link to Chinese applying-patches translation
>
>    Needs review.
>
>    source: https://lore.kernel.org/linux-doc/20260817-apply-patches-v3-0-45e3bd2b1ccc@wyuan.org/
>
>
> * Chen Miao 2026-08-14 2 commits
>    [PATCH v4 5/6] docs/zh_CN: doc-guide: document macOS Sphinx setup
>    [PATCH v4 6/6] docs/zh_CN: how-to: document case-sensitive APFS setup
>
>    Waiting for a separated translation series, as suggested by Dongliang.
>
>    comment: https://lore.kernel.org/linux-doc/b233295b-64c0-4d50-a0fd-516e4795eb96@hust.edu.cn/
>    source: https://lore.kernel.org/linux-doc/b233295b-64c0-4d50-a0fd-516e4795eb96@hust.edu.cn/ (PATCH 5/6)
>    source: https://lore.kernel.org/linux-doc/20260814214419.49925-6-chenmiao.ku@gmail.com/ (PATCH 6/6)
>
>
> * Doehyun Baek 2026-08-12 7 commits
>    [PATCH v7 0/7] docs/zh_CN: update DAMON translations
>    [PATCH v7 1/7] docs/zh_CN: update DAMON design translation
>    [PATCH v7 2/7] docs/zh_CN: add DAMON_STAT usage translation
>    [PATCH v7 3/7] docs/zh_CN: update DAMON index translation
>    [PATCH v7 4/7] docs/zh_CN: update DAMON start translation
>    [PATCH v7 5/7] docs/zh_CN: update DAMON usage translation
>    [PATCH v7 6/7] docs/zh_CN: update DAMON reclaim translation
>    [PATCH v7 7/7] docs/zh_CN: update DAMON LRU sort translation
>
>    Waiting for response.
>
>    comment: https://lore.kernel.org/linux-doc/b408e294-2768-4be8-a6d8-81acff90c556@hust.edu.cn/
>    source: https://lore.kernel.org/linux-doc/20260812065914.3071433-1-doehyunbaek@gmail.com/
>
>
> * Chen-Yu Yeh 2026-08-07 16 commits (zh_TW)
>    [PATCH v3 00/16] docs/zh_TW: localize terminology and sync process/ documents
>    [PATCH v3 01/16] docs/zh_TW: process: localize terminology in 7.AdvancedTopics.rst
>    [PATCH v3 02/16] docs/zh_TW: process: localize terminology in 1.Intro.rst
>    [PATCH v3 03/16] docs/zh_TW: process: localize terminology in code-of-conduct-interpretation.rst
>    [PATCH v3 04/16] docs/zh_TW: process: localize terminology in license-rules.rst
>    [PATCH v3 05/16] docs/zh_TW: process: localize terminology in email-clients.rst
>    [PATCH v3 06/16] docs/zh_TW: process: localize terminology in programming-language.rst
>    [PATCH v3 07/16] docs/zh_TW: process: localize terminology in coding-style.rst
>    [PATCH v3 08/16] docs/zh_TW: process: localize terminology in stable-kernel-rules.rst
>    [PATCH v3 09/16] docs/zh_TW: process: localize terminology in 5.Posting.rst
>    [PATCH v3 10/16] docs/zh_TW: process: localize terminology in 2.Process.rst
>    [PATCH v3 11/16] docs/zh_TW: process: localize terminology in howto.rst
>    [PATCH v3 12/16] docs/zh_TW: process: localize terminology in embargoed-hardware-issues.rst
>    [PATCH v3 13/16] docs/zh_TW: process: localize terminology in submitting-patches.rst
>    [PATCH v3 14/16] docs/zh_TW: process: localize terminology in 8.Conclusion.rst
>    [PATCH v3 15/16] docs/zh_TW: process: localize terminology in index.rst
>    [PATCH v3 16/16] docs/zh_TW: Add a glossary for Traditional Chinese translations
>
>    Ready to be merged?
>
>    comment: https://lore.kernel.org/linux-doc/anx4SPAL0Yx13xk5@wyuan.org/
>    comment: https://lore.kernel.org/linux-doc/CAKspUhKM6mBpy7hZD=8ZnwrAy81O1sYC_g7QdCA3qVDUcLV6dw@mail.gmail.com/
>    source: https://lore.kernel.org/linux-doc/20260806181949.65648-1-chenyou910331@gmail.com/
>
>
> * Ye Liu 2026-08-06 1 commit
>    [PATCH v2] docs/zh_CN: sync page_table_check.rst translation
>
>    Needs review.
>
>    source: https://lore.kernel.org/linux-doc/20260806013055.2690464-1-ye.liu@linux.dev/
>
>
> * Cui Shuang 2026-07-22 1 commit
>    [PATCH v3] docs/zh_CN: Add configurable error injection translation
>
>    Needs review.
>
>    source: https://lore.kernel.org/linux-doc/20260722123240.22979-1-imcusg@gmail.com/
>
>
> * Jiandong Qiu (2026-07-06) 2 commits
>    [PATCH v3 0/2] docs/zh_CN: update translation of doc-guide/sphinx.rst
>    [PATCH v3 1/2] docs/zh_CN: add process/changes.rst translation
>    [PATCH v3 2/2] docs/zh_CN: update sphinx.rst translation
>
>    Needs review.
>
>    source: https://lore.kernel.org/linux-doc/20260706151358.2103703-1-qiujiandong1998@gmail.com/
>
>
> * Yan Zhu (2026-06-12) 10 commits
>    [not found] <cover.1781105672.git.zhuyan2015@qq.com>
>    [PATCH 01/10] docs/zh_CN: add LSM/index Chinese translation
>    [PATCH 02/10] docs/zh_CN: add LSM/apparmor Chinese translation
>    [PATCH 03/10] docs/zh_CN: add LSM/LoadPin Chinese translation
>    [PATCH 04/10] docs/zh_CN: add LSM/SELinux Chinese translation
>    [PATCH 05/10] docs/zh_CN: add LSM/Smack Chinese translation
>    [PATCH 06/10] docs/zh_CN: add LSM/tomoyo Chinese translation
>    [PATCH 07/10] docs/zh_CN: add LSM/Yama Chinese translation
>    [PATCH 08/10] docs/zh_CN: add LSM/SafeSetID Chinese translation
>    [PATCH 09/10] docs/zh_CN: add LSM/ipe Chinese translation
>    [PATCH 10/10] docs/zh_CN: add LSM/landlock Chinese translation
>
>    Needs review.
>
>    source: https://lore.kernel.org/linux-doc/tencent_7080BF6BB8F05936649DDC091FFD8C45210A@qq.com/
>
>    ps. I suspect the reason why cover letter was missing is that the user was
>    using QQ mail or Tencent Enterprise Email, which would break the message-ID
>    of cover letter. Hence the cover letter is somewhere else on the lore
>    archive.
>
>
> * Kefan Bai 2026-06-01 1 commit
>    [PATCH v4] docs/zh_CN: usb: refine translated wording and formatting
>
>    Needs review.
>
>    (Looks like the other 8 commits in the same thread have been merged into
>    mainline through Greg KH's tree)
>
>    source: https://lore.kernel.org/linux-doc/20260601082652.650303-1-baikefan@leap-io-kernel.com/
>
> -----------------------------------------------------------------------
>
> [Stalled]
>
> * Haoyang Liu (2026-03-05) 1 commit
>    [PATCH] docs/zh_CN: fix an inconsistent statement in dev-tools/testing-overview
>
>    No response for too long, will discard.
>
>    comment: https://lore.kernel.org/linux-doc/29bd0dbc-c6f9-43ce-b95f-4e787e3fe9c3@gmail.com/
>    source: https://lore.kernel.org/linux-doc/20260305192048.16405-1-tttturtleruss@gmail.com/

https://lore.kernel.org/linux-doc/062e7436-20dc-467f-9a4d-787eeec19228@hust.edu.cn/

Your cooking bot seems have a bug. This patch is already applied.

Dongliang Mu

>
>
> Thanks.


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.187.6.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841674;
	b=TiiKFi/NmDLZ1nkOXrE3QQ+lq/J3zcQ1ACtyI3kl39TOr3lGETl9SApQoxgUdhazxxb2
	 SQuHFKI3nw3u3tJ0AV38P5eM5JMZyaL2qBld/JKgkZ9nImpR+tOxxcQZVW4nmB3Wnz45H
	 D3UgVsTiCZuSrc8/vfDgrlS01NNDFtDAT8BNfIQ3LXO/dF8ZGJcC8awUErnhMw//0I97p
	 IYjEBqaoJ8guDJISro5eWNKl3xJ0PgGNOJjLfEkyngi6KLKZoPyKH2jupsaPDEysnG6Bm
	 c07Wmxme/HgxtIRnzx/xOo1DTDcYI1M/DqOffhyBx98MhfauFL4vMIntRKQZ9KeXE5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841674;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=MGcFgLp6HuX9FRty+jxs2wbL+PULg5K7KM2P5AOBf1I=;
	b=zHca8Vwv/hsdepQx8JFEc9ok7SRHHMlzHD+8pElSl7TJzcDg7FXXSdQI25c6oisiwkKH
	 71sue7tDDnSl57kPABVNJ60GL12IBNLTALOFwRBNBlfki9PN+J+DBC5zevtbaIJLK2Ykh
	 U3BkkD6NB1uBiXt1cAZFOL9gyc0db9XROD/LiK3Y1ejP/bwc1wUJcajJJaqY3tkY8GP57
	 9+TYVV90CwS0+6EVPvu4uRfE0vHvCkk7vh0WYn+GW6KZvQUXTIy3eQucOzlmCnsoi2lX6
	 OgiPb80R6FYTgwX6uOiLZOdLSWq6Ri5yyD1NL6rAeXUYYGO/3kyqlmGQZaON/JzxAqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=52.187.6.220
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.187.6.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE08E606A33B
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 15:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE08E606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with UTF8SMTP id IAEQrMC2fWk+HPtq9xBdAA--.13279S2;
	Mon, 16 Nov 2026 23:07:42 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wA3wjw2HPtqK81NAA--.53845S2;
	Mon, 16 Nov 2026 23:07:35 +0800 (CST)
Message-ID: <b930b5f3-8571-42a6-a8d4-433ace854f3f@hust.edu.cn>
Date: Mon, 16 Nov 2026 23:07:34 +0800
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
Subject: Re: What's cooking in Chinese docs (Nov 2026, #04)
To: Weijie Yuan <kernel@wyuan.org>, linux-doc@vger.kernel.org
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>
References: <avcRFzlQQTOra-fr@wyuan.org>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <avcRFzlQQTOra-fr@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:IAEQrMC2fWk+HPtq9xBdAA--.13279S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvAXoW3Zr17ZFyrAr4rKrW3tw4Utwb_yoW8Jw1DXo
	W7Zr43CrsFgF9rJ3Wjk3ykJFyxGryfGFWrJr1DCr4q93W0g3W8tw17Jw4rJ3s3X3yYk3s7
	Xwn5urWUtrn5JF1xn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUY_7k0a2IF6F4UM7kC6x804xWl1xkIjI8I6I8E6xAIw20EY4v2
	0xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7
	IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1lnxkEFVAIw2
	0F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I2
	7wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r4UJVWxJr1lYx0E74
	AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY
	6r1j6r4UM4x0Y48IcVAKI48JMxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74
	AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWU
	JVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7V
	AKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42
	IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUsrWFUUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 11/13/26 9:31 PM, Weijie Yuan wrote:
> Here are the topics for Chinese docs waiting to be merged.
>
> Copies of the source code to Chinese documentation development tree live
> in here:
>
>      git://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git
>      https://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git
>      https://kernel.googlesource.com/pub/scm/linux/kernel/git/alexs/linux.git
>
> Mirrors:
>
>      https://mirrors.hust.edu.cn/git/kernel-doc-zh.git
>      https://mirror.nju.edu.cn/git/kernel-doc-zh.git (experimental)
>
> Please report any mirror instability to linux-doc@vger.kernel.org
>
> -------------------------------------------------------------------
> [Cooking]
>
> * Yikun Wei 2026-11-13
>    [PATCH] docs/zh_CN: Add deprecated translation
>
>    Needs review.
>    source: <20261113122844.24838-1-YikunWei@126.com>
>
>
> * Yikun Wei 2026-11-13
>    [PATCH] docs/zh_CN: Add contribution maturity model translation
>
>    Needs review.
>    source: <20261113112200.16790-1-YikunWei@126.com>
>
>
> * Xiongwei Song 2026-11-13
>    [PATCH 0/2] Add RCU docs Chinese translation
>    [PATCH 1/2] docs/zh_CN: Add RCU/index.rst translation
>    [PATCH 2/2] docs/zh_CN: Add RCU/whatisRCU.rst Chinese translation
>
>    Needs review.
>    source: <20261113013054.5662-1-xiongwei.song@linux.dev>
>
>
> * Weijie Yuan 2026-11-09
>    [PATCH v3 0/2] docs/zh_CN: update maintainer/configure-git.rst
>    [PATCH v3 1/2] docs/zh_CN: sync maintainer/configure-git with upstream
>    [PATCH v3 2/2] docs/zh_CN: improve maintainer/pull-requests translation
>
>    Needs review.
>    source: <20261109-configure-git-v3-0-d7807bb8e8c7@wyuan.org>

The above four patch/patchset are reviewed. New contributors still need 
to pay more attention to how-to.rst.

Dongliang Mu

>
> * Dongliang Mu 2026-11-09
>    [PATCH v2 0/4] docs/zh_CN: translate AI-related process guides
>    [PATCH v2 1/4] docs/zh_CN: translate coding-assistants.rst
>    [PATCH v2 2/4] docs/zh_CN: translate generated-content.rst
>    [PATCH v2 3/4] docs/zh_CN: translate threat-model.rst
>    [PATCH v2 4/4] docs/zh_CN: link AI guide to translated documents
>
>    Reviewed by Weijie.
>    source: <cover.1794197977.git.dzm91@hust.edu.cn>
>
>
> * Dongliang Mu 2026-11-08
>    [PATCH] docs/zh_CN: add clang-format guide translation
>
>    Needs review.
>    source: <20261108070826.2000511-1-dzm91@hust.edu.cn>
>
>
> * Chen-Yu Yeh 2026-11-06
>    [PATCH 00/13] docs/zh_TW: process: add translations of 13 documents
>    [PATCH 01/13] docs/zh_TW: process: add researcher-guidelines.rst translation
>    [PATCH 02/13] docs/zh_TW: process: add cve.rst translation
>    [PATCH 03/13] docs/zh_TW: process: add applying-patches.rst translation
>    [PATCH 04/13] docs/zh_TW: process: add maintainer-pgp-guide.rst translation
>    [PATCH 05/13] docs/zh_TW: process: add changes.rst translation
>    [PATCH 06/13] docs/zh_TW: process: add handling-regressions.rst translation
>    [PATCH 07/13] docs/zh_TW: process: add deprecated.rst translation
>    [PATCH 08/13] docs/zh_TW: process: add kernel-docs.rst translation
>    [PATCH 09/13] docs/zh_TW: process: add maintainer-handbooks.rst translation
>    [PATCH 10/13] docs/zh_TW: process: add contribution-maturity-model.rst translation
>    [PATCH 11/13] docs/zh_TW: process: add conclave.rst translation
>    [PATCH 12/13] docs/zh_TW: process: add threat-model.rst translation
>    [PATCH 13/13] docs/zh_TW: process: add maintainers.rst translation
>
>    Expecting a reroll.
>    cf. <3bbce43f-476c-4a21-8da3-2be98a696e9c@hust.edu.cn>
>    source: <20261106113545.708896-1-chenyou910331@gmail.com>
>
>
> * Chen-Yu Yeh 2026-11-06
>    [PATCH 00/25] docs/zh_TW: process: resync translations with the English originals
>    [PATCH 01/25] docs/zh_TW: process: sync 1.Intro.rst with the English original
>    [PATCH 02/25] docs/zh_TW: process: sync 2.Process.rst with the English original
>    [PATCH 03/25] docs/zh_TW: process: sync 4.Coding.rst with the English original
>    [PATCH 04/25] docs/zh_TW: process: sync 5.Posting.rst with the English original
>    [PATCH 05/25] docs/zh_TW: process: sync 6.Followthrough.rst with the English original
>    [PATCH 06/25] docs/zh_TW: process: sync 7.AdvancedTopics.rst with the English original
>    [PATCH 07/25] docs/zh_TW: process: sync 8.Conclusion.rst with the English original
>    [PATCH 08/25] docs/zh_TW: process: sync code-of-conduct-interpretation.rst with the English original
>    [PATCH 09/25] docs/zh_TW: process: sync code-of-conduct.rst with the English original
>    [PATCH 10/25] docs/zh_TW: process: sync gdb-kernel-debugging.rst with the English original
>    [PATCH 11/25] docs/zh_TW: process: sync development-process.rst with the English original
>    [PATCH 12/25] docs/zh_TW: process: sync email-clients.rst with the English original
>    [PATCH 13/25] docs/zh_TW: process: sync kernel-driver-statement.rst with the English original
>    [PATCH 14/25] docs/zh_TW: process: sync kernel-enforcement-statement.rst with the English original
>    [PATCH 15/25] docs/zh_TW: process: sync management-style.rst with the English original
>    [PATCH 16/25] docs/zh_TW: process: sync security-bugs.rst with the English original
>    [PATCH 17/25] docs/zh_TW: process: sync volatile-considered-harmful.rst with the English original
>    [PATCH 18/25] docs/zh_TW: process: sync 3.Early-stage.rst with the English original
>    [PATCH 19/25] docs/zh_TW: process: sync coding-style.rst with the English original
>    [PATCH 20/25] docs/zh_TW: process: sync embargoed-hardware-issues.rst with the English original
>    [PATCH 21/25] docs/zh_TW: process: sync howto.rst with the English original
>    [PATCH 22/25] docs/zh_TW: process: sync license-rules.rst with the English original
>    [PATCH 23/25] docs/zh_TW: process: sync stable-api-nonsense.rst with the English original
>    [PATCH 24/25] docs/zh_TW: process: sync submit-checklist.rst with the English original
>    [PATCH 25/25] docs/zh_TW: process: sync submitting-patches.rst with the English original
>
>    Waiting for response.
>    source: <20261106113142.706783-1-chenyou910331@gmail.com>
>
>
> * Dongliang Mu 2026-10-29
>    [PATCH v3 0/9] docs/zh_CN: align translation paths and update guides
>    [PATCH v3 1/9] docs/zh_CN: update admin-guide/index.rst translation
>    [PATCH v3 2/9] docs/zh_CN: update admin-guide/README.rst translation
>    [PATCH v3 3/9] docs/zh_CN: add media administrator guide translations
>    [PATCH v3 4/9] docs/zh_CN: reorganize process debugging guides
>    [PATCH v3 5/9] docs/zh_CN: update magic-number to match upstream
>    [PATCH v3 6/9] docs/zh_CN: reorganize media driver API translations
>    [PATCH v3 7/9] docs/zh_CN: move GFS2 translations into filesystems/gfs2
>    [PATCH v3 8/9] docs/zh_CN: update networking/xfrm/xfrm_proc.rst translation
>    [PATCH v3 9/9] docs/zh_CN: remove stale Original fields from SCSI and IPE translations
>
>    Reviewed by Yanteng.
>    source: <20261029124429.294868-1-dzm91@hust.edu.cn>
>
>
> * Jiandong Qiu 2026-10-29
>    [PATCH v4 0/2] docs/zh_CN: update translation of doc-guide/sphinx.rst
>    [PATCH v4 1/2] docs/zh_CN: add process/changes.rst translation
>    [PATCH v4 2/2] docs/zh_CN: update sphinx.rst translation
>
>    Reviewed by Dongliang.
>    source: <cover.1793279600.git.qiujiandong1998@gmail.com>
>
>
> * Jiaming Ouyang 2026-10-28
>    [PATCH v4] docs/zh_CN: add Chinese translation for usb/ohci.rst
>
>    Expecting a reroll.
>    cf. <fcabf691-cca4-477d-b387-e50467a41408@hust.edu.cn>
>    source: <20261028072643.32250-1-jiamingouyang13@gmail.com>
>
>
> * Yao Yiqi 2026-10-22
>    [PATCH] docs/zh_CN: fix typos in admin-guide/README
>
>    Reviewed by Dongliang.
>    source: <20261022135949.361566-1-yyaqia@gmail.com>
>
>
> * Weijie Yuan 2026-10-21
>    [PATCH v3 0/2] docs/zh_CN: cleanup headers
>    [PATCH v3 1/2] docs/zh_CN: remove translator-related headers
>    [PATCH v3 2/2] docs/zh_CN: remove Translator field in header template
>
>    Partly reviewed by Dongliang with an extra question to Jon.
>    source: <cover.1792569583.git.wy@wyuan.org>
>
>
> * Yikun Wei 2026-10-20
>    [PATCH v3 0/5] docs/zh_CN: add fault-injection Chinese translations
>    [PATCH v3 1/5] docs/zh_CN: add fault-injection index Chinese translation
>    [PATCH v3 2/5] docs/zh_CN: add fault-injection Chinese translation
>    [PATCH v3 3/5] docs/zh_CN: add notifier-error-inject Chinese translation
>    [PATCH v3 4/5] docs/zh_CN: add nvme-fault-injection Chinese translation
>    [PATCH v3 5/5] docs/zh_CN: add provoke-crashes
>
>    Expecting a reroll. (thread broken)
>    cf. <6baba360-6ee2-4195-91e4-d22c97d3c146@hust.edu.cn>
>    source: <SI2PPFCA6543649A166AABA54D11A931F7DDD672@SI2PPFCA6543649.apcprd04.prod.outlook.com>
>
>
> * Weijie Yuan 2026-08-23
>    [PATCH v2 0/5] Update maintainer-pgp-guide.rst Chinese translation
>    [PATCH v2 1/5] docs/zh_CN: update maintainer-pgp-guide translation
>    [PATCH v2 2/5] docs/zh_CN: clarify free Nitrokey requirements
>    [PATCH v2 3/5] docs/zh_CN: update maintainer-pgp-guide kernel.org link
>    [PATCH v2 4/5] docs/zh_CN: add kernel.org trust repository reference
>    [PATCH v2 5/5] docs/zh_CN: remove empty proofreader field from maintainer PGP guide
>
>    Reviewed by Dongliang.
>    source: <20260823-maintainer-pgp-guide-v2-0-bea33b2ece54@wyuan.org>
>
>
> * Yan Zhu 2026-06-12
>    [PATCH 00/10] <cover.1781105672.git.zhuyan2015@qq.com>
>     # Msgid changed
>    [PATCH 00/10] docs/zh_CN: add LSM admin-guide Chinese translation
>                  https://lore.kernel.org/linux-doc/tencent_001080DF135CEE2CD1B260EFA08E3CC71A09@qq.com/
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
>    Waiting for response.
>    cf. <895533d5-99d7-406e-acc2-1f8659075f91@hust.edu.cn>
>    cf. <440378d6-d72c-4edd-9159-582df02b49e6@hust.edu.cn>
>    cf. <e708b270-3adc-4c7e-a48d-9804faed6c44@hust.edu.cn>
>    source: <tencent_7080BF6BB8F05936649DDC091FFD8C45210A@qq.com>
>
> -------------------------------------------------------------------
> [Queuing] #zh_TW
>
> Queuing for 7.5 merge window.
> Currently here: https://github.com/kernel-zh/linux-zh_TW.git docs-next
> If anyone has any objections, please let us know.
>
> * Weijie Yuan 2026-10-30
>    [PATCH v2] docs/zh_TW: drop unused enforcement statement label
>
>    Will be queued after Chen-Yu's two new series land.
>    source: <auQwssHcQiM09SDd@wyuan.org>
>
>
> * Chen-Yu Yeh 2026-09-29
>    [PATCH 0/3] docs/zh_TW: mark translations that are not kept in sync
>    [PATCH 1/3] docs/zh_TW: add a notice for translations not kept in sync
>    [PATCH 2/3] docs/zh_TW: mark translations outside the maintained set
>    [PATCH 3/3] docs/zh_TW: link filesystems/ and cpu-freq/ from the index
>
>    Acked by Weijie.
>    source: <20260929131142.266819-1-chenyou910331@gmail.com>
>
>
> * Chen-Yu Yeh 2026-09-29
>    [PATCH] docs/zh_TW: remove the unreachable plain-text translations Chen-Yu Yeh
>
>    Acked by Weijie.
>    source: <20260929131109.266535-1-chenyou910331@gmail.com>
>
>
> * Chen-Yu Yeh 2026-09-29
>    [PATCH 0/4] docs/zh_TW: relocate translations to follow the English layout
>    [PATCH 1/4] docs/zh_TW: move security-bugs to process/
>    [PATCH 2/4] docs/zh_TW: move magic-number to staging/
>    [PATCH 3/4] docs/zh_TW: move gdb-kernel-debugging to process/debugging/
>    [PATCH 4/4] docs/zh_TW: add missing :Original: fields
>
>    Reviewed by Weijie.
>    source: <20260929131020.266120-1-chenyou910331@gmail.com>
>
>
> * Chen-Yu Yeh 2026-09-29
>    [PATCH v2 0/7] docs/zh_TW: remove duplicated maintainer contact information
>    [PATCH v2 1/7] docs/zh_TW: process: remove maintainer contact information
>    [PATCH v2 2/7] docs/zh_TW: admin-guide: remove maintainer contact information
>    [PATCH v2 3/7] docs/zh_TW: arch: remove maintainer contact information
>    [PATCH v2 4/7] docs/zh_TW: dev-tools: remove maintainer contact information
>    [PATCH v2 5/7] docs/zh_TW: filesystems: remove maintainer contact information
>    [PATCH v2 6/7] docs/zh_TW: cpu-freq: remove maintainer contact information
>    [PATCH v2 7/7] docs/zh_TW: remove the last maintainer contact references
>
>    Acked by Weijie.
>    source: <20260929115956.229610-1-chenyou910331@gmail.com>
>
> PS. The copy of this report is here now:
>      https://github.com/kernel-zh/linux-zh_TW.git meta


Received: from mail-oi2-f42.google.com (mail-oi2-f42.google.com [74.125.231.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1AF51DB0A
	for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 12:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.234
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790684113; cv=pass; b=FvMEyMf27vAbaEqAXuAZqB3yUli3ZMzJX6p9or/JF11lY4vE2UZuvq9OqiXL6ZB8pOzM4mBukXP2dhfQwph+rfAgiTGVMKPgwIDQVkxmfbk51CIMRZsrg5lf3QOxSr8dLG3N/bM4fax8o8ZQU60+wQg3f91bs5vpnBGTMlu5jYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790684113; c=relaxed/simple;
	bh=ZjytLEXfEWg/qaF/R2NU9td5tf51mUsq3xrjt5dPmLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G3GPeA25AwglXzxqW1P31lJMidnZl3/aW19nJa52vVZ0fIFcke2kDi/J5v6gb/V45kM9O8SHkCxhtyfj9r2W/8166jtHJdrkcIu8hoSLSctaLnOPTvah0R3Tzge6QZwbrm3kvcZoGP3PTamMhYbU1TUiRbee43u2zNZEJG4ezBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lwKihsng; arc=pass smtp.client-ip=74.125.231.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lwKihsng"
Received: by mail-oi2-f42.google.com with SMTP id 5614622812f47-4e667873c38so1283622b6e.0
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 05:15:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790684109; cv=none;
        d=google.com; s=arc-20260327;
        b=T1H+dzj3UtAwaHUg8Ewm+0h2XHYjDk8oclzxVGucs+8nCiNwhEXVPukouL4vZLUxPC
         eFAfWLgajowkYjv6+02P0VpJGf3Cz5fY7+AAfCLSt2pnfmyl9JTYaGf1amM+kOei0/W6
         JiTXEp+BJZ1RD4GYaAt4blxpGvSql23U8JSzb7PAeAj2sBZjLV8eqBc1cpF4js4pF4La
         o/ACe6ol4FCNs7bwNGUYzvcPtGx7aDTrn1aL+kB4V9qqEt3taWVQfApc0XHVxvkkhw27
         WvpPcnjf7z/85vhOmyf8EcDIl8ZJuiI+CI+oFuDwHIIcRWQ+qPmwpOuRifLxD+jeal7+
         Sfkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lLBUnSTLBdg7D+51SrxGdZZgrxZ3iHy3h2g4SzFYqSk=;
        fh=CKWt400EW3e00/Rhmmq0ESmQ5acYA9hLZYTD6o+UOPo=;
        b=EC8YYhctHQ7Sj4JYh5v/hO4NalinW99UoMyK+O6hbM/nIJenVtB9rq218/sPcytQq7
         dcE6IyWJgwNA8h1zKaurAmHepefBJSofI/YpdX4dlJxRIT5n4HgJLp1FZe7srVkNqiNZ
         Q/9lAWWzRx6j1buBExwqQiwcVx2FGtv91aDMv6MUlf1ic7mqeLg4Ov32PsexhLE7ImYa
         CthOCGQGhURTSIncrb7NFXdH9Qi2eyYMI7Z4kczskSGastkoi60LpoWMUOWm6AxaFlKw
         iXdHJfvDZQ7NBd15citHOtWrxe8MeB8VYpLzQC/4hx8yRzWW7+SYyo/IogYiNzfecHjv
         ETrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790684109; x=1791288909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lLBUnSTLBdg7D+51SrxGdZZgrxZ3iHy3h2g4SzFYqSk=;
        b=lwKihsngV4kpwf4jMo05W3rOzcHvAED4/QYXLB7B73dwV1GES59+3jNm9RDdp1L7WB
         AZk4ULgf4EJmw7h980b0GEnNb6Fh7+XzlyfjlJkWOKPG8EJ02M8b7oumPaoEoIaA5E+5
         y2rBf6LVEJYOLjY2GknUJegn0KoCBIe+r9F1wPFKhEUqkF3tME3kmjBidL8Fs0eCy/RT
         T29+zzhLiEE0Yd8kqdr0g7K/8geXAYdrnQW672GOWFP6Tk3ubmVXGpvDgQpGdP2+n7l/
         t1PrHttt2skjFpa1LpPV85xbWRADpf2RDmbiCq8S9Z3XbgmVpMvQ6j1o9noSpfkSgd3w
         OFkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790684109; x=1791288909;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lLBUnSTLBdg7D+51SrxGdZZgrxZ3iHy3h2g4SzFYqSk=;
        b=RGvximnB3XwmOYfK0fDfh3vAJQlZ71EhJ2hMWCjUTcQI0mrLjKjI9qxvtVBVKIndzg
         L6Q+VSLopLu6wBM7KVrcTWcI4L2TKMjivTNBp1MAOTMIYi5mRa/hxm29g4Gtns5n/I3e
         jcg1s7ki6JNmh8ORXwcTKPhkuAVG6PHsIC7lPI81FUf76//04pHhieAbm15viDu06xX0
         ZRWJSLdwid3zg4BUGTXarfvggDdT6Y9G6ZdvyIOEF7S3hvQL4qHyB1CW5tPvmLfaEfeF
         mFZ+RFBKd6INcemNw9WtOIwfSXjDPFWNmA6dsE5Ja7iwHfvZ89CEl17sUmV6SMmgcQ0W
         DnJg==
X-Forwarded-Encrypted: i=1; AKwUvBybE+7+5fGjaPFoIuilxAT4/gQ7Gdo+70LJYFUAs0ApH2mrTJ3b6LlYCkvQggBxTOUWW1hNoYJhv3s=@vger.kernel.org
X-Gm-Message-State: AFuF++kTG4HQveHrUP1NN8yhGDxWQN1Xl6jZS8RIg08pglxOonwjuD5r
	xOW+ABKXjIiQpTTowHwuTxUSJw1QQQBYw+HgwAmTDbjhDP//fCY0MoSyTGTKrL2jALbp2NK0T3I
	CrUpf2jrxpOVKlN4vXK0jC0twJrDuvPE=
X-Gm-Gg: AYBFou0zrqnHRPh5jY1cq0Diy/mN5DwcQrmnPH2eRCJqncjk0A941Pc/0BUFjxe1J9M
	L/LuzhQiV/ILj+4P9a8mzDdneZrMafPKP3Aw2O2Ablm7fSKPDT16GVKab2DzL41hq4n7ViTJmq7
	PJx1J8DL45x24OnnSyyfyspq/fKpUZu25IWR6vYMCd61TJ3WQJ9jP/PCbeT4T1lc5ry50Cx+Qgb
	+v6j8rhvPLwLjTLaG/30bPdoU/wUtYTbBWIXrv15tlZvxpcRpMM5eEJvTDBN+74+SsPZxldmrtJ
	j3qSGFlmXDAz9Iu6aSE9PpUDOQHvw0/WA0XohM19h/xvMtviOhc0hWyMVPFQ5Zr4vicI9bH62rg
	8ED1YwsJozeQRFA==
X-Received: by 2002:a05:6808:1495:b0:4cb:f21c:a7a0 with SMTP id
 5614622812f47-4d72ac548c1mr18466811b6e.40.1790684108535; Tue, 29 Sep 2026
 05:15:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929115956.229610-1-chenyou910331@gmail.com>
In-Reply-To: <20260929115956.229610-1-chenyou910331@gmail.com>
From: Yizhou Tang <tangyeechou@gmail.com>
Date: Tue, 29 Sep 2026 20:14:56 +0800
X-Gm-Features: AclHuK9SbRpBRW1_xjNglr207-Mtecw2Yv_tNsNv8cn6AxnZeHmPVWx44cbj4qU
Message-ID: <CAOB9oOY2V68_qnv6DFyDJL2d=50zN_oQ6=6+Fs7=Ez+9TnuDmg@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] docs/zh_TW: remove duplicated maintainer contact information
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: corbet@lwn.net, alexs@kernel.org, dzm91@hust.edu.cn, wy@wyuan.org, 
	si.yanteng@linux.dev, srcres258@furdevs.cn, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Deng <theandy.deng@gmail.com>, 
	Bailu Lin <bailu.lin@vivo.com>, Bernard Zhao <bernard@vivo.com>, Bryan Wu <bryan.wu@analog.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Chucheng Luo <luochucheng@vivo.com>, 
	Dave Martin <Dave.Martin@arm.com>, Dave Young <hidave.darkstar@gmail.com>, 
	Dongsheng Song <dongshneg.song@gmail.com>, "Eric W . Biederman" <ebiederm@xmission.com>, 
	Eugene Teo <eugeneteo@kernel.sg>, Fu Wei <tekkamanninja@gmail.com>, Fu Wei <wefu@redhat.com>, 
	gao chao <gaochao49@huawei.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hailong Liu <liu.hailong6@zte.com.cn>, Harry Wei <harryxiyou@gmail.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Hu Haowen <2023002089@link.tyut.edu.cn>, 
	Junhua Huang <huang.junhua@zte.com.cn>, Kangkai Yin <e12051@motorola.com>, 
	Leigang Zang <zangleigang@hisilicon.com>, Li Yang <leoyang.li@nxp.com>, 
	Li Zefan <lizf@cn.fujitsu.com>, Maggie Chen <chenqi@beyondsoft.com>, 
	Nicolas Pitre <nico@fluxnic.net>, Punit Agrawal <punitagrawal@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	TripleX Chung <xxx.phy@gmail.com>, Wang Chen <wangchen@cn.fujitsu.com>, 
	Wang Cong <xiyou.wangcong@gmail.com>, Wang Wenhu <wenhu.wang@vivo.com>, 
	Wan Jiabing <wanjiabing@vivo.com>, wheelz <kernel.zeng@gmail.com>, 
	Will Deacon <will@kernel.org>, Wu XiangCheng <bobwxc@email.cn>, 
	Xiaochen Wang <wangxiaochen0@gmail.com>, Xudong Guan <xudong.guan@gmail.com>, 
	xu xin <xu.xin16@zte.com.cn>, yaxinsn <yaxinsn@163.com>, Yinglin Luan <synmyth@gmail.com>, 
	Zhang Le <r0bertz@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 8:00=E2=80=AFPM Chen-Yu Yeh <chenyou910331@gmail.co=
m> wrote:
>
> MAINTAINERS already records who to contact about the zh_TW
> translations, yet every zh_TW file repeats that information in a
> per-file contact block.  The duplication has a concrete cost: the
> listed zh_TW maintainer address appeared in 58 files and there have
> been three separate attempts to rewrite it across the tree.  In the
> MAINTAINERS discussion Jon Corbet's conclusion was that, rather than
> churning all of those addresses once more, the best thing is simply to
> remove them.
>
> There is a second reason.  The zh_TW tree was produced by converting
> zh_CN, and the credit blocks came across with the text: nearly every
> address removed here also appears in
> Documentation/translations/zh_CN/, several in more than a hundred
> files.  They credit the simplified-Chinese translation rather than
> zh_TW work, so keeping them would leave the wrong attribution in place.
>
> Removed:
>
>   - the :Translator: / :=E7=BF=BB=E8=AD=AF: / :=E6=A0=A1=E8=AD=AF: / :=E8=
=AD=AF=E8=80=85: credit blocks and the
>     =E8=AD=AF=E8=80=85:: literal blocks
>   - the "please contact the ... maintainer" prose that introduces them
>   - the =E8=8B=B1=E6=96=87=E7=89=88/=E4=B8=AD=E6=96=87=E7=89=88/=E7=B9=81=
=E9=AB=94=E4=B8=AD=E6=96=87=E7=89=88 =E7=B6=AD=E8=AD=B7=E8=80=85|=E7=BF=BB=
=E8=AD=AF=E8=80=85|=E6=A0=A1=E8=AD=AF=E8=80=85 lines, including
>     their continuation lines
>   - the maintainer metadata lines in the legacy headers (M:, zh_CN:,
>     zh_TW:, Maintainer:, Chinese maintainer:, Traditional Chinese
>     maintainer:)
>
> Left alone: :Original:, :=E4=BD=9C=E8=80=85: (the author of the English o=
riginal),
> :=E6=97=A5=E6=9C=9F:, :=E6=9B=B4=E6=96=B0:, the C: sync-commit references=
, copyright notices, and
> every address that is part of a document body, such as
> stable@vger.kernel.org and the examples in submitting-patches.
>
> Attribution for past work is preserved in the git history.

Hi Chen,

I have no objection to removing the duplicate contact information. I
noticed that some translations in these commits were changed to
traditional Chinese terminology, such as changing =E2=80=9C=E7=A1=AC=E4=BB=
=B6=E2=80=9D to =E2=80=9C=E7=A1=AC=E9=AB=94=E2=80=9D. I
suggest submitting these changes as separate commits to make them
easier for everyone to review.

Best regards,
Yi

>
> Changes in v2:
>  - Rebased onto docs-next now that the zh_TW process/ series has
>    landed.  v1 no longer applied: that series added a translator entry
>    to fifteen of the blocks 1/7 removes, so 1/7 now removes those
>    entries too (they are mine; the same reasoning applies).
>  - Each patch now has its own commit message instead of sharing one
>    paragraph (Weijie).  The messages also no longer claim that the
>    Chinese credit lines of the legacy headers are kept; they were
>    removed in v1 as well, as this cover letter said.
>  - 7/7: the disclaimer's warning and note said much the same thing;
>    merge them into a single note, as disclaimer-zh_CN.rst has (Weijie).
>    It points readers at the zh_TW maintainers and reviewers rather than
>    at "the file's translator", since this series removes the
>    translator fields.
>  - Copied everyone whose address the series removes, as Jon asked on
>    v1, using current addresses where MAINTAINERS or .mailmap has one.
>    (IRQ.txt spells Eric Biederman's address "ebiederman@"; his address
>    is ebiederm@xmission.com.)
>
> Not changed: IRQ.txt, io_ordering.txt and the other plain-text files
> still lose their contact lines here, so that this series stands on its
> own; as agreed in the zh_TW scope discussion [1], they are removed
> altogether by a separate series.  The "=E8=81=AF=E7=B9=AB=E8=AD=AF=E8=80=
=85" wording in
> dev-tools/testing-overview.rst is left as it is, as Weijie suggested.
>
> v1: https://lore.kernel.org/linux-doc/20260819145808.291567-1-chenyou9103=
31@gmail.com/
> [1] https://lore.kernel.org/linux-doc/CAKspUhJAbCWoxgh2eq8R5g_MiNK=3DoXgK=
PUWqGOpHh0w1-Fv74A@mail.gmail.com/
>
> Chen-Yu Yeh (7):
>   docs/zh_TW: process: remove maintainer contact information
>   docs/zh_TW: admin-guide: remove maintainer contact information
>   docs/zh_TW: arch: remove maintainer contact information
>   docs/zh_TW: dev-tools: remove maintainer contact information
>   docs/zh_TW: filesystems: remove maintainer contact information
>   docs/zh_TW: cpu-freq: remove maintainer contact information
>   docs/zh_TW: remove the last maintainer contact references
>
>  Documentation/translations/zh_TW/IRQ.txt       |  8 --------
>  .../translations/zh_TW/admin-guide/README.rst  |  5 -----
>  .../zh_TW/admin-guide/bootconfig.rst           |  2 --
>  .../zh_TW/admin-guide/bug-bisect.rst           |  5 -----
>  .../zh_TW/admin-guide/bug-hunting.rst          |  5 -----
>  .../zh_TW/admin-guide/clearing-warn-once.rst   |  2 --
>  .../zh_TW/admin-guide/cpu-load.rst             |  2 --
>  .../zh_TW/admin-guide/cputopology.rst          |  4 ----
>  .../translations/zh_TW/admin-guide/index.rst   |  2 --
>  .../translations/zh_TW/admin-guide/init.rst    |  5 -----
>  .../zh_TW/admin-guide/lockup-watchdogs.rst     |  1 -
>  .../zh_TW/admin-guide/mm/damon/index.rst       |  6 ------
>  .../zh_TW/admin-guide/mm/damon/lru_sort.rst    |  6 ------
>  .../zh_TW/admin-guide/mm/damon/reclaim.rst     |  6 ------
>  .../zh_TW/admin-guide/mm/damon/start.rst       |  6 ------
>  .../zh_TW/admin-guide/mm/damon/usage.rst       |  6 ------
>  .../zh_TW/admin-guide/mm/index.rst             |  5 -----
>  .../translations/zh_TW/admin-guide/mm/ksm.rst  |  5 -----
>  .../zh_TW/admin-guide/reporting-issues.rst     |  6 ------
>  .../admin-guide/reporting-regressions.rst      |  5 -----
>  .../zh_TW/admin-guide/security-bugs.rst        |  5 -----
>  .../translations/zh_TW/admin-guide/sysrq.rst   |  8 --------
>  .../zh_TW/admin-guide/tainted-kernels.rst      |  5 -----
>  .../translations/zh_TW/admin-guide/unicode.rst |  5 -----
>  .../translations/zh_TW/arch/arm/Booting        |  7 -------
>  .../zh_TW/arch/arm/kernel_user_helpers.txt     | 10 ----------
>  .../translations/zh_TW/arch/arm64/amu.rst      |  3 ---
>  .../translations/zh_TW/arch/arm64/booting.txt  |  8 --------
>  .../zh_TW/arch/arm64/elf_hwcaps.rst            |  3 ---
>  .../zh_TW/arch/arm64/hugetlbpage.rst           |  3 ---
>  .../translations/zh_TW/arch/arm64/index.rst    |  2 --
>  .../zh_TW/arch/arm64/legacy_instructions.txt   | 11 -----------
>  .../translations/zh_TW/arch/arm64/memory.txt   |  9 ---------
>  .../translations/zh_TW/arch/arm64/perf.rst     |  3 ---
>  .../zh_TW/arch/arm64/silicon-errata.txt        |  8 --------
>  .../zh_TW/arch/arm64/tagged-pointers.txt       |  9 ---------
>  .../zh_TW/arch/loongarch/booting.rst           |  4 ----
>  .../zh_TW/arch/loongarch/features.rst          |  1 -
>  .../zh_TW/arch/loongarch/index.rst             |  1 -
>  .../zh_TW/arch/loongarch/introduction.rst      |  1 -
>  .../zh_TW/arch/loongarch/irq-chip-model.rst    |  1 -
>  .../translations/zh_TW/arch/mips/booting.rst   |  4 ----
>  .../translations/zh_TW/arch/mips/features.rst  |  4 ----
>  .../translations/zh_TW/arch/mips/index.rst     |  4 ----
>  .../zh_TW/arch/mips/ingenic-tcu.rst            |  4 ----
>  .../translations/zh_TW/arch/openrisc/index.rst |  4 ----
>  .../zh_TW/arch/openrisc/openrisc_port.rst      |  4 ----
>  .../translations/zh_TW/arch/openrisc/todo.rst  |  4 ----
>  .../zh_TW/arch/parisc/debugging.rst            |  4 ----
>  .../translations/zh_TW/arch/parisc/index.rst   |  4 ----
>  .../zh_TW/arch/parisc/registers.rst            |  4 ----
>  .../translations/zh_TW/cpu-freq/core.rst       |  8 --------
>  .../zh_TW/cpu-freq/cpu-drivers.rst             |  8 --------
>  .../zh_TW/cpu-freq/cpufreq-stats.rst           |  8 --------
>  .../translations/zh_TW/cpu-freq/index.rst      |  4 ----
>  .../translations/zh_TW/dev-tools/gcov.rst      |  1 -
>  .../zh_TW/dev-tools/gdb-kernel-debugging.rst   |  1 -
>  .../translations/zh_TW/dev-tools/index.rst     |  1 -
>  .../translations/zh_TW/dev-tools/kasan.rst     |  1 -
>  .../translations/zh_TW/dev-tools/sparse.rst    |  5 -----
>  .../zh_TW/dev-tools/testing-overview.rst       |  1 -
>  .../translations/zh_TW/disclaimer-zh_TW.rst    | 12 ++++--------
>  .../translations/zh_TW/filesystems/debugfs.rst | 10 ----------
>  .../translations/zh_TW/filesystems/index.rst   |  2 --
>  .../translations/zh_TW/filesystems/sysfs.txt   | 10 ----------
>  .../zh_TW/filesystems/virtiofs.rst             |  8 --------
>  Documentation/translations/zh_TW/index.rst     |  2 +-
>  .../translations/zh_TW/io_ordering.txt         |  6 ------
>  .../translations/zh_TW/process/1.Intro.rst     | 10 ----------
>  .../translations/zh_TW/process/2.Process.rst   | 10 ----------
>  .../zh_TW/process/3.Early-stage.rst            |  9 ---------
>  .../translations/zh_TW/process/4.Coding.rst    |  9 ---------
>  .../translations/zh_TW/process/5.Posting.rst   | 10 ----------
>  .../zh_TW/process/6.Followthrough.rst          |  9 ---------
>  .../zh_TW/process/7.AdvancedTopics.rst         | 10 ----------
>  .../zh_TW/process/8.Conclusion.rst             |  9 ---------
>  .../process/code-of-conduct-interpretation.rst |  3 ---
>  .../zh_TW/process/code-of-conduct.rst          |  2 --
>  .../zh_TW/process/coding-style.rst             | 14 --------------
>  .../zh_TW/process/development-process.rst      |  2 --
>  .../zh_TW/process/email-clients.rst            | 12 ------------
>  .../process/embargoed-hardware-issues.rst      |  3 ---
>  .../translations/zh_TW/process/howto.rst       | 18 ------------------
>  .../translations/zh_TW/process/index.rst       |  3 ---
>  .../zh_TW/process/kernel-driver-statement.rst  |  2 --
>  .../process/kernel-enforcement-statement.rst   |  2 --
>  .../zh_TW/process/license-rules.rst            |  3 ---
>  .../zh_TW/process/magic-number.rst             |  8 --------
>  .../zh_TW/process/management-style.rst         |  2 --
>  .../zh_TW/process/programming-language.rst     |  3 ---
>  .../zh_TW/process/stable-api-nonsense.rst      | 10 ----------
>  .../zh_TW/process/stable-kernel-rules.rst      | 12 ------------
>  .../zh_TW/process/submit-checklist.rst         |  4 ----
>  .../zh_TW/process/submitting-patches.rst       | 12 ------------
>  .../process/volatile-considered-harmful.rst    | 12 ------------
>  95 files changed, 5 insertions(+), 525 deletions(-)
>
> Range-diff against v1:
> 1:  b30ed7154694 ! 1:  57561af2e7e1 docs/zh_TW: process: remove maintaine=
r contact information
>     @@ Metadata
>       ## Commit message ##
>          docs/zh_TW: process: remove maintainer contact information
>
>     -    The zh_TW translations duplicate, in every file, contact informa=
tion
>     -    that MAINTAINERS already records.  Those addresses have been chu=
rned
>     -    repeatedly: the listed zh_TW maintainer address alone appears in=
 58
>     -    files and there have now been three attempts to update it across=
 the
>     -    tree.  Jon Corbet's conclusion in the MAINTAINERS discussion was=
 that,
>     -    rather than rewriting all of them again, the best thing is simpl=
y to
>     -    remove them.
>     -
>     -    Most of the names in the credit blocks belong to the zh_CN trans=
lators:
>     -    the zh_TW tree was produced by converting zh_CN, so the credits =
came
>     -    across with the text.  Of the addresses removed here, nearly all=
 also
>     -    appear in Documentation/translations/zh_CN/, several in more tha=
n a
>     -    hundred files.  They credit the simplified-Chinese translation, =
not
>     -    zh_TW work.
>     -
>     -    Remove the :Translator:/:=E7=BF=BB=E8=AD=AF:/:=E6=A0=A1=E8=AD=AF=
:/:=E8=AD=AF=E8=80=85: credit blocks and the
>     -    "please contact the ... maintainer" prose that introduces them, =
and
>     -    drop the maintainer metadata lines (M:, zh_CN:, zh_TW:, Maintain=
er:,
>     -    Chinese maintainer:, Traditional Chinese maintainer:) from the l=
egacy
>     -    headers.  The translated bodies of the legacy files, including t=
heir
>     -    own credit lines, are left untouched.
>     -
>     -    Attribution for past work is preserved in the git history.
>     -
>     +    The zh_TW translations repeat, file by file, contact information=
 that
>     +    MAINTAINERS already records.  Those addresses keep going stale: =
the
>     +    listed zh_TW maintainer address alone appeared in 58 files, and =
there
>     +    have been three attempts to update it across the tree.  In the
>     +    MAINTAINERS discussion Jon Corbet concluded that, rather than re=
writing
>     +    them all again, they should simply be removed.
>     +
>     +    Most of the names also credit the wrong work.  zh_TW was produce=
d by
>     +    converting zh_CN and the credit blocks came across with the text=
, so
>     +    they name the simplified-Chinese translators; nearly every addre=
ss
>     +    removed in this series also appears under
>     +    Documentation/translations/zh_CN/.
>     +
>     +    Start with process/, the largest area.  Remove the :Translator:,=
 :=E8=AD=AF=E8=80=85:
>     +    and :=E6=A0=A1=E8=AD=AF: fields, the =E8=AD=AF=E8=80=85:: litera=
l blocks in howto.rst and
>     +    stable-api-nonsense.rst, and the "contact the maintainer" paragr=
aphs
>     +    that introduce the credits in magic-number.rst, stable-kernel-ru=
les.rst
>     +    and volatile-considered-harmful.rst.  This includes the entries =
that the
>     +    recent process/ update added to fifteen of these blocks.  Attrib=
ution
>     +    for all of it stays in the git history.
>     +
>     +    Assisted-by: Claude:claude-opus-5-5
>          Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
>
>       ## Documentation/translations/zh_TW/process/1.Intro.rst ##
>     @@ Documentation/translations/zh_TW/process/1.Intro.rst
>      -
>      - =E5=90=B3=E6=83=B3=E6=88=90 Wu XiangCheng <bobwxc@email.cn>
>      - =E8=83=A1=E7=9A=93=E6=96=87 Hu Haowen <2023002089@link.tyut.edu.cn=
>
>     +- =E8=91=89=E5=AE=B8=E4=BD=91 Chen-Yu Yeh <chenyou910331@gmail.com>
>      -
>       .. _tw_development_process_intro:
>
>     @@ Documentation/translations/zh_TW/process/2.Process.rst
>      -
>      - =E5=90=B3=E6=83=B3=E6=88=90 Wu XiangCheng <bobwxc@email.cn>
>      - =E8=83=A1=E7=9A=93=E6=96=87 Hu Haowen <2023002089@link.tyut.edu.cn=
>
>     +- =E8=91=89=E5=AE=B8=E4=BD=91 Chen-Yu Yeh <chenyou910331@gmail.com>
>      -
>       .. _tw_development_process:
>
>     @@ Documentation/translations/zh_TW/process/5.Posting.rst
>      -
>      - =E5=90=B3=E6=83=B3=E6=88=90 Wu XiangCheng <bobwxc@email.cn>
>      - =E8=83=A1=E7=9A=93=E6=96=87 Hu Haowen <2023002089@link.tyut.edu.cn=
>
>     +- =E8=91=89=E5=AE=B8=E4=BD=91 Chen-Yu Yeh <chenyou910331@gmail.com>
>      -
>       .. _tw_development_posting:
>
>     - =E7=99=BC=E4=BD=88=E8=A3=9C=E4=B8=81
>     + =E7=99=BC=E5=B8=83=E8=A3=9C=E4=B8=81
>
>       ## Documentation/translations/zh_TW/process/6.Followthrough.rst ##
>      @@
>     @@ Documentation/translations/zh_TW/process/7.AdvancedTopics.rst
>      -
>      - =E5=90=B3=E6=83=B3=E6=88=90 Wu XiangCheng <bobwxc@email.cn>
>      - =E8=83=A1=E7=9A=93=E6=96=87 Hu Haowen <2023002089@link.tyut.edu.cn=
>
>     +- =E8=91=89=E5=AE=B8=E4=BD=91 Chen-Yu Yeh <chenyou910331@gmail.com>
>      -
>       .. _tw_development_advancedtopics:
>
>     - =E9=AB=98=E7=B4=9A=E4=B8=BB=E9=A1=8C
>     + =E9=80=B2=E9=9A=8E=E4=B8=BB=E9=A1=8C
>
>       ## Documentation/translations/zh_TW/process/8.Conclusion.rst ##
>      @@
>     @@ Documentation/translations/zh_TW/process/8.Conclusion.rst
>      -
>      - =E5=90=B3=E6=83=B3=E6=88=90 Wu XiangCheng <bobwxc@email.cn>
>      - =E8=83=A1=E7=9A=93=E6=96=87 Hu Haowen <2023002089@link.tyut.edu.cn=
>
>     +- =E8=91=89=E5=AE=B8=E4=BD=91 Chen-Yu Yeh <chenyou910331@gmail.com>
>
>       .. _tw_development_conclusion:
>
>     @@ Documentation/translations/zh_TW/process/code-of-conduct-interpret=
ation.rst
>       :Original: :ref:`Documentation/process/code-of-conduct-interpretati=
on.rst <code_of_conduct_interpretation>`
>      -:Translator: Alex Shi <alex.shi@linux.alibaba.com>
>      -             Hu Haowen <2023002089@link.tyut.edu.cn>
>     +-             Chen-Yu Yeh <chenyou910331@gmail.com>
>
>       .. _tw_code_of_conduct_interpretation:
>
>     @@ Documentation/translations/zh_TW/process/coding-style.rst
>      - - Li Zefan <lizf@cn.fujitsu.com>
>      - - Wang Chen <wangchen@cn.fujitsu.com>
>      - - Hu Haowen <2023002089@link.tyut.edu.cn>
>     +- - =E8=91=89=E5=AE=B8=E4=BD=91 Chen-Yu Yeh <chenyou910331@gmail.com=
>
>      -
>     - Linux =E5=85=A7=E6=A0=B8=E4=BB=A3=E7=A2=BC=E9=A2=A8=E6=A0=BC
>     - =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>     + Linux =E6=A0=B8=E5=BF=83=E7=A8=8B=E5=BC=8F=E7=A2=BC=E9=A2=A8=E6=A0=
=BC
>     + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>
>       ## Documentation/translations/zh_TW/process/development-process.rst=
 ##
>     @@ Documentation/translations/zh_TW/process/email-clients.rst
>      - - Xiaochen Wang <wangxiaochen0@gmail.com>
>      - - yaxinsn <yaxinsn@163.com>
>      - - Hu Haowen <2023002089@link.tyut.edu.cn>
>     +- - Chen-Yu Yeh <chenyou910331@gmail.com>
>      -
>     - Linux=E9=83=B5=E4=BB=B6=E5=AE=A2=E6=88=B6=E7=AB=AF=E9=85=8D=E7=BD=
=AE=E4=BF=A1=E6=81=AF
>     + Linux=E9=83=B5=E4=BB=B6=E5=AE=A2=E6=88=B6=E7=AB=AF=E8=A8=AD=E5=AE=
=9A=E8=B3=87=E8=A8=8A
>       =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>
>
>     @@ Documentation/translations/zh_TW/process/embargoed-hardware-issues=
.rst
>       :Original: :ref:`Documentation/process/embargoed-hardware-issues.rs=
t <embargoed_hardware_issues>`
>      -:Translator: Alex Shi <alex.shi@linux.alibaba.com>
>      -             Hu Haowen <2023002089@link.tyut.edu.cn>
>     +-             Chen-Yu Yeh <chenyou910331@gmail.com>
>
>     - =E8=A2=AB=E9=99=90=E5=88=B6=E7=9A=84=E7=A1=AC=E4=BB=B6=E5=95=8F=E9=
=A1=8C
>     + =E8=A2=AB=E9=99=90=E5=88=B6=E7=9A=84=E7=A1=AC=E9=AB=94=E5=95=8F=E9=
=A1=8C
>       =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>       ## Documentation/translations/zh_TW/process/howto.rst ##
>     @@ Documentation/translations/zh_TW/process/howto.rst
>      -                   =E9=99=B3=E7=90=A6  Maggie Chen <chenqi@beyondso=
ft.com>
>      -                   =E7=8E=8B=E8=81=B0  Wang Cong <xiyou.wangcong@gm=
ail.com>
>      -                   =E8=83=A1=E7=9A=93=E6=96=87 Hu Haowen <202300208=
9@link.tyut.edu.cn>
>     +-                   =E8=91=89=E5=AE=B8=E4=BD=91 Chen-Yu Yeh <chenyou=
910331@gmail.com>
>      -
>     - =E5=A6=82=E4=BD=95=E5=8F=83=E8=88=87Linux=E5=85=A7=E6=A0=B8=E9=96=
=8B=E7=99=BC
>     + =E5=A6=82=E4=BD=95=E5=8F=83=E8=88=87Linux=E6=A0=B8=E5=BF=83=E9=96=
=8B=E7=99=BC
>       =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>      @@ Documentation/translations/zh_TW/process/howto.rst: Kees Cook, An=
drew Morton, Andi Kleen, Vadim Lobanov, Jesper Juhl, Adrian
>       Bunk, Keri Harris, Frans Pop, David A. Wheeler, Junio Hamano, Micha=
el
>     - Kerrisk=E5=92=8CAlex Shepard=E7=9A=84=E8=A9=95=E5=AF=A9=E3=80=81=E5=
=BB=BA=E8=AD=B0=E5=92=8C=E8=B2=A2=E7=8D=BB=E3=80=82=E6=B2=92=E6=9C=89=E4=BB=
=96=E5=80=91=E7=9A=84=E5=B9=AB=E5=8A=A9=EF=BC=8C=E9=80=99=E7=AF=87=E6=96=87=
=E6=AA=94=E6=98=AF=E4=B8=8D=E5=8F=AF
>     + Kerrisk=E5=92=8CAlex Shepard=E7=9A=84=E8=A9=95=E5=AF=A9=E3=80=81=E5=
=BB=BA=E8=AD=B0=E5=92=8C=E8=B2=A2=E7=8D=BB=E3=80=82=E6=B2=92=E6=9C=89=E4=BB=
=96=E5=80=91=E7=9A=84=E5=B9=AB=E5=8A=A9=EF=BC=8C=E9=80=99=E7=AF=87=E6=96=87=
=E4=BB=B6=E6=98=AF=E4=B8=8D=E5=8F=AF
>       =E8=83=BD=E5=AE=8C=E6=88=90=E7=9A=84=E3=80=82
>      -
>      -
>     @@ Documentation/translations/zh_TW/process/index.rst
>       :Original: :ref:`Documentation/process/index.rst <process_index>`
>      -:Translator: Alex Shi <alex.shi@linux.alibaba.com>
>      -             Hu Haowen <2023002089@link.tyut.edu.cn>
>     +-             Chen-Yu Yeh <chenyou910331@gmail.com>
>
>       .. _tw_process_index:
>
>     @@ Documentation/translations/zh_TW/process/license-rules.rst
>       :Original: :ref:`Documentation/process/license-rules.rst <kernel_li=
censing>`
>      -:Translator: Alex Shi <alex.shi@linux.alibaba.com>
>      -             Hu Haowen <2023002089@link.tyut.edu.cn>
>     +-             Chen-Yu Yeh <chenyou910331@gmail.com>
>
>       .. _tw_kernel_licensing:
>
>     @@ Documentation/translations/zh_TW/process/programming-language.rst
>       :Original: :ref:`Documentation/process/programming-language.rst <pr=
ogramming_language>`
>      -:Translator: Alex Shi <alex.shi@linux.alibaba.com>
>      -             Hu Haowen <2023002089@link.tyut.edu.cn>
>     +-             Chen-Yu Yeh <chenyou910331@gmail.com>
>
>       .. _tw_programming_language:
>
>     @@ Documentation/translations/zh_TW/process/stable-api-nonsense.rst
>      -        =E4=B8=AD=E6=96=87=E7=89=88=E6=A0=A1=E8=AD=AF=E8=80=85=EF=
=BC=9A =E6=9D=8E=E9=99=BD  Li Yang <leoyang.li@nxp.com>
>      -                      =E8=83=A1=E7=9A=93=E6=96=87 Hu Haowen <202300=
2089@link.tyut.edu.cn>
>      -
>     - Linux =E5=85=A7=E6=A0=B8=E9=A9=85=E5=8B=95=E6=8E=A5=E5=8F=A3
>     + Linux =E5=85=A7=E6=A0=B8=E9=A9=85=E5=8B=95=E4=BB=8B=E9=9D=A2
>       =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>      @@ Documentation/translations/zh_TW/process/stable-api-nonsense.rst:=
 Linux=E8=83=BD=E6=88=90=E7=88=B2=E5=BC=B7=E5=A3=AF=EF=BC=8C=E7=A9=A9=E5=AE=
=9A=EF=BC=8C=E6=88=90=E7=86=9F=E7=9A=84=E6=93=8D=E4=BD=9C=E7=B3=BB=E7=B5=B1=
=EF=BC=8C=E9=80=99=E4=B9=9F=E6=98=AF=E4=BD=A0=E6=9C=80=E9=96=8B=E5=A7=8B=E9=
=81=B8
>     @@ Documentation/translations/zh_TW/process/stable-kernel-rules.rst
>
>       :Original: :ref:`Documentation/process/stable-kernel-rules.rst <sta=
ble_kernel_rules>`
>
>     --=E5=A6=82=E6=9E=9C=E6=83=B3=E8=A9=95=E8=AB=96=E6=88=96=E6=9B=B4=E6=
=96=B0=E6=9C=AC=E6=96=87=E7=9A=84=E5=85=A7=E5=AE=B9=EF=BC=8C=E8=AB=8B=E7=9B=
=B4=E6=8E=A5=E8=81=AF=E7=B9=AB=E5=8E=9F=E6=96=87=E6=AA=94=E7=9A=84=E7=B6=AD=
=E8=AD=B7=E8=80=85=E3=80=82=E5=A6=82=E6=9E=9C=E4=BD=A0=E4=BD=BF=E7=94=A8=E8=
=8B=B1=E6=96=87
>     +-=E5=A6=82=E6=9E=9C=E6=83=B3=E8=A9=95=E8=AB=96=E6=88=96=E6=9B=B4=E6=
=96=B0=E6=9C=AC=E6=96=87=E7=9A=84=E5=85=A7=E5=AE=B9=EF=BC=8C=E8=AB=8B=E7=9B=
=B4=E6=8E=A5=E8=81=AF=E7=B9=AB=E5=8E=9F=E6=96=87=E4=BB=B6=E7=9A=84=E7=B6=AD=
=E8=AD=B7=E8=80=85=E3=80=82=E5=A6=82=E6=9E=9C=E4=BD=A0=E4=BD=BF=E7=94=A8=E8=
=8B=B1=E6=96=87
>      -=E4=BA=A4=E6=B5=81=E6=9C=89=E5=9B=B0=E9=9B=A3=E7=9A=84=E8=A9=B1=EF=
=BC=8C=E4=B9=9F=E5=8F=AF=E4=BB=A5=E5=90=91=E4=B8=AD=E6=96=87=E7=89=88=E7=B6=
=AD=E8=AD=B7=E8=80=85=E6=B1=82=E5=8A=A9=E3=80=82=E5=A6=82=E6=9E=9C=E6=9C=AC=
=E7=BF=BB=E8=AD=AF=E6=9B=B4=E6=96=B0=E4=B8=8D=E5=8F=8A=E6=99=82=E6=88=96=E8=
=80=85=E7=BF=BB
>      -=E8=AD=AF=E5=AD=98=E5=9C=A8=E5=95=8F=E9=A1=8C=EF=BC=8C=E8=AB=8B=E8=
=81=AF=E7=B9=AB=E4=B8=AD=E6=96=87=E7=89=88=E7=B6=AD=E8=AD=B7=E8=80=85::
>      -
>     @@ Documentation/translations/zh_TW/process/stable-kernel-rules.rst
>      -            - =E6=9D=8E=E9=99=BD  Li Yang <leoyang.li@nxp.com>
>      -            - Kangkai Yin <e12051@motorola.com>
>      -            - =E8=83=A1=E7=9A=93=E6=96=87 Hu Haowen <2023002089@lin=
k.tyut.edu.cn>
>     +-            - =E8=91=89=E5=AE=B8=E4=BD=91 Chen-Yu Yeh <chenyou91033=
1@gmail.com>
>      -
>     - =E6=89=80=E6=9C=89=E4=BD=A0=E6=83=B3=E7=9F=A5=E9=81=93=E7=9A=84=E4=
=BA=8B=E6=83=85 - =E9=97=9C=E6=96=BClinux=E7=A9=A9=E5=AE=9A=E7=89=88=E7=99=
=BC=E4=BD=88
>     - =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>     + =E6=89=80=E6=9C=89=E4=BD=A0=E6=83=B3=E7=9F=A5=E9=81=93=E7=9A=84=E4=
=BA=8B=E6=83=85 - =E9=97=9C=E6=96=BCLinux -stable =E7=89=88=E6=9C=AC=E7=99=
=BC=E5=B8=83
>     + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>
>       ## Documentation/translations/zh_TW/process/submit-checklist.rst ##
>     @@ Documentation/translations/zh_TW/process/submitting-patches.rst
>      - - =E6=9D=8E=E9=99=BD Li Yang <leoyang.li@nxp.com>
>      - - =E7=8E=8B=E8=81=B0 Wang Cong <xiyou.wangcong@gmail.com>
>      - - =E8=83=A1=E7=9A=93=E6=96=87 Hu Haowen <2023002089@link.tyut.edu.=
cn>
>     +- - =E8=91=89=E5=AE=B8=E4=BD=91 Chen-Yu Yeh <chenyou910331@gmail.com=
>
>      -
>      -
>     - =E6=8F=90=E4=BA=A4=E8=A3=9C=E4=B8=81=EF=BC=9A=E5=A6=82=E4=BD=95=E8=
=AE=93=E4=BD=A0=E7=9A=84=E6=94=B9=E5=8B=95=E9=80=B2=E5=85=A5=E5=85=A7=E6=A0=
=B8
>     + =E6=8F=90=E4=BA=A4=E8=A3=9C=E4=B8=81=EF=BC=9A=E5=A6=82=E4=BD=95=E8=
=AE=93=E4=BD=A0=E7=9A=84=E6=94=B9=E5=8B=95=E9=80=B2=E5=85=A5=E6=A0=B8=E5=BF=
=83
>       =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>
> 2:  63a10f491ef4 ! 2:  45f9aeb5676b docs/zh_TW: admin-guide: remove maint=
ainer contact information
>     @@ Metadata
>       ## Commit message ##
>          docs/zh_TW: admin-guide: remove maintainer contact information
>
>     -    The zh_TW translations duplicate, in every file, contact informa=
tion
>     -    that MAINTAINERS already records.  Those addresses have been chu=
rned
>     -    repeatedly: the listed zh_TW maintainer address alone appears in=
 58
>     -    files and there have now been three attempts to update it across=
 the
>     -    tree.  Jon Corbet's conclusion in the MAINTAINERS discussion was=
 that,
>     -    rather than rewriting all of them again, the best thing is simpl=
y to
>     -    remove them.
>     -
>     -    Most of the names in the credit blocks belong to the zh_CN trans=
lators:
>     -    the zh_TW tree was produced by converting zh_CN, so the credits =
came
>     -    across with the text.  Of the addresses removed here, nearly all=
 also
>     -    appear in Documentation/translations/zh_CN/, several in more tha=
n a
>     -    hundred files.  They credit the simplified-Chinese translation, =
not
>     -    zh_TW work.
>     -
>     -    Remove the :Translator:/:=E7=BF=BB=E8=AD=AF:/:=E6=A0=A1=E8=AD=AF=
:/:=E8=AD=AF=E8=80=85: credit blocks and the
>     -    "please contact the ... maintainer" prose that introduces them, =
and
>     -    drop the maintainer metadata lines (M:, zh_CN:, zh_TW:, Maintain=
er:,
>     -    Chinese maintainer:, Traditional Chinese maintainer:) from the l=
egacy
>     -    headers.  The translated bodies of the legacy files, including t=
heir
>     -    own credit lines, are left untouched.
>     -
>     -    Attribution for past work is preserved in the git history.
>     +    Remove the :=E7=BF=BB=E8=AD=AF:, :=E8=AD=AF=E8=80=85:, :=E6=A0=
=A1=E8=AD=AF: and :Translator: fields from the
>     +    admin-guide/ translations.  MAINTAINERS records who looks after =
zh_TW,
>     +    and the people named in these fields are the zh_CN translators w=
hose
>     +    work this tree was converted from, not maintainers of the zh_TW =
text.
>
>     +    Assisted-by: Claude:claude-opus-5-5
>          Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
>
>       ## Documentation/translations/zh_TW/admin-guide/README.rst ##
> 3:  754d5c54732b ! 3:  1211b349d82a docs/zh_TW: arch: remove maintainer c=
ontact information
>     @@ Metadata
>       ## Commit message ##
>          docs/zh_TW: arch: remove maintainer contact information
>
>     -    The zh_TW translations duplicate, in every file, contact informa=
tion
>     -    that MAINTAINERS already records.  Those addresses have been chu=
rned
>     -    repeatedly: the listed zh_TW maintainer address alone appears in=
 58
>     -    files and there have now been three attempts to update it across=
 the
>     -    tree.  Jon Corbet's conclusion in the MAINTAINERS discussion was=
 that,
>     -    rather than rewriting all of them again, the best thing is simpl=
y to
>     -    remove them.
>     -
>     -    Most of the names in the credit blocks belong to the zh_CN trans=
lators:
>     -    the zh_TW tree was produced by converting zh_CN, so the credits =
came
>     -    across with the text.  Of the addresses removed here, nearly all=
 also
>     -    appear in Documentation/translations/zh_CN/, several in more tha=
n a
>     -    hundred files.  They credit the simplified-Chinese translation, =
not
>     -    zh_TW work.
>     -
>     -    Remove the :Translator:/:=E7=BF=BB=E8=AD=AF:/:=E6=A0=A1=E8=AD=AF=
:/:=E8=AD=AF=E8=80=85: credit blocks and the
>     -    "please contact the ... maintainer" prose that introduces them, =
and
>     -    drop the maintainer metadata lines (M:, zh_CN:, zh_TW:, Maintain=
er:,
>     -    Chinese maintainer:, Traditional Chinese maintainer:) from the l=
egacy
>     -    headers.  The translated bodies of the legacy files, including t=
heir
>     -    own credit lines, are left untouched.
>     -
>     -    Attribution for past work is preserved in the git history.
>     -
>     +    Remove the contact and credit information from the arch/ transla=
tions.
>     +    MAINTAINERS records who looks after zh_TW, and nearly all of the=
 names
>     +    here are those of the zh_CN translators whose work this tree was
>     +    converted from.
>     +
>     +    arch/ has the most varied shapes.  The reStructuredText files ca=
rry
>     +    :=E7=BF=BB=E8=AD=AF: or :Translator: fields, or in four arm64 fi=
les a bare
>     +    "Translator:" line without the leading colon.  The plain-text ar=
m and
>     +    arm64 files carry a legacy header: from it, drop the M:, zh_CN:,
>     +    zh_TW:, Maintainer:, Chinese maintainer: and Traditional Chinese
>     +    maintainer: lines, including the English maintainers they list, =
and
>     +    the Chinese lines that repeat them.  The C: lines and the Chines=
e notes
>     +    recording the commit each translation was made from are kept, as=
 is
>     +    the rest of the header.
>     +
>     +    Assisted-by: Claude:claude-opus-5-5
>          Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
>
>       ## Documentation/translations/zh_TW/arch/arm/Booting ##
> 4:  42d9524f941d ! 4:  394a9d630046 docs/zh_TW: dev-tools: remove maintai=
ner contact information
>     @@ Metadata
>       ## Commit message ##
>          docs/zh_TW: dev-tools: remove maintainer contact information
>
>     -    The zh_TW translations duplicate, in every file, contact informa=
tion
>     -    that MAINTAINERS already records.  Those addresses have been chu=
rned
>     -    repeatedly: the listed zh_TW maintainer address alone appears in=
 58
>     -    files and there have now been three attempts to update it across=
 the
>     -    tree.  Jon Corbet's conclusion in the MAINTAINERS discussion was=
 that,
>     -    rather than rewriting all of them again, the best thing is simpl=
y to
>     -    remove them.
>     -
>     -    Most of the names in the credit blocks belong to the zh_CN trans=
lators:
>     -    the zh_TW tree was produced by converting zh_CN, so the credits =
came
>     -    across with the text.  Of the addresses removed here, nearly all=
 also
>     -    appear in Documentation/translations/zh_CN/, several in more tha=
n a
>     -    hundred files.  They credit the simplified-Chinese translation, =
not
>     -    zh_TW work.
>     -
>     -    Remove the :Translator:/:=E7=BF=BB=E8=AD=AF:/:=E6=A0=A1=E8=AD=AF=
:/:=E8=AD=AF=E8=80=85: credit blocks and the
>     -    "please contact the ... maintainer" prose that introduces them, =
and
>     -    drop the maintainer metadata lines (M:, zh_CN:, zh_TW:, Maintain=
er:,
>     -    Chinese maintainer:, Traditional Chinese maintainer:) from the l=
egacy
>     -    headers.  The translated bodies of the legacy files, including t=
heir
>     -    own credit lines, are left untouched.
>     -
>     -    Attribution for past work is preserved in the git history.
>     +    Remove the :Translator: lines from the dev-tools/ translations, =
and the
>     +    Traditional Chinese maintainer lines from the plain-text header =
of
>     +    sparse.rst; the rest of that header is kept.  MAINTAINERS record=
s who
>     +    looks after zh_TW, so the per-file copies only go stale.
>
>     +    Assisted-by: Claude:claude-opus-5-5
>          Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
>
>       ## Documentation/translations/zh_TW/dev-tools/gcov.rst ##
> 5:  c3d27ddf03ac ! 5:  c6a621e970c4 docs/zh_TW: filesystems: remove maint=
ainer contact information
>     @@ Metadata
>       ## Commit message ##
>          docs/zh_TW: filesystems: remove maintainer contact information
>
>     -    The zh_TW translations duplicate, in every file, contact informa=
tion
>     -    that MAINTAINERS already records.  Those addresses have been chu=
rned
>     -    repeatedly: the listed zh_TW maintainer address alone appears in=
 58
>     -    files and there have now been three attempts to update it across=
 the
>     -    tree.  Jon Corbet's conclusion in the MAINTAINERS discussion was=
 that,
>     -    rather than rewriting all of them again, the best thing is simpl=
y to
>     -    remove them.
>     -
>     -    Most of the names in the credit blocks belong to the zh_CN trans=
lators:
>     -    the zh_TW tree was produced by converting zh_CN, so the credits =
came
>     -    across with the text.  Of the addresses removed here, nearly all=
 also
>     -    appear in Documentation/translations/zh_CN/, several in more tha=
n a
>     -    hundred files.  They credit the simplified-Chinese translation, =
not
>     -    zh_TW work.
>     -
>     -    Remove the :Translator:/:=E7=BF=BB=E8=AD=AF:/:=E6=A0=A1=E8=AD=AF=
:/:=E8=AD=AF=E8=80=85: credit blocks and the
>     -    "please contact the ... maintainer" prose that introduces them, =
and
>     -    drop the maintainer metadata lines (M:, zh_CN:, zh_TW:, Maintain=
er:,
>     -    Chinese maintainer:, Traditional Chinese maintainer:) from the l=
egacy
>     -    headers.  The translated bodies of the legacy files, including t=
heir
>     -    own credit lines, are left untouched.
>     -
>     -    Attribution for past work is preserved in the git history.
>     +    Remove the credit information from the filesystems/ translations=
: the
>     +    :Translator: field in index.rst, the =E8=AD=AF=E8=80=85 literal =
blocks in debugfs.rst
>     +    and virtiofs.rst, and the maintainer and translator lines in the
>     +    plain-text header of sysfs.txt, whose remaining header is kept.
>     +    MAINTAINERS records who looks after zh_TW, and the names here cr=
edit
>     +    the zh_CN translations this tree was converted from.
>
>     +    Assisted-by: Claude:claude-opus-5-5
>          Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
>
>       ## Documentation/translations/zh_TW/filesystems/debugfs.rst ##
> 6:  73210c2b2665 ! 6:  2270bf4ca6b7 docs/zh_TW: cpu-freq: remove maintain=
er contact information
>     @@ Metadata
>       ## Commit message ##
>          docs/zh_TW: cpu-freq: remove maintainer contact information
>
>     -    The zh_TW translations duplicate, in every file, contact informa=
tion
>     -    that MAINTAINERS already records.  Those addresses have been chu=
rned
>     -    repeatedly: the listed zh_TW maintainer address alone appears in=
 58
>     -    files and there have now been three attempts to update it across=
 the
>     -    tree.  Jon Corbet's conclusion in the MAINTAINERS discussion was=
 that,
>     -    rather than rewriting all of them again, the best thing is simpl=
y to
>     -    remove them.
>     -
>     -    Most of the names in the credit blocks belong to the zh_CN trans=
lators:
>     -    the zh_TW tree was produced by converting zh_CN, so the credits =
came
>     -    across with the text.  Of the addresses removed here, nearly all=
 also
>     -    appear in Documentation/translations/zh_CN/, several in more tha=
n a
>     -    hundred files.  They credit the simplified-Chinese translation, =
not
>     -    zh_TW work.
>     -
>     -    Remove the :Translator:/:=E7=BF=BB=E8=AD=AF:/:=E6=A0=A1=E8=AD=AF=
:/:=E8=AD=AF=E8=80=85: credit blocks and the
>     -    "please contact the ... maintainer" prose that introduces them, =
and
>     -    drop the maintainer metadata lines (M:, zh_CN:, zh_TW:, Maintain=
er:,
>     -    Chinese maintainer:, Traditional Chinese maintainer:) from the l=
egacy
>     -    headers.  The translated bodies of the legacy files, including t=
heir
>     -    own credit lines, are left untouched.
>     -
>     -    Attribution for past work is preserved in the git history.
>     +    Remove the :=E7=BF=BB=E8=AD=AF: and :=E6=A0=A1=E8=AD=AF: blocks =
from the cpu-freq/ translations.
>     +    They name the translators and reviewers of the zh_CN documents t=
hese
>     +    files were converted from; MAINTAINERS records who looks after z=
h_TW.
>
>     +    Assisted-by: Claude:claude-opus-5-5
>          Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
>
>       ## Documentation/translations/zh_TW/cpu-freq/core.rst ##
> 7:  f9936743dff7 ! 7:  798f87603270 docs/zh_TW: remove the last maintaine=
r contact references
>     @@ Metadata
>       ## Commit message ##
>          docs/zh_TW: remove the last maintainer contact references
>
>     -    disclaimer-zh_TW.rst is included by every zh_TW document and tol=
d
>     -    readers to mail the listed maintainer directly; index.rst asked
>     -    would-be contributors to send patches to the same address.  Poin=
t both
>     -    at MAINTAINERS instead, so the contact information lives in one =
place,
>     -    and drop the remaining contact blocks in the top-level files.
>     +    disclaimer-zh_TW.rst is included by every zh_TW document.  It ca=
rried a
>     +    warning telling readers to send changes to "the maintainer (cont=
act
>     +    details below)" and a note giving the previous zh_TW maintainer'=
s name
>     +    and address, while index.rst asked contributors to send patches =
to that
>     +    same address.
>
>     -    This mirrors disclaimer-zh_CN.rst, which names no address and re=
fers to
>     -    the Chinese documentation maintainers and reviewers instead.
>     +    Replace the warning and the note, which said much the same thing=
, with
>     +    a single note as disclaimer-zh_CN.rst has, pointing readers at t=
he zh_TW
>     +    maintainers and reviewers in MAINTAINERS, and point index.rst th=
ere as
>     +    well.  Also drop the maintainer lines from the legacy headers of
>     +    IRQ.txt and io_ordering.txt.
>
>     +    Suggested-by: Weijie Yuan <wy@wyuan.org>
>     +    Assisted-by: Claude:claude-opus-5-5
>          Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
>
>       ## Documentation/translations/zh_TW/IRQ.txt ##
>     @@ Documentation/translations/zh_TW/IRQ.txt: Documentation/core-api/i=
rq/index.rst
>
>       ## Documentation/translations/zh_TW/disclaimer-zh_TW.rst ##
>      @@
>     - .. warning::
>     -      =E6=AD=A4=E6=96=87=E4=BB=B6=E7=9A=84=E7=9B=AE=E7=9A=84=E6=98=
=AF=E7=88=B2=E8=AE=93=E4=B8=AD=E6=96=87=E8=AE=80=E8=80=85=E6=9B=B4=E5=AE=B9=
=E6=98=93=E9=96=B1=E8=AE=80=E5=92=8C=E7=90=86=E8=A7=A3=EF=BC=8C=E8=80=8C=E4=
=B8=8D=E6=98=AF=E4=BD=9C=E7=88=B2=E4=B8=80=E5=80=8B=E5=88=86=E6=94=AF=E3=80=
=82=E5=9B=A0=E6=AD=A4=EF=BC=8C
>     -      =E5=A6=82=E6=9E=9C=E6=82=A8=E5=B0=8D=E6=AD=A4=E6=96=87=E4=BB=
=B6=E6=9C=89=E4=BB=BB=E4=BD=95=E6=84=8F=E8=A6=8B=E6=88=96=E6=94=B9=E5=8B=95=
=EF=BC=8C=E8=AB=8B=E5=85=88=E5=98=97=E8=A9=A6=E6=9B=B4=E6=96=B0=E5=8E=9F=E5=
=A7=8B=E8=8B=B1=E6=96=87=E6=96=87=E4=BB=B6=E3=80=82=E5=A6=82=E6=9E=9C=E8=A6=
=81=E6=9B=B4=E6=94=B9=E6=88=96
>     --     =E4=BF=AE=E6=AD=A3=E6=9F=90=E8=99=95=E7=BF=BB=E8=AD=AF=E6=96=
=87=E4=BB=B6=EF=BC=8C=E8=AB=8B=E5=B0=87=E6=84=8F=E8=A6=8B=E6=88=96=E8=A3=9C=
=E4=B8=81=E7=99=BC=E9=80=81=E7=B5=A6=E7=B6=AD=E8=AD=B7=E8=80=85=EF=BC=88=E8=
=81=AF=E7=B9=AB=E6=96=B9=E5=BC=8F=E8=A6=8B=E4=B8=8B=EF=BC=89=E3=80=82
>     -+     =E4=BF=AE=E6=AD=A3=E6=9F=90=E8=99=95=E7=BF=BB=E8=AD=AF=E6=96=
=87=E4=BB=B6=EF=BC=8C=E8=AB=8B=E5=B0=87=E6=84=8F=E8=A6=8B=E6=88=96=E8=A3=9C=
=E4=B8=81=E7=99=BC=E9=80=81=E7=B5=A6=E7=B9=81=E9=AB=94=E4=B8=AD=E6=96=87=E6=
=96=87=E4=BB=B6=E7=9A=84=E7=B6=AD=E8=AD=B7=E8=80=85=EF=BC=88=E8=A6=8B
>     -+     MAINTAINERS =E6=AA=94=E6=A1=88=EF=BC=89=E3=80=82
>     + :orphan:
>
>     +-.. warning::
>     +-     =E6=AD=A4=E6=96=87=E4=BB=B6=E7=9A=84=E7=9B=AE=E7=9A=84=E6=98=
=AF=E7=88=B2=E8=AE=93=E4=B8=AD=E6=96=87=E8=AE=80=E8=80=85=E6=9B=B4=E5=AE=B9=
=E6=98=93=E9=96=B1=E8=AE=80=E5=92=8C=E7=90=86=E8=A7=A3=EF=BC=8C=E8=80=8C=E4=
=B8=8D=E6=98=AF=E4=BD=9C=E7=88=B2=E4=B8=80=E5=80=8B=E5=88=86=E6=94=AF=E3=80=
=82=E5=9B=A0=E6=AD=A4=EF=BC=8C
>     +-     =E5=A6=82=E6=9E=9C=E6=82=A8=E5=B0=8D=E6=AD=A4=E6=96=87=E4=BB=
=B6=E6=9C=89=E4=BB=BB=E4=BD=95=E6=84=8F=E8=A6=8B=E6=88=96=E6=94=B9=E5=8B=95=
=EF=BC=8C=E8=AB=8B=E5=85=88=E5=98=97=E8=A9=A6=E6=9B=B4=E6=96=B0=E5=8E=9F=E5=
=A7=8B=E8=8B=B1=E6=96=87=E6=96=87=E4=BB=B6=E3=80=82=E5=A6=82=E6=9E=9C=E8=A6=
=81=E6=9B=B4=E6=94=B9=E6=88=96
>     +-     =E4=BF=AE=E6=AD=A3=E6=9F=90=E8=99=95=E7=BF=BB=E8=AD=AF=E6=96=
=87=E4=BB=B6=EF=BC=8C=E8=AB=8B=E5=B0=87=E6=84=8F=E8=A6=8B=E6=88=96=E8=A3=9C=
=E4=B8=81=E7=99=BC=E9=80=81=E7=B5=A6=E7=B6=AD=E8=AD=B7=E8=80=85=EF=BC=88=E8=
=81=AF=E7=B9=AB=E6=96=B9=E5=BC=8F=E8=A6=8B=E4=B8=8B=EF=BC=89=E3=80=82
>     +-
>       .. note::
>      -     =E5=A6=82=E6=9E=9C=E6=82=A8=E7=99=BC=E7=8F=BE=E6=9C=AC=E6=96=
=87=E6=AA=94=E8=88=87=E5=8E=9F=E5=A7=8B=E6=96=87=E4=BB=B6=E6=9C=89=E4=BB=BB=
=E4=BD=95=E4=B8=8D=E5=90=8C=E6=88=96=E8=80=85=E6=9C=89=E7=BF=BB=E8=AD=AF=E5=
=95=8F=E9=A1=8C=EF=BC=8C=E8=AB=8B=E8=81=AF=E7=B9=AB=E8=A9=B2=E6=96=87=E4=BB=
=B6=E7=9A=84=E8=AD=AF=E8=80=85=EF=BC=8C
>      -     =E6=88=96=E8=80=85=E7=99=BC=E9=80=81=E9=9B=BB=E5=AD=90=E9=83=
=B5=E4=BB=B6=E7=B5=A6=E8=83=A1=E7=9A=93=E6=96=87=E4=BB=A5=E7=8D=B2=E5=8F=96=
=E5=B9=AB=E5=8A=A9=EF=BC=9A<2023002089@link.tyut.edu.cn>=E3=80=82
>     -+     =E5=A6=82=E6=9E=9C=E6=82=A8=E7=99=BC=E7=8F=BE=E6=9C=AC=E6=96=
=87=E6=AA=94=E8=88=87=E5=8E=9F=E5=A7=8B=E6=96=87=E4=BB=B6=E6=9C=89=E4=BB=BB=
=E4=BD=95=E4=B8=8D=E5=90=8C=E6=88=96=E8=80=85=E6=9C=89=E7=BF=BB=E8=AD=AF=E5=
=95=8F=E9=A1=8C=EF=BC=8C=E8=AB=8B=E7=99=BC=E5=BB=BA=E8=AD=B0=E6=88=96=E8=80=
=85=E8=A3=9C=E4=B8=81=E7=B5=A6
>     -+     =E7=B9=81=E9=AB=94=E4=B8=AD=E6=96=87=E6=96=87=E4=BB=B6=E7=9A=
=84=E7=B6=AD=E8=AD=B7=E8=80=85=E5=92=8C=E5=AF=A9=E9=96=B1=E8=80=85=EF=BC=88=
=E8=A6=8B MAINTAINERS =E6=AA=94=E6=A1=88=EF=BC=89=E3=80=82
>     -
>     +-
>     ++     =E6=AD=A4=E6=96=87=E4=BB=B6=E7=9A=84=E7=9B=AE=E7=9A=84=E6=98=
=AF=E8=AE=93=E4=B8=AD=E6=96=87=E8=AE=80=E8=80=85=E6=9B=B4=E5=AE=B9=E6=98=93=
=E9=96=B1=E8=AE=80=E8=88=87=E7=90=86=E8=A7=A3=EF=BC=8C=E8=80=8C=E4=B8=8D=E6=
=98=AF=E4=BD=9C=E7=82=BA=E4=B8=80=E5=80=8B=E5=88=86=E6=94=AF=E3=80=82
>     ++     =E5=9B=A0=E6=AD=A4=EF=BC=8C=E5=A6=82=E6=9E=9C=E6=82=A8=E5=B0=
=8D=E6=AD=A4=E6=96=87=E4=BB=B6=E6=9C=89=E4=BB=BB=E4=BD=95=E6=84=8F=E8=A6=8B=
=E6=88=96=E6=9B=B4=E6=96=B0=EF=BC=8C=E8=AB=8B=E5=85=88=E5=98=97=E8=A9=A6=E6=
=9B=B4=E6=96=B0=E5=8E=9F=E5=A7=8B=E8=8B=B1=E6=96=87=E6=96=87=E4=BB=B6=E3=80=
=82
>     ++     =E5=A6=82=E6=9E=9C=E6=82=A8=E7=99=BC=E7=8F=BE=E6=9C=AC=E6=96=
=87=E4=BB=B6=E8=88=87=E5=8E=9F=E5=A7=8B=E6=96=87=E4=BB=B6=E6=9C=89=E4=BB=BB=
=E4=BD=95=E4=B8=8D=E5=90=8C=EF=BC=8C=E6=88=96=E6=9C=89=E7=BF=BB=E8=AD=AF=E5=
=95=8F=E9=A1=8C=EF=BC=8C=E8=AB=8B=E5=90=91=E7=B9=81=E9=AB=94=E4=B8=AD=E6=96=
=87
>     ++     =E6=96=87=E4=BB=B6=E7=9A=84=E7=B6=AD=E8=AD=B7=E8=80=85=E8=88=
=87=E5=AF=A9=E9=96=B1=E8=80=85=E6=8F=90=E4=BA=A4=E5=BB=BA=E8=AD=B0=E6=88=96=
=E8=A3=9C=E4=B8=81=EF=BC=88=E8=A6=8BMAINTAINERS=E6=AA=94=E6=A1=88=EF=BC=89=
=E3=80=82
>
>       ## Documentation/translations/zh_TW/index.rst ##
>      @@
>     @@ Documentation/translations/zh_TW/index.rst
>       .. note::
>          =E5=85=A7=E6=A0=B8=E6=96=87=E6=AA=94=E7=B9=81=E9=AB=94=E4=B8=AD=
=E6=96=87=E7=89=88=E7=9A=84=E7=BF=BB=E8=AD=AF=E5=B7=A5=E4=BD=9C=E6=AD=A3=E5=
=9C=A8=E9=80=B2=E8=A1=8C=E4=B8=AD=E3=80=82=E5=A6=82=E6=9E=9C=E6=82=A8=E9=A1=
=98=E6=84=8F=E4=B8=A6=E4=B8=94=E6=9C=89=E6=99=82=E9=96=93=E5=8F=83=E8=88=87=
=E9=80=99=E9=A0=85=E5=B7=A5
>      -   =E4=BD=9C=EF=BC=8C=E6=AD=A1=E8=BF=8E=E6=8F=90=E4=BA=A4=E8=A3=9C=
=E4=B8=81=E7=B5=A6=E8=83=A1=E7=9A=93=E6=96=87 <2023002089@link.tyut.edu.cn>=
=E3=80=82
>     -+   =E4=BD=9C=EF=BC=8C=E6=AD=A1=E8=BF=8E=E5=B0=87=E8=A3=9C=E4=B8=81=
=E6=8F=90=E4=BA=A4=E7=B5=A6=E7=B9=81=E9=AB=94=E4=B8=AD=E6=96=87=E6=96=87=E4=
=BB=B6=E7=9A=84=E7=B6=AD=E8=AD=B7=E8=80=85=EF=BC=88=E8=A6=8B MAINTAINERS =
=E6=AA=94=E6=A1=88=EF=BC=89=E3=80=82
>     ++   =E4=BD=9C=EF=BC=8C=E6=AD=A1=E8=BF=8E=E5=B0=87=E8=A3=9C=E4=B8=81=
=E6=8F=90=E4=BA=A4=E7=B5=A6=E7=B9=81=E9=AB=94=E4=B8=AD=E6=96=87=E6=96=87=E4=
=BB=B6=E7=9A=84=E7=B6=AD=E8=AD=B7=E8=80=85=EF=BC=88=E8=A6=8BMAINTAINERS=E6=
=AA=94=E6=A1=88=EF=BC=89=E3=80=82
>
>       =E8=88=87Linux =E5=85=A7=E6=A0=B8=E7=A4=BE=E5=8D=80=E4=B8=80=E8=B5=
=B7=E5=B7=A5=E4=BD=9C
>       ------------------------
> --
> 2.43.0
>

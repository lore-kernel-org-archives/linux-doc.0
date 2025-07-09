Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892B220E6
	for <linux-doc@vger.kernel.org>; Wed,  9 Jul 2025 01:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752025160; cv=none; b=QrVndEAjNww7tinYDX/uz96tMG0lWm/9AywexvniRBr8hgPcJjMBcDyQRueLjywFphhFF4ESEVLnCwQOPmFA0PMFtStzlCUzb/oA3EZG1lxRJjBI0jE+zNepWRoqxzr2/q0DhWBx0AiaG7eO2k5SUsv9kZiCNYJBcIZ+bfLFuZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752025160; c=relaxed/simple;
	bh=jgncUpZzA56ezPnanejCk/qgzOGDxcGgjJykg8AwrIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xjvb3BZcWdUHgCN9TzalQ0w+0iazjFaFXJ8AhjDTGFdBCTEUMRIox6x2PqakP8xIB118NWgddHTSqWkdlmA2oUTBxrACLuK3VduArbR3Z+xNJD3EOQiXhttgr0UIlwMnuQ8TDuK4oIzpxXFOVHlGqmAVjFrfLBG3uGJzKffaLBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gzz8Vi1t; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gzz8Vi1t"
Message-ID: <67a798a3-6ee0-4c08-8c17-943fd02e458b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1752025155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tXcYRdBWkegGP67d6PsPlfb8GNRwEZd3m9sRaURVgdI=;
	b=gzz8Vi1tVW/jGg8serlvizxAp9Kxo52Vt/FQQkLncMny18eqpir72MOXLbO9eCFUsiWoQ2
	MnoNtTvjjUfgl5Uif7gOiO9l7SjNmMKsSyzVQ+9Z57fzUYEr818E0MeftFrajBc2pRPicN
	pyxE49eFoe2nF/ADda/xCaJUt3+KvQ8=
Date: Wed, 9 Jul 2025 09:39:11 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/7] docs/zh_CN: add scsi.rst translation
To: haodongdong <doubled@leap-io.com>, alexs@kernel.org
Cc: dzm91@hust.edu.cn, corbet@lwn.net, linux-doc@vger.kernel.org
References: <20250708024139.848025-3-doubled@leap-io.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250708024139.848025-3-doubled@leap-io.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 7/8/25 10:41 AM, haodongdong 写道:
> Translate .../scsi/scsi.rst into Chinese.
> Add scsi into .../scsi/index.rst.
>
> Signed-off-by: haodongdong <doubled@leap-io.com>
> ---
>   .../translations/zh_CN/scsi/index.rst         | 95 +++++++++++++++++++
>   .../translations/zh_CN/scsi/scsi.rst          | 48 ++++++++++
>   2 files changed, 143 insertions(+)
>   create mode 100644 Documentation/translations/zh_CN/scsi/index.rst
>   create mode 100644 Documentation/translations/zh_CN/scsi/scsi.rst
>
> diff --git a/Documentation/translations/zh_CN/scsi/index.rst b/Documentation/translations/zh_CN/scsi/index.rst
> new file mode 100644
> index 000000000000..4e9577f2c9c6
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/scsi/index.rst
> @@ -0,0 +1,95 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/scsi/index.rst
> +
> +:翻译:
> +
> + 郝栋栋 Dongdong Hao <doubled@leap-io.com>
> +
> +:校译:
> +
> +
> +
> +==========
> +SCSI子系统
> +==========
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +简介
> +====
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   scsi
> +
> +SCSI驱动接口
> +============
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +Todolist:
> +
> +* scsi_mid_low_api
> +* scsi_eh
> +
> +SCSI驱动参数
> +============
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +Todolist:
> +
> +* scsi-parameters
> +* link_power_management_policy
> +
> +SCSI主机适配器驱动
> +==================
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +Todolist:
> +
> +* sd-parameters
> +* 53c700
> +* aacraid
> +* advansys
> +* aha152x
> +* aic79xx
> +* aic7xxx
> +* arcmsr_spec
> +* bfa
> +* bnx2fc
> +* BusLogic
> +* cxgb3i
> +* dc395x
> +* dpti
> +* FlashPoint
> +* g_NCR5380
> +* hpsa
> +* hptiop
> +* libsas
> +* lpfc
> +* megaraid
> +* ncr53c8xx
> +* NinjaSCSI
> +* ppa
> +* qlogicfas
> +* scsi-changer
> +* scsi_fc_transport
> +* scsi-generic
> +* smartpqi
> +* st
> +* sym53c500_cs
> +* sym53c8xx_2
> +* tcm_qla2xxx
> +* ufs
> +* wd719x
> +
> +* scsi_transport_srp/figures
I think you can merge this part with the first patch to serve as the first patch. Of course, you need to move "scsi" to the todolist.
> diff --git a/Documentation/translations/zh_CN/scsi/scsi.rst b/Documentation/translations/zh_CN/scsi/scsi.rst
> new file mode 100644
> index 000000000000..874ad34ae8aa
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/scsi/scsi.rst
> @@ -0,0 +1,48 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/scsi/scsi.rst
> +
> +:翻译:
> +
> + 郝栋栋 Dongdong Hao <doubled@leap-io.com>
> +
> +:校译:
> +
> +
> +
> +==============
> +SCSI子系统文档
> +==============
> +
> +Linux文档项目（LDP）维护了一份描述Linux内核（lk） 2.4中SCSI
> +子系统的文档。请参考：
> +https://www.tldp.org/HOWTO/SCSI-2.4-HOWTO 。LDP提供单页和
> +多页的HTML版本，以及PostScript与PDF格式的文档。
> +
> +在SCSI子系统中使用模块的注意事项
> +================================
> +Linux内核中的SCSI支持可以根据终端用户的需求以不同的方式模块
> +化。为了理解你的选择，我们首先需要定义一些术语。
> +
> +scsi-core（也被称为“中间层”）包含SCSI支持的核心。没有他你将
> +无法使用任何其他SCSI驱动程序。SCSI核心支持可以是一个模块（
> +scsi_mod.o），也可以编译进内核。如果SCSI核心是一个模块，那么
> +他必须是第一个被加载的SCSI模块，如果你将卸载该模块，那么他必
> +须是最后一个被卸载的模块。实际上，modprobe和rmmod命令将确保
> +SCSI子系统中模块加载与卸载的正确顺序。
> +
> +一旦SCSI核心存在于内核中（无论是编译进内核还是作为模块加载），
> +独立的上层驱动和底层驱动可以按照任意顺序加载。磁盘驱动程序
> +（sd_mod.o）、光盘驱动程序（sr_mod.o）、磁带驱动程序 [1]_
> +（st.o）以及SCSI通用驱动程序（sg.o）代表了上层驱动，用于控制
> +相应的各种设备。例如，你可以加载磁带驱动程序来使用磁带驱动器，
> +然后在不需要该驱动程序时卸载他（并释放相关内存）。
> +
> +底层驱动程序用于支持您所运行硬件平台支持的不同主机卡。这些不同
> +的主机卡通常被称为主机总线适配器（HBAs）。例如，aic7xxx.o驱动
> +程序被用于控制Adaptec所属的所有最新的SCSI控制器。几乎所有的底
> +层驱动都可以被编译为模块或直接编译进内核。
> +
> +.. [1] 磁带驱动程序有一个变种用于控制OnStream磁带设备。其模块
> +	   名称为osst.o 。
> \ No newline at end of file

need a blackline.


Thanks,

Yanteng


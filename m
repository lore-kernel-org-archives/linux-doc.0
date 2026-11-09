Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794229590;
	b=DRwDFsvTLCcITMuzPB1fpKKGOiECYDhpSczqPks8k7T7PkINNcliFajre7wfbvUIOvmp
	 R1x7y7AXv/aN/N4nMCMUKYm+XVQo4z+7d8z8Q370HcHAzFpnU/5Cm+9ypBT4dlftCxPRo
	 8U46MI0BNTUP6xvFghI/++/otgrqHILMYYCmyZYsqRl7xijLZmDU/utYRZATlOpwYOn5Z
	 LPLmAkP7aX1UHN9jJpFp3aD5eFgUNUkaCMRzFmxvFpyDYEoq1yUaXi3aIWpWYEFdT4VPm
	 LJ9Aet8N6jAqAsZTGB1t6w0VmgdoC1J6o3d4sdJNgTgrfhjubnGKm6aRXyCUE65Y0gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794229590;
	h=DMARC-Filter:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 X-Lms-Return-Path:Cc:From:Date:In-Reply-To:References:X-Original-From:
	 To:Subject:Message-Id:Received:Content-Type:User-Agent;
	bh=eH2m2Zew8oyu1f0utHA4YTbxzS4hIWuowjmaOpnZyec=;
	b=qctJIh9WHQZY53qWHi7HyJ0NHICyx8bz8yw1Fc4A4RXSaTvcc+ZS/CcA2ui9g3AH2Dnm
	 zkajkayMawasdzwLHwVtf13AqlayqPUT3MqpRQFPrNLKlPlt9rku+bFz4xqteUed7dnBk
	 5SqNeBDyUq7jo9MnRQs+IWOoVfl7EmEWOm6Vr8hrHQ9l3Te798qldGlV+RlFw1UXEeUBT
	 7wHno6CuFUmEYA8xGgS1s6W8+AWAemZ0s8hWzaSLHyBJm2dgPx8kg7WNbbcq9e99CVQJ5
	 aMwC01PBHRJTOqg2+AUK1ogPDFelwzCYIKzVJz0FuxzV8XJ1yU5zOysYHCyWrX09GPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=picoheart.com;
	spf=pass smtp.mailfrom=picoheart.com;
	dkim=pass header.d=picoheart.com header.i=@picoheart.com header.a=rsa-sha256 header.s=feishu2604151535 header.b=DKwwfgRT;
	arc=none smtp.remote-ip=209.127.231.39
Received: from va-2-39.ptr.blmpb.com (va-2-39.ptr.blmpb.com [209.127.231.39])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5E9606A322
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 13:06:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E5E9606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=picoheart.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=picoheart.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=picoheart.com header.i=@picoheart.com header.a=rsa-sha256 header.s=feishu2604151535 header.b=DKwwfgRT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1794229585; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=eH2m2Zew8oyu1f0utHA4YTbxzS4hIWuowjmaOpnZyec=;
 b=DKwwfgRTDFQPIQlfJeXUjvsiavMAldqqCzazkIHgHkKwTO5xWrknEVYW1Ie1GttGKhRHyN
 t4XyYJ61cjtM8YhtA7jM9Xm9+ag7qkpqVD/XouRRanisThoOQjsmjUmlGYvFYxGcPY36Nz
 Q7i90AmupKcZ4Z3gAPh9dUDnbtnQhdpftOGys4tx7hl0PYM/tCsOdaHp7Yu8k7aDTeZVND
 JRzj+sFJjib2/JnHjAL4XqgxCEw1//5qGKaxbMKlvzZ6oM84OIT1HOq7OvXIt3VLCEnsiS
 p5nOGAodTWOSJO7YLCqNP+iHFpjNXPRYOMgsAhQRer3LvdHNgiOZvJ7PuNWjdg==
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Lms-Return-Path: <lba+26af1c545+7976d1+vger.kernel.org+zengheng@picoheart.com>
Cc: "Catalin Marinas" <catalin.marinas@arm.com>, 
	"Jonathan Cameron" <jic23@kernel.org>, 
	"Shaopeng Tan" <tan.shaopeng@jp.fujitsu.com>, 
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<x86@kernel.org>, <devicetree@vger.kernel.org>, 
	<linux-doc@vger.kernel.org>
From: "Zeng Heng" <zengheng@picoheart.com>
Date: Mon, 9 Nov 2026 21:06:09 +0800
In-Reply-To: <20261108-dfustini-atl-sc-cbqri-dt-v11-0-33a1bf0cf01c@kernel.org>
References: <20261108-dfustini-atl-sc-cbqri-dt-v11-0-33a1bf0cf01c@kernel.org>
X-Original-From: Zeng Heng <zengheng@picoheart.com>
To: "Drew Fustini" <fustini@kernel.org>, 
	"Adrien Ricciardi" <aricciardi@baylibre.com>, 
	"Alexandre Ghiti" <alex@ghiti.fr>, "Albert Ou" <aou@eecs.berkeley.edu>, 
	"Atish Patra" <atish.patra@linux.dev>, "Babu Moger" <babu.moger@amd.com>, 
	"Ben Horgan" <ben.horgan@arm.com>, "Borislav Petkov" <bp@alien8.de>, 
	"Chen Pei" <cp0613@linux.alibaba.com>, 
	"Conor Dooley" <conor.dooley@microchip.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Dave Hansen" <dave.hansen@linux.intel.com>, 
	"Dave Martin" <Dave.Martin@arm.com>, "Fenghua Yu" <fenghuay@nvidia.com>, 
	"Gong Shuai" <gong.shuai@sanechips.com.cn>, 
	"Gong Shuai" <gsh517@gmail.com>, <guo.wenjia23@zte.com.cn>, 
	"James Morse" <james.morse@arm.com>, 
	=?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, <liu.qingtao2@zte.com.cn>, 
	"Liu Zhiwei" <zhiwei_liu@linux.alibaba.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, "Paul Walmsley" <pjw@kernel.org>, 
	"Peter Newman" <peternewman@google.com>, 
	=?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>, 
	"Reinette Chatre" <reinette.chatre@intel.com>, 
	"Rob Herring" <robh@kernel.org>, 
	"Samuel Holland" <samuel.holland@sifive.com>, 
	"Sunil V L" <sunilvl@oss.qualcomm.com>, 
	"Tony Luck" <tony.luck@intel.com>, "Weiwei Li" <liwei1518@gmail.com>, 
	"yunhui cui" <cuiyunhui@bytedance.com>, 
	"Zhanpeng Zhang" <zhangzhanpeng.jasper@bytedance.com>
Subject: Re: [PATCH v11 0/5] riscv: Add initial CBQRI resctrl support
Message-Id: <bb2f816c-9c8d-4a27-8353-a946ba58870c@picoheart.com>
Received: from [172.16.137.224] ([124.160.26.250]) by smtp.feishu.cn with ESMTPS; Mon, 09 Nov 2026 21:06:12 +0800
Content-Type: text/plain; charset=UTF-8
User-Agent: Mozilla Thunderbird

Hi Drew,

=E5=9C=A8 11/9/26 =E4=B8=8A=E5=8D=887:20, Drew Fustini =E5=86=99=E9=81=93:
> This series adds initial RISC-V QoS support through the CBQRI
> controller interface [1] integrated with resctrl [2], plus a DT-based
> platform driver for cache controllers. It builds on the Ssqosid
> extension [3] (srmcfg CSR) support that landed in the v7.3 merge
> window. It has been tested on both the Tenstorrent Ascalon Shared Cache
> controller and a QEMU implementation [4].
>=20
>    qemu-system-riscv64 -M virt,aia=3Daplic-imsic -nographic -m 1G -smp 8 =
\
>        -kernel arch/riscv/boot/Image \
>        -append "root=3D/dev/vda ro console=3DttyS0 rootwait" \
>        -drive if=3Dnone,file=3Drootfs.ext2,format=3Draw,id=3Dhd0 \
>        -device virtio-blk-device,drive=3Dhd0 \
>        -device riscv.cbqri.capacity,max_mcids=3D256,max_rcids=3D64,ncblks=
=3D16,mmio_base=3D0x04820000
>=20
> Cache allocation can be exercised on the booted system. Mount resctrl
> and read the default schemata. The L2 controller has 16 capacity
> blocks, so the default capacity bitmask (CBM) is 0xffff:
>=20
>    # mount -t resctrl resctrl /sys/fs/resctrl
>    # cat /sys/fs/resctrl/schemata
>    L2:0=3Dffff
>=20
> Write a narrower CBM to a new control group and read it back to confirm
> the L2 controller applied it:
>=20
>    # mkdir /sys/fs/resctrl/group0
>    # echo "L2:0=3Dff" > /sys/fs/resctrl/group0/schemata
>    # cat /sys/fs/resctrl/group0/schemata
>    L2:0=3Dff
>=20
> Note that this series only implements support for resctrl L2 and L3
> cache resources using CBQRI capacity allocation control. cc_block_mask
> maps onto resctrl's existing cbm schema. However, cc_cunits is not
> supported as there is no existing equivalent for capacity units in the
> resctrl schemata.
>=20
> I previously iterated on an RFC series [5] that implemented all of
> CBQRI, including capacity monitoring, bandwidth allocation and
> monitoring. The bandwidth controls for CBQRI do not fit well into
> resctrl's existing throttle-based MB schemata. I believe that the path
> forward is Reinette's generic schema description proof of concept [6].
> My plan is to rebase the full support of CBQRI onto the generic schema
> once it is ready.
>=20
> Tony Luck's AET series [7] replaces resctrl_arch_alloc_capable() and
> resctrl_arch_mon_capable() with generic helpers that walk the resources.
> This series keeps the two hooks because resctrl on v7.4-rc1 still
> calls them, and answers the alloc hook from rdt_resource::alloc_capable
> so whichever series lands second only has to delete them. If the AET
> series lands first, the CBQRI glue will also need the three arch hooks
> it adds, resctrl_arch_system_max_rmid_idx(),
> resctrl_arch_get_num_rmid_idx() and resctrl_arch_unmount().
>=20
> [1] https://github.com/riscv-non-isa/riscv-cbqri/releases/tag/v1.0
> [2] https://docs.kernel.org/filesystems/resctrl.html
> [3] https://github.com/riscv/riscv-ssqosid/releases/tag/v1.0
> [4] https://github.com/tt-fustini/qemu/tree/riscv-cbqri-cache
> [5] https://lore.kernel.org/linux-riscv/20260601-ssqosid-cbqri-rqsc-v7-0-=
v6-0-baf00f50028a@kernel.org/
> [6] https://lore.kernel.org/all/d258a32f-12d5-464d-abe9-4720fb3e44b3@inte=
l.com/
> [7] https://lore.kernel.org/lkml/20261019205031.16977-1-tony.luck@intel.c=
om/
>=20

I have tested the CBQRI patch series, covering the following:

   * Boot-time initialization
   * Mounting and remounting the resctrl filesystem
   * Creating resctrl control groups
   * Configuring schemata for L3 block_mask resource allocation

All of the above worked as expected.

Tested-by: Zeng Heng <zengheng@picoheart.com>
Reviewed-by: Zeng Heng <zengheng@picoheart.com>


Best regards,
Zeng Heng

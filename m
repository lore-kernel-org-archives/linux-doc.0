Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010060.outbound.protection.outlook.com [52.101.228.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F1B359A93;
	Wed, 11 Mar 2026 15:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773244115; cv=fail; b=kpYJF9x+sanAKnSCLIwB8DLwAWzCuvEJ8pQ9JWRq+cJWs329bnD4nzQBcahwceSaznQStcqE4l3f6Od5cBDSN3nMHOyChjbMTk+it1EONH9keYLAHt3AijJ9GirPRb1IgibXdt2NhQ+6nZdSBHDbCitho3PUkAp4Mf+1LY6IB8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773244115; c=relaxed/simple;
	bh=+JSZTYtquYa4IFjooejiRM06228t5aZKM4LghmV+gt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gyUd5AQXA8KoiMlGe6Csevhjdpa0GUiFefGk5Gh+Y83BDiWHVV70jub4Je4SS/fsVNO3elWLmfMNbLm2Y9v2Pin1l5ZtF/ekcTKX1Yu008/kEcV913SA+v0kpKeFYskyNYStY+sHHbKOhQEXJmS+pA35pg6E1WaVeo+kG2PizAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=KwUlTSt5; arc=fail smtp.client-ip=52.101.228.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="KwUlTSt5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=psEVWf/7mGrwtSuIlfjfZfLUPsm8jj/G9ZqUznMOTV9kGypYx0f6Fs947eRUeFYwe9Tz1joevQsZQEXGmW2hSuf0Vby20gysi5MGVc/Su7UBQddBTMhqGbuetjU0//1GfLITiJK2Q0u9OPRhY2DIC4zSBnS9aRR/6lpzFr/IUq0JWJgv8yT8nVWFpkUNonFe4fTWNpp1CWGe50nNOIW5GxzME3DPKyPqdjbATyc+/laGITiOrhtpn5U74RyIX2DPHV/GWCXEmk/OKhAw+vANtiSaRnIHanRAqdnhiYQlj7wVqVpL8+gZZ7riC8YjujZ45JSSkfoS/r31kwkVlRvTKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4VQ1CR59Sun6CnI7JUwl7iEmUOR9g7YfXREEooK3Pl4=;
 b=S4OM4p8U0BjQTgmsf8NF/k9H76MuoftGgUnu12ap5gz+Sl0eXH/5i+eEzY3T3JGncRgH6Qrb0E5tZcExIm2gIrRxULtDHGygKKL8U1uRod3CwFHKXbnn2zCtAK5oYVv6WHo0SpHTJuXzfWJRS1mYi/uOSzCdj1K64EZqYKxbwU6fwvHUzlVyZkWSeYrDMgn0v5YH0QEWNySg0tNLHVhYSSVhiUWF3JwJS4l4yOhnbvRlw8CE4E+/JVbfNFVQbd3Yr5FzP4QsK/6BdW8TNBxXzGlMmpe5TnXyW79L9UMEVb+9ZROQkrsdWwa9LPN7aBoFTewtStbKUGd5pVF54tR/BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VQ1CR59Sun6CnI7JUwl7iEmUOR9g7YfXREEooK3Pl4=;
 b=KwUlTSt5giuZXK0zuLtyZGJS8uN7S7JEj+qxe4xl0Tl25ctaQIOiorXuhaHzslSS3hDUFk3Lu7gW/Zq5gOd9Z1LIwgjJcOz21ZZMbUH0bQjm1hiUOgjotg7rlFtRoCbDuwCazrY7YOOIbtudfvLjTum5pw1nQqSKyE27Pi6NbGo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY6PR01MB17881.jpnprd01.prod.outlook.com (2603:1096:405:345::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 15:48:26 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9700.013; Wed, 11 Mar 2026
 15:48:21 +0000
Date: Wed, 11 Mar 2026 16:47:57 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, brgl@kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 13/14] reset: convert reset core to using firmware
 nodes
Message-ID: <abGOrRSJNB6zC8Vz@tom-desktop>
References: <20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com>
 <20260306-reset-core-refactor-v3-13-599349522876@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306-reset-core-refactor-v3-13-599349522876@oss.qualcomm.com>
X-ClientProxiedBy: FR4P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::19) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TY6PR01MB17881:EE_
X-MS-Office365-Filtering-Correlation-Id: 083ed501-c544-4134-141d-08de7f859f04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014|7053199007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	eV3BkO1axPh1siUFR+atT4+tE7yD3S8ydJmvYLxdypoIdK0SjHL9jV7dfZR8RaBQ1HeG+tKvyCti6bRQnUbD/frW+a99hv/jTNVCvyl4td4WL3+oC+qmDMSMl9pGe7EZzsvhzlft250xQHFuqAwVQm1qtMWDm9boEozTU/kd4QoSvNIns0Hbxt3xCcyAyvuvbVAgdw0eL5Tb+lyJYO6wfmxolYYSyCl21Nfsh/lkya3oBDqjU3Xl16mZa17FK2nbK1zs3TzTG5XNfNLZi/eBVeW8C94LwRZW/Z7/wamDYnqvjz0HjOkjNzT0BpWuvPZd3GBGGhT2Ri7/JNu3H3bVMibESPvgg1fqc3hzZ7FZSvllzvX/CEf9NJ04up6IT/BjwwXJ2/5oSrrBq3Uq4oh707mYRGtXUgcBXFSGV+2iaWTum15WZ4B58aO9bG07n9xFW3OYh1PJsDNw9wDnN4vBdAfT5Jy1FtNAt2UNPxpHFiGN1ISP0hzwPKDFiPAq945rf2jNUN0V8sAaDRvYTTS8bxmGJdeVoc7a4jHMdl7GYsUePogAWO3xTivJNTTdwWWO+cA8nHbqRExM0XxC6eLVMpT61gglGuOxr87zwR6ovrvbdRNNaZqxD1/uFzIeknGYMYo6+fh7NXv6oK7ENN6Y0Z7/1r/OGnMxD7eDuVo5UKI6l4x06WH2rsN9+tmalKhTWCalL1PkcLMLxVa8hctp8hJU3sUpxKTIYU/tkkf2e+b5i2uXTwa2avARgXRiOb9pvubd5sF0SKCUCZDC86tXoOpWygCZxM7YzTa+JwxHAPM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014)(7053199007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zh2U5UXByKzQZXWbyu9CmX9tsKnv1P2FjHNA7wqndaHA/FcOPSNPROzAFaqg?=
 =?us-ascii?Q?VHkKutWZUet7Tk0pcxZvhU1UjA6K4uAKi97lZqjdj1kxMJRL1UQIEKKV3l7M?=
 =?us-ascii?Q?UDVQwWyNbnrp+fLlWm0f57MEJB86zCv4kYBBceGytw26hSQRiZ85BVRW/vd4?=
 =?us-ascii?Q?WdIiuKVfdxbRZcLRFPdeiD01qgxTnWou307zJPUAwY3SYD6kwfSoW0W+R8CJ?=
 =?us-ascii?Q?R6/F2p1ze9Wuyfe8hDsfafPxVogpWJNkL4G7hhanSL7m72/shKQ1GGv7ORbl?=
 =?us-ascii?Q?Sx4PH9P5ldnOlpukZdK9YiRHiB14K7njinB+1wilNYPl2LbY4hU2LrfJh2+H?=
 =?us-ascii?Q?HqeYUXFSyl/DbLcxXg/hXXe2QdbX+kmwDwI/DyfpmWLmDNfwzd4jhsHQWje/?=
 =?us-ascii?Q?FKYAq/4NvsoGL5LnjDi7BxDcaaeNgHvrQT6riChPz4FfZJbGhA9320dokfMZ?=
 =?us-ascii?Q?lhLGr0xgj6UnbxEHr3GNeWDBXPcGGQqAK0BVaNqvSybqaJEhT140OgZX6Wh5?=
 =?us-ascii?Q?dxulCZEJGzqO/hzshm9DCwmgR2Bq6JQUZImIGMDfyR2BV7lCI2C2IJOOCnBE?=
 =?us-ascii?Q?ySgw68wyCNy6I0h6DpG+4ahV+9+TOaQpgSAChVKce5lqsvxd1DrFuS9BsN+d?=
 =?us-ascii?Q?pZkGgDoacU9s5MBezkiNco10UaPaz7uPncCB/nSW60GcckJ2bKqPXb+E47Kk?=
 =?us-ascii?Q?oZcGbtU9/jHlJJjz4K+g0yLD6Wxlh5v0QKC2rteAQAqGFbJVAoCy6oczNCzz?=
 =?us-ascii?Q?fIAJedz1fbV71zCLqqjiAnzJJ90991DV/MtRAUUBdo7SSeUj7SZfqUHjz7Nm?=
 =?us-ascii?Q?7ER5WWBzBV/3eZ5wdEnU/GhJzYNT+/pCT9wfr3q/oqs+4JtMCczTHlJTASLw?=
 =?us-ascii?Q?+iaNH8d9u3UU1TDTkVOgIi7tctA+0w6ZFCTkYgfLK9eRdPB7o4lqZ1xfv4VT?=
 =?us-ascii?Q?JKOTMCpiBtfmkwayrVJsI91ahQ0wXAsVlu7yp2vzCjmgBJ0lqU42/oF8NGi8?=
 =?us-ascii?Q?rkby7hxeyFIOZH2XaHe1+E741ZH5ea1iPFXUrkCraKGOQ67YQeVGHg8ELR7T?=
 =?us-ascii?Q?uDOkvTxBTs27N8UMKnq07rMCheLnf5NmWamgIwot7ufKs35+mKdIDnnlBA9r?=
 =?us-ascii?Q?kFo+S8Zkk8EZkNU8CVm4LFQHc/WW3LxuFqRNXIz+lC+lh5r/t1Tb00WxcaWn?=
 =?us-ascii?Q?SNbi5B3Xd+06IHsMYikFA0gOeRNbX5EHrF6wIbRVV1t0Y249NgaBSJ7gL59/?=
 =?us-ascii?Q?PJqgvV3vRfU7SathHx3DLpHJgRdnm0XTNNpPK3jWu2jIFOa2OZU4H1sfCvpI?=
 =?us-ascii?Q?D3swnM/Bi3WYGB9/BtdsVncBDyCXv3AvmaCSGQwSwCo+7AAW3OsQSDMLoPgm?=
 =?us-ascii?Q?MLEkeuYegSZWiemVY2PHS9NnkNzZFTu6uVSrzIQWA5ZPA/0LXpDmWbJPf6Bz?=
 =?us-ascii?Q?j+YKAqgJtyO4SObvYTb6U8ARgcoIeZd6K9W6ZNoFsqE14Gcz4uSCpXIHXe6Z?=
 =?us-ascii?Q?MF+RTiy/2MhgTXT4eI1Ob2kSDaXcnFB2A+F61Dj+hLjB0a78Jp/WjBuoKmUJ?=
 =?us-ascii?Q?w7jVoZoSLkHIX6IsTL/1LST96H6CFBcztnXRKrJhnislvRsMjpjvpTpX7eUt?=
 =?us-ascii?Q?T0ktJ/PhRH0CzAgIeY/thqivMC3JYBPGG/fAE++nj5Ko4aqi2pawC6Kch1zw?=
 =?us-ascii?Q?VtTR8pNEOfLj4CoaGxurbXc7+Idjg0KngQFFCqncrB+Lsfx1WSgn+N/aG1bF?=
 =?us-ascii?Q?Y34zbqBeapR/UKH/jaAak5FwMfxDWFI87GO0opKiTAwlVWhCi4Pd?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 083ed501-c544-4134-141d-08de7f859f04
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 15:48:21.1187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NHYdfuGZp2IdPs3vXjv1atkjgjhlZd59TOrGhpgH3+0TwPUccVN0QOVkzVcFgML+9YhntgK5IewtJBPzt/TNKdeOf6jISDpSwhmo59loYtTCj4tzvMqVr8v6LVjhCeBn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY6PR01MB17881

Hi Bartosz,
Thanks for your patch.

On Fri, Mar 06, 2026 at 06:22:57PM +0100, Bartosz Golaszewski wrote:
> With everything else now in place, we can convert the remaining parts of
> the reset subsystem to becoming fwnode-agnostic - meaning it will work
> with all kinds of firmware nodes, not only devicetree.
> 
> To that end: extend struct reset_controller_dev with fields taking
> information relevant for using firmware nodes (which mirrors what we
> already do for OF-nodes) and limit using of_ APIs only to where it's
> absolutely necessary (mostly around the of_xlate callback).
> 
> For backward compatibility of existing drivers we still support OF-nodes
> but firmware nodes become the preferred method.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Just to share I'm seeing the following on RZ/G3E (next-20260310):

[   16.806538] ------------[ cut here ]------------
[   16.806546] WARNING: drivers/reset/core.c:1195 at __fwnode_reset_control_get+0x474/0x568, CPU#3: kworker/u16:0/11
[   16.806566] Modules linked in: reset_rzv2h_usb2phy(+) rcar_canfd(+) rtc_isl1208 can_dev ecdh_generic ecc rfkill renesas_rpc_if fuse drm backlight ipv6
[   16.806603] CPU: 3 UID: 0 PID: 11 Comm: kworker/u16:0 Not tainted 7.0.0-rc3-next-20260310-00016-g866b1999e3fc #17 PREEMPT
[   16.806610] Hardware name: Renesas SMARC EVK version 2 based on r9a09g047e57 (DT)
[   16.806615] Workqueue: events_unbound deferred_probe_work_func
[   16.806627] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   16.806632] pc : __fwnode_reset_control_get+0x474/0x568
[   16.806638] lr : __fwnode_reset_control_get+0x164/0x568
[   16.806644] sp : ffff800083263930
[   16.806646] x29: ffff800083263a30 x28: ffff0000ff8370a8 x27: ffff800081d8d590
[   16.806655] x26: ffff800081e3a6c8 x25: ffff800082fec430 x24: ffff800082fec450
[   16.806663] x23: 0000000000000000 x22: 0000000000000003 x21: ffff0000ff835940
[   16.806671] x20: 0000000000000000 x19: ffff0000c0294e98 x18: 00000000ffffffff
[   16.806679] x17: 6e6f637478652f79 x16: 68702d6273752e30 x15: 303230303835312f
[   16.806687] x14: ffff8000831a6200 x13: 00363038343d4d55 x12: 0000000000000000
[   16.806695] x11: 7478653d4d455453 x10: ffff8000827b0ab7 x9 : 0000000000000028
[   16.806703] x8 : 0101010101010101 x7 : 00000000736c6c65 x6 : 000000000080a3f0
[   16.806711] x5 : ffff800083263864 x4 : ffffffffff604034 x3 : 0000000000000000
[   16.806719] x2 : ffff0000c0128fc0 x1 : 0000000000000000 x0 : 0000000000000001
[   16.806727] Call trace:
[   16.806731]  __fwnode_reset_control_get+0x474/0x568 (P)
[   16.806738]  fwnode_reset_control_array_get+0x84/0x134
[   16.806745]  devm_reset_control_array_get+0x54/0xb4
[   16.806751]  rcar_gen3_phy_usb2_probe+0x108/0x5b8
[   16.806762]  platform_probe+0x5c/0x98
[   16.806770]  really_probe+0xbc/0x29c
[   16.806776]  __driver_probe_device+0x78/0x12c
[   16.806782]  driver_probe_device+0x3c/0x15c
[   16.806789]  __device_attach_driver+0xb8/0x134
[   16.806795]  bus_for_each_drv+0x88/0xe8
[   16.806802]  __device_attach+0xa0/0x190
[   16.806808]  device_initial_probe+0x50/0x54
[   16.806814]  bus_probe_device+0x38/0xa4
[   16.806820]  deferred_probe_work_func+0x88/0xc0
[   16.806826]  process_one_work+0x154/0x294
[   16.806835]  worker_thread+0x180/0x300
[   16.806840]  kthread+0x118/0x124
[   16.806847]  ret_from_fork+0x10/0x20
[   16.806856] ---[ end trace 0000000000000000 ]---
[   16.806867] phy_rcar_gen3_usb2 15800200.usb-phy: probe with driver phy_rcar_gen3_usb2 failed with error -22

Hope this help.

Thanks & Regards,
Tommaso

> ---
>  drivers/reset/core.c             | 166 +++++++++++++++++++++++----------------
>  include/linux/reset-controller.h |  14 +++-
>  2 files changed, 112 insertions(+), 68 deletions(-)
> 
> diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> index 0817afe72de75f795d62e02451520726da7c9844..e33a9bc9f94fc6867be6efd32178658d99fc088f 100644
> --- a/drivers/reset/core.c
> +++ b/drivers/reset/core.c
> @@ -81,13 +81,13 @@ struct reset_control_array {
>  
>  /**
>   * struct reset_gpio_lookup - lookup key for ad-hoc created reset-gpio devices
> - * @of_args: phandle to the reset controller with all the args like GPIO number
> + * @ref_args: Reference to the reset controller with all the args like GPIO number
>   * @swnode: Software node containing the reference to the GPIO provider
>   * @list: list entry for the reset_gpio_lookup_list
>   * @adev: Auxiliary device representing the reset controller
>   */
>  struct reset_gpio_lookup {
> -	struct of_phandle_args of_args;
> +	struct fwnode_reference_args ref_args;
>  	struct fwnode_handle *swnode;
>  	struct list_head list;
>  	struct auxiliary_device adev;
> @@ -98,24 +98,24 @@ static const char *rcdev_name(struct reset_controller_dev *rcdev)
>  	if (rcdev->dev)
>  		return dev_name(rcdev->dev);
>  
> -	if (rcdev->of_node)
> -		return rcdev->of_node->full_name;
> +	if (rcdev->fwnode)
> +		return fwnode_get_name(rcdev->fwnode);
>  
>  	return NULL;
>  }
>  
>  /**
> - * of_reset_simple_xlate - translate reset_spec to the reset line number
> + * fwnode_reset_simple_xlate - translate reset_spec to the reset line number
>   * @rcdev: a pointer to the reset controller device
> - * @reset_spec: reset line specifier as found in the device tree
> + * @reset_spec: reset line specifier as found in firmware
>   *
> - * This static translation function is used by default if of_xlate in
> - * :c:type:`reset_controller_dev` is not set. It is useful for all reset
> - * controllers with 1:1 mapping, where reset lines can be indexed by number
> - * without gaps.
> + * This static translation function is used by default if neither fwnode_xlate
> + * not of_xlate in :c:type:`reset_controller_dev` is not set. It is useful for
> + * all reset controllers with 1:1 mapping, where reset lines can be indexed by
> + * number without gaps.
>   */
> -static int of_reset_simple_xlate(struct reset_controller_dev *rcdev,
> -				 const struct of_phandle_args *reset_spec)
> +static int fwnode_reset_simple_xlate(struct reset_controller_dev *rcdev,
> +				     const struct fwnode_reference_args *reset_spec)
>  {
>  	if (reset_spec->args[0] >= rcdev->nr_resets)
>  		return -EINVAL;
> @@ -129,9 +129,23 @@ static int of_reset_simple_xlate(struct reset_controller_dev *rcdev,
>   */
>  int reset_controller_register(struct reset_controller_dev *rcdev)
>  {
> -	if (!rcdev->of_xlate) {
> -		rcdev->of_reset_n_cells = 1;
> -		rcdev->of_xlate = of_reset_simple_xlate;
> +	if ((rcdev->of_node && rcdev->fwnode) || (rcdev->of_xlate && rcdev->fwnode_xlate))
> +		return -EINVAL;
> +
> +	if (!rcdev->of_node && !rcdev->fwnode) {
> +		rcdev->fwnode = dev_fwnode(rcdev->dev);
> +		if (!rcdev->fwnode)
> +			return -EINVAL;
> +	}
> +
> +	if (rcdev->of_node) {
> +		rcdev->fwnode = of_fwnode_handle(rcdev->of_node);
> +		rcdev->fwnode_reset_n_cells = rcdev->of_reset_n_cells;
> +	}
> +
> +	if (rcdev->fwnode && !rcdev->fwnode_xlate) {
> +		rcdev->fwnode_reset_n_cells = 1;
> +		rcdev->fwnode_xlate = fwnode_reset_simple_xlate;
>  	}
>  
>  	INIT_LIST_HEAD(&rcdev->reset_control_head);
> @@ -931,7 +945,7 @@ static int reset_create_gpio_aux_device(struct reset_gpio_lookup *rgpio_dev,
>  	adev->id = id;
>  	adev->name = "gpio";
>  	adev->dev.parent = parent;
> -	adev->dev.platform_data = &rgpio_dev->of_args;
> +	adev->dev.platform_data = &rgpio_dev->ref_args;
>  	adev->dev.release = reset_gpio_aux_device_release;
>  	device_set_node(&adev->dev, rgpio_dev->swnode);
>  
> @@ -951,18 +965,18 @@ static int reset_create_gpio_aux_device(struct reset_gpio_lookup *rgpio_dev,
>  	return 0;
>  }
>  
> -static void reset_gpio_add_devlink(struct device_node *np,
> +static void reset_gpio_add_devlink(struct fwnode_handle *fwnode,
>  				   struct reset_gpio_lookup *rgpio_dev)
>  {
>  	struct device *consumer;
>  
>  	/*
> -	 * We must use get_dev_from_fwnode() and not of_find_device_by_node()
> +	 * We must use get_dev_from_fwnode() and not ref_find_device_by_node()
>  	 * because the latter only considers the platform bus while we want to
>  	 * get consumers of any kind that can be associated with firmware
>  	 * nodes: auxiliary, soundwire, etc.
>  	 */
> -	consumer = get_dev_from_fwnode(of_fwnode_handle(np));
> +	consumer = get_dev_from_fwnode(fwnode);
>  	if (consumer) {
>  		if (!device_link_add(consumer, &rgpio_dev->adev.dev,
>  				     DL_FLAG_AUTOREMOVE_CONSUMER))
> @@ -982,15 +996,23 @@ static void reset_gpio_add_devlink(struct device_node *np,
>  	 */
>  }
>  
> +/* TODO: move it out into drivers/base/ */
> +static bool fwnode_reference_args_equal(const struct fwnode_reference_args *left,
> +					const struct fwnode_reference_args *right)
> +{
> +	return left->fwnode == right->fwnode && left->nargs == right->nargs &&
> +	       !memcmp(left->args, right->args, sizeof(left->args[0]) * left->nargs);
> +}
> +
>  /*
>   * @np: OF-node associated with the consumer
> - * @args: phandle to the GPIO provider with all the args like GPIO number
> + * @args: Reference to the GPIO provider with all the args like GPIO number
>   */
> -static int __reset_add_reset_gpio_device(struct device_node *np,
> -					 const struct of_phandle_args *args)
> +static int __reset_add_reset_gpio_device(struct fwnode_handle *fwnode,
> +					 const struct fwnode_reference_args *args)
>  {
>  	struct property_entry properties[3] = { };
> -	unsigned int offset, of_flags, lflags;
> +	unsigned int offset, flags, lflags;
>  	struct reset_gpio_lookup *rgpio_dev;
>  	struct device *parent;
>  	int ret, prop = 0;
> @@ -1001,7 +1023,7 @@ static int __reset_add_reset_gpio_device(struct device_node *np,
>  	 * args[1]: GPIO flags
>  	 * TODO: Handle other cases.
>  	 */
> -	if (args->args_count != 2)
> +	if (args->nargs != 2)
>  		return -ENOENT;
>  
>  	/*
> @@ -1012,7 +1034,7 @@ static int __reset_add_reset_gpio_device(struct device_node *np,
>  	lockdep_assert_not_held(&reset_list_mutex);
>  
>  	offset = args->args[0];
> -	of_flags = args->args[1];
> +	flags = args->args[1];
>  
>  	/*
>  	 * Later we map GPIO flags between OF and Linux, however not all
> @@ -1022,33 +1044,31 @@ static int __reset_add_reset_gpio_device(struct device_node *np,
>  	 * FIXME: Find a better way of translating OF flags to GPIO lookup
>  	 * flags.
>  	 */
> -	if (of_flags > GPIO_ACTIVE_LOW) {
> +	if (flags > GPIO_ACTIVE_LOW) {
>  		pr_err("reset-gpio code does not support GPIO flags %u for GPIO %u\n",
> -		       of_flags, offset);
> +		       flags, offset);
>  		return -EINVAL;
>  	}
>  
>  	struct gpio_device *gdev __free(gpio_device_put) =
> -		gpio_device_find_by_fwnode(of_fwnode_handle(args->np));
> +			gpio_device_find_by_fwnode(args->fwnode);
>  	if (!gdev)
>  		return -EPROBE_DEFER;
>  
>  	guard(mutex)(&reset_gpio_lookup_mutex);
>  
>  	list_for_each_entry(rgpio_dev, &reset_gpio_lookup_list, list) {
> -		if (args->np == rgpio_dev->of_args.np) {
> -			if (of_phandle_args_equal(args, &rgpio_dev->of_args)) {
> -				/*
> -				 * Already on the list, create the device link
> -				 * and stop here.
> -				 */
> -				reset_gpio_add_devlink(np, rgpio_dev);
> -				return 0;
> -			}
> +		if (fwnode_reference_args_equal(args, &rgpio_dev->ref_args)) {
> +			/*
> +			 * Already on the list, create the device link
> +			 * and stop here.
> +			 */
> +			reset_gpio_add_devlink(fwnode, rgpio_dev);
> +			return 0;
>  		}
>  	}
>  
> -	lflags = GPIO_PERSISTENT | (of_flags & GPIO_ACTIVE_LOW);
> +	lflags = GPIO_PERSISTENT | (flags & GPIO_ACTIVE_LOW);
>  	parent = gpio_device_to_device(gdev);
>  	properties[prop++] = PROPERTY_ENTRY_STRING("compatible", "reset-gpio");
>  	properties[prop++] = PROPERTY_ENTRY_GPIO("reset-gpios", parent->fwnode, offset, lflags);
> @@ -1058,43 +1078,43 @@ static int __reset_add_reset_gpio_device(struct device_node *np,
>  	if (!rgpio_dev)
>  		return -ENOMEM;
>  
> -	rgpio_dev->of_args = *args;
> +	rgpio_dev->ref_args = *args;
>  	/*
> -	 * We keep the device_node reference, but of_args.np is put at the end
> -	 * of __fwnode_reset_control_get(), so get it one more time.
> +	 * We keep the fwnode_handle reference, but ref_args.fwnode is put at
> +	 * the end of __fwnode_reset_control_get(), so get it one more time.
>  	 * Hold reference as long as rgpio_dev memory is valid.
>  	 */
> -	of_node_get(rgpio_dev->of_args.np);
> +	fwnode_handle_get(rgpio_dev->ref_args.fwnode);
>  
>  	rgpio_dev->swnode = fwnode_create_software_node(properties, NULL);
>  	if (IS_ERR(rgpio_dev->swnode)) {
>  		ret = PTR_ERR(rgpio_dev->swnode);
> -		goto err_put_of_node;
> +		goto err_put_fwnode;
>  	}
>  
>  	ret = reset_create_gpio_aux_device(rgpio_dev, parent);
>  	if (ret)
>  		goto err_del_swnode;
>  
> -	reset_gpio_add_devlink(np, rgpio_dev);
> +	reset_gpio_add_devlink(fwnode, rgpio_dev);
>  	list_add(&rgpio_dev->list, &reset_gpio_lookup_list);
>  
>  	return 0;
>  
>  err_del_swnode:
>  	fwnode_remove_software_node(rgpio_dev->swnode);
> -err_put_of_node:
> -	of_node_put(rgpio_dev->of_args.np);
> +err_put_fwnode:
> +	fwnode_handle_put(rgpio_dev->ref_args.fwnode);
>  	kfree(rgpio_dev);
>  
>  	return ret;
>  }
>  
> -static struct reset_controller_dev *__reset_find_rcdev(const struct of_phandle_args *args,
> -						       bool gpio_fallback)
> +static struct reset_controller_dev *
> +__reset_find_rcdev(const struct fwnode_reference_args *args, bool gpio_fallback)
>  {
> +	struct fwnode_reference_args *rc_args;
>  	struct reset_controller_dev *rcdev;
> -	struct of_phandle_args *rc_args;
>  
>  	lockdep_assert_held(&reset_list_mutex);
>  
> @@ -1103,10 +1123,10 @@ static struct reset_controller_dev *__reset_find_rcdev(const struct of_phandle_a
>  		    device_is_compatible(rcdev->dev, "reset-gpio")) {
>  			rc_args = dev_get_platdata(rcdev->dev);
>  
> -			if (of_phandle_args_equal(args, rc_args))
> +			if (fwnode_reference_args_equal(args, rc_args))
>  				return rcdev;
>  		} else {
> -			if (args->np == rcdev->of_node)
> +			if (args->fwnode == rcdev->fwnode)
>  				return rcdev;
>  		}
>  	}
> @@ -1120,27 +1140,26 @@ __fwnode_reset_control_get(struct fwnode_handle *fwnode, const char *id, int ind
>  {
>  	bool optional = flags & RESET_CONTROL_FLAGS_BIT_OPTIONAL;
>  	bool gpio_fallback = false;
> -	struct device_node *node = to_of_node(fwnode);
>  	struct reset_control *rstc = ERR_PTR(-EINVAL);
>  	struct reset_controller_dev *rcdev;
> -	struct of_phandle_args args;
> -	int rstc_id;
> +	struct fwnode_reference_args args;
> +	struct of_phandle_args of_args;
> +	int rstc_id = -EINVAL;
>  	int ret;
>  
>  	if (!fwnode)
>  		return ERR_PTR(-EINVAL);
>  
>  	if (id) {
> -		index = of_property_match_string(node,
> -						 "reset-names", id);
> +		index = fwnode_property_match_string(fwnode, "reset-names", id);
>  		if (index == -EILSEQ)
>  			return ERR_PTR(index);
>  		if (index < 0)
>  			return optional ? NULL : ERR_PTR(-ENOENT);
>  	}
>  
> -	ret = of_parse_phandle_with_args(node, "resets", "#reset-cells",
> -					 index, &args);
> +	ret = fwnode_property_get_reference_args(fwnode, "resets", "#reset-cells",
> +						 0, index, &args);
>  	if (ret == -EINVAL)
>  		return ERR_PTR(ret);
>  	if (ret) {
> @@ -1151,16 +1170,16 @@ __fwnode_reset_control_get(struct fwnode_handle *fwnode, const char *id, int ind
>  		 * There can be only one reset-gpio for regular devices, so
>  		 * don't bother with the "reset-gpios" phandle index.
>  		 */
> -		ret = of_parse_phandle_with_args(node, "reset-gpios", "#gpio-cells",
> -						 0, &args);
> +		ret = fwnode_property_get_reference_args(fwnode, "reset-gpios",
> +							 "#gpio-cells", 0, 0, &args);
>  		if (ret)
>  			return optional ? NULL : ERR_PTR(ret);
>  
>  		gpio_fallback = true;
>  
> -		ret = __reset_add_reset_gpio_device(node, &args);
> +		ret = __reset_add_reset_gpio_device(fwnode, &args);
>  		if (ret) {
> -			of_node_put(args.np);
> +			fwnode_handle_put(args.fwnode);
>  			return ERR_PTR(ret);
>  		}
>  	}
> @@ -1173,15 +1192,30 @@ __fwnode_reset_control_get(struct fwnode_handle *fwnode, const char *id, int ind
>  		goto out_put;
>  	}
>  
> -	if (WARN_ON(args.args_count != rcdev->of_reset_n_cells)) {
> +	if (WARN_ON(args.nargs != rcdev->fwnode_reset_n_cells)) {
>  		rstc = ERR_PTR(-EINVAL);
>  		goto out_put;
>  	}
>  
> -	rstc_id = rcdev->of_xlate(rcdev, &args);
> +	if (rcdev->of_xlate && is_of_node(fwnode)) {
> +		ret = of_parse_phandle_with_args(to_of_node(fwnode),
> +					 gpio_fallback ? "reset-gpios" : "resets",
> +					 gpio_fallback ? "#gpio-cells" : "#reset-cells",
> +					 gpio_fallback ? 0 : index,
> +					 &of_args);
> +		if (ret) {
> +			rstc = ERR_PTR(ret);
> +			goto out_put;
> +		}
> +
> +		rstc_id = rcdev->of_xlate(rcdev, &of_args);
> +		of_node_put(of_args.np);
> +	} else if (rcdev->fwnode_xlate) {
> +		rstc_id = rcdev->fwnode_xlate(rcdev, &args);
> +	}
>  	if (rstc_id < 0) {
>  		rstc = ERR_PTR(rstc_id);
> -		goto out_put;
> +			goto out_put;
>  	}
>  
>  	flags &= ~RESET_CONTROL_FLAGS_BIT_OPTIONAL;
> @@ -1190,7 +1224,7 @@ __fwnode_reset_control_get(struct fwnode_handle *fwnode, const char *id, int ind
>  		rstc = __reset_control_get_internal(rcdev, rstc_id, flags);
>  
>  out_put:
> -	of_node_put(args.np);
> +	fwnode_handle_put(args.fwnode);
>  
>  	return rstc;
>  }
> diff --git a/include/linux/reset-controller.h b/include/linux/reset-controller.h
> index 185d2a9bd7cd381ddc51c0f1643c4e3cb196015e..52a5a4e81f1844075210339bf7ffa46ec5ca6edf 100644
> --- a/include/linux/reset-controller.h
> +++ b/include/linux/reset-controller.h
> @@ -5,6 +5,8 @@
>  #include <linux/list.h>
>  #include <linux/mutex.h>
>  
> +struct fwnode_handle;
> +struct fwnode_reference_args;
>  struct reset_controller_dev;
>  
>  /**
> @@ -38,8 +40,12 @@ struct of_phandle_args;
>   * @of_node: corresponding device tree node as phandle target
>   * @of_reset_n_cells: number of cells in reset line specifiers
>   * @of_xlate: translation function to translate from specifier as found in the
> - *            device tree to id as given to the reset control ops, defaults
> - *            to :c:func:`of_reset_simple_xlate`.
> + *            device tree to id as given to the reset control ops
> + * @fwnode: firmware node associated with this device
> + * @fwnode_reset_n_cells: number of cells in reset line specifiers
> + * @fwnode_xlate: translation function to translate from firmware specifier to
> + *                id as given to the reset control ops, defaults to
> + *                :c:func:`fwnode_reset_simple_xlate`
>   * @nr_resets: number of reset controls in this reset controller device
>   * @lock: protects the reset control list from concurrent access
>   */
> @@ -53,6 +59,10 @@ struct reset_controller_dev {
>  	int of_reset_n_cells;
>  	int (*of_xlate)(struct reset_controller_dev *rcdev,
>  			const struct of_phandle_args *reset_spec);
> +	struct fwnode_handle *fwnode;
> +	int fwnode_reset_n_cells;
> +	int (*fwnode_xlate)(struct reset_controller_dev *rcdev,
> +			    const struct fwnode_reference_args *reset_spec);
>  	unsigned int nr_resets;
>  	struct mutex lock;
>  };
> 
> -- 
> 2.47.3
> 

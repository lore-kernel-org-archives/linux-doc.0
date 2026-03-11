Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011003.outbound.protection.outlook.com [40.107.74.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F11C3E0231;
	Wed, 11 Mar 2026 16:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773245234; cv=fail; b=guElmkgL2f5NNzEnojfXCj0eEUd2cJl6SZW1BvwHW/RGdYuRSjyAiD/A7h+ODUIzX/iCNIid6yme/gVhp87+eQ67Hc4kcQbuvSuNwk7CqIT5l75OliBgMwWDaWFZrjEsxCkMd19FxJDsHyT/7y2Z1Mpi5ZI5P3u/q19Y/qir+xw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773245234; c=relaxed/simple;
	bh=pk97Gw1u9g3lYy6oSxDbGrMt5T+qajjCFsB64EHwPMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pGQwQsvBca6429yF04hjODxwstpjVPd8R9u6O5HZdGfzjFap4FpXlDTE9saAAqyOgVvc+8aK7qslQhsf7RRYt64d/+19W8WidLAj7JZrJ4esCm9bKXO1iuZkTRo1iuAcJy9/bSTSJ9w4B3Asdzd0NY5sAwLOltCVatGOfFCP6uA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=hYLbzrhd; arc=fail smtp.client-ip=40.107.74.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="hYLbzrhd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UkHuYdkO3xppMTwLJb1wVAN1QM0xWhaqXAXw6W0pMd2aJKfeKlnmqvBmwPznYzyU85t6rxkT3+pGDU/QkZVbKzCByfmcOwJfXk21BtR1tdbWxd1YQfz/+blA/XGhl6TSMdxx7cUV5H9F4+0tQE5LhkkovRFlEQVWbNF8gAWQTmIeUJyYfX6JOarcklhl50bsDYDXEpihBNYhEZA1oEEHaCJuP4mEz0tDeZ9T1GaxXv7WZSi/O0CuFPl6GX89oGyr/RpEpkIReUJ6QVGPbCGfKXCplzNrxZtRJ14SHcwU1TJQjRuJ5Jx/3kDUBOJJnQ1FA9Dq5ezd+UpEWlpJikV49g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L3qNR7ELGUDdkWu1wJwDX4CrDOV00DGF1SOWJ0P8mTs=;
 b=BbGUzWAhhBkAKu/9IZnjIftu0HeyFOAnjgzzuPtOs5gGITM6LalcKpSswS6xuZgp1pWb1FK19RyJvJ8PTNYDUqZ01HLd8n+oNpAraeumCLA80g2i/ObW9e2fV1E+v7/Ey96cnCfEa4/Gabxu8ePIEPaCXgeFRN9gpqKTk2O1DVb72F+gANoTQA7m9DskVH9dA+O6nbuDUnKgV1l/LlTVcrRIxroJdER0CEpD7yAhar2ZIyBYyrtO9umsRZWoB1QT/RnWnM8g6MsO8QAQOmBkdkl+xE4uHJC64DSc/Ll/Sbz1nyis1S6CcNifLGg60+i80QJWGrTsZUt7majq0K3SyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3qNR7ELGUDdkWu1wJwDX4CrDOV00DGF1SOWJ0P8mTs=;
 b=hYLbzrhdIlkhxKg+oGDxoGf5gmQzPZxdCYx6bp1Oc/EvIt0bnErCzknvQ46wuN3K8FocHvfOc4Q1ueuvyYJj+LkfAYSZ0h9kIUWBXJybK9GZSEQT5nTWEq0UyXs0dqdhek2ReWFLlM5T0EX6yfchydopmAGWjwfN/KUHoPWQvv0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYWPR01MB9593.jpnprd01.prod.outlook.com (2603:1096:400:1a5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 16:07:06 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9700.013; Wed, 11 Mar 2026
 16:07:06 +0000
Date: Wed, 11 Mar 2026 17:06:52 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v3 13/14] reset: convert reset core to using firmware
 nodes
Message-ID: <abGTCWDGNx_EPJjH@tom-desktop>
References: <20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com>
 <20260306-reset-core-refactor-v3-13-599349522876@oss.qualcomm.com>
 <abGOrRSJNB6zC8Vz@tom-desktop>
 <CAMRc=Mfi7qJ2VvaUy-OQmV6hz_GjFstsHkt2iYyrTUPDgyKGCA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mfi7qJ2VvaUy-OQmV6hz_GjFstsHkt2iYyrTUPDgyKGCA@mail.gmail.com>
X-ClientProxiedBy: FR4P281CA0323.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::6) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYWPR01MB9593:EE_
X-MS-Office365-Filtering-Correlation-Id: 6847cefa-0968-4dcc-2112-08de7f883db1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	a+mwMe0erULaCGYfAnIJ7HkOu0C4N+YTFZwzuTIyQ8oIR0HOJgBKUsKqV368ceK37bw1HRpNTiS5snruQIJ+eltqtYrftMS2vAthiuiXZ5k+stXv6CEhurKUtHXeHp8/5ctcYc6wJctX8mb+/TzUV8Sb/ReUbC+1LvDC64G6/rGcBE137rRuBPOhrlGfTsBbWeZnWfzZbNk9l+pJCXAF58o/9QMkjWtx6B4yhLBhY1sAGigcJZ2BqzDCj/EN9JP6KHWacbv9qJYUgRs8YmBJioO6RM9CGCclHtcEx5ERtgstg5CpDHrQ9TmK7mFleOaw11i+cJUCQIB57tQM5dCRr7jx9/CBcrtdZ7KlRhNqyB/8W5jzBcgxOY73D+Oqckf1awK+FjGRZfS7Xq2Om2uvDvmbOfNRiP3Lug0fRia6b5hGh2Cv6dBsbYzZiA+2PbXZA5OJrzLCqKcRx9blVy57Zy0M1o/KAgvlSMHcfRweB8Sl4mgQ+Znw8DN93zpTsxh81URBOuCK8l+QsJDvu7iO/MdbhuIqYhNfArXFm+5RqMZJXCigUTiuRcJbikveDZBBGKqP/mAeVKI4hySNBVaji97iHld1S4vBMhFhKSD2HU/eFhE95NqW6Fz5P1PytNlCZ8yGHJVi2ZbPdrzcF4yLZ9+SxbxoZfFaGfIrOnkxcp6phTm7Sf1h3IN2ZHFkm/PEmNWhZM1AgWNasG3D6Vebz3Lx8JPFmrlQRUwHBUoKyIyNNVmAPk07JE2EqESeJj+rXNhQ+VoCjmGJQV6JBD23z971ZkZIrtih6B0j8kqAmkk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fVE5uWEkfNtWmn9BhOuR8uoS0hxPV7i05MTXZOGEuW+IR1QMQE5c2QP7Wp8o?=
 =?us-ascii?Q?J/gSuUKa8mEq3PHHnWBJk74tFcOcezWFwGdNBNbomVPNHrolJ5f32ublVF1z?=
 =?us-ascii?Q?Z/OvvtJR6eugGD0jiWPLFHhMPmIUCI7uvgS858TjNVIHakGUS7afA2ZMIoeU?=
 =?us-ascii?Q?9V/MO1PsI1ojhC3YlCMW5UP2fuiOoBkPpHh8VAtqukTrXX3LPXJoTMNmZvSZ?=
 =?us-ascii?Q?sPefDpJIfx52/MDQeTSf0zXcmHQZau+XBQTLMG7+K5DNpxyU6ORsgOLv10d1?=
 =?us-ascii?Q?vziN7htmIJ2IsX+Zo+tNoiT4gSOb5Ryaj7++FkMUBkmN/fY5hh93zNNvp+cu?=
 =?us-ascii?Q?Dv7pt8d4xNckZF0kKs1l1bxWnLa5vfB+f6p4R0WI7ngWOgyMrXHIj2phtKgB?=
 =?us-ascii?Q?7b1gtXU3++D7mwLzbvkOyY9aDBvijt6yT4gzxH0XW8KlbhhHa1dQnfQ7f2T1?=
 =?us-ascii?Q?h7BJgGcAx+GIVL/6oJNG5yIs6CB/cUh03qiABbMB9MJi+X+rgxUWrqG6MNSb?=
 =?us-ascii?Q?lhu8zZai3GbFY7hCRN3HzO0NT5rHsvQikG8bQqSrbwfs5UQJ6gCHmZGYrrEr?=
 =?us-ascii?Q?55GiGhI2AWP5pMoaDrjjCsxeM/BnX+PYBA56QNRMs7oe7MkAE8Ga/V9G8VYu?=
 =?us-ascii?Q?6JMZOkSUDJUWVhx+Z2ON3NUCR7tlFAaqzTTeiFJhTlisMiqmlWpAz6/sc/Gv?=
 =?us-ascii?Q?lQyE3ID0ccYvHcJSmpMo1E8DsL3mUkKpstEfAlg79EWU+kYw3LSTB9P92x+v?=
 =?us-ascii?Q?0BsNAQzvpPcH1q1LMgeUz7DALHDpp7FOy8jx3lcu3OJwmsUvwy6QqB5qOahA?=
 =?us-ascii?Q?30vH31IyP40v14TuBdkogG0cpXLS8YFOyKiHMDdSACkOw8Gc+yRoUfsyTah6?=
 =?us-ascii?Q?NJaNR6jPGNhxUJm8t9Nh9/L6kIw68RLRMErPKHDKuXf26/QtX+O1qzJni0uR?=
 =?us-ascii?Q?iY0I/dE9GW4CsqUl3fqiB3ZXm6NLpcCuDoO7K5lfto8yZk+BF3KEMfhgdCBc?=
 =?us-ascii?Q?wv/V7/ldKy/Tx94GHmm3pwHvkxG7xYIKptap+0RJiSALiXMDhYf5sGISelUL?=
 =?us-ascii?Q?tAAFOGTJrpl09CYPoylq4mCwyXScgYXIMmOTs3S/xJhi2J6xvdU2Pu4G5ML3?=
 =?us-ascii?Q?9leOLaZOghd31KFfLVGrcmHmD9R88MSNVeUIernOqFCPYgrkgZ+HscPZb6IL?=
 =?us-ascii?Q?oqPKHCLXbQaH9PFFrT1hpFkondKDodQcv7mDprqnQINJPJMsXVjCEK+Up9ua?=
 =?us-ascii?Q?v2whV3JNpbxuHKswtTACVb6uzDX3tm73JQdzmk0NCAqt+17PZVaCXoTg18DM?=
 =?us-ascii?Q?j7B9mENzOI2IO9IXMLiPsG3+Hr6m4iEGPlint4cUDPyxOtl3sAk1VC5tG3le?=
 =?us-ascii?Q?cEimNpiDWSmebs14pxfmDdXm83PhXFS0/fMlwq8qGnDte1kyWuTV4ZTm7D5Q?=
 =?us-ascii?Q?Suiyu17PsoHpm2oSyLRGXkuf0rb2UjRwrKeILsAySCLqSoxRJxcFPhXne8ZM?=
 =?us-ascii?Q?tarZJtQVjz3orJndUX2Kd+U537/QGnYKLK0r9PX3b0DYaWJQNfiftQ/Q1kUB?=
 =?us-ascii?Q?JFu/+eBvqkBYe9cQC5QSsJB6GwlO7GSChI3y1N5PAY9CnNun/qPb+DCfEEsT?=
 =?us-ascii?Q?JufF+KLh+bA++b+Yugdo+9cjgL7X320spzoXBVF1FEqjB5UMNqR12+g0Mmz/?=
 =?us-ascii?Q?/AqOv44JaaYaNLYoj196guKmavLKAHPwWA7TnthbbujkkWfyr5w/YZa/KSOV?=
 =?us-ascii?Q?DV5HXACjGjPTNITlq/BHdF/hPnnrcFuzICGoZREcd1ESEa6VmpQ6?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6847cefa-0968-4dcc-2112-08de7f883db1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 16:07:06.1909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /IMvcptOZTtngZiNcbA8XWIGtLuVnrkw+ql2xLBuTfyp/sI5+QuAYKhiFx1TU4jXVpJDw+6pnOVXrAD4O/ANTeytNmBpg1OCLoSYlMm8YWHzg+pv8EtKghn+A847rJNS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9593

Hi Bartosz,

On Wed, Mar 11, 2026 at 08:54:52AM -0700, Bartosz Golaszewski wrote:
> On Wed, 11 Mar 2026 16:47:57 +0100, Tommaso Merciai
> <tommaso.merciai.xr@bp.renesas.com> said:
> > Hi Bartosz,
> > Thanks for your patch.
> >
> > On Fri, Mar 06, 2026 at 06:22:57PM +0100, Bartosz Golaszewski wrote:
> >> With everything else now in place, we can convert the remaining parts of
> >> the reset subsystem to becoming fwnode-agnostic - meaning it will work
> >> with all kinds of firmware nodes, not only devicetree.
> >>
> >> To that end: extend struct reset_controller_dev with fields taking
> >> information relevant for using firmware nodes (which mirrors what we
> >> already do for OF-nodes) and limit using of_ APIs only to where it's
> >> absolutely necessary (mostly around the of_xlate callback).
> >>
> >> For backward compatibility of existing drivers we still support OF-nodes
> >> but firmware nodes become the preferred method.
> >>
> >> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >
> > Just to share I'm seeing the following on RZ/G3E (next-20260310):
> >
> > [   16.806538] ------------[ cut here ]------------
> > [   16.806546] WARNING: drivers/reset/core.c:1195 at __fwnode_reset_control_get+0x474/0x568, CPU#3: kworker/u16:0/11
> > [   16.806566] Modules linked in: reset_rzv2h_usb2phy(+) rcar_canfd(+) rtc_isl1208 can_dev ecdh_generic ecc rfkill renesas_rpc_if fuse drm backlight ipv6
> > [   16.806603] CPU: 3 UID: 0 PID: 11 Comm: kworker/u16:0 Not tainted 7.0.0-rc3-next-20260310-00016-g866b1999e3fc #17 PREEMPT
> > [   16.806610] Hardware name: Renesas SMARC EVK version 2 based on r9a09g047e57 (DT)
> > [   16.806615] Workqueue: events_unbound deferred_probe_work_func
> > [   16.806627] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > [   16.806632] pc : __fwnode_reset_control_get+0x474/0x568
> > [   16.806638] lr : __fwnode_reset_control_get+0x164/0x568
> > [   16.806644] sp : ffff800083263930
> > [   16.806646] x29: ffff800083263a30 x28: ffff0000ff8370a8 x27: ffff800081d8d590
> > [   16.806655] x26: ffff800081e3a6c8 x25: ffff800082fec430 x24: ffff800082fec450
> > [   16.806663] x23: 0000000000000000 x22: 0000000000000003 x21: ffff0000ff835940
> > [   16.806671] x20: 0000000000000000 x19: ffff0000c0294e98 x18: 00000000ffffffff
> > [   16.806679] x17: 6e6f637478652f79 x16: 68702d6273752e30 x15: 303230303835312f
> > [   16.806687] x14: ffff8000831a6200 x13: 00363038343d4d55 x12: 0000000000000000
> > [   16.806695] x11: 7478653d4d455453 x10: ffff8000827b0ab7 x9 : 0000000000000028
> > [   16.806703] x8 : 0101010101010101 x7 : 00000000736c6c65 x6 : 000000000080a3f0
> > [   16.806711] x5 : ffff800083263864 x4 : ffffffffff604034 x3 : 0000000000000000
> > [   16.806719] x2 : ffff0000c0128fc0 x1 : 0000000000000000 x0 : 0000000000000001
> > [   16.806727] Call trace:
> > [   16.806731]  __fwnode_reset_control_get+0x474/0x568 (P)
> > [   16.806738]  fwnode_reset_control_array_get+0x84/0x134
> > [   16.806745]  devm_reset_control_array_get+0x54/0xb4
> > [   16.806751]  rcar_gen3_phy_usb2_probe+0x108/0x5b8
> > [   16.806762]  platform_probe+0x5c/0x98
> > [   16.806770]  really_probe+0xbc/0x29c
> > [   16.806776]  __driver_probe_device+0x78/0x12c
> > [   16.806782]  driver_probe_device+0x3c/0x15c
> > [   16.806789]  __device_attach_driver+0xb8/0x134
> > [   16.806795]  bus_for_each_drv+0x88/0xe8
> > [   16.806802]  __device_attach+0xa0/0x190
> > [   16.806808]  device_initial_probe+0x50/0x54
> > [   16.806814]  bus_probe_device+0x38/0xa4
> > [   16.806820]  deferred_probe_work_func+0x88/0xc0
> > [   16.806826]  process_one_work+0x154/0x294
> > [   16.806835]  worker_thread+0x180/0x300
> > [   16.806840]  kthread+0x118/0x124
> > [   16.806847]  ret_from_fork+0x10/0x20
> > [   16.806856] ---[ end trace 0000000000000000 ]---
> > [   16.806867] phy_rcar_gen3_usb2 15800200.usb-phy: probe with driver phy_rcar_gen3_usb2 failed with error -22
> >
> > Hope this help.
> >
> > Thanks & Regards,
> > Tommaso
> >
> 
> Does [1] fix it?

Yes, thanks for sharing.
I will provide my Tested-by tag.

Kind Regards,
Tommaso

> 
> Bart
> 
> [1] https://lore.kernel.org/all/20260310151515.34681-1-bartosz.golaszewski@oss.qualcomm.com/
> 


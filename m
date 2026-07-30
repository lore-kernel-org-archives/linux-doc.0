Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010023.outbound.protection.outlook.com [52.101.56.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3872D35B636;
	Thu, 30 Jul 2026 16:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429607; cv=fail; b=Jc88ftFyEq5Irz5rHfvUZ1M4oZv9I+NmCF7er6tpwUchFw94V83jHsLCeXrDT4xCIl9G1oxF6CeAlbJnkiM68eZ9MqvhV5NInoJ3vyhK33z5dQpdVaOpyhwi8LLDrBF+SzxP8hfT9XyWO5a57RQ2SpKiTiyPOgW/Cg2we0h6qNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429607; c=relaxed/simple;
	bh=JQKeth8UfVq44Y/zzWDIqDK6Z+4hTdLlZS5Cc5z10iE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t8MBDkR3SLTAvwR6BWVEKMTGip8T9JJsO5kRRwGh/xM+tI2pyK3yNQ1ZDRb4k5RhEGert9bQzMvcgCbS4yapORyCrYWT6W6+n5nzyDTgpP/VjPRaw6Vl+CDl99WI12xbzZS9psD/ewBOCSHYTZ9/q1aKoC/oMH+1taJCUW+ZwfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=sD3/MrUY; arc=fail smtp.client-ip=52.101.56.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="sD3/MrUY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fCqsX5Hg8EN6/Vr2Upa/eATpRawocyFM8YNzGPHBvQUmRiBj07pUCYSIaZNSHncyrT9TOMeYxUkY5GUmQ/tH5MO7tB4IeoZI75zoxcbbc5wx+gkyTTMNvEuiV5jjmpFrRRcUwJixjw37upMq0LHilPlXZHJ8nEcbfNafZFA4Q7vWerFHE8HHZcWnUceNEmGHd3QtnRZ7DA+YsLMBEmOk1voqiBsVjdouf69G0Dg3pVSpjVWRfBGBKmhSKvbLq/ayIKLgKCOdhkMOcVP1EwoU/5eGKivrZChQS6UyzYubcGh/Eu21Azh7K+evYWvM7+L+wpBMgFwi4S1TOdfPgQQhUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D6bIrYe027PKp4s26Q+h3xw+04noXr3O2Vd1HgznqX0=;
 b=CSDoNNwvpBkx5h6OfCGCeH3LiMJJLM7PWbACz8uzjCcZoe6pE2acNlKDKsUHKXjS5+gmLj5m7YoNx8A17mICqvBGUbLSjqvJ4jllDs0mo92BPskwRr5FQHkqyDN6EQR3F1dbT3CsuPO/5+dt3zsRR59fZcNqt0MootB/i1O4Zvx2ldhPaUTDhjLuxEzqA8cU24RhG6bR94C6Z7DLTOIf/git+5iEo39A1X2cWA79wQpqbV/wAk5xIJNl2rUH0ypDDN3tnHeIIA23fKh+bVqL9/jUwVR6PGa2P+BH1w5rAOjQVkWGnjaYVudyTEGYfb3SUM8lVEyTh8e4acTkH9YdlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6bIrYe027PKp4s26Q+h3xw+04noXr3O2Vd1HgznqX0=;
 b=sD3/MrUYNiBFZM7UTB1aAFDRr+r+LNvUmfu53ZRO1CTFTDryMGaQJ0J9fqlLkDLOLOycyMWI5gVFxAKboFg5J8dLSA2ibTwpFMsXYzPJgcVSAAb7uG0HLMbc6kOKVyuhL/4OztyICHGzvq4wjltjIvCRcze+lEcXzoOC5Mtx1Dsg1bdN2HavXjQU9Jtea05qrFTeKs8eefzzfIRgHoBJTQqiMNqlZW0a6cD9erD5SoaLzypFaHUY0ZdWP99d+1IfbBSjLLqwJ7Xw0OTvhKF+rA+K8AS+IkDCHToSKOFarwx55+NAyjLmru4VhcmPmhfkQx5uXyBCWVPgobyonSZYZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from PH0PR03MB6560.namprd03.prod.outlook.com (2603:10b6:510:b2::12)
 by PH7PR03MB7267.namprd03.prod.outlook.com (2603:10b6:510:24e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Thu, 30 Jul
 2026 16:40:02 +0000
Received: from PH0PR03MB6560.namprd03.prod.outlook.com
 ([fe80::5364:bd7:85a:f07b]) by PH0PR03MB6560.namprd03.prod.outlook.com
 ([fe80::5364:bd7:85a:f07b%5]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 16:40:02 +0000
From: hang.suan.wang@altera.com
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Haren Myneni <haren@linux.ibm.com>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Gabriel Whigham <gabewhigham@gmail.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-doc@vger.kernel.org
Cc: muhammad.nazim.amirul.nazle.asmade@altera.com,
	tze.yee.ng@altera.com,
	chee.nouk.phoon@altera.com,
	genevieve.chan@altera.com,
	adrian.ho.yin.ng@altera.com
Subject: [PATCH v3 1/3] firmware: stratix10-svc: increase args array
Date: Thu, 30 Jul 2026 09:39:57 -0700
Message-ID: <afea81d9bdd6421ef9e943c8e6077fba980ee64e.1785413906.git.hang.suan.wang@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1785413906.git.hang.suan.wang@altera.com>
References: <cover.1785413906.git.hang.suan.wang@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0216.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::11) To PH0PR03MB6560.namprd03.prod.outlook.com
 (2603:10b6:510:b2::12)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR03MB6560:EE_|PH7PR03MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: 7678a10d-be3a-412e-8c85-08deee593412
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|7416014|56012099006|11063799006|10067099003|55112099003|18002099003|22082099003|3023799007|921020;
X-Microsoft-Antispam-Message-Info:
	6tq4iIW0668ZTkfdbwWoviOOEklxRErPIZR/zOU/leanie5bwPwIFIrnef3RHiGGUleKYZ0ZjwlwM1UU5Sxb8bkf+29Gd3UPdBSxLvSpZgft+7kwR/2/lBaWbku3Ue8WqN13L0gcfkonoW2IgB8CljXv/PI1OTrD3NVsHaG+MAI5dK2GtNTy/n7RKmUaoikfimxDQ8Otomo31rCyc7ighLp7aLiKruW+8pkgCFgTa0hOCcBdvf9GeGEX3sFHsYlltGg5llFw/Tiz5u4pGN3BM6d/tlvXbh0XEv4PItNljuZWGdtl3Fp3OckYMbzIjGYJ5RyrQDxPb7tBlG0ofNSwENy46TYSw1eJCf+UB6p/DmEUB4WnYP0vqHn7VOjFs4RYjHz1eprmV7PlZrS8JPEwtOiNs05iI1kH6buECpBGSVWZdgHfOTxImWVfeoyuXCZY3qAlK4murygKVpXSWm1+ydGk4u48bDptBcUtWgTBUHCpQS8tX1vrpAPA3PRQGFUZ4oamFmh4x8CZPcKVL2Fbx+7NzP4IV/kmUeII/QxYBNIbno85RZQAegNGEwkm/0NPOKnZwEbNgif66rmkj+ymHr674lnW5eWQWH3NNI2Le/hXceol+KI4vwJaZNAL0YzodugGRP+PcNLKq7dZyQHBYKWnjOsQH24K0ykSX8IF+rOUtaypKveQtvGVoOM3jBotY+JJYCel5+BaZz8ze7fXhQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6560.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(7416014)(56012099006)(11063799006)(10067099003)(55112099003)(18002099003)(22082099003)(3023799007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K2YWiRU1dPpofvxnS9UUjZC9C8xtjHPVhqcMaPtEV7PQQjGsdYQEeujtbQVn?=
 =?us-ascii?Q?WHw+XnJVfYnhDzjxgzuO+ik0nXvbxrFN6NXDJgt3tauXpjIk8OVucg/Jt5GG?=
 =?us-ascii?Q?fxt/qEC1OgATwkhIVm6WCkma5Zx/HWukuFluDYgf/ZpOJAgA42MpfL//FRC1?=
 =?us-ascii?Q?eybo33cLTxSA3LZDeZv6XigIRPPov2ztkUzxyYFLx4y6XF1yLyr51LhNYF6C?=
 =?us-ascii?Q?Yw8T1DoWyR3f9hSsE2Zp1KaVDBtIiNoa5bnS7kySfmRM3N/Dos6icKLx/Hvx?=
 =?us-ascii?Q?1vBAl3Q5SAoDI6z+MKdX7TCTZ4rKJHNKrBvJZ4S8xfMnNX6oiatNhPXjDSqG?=
 =?us-ascii?Q?Jo5VKhOTf4hzmcZGqOKbr2HNcGjzUqZ/pXvYc2leq2IXtnfnZpkZG0KTh9IW?=
 =?us-ascii?Q?JN885/OcXp6MQAt8f9Loqob+j2IrOp6KRj94wkjgJoo47jrLjvFB0O7FX8wk?=
 =?us-ascii?Q?5Z4PyANWW7AmKBAIXZhqPt/PcYoKPs+yBof/IS6d/hkBo8HISFAqGb2cJmU2?=
 =?us-ascii?Q?QT+LT17nz3zXv4r7PSawqQCa9XMg9LIiSl3hviGQNrFQBLrXczdjAzKZoeyZ?=
 =?us-ascii?Q?iqb2fySnM+Vqnf4wG/IGCsRiZw3vm6yEVOS63jToXxxSYHifJJTAJzx1iJPp?=
 =?us-ascii?Q?x3r0EsREda1KxM8dKy2NbdhFn4IMgo91J3Fz/qCKvMlM2Nro2Mg6UMWxM3VU?=
 =?us-ascii?Q?/di6ydgAU+WULSDHdi0OmyIwH3HrVcJBVQYRm/e4QFZrH/Cb156F6YCU1aST?=
 =?us-ascii?Q?IVfdb0ieZw/fIvYndsCyTamSZRevGN9XMUZhrm3fx38y3oC2P6x427BIUCjH?=
 =?us-ascii?Q?F1Xtyjoidu+GN8khGLAwsSqyudkzKZo2xMCJLr65qWLgD3GN7nnD3nMXYEJZ?=
 =?us-ascii?Q?5n1zn1YVy5uIJv8B3ccql0StLgxd1og591OUNbKc9+UqATRsqOVf6DXrRxd+?=
 =?us-ascii?Q?9JbembF7PHM0oa7M4ljqzXwPNCyye/INNJdZeZcc8kUhmo+CyjtWjT/ugKRl?=
 =?us-ascii?Q?OwF54I17ZHdRwQeh5HMp22koDpcRNo9FioDxKJ3kMX50sKVEov/5dAc0qMK8?=
 =?us-ascii?Q?ZfvZvpd9y6Z2WWZUFX6NgA6vvOK7It4jwJmzsy2xbK+EmRnqQYjMSdiQ1JQf?=
 =?us-ascii?Q?owYYeB1ygm4zpt3HBweKm5Qq3qoGWXy4u2D+y7C6FjcqMu+9pOiE7fyooTFQ?=
 =?us-ascii?Q?d6w2ttd3ei164Na3a4bbwS3Xr+BJ3sFT7oiM4SV7B2V8hsTaUPLPGs+YLGdz?=
 =?us-ascii?Q?3mwAOvFddD6SH2z5tejczQ+zI4bg742ovif0DvMkXmFMkXSbP9epb9MIJuB/?=
 =?us-ascii?Q?bdHhJSrL6uGUdnUSoBUdacvPMayZ5G677viwhleamaTXYAMFiT45SlDAb3b+?=
 =?us-ascii?Q?Imvyn1mGkMNXNZVOtbWnI99TS4bvL6xCP80auTeDR68WPsFVdUDqSQVy4q7j?=
 =?us-ascii?Q?5+KrIoix4OLZHVOO9RJeCN9LZ2nFgvVOvjJai5U+OhNqBmfR3w/gYj/4NcE2?=
 =?us-ascii?Q?OqOeCIMTNuqGd3NkLviLaQHm3P9d3BMl6CGNKkQ1aDHCj2XR7bN0jPWqCSEJ?=
 =?us-ascii?Q?N7ct7Dn/DF2u2YEogfRS2ZthAKBkMEFuXFnRlHMCWpDiYJu/4shfXcAlv7Jq?=
 =?us-ascii?Q?Zkql3Duv2HaRfoWAYGGvNqyH3yEgRhsPEdrq+uAs6SEms2cw2DS8zzuNvK+d?=
 =?us-ascii?Q?K6Qfn0We5mbi+rFroetqxktz24Lrsdlaf6seeOyUlRRV1DOUPpKPmGs9jKo5?=
 =?us-ascii?Q?UxTLhQCcbQ2EqMiyohBR0RO++k77lXA=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7678a10d-be3a-412e-8c85-08deee593412
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6560.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 16:40:02.7449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xbvxXK1MJl9DAobsmCxmUDBL0LbzsTGaTl667+mSFQsWEEsBmdal9Cw6Jbcb2pw1KBH7i7Xkak4NSVOAByVmMmwnAFuiqe68pl+t9nhWZeU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7267

From: Hang Suan Wang <hang.suan.wang@altera.com>

Increase args array from 3 to 6, for the SDOS encryption to call smc
call which is used for args to be passed via registers and not
physically mapped buffer.

Signed-off-by: Hang Suan Wang <hang.suan.wang@altera.com>
---
 drivers/firmware/stratix10-svc.c                    | 6 ++++--
 include/linux/firmware/intel/stratix10-svc-client.h | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index 5e20057ee344..d389be1c6690 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -169,7 +169,7 @@ struct stratix10_svc_data {
 	size_t size_output;
 	u32 command;
 	u32 flag;
-	u64 arg[3];
+	u64 arg[6];
 };
 
 /**
@@ -1797,7 +1797,9 @@ int stratix10_svc_send(struct stratix10_svc_chan *chan, void *msg)
 	p_data->arg[0] = p_msg->arg[0];
 	p_data->arg[1] = p_msg->arg[1];
 	p_data->arg[2] = p_msg->arg[2];
-	p_data->size = p_msg->payload_length;
+	p_data->arg[3] = p_msg->arg[3];
+	p_data->arg[4] = p_msg->arg[4];
+	p_data->arg[5] = p_msg->arg[5];
 	p_data->chan = chan;
 	pr_debug("%s: %s: put to FIFO pa=0x%016x, cmd=%x, size=%u\n",
 		 __func__,
diff --git a/include/linux/firmware/intel/stratix10-svc-client.h b/include/linux/firmware/intel/stratix10-svc-client.h
index 3edd93502bf8..190d89d602e9 100644
--- a/include/linux/firmware/intel/stratix10-svc-client.h
+++ b/include/linux/firmware/intel/stratix10-svc-client.h
@@ -210,7 +210,7 @@ struct stratix10_svc_client_msg {
 	void *payload_output;
 	size_t payload_length_output;
 	enum stratix10_svc_command_code command;
-	u64 arg[3];
+	u64 arg[6];
 };
 
 /**
-- 
2.43.7


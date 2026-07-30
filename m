Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010023.outbound.protection.outlook.com [52.101.56.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220AA38B14D;
	Thu, 30 Jul 2026 16:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429615; cv=fail; b=JiaJMgitHE2jXmW5pRp9jP7Xe/LIpC11fDGHBRCYCsOyyy4ofdPpOK6BvB1Nqgx7m/ALoDY+kjNduvn5LQoFCJByxPvWF8HvTs2jLtmbgOpsJgwcI6OPfYNSu4IxvPtK86mFmOt3xSxCkoSlUKLJTdoU7LewkH7h7DEsIzByUeY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429615; c=relaxed/simple;
	bh=BL26d1zSLJyXiXYUwbQAF25wby5GHXedfGzJEa/1wNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VgQ+vGFrlRsD0bt0Vy9630EwL7sCZHl9NgOLVvY9yYSf4gRZBXQ9hdKq3V798s5Ngk5WDH1R62dUDQUVO8Vio2qOTx6p/Ripuu92NUAb25pstRoF+Kv5ZdKU4NTAei+z8mKduqCe55WmRk7YbuxWQoLExmDJA7fDLMtoRgwhz8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=oX175y9F; arc=fail smtp.client-ip=52.101.56.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="oX175y9F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QumdtrQY1DztXIxIK0eiMdt6wnctzpwv6MPVLCDzxmMaCmbREZq4NgxISEmFng7Mt5J7Y7UxSpv4QMhU2MkSZ3hrsU5D2aTRUDK7yuIN/7NwcaoDkqIpx1xK7O3sdcZB676Xjv6IU+pZ+Q9K4MjBhRjnNmwLJ1mW4FeoSMQZdf4g/dWyJyWDRR7GFL6+EW0aNwaPE6VuNtsCQdiImU4N2bMisRV+S7BXM7QQJT8qG9dZBFk299md1tfE7JZCEB44SjzFkI0GJ3En0Px7+jz3FLiF7f+26oWJNfzfZ4gfgg9EfGyuu6l3+Zddy8N840K3zvg/g5IAvqmhA2HzmUfXyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xIhvgjOnvdq5eB6eZ8pO450z5+U3HHL2Ibx3agWDILE=;
 b=fEW26KcfTalbMCG83NeXVRPZBpWoTTHd9QLpaP37zRwK7lhYG9RKiqeRz+H5gR1Q9Yphz43UGsnAtk8amh+Cf7fWwttVpJ7DWrqt0ypkafoGeonedYGCAD1v2p2xPANKvdvd4fLBwpW/OOvDsW49sbQiUYCwxqwvJnIG60+nvzUA4k5Sb8lDn7hwiLdSrOWeQtTO2M2pG9VJZumERIwgb/QqcQKgjvVRjamueoea6RAUI3ENN1QiBov434Ok4RUTIZ2nKXeygtYIaItfg9nhFQGbKJe/DRgrT9RKx0HDnvVRrQBHt/OI/EoZogMFQg8awkGdlkK9FiCz+FGrQCn+1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xIhvgjOnvdq5eB6eZ8pO450z5+U3HHL2Ibx3agWDILE=;
 b=oX175y9F3IHnArKJ8GeUyJLd1LFDvNNKho9/e5M/Fgsdi5SxzcI1ZtHU3tUm3tNu6zg7FlczCbd9kVIsUfgl/XC0PQkihZPo7Rhg75vOZ+O5Fx1H6fzZWSpfkL5wnINGUcXc9nUHxuyL5WCo7pBldcTyWw0Ugf7P7kVU+4WyBG0RFk3xTnNrrwMfhYwFk25hjPwV5K1Boph4uTA9+u+Dp+Olwjl5ryoY80+SnrkVrOwU7Hx2fF7fZzjfSJqMRnwTYTQTaE6x9FG9hU8clEU1zSH7Xr3j2Te9OUB3Q5IdUy1HAw+zQkwn961d0v4p3oCoacBGhKsFgV+RZ/GNliPU8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from PH0PR03MB6560.namprd03.prod.outlook.com (2603:10b6:510:b2::12)
 by PH7PR03MB7267.namprd03.prod.outlook.com (2603:10b6:510:24e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Thu, 30 Jul
 2026 16:40:04 +0000
Received: from PH0PR03MB6560.namprd03.prod.outlook.com
 ([fe80::5364:bd7:85a:f07b]) by PH0PR03MB6560.namprd03.prod.outlook.com
 ([fe80::5364:bd7:85a:f07b%5]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 16:40:04 +0000
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
Subject: [PATCH v3 3/3] firmware: socfpga-fcs: add Altera SoCFPGA FCS driver with SDOS
Date: Thu, 30 Jul 2026 09:39:59 -0700
Message-ID: <4bc469ea8844ac09c1c17d49a33a7fa82c04ae32.1785413906.git.hang.suan.wang@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1785413906.git.hang.suan.wang@altera.com>
References: <cover.1785413906.git.hang.suan.wang@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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
X-MS-Office365-Filtering-Correlation-Id: e2ccd773-1394-463e-6973-08deee593534
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|7416014|56012099006|11063799006|5023799004|10067099003|6133799003|55112099003|18002099003|22082099003|3023799007|921020;
X-Microsoft-Antispam-Message-Info:
	iDm842ZMmPymLoc/Hp35nvkqN8V3dx90XzAOKiSLMysAPC7qAkQlPAZo0mJYPIpqHOXNJWkKa4FgfoAxlN+t7GRlIoRFmrU+xhrbmr20GDoMp2CqyjAoC8slF1LZlDzVn0e9UBSww2+GL+pPKOV6onS7a/mRDh1EMyJZp8TkHe8lm6Zkgl9pMzeaaEfjRYobhNDbz4pXAZfyGPflaNaYf8XfEuU8MiRTv27q9KjjG1GfRuWqizX5elK04BMbgzpvjRGfXPc1ewdnoeR61KzMTjzNM2GIK2ZEiBqhZx5Ym6gZKTjKqbnbaql5KFTaPBsVY/vyzYldZJZbzkmBZklMCxwA8sgpHQIhf6PCwR/5Pl80mW+IIktXUP0WW4uKamhNVi/V4xn79LiV36EQ9diDHzMq8pinVSnY7Hh9jlfus6ADP7owf2Owko4f5q2LMQFB4N/uunhKo/3EafCevfP3RgHc+iXhNZ1bh8m5+lF/lSC0X27Xcd9q2Vw81WO/u3C/n/a96D4jmrQMnN6OYFGmdZsE8lRSpMrJcjtjn+V9boJkYD9OE2QMn2NoWbMRAZtEPyu5pnZK9wamlSfnkNo7zeq3c/9sZUoFhLFkMyXGriWjEoTg2E/8G/CXjU5zviNBORMW+M6MZiZ13HpA8EJNbEPAQHGHLej7tV023bbVIMvUgyCWD35rUXlizN+YkoMcdoNT5N73abjob9c/ewqdkA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6560.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(7416014)(56012099006)(11063799006)(5023799004)(10067099003)(6133799003)(55112099003)(18002099003)(22082099003)(3023799007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVVTSm1GMFlzakZGNy81QWxMbWNxRVRjNzJhODFhbm5DdjRYSlZ4clI3bTdx?=
 =?utf-8?B?cnhZcXZxd1VlbXIrbENwMk9MdG9nYStzMkFlMjIzMHgwUE9OaU9UUGEzRnFH?=
 =?utf-8?B?RUl1UWRiS0kxTDhtdlh5QVNpNi9DZi84VlJ6NUZBS243SlZsbGRpR20wa0Qy?=
 =?utf-8?B?REFUSm1iYkk1WUFsS254ZVJSU1lQMUF4akFySlJ4aksyVWpIWWNFOUFSSERD?=
 =?utf-8?B?NEwwd1RIcnUvNE5IdThLanMwZ0JJWG1XTnZtY1h3eFVhSkg3cnhidmNkZWR3?=
 =?utf-8?B?enZyQ3FCdXdYT3kyVFBQc255bTJBU01hdk90REtvREJWMFRPNVdxRG43aGMv?=
 =?utf-8?B?YmdrZ0hrL0o4dXhyUU9sM1d3TEpsSG5LK1BpYXV0UTdzSnRYU0ZKVTRBY0Zv?=
 =?utf-8?B?OElGaHh1VmhGZmNScWpaYTdIbmJPUENjTVFPbUFOSTEzZzJ4TllreUtuQXpX?=
 =?utf-8?B?MkU0VUJ1ODNzeW45QjgvalA4ckVzem1tK2dZaFQ4SnIzYmVmSDFhdlZJQWQ4?=
 =?utf-8?B?MWpLR2Q1am5qWjI0UjZGZGxwMjN4RFVNWTZORkg4OU9PMFQxeTEvcnlsbitz?=
 =?utf-8?B?SE82WURCejBMajE5RDFLeDY3NHJJSzJCMUlhaDdsdUJ2ZG1WUE5tc1lsS2xD?=
 =?utf-8?B?aXo4cFRLdzNDSEgvTlE4WW9ua2tQZmdSdHQ2MzlLQVZ2dlZmcmFVdTBkeXZM?=
 =?utf-8?B?SGllYngwNDJoMm8rZ2p5TDhiS1g0b2dsZzdPd2tJVmNQY0lDd0JVSnVvNUN2?=
 =?utf-8?B?aFZCQ3ZSSHNBSkhueFZXd2NyQjBic3RHNlpnWEZEQmUvY0RCTUU1TUlJTnNj?=
 =?utf-8?B?K2dGbUJCM1VzVXhjKzNpZjRWcGRENkNaR1lZNWg2UzUzQ3RESmRxY1YrZmUv?=
 =?utf-8?B?bnlEalY5QTNlTVdqRm9JYjZ5VUpCQVdYWHJQNHd3MEwrU3Yyb1VwOFQ1bU5O?=
 =?utf-8?B?RGovTzRWRkpkakVDU2xOTFNDT2NGdHl0RWQ1eTFodkRWUWRLcHNnRmJQT1d5?=
 =?utf-8?B?VWdwYUczc2pZc0FlZzNVaDB4bHNWcXhkdFZ3M2VkWEwrMHhTaUo2dVFVYUho?=
 =?utf-8?B?ejlNNjFNMXVYM0VSRWIxSWhpNXQ0KzdYQTRNejlJam1YMXMxYk1wSXNDWlJ2?=
 =?utf-8?B?NUdlMk1MT2QyMTF0UEhReHZycklTYlpsYy9QSGt5Q3pUdDNrUjhqVU11WCtS?=
 =?utf-8?B?Q1Z3eGw5UVZiMHNxZUdiOHZDNDVPdGVIYzFiOUt6KzA0bUVGbDcyaHFvVVRS?=
 =?utf-8?B?QmdvV1ZIL3FpMDNXL3FoVmdBMVFlQkxZQmE3bm40dmhNck43T2RzZm11bGNn?=
 =?utf-8?B?UXBtWE5nVGhLQTEyT3ZoaTVaM1MyTXRvUmtocTJvendXbjRPak9nSW1rT2dC?=
 =?utf-8?B?RWFQZ0kwcFhrWExqMFROUU5KaWlHRGprOHdZTlVoTTRvdGRmQ2ZTa0dMREl2?=
 =?utf-8?B?U2lpQ001b0xxNTF6UGZxR29UcXBwV0MyVXJBdjdYRFUxUlZoRmFrNTUvb045?=
 =?utf-8?B?UlRnUGRXMVFySmFtYWc4RGxVL0NKTkJnRU80Ti9BOTVrb1R4U2ovQ0JaV2pn?=
 =?utf-8?B?ZWNKYVdNekRnWDdHR3Y1WkdpVlpRdVY1dGh2dFJ0ckpsczV3ZWdWQzhoc2pl?=
 =?utf-8?B?VEVDL3cyMldkM1JldE9WZjNUNHVxanFPT2pvY3V2K3J3TERFUklaUG5aMExp?=
 =?utf-8?B?am9FV3lISVNVWkx6b0U3MmkwNVFhUUhkNy9LUGlQQisxVHNpWm42M3hmblNI?=
 =?utf-8?B?elMwOXhFU0NTb1NNS05STXRZb1FQTVZERkU2Rnc2NkxBQkFxazZHYmRMV1ph?=
 =?utf-8?B?R3NSRTF2S25GcGtia3pENUpJOGU1bk9TaVd1ZG12K2ZVa2krNTFGWGpHdGhu?=
 =?utf-8?B?dXErNDB3bnZSczF6aXdOdThoMVlJamE3V290WHQzKzRLTjRWSk5tQkEwbWhH?=
 =?utf-8?B?elFmeEpRVFhGQ1B0a0hJbnkyd2tVVDFtMUM0M1FWZDREN2ttN1FkY044SkJY?=
 =?utf-8?B?MXpDV29MREx4NXJ2SGQ4QUVnbWpiZTIwdHNnVlZhVkg3NmxaTWhHd0N5Qysw?=
 =?utf-8?B?YnVOWERGMjJNREVVb3RReHRKdXowdUtrNFkvbERiR0JXZWl2T1RxUlVQUWVI?=
 =?utf-8?B?blZuZldRd2RSMzQ5M1M1Mk9GcE0wUUlEY3d4QlJCalNqR2xqYkowVTluVHow?=
 =?utf-8?B?a2l1ZUMwOXQya1dmOVJOKzZ6ekp2cDZObjkzOU8rRUtrS214SVp2K1dIeEtx?=
 =?utf-8?B?a2xVdDdtMGt3VFc4VUNVc2lLQnZCVHExekNrMEZ6SnhkL0tYazBQSCtvS1N4?=
 =?utf-8?B?NG42OXo5QThmNmFOQ3A2YmJTQlI0ak1Ud1FQUFMvOWFobHUxZjl4WTVZazhX?=
 =?utf-8?Q?QdEsfgyxEFIJULeU=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ccd773-1394-463e-6973-08deee593534
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6560.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 16:40:04.6692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5AqRuEjVz85V121m+quJ0YjniD2pwGFszRBXZWmWGgC0aEnDXYjgW0lBFCtCZyTG3w1vR1XQNYFai+EG2bSnlAzt0Hgn6ROkiFTY8yhC8AQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7267

From: Hang Suan Wang <hang.suan.wang@altera.com>

Add the Altera SoCFPGA Crypto Service (FCS) driver, which exposes the
Secure Data Object Service (SDOS) encrypt/decrypt operation to
non-secure host software.

The SDOS is the FCS feature that protects data at rest: the SDM encrypts
and decrypts using a key derived from a device-unique SDOS root key plus an
SDM-generated IV, so the host never handles raw key material or IVs. It
only submits plaintext it already owns and receives authenticated
ciphertext objects managed by the SDM. A primary use case is black key
provisioning, where operational keys are installed without ever appearing
in cleartext.

The driver is a standalone module and describes no hardware of its own.
It binds by name to the "stratix10-fcs" platform device that the
stratix10-svc driver registers in code, so no device-tree node is needed,
and detects the SoC by matching the service-layer compatible. It exposes
the following sysfs attributes. The SDOS requests are issued to the SDM
through the stratix10-svc asynchronous SIP SMC. Source and destination
buffers are taken from the service-layer memory pool so the SDM can reach
them via physical or SMMU-remapped addresses.

For encryption the SDM returns a structured object (metadata, IV, HMAC,
ciphertext); for decryption it validates the HMAC, recovers the parameters
from the object header, and enforces a 64-bit owner ID so that only the
creator of an object can decrypt it.

The SDOS driver will open crypto session in SDM and close the session
after use. During the usage, the session will be lock.

Signed-off-by: Hang Suan Wang <hang.suan.wang@altera.com>
---
 .../userspace-api/ioctl/ioctl-number.rst      |   1 +
 MAINTAINERS                                   |   9 +
 drivers/firmware/Kconfig                      |  17 +
 drivers/firmware/Makefile                     |   2 +
 drivers/firmware/socfpga-fcs-core.c           | 660 ++++++++++++++++++
 drivers/firmware/socfpga-fcs.c                | 227 ++++++
 include/linux/firmware/intel/socfpga-fcs.h    | 126 ++++
 include/uapi/misc/socfpga-fcs-crypto.h        |  29 +
 8 files changed, 1071 insertions(+)
 create mode 100644 drivers/firmware/socfpga-fcs-core.c
 create mode 100644 drivers/firmware/socfpga-fcs.c
 create mode 100644 include/linux/firmware/intel/socfpga-fcs.h
 create mode 100644 include/uapi/misc/socfpga-fcs-crypto.h

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 3f0ef1e27eb0..645d54ce1009 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -346,6 +346,7 @@ Code  Seq#    Include File                                             Comments
                                                                        <mailto:luzmaximilian@gmail.com>
 0xA5  20-2F  linux/surface_aggregator/dtx.h                            Microsoft Surface DTX driver
                                                                        <mailto:luzmaximilian@gmail.com>
+0xA6  00-1F  uapi/misc/socfpga-fcs-crypto.h                            Altera SoCFPGA FCS (Crypto Service)
 0xAA  00-3F  linux/uapi/linux/userfaultfd.h
 0xAB  00-1F  linux/nbd.h
 0xAC  00-1F  linux/raw.h
diff --git a/MAINTAINERS b/MAINTAINERS
index 62d53465ef9b..357d02f467dc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -946,6 +946,15 @@ ALPS PS/2 TOUCHPAD DRIVER
 R:	Pali Rohár <pali@kernel.org>
 F:	drivers/input/mouse/alps.*
 
+ALTERA FCS DRIVER
+M:	Hang Suan Wang <hang.suan.wang@altera.com>
+M:	Genevieve Chan <genevieve.chan@altera.com>
+L:	linux-arm-kernel@lists.infradead.org
+S:	Maintained
+F:	drivers/firmware/socfpga-fcs*
+F:	include/linux/firmware/intel/socfpga-fcs*
+F:	include/uapi/misc/socfpga-fcs*
+
 ALTERA MAILBOX DRIVER
 M:	Tien Sung Ang <tiensung.ang@altera.com>
 S:	Maintained
diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index 12dc70254842..5337e367fca1 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -172,6 +172,23 @@ config INTEL_STRATIX10_RSU
 
 	  Say Y here if you want Intel RSU support.
 
+config ALTERA_SOCFPGA_FCS
+	tristate "Altera SoCFPGA Crypto Services (FCS)"
+	depends on INTEL_STRATIX10_SERVICE
+	help
+	  Altera SoCFPGA Crypto Services (FCS) driver gives user space
+	  access to the crypto services of the Secure Device Manager (SDM)
+	  through the Intel Service Layer, with requests forwarded to Arm
+	  Trusted Firmware.
+
+	  The SDM executes or authorizes the requests using device-rooted
+	  security resources. Protected key material stays within the
+	  secure firmware boundary and is never exposed to non-secure host
+	  software.
+
+	  Say Y here to add support for Altera SoCFPGA Crypto Services
+	  (FCS).
+
 config MTK_ADSP_IPC
 	tristate "MTK ADSP IPC Protocol driver"
 	depends on MTK_ADSP_MBOX
diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index 4ddec2820c96..e9f52f0e5f7a 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -10,6 +10,8 @@ obj-$(CONFIG_EDD)		+= edd.o
 obj-$(CONFIG_DMIID)		+= dmi-id.o
 obj-$(CONFIG_INTEL_STRATIX10_SERVICE) += stratix10-svc.o
 obj-$(CONFIG_INTEL_STRATIX10_RSU)     += stratix10-rsu.o
+obj-$(CONFIG_ALTERA_SOCFPGA_FCS) += altera-fcs.o
+altera-fcs-y := socfpga-fcs.o socfpga-fcs-core.o
 obj-$(CONFIG_ISCSI_IBFT_FIND)	+= iscsi_ibft_find.o
 obj-$(CONFIG_ISCSI_IBFT)	+= iscsi_ibft.o
 obj-$(CONFIG_FIRMWARE_MEMMAP)	+= memmap.o
diff --git a/drivers/firmware/socfpga-fcs-core.c b/drivers/firmware/socfpga-fcs-core.c
new file mode 100644
index 000000000000..36192e89b0cf
--- /dev/null
+++ b/drivers/firmware/socfpga-fcs-core.c
@@ -0,0 +1,660 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Altera Corporation
+ */
+
+#include <linux/delay.h>
+#include <linux/of.h>
+#include <linux/slab.h>
+#include <linux/uaccess.h>
+#include <linux/unaligned.h>
+#include <linux/firmware/intel/socfpga-fcs.h>
+#include <linux/firmware/intel/stratix10-svc-client.h>
+
+#define OWNER_ID_OFFSET				12
+
+#define SDOS_DECRYPTION_REPROVISION_KEY_WARN	0x102
+#define SDOS_DECRYPTION_NOT_LATEST_KEY_WARN	0x103
+
+#define MSG_RETRY				3
+#define FCS_RETRY_SLEEP_MS			1
+
+static struct socfpga_fcs_priv *priv;
+
+/**
+ * fcs_atf_version_callback() - service-layer callback for the ATF version query
+ * @client: pointer to the stratix10-svc client
+ * @data: pointer to the service-layer callback data
+ *
+ * Store the returned Arm Trusted Firmware version (or mailbox error) in @priv
+ * and signal completion to the waiting caller.
+ */
+static void fcs_atf_version_callback(struct stratix10_svc_client *client,
+				     struct stratix10_svc_cb_data *data)
+{
+	struct socfpga_fcs_priv *p = client->priv;
+
+	p->status = data->status;
+	if (data->status == BIT(SVC_STATUS_OK)) {
+		p->status = 0;
+		p->atf_version[0] = *((unsigned int *)data->kaddr1);
+		p->atf_version[1] = *((unsigned int *)data->kaddr2);
+		p->atf_version[2] = *((unsigned int *)data->kaddr3);
+	} else if (data->status == BIT(SVC_STATUS_ERROR)) {
+		p->status = *((unsigned int *)data->kaddr1);
+		dev_err(client->dev, "mbox_error=0x%x\n", p->status);
+	}
+
+	complete(&p->completion);
+}
+
+/**
+ * fcs_async_callback() - completion callback for an async service request
+ * @ptr: pointer to the completion to signal
+ */
+static void fcs_async_callback(void *ptr)
+{
+	if (ptr)
+		complete(ptr);
+}
+
+/**
+ * fcs_svc_send_request() - build and send an FCS command to the service layer
+ * @command: FCS command code to dispatch
+ * @timeout: time to wait for completion, in milliseconds
+ *
+ * Build the service-layer message for @command and send it through the
+ * stratix10-svc service driver, using the synchronous path for the ATF version
+ * query and the asynchronous mailbox path (with retries) for the remaining
+ * commands.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+static int fcs_svc_send_request(enum fcs_command_code command,
+				unsigned long timeout)
+{
+	struct fcs_cmd_context *k_ctx = &priv->k_ctx;
+	struct stratix10_svc_cb_data data;
+	void *handle = NULL;
+	int status, index;
+	int ret = 0;
+	struct stratix10_svc_client_msg *msg = kzalloc(sizeof(*msg), GFP_KERNEL);
+	unsigned long deadline = jiffies + msecs_to_jiffies(timeout);
+
+	priv->status = 0;
+	priv->resp = 0;
+
+	switch (command) {
+	case FCS_DEV_CRYPTO_OPEN_SESSION:
+		pr_debug("Sending command: COMMAND_FCS_CRYPTO_OPEN_SESSION\n");
+		msg->command = COMMAND_FCS_CRYPTO_OPEN_SESSION;
+		break;
+
+	case FCS_DEV_CRYPTO_CLOSE_SESSION:
+		pr_debug("Sending command: COMMAND_FCS_CRYPTO_CLOSE_SESSION with session_id: 0x%x\n",
+			 priv->session_id);
+		msg->arg[0] = priv->session_id;
+		msg->command = COMMAND_FCS_CRYPTO_CLOSE_SESSION;
+		break;
+
+	case FCS_DEV_ATF_VERSION:
+		pr_debug("Sending command: COMMAND_SMC_ATF_BUILD_VER\n");
+		msg->command = COMMAND_SMC_ATF_BUILD_VER;
+		break;
+
+	case FCS_DEV_SDOS_DATA_EXT:
+		pr_debug("Sending command: COMMAND_FCS_SDOS_DATA_EXT with session_id: 0x%x, context_id: 0x%x, op_mode: 0x%x, own: 0x%llx\n",
+			 priv->session_id, k_ctx->sdos.context_id,
+			 k_ctx->sdos.op_mode, k_ctx->sdos.own);
+		msg->arg[0] = priv->session_id;
+		msg->arg[1] = k_ctx->sdos.context_id;
+		msg->arg[2] = k_ctx->sdos.op_mode;
+		msg->arg[3] = k_ctx->sdos.own;
+		msg->payload = k_ctx->sdos.src;
+		msg->payload_length = k_ctx->sdos.src_size;
+		msg->payload_output = k_ctx->sdos.dst;
+		msg->payload_length_output = *k_ctx->sdos.dst_size;
+		msg->command = COMMAND_FCS_SDOS_DATA_EXT;
+		break;
+
+	default:
+		pr_err("Unknown command: 0x%x\n", command);
+		ret = -EINVAL;
+		break;
+	}
+
+	if (ret) {
+		kfree(msg);
+		return ret;
+	}
+
+	if (command == FCS_DEV_ATF_VERSION) {
+		reinit_completion(&priv->completion);
+
+		/*
+		 * receive_cb is a persistent field on the shared client and
+		 * is only consumed by the synchronous stratix10_svc_send()
+		 * path. Set it immediately before the send and clear it right
+		 * after so it is non-NULL only for the duration of this
+		 * transaction. This keeps the callback correct per command and
+		 * prevents a future synchronous caller from silently
+		 * inheriting a stale fcs_atf_version_callback.
+		 */
+		priv->client.receive_cb = fcs_atf_version_callback;
+
+		ret = stratix10_svc_send(priv->chan, msg);
+		if (ret) {
+			pr_err("failed to send message to service channel\n");
+			priv->client.receive_cb = NULL;
+			goto fun_ret;
+		}
+
+		if (!wait_for_completion_timeout(&priv->completion,
+						 msecs_to_jiffies(timeout))) {
+			pr_err("svc timeout to get completed status\n");
+			ret = -ETIMEDOUT;
+		}
+fun_ret:
+		kfree(msg);
+		return ret;
+	}
+
+	/*
+	 * Use the device-lifetime priv->completion as the async callback arg
+	 * rather than an on-stack completion: on a timeout/abort this function
+	 * returns while the svc layer still holds a pointer to it in the
+	 * transaction handle, so a stack object would be freed under it. FCS
+	 * serializes commands under priv->lock (one in-flight), so reusing
+	 * priv->completion here is safe.
+	 */
+	reinit_completion(&priv->completion);
+
+	for (index = 0; index < MSG_RETRY; index++) {
+		status = stratix10_svc_async_send(priv->chan, msg, &handle,
+						  fcs_async_callback,
+						  &priv->completion);
+		if (status == 0)
+			break;
+		msleep(FCS_RETRY_SLEEP_MS);
+	}
+
+	if (!handle || status != 0) {
+		pr_err("Failed to send async message\n");
+		kfree(msg);
+		return status;
+	}
+
+	ret = -ETIMEDOUT;
+	while (!time_after(jiffies, deadline)) {
+		status = stratix10_svc_async_poll(priv->chan, handle, &data);
+
+		if (status == 0) {
+			ret = 0;
+			break;
+		}
+
+		/*
+		 * -EAGAIN means the SDM is still processing. Other transient
+		 * poll errors can also surface on the first polls, before the
+		 * SDM has produced its initial response. Since the async send
+		 * already succeeded, keep polling until the deadline instead of
+		 * bailing out on the first non-zero status: abandoning an
+		 * in-flight transaction here would orphan the SDM-side session
+		 * (the SDM allows only one crypto session at a time), causing
+		 * later commands to be rejected. Record the last status so the
+		 * caller sees the real error if the deadline is reached.
+		 */
+		ret = status;
+		msleep(FCS_RETRY_SLEEP_MS);
+	}
+
+	if (ret) {
+		pr_err("Failed to poll async message\n");
+		goto out;
+	}
+
+	priv->status = data.status;
+
+	/*
+	 * A non-zero SDM mailbox status is a firmware-level result, not a
+	 * transport failure. Record it in priv->status and return transport
+	 * success so the caller can relay the exact code to user space
+	 * (error_code) and choose how to fail; do not overload -EFAULT here.
+	 */
+	if (data.status) {
+		pr_err("%s: SDM mailbox status 0x%x\n", __func__, data.status);
+		priv->resp = 0;
+		goto out;
+	}
+
+	if (data.kaddr1)
+		priv->resp = *((u32 *)data.kaddr1);
+	else
+		priv->resp = 0;
+
+out:
+	stratix10_svc_async_done(priv->chan, handle);
+	kfree(msg);
+
+	return ret;
+}
+
+/**
+ * fcs_open_session_locked() - open a crypto session on the SDM
+ *
+ * Enforce the single-session rule and, on success, record the SDM session
+ * handle in @priv->session_id and generate the associated session UUID. The
+ * caller must hold @priv->lock (taken by fcs_acquire_cmd_ctx()). This helper
+ * never touches user space; @priv->status carries the mailbox status.
+ *
+ * Return: 0 on success, -EBUSY if a session is already open, or negative
+ *         errno on transport/mailbox failure.
+ */
+static int fcs_open_session_locked(void)
+{
+	int ret;
+
+	if (priv->session_id)
+		/* SDM allows one crypto session at a time */
+		return -EBUSY;
+
+	ret = fcs_svc_send_request(FCS_DEV_CRYPTO_OPEN_SESSION,
+				   SVC_FCS_REQUEST_TIMEOUT_MS);
+	if (ret)
+		return ret;
+
+	if (priv->status)
+		return -EIO;
+
+	uuid_gen(&priv->uuid_id);
+	priv->session_id = priv->resp;
+
+	return 0;
+}
+
+/**
+ * fcs_close_session_locked() - close the crypto session on the SDM
+ *
+ * Close the currently open session, if any. The caller must hold
+ * @priv->lock. The local session handle is dropped unconditionally so that a
+ * failed or stuck close cannot permanently occupy the single-session slot and
+ * lock out future opens. @priv->status carries the mailbox status.
+ *
+ * Return: 0 on success or when no session is open, negative errno otherwise.
+ */
+static int fcs_close_session_locked(void)
+{
+	int ret;
+
+	if (!priv->session_id)
+		/* nothing to close */
+		return 0;
+
+	ret = fcs_svc_send_request(FCS_DEV_CRYPTO_CLOSE_SESSION,
+				   SVC_FCS_REQUEST_TIMEOUT_MS);
+
+	priv->session_id = 0;
+	priv->session_owner = NULL;
+	memset(&priv->uuid_id, 0, sizeof(priv->uuid_id));
+
+	if (!ret && priv->status)
+		ret = -EIO;
+
+	return ret;
+}
+
+/**
+ * fcs_session_set_owner() - record the open file that owns the session
+ * @file: open file that opened the session (identity only)
+ *
+ * The caller must hold @priv->lock (taken by fcs_acquire_cmd_ctx()).
+ */
+void fcs_session_set_owner(const struct file *file)
+{
+	if (priv)
+		priv->session_owner = file;
+}
+
+/**
+ * fcs_session_release() - close a session left open by a departing file
+ * @file: open file being released
+ *
+ * Close the crypto session if @file is the one that opened it. Used by the
+ * misc-device .release path so a session opened via the explicit ioctl is
+ * torn down when its owning fd is closed, including on process crash/exit.
+ */
+void fcs_session_release(const struct file *file)
+{
+	if (!priv)
+		return;
+
+	mutex_lock(&priv->lock);
+	if (priv->session_owner == file)
+		fcs_close_session_locked();
+	mutex_unlock(&priv->lock);
+}
+
+/**
+ * fcs_get_atf_version() - return the cached Arm Trusted Firmware version
+ * @version: array of three u32 entries to receive the major, minor and patch
+ *           version numbers
+ */
+void fcs_get_atf_version(u32 *version)
+{
+	memcpy(version, priv->atf_version, sizeof(priv->atf_version));
+}
+
+/**
+ * fcs_sdos_crypt() - perform an SDOS encrypt or decrypt operation
+ * @k_ctx: pointer to the kernel-side FCS command context
+ *
+ * Allocate service-layer source and destination buffers, copy the input from
+ * user space, drive the SDOS data command and copy the result and length back
+ * to user space. The operation direction is selected by @k_ctx->sdos.op_mode.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int fcs_sdos_crypt(struct fcs_cmd_context *const k_ctx)
+{
+	void *s_buf = NULL, *d_buf = NULL;
+	struct fcs_cmd_context ctx;
+	u32 output_size;
+	u32 dst_cap;
+	int ret = 0;
+
+	memcpy(&ctx, k_ctx, sizeof(struct fcs_cmd_context));
+
+	if (!ctx.sdos.dst || !ctx.sdos.dst_size)
+		return -EINVAL;
+
+	/* Caller-provided output buffer capacity (in/out parameter) */
+	if (copy_from_user(&dst_cap, ctx.sdos.dst_size, sizeof(dst_cap)))
+		return -EFAULT;
+
+	if (ctx.sdos.op_mode) {
+		output_size = SDOS_ENCRYPTED_MAX_SZ;
+		/* encrypt: input is header + plaintext */
+		if (ctx.sdos.src_size < SDOS_DECRYPTED_MIN_SZ ||
+		    ctx.sdos.src_size > SDOS_DECRYPTED_MAX_SZ) {
+			pr_err("Invalid SDOS src_size %u\n", ctx.sdos.src_size);
+			return -EINVAL;
+		}
+	} else {
+		output_size = SDOS_DECRYPTED_MAX_SZ;
+		/* decrypt: input is header + plaintext + HMAC */
+		if (ctx.sdos.src_size < SDOS_ENCRYPTED_MIN_SZ ||
+		    ctx.sdos.src_size > SDOS_ENCRYPTED_MAX_SZ) {
+			pr_err("Invalid SDOS src_size %u\n", ctx.sdos.src_size);
+			return -EINVAL;
+		}
+	}
+
+	/*
+	 * SDOS is a single-shot operation: open a dedicated crypto session,
+	 * run the command and close the session before returning. The
+	 * single-session guard makes this fail with -EBUSY if a session (for
+	 * example a multi-step sequence) is already active.
+	 */
+	ret = fcs_open_session_locked();
+	if (ret) {
+		pr_err("SDOS: failed to open session ret: %d\n", ret);
+		return ret;
+	}
+
+	s_buf = stratix10_svc_allocate_memory(priv->chan, ctx.sdos.src_size);
+	if (IS_ERR(s_buf)) {
+		ret = -ENOMEM;
+		pr_err("Failed to allocate memory for SDOS input data kernel buffer ret: %d\n",
+		       ret);
+		goto close_session;
+	}
+
+	/*
+	 * The remaining k_ctx writes intentionally target priv->k_ctx (k_ctx
+	 * points at it): fcs_svc_send_request() reads the outgoing request from
+	 * priv->k_ctx, so the kernel buffers and params are staged there rather
+	 * than in the local ctx snapshot. dst_size must point at device-lifetime
+	 * storage (priv->sdos_output_size), never a caller stack variable, so
+	 * the staged pointer cannot dangle after this function returns.
+	 */
+	priv->sdos_output_size = output_size;
+	k_ctx->sdos.dst_size = &priv->sdos_output_size;
+
+	d_buf = stratix10_svc_allocate_memory(priv->chan, output_size);
+	if (IS_ERR(d_buf)) {
+		ret = -ENOMEM;
+		pr_err("Failed to allocate memory for SDOS output kernel buffer ret: %d\n", ret);
+		goto free_sbuf;
+	}
+
+	/* Copy the user space input data to the input data kernel buffer */
+	ret = copy_from_user(s_buf, ctx.sdos.src,
+			     ctx.sdos.src_size) ? -EFAULT : 0;
+	if (ret) {
+		pr_err("Failed to copy SDOS data from user to kernel buffer ret: %d\n", ret);
+		goto free_dbuf;
+	}
+
+	/* Owner ID is stored little-endian in the SDOS header (offset 12) */
+	k_ctx->sdos.own = get_unaligned_le64((u8 *)s_buf + OWNER_ID_OFFSET);
+	k_ctx->sdos.src = s_buf;
+	k_ctx->sdos.dst = d_buf;
+
+	ret = fcs_svc_send_request(FCS_DEV_SDOS_DATA_EXT,
+				   SVC_FCS_REQUEST_TIMEOUT_MS);
+
+	if (ret) {
+		/*
+		 * Transport failure or timeout. The service layer has already
+		 * completed the transaction (async_done); free the buffers and
+		 * close the session on the way out.
+		 */
+		pr_err("Failed to send the cmd=%d,ret=%d\n", FCS_DEV_SDOS_DATA_EXT, ret);
+		goto free_dbuf;
+	}
+	if (priv->status &&
+	    priv->status != SDOS_DECRYPTION_REPROVISION_KEY_WARN &&
+	    priv->status != SDOS_DECRYPTION_NOT_LATEST_KEY_WARN) {
+		ret = -EIO;
+		pr_err("Failed to perform SDOS operation ret: %d Mailbox Status = 0x%x\n",
+		       ret, priv->status);
+		goto copy_mbox_status;
+	}
+
+	/*
+	 * priv->resp is reported by firmware; never trust it to read back
+	 * more than the kernel output buffer (d_buf) actually holds,
+	 * otherwise the copy below would leak adjacent kernel memory.
+	 */
+	if (priv->resp > output_size) {
+		pr_err("SDOS output %u exceeds kernel buffer %u\n",
+		       priv->resp, output_size);
+		ret = -EIO;
+		goto copy_mbox_status;
+	}
+
+	/* Do not write past the caller-provided output buffer */
+	if (priv->resp > dst_cap) {
+		pr_err("SDOS output %u exceeds caller buffer %u\n",
+		       priv->resp, dst_cap);
+		ret = -EMSGSIZE;
+		goto copy_mbox_status;
+	}
+
+	/* Copy the encrypted/decrypted output from kernel space to user space */
+	ret = copy_to_user(ctx.sdos.dst, d_buf, priv->resp) ? -EFAULT : 0;
+	if (ret) {
+		pr_err("Failed to copy encrypted output to user ret: %d\n", ret);
+		goto copy_mbox_status;
+	}
+
+	/* Copy the encrypted output length from kernel space to user space */
+	ret = copy_to_user(ctx.sdos.dst_size, &priv->resp,
+			   sizeof(priv->resp)) ? -EFAULT : 0;
+	if (ret)
+		pr_err("Failed to copy encrypted output length to user ret: %d\n", ret);
+
+copy_mbox_status:
+	if (copy_to_user(ctx.error_code_addr, &priv->status,
+			 sizeof(priv->status))) {
+		pr_err("Failed to copy mailbox status code to user\n");
+		/* surface the copy failure only if nothing failed earlier */
+		if (!ret)
+			ret = -EFAULT;
+	}
+free_dbuf:
+	stratix10_svc_free_memory(priv->chan, d_buf);
+free_sbuf:
+	stratix10_svc_free_memory(priv->chan, s_buf);
+close_session:
+	/* Best-effort close; local session state is dropped regardless. */
+	fcs_close_session_locked();
+
+	return ret;
+}
+
+/**
+ * fcs_acquire_cmd_ctx() - take the FCS lock and return the command context
+ *
+ * Serialises access to the shared command context across concurrent callers.
+ * The caller must release it with fcs_release_cmd_ctx().
+ *
+ * Return: pointer to the locked FCS command context, or NULL if the driver is
+ *         not initialised.
+ */
+struct fcs_cmd_context *fcs_acquire_cmd_ctx(void)
+{
+	if (!priv)
+		return NULL;
+
+	mutex_lock(&priv->lock);
+	return &priv->k_ctx;
+}
+
+/**
+ * fcs_release_cmd_ctx() - release the FCS command context lock
+ * @k_ctx: pointer to the FCS command context previously acquired
+ */
+void fcs_release_cmd_ctx(struct fcs_cmd_context *const k_ctx)
+{
+	mutex_unlock(&priv->lock);
+}
+
+/**
+ * fcs_read_version_from_atf() - query the Arm Trusted Firmware build version
+ *
+ * Send the ATF version command to the SDM and cache the result in @priv.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+static int fcs_read_version_from_atf(void)
+{
+	int ret = 0;
+
+	ret = fcs_svc_send_request(FCS_DEV_ATF_VERSION,
+				   SVC_FCS_REQUEST_TIMEOUT_MS);
+	if (ret) {
+		pr_err("Failed to send the cmd=%d,ret=%d\n", FCS_DEV_ATF_VERSION, ret);
+		return ret;
+	}
+
+	if (priv->status) {
+		ret = -EIO;
+		pr_err("Mailbox error, Failed to read ATF version ret: %d\n", ret);
+	}
+
+	stratix10_svc_done(priv->chan);
+
+	return ret;
+}
+
+/**
+ * fcs_init() - allocate and initialise the FCS private state
+ * @dev: pointer to fcs device
+ *
+ * Allocate @priv, request the service channel, register the async client,
+ * and read the ATF version.
+ *
+ * Return: 0 on success, -EPROBE_DEFER or negative errno on failure.
+ */
+int fcs_init(struct device *dev)
+{
+	int ret;
+
+	if (priv)
+		/* singleton: one FCS instance only */
+		return -EBUSY;
+
+	priv = devm_kzalloc(dev, sizeof(struct socfpga_fcs_priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	mutex_init(&priv->lock);
+
+	priv->dev = dev;
+	priv->client.dev = dev;
+	priv->client.receive_cb = NULL;
+	priv->client.priv = priv;
+
+	priv->chan = stratix10_svc_request_channel_byname(&priv->client,
+							  SVC_CLIENT_FCS);
+	if (IS_ERR(priv->chan)) {
+		pr_err("couldn't get service channel %s\n", SVC_CLIENT_FCS);
+		ret = -EPROBE_DEFER;
+		goto err_clear;
+	}
+
+	ret = stratix10_svc_add_async_client(priv->chan, true);
+	if (ret) {
+		pr_err("Failed to add async client\n");
+		goto free_chan;
+	}
+
+	init_completion(&priv->completion);
+
+	fcs_read_version_from_atf();
+
+	return 0;
+
+free_chan:
+	stratix10_svc_free_channel(priv->chan);
+err_clear:
+	/* drop dangling devm pointer */
+	priv = NULL;
+
+	return ret;
+}
+
+/**
+ * fcs_deinit() - tear down the FCS private state
+ *
+ * Close any open session, remove the async client, free the service channel
+ * and clear @priv.
+ */
+void fcs_deinit(void)
+{
+	if (priv && priv->session_id) {
+		int ret = fcs_close_session_locked();
+
+		if (ret)
+			pr_err("Failed to close FCS service session,ret=%d\n", ret);
+	}
+
+	if (priv) {
+		stratix10_svc_remove_async_client(priv->chan);
+		stratix10_svc_free_channel(priv->chan);
+	}
+
+	priv = NULL;
+}
+
+/**
+ * fcs_cleanup() - release the FCS service channel and clear the state
+ */
+void fcs_cleanup(void)
+{
+	if (priv)
+		stratix10_svc_free_channel(priv->chan);
+
+	priv = NULL;
+}
diff --git a/drivers/firmware/socfpga-fcs.c b/drivers/firmware/socfpga-fcs.c
new file mode 100644
index 000000000000..d2d09032319a
--- /dev/null
+++ b/drivers/firmware/socfpga-fcs.c
@@ -0,0 +1,227 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026, Altera Corporation
+ */
+
+#include <linux/firmware/intel/socfpga-fcs.h>
+#include <linux/fs.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/sysfs.h>
+#include <linux/uaccess.h>
+#include <linux/util_macros.h>
+#include <uapi/misc/socfpga-fcs-crypto.h>
+
+/**
+ * atf_version_show() - report the Arm Trusted Firmware build version
+ * @dev: pointer to fcs device
+ * @attr: device attribute
+ * @buf: pointer to character buffer to receive the version string
+ *
+ * Return: number of bytes written to @buf.
+ */
+static ssize_t atf_version_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	int version[3];
+
+	fcs_get_atf_version(version);
+	return sysfs_emit(buf, "%u.%u.%u\n", version[0], version[1], version[2]);
+}
+
+/**
+ * fcs_sdos() - perform an SDOS encrypt/decrypt operation
+ * @k_ctx: locked FCS command context to populate
+ * @uarg: user pointer to a struct fcs_ioc_sdos
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+static long fcs_sdos(struct fcs_cmd_context *k_ctx, void __user *uarg)
+{
+	struct fcs_ioc_sdos u;
+
+	if (copy_from_user(&u, uarg, sizeof(u)))
+		return -EFAULT;
+
+	if (u.__pad)
+		return -EINVAL;
+
+	memset(k_ctx, 0, sizeof(*k_ctx));
+	k_ctx->error_code_addr = u64_to_user_ptr(u.error_code);
+	k_ctx->sdos.context_id = u.context_id;
+	k_ctx->sdos.op_mode    = u.op_mode;
+	k_ctx->sdos.src        = u64_to_user_ptr(u.src);
+	k_ctx->sdos.src_size   = u.src_size;
+	k_ctx->sdos.dst        = u64_to_user_ptr(u.dst);
+	k_ctx->sdos.dst_size   = u64_to_user_ptr(u.dst_size);
+
+	return fcs_sdos_crypt(k_ctx);
+}
+
+/**
+ * fcs_ioctl() - dispatch an FCS ioctl command
+ * @file: open file for the FCS misc device
+ * @cmd: ioctl command code
+ * @arg: user pointer to the command-specific argument structure
+ *
+ * Take the shared command context under the FCS lock, dispatch @cmd to its
+ * handler and release the context before returning.
+ *
+ * Return: 0 on success, -ENODEV if the driver is not initialised, -ENOTTY for
+ *         an unknown command, or a negative errno from the handler.
+ */
+static long fcs_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
+{
+	void __user *uarg = (void __user *)arg;
+	struct fcs_cmd_context *k_ctx;
+	long ret;
+
+	k_ctx = fcs_acquire_cmd_ctx();
+	if (!k_ctx)
+		/* driver not initialised */
+		return -ENODEV;
+
+	switch (cmd) {
+	case FCS_IOC_SDOS:
+		ret = fcs_sdos(k_ctx, uarg);
+		break;
+	default:
+		ret = -ENOTTY;
+		break;
+	}
+
+	fcs_release_cmd_ctx(k_ctx);
+	return ret;
+}
+
+/**
+ * fcs_release() - close a session left open by a departing client
+ * @inode: inode of the misc device
+ * @file: open file being released
+ *
+ * Guarantees the crypto session is torn down when its owning fd is closed,
+ * including on process crash/exit, so a client that opens a session (for a
+ * multi-step sequence) and dies before closing it cannot leave the SDM's
+ * single session slot permanently occupied.
+ *
+ * Return: 0 always.
+ */
+static int fcs_release(struct inode *inode, struct file *file)
+{
+	fcs_session_release(file);
+	return 0;
+}
+
+static const struct file_operations fcs_fops = {
+	.owner		= THIS_MODULE,
+	.unlocked_ioctl	= fcs_ioctl,
+	.compat_ioctl	= compat_ptr_ioctl,
+	.release	= fcs_release,
+};
+
+static struct miscdevice fcs_miscdev = {
+	.minor	= MISC_DYNAMIC_MINOR,
+	.name	= "socfpga_fcs",
+	.fops	= &fcs_fops,
+};
+
+static DEVICE_ATTR_RO(atf_version);
+
+static struct attribute *fcs_attrs[] = {
+	&dev_attr_atf_version.attr,
+	NULL
+};
+
+static const struct attribute_group fcs_group = {
+	.attrs = fcs_attrs,
+};
+
+static const struct attribute_group *fcs_groups[] = {
+	&fcs_group,
+	NULL,
+};
+
+/**
+ * fcs_driver_probe() - probe the FCS platform device
+ * @pdev: pointer to the FCS platform device
+ *
+ * Initialise the FCS state and register the misc device that exposes the
+ * ioctl command interface. The sysfs attribute groups are published
+ * automatically by the driver core via fcs_driver.driver.dev_groups.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+static int fcs_driver_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ret = fcs_init(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to initialize FCS\n");
+
+	ret = misc_register(&fcs_miscdev);
+	if (ret) {
+		fcs_deinit();
+		return dev_err_probe(dev, ret, "Failed to register misc device\n");
+	}
+
+	return 0;
+}
+
+/**
+ * fcs_driver_remove() - remove the FCS platform device
+ * @pdev: pointer to the FCS platform device
+ *
+ * Tear down the FCS state. The sysfs attribute groups are removed
+ * automatically by the driver core.
+ */
+static void fcs_driver_remove(struct platform_device *pdev)
+{
+	misc_deregister(&fcs_miscdev);
+	fcs_deinit();
+}
+
+static struct platform_driver fcs_driver = {
+	.probe = fcs_driver_probe,
+	.remove = fcs_driver_remove,
+	.driver = {
+		.name = "stratix10-fcs",
+		.dev_groups = fcs_groups,
+	},
+};
+
+/**
+ * socfpga_fcs_init() - register the FCS platform driver
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+static int __init socfpga_fcs_init(void)
+{
+	int ret;
+
+	ret = platform_driver_register(&fcs_driver);
+	if (ret)
+		pr_err("Failed to register platform driver: %d\n", ret);
+
+	return ret;
+}
+
+/**
+ * socfpga_fcs_exit() - unregister the FCS platform driver
+ */
+static void __exit socfpga_fcs_exit(void)
+{
+	platform_driver_unregister(&fcs_driver);
+}
+
+module_init(socfpga_fcs_init);
+module_exit(socfpga_fcs_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Altera SoCFPGA FCS SDOS encrypt/decrypt driver");
+MODULE_AUTHOR("Altera Corporation");
+MODULE_ALIAS("platform:stratix10-fcs");
diff --git a/include/linux/firmware/intel/socfpga-fcs.h b/include/linux/firmware/intel/socfpga-fcs.h
new file mode 100644
index 000000000000..f32b010d209d
--- /dev/null
+++ b/include/linux/firmware/intel/socfpga-fcs.h
@@ -0,0 +1,126 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 Altera Corporation
+ *
+ * SDOS-only subset of the SoCFPGA FCS (FPGA Crypto Service) interface,
+ * shared between the driver front-end (socfpga-fcs.c) and the command
+ * engine (socfpga-fcs-core.c).
+ */
+#ifndef __SOCFPGA_FCS_H
+#define __SOCFPGA_FCS_H
+
+#include <linux/completion.h>
+#include <linux/device.h>
+#include <linux/mutex.h>
+#include <linux/types.h>
+#include <linux/uuid.h>
+#include <linux/firmware/intel/stratix10-svc-client.h>
+
+struct file;
+
+#define SDOS_HEADER_SZ		40
+#define SDOS_HMAC_SZ		48
+#define SDOS_PLAINDATA_MIN_SZ	32
+#define SDOS_PLAINDATA_MAX_SZ	32672
+#define SDOS_DECRYPTED_MIN_SZ	(SDOS_PLAINDATA_MIN_SZ + SDOS_HEADER_SZ)
+#define SDOS_DECRYPTED_MAX_SZ	(SDOS_PLAINDATA_MAX_SZ + SDOS_HEADER_SZ)
+#define SDOS_ENCRYPTED_MIN_SZ	(SDOS_PLAINDATA_MIN_SZ + SDOS_HEADER_SZ + SDOS_HMAC_SZ)
+#define SDOS_ENCRYPTED_MAX_SZ	(SDOS_PLAINDATA_MAX_SZ + SDOS_HEADER_SZ + SDOS_HMAC_SZ)
+
+#pragma pack(push, 1)
+struct fcs_cmd_context {
+	/* Error status variable address */
+	int *error_code_addr;
+	/*
+	 * A union is used so future multi-step crypto operations can add their
+	 * own per-command parameter blocks alongside SDOS.
+	 */
+	union {
+		struct {
+			u32 context_id;
+			u32 op_mode;
+			char *src;
+			u32 src_size;
+			char *dst;
+			u32 *dst_size;
+			u64 own;
+		} sdos;
+	};
+};
+
+#pragma pack(pop)
+
+/**
+ * Private driver state for the SoCFPGA FCS that holds the SDM/ATF service
+ * channel, the shared command context and the lock that guards it, and the
+ * latest mailbox status/response.
+ */
+struct socfpga_fcs_priv {
+	/* Communication channel */
+	struct stratix10_svc_chan *chan;
+	struct fcs_cmd_context k_ctx;
+	struct stratix10_svc_client client;
+	struct completion completion;
+	/*
+	 * Serializes FCS command submission: guards the shared k_ctx and the
+	 * single in-flight mailbox transaction (completion/status/resp) so only
+	 * one SDM request is outstanding at a time. This is the lock taken by
+	 * fcs_acquire_cmd_ctx() and dropped by fcs_release_cmd_ctx().
+	 */
+	struct mutex lock;
+	int status;
+	u32 resp;
+	u32 session_id;
+	uuid_t uuid_id;
+	/* fd that holds the session */
+	const struct file *session_owner;
+	struct device *dev;
+	u32 atf_version[3];
+	/*
+	 * Backing store for the SDOS output-buffer capacity. The outgoing
+	 * request stages k_ctx.sdos.dst_size to point here (device-lifetime)
+	 * instead of at a caller stack variable, so the pointer never dangles.
+	 */
+	u32 sdos_output_size;
+};
+
+enum fcs_command_code {
+	FCS_DEV_COMMAND_NONE = 0,
+	FCS_DEV_CRYPTO_OPEN_SESSION,
+	FCS_DEV_CRYPTO_CLOSE_SESSION,
+	FCS_DEV_SDOS_DATA_EXT,
+	FCS_DEV_ATF_VERSION,
+};
+
+/* Take the FCS lock and return the shared command context. */
+struct fcs_cmd_context *fcs_acquire_cmd_ctx(void);
+
+/* Release the FCS lock previously taken by fcs_acquire_cmd_ctx(). */
+void fcs_release_cmd_ctx(struct fcs_cmd_context *const k_ctx);
+
+/* Allocate the FCS state and set up the service channel; read ATF version. */
+int fcs_init(struct device *dev);
+
+/* Close any open session and release the service channel. */
+void fcs_deinit(void);
+
+/* Release the service channel and clear the FCS state. */
+void fcs_cleanup(void);
+
+/*
+ * Record the open file that owns the current session (caller holds lock).
+ * Reserved for multi-step crypto sequences whose session must live across
+ * several ioctls; SDOS opens and closes its session within a single call.
+ */
+void fcs_session_set_owner(const struct file *file);
+
+/* Close the session if @file owns it; used by the .release path. */
+void fcs_session_release(const struct file *file);
+
+/* Return the cached Arm Trusted Firmware build version. */
+void fcs_get_atf_version(u32 *version);
+
+/* Perform an SDOS (Secure Data Object Service) encrypt/decrypt operation. */
+int fcs_sdos_crypt(struct fcs_cmd_context *const k_ctx);
+
+#endif /* SOCFPGA_FCS_H */
diff --git a/include/uapi/misc/socfpga-fcs-crypto.h b/include/uapi/misc/socfpga-fcs-crypto.h
new file mode 100644
index 000000000000..bf31a90901f1
--- /dev/null
+++ b/include/uapi/misc/socfpga-fcs-crypto.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/*
+ * Description:
+ * This driver is developed for the SDM SoCFPGA Crypto Service (FCS). It
+ * provides an ioctl interface for the SDOS (Secure Data Object Service)
+ * encrypt/decrypt operation. The crypto session is opened and closed by the
+ * kernel internally, so it is not part of the user ABI.
+ */
+#ifndef __SOCFPGA_FCS_CRYPTO_H
+#define __SOCFPGA_FCS_CRYPTO_H
+
+#include <linux/types.h>
+#include <linux/ioctl.h>
+
+struct fcs_ioc_sdos {
+	__u64 error_code;	/* __user ptr to __s32 (out)              */
+	__u64 src;		/* __user ptr to input buffer (in)        */
+	__u64 dst;		/* __user ptr to output buffer (out)      */
+	__u64 dst_size;		/* __user ptr to __u32 capacity/len (in/out) */
+	__u32 context_id;	/* (in)  */
+	__u32 op_mode;		/* (in)  */
+	__u32 src_size;		/* (in)  */
+	__u32 __pad;		/* must be 0 */
+};
+
+#define FCS_IOC_MAGIC		0xA6
+#define FCS_IOC_SDOS		_IOWR(FCS_IOC_MAGIC, 1, struct fcs_ioc_sdos)
+
+#endif /* __SOCFPGA_FCS_CRYPTO_H */
-- 
2.43.7


Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazolkn19011038.outbound.protection.outlook.com [52.103.39.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E962F4A
	for <linux-doc@vger.kernel.org>; Mon,  9 Jun 2025 19:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.39.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749496656; cv=fail; b=Rb5GUeHe3mfPfgaDGQNjm1V5Vfebrwlw4m8ReNfGUowCaoWOfcjs3CmfVEEbZckmQ4rQz3FoasOrAwOVSShpe3IYKzGxQegoas5dpNj2Jq1aDEJw83rRxPj6IS0X+Icc/EKslOZQIA9nk2+S7C3USWMJNd4yhYqJvjVqdBMwekY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749496656; c=relaxed/simple;
	bh=ng9SeMpd9VTTCfzgrMIFYi/glph4dasV+VvDWAh1NUE=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=a4Ojfj0nNMxVoGhegHTTpQ7JJOeqZr9c0xgBWNtY8X3HDKe0IJqMGfxw7mU02n2B+5T0RgrBE6+N+MgRPrTlIeRUuLJ+p/4bQSGJmUEWzNFmGzdziJpTSGg5qNk8JSwSblm4GT6KE4Og1C4drirHLrCFeMln+AQU8U6HzAX2ddk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=fNc3/DpR; arc=fail smtp.client-ip=52.103.39.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="fNc3/DpR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J0cBHo1nXvmP9wI8mkfZfuNzVmymDJ4XNqxKZbULfT4P/AnrjvinebweLwLyEqGfg0ofzi1s1XJbnEoIp2lscPpNmC8qM+pLA25Olgequ2Lmtr5Oi/uCWO0QgGZzl5z9ei+8AfNc2MpI5Wh/IEknWzR6ND6RXLe2awMNhYKIEb3jog8EolYMfcYW1m0oat/gOgPJ6SeRPblfKeHz9FrUEy5AZIWXwUM9uUILS2JNLuU9NnxIURA3p1D5iKFFAUySkSSgzmyUHpKRTPi/F1tBl0IyKC2Pr+mfdW3NWD97oUx7ny5pH+xtlyAbNRAP/IzSVgEvzI3Yz65zdRqeakfcUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s7XapnAqGxQaNforWkLAYt8+mr2PzSx+gxROVu4RQT0=;
 b=unxqqYttTl4alk36mgo3WqZr1KdARjOPUbQIg8cp+yoDuIk1b/tfVTJy5+4skPTGifyamzIr7FxnlN6FqAHJxKIqySCYnJKF/aNR28TATGdypEewQKgRuWLFUeQWhrjepyXmKDkVsmPtsgo4BCJSvvv3Bkz4csIcW1qHPxxks4HFKxFy59fq4GrH3qgFRGnehiPqr4PLtQMM1gqJfjqHR6uqNtAdyMfMEXRqRQyEX3SgiEPSwiAVXhfl1/Ej276LeKyAEnVk9vN6TejPmFhpYaLyD0mE+6ju23BJFeF69FknybAVM3yuc3h2Vh/CaZj30KnWlBrfa7A+2KPFJzNOxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s7XapnAqGxQaNforWkLAYt8+mr2PzSx+gxROVu4RQT0=;
 b=fNc3/DpRs1lyOlAuECP1wE7BHIgxguRZtgmuJwxc02qS90BfBeUNX53kN45m/HTf/tOe+oX+a411BJ2uw0kXsjCkIF71lTQJMdHs7yUCjofHW2ngWDnDI5JBJVhd8t7Ii/VyTw8l6AdRjuuOBrP3dwGoTia0MVylQ3KtjazIQ6n4XeJlX6pucjrMu5cBZM0heNs3q3pfRbGraJaV2QFAz9E4XfHYoMsIZTC3pMrmJCsAA8suNyfaOO87n3jGa+toLYeavsvQB/GbD1/QGSWT8ZdYfsxH/o2AvDM5HFAY8I79RbLjdbNJ/Eg5m3Hn9vca0b1u2oBIttj9EuwnHbUFRw==
Received: from PAXPR06MB8224.eurprd06.prod.outlook.com (2603:10a6:102:1a3::13)
 by GVXPR06MB9277.eurprd06.prod.outlook.com (2603:10a6:150:1be::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Mon, 9 Jun
 2025 19:17:30 +0000
Received: from PAXPR06MB8224.eurprd06.prod.outlook.com
 ([fe80::9306:451c:f996:14cf]) by PAXPR06MB8224.eurprd06.prod.outlook.com
 ([fe80::9306:451c:f996:14cf%3]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 19:17:30 +0000
Message-ID:
 <PAXPR06MB8224F9CF845C22E7BE930624A76BA@PAXPR06MB8224.eurprd06.prod.outlook.com>
Date: Mon, 9 Jun 2025 20:17:28 +0100
User-Agent: Mozilla Thunderbird Beta
From: Dante Strock <dantestrock@hotmail.com>
Subject: Re: [PATCH] Documentation/process/: Change 5.x to 6.x; clarify terms;
 added note.
To: Jonathan Corbet <corbet@lwn.net>
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <PAXPR06MB8224F2CE53A1F4D674969B22A769A@PAXPR06MB8224.eurprd06.prod.outlook.com>
 <87ecvtc772.fsf@trenco.lwn.net>
Content-Language: en-GB
In-Reply-To: <87ecvtc772.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0194.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::19) To PAXPR06MB8224.eurprd06.prod.outlook.com
 (2603:10a6:102:1a3::13)
X-Microsoft-Original-Message-ID:
 <d66359cf-cb63-42b9-97ba-f44469098f93@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR06MB8224:EE_|GVXPR06MB9277:EE_
X-MS-Office365-Filtering-Correlation-Id: d65c76e1-25e6-4462-d7c2-08dda78a471d
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|461199028|13031999003|41001999006|19110799006|15080799009|5072599009|7092599006|8060799009|56899033|3412199025|440099028|12091999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NkF6d3VnVmJLRDdNRkUwSGxOc3phZlJmaUZvcUNjZEhjelZUY2hSaDI3RTN3?=
 =?utf-8?B?MXd5OU52Zk9iN0Y5NjZWR29GaW50RGRaaXhlZEFnZm1LclZmL3p5OERUSytR?=
 =?utf-8?B?a3FvMUNnR3hIZjRjdDhraWRSK0hKalhsS1VqN3BQeWRiZXdnZlBmdVRDSkdo?=
 =?utf-8?B?Q2kyYzhSelFNYlJmOTlHN0N6Uy9MaUR0QWE4K1l5UnozbkxGNEtuRjM2d2s0?=
 =?utf-8?B?TWlxUm4vQlNwL2o5ZFVwbFhDQTlvNTBQTlo2TUNRVEpFWnVxaHRYaGt0N25H?=
 =?utf-8?B?VE9WUXBIRUJaUjNhWEFnWmJrZlZGK0JxZFo4RU9JNEtQZnphQkdSSTYyTUxG?=
 =?utf-8?B?S3pidk52T3JFQzM4MDFCSkhKRWZIbkFEMStDK0pjdmwxY1IrazhWeFN4Y0lO?=
 =?utf-8?B?cDBlOGp4ckdqYU80bzlYT3NWWGFibzN3T25ucGY3UWlyd1g0MXNJSVh6VWEv?=
 =?utf-8?B?TFNvUGt6VEJWOXd4NTBrQ3RrMlVpOUlOUGdENjlwaWVqU1dxOUQxd2xTQ0l5?=
 =?utf-8?B?RDhPcnd4cGJYUXVNVW9WZHMxMjgwNU9ZYmhuUDNpODJCeURXU0tSdzhadU5q?=
 =?utf-8?B?RXdLbFlFM085dmhwTDBlY0J6UGNlL2sxdTVRWVc3RWhqeXl4Vk1UU0g1YWUw?=
 =?utf-8?B?WHpjOHYwNThTaFhmak92ekUvMElLeHcxOTNlRW14NkUzd0NEL0MvRjRTMHA0?=
 =?utf-8?B?Y3IvTkhsM2pEcFRDejNrWXBjU09FQkdFa09Md01OT2dnUkFhbGR4Z3dpekty?=
 =?utf-8?B?em9SSENFNkdNYnFDT0d1UWREMGQ3L0NYZ2hRR1NzdmkyVU1IL1JsVmxYTWFJ?=
 =?utf-8?B?NVFwS2dQZ3FsaUF6MnVFczZGNWkzLytnV2VNWCtLd0xXeU01aHVrSWltODhZ?=
 =?utf-8?B?UkUwWmh2Z1Urck9jLzlzcXh3RXBMaGc0Yzdtc0tNY09nTllOSElJUW9PeUhJ?=
 =?utf-8?B?RERQMU0wY0pwOHhZU1hNUkJib2pvenhCVk9IeUtCdWpDN2dtOUh0WURyekZm?=
 =?utf-8?B?R2N6R1JqdENYRmdRb3NWWjF4MDhTUGtMaExMUEdjeTZKVEZzckxBVTR4NW1N?=
 =?utf-8?B?Qkk1citkVFhsSDJDdm5TVlljZU4vd0NnVVhqV1VxQy9mUnBMYUo1ZWlEdGQ3?=
 =?utf-8?B?WnBrejFDbDdZZWh6NVVtd3FRWDFXV3A1MS9ocUpSbTFabVNLOC9VY0Fqei9q?=
 =?utf-8?B?c3lLaXk3dE5jbzRTR29DT09iV3ducXRNZmN4ZzZBSU9NMWJWbUZoaDczU2FL?=
 =?utf-8?B?OXFWL1ptVHJWVWVLWk5HckNuR0lMTk42MHRZSGF4VmlVM2JrRFhSVWpPU3Jy?=
 =?utf-8?B?QUNUc0V2MVRyVjROb1U1TGcrenhGbG52RDhVcDBzYklmcnZkV3JRVzlmcG5p?=
 =?utf-8?B?Y01XWlZNRFBSK0ZGVG8yV3N0dzhPOG96Y3dJWGdVZGdjMC9Cdi9lRFQ2THU3?=
 =?utf-8?B?ZDkvQ0hQZWVpdm1OZ1A5ZEE0ZmUvWEJDTzQrZ2xERzd5UzlZQ1JiK3poSGVo?=
 =?utf-8?B?bFJiYlBHTnBXL3NEZStwQVpGaUVEUXAwQnA2NWFvYmdaeFVLbUJ3a0wxeDlC?=
 =?utf-8?B?dzdmN2Rmbmw3S0xuWjNOZEtueFRhTXR3ck1LWUVuYk4vWGhoZWo5cXE5cWI0?=
 =?utf-8?Q?O7xocpRkWIHGcIAXN2mUYPrAS+62stosPcSx9a4kk+dw=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGFwdVA5Ym1PaEpzOTA4QUhESEVGaFhIcUVpREJXZUs2cWIrK0FKRUdPRVNK?=
 =?utf-8?B?WjVMN3NYSy83YXlzclQ0ZG5EaWMvOXViOS9EU2pCQjV6eUozRk11STZLWE5X?=
 =?utf-8?B?OG5MMFZIVGdYK0cwUFhPR0xDYmVOcVFzK2lOTlM4UzhNNkVHMmk5SGJBeW5G?=
 =?utf-8?B?WkExMGNwNEttemw3dDJaeXhsQ0VJNGFxN2xRSTJuc01VUlpzUmRrbmdlVTFv?=
 =?utf-8?B?Ujd2YUJpYXdBQTFjb2h2c0R2UDhaRXVFREFrVERhMSt1S2dRZzNmN2RDMmE3?=
 =?utf-8?B?WW1QbmE1RGIyZzduKzRLVEhWT2Z0SzRzQXJ1M1FJcGc2aEhJQmhhRnh1OEtG?=
 =?utf-8?B?VEtXYnJUQ09sSFBnczc3TW1Db2V5dVcyR1QwcnNOWStNejNnaGJxdWVBUHpV?=
 =?utf-8?B?Q2VGS1dJS3JLMnVvNyt2K2ZBM3R3RFVoN0ZnMDJ2dEkyL3ZrSVI1SDhhbXFY?=
 =?utf-8?B?eTJHREI0MCt2dFRxbld3NnQvVGVSQkN2eGVVMmtneWdocjNwdHZwVWVjNlpB?=
 =?utf-8?B?M29ZNGVGV2tkVWJJUnB2Q1pKZU5peXNpb091Vno5cXVzM2MyVkNiZkJOQStF?=
 =?utf-8?B?SGE0ZllFUEJwcUl1Y0ZJN2tXMWJOaFhWM1Zlem5abGdtSUZWbm1ueGNNU3I4?=
 =?utf-8?B?Um1qQ21vT1NPYmt1UVd6U3lGRHJab3huSFlQOHdmcmVHRFdDVjY2ZWkwaWsv?=
 =?utf-8?B?bk1iOERBOWZkNU5COFUxU1k4Y2pudkFzbXNKNGpWS21zc3dydkxqOHc1N0Rr?=
 =?utf-8?B?YmZadE93Z0lzYVYxQTJNTWxGK05vOVNSZ01nRWV0VmlVLzcxV2MrZnpTZVdY?=
 =?utf-8?B?aHNnTTJrdXVteXdzNnRFb1MrdGZyTVd5cGw0SUlrZ0VwT3hZRzhpM0pua1By?=
 =?utf-8?B?b2d6NXNXYTFITEw3STE4ZGlCUi9GbnRmdlRTRzMyZTN1SEpPN0FRcVk2Nkh2?=
 =?utf-8?B?dnBDNnF3dVp0TG1ES2V2bEJ1TkU4WXNubVBkY0VJell2SmZSaU9yTjBIbU5B?=
 =?utf-8?B?MkU5TnRCMTZqOHhMWGtnS0YxWmlMWnBWblBsbjdBeUdTUzZSdThDYktYbytZ?=
 =?utf-8?B?cS83QTlncGowMTlPSzNUbkcvL0N2MWNQUk9tREt0dzh1N3FwM0UxZUxjaVBE?=
 =?utf-8?B?ME1hWkxSUDBNN3A5T2FYUER0MDU1dk8yQnV3ak9iSUZocXRQL3RPaEttZkd6?=
 =?utf-8?B?eUxWdEpuSURNUE12WGU1NUJ1YjNXTTBnYWxCL3BiU1B5RTdvVmx5YUNpdEhi?=
 =?utf-8?B?NWkrY0VTT3dTUkNQMXh4WStwOU02eUkxQTRuNk9nU2FUazlBWlF3TTBsZXov?=
 =?utf-8?B?Um1uazlMM1k2c1dZTEZxeDVPajRhSFYrRG8zK0dTMXdlQytvSWQyYXloSE56?=
 =?utf-8?B?VnQ1SVNEaXdqL1NPMXdnbTNFV3RNM3dCS2lPU04zZC9LMEF3TUFCZ1VkTXJJ?=
 =?utf-8?B?cnMzUUNCZk83UDhiU0RBZEgvRXFRK3hRRFF4VlIwUVRjMFJGNWkrU2Q2bzFY?=
 =?utf-8?B?NkxzTDN4bkxjVUNKb3N2cDdlU3Z4RTZTWE1ERzdlYzFNUlYvdkFPUTNnTDRt?=
 =?utf-8?B?N1NzN21rZHZnb1oyTVh4Y3dKd1JhMDI2K0pFVXRzWmRZSi9ob2w5VHo0NkhC?=
 =?utf-8?B?aEZRMDR2VzR3ZEZzWHFhTWFEL1ZxSU9wU2lCSG1NY05MejZGNnRtajZQRVRt?=
 =?utf-8?B?RExrWVBldG9OWW5EQ3Ayb2xrL2Zkb2xLdW5rN0ZJTXZiQVFXRzcyVEVGbVND?=
 =?utf-8?Q?VjxpaGKeU47cJ38K9KUZTCn+vYKkGxT4Qxx5zzF?=
X-OriginatorOrg: sct-15-20-8534-20-msonline-outlook-c5f2b.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: d65c76e1-25e6-4462-d7c2-08dda78a471d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR06MB8224.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 19:17:30.0317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR06MB9277

    Thanks for working to improve our documentation! Naturally, I have
    some comments, the first of which being to run
    scripts/get_maintainer.pl on your patches to get the list of people
    you should send them to. Then cut-and-paste it rather then typoing
    it by hand :) Dante Strock <dantestrock@hotmail.com> writes:

         From 1fbe3d56d604a0f8a87ed1d3f092b84c2fab4392 Mon Sep 17
        00:00:00 2001 From: Dante Strock <dantestrock@hotmail.com> Date:
        Sat, 7 Jun 2025 09:29:36 +0100 Subject: [PATCH]
        Documentation/process/: Change 5.x to 6.x; clarify terms; added
        note. From: Dante Strock <dantestrock@hotmail.com> As a possible
        suggestion, might it be worthwhile adding a terminology section
        specific to each section of the kernel documentation? That way
        developers have a handy reference to refer back to for terms
        they might not understand. ---
        Documentation/process/2.Process.rst: - Changed some instances of
        5.x to 6.x(though kept some instances of 5.x that are used in
        examples). - Clarified the term "rc" in brackets. - Added a
        notice for people installing Git or Mercurial to check their
        distribution repository for the latest version of the software.
        Signed-off-by: Dante Strock <dantestrock@hotmail.com> ---
        Documentation/process/2.Process.rst | 26
        +++++++++++++++----------- 1 file changed, 15 insertions(+), 11
        deletions(-)

    This is backward - the changelog goes above the "---" line, any
    additional comments go below. A bulleted list like the above is a
    good sign that the patch should be split up - patches should do one
    thing.

        diff --git a/Documentation/process/2.Process.rst
        b/Documentation/process/2.Process.rst index
        ef3b116492df..70f8a6603454 100644 ---
        a/Documentation/process/2.Process.rst +++
        b/Documentation/process/2.Process.rst @@ -18,17 +18,17 @@ major
        kernel release happening every two or three months. The recent
        release history looks like this: ====== ================= - 5.0
        March 3, 2019 - 5.1 May 5, 2019 - 5.2 July 7, 2019 - 5.3
        September 15, 2019 - 5.4 November 24, 2019 - 5.5 January 6, 2020
        + 6.10 July 14, 2024 + 6.11 September 15, 2024 + 6.12 November
        17, 2024 + 6.13 January 20, 2025 + 6.14 March 24, 2025 + 6.15
        May 25, 2025 ====== ================= -Every 5.x release is a
        major kernel release with new features, internal +Every 6.x
        release is a major kernel release with new features, internal
        API changes, and more. A typical release can contain about
        13,000 -changesets with changes to several hundred thousand
        lines of code. 5.x is +changesets with changes to several
        hundred thousand lines of code. 6.x is the leading edge of Linux
        kernel development; the kernel uses a rolling development model
        which is continually integrating major changes.

    I do not object to these change and could apply this, but it might
    be nice at some point to rephrase this stuff so that we don't end up
    doing these updates repeatedly. After all, we'll be at 7.x within a
    year...

        @@ -48,9 +48,9 @@ detail later on). The merge window lasts for
        approximately two weeks. At the end of this time, Linus Torvalds
        will declare that the window is closed and release the -first of
        the "rc" kernels. For the kernel which is destined to be 5.6,
        +first of the "rc"("release candidate") kernels. For the kernel
        which is destined to be 6.16,

    This is a separate change. But, of course, yesterday's 6.16-rc1 is
    in no way a "release candidate". It's really just the naming scheme
    that Linus uses for his testing releases, calling them "release
    candidates" muddies the water and risks reigniting old debates.

        +Note that not all Linux distributions have the latest version
        of Git +or Mercurial available in their repositories. Consult
        the package +maintainer for your distribution to get the package
        updated or +download it directly from the website.

    I almost wonder if the references to Mercurial shouldn't just come
    out; I am not aware of anybody using it for kernel work at this
    point. I'm also not aware of anybody who has run into trouble
    because their distribution lacked a shiny new version of Git. I'm
    not sure we want to encourage people to bug their distributors to
    accelerate updates? Is this paragraph solving a specific problem
    that you have encountered? Thanks, jon

Hello,


Apologies about the sending of the original email: I had been doing a 
lot of fiddling that morning to get things setup and by the time I sent 
the email, had failed to check the address before sending. I'll keep 
this in mind for next time and will be more diligent. Thank you as well 
for the feedback on my changes. I've taken note of these for future 
reference.

I agree with you on the first point you make about the release numbers. 
I suppose we could remove the example version history entirely so as to 
avoid updating version numbers constantly, or stick with one version 
number(e.g. 6.0, 6.1, 6.2, 6.3, etc.) as an example and keep it that 
way. I thought it would've been good to update it to keep the page 
fresh(as the versions listed were between 2019-2020; we're now in 2025), 
but I can see the point you're making and a rephrase might be better so 
as to avoid constantly changing it.

I've always read and understood "rc" to mean "release candidate" and 
thought it would be good, as a general principle, to clarify what 
abbreviated terms like "rc" meant. If this creates the risk of confusion 
and unnecessary debate, then do not include it. This is partly the 
reason why I suggested a terminology section specific to each section of 
the documentation that could help clarify technical or abbreviated terms 
that readers might not have encountered before. In this case, "rc" is 
not that much of a deal to warrant a place in a terminology section, but 
in other sections of the documentation which can get very technical, it 
may well be worth it.

I see very little mention online of Mercurial either: Git seems to be 
the standard VCS nowadays. It might be wise to simply point people to 
Git only, that way everybody uses the same tools and it streamlines 
development for the whole kernel. As for keeping the software 
up-to-date: I put it in as I've found a lot of mentions online of 
packages in some distribution repos being outdated, though with software 
like Git that is heavily used, this really shouldn't be an issue, but I 
thought it still to be worth noting just in case.

Hope this explains my patch well enough.

Thanks,

Dante


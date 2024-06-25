Received: from DEU01-FR2-obe.outbound.protection.outlook.com (mail-fr2deu01on2130.outbound.protection.outlook.com [40.107.135.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A65B17C211
	for <linux-doc@vger.kernel.org>; Tue, 25 Jun 2024 21:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.135.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719349528; cv=fail; b=pq9MCcWxFQn4yBtXGvPp/N+BcXMSVfiR7DCdz9hhsOgo2wleLxUIZ3vCK1K19qy798RpQknc8Y/XvJqUypxx1Yt2yyCyvdskMQstzVrmme0iC9WcAoZSsl1wGT9xtGYWPJEh1ZkeojiPD/t8uRtFYhf5t7sSdpu1nyCZZR0B+js=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719349528; c=relaxed/simple;
	bh=+PZsOgDGj3+P+7GuvFdadHdiyvJPS1yTeRlldflUsSM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=P6lJEa0cw8o0nF1HRuJUNAeZt6vR/EtxLw8FdhWJ96uhsgBdbHNjb+vRRW6BvgsZSFgK2bNDY9F3+SfKFT4PrPLDuwUx7vzafpvi1bgFEvoEI2QOnxgf+CnLbpaMEKqncxdD8bfafYBIgJBjYCMvbIcORH4bbihrO2SQs9NEMU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eckelmann.de; spf=pass smtp.mailfrom=eckelmann.de; dkim=pass (1024-bit key) header.d=eckelmann.de header.i=@eckelmann.de header.b=T194w/Vz; arc=fail smtp.client-ip=40.107.135.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eckelmann.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eckelmann.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=eckelmann.de header.i=@eckelmann.de header.b="T194w/Vz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ALznDbIsauylPW/k/O4g3441XaWHt+asK5jg+4F7STUfeh6C2/g5frk33+XrVij3KtiuAjFyRHCZjuOuYmrTXzEcsDKZSGj8oVwAdv01o2JU+frP+YeJ4qDN4qTquvk1NmI+nW+PTjTagZ2VJXUMGsI/gxE268L6hVA2I3pX+m34aauefmASAzgXcl+MV1Cnn6YxtQ5IzCBNEpCxxymSQNof9JRrE/4RN7tqwkdO06MKl7LvClIqsPtfdCUaGaVHIiI5m/3TOrfzm5DmudW5bDaB3v/Sbrn+hHPArq17yxc8j2SB2GaCXvPXlack7UCEK3MDxBpQ/163DhCKSf7C4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HlY5MVVfk9l+llRfDqSvjexhM4Xm3JV93Hqggw5MLg4=;
 b=eHqHWftWHKboxdNDp6nRGiSwvI9rvr7olypOuXrvopsm6d9/xAEAEknI7+hpLX/8Bd1toGKz5JNpmdY1FIeMNi7QbNs9x2n0CwsVp+51PBjES54nfQ9KDPBtRIlcj3qJwDarU9YFBwfUJ4SKJaL6eAjUUzrg5sWuqN0n3WKDqf+1wbVdjWeCPFBATSAtSorm1n6ywOe6kf7kdf/k3QceKZOGR7nWzsx9eUi0cvlqxosWUJtQF4v9bxa1Nn3xrigv0drpAOEAgp/X/P2DLeiaLqgqy84ODlhRrpLU0Y+DwZZ5dM2GLnDbUD305/YS3t8l6r+dOmVWGRhZY/k9wfxerg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eckelmann.de; dmarc=pass action=none header.from=eckelmann.de;
 dkim=pass header.d=eckelmann.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eckelmann.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HlY5MVVfk9l+llRfDqSvjexhM4Xm3JV93Hqggw5MLg4=;
 b=T194w/Vz8QL2PhEnHsv7VhP7WeasmbTvm3lcJ3LUAG1vLx7IP9Sy072ycHvRVGe7/sRCnhSuU7jW7rLyHdvYJTMj20df92ENJ1HGk0HxAfNSxhaQU2NPIZcylDRHryJc2pL+h45fEb4GorVnW7SLbIqTJ3i953LqseChDRYSPvw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eckelmann.de;
Received: from FR4P281MB3510.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:da::13)
 by FR2P281MB3323.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:62::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Tue, 25 Jun
 2024 21:05:23 +0000
Received: from FR4P281MB3510.DEUP281.PROD.OUTLOOK.COM
 ([fe80::3927:fe99:bb4:1aa7]) by FR4P281MB3510.DEUP281.PROD.OUTLOOK.COM
 ([fe80::3927:fe99:bb4:1aa7%3]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 21:05:23 +0000
From: Thorsten Scherer <t.scherer@eckelmann.de>
To: Federico Vaga <federico.vaga@vaga.pv.it>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Thorsten Scherer <t.scherer@eckelmann.de>
Subject: [PATCH] doc:it_IT: Fix typo in Reviewed-by tag
Date: Tue, 25 Jun 2024 23:04:53 +0200
Message-ID: <20240625210455.13262-1-t.scherer@eckelmann.de>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::10) To FR4P281MB3510.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:da::13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FR4P281MB3510:EE_|FR2P281MB3323:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ef26dc9-e5d6-416e-5ce9-08dc955a874d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|1800799022|366014|376012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NWNWYmFrbWNsbjJzaG1YSWZPaEN4SWlKakNVN0ViSEpqcmdFNVBkRXVxSlMr?=
 =?utf-8?B?K0d0Q2FBSjFMdGhLNkxMOGlXdkt1M0dNR0cvdnI1V3hTV2VReG40UjhJT2g4?=
 =?utf-8?B?ZUZCMDFZUCt6UENoVWVZdENJNXdkR21pYWROVCtMd3dtWnpwSzAzb28xQWc5?=
 =?utf-8?B?VXBIU2c5Q1BZN0tndmoyWEhrS01STnoyeEZyL3c3UTEzSFg4SndlNXlWSm5H?=
 =?utf-8?B?QzRlVmFrM3FTN3A2WENLL3d5SFVWNE5vbUNlZUREdGxtcndhbHlvMnNrOFI5?=
 =?utf-8?B?a05RM3lmb1psTllwc3BaVTdXdWhxS0oyc3ExZGdITW5NeHhybzBLV01zODlk?=
 =?utf-8?B?U0JKZnJ0c29YbWhmM2JuZkZSVHE2OFlnTjR6a3FCYU9CMXI4cUQ0TlMwYTBU?=
 =?utf-8?B?Ly8wVnJ0VWQ1b1BWUkxpbjh5VUJNV1RCQ1ovS1FJQzRCT1RyVVJDWTQrWTBC?=
 =?utf-8?B?MzBqRGI1Ujh0MzNnWHJtemprNFA2NTBpOU9QcTltUm90OTJnTlJpSkpzMTB2?=
 =?utf-8?B?akpidm5uNWFSamFXaVpxYjlxMW1yZnJEa3o1VjE2Tm1RZmxNeWlWWUdGZ0k1?=
 =?utf-8?B?RlF3WHQwYlFOeWVpVDd0TVhoNFh5NU0za2hvazkvVVRxUlVqUUVZcUhiQ01O?=
 =?utf-8?B?dFplYllmSFJ5SGJFeC9sL0FGWDAvRVpYUERLTXlBQkZOcEViRjFtaUNEczI5?=
 =?utf-8?B?N3RBTWFWbk9ZNFpETHRJUzExQWlEZFRLSnc1N0YxYi80U0ZOcXpRNXhxYjRh?=
 =?utf-8?B?dDFwalU1N012RnlhNmhrS0VLT1NrcWdpazBUSmdCUDRDR0EvQUhyeGUyT2Y0?=
 =?utf-8?B?SjdTYVJQdmwvdnI3WVRLS3Iyd25qS0dkNXo4TmNjTFUyMkEzM3gwYzlxNlZv?=
 =?utf-8?B?eHRLQkhyV1hOM0xiTkNRUm9JZFJwUHRLbUNxSG1zQjdmc01yajgxbDhxSmpt?=
 =?utf-8?B?eG9zYXMyZUkyc0RhUUpmREduYWVoZjhIKzhNZG5lSisvWWhVSVh1TW5jT0NM?=
 =?utf-8?B?OUZGcHZ0ViswVW1SUFJjMHRQeFEwcFNWdFlmTy93SEpsOHFpNGNKVWJ6NWRt?=
 =?utf-8?B?cGNrSG8vcE9XQ3d6Qk1xN05hL0VydDdTd0x5TS84YU9LemZ6V3V3dk1hZ0VG?=
 =?utf-8?B?dUZPTEJKd3ZJOC9HK0JPTFBMTlZDK2dnRFBuM1RhOEV5N29ueFo5YmJqMVhT?=
 =?utf-8?B?TGVYRWpvSms3TTNLQ0NyaFZKaGZPT0plMkVkOGQzSEFuRlI5cklyVXNES2pB?=
 =?utf-8?B?RVlzS2lVaFZJeXE0MFJYVnY4aFR3ZjlrN0tlUGtUdVVlcFZEVG5MMlFHL2t3?=
 =?utf-8?B?T1Nha0h3amtUcjgyY21aS2srZEt6Z0U3MkV1cUR1NzV2WHVVZ1BJalExVS9o?=
 =?utf-8?B?QmpjVHQ2UG9lSzZITjhieUtRUGpWbzJmb3UvZitNSkRYdGJhK3FmdUxnc2FP?=
 =?utf-8?B?V280ZUlZMzlqTmV4VE44K1FGVzR3cnd5SE5kTFJYVUVQQm1Zc1JNbE95Uzc3?=
 =?utf-8?B?RVlWV2drbFBvblFIQndSN2FaN0hZUG1zbVR2L3NZd0kyREQzTWJSWndERFgx?=
 =?utf-8?B?UHkyd2pXM0EwczhBUXNoWWRYaXBiQ3VRSHROb0x3aWsyd09uODU1akJYTzdq?=
 =?utf-8?B?QXdYV3haY0RISmFQL1NRc2t2djhhM1g2dVpaY0QrWksrMzZJSWdJVm1acHYz?=
 =?utf-8?B?MUdsOWZ4V3c4Zkw5YldJSTJDcURiUzM2TUM4U1VNVWxETVBrYXpCOTR1SWR6?=
 =?utf-8?B?WGxCV1RvQk9TdGNCNDVtdTB6NTFCbDlFc1gyQ1BNdDR5c2NwaEM0dkZYbmdS?=
 =?utf-8?B?UkJNVG5GT1dMbGQwVkR5dz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:it;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR4P281MB3510.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230038)(1800799022)(366014)(376012);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkxHd0VRa29VRE5FNzhoc3pXdGU5RXpNbndPTDUrUEZRNks2TVo2SnZXbFhR?=
 =?utf-8?B?cE1scE1xYnV6THNtcUhxaVdHbWYzVG5RY0hrSkNzNGdnQmpMNndWVlVaK3Fh?=
 =?utf-8?B?V0RVajRFY002c1FzUE5mbVpTckxjZzRwT1poek4yWDdhRGl1VnRGU2UwdVBy?=
 =?utf-8?B?UjhBV2RSQzFkd2hhRFgxTS9yMVZYU0lweFlUUjRLVEVPdG5XMmZQRUlFZ3Vw?=
 =?utf-8?B?U2JtSjRNT0wyZFI2cTkxRmFpRDB2NktucFU5RVk4Z1c1MFdaUGdYaFdMd080?=
 =?utf-8?B?cG1zTS9KR2tLd0dDSUE2SjhaeGU0a2FhbWs1aUtrUllwWjFWekl3aTdleHN6?=
 =?utf-8?B?UmdCQjVBZTRZL1Z2ZXFMU3cvMU1PdkhIbWlSYkN5OHpkNTUyTkZSQ3kzTy9N?=
 =?utf-8?B?RFQyQmNCU2VCbC80bVM5NmJmL0RSY1hscW1FNlJ3SjJIRUZjcjFsd2haamx0?=
 =?utf-8?B?TGZqVG13dXc2SVJya1gzMjN5RDVWVXl5Q2hoSEJKMHoybkFuSjBnV2Nidytz?=
 =?utf-8?B?clladythMnhaZGk2VWNoTDZUTUNKQjNSLzY2Vmhyb1FyVnpwQlhsVll4K2hk?=
 =?utf-8?B?d2dKcDU5d2R5b0VmWitNTU1YelpxWW5YbjZHR2ZxMDF3ZjN1Z1ExSlpGR3pB?=
 =?utf-8?B?WEgvRG51ckMybmpIVmxjK2dSeWV4NkpaQXFUTXRSSDNNbVpsTDVKU0hqVjFL?=
 =?utf-8?B?Z2NDL0d5bkFPVXJrOE4wcXMzN056K0g3ZGk0YVdvNE0rRW54SGEwRVVPeTFP?=
 =?utf-8?B?WGFLRE1yWDliZXV0QW9uMlhIQmZoeW92REp1YTA5Y0swNGFGcXJjenJYdG9O?=
 =?utf-8?B?azJvRjIzTTZ1Vm1rK0pSUnJOWk5yK090UGVHdHdnMWlhaFNRNmpWdWd5bkhL?=
 =?utf-8?B?NlA2TmgxRUh4SzZpMENjb2F1SE9xTzVsNEczYWV0Q3Bob09OTTByN2ppTzJt?=
 =?utf-8?B?czc5RCtYd08wVDBWWHJmUld0UDB6NFZmS1NrWHdDRnVsdUM4QkZJUjZrOUdH?=
 =?utf-8?B?QUxhdllxS3VXUDRUQnlyampndlAvUEJqTFhvSlRYNHEyQXBjRGxPSThzTlVL?=
 =?utf-8?B?ZkZrTTRoYWE2QjRsbXN0dDFwVlcwWHFPaG9BOS9YYjNuYzhKY1ZVSlY2S3lI?=
 =?utf-8?B?cHVyRGxmSXlPVlV3VVcrQ2g3ZHpDVEFDRDl6b2VDQVFZSjBHRUQ1eXhZaXpY?=
 =?utf-8?B?RGJ2bUFCVWRmSndDMmpSZllIN2xwcCtVMVpqalI3c0tUQ2JUNllESkRQeHBU?=
 =?utf-8?B?OGNrbmlwR2pVOU9CVWRPcktCQzJCS0UybjU1SHF2MFRIc0l3cVYwWWY2Rmh2?=
 =?utf-8?B?TU4zZkJNd0ZTdWZla1UrdEZGMkxHdXF4VHJ5Z29PYy9RUStLSjdaYXhTaGQ5?=
 =?utf-8?B?ZHFJNlpZSEd5QnZRSGpzYWtiZTVJdFozZXdKRUhLZ2txamlheGFJNVlqblNM?=
 =?utf-8?B?NGVVbDd2eEZTMzdzbDFRYmE4NzcvQ0xiUmRsZTlpczA4aGdRT0xzWTBIMXhr?=
 =?utf-8?B?WE9PcTBvbWJlUEgvOWFhSmxXV0t1Y0ZPN2J2VjNvVXVMMC9DMHRQcktZNFZK?=
 =?utf-8?B?K1ZaejdrTDhTWUFtVndHYmsrL2hrOEMycUxFUmtSdjBQeFVyWTRoUlNlMjBx?=
 =?utf-8?B?QUhYZjhUVW1MYjEycXRENGF3TEdQT3NOM1FNRzlpaGt3bmJKSzNaYVBCUFF5?=
 =?utf-8?B?RmhrYTJyNFBLSzBFeWRhS0drRzRaUnlKR2ZJaURwZE95SnFKV2VoWXo4bVNB?=
 =?utf-8?B?MmxiYU5yV1hFMGU4ZVFuUkUvTkFqeEx3ckszckVSeElKOWhlNm9nUUlDRC8z?=
 =?utf-8?B?bHdMbS9hUWRMNml1dlJqTTJOYmNkeWgzSmR6cTBCVktGcHIxbWJyc1NqY2hJ?=
 =?utf-8?B?d3VDeTJ0VlFtdWNpQVlYSXZCb0FkUHNxS1dSS3hub3FpTndvSmpNQWZ0TXVi?=
 =?utf-8?B?aGZZRGhUTTFFRU1RWURvUEUrSk9QUUR4NFdDZWhQSVZ1UHh5Y0JkOVpObFpU?=
 =?utf-8?B?Q1c4L0ZDVUxlZGd4bmorNlFheHhwd3ZHRll5bTNsSnJCTXlQcDU4S1ZWaU9I?=
 =?utf-8?B?dXBtaUl1bzIyemRrMUdFNWlnU3JRaVVqMXJHaEtkdFJrdzYyOTU1MWhnVjNu?=
 =?utf-8?Q?tiJYdshg6jZ07lgGSa9dKK9bp?=
X-OriginatorOrg: eckelmann.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ef26dc9-e5d6-416e-5ce9-08dc955a874d
X-MS-Exchange-CrossTenant-AuthSource: FR4P281MB3510.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 21:05:23.0687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 62e24f58-823c-4d73-8ff2-db0a5f20156c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CF0Uj1ufufb4zdwW2JJOc23ktCcBbhfoCkvxe1ZicpHF0xpot4tgD5xvWFyWWwA4f6H0Hi9Ab6dko31yJ+MK2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2P281MB3323

Signed-off-by: Thorsten Scherer <t.scherer@eckelmann.de>
---
 Documentation/translations/it_IT/process/7.AdvancedTopics.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/it_IT/process/7.AdvancedTopics.rst b/Documentation/translations/it_IT/process/7.AdvancedTopics.rst
index a83fcfe18024..b3d8b62f3b57 100644
--- a/Documentation/translations/it_IT/process/7.AdvancedTopics.rst
+++ b/Documentation/translations/it_IT/process/7.AdvancedTopics.rst
@@ -200,7 +200,7 @@ all'ABI dello spazio utente, eccetera.  Qualunque tipo di revisione è ben
 accetta e di valore, se porta ad avere un codice migliore nel kernel.
 
 Non esistono requisiti particolarmente stringenti per l'uso di etichette come
-``Reviewd-by``. Tuttavia, perché la revisione sia efficace ci si aspetta un
+``Reviewed-by``. Tuttavia, perché la revisione sia efficace ci si aspetta un
 qualche tipo di messaggio che dica "ho verificato A, B e C nel codice che è
 appena stato inviato e mi sembra tutto in ordine". Inoltre, questo permette ai
 manutentori di prendere conoscenza circa una revisione avvenuta per davvero.
-- 
2.43.0


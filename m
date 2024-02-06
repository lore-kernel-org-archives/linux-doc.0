Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233352BCE8
	for <linux-doc@vger.kernel.org>; Tue,  6 Feb 2024 13:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707224686; cv=fail; b=ZTcEA5Vg69bWAWPOHF5eMuup+NH/P83BYx0cJL3AgxRhsc2fxjvZ90SPVsYWqmZxO51Q/gxrJLFVeUPB7/SabFklEc3u73gt/avS57PGDKg5ibdQ2l3NMcr7fO9QSmeCONpQk2xtgJAEeSsyrUQpPs83sYh5BTGB7Gj9ku2eQtI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707224686; c=relaxed/simple;
	bh=8KV0xIA7/Jt1PhxsW53vxXykkk7HW5CAdcmlqrPOZFc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hcsmbeKqjoITEYMrsQ51yEisUMGrUGzveGJL8MgRddsE2jfPsseRBUjOQXoCklZDRJVQqB7knrQDIlqn/1YuIdiR6d9w7MK1vB3liJgXcpvzdB4G4E2cCJ7Kbf/dY70Rc2aXEazYsIPPG7udzghu4ijEqcHnGgNdk1fCyswPns4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ioBnj4gf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=op7NpD4f; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ioBnj4gf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="op7NpD4f"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 416AdN4t025990;
	Tue, 6 Feb 2024 13:04:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=FVzPMk54tMVKqb4pcKoy6soErp5qlbGv6bzIH1ogKI4=;
 b=ioBnj4gfEMonujuiULOjW0VX5ZQGublc1aToHSvZIp3vT+/C5aAEC4H6os+y/I9BbtYo
 B2EoF7UtLO/DGXpWxszVxX9mRYBK53NAO2O9gk1Y5vvXZ+1gW95VcQkzmbg3V4zqJPop
 5QprEqRP3NzaZbTHNWkBOmdrPeyKzxkFSRcmoA16xoo83zQgovOd5Uu0tbPwGzP54NXr
 kyhtmvDhtP8wgfrTnpcJqTEKZLVj1WO3l4inl7/cIyaDWFgaC0st7BG3uIyKZxCM+2o/
 jDCI13/KTqgfU0HX1l0JGkHNrCUsHgvnGksBRklF6NpRKSoVcMEQTri62WdaFIRGniv5 Ag== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3w1e1v6pkv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 Feb 2024 13:04:40 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 416C2S83036826;
	Tue, 6 Feb 2024 13:04:39 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3w1bx79nq4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 Feb 2024 13:04:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j39I1qLv4ac0XIEwTqIWPUCsSBbP7re7gYKobYjJPekZjf1zDS5XeK/4YAy/DfQJlT7HH55kG9lIg5NXu/f3ydrMdyf7IKV4KI3HgHClFIlY4aV2ficpcf2PgOK2nWxOshDSD2Cav1FAJTqLYVVr5/v9ztzepFxrCZ71gg6QD5mYgw5e+KxoNmemgNkod2Zr+ZemMWRSneykPfL4H0dXq4JP2JLGu3arXfo+mQdU64YEpv3AKENzePVSc5EhDqOqDci2RDDZaaVdFZ8qV1LglboYr7wJhp2JJ4Z7Mkqql4mGcBhlUqbtervg8CilFE0zeV7J/mnB6eEOI0TjD3Z2fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FVzPMk54tMVKqb4pcKoy6soErp5qlbGv6bzIH1ogKI4=;
 b=FZ51NIoImkDyssoIWx2hPDeTR/HPq+T2RC8ZV82iQbKX4NaoXCbwa1Y6ON0+nWuI9L0O5AGeOhhmSrsyC0NvhDCM3fxEnGULGin8mHRoWBGMOSC/wRHwUxjagx5WkIeo5CP56HLxkC79PEPR1VrhyhC4oDA92prDBAQQxYkRDVu6La67wvO2Kw8VW8sY2F3ZJimkqFNAMr+LlE6l4Yb3JSgLwwF+GmZbH8iHJYzo8PZRbBL/MQ/BKJ+5hWBtJ+GhjAMFrfxkske9ujvmlECuY5zyCrmSf2BHIAFS2TlCRiEAIFiyEbJMw2zsxqBV7VYzo4Vq+RuScxC+foToMTrnUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVzPMk54tMVKqb4pcKoy6soErp5qlbGv6bzIH1ogKI4=;
 b=op7NpD4fJ+Ekr+g+rHp2GGXmVFVQYwdoEWQYXt8xKagKtEswA7Ol1MxAnLXegujadgiJ5sgHScw8B4iM9+UEPuPm3rYBvlHpoKotYTuO4HlaL3YqkmDunMVAfLo+Tu03SInOJOHKCcr4cxTqmT0QVkZ0lErPsd8wQW5bvK3VH98=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by MN2PR10MB4400.namprd10.prod.outlook.com (2603:10b6:208:198::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.34; Tue, 6 Feb
 2024 13:04:37 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::2e34:ae4e:d7db:ab33]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::2e34:ae4e:d7db:ab33%4]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 13:04:37 +0000
Message-ID: <d46018a3-3259-4565-9a25-f9b695519f81@oracle.com>
Date: Tue, 6 Feb 2024 14:04:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] docs: kernel_{abi,feat}.py: use doc.current_source
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-doc@vger.kernel.org
References: <20240205175133.774271-1-vegard.nossum@oracle.com>
 <20240205175133.774271-3-vegard.nossum@oracle.com> <8734u6dljn.fsf@intel.com>
From: Vegard Nossum <vegard.nossum@oracle.com>
Autocrypt: addr=vegard.nossum@oracle.com; keydata=
 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 8A==
In-Reply-To: <8734u6dljn.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0258.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::30)
 To PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5433:EE_|MN2PR10MB4400:EE_
X-MS-Office365-Filtering-Correlation-Id: 36f100ae-ceb9-4970-d7fa-08dc27142c0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jYQMMRB4vVWu+T61M6bu80su2B2zUrh11yT2px0UTDiKTju8/UbUImF6HHyvLfkZVRw/V3odfKnN9+ekGOPal4fiGv4YZVN9OOrkaRWZF2nS2Mmgrq+rCQgREUcxzPmFbnZGD0ItqZXr3uZs6fWGvvBoOeEDBu5S4D6tp/KTaGGSom2dVTtN1u4NRHfxu5t6Z9TPwPEDvuiQudinooVmDbzo/nrcDmbxE6Hd1RZcJLdLxuOeq5SRWJeHBbmZMVBWRBDRnE/WGd+EKm7ulwAT6/Gqa/DTBv2b5wIhVlID/UQXMRYti4N+6c1V2be992iUFyM+RSaO5q9WITVnq2MU5mmlXOwmjUcB0IkxSUiTCTjly2um2Wv1FIF/wNE4KWNIHyzR+708lWzPb82T71RFcjUExXL+UKd1Z/BGWbdekEBbod9MHAl5YZm3Y/ARnDvIujO+F4CCaAEgCho92IOS9wdxwX1Dfte9ZuTNreLEyjITs5F3eKpi7lEuyVE+HQ0imSTveNbcNMpAzzpQLX3bzqEBuWRn7tNlbRxe5iFU2FLlzDaQ09W+usBrrM/MXDCdpsebfrErl0XpOCj2bcnP2YwT8Pk97EpQ03VrxRBaLrMi9crBJKc0h1qvHvGlCAqnlbbichtv/a2hWqD3TMXC7A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5433.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(39860400002)(366004)(136003)(376002)(230273577357003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(6666004)(41300700001)(36756003)(8676002)(4326008)(316002)(6486002)(8936002)(66556008)(66476007)(66946007)(110136005)(44832011)(5660300002)(86362001)(38100700002)(6512007)(478600001)(2616005)(2906002)(6506007)(31696002)(26005)(53546011)(31686004)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R05vcGZnSzMyM21QRnBoYm1aR2tWYXZ4Z3lUZlI2dmxJbVMvQ0JyYmYrL29H?=
 =?utf-8?B?L1duaEZFQ2J4S3JvWlExcXRoN0tHUkVYS0s0WFNzMkYvc0dFRW4xUUc2ckZw?=
 =?utf-8?B?WCtDa3ByaEU2VmxZb3dyT3RxRHVhdExIWFdKZHlwaExLa1FkYWcxa3Z4L3lB?=
 =?utf-8?B?K3A4M3VhajNraG1RR1I2ak5TR1JCeXRncTE1ZGF0eUpqLzZ6WDlmNUxROHpC?=
 =?utf-8?B?dkUyUkVDaEJyT2NSZjVFVjV0YUp3ZFloWXFGWGZsbEwwVVN4VHl5ZDliYTdk?=
 =?utf-8?B?ZlUzNG5Fa2JpdTFhNzlMR1RQN2YvQ2R1L0xiamNEa3BzajJTaTJvSnREWFpw?=
 =?utf-8?B?MmVoZy9NekYwKy9UMXdUYmkwMWtQOXZqUDVueTlZOVdKSnBqY3loSWxEY3Rn?=
 =?utf-8?B?SU5kNkduQUwrVjNvTXMveGs0eGtjeHF4SEpiTTN2MysvTG5aMlNJZGFiS01w?=
 =?utf-8?B?Z0EwZEgvZHRlT0VieUVMamFGOG10VHROc2RLRmc0alBqVEZUWmZKYWdlaC9F?=
 =?utf-8?B?VVZwVW55czlqd2VXdDJRTk1NbXE2QlNNcWpQM3U3R3FRTkg3bDFIVzg5OEdt?=
 =?utf-8?B?TjhITk1LWWtJYlFaZWdjY01haXBUWnJLaTBaU21JZmdHUWlUSDBqTUxkRjZw?=
 =?utf-8?B?T3lZSlNpdkZvUjE0T0pmTVJPSytVWTdsbDZkN2FkTVJsSG9YTVVpRmpBZThU?=
 =?utf-8?B?VVdXU2JLWDc2TGtBRmZSOGZSSUNPMXlZQmdoaGJvaGVObk4xQjZoM2x2YVVk?=
 =?utf-8?B?WVRKeHltUmNEbS80WWdkNzRFSTBqempIRjlvRzFFQ1RwRmpBaUx2NGo3THhH?=
 =?utf-8?B?TmdYMkdEcFZOSUhBS0VWbkJaZ0NXRmpJdk9aTjV3NmZpTVd5d1dsQm84ZnU3?=
 =?utf-8?B?ZkJ5OEQrMXRWeUU2WC80ZmlqQWliQjdqd3dNQmI5Sm1JWXlnQXRYajZUOHVJ?=
 =?utf-8?B?QlJZZWxQcHVwaEcxMUM1KzNGaC9lUUk5ak9SY2R0T2tQQ24rTmdRM056M2tC?=
 =?utf-8?B?cGJvMVViYnZxajlkZWdFemdUYyt0SkFsUXpWZEU4TFRSaERSdWNZNSs2NjdW?=
 =?utf-8?B?QkFjZzRmTWU0SWQ1aThJdHYvODNWOU9DR0NucERIcVJ5eStQQUZXY1p3bEZ0?=
 =?utf-8?B?d01rYW82eTJYcVI2bDdVMzBWeHJKWVFsZGxDSno0QWNDVU1ReWUrSk8zLzA2?=
 =?utf-8?B?elpPM2Z6Z3IyRjltcjluTkZwNG1aZk9OazI2YStOeEkwZGNxSDRCeUZPUHBl?=
 =?utf-8?B?VlZjdVZkWU9Cc2NIU3M4M0pNTVpIL240Q3R6THUyRmN6TGgxM01LQ1lYZmhj?=
 =?utf-8?B?Q01CM2ovaUpJQXM3aWZmT1dmZCtDYitWVDlENUpBWk5kdC9EcTNNbG5vcW1R?=
 =?utf-8?B?eWVSRk9uNlo5a1dhS1FYaVZkSVp6UDg1d0dLUUI1WmRWejVaYnc2RENJUmQ0?=
 =?utf-8?B?NTRpZ2tvZ25SSGRWZEdBczl5TVZaQUgyTUtkL1NFL3hCTGZWZStQODJ3ZzRH?=
 =?utf-8?B?TTFpaWRyZ3NwVXFKK3hmZmFYSk9WR2syajczQ244MnpCV09KUVUvbWJXQisv?=
 =?utf-8?B?RGVodnZTTENNRi9oOWFKakZwY3BCWnZ5em1hemF3azFuam82Q05ISTVOdkMz?=
 =?utf-8?B?OVRPY2RpZXRaWDJUYWxpaFZ1M3BqMFFLM1UxR3VpdDFhbDh3SUNEdUtTZXF3?=
 =?utf-8?B?ZnNmQUdmNW5GNjc5emg4Rlh6bGlYTG9ZemtpUjNQdTJZbEJmLzF6UnE0Rm1j?=
 =?utf-8?B?Y09BQVRidlVzWktxZkdSQ054bTlGVWVGYzFvV0J3TmhYMWtjSnN1YkdOYVFS?=
 =?utf-8?B?eTV6QTk4NEwzbk1OZjhnbmRrcDFiZTRSK2plRzliQXdkN2FaLzNRUUo0QWNL?=
 =?utf-8?B?aVdSdTF6TWl3eHBqLzJGNzZ5T2JhRnVjU24yQjZBaXNYb2E5RGVPVDlzbEZy?=
 =?utf-8?B?QUM2ZFZJUCtQbTh0VEFyamMwbFlNZjNmM3J0S0ZoVHRZSW5TNWg2VmVwUU9R?=
 =?utf-8?B?UDMwSDRTNnZ1OFk1TURXQUxFVkJjRGZWSHZKWDJsNGFjRTlUbUZqTGtabGdw?=
 =?utf-8?B?Z3lkVVBwWTFZTUZBaUtWYzZTaXB4S3VmMFc2TlB1NmRCb2FyYlE4NTFoL081?=
 =?utf-8?B?OE5SL09DSFR4L1E4cmMwMThIWXUxckZnZFUyTnJtdThyM0l1QUZHYlMvZ3ln?=
 =?utf-8?B?RWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	FwfhALQR4GQEup1MrvM8p0cAB/U1bA2q67lVwQryX4DDuijzf+P6DVas9YekXxgo04o2qw7VWZ0MBwjCiE6M88lqvW9nBZqH1pghWdU3K/v4qISRoydmzYjkXYatMYV1vxTxVl7LNLvO3aMnNr/ESwppqqL2/KIgTOCG/+QPrlRYo5W8Yi9rVnnvpPjH3AlpPCwoSNL2191bIxB9lbrImXFVQzRSx228T/qZgOuThFZNAnUmYeCvZx0kdXMeLm+0Rv4vmr0skWEXxyfqLf5Z5U32cAQm31rOOZQgvZTgnVLeE1vphWMJfI6mZfGt06ddtGprukpxhEUBBHATkOrpfA3LMgdyMdaAHu0ASvSuhPb4ozdj0JIbSCqkk9UyQr5OxmP8ye60wyC0KSOG1YmbQllSDt1JKN2qrI0t4UivQ774C9oR5/xm3HrzH8e2N5kz80u3GbBK4NGW/CzUdjFoc48tNnTGiwwxl6v80HT4taqVZE9vaZSSDZrbe24s1AxC8XPCWcJLdSiSQ3olQjLO5OWbvG3AdxHIL7xpH8KPuLbdtIBYNqM/6evkFjEBbr5Uxy0cfxxjgzOsPWJXKMlIKuvN51YMSA0h8mMvNUOEW6c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36f100ae-ceb9-4970-d7fa-08dc27142c0d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 13:04:37.4660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Nx0V+Js4VQXnJeMCdN306iCWnqDU0r5eN+VfgCrzUkHNy+82vp2C5FOLDnCuLu+GLolweaZFHBlBhcKgTqdZaIJxNQpj3e8evOz87ptQjw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4400
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-06_06,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402060092
X-Proofpoint-GUID: bHq60BpKm2gimeeibodZ8YRLLPARlVm6
X-Proofpoint-ORIG-GUID: bHq60BpKm2gimeeibodZ8YRLLPARlVm6


On 06/02/2024 09:49, Jani Nikula wrote:
> On Mon, 05 Feb 2024, Vegard Nossum <vegard.nossum@oracle.com> wrote:
>> It probably doesn't matter a whole lot what we actually pass here,
>> but the .rst being processed seems most appropriate to me.
> 
> But it's not the actual .rst file being parsed here. It's something
> originating from some oher file and processed in between. The kernel-doc
> extension takes care to map the parsing errors in source code comments
> to the right source file and line, which is where the problem is, not in
> the .rst file.
> 
> The line numbers in the error messages will be adjusted according to the
> ViewList. So I don't think you'll get messages that actually point at
> line where the directive is either.
> 
> Please experiment with some errors injected to see what the output will
> be.

Thanks for the comment, also see my related response to Mauro here:

<https://lore.kernel.org/all/3fce153d-37c5-4c4d-a4b3-44e376daa095@oracle.com/>

TL;DR: there are several different issues in both kernel_abi.py and
kernel_feat.py related to error reporting, and it's on my TODO.

High-level explanation:

Both scripts register an rST directive which call out to a Perl script
(scripts/get_{abi,feat}.py, respectively). The Perl script generates a
mixture of rST syntax, some of which it generates itself on the fly and
some of which comes from auxiliary files (the Documentation/ABI/** and
Documentation/features/** files, respectively).

Now, the two scripts have diverged a little bit in their implementation
of exactly how they do this.

kernel_abi.py (get_abi.pl) is the one I would consider "more correct",
since it actually attempts to attribute the source lines correctly, by
taking the "top-level" filename as the 'fname' parameter to
nestedParse() and updating the current file/line number whenever it
encounters '.. LINENO:' from the Perl script's output.

What you say is true -- when there is a warning at the "top level"
(before any '.. LINENO:' directive has been encountered), kernel_abi.py
does not report the actual .rst file being parsed, it reports the
location of the '.. kernel-abi:' directive instead. This is what I
changed in this patch (2/8) -- I changed it from being
self.arguments[0], which is the argument to the .. kernel-abi:
directive, in most cases something like ABI/stable or ABI/obsolete,
which is not even an .rst file, to being the .rst file that contains the
directive. My rationale is that this is more helpful than just being
pointed to something that isn't even an .rst file.

Now, about kernel_feat.py (get_feat.pl), it has similar logic, but
worse, in a way: get_feat.pl outputs all its '.. FILE:' lines at the top
of its output, followed by the rest of the generated .rst content. So
there isn't really much point in trying to attribute these lines to the
"correct" file -- yes, we should probably fix get_feat.pl here. Anyway,
the script doesn't parse the '.. FILE:' directives in the same way, it
just attributes ALL the generated lines to self.arguments[0] (or
doc.current_source after this patch). The only thing it actually uses
those directives for is to tell Sphinx about dependencies so the output
is rebuilt if one of the sources change.

The bottom line is that this reporting has NEVER fully worked as intended.

I was attempting to push things in the right direction with this patch
series, but I didn't want to do too much at once since that makes it
even harder for the patches to get past the Great (Review) Filter.


Vegard

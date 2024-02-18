Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F82531A66
	for <linux-doc@vger.kernel.org>; Sun, 18 Feb 2024 13:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708261649; cv=fail; b=uSgFTBiWz03CF+1cXNdGnUwXFomshEF/PRcTIZAfevszgS+rTKt9u04nT5/NkzO0w3FBTfb092Jibez6UOVp8MJII62HElF28xPGzV4xEkvSVzzjOPpIG8FmT5b7LS27XQgVb1gALofHmEowa7k9yuomKyMIMmlYViUmbwcjgDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708261649; c=relaxed/simple;
	bh=xrqaXln+eGm4qTV6hDCqbDNOWMA62W/JXbOZdezhGxA=;
	h=Content-Type:Message-ID:Date:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=mrp7YMT+2Qwjyg7Fem6KsHrwo0kX3yY3kyw8R8JX5eMgtempVt/rAvA3wlWU4qr/ZjaSaBT+s+4VseIdAwA1uC00I3cS0wMiJi01Onb/jyJvd7Y3hkW/bfCy/IOG2XrpLp7NZpFCKDWxdv4HxeqZHSEMSo6vhfxBgiWZc+UqRbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UsjtnnnG; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=eUFyKCwN; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UsjtnnnG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="eUFyKCwN"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41I2tsei023616;
	Sun, 18 Feb 2024 13:07:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=content-type :
 message-id : date : subject : from : to : cc : references : in-reply-to :
 mime-version; s=corp-2023-11-20;
 bh=8q3pG/qMOy00i1EC9EDkxh51AJV40a/AJtatIRcwzmU=;
 b=UsjtnnnGFHQoHQJckNdz7h0StlYYC5PkdOySFK6ZPqAAUGoj95H5wgam0LDJkwE/Om3I
 8bHq3LNZjY4gtiElzh4KuLLSMzeAar9DLs2nS81YKPbZDrr13Qu/XsqkkoCfEtiP8w4z
 F6NMeBGo4HBO4fNKd1xmqGICZAG4SZbRnDuN0Cs3pH6CFVTos/hba2XbWyLr/tglYIJx
 o4qvadWNdJeriU03vZx1RS7U1QrWDb8cVX8cOhtuhb7dRzmzi7ZBnr77XQ6JEX8AgaJw
 junsHsge8n7DkyfRS0/78xkmIElSwjtF4mR4NygKBr9GR7d2IeebnTal/oIk4xeI72GL 3w== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3wamuct4s2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 18 Feb 2024 13:07:15 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 41IBR6iF008306;
	Sun, 18 Feb 2024 13:07:15 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3wak84trg1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 18 Feb 2024 13:07:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nSa8W07HfW7XpGjYh74aN/DBeygArJBM2YhTKTWQuw37Av5Oki3vMxWFExAFjBC6H5NbfeRHA1vwy3YpaFEDj9jBI0cV2fXMPcGqCvMf7c9KLfLTg2iiFsqnxI3Zg8QlJHE5/Q91+V/d6Thpy1l66TDZBkzOHuS/RPRXewsA1Ys795JOu57K+qzIfu4zTSNPWeP6Ws8mlMY7nO8tIzTI5XHNT49RYKiLuEtnB2ON0D69Uuewq9kwsXsa610QFHGsvSOJYIS6AFaNh+E7qrg8y0jpSeZQRdyizbnBW50iQklY+1jYUx2W7y85LLceuJtkUdGmvGFsmaxN4EYvNSIf/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8q3pG/qMOy00i1EC9EDkxh51AJV40a/AJtatIRcwzmU=;
 b=EfzKlZpjrQ3e0nWD8VNDBC7rIYG0TkVHCQsbtXJJVQEj3jddIqZNSTFoEgia6lDrs8qKdz9y5QTWOdX1O1ePG9c1S9msU+3L5mjLYgNeGlDcvDhYttMzassFEc8YWApQtoKTVqYgZjjx0H0VAIq4/lvBQrlFnu5h5dSxmtB8dV0XqRnVGciC9kDntojMiWakyG2r/d6daNRlC2fvFrIO5f6OYEHn2/2q/uj0hsj4Q0oMBZtoLltwJrH/otIUEOA84HAoNmnPOIb2rv1DVJXJLbuA65x32O+7Uvq6q7vbqNffgPyovP02erReXgO2keBWwS2hByHPq1NdrnM71j6tNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8q3pG/qMOy00i1EC9EDkxh51AJV40a/AJtatIRcwzmU=;
 b=eUFyKCwNTijUOQbjQrkSDYl2M2IHtx+FayMRn4K+hd0UmvImvHQUNe1KEjgX/L/9o8UnBz4H8e2+ALZzfTxrlIxhNImmctMUMGe72LRNKsOMUlkyL5tGyI25DJPb4fez2NfM1UVVlvQq8KIjDqsNR5J2PFwLnD5otw6YrEkvOSw=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by MN2PR10MB4128.namprd10.prod.outlook.com (2603:10b6:208:1d2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.31; Sun, 18 Feb
 2024 13:07:12 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::6e32:a89a:f2b6:864b]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::6e32:a89a:f2b6:864b%2]) with mapi id 15.20.7292.033; Sun, 18 Feb 2024
 13:07:12 +0000
Content-Type: multipart/mixed; boundary="------------mbLKB0P1fKWSMSCk7CVrcn6F"
Message-ID: <c6817759-62fc-48c8-9446-e985b6234745@oracle.com>
Date: Sun, 18 Feb 2024 14:07:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: PDF misery
Content-Language: en-US
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc: Akira Yokosawa <akiyks@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jani Nikula <jani.nikula@intel.com>
References: <8734tqsrt7.fsf@meer.lwn.net>
 <ec394023-1dc4-4dc9-8f90-77665b297823@oracle.com>
Autocrypt: addr=vegard.nossum@oracle.com; keydata=
 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 8A==
In-Reply-To: <ec394023-1dc4-4dc9-8f90-77665b297823@oracle.com>
X-ClientProxiedBy: PR3P191CA0037.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::12) To PH0PR10MB5433.namprd10.prod.outlook.com
 (2603:10b6:510:e0::9)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5433:EE_|MN2PR10MB4128:EE_
X-MS-Office365-Filtering-Correlation-Id: 7be8ed4f-56d3-48d5-da22-08dc30828595
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NnSlB2M06jsC2bp9nVtvu1LaFUZ/LX0dyp8FZKf9RVRBOH1QB/ZwTgvrQOiGGz2dsNGwERDLjOBnyK1t850rjFox1fVh5r+fs2DSYjQynNFWxy73A+9UhkmidyoCVRoVsk55EmNsMAS3TcK4ZY3m+CYYOYjeWDz/mT/IXmMaM73MGkLlkAz+PzxBokWH/94tWWqTMq7GiAtMCB/+xx7LSS78KRI7O+gie5moJ28669beIzNlVfyluEY0TKgrXv/5Np7PAFPs7yOuYPYRDWWibGJy2IscHkJmkvVtDHM8mfrQwr0ISre84Ro6xaLI2QKB2o4izaiV1lsf6Nus0Y3s0PCM0zmC9wEC4+o4W0DHWIh36UPVsVxjZqk+hccd/yiq6lTppzMB7vndLXF2aT5Af6mZe0GgoLAYPLCgEMCGWXIVj3xWGvVbzArh5VFIq4KCbMj1zzttsWnn1jraELPQtR+37SyrBJ2gYHxBTjkQXM0BJ0xubwVLaSyRozmUWNBMoY+2XpAxERMAJGyzrYrlYSFD1JiEkxPCRxSjXb0bPcDbj4Ba43pasXWpoNEXRARu
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5433.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(376002)(136003)(366004)(230273577357003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(83380400001)(3480700007)(66946007)(66556008)(66476007)(8936002)(7116003)(4326008)(8676002)(2906002)(235185007)(38100700002)(44832011)(5660300002)(478600001)(2616005)(6666004)(41300700001)(33964004)(26005)(54906003)(316002)(53546011)(6506007)(6486002)(6512007)(86362001)(31696002)(36756003)(31686004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y1lsUXNhNFEwZ2FFR1VnVFJtV1psaW5kQUlrSURwc2JIbUZFdkNvZDNkM2g2?=
 =?utf-8?B?ZlpUcHJkcU9mYUNuUXN3ckJIdEY5cVA2N0VYU2tDWmhpc29TZ2k0Zko0bjkr?=
 =?utf-8?B?NnR4bWo1TGpwSENkVDE2Q1ZPVnY2WjF4dEp1b3JyK003YmV4V284azV5ODls?=
 =?utf-8?B?NndRTDl0WURES2I4QXNjcENDTEEwbFk1Z255d1NITHBxbkxNdDAzY0NyM1F0?=
 =?utf-8?B?dmhwekRyMjZJeVNlcTdrYnVYeHFGeUsrbGNxdW9aMzBZeTRrMnFkYmFUdVlh?=
 =?utf-8?B?VVM4UWNiTFpRcGNKVCtPTncyY0RuU0g3QzFuNlVkcjdUeW5HTXhyYm5DZXNG?=
 =?utf-8?B?bWlKeldDTzVaVjB3MUhSL3NqMkppN2lPeE1MVHFaREZrSGhGc3YvZ0VYU295?=
 =?utf-8?B?R2Jrd3hHTXZJMzBwbGhKU1Y2emZHdngrRlYyUW5YamxNc0FEY2pJQWNCbkFE?=
 =?utf-8?B?K0V1M2U1UVFYL0pIZWp3SnZFT0p1Qm5qcXVkMWQzV2xPOFlVcy9wRXYrV0kz?=
 =?utf-8?B?NDJWdUNBcFFmYjEzcXpWN2Vsa0pSKzhsVWs2TkxmQVhmcy94WGpHVHBtODB0?=
 =?utf-8?B?WE1xT3BQZDlHSmZZYSs0U2RhTzlpV3l0bi9uZXpmc3I3aEdwa2lhSElsQ0V4?=
 =?utf-8?B?MHBaditNQmtUOGNUTlhHYmJxb2FKVVAzQUpBUjZJcmVhcFNtNVM1ejZhbzFF?=
 =?utf-8?B?QkZ2WkRJbjZ4clFxckNPb3ZicW54OTlYWURXVngyeCtvVWNFQmd4WHFYOVRZ?=
 =?utf-8?B?Vk5tU0xQSm5kVlp3SmF6TW1wRjY0YzJNTlErTlJJNDBrRDlXOUI5ZHhBakhk?=
 =?utf-8?B?NUQ2K2Y4UHBIRngzdzdLT3hTVVo1a1RUS29JTExwY3AvQXByNmJ6M0xldmlD?=
 =?utf-8?B?bEo2TkVsN3cvV1hEVE5uYkk4cUlDcTlqNFZGV3c2WU45azNXWlk5TEQ5RHoz?=
 =?utf-8?B?WkRTUHU1Nm1KV1RsWDBOcGc3TnY5RXNadDZJbDN5aHBjSTMxNHRkeXlXcG96?=
 =?utf-8?B?REs1YjhnZlhqdUJySndnVDQxMmorYXRLS1pvOXA1ZjBOd1dSQ1YxWEFhdGl3?=
 =?utf-8?B?WVRVeTd0S1U2MVZGdjk3UkNhN1hZVjczMFNSWXAxK2ZqalFDYVR1d3F6bXVn?=
 =?utf-8?B?Nlp4RVhmZ0hXRmFLcTVGc3pvcTlMV2Y4dENCMm8rSjFqY0crRkY5OVpqa0Jp?=
 =?utf-8?B?eU4ydDVMSTJPTkpxVkQyTFdQd2wweHVUQi9uNmxOZTgxcnNyWUJCYnFoMUdm?=
 =?utf-8?B?RHJueG90VlZCL0Z4QWEyMC9WVk9kUW9UVCsvL3RHbHRXeGZORDMzbFRLQTB3?=
 =?utf-8?B?RG1MZUVjaWVSWm5kdmVUbktlMlBhWXdUdVJTNzRFZWdCRjhyQU9aWXpwZmJp?=
 =?utf-8?B?dWxFSzFacFVJMXg0ZytSeEtJVUFROU5sdStTVEh3YlZlR05lUEhCK3lCU3hS?=
 =?utf-8?B?eHpaMkJEdzNGaWVDbDdGY2NTbVM4MTNrSHU5SXJ1d2o4ZXFHUG1PblJwN2dS?=
 =?utf-8?B?TjREU09POXREM0R6bEd4OE5DTGRlaHRwblppN2g2K1JycEtMUFMwcG9LOVlM?=
 =?utf-8?B?Y1JoWlhPZTRQY0R1L2VlYXZGMW9KeEhoSHd4ZzhtYlFMSmNaVzVab08xWkZU?=
 =?utf-8?B?Z1hkeUczTDJuTmVhTkNCcUgvMWNMNFZjUzY1bkVPWWVuc0M0Yk5QQmR2SnRG?=
 =?utf-8?B?STlyVjBUaVNlSnpicTVjQVRScWI0cm1DZ0dtbGtIeStqNTRHYzVaOGpCaDF0?=
 =?utf-8?B?OXJQTC9XY3Vic05mZ0VBUUhWbm9SNHlGUkxBV0d0aUVTWlV2Tnh4MERpdjR6?=
 =?utf-8?B?Q05ET041dkNLSnN3RTNRRlBoVFIyd29PRTlYMDNvRko1YXZQbXIvR0dSVEVv?=
 =?utf-8?B?TnBLNzJQUGFiMGoyMGJOdzgyZHVJSWF0ZkM0aGFJUmI0THB6VGNiaDJocU8v?=
 =?utf-8?B?OGV5SVlvZDNTb2lYR3NxMy9vZDlXYkRCY0xCU3dXOUI5U3dUT2taUmI3TDRt?=
 =?utf-8?B?dURNTGxNeFlRVXg2ZlBHdHhHWkhJZ0psN2I5U3FvcVB0WC95QzBZd1dZRjdj?=
 =?utf-8?B?cVkwNWl4VlRKZ3BBTUlXeHVFUjZoU3h5dWZBaitEektKYWR1WFBoVlF4TFJI?=
 =?utf-8?B?ODRlWGJxKy9iYkFpd250RnR3d0xSdVZNV0QrYjh1OGJ5MExuSTJJeTBQbUlk?=
 =?utf-8?B?YVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	SW3EAeTAW735CEMJy0z3xt1GIK2edaSx4oSnpsT3LTDHQDWtC/SkRaERyz0zYcQ4j9qvNZ9KumnwWdPd6r8kZoDu0zX8GZ/Iuc2wUbt+VLhB376JVpxA0S8WNCSYrOZbxj0SmAplJqzDZVQh7WI1oV7pvO3zFBtoMdoPcDHoU6NTnECblQ/BnW7fJkfS9TKLDdjBUignu0oE6PEzxiW02VvXU/sQsAW2dOlIzRR5mnmd7AGS0npJ2+6Ke0Zu3rAiQEyuba4WOvLonwWS0JQEeVHrFDNwmOp+mh4qHaD5ekui/0J+eFoP3lzPP4KeaDPmJkhA/ztqFuMowbYrVFqCuTDVkOkFHJw3PQZDqGAFUjDahj4aq87zqnj7VyuPqQRcJLgtaKKUmb5wM17XS8Av8X6AdZ2l6l2aWeBOQheF+xPQx1KJgNAzHF5dHjv55T7BkBCPT5b4qtLgIJ6agmVnZkKV1edT3i8l8OU2Tn9BS7EnrFBjpUgb9CbyZxk288WDth6sTW1YDiqeLCimgZeyyDGbwZslscM+4RIdHgKGgq+2K5xr818cO/U1ZU+A37i94DrC5MUA6ZOAnjnfkWXF45f+BKwM+1h9suKaFrdGeMA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7be8ed4f-56d3-48d5-da22-08dc30828595
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2024 13:07:12.7240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ngoFsnbETAeXkJ74OcEo3C6Nwn4p3VL+8Y550VBuXcxcNYFUxmLPOn9UW+1FfcifgKv6mPeanFv93+CY42kWGs0l9MloYYUdxymb+biAi3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4128
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-18_11,2024-02-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402180100
X-Proofpoint-GUID: GbiBOtJXXzEdCiEKpPfgZFLCJrCbY01J
X-Proofpoint-ORIG-GUID: GbiBOtJXXzEdCiEKpPfgZFLCJrCbY01J

--------------mbLKB0P1fKWSMSCk7CVrcn6F
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 18/02/2024 11:08, Vegard Nossum wrote:
> I think the "bug" here is really that Sphinx generated LaTeX code that
> doesn't build -- and that it didn't warn about the problem in other
> modes (maybe it does in newer versions, or maybe we overlooked the
> warnings?).
> 
> If we'd had those warnings then we could have stopped those constructs
> from entering the documentation sources to start with.

With the attached patch I get:

$ make htmldocs SPHINXDIRS=filesystems/xfs
make[3]: Nothing to be done for 'html'.
Using alabaster theme
source directory: filesystems/xfs
WARNING: xfs-online-fsck-design.rst:2096: heading "Case Study: Sorting 
xfarrays" has nesting level 7; consider restructuring

Maybe we can do the same for itemize lists.

I didn't check what impact this potentially has on running time. Also
only tested with Sphinx 4.3.2.

Thoughts?


Vegard
--------------mbLKB0P1fKWSMSCk7CVrcn6F
Content-Type: text/x-patch; charset=UTF-8; name="kvalidate.patch"
Content-Disposition: attachment; filename="kvalidate.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vY29uZi5weSBiL0RvY3VtZW50YXRpb24vY29uZi5w
eQppbmRleCA1ODMwYjAxYzU2NDIuLjFjZmNlYTRlNDg3ZCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRh
dGlvbi9jb25mLnB5CisrKyBiL0RvY3VtZW50YXRpb24vY29uZi5weQpAQCAtNTUsNyArNTUsOCBA
QCBuZWVkc19zcGhpbnggPSAnMi40LjQnCiBleHRlbnNpb25zID0gWydrZXJuZWxkb2MnLCAncnN0
RmxhdFRhYmxlJywgJ2tlcm5lbF9pbmNsdWRlJywKICAgICAgICAgICAgICAgJ2tmaWd1cmUnLCAn
c3BoaW54LmV4dC5pZmNvbmZpZycsICdhdXRvbWFya3VwJywKICAgICAgICAgICAgICAgJ21haW50
YWluZXJzX2luY2x1ZGUnLCAnc3BoaW54LmV4dC5hdXRvc2VjdGlvbmxhYmVsJywKLSAgICAgICAg
ICAgICAgJ2tlcm5lbF9hYmknLCAna2VybmVsX2ZlYXQnLCAndHJhbnNsYXRpb25zJ10KKyAgICAg
ICAgICAgICAgJ2tlcm5lbF9hYmknLCAna2VybmVsX2ZlYXQnLCAndHJhbnNsYXRpb25zJywKKyAg
ICAgICAgICAgICAgJ2t2YWxpZGF0ZSddCiAKIGlmIG1ham9yID49IDM6CiAgICAgaWYgKG1ham9y
ID4gMykgb3IgKG1pbm9yID4gMCBvciBwYXRjaCA+PSAyKToKZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vc3BoaW54L2t2YWxpZGF0ZS5weSBiL0RvY3VtZW50YXRpb24vc3BoaW54L2t2YWxpZGF0
ZS5weQpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjMzMDJlOTM2ZGI3
NwotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vc3BoaW54L2t2YWxpZGF0ZS5weQpA
QCAtMCwwICsxLDQyIEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCisjCisj
IENvcHlyaWdodCDCqSAyMDI0LCBPcmFjbGUgYW5kL29yIGl0cyBhZmZpbGlhdGVzLgorIyBBdXRo
b3I6IFZlZ2FyZCBOb3NzdW0gPHZlZ2FyZC5ub3NzdW1Ab3JhY2xlLmNvbT4KKyMKKyMgVmFsaWRh
dGUgZG9jIHRyZWUgYWdhaW5zdCBrZXJuZWwtc3BlY2lmaWMgcnVsZXMuCisjCisKK2ltcG9ydCBv
cworCitpbXBvcnQgZG9jdXRpbHMKK2Zyb20gc3BoaW54LnV0aWwgaW1wb3J0IGxvZ2dpbmcKKwor
bG9nZ2VyID0gbG9nZ2luZy5nZXRMb2dnZXIoJ2tlcm5lbGRvYycpCisKK21heF9oZWFkaW5nX2xl
dmVscyA9IDUKKworZGVmIHByb2Nlc3NfZG9jdHJlZShhcHAsIGRvY3RyZWUpOgorICAgIGVudiA9
IGFwcC5lbnYKKyAgICBzcmNkaXIgPSBlbnYuc3JjZGlyCisKKyAgICBmb3Igbm9kZSBpbiBkb2N0
cmVlLnRyYXZlcnNlKGRvY3V0aWxzLm5vZGVzLnRpdGxlKToKKyAgICAgICAgaGVhZGluZ19sZXZl
bCA9IDAKKworICAgICAgICBhbmNlc3RvciA9IG5vZGUucGFyZW50CisgICAgICAgIHdoaWxlIGFu
Y2VzdG9yIGlzIG5vdCBOb25lOgorICAgICAgICAgICAgaWYgaXNpbnN0YW5jZShhbmNlc3Rvciwg
ZG9jdXRpbHMubm9kZXMuc2VjdGlvbik6CisgICAgICAgICAgICAgICAgaGVhZGluZ19sZXZlbCA9
IGhlYWRpbmdfbGV2ZWwgKyAxCisKKyAgICAgICAgICAgIGFuY2VzdG9yID0gYW5jZXN0b3IucGFy
ZW50CisKKyAgICAgICAgaWYgaGVhZGluZ19sZXZlbCA+IG1heF9oZWFkaW5nX2xldmVsczoKKyAg
ICAgICAgICAgIGxvZ2dlci53YXJuaW5nKCIlczoldTogaGVhZGluZyBcIiVzXCIgaGFzIG5lc3Rp
bmcgbGV2ZWwgJXU7IGNvbnNpZGVyIHJlc3RydWN0dXJpbmciLAorICAgICAgICAgICAgICAgIG9z
LnBhdGgucmVscGF0aChub2RlLnNvdXJjZSwgc3JjZGlyKSwgbm9kZS5saW5lLCBub2RlLmFzdGV4
dCgpLCBoZWFkaW5nX2xldmVsICsgMSkKKworZGVmIHNldHVwKGFwcCk6CisgICAgYXBwLmNvbm5l
Y3QoJ2RvY3RyZWUtcmVhZCcsIHByb2Nlc3NfZG9jdHJlZSkKKworICAgIHJldHVybiB7CisgICAg
ICAgICdwYXJhbGxlbF9yZWFkX3NhZmUnOiBUcnVlLAorICAgICAgICAncGFyYWxsZWxfd3JpdGVf
c2FmZSc6IFRydWUsCisgICAgfQo=

--------------mbLKB0P1fKWSMSCk7CVrcn6F--

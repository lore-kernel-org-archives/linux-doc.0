Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5079E13340D
	for <linux-doc@vger.kernel.org>; Wed, 24 Jan 2024 19:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706126194; cv=fail; b=jmQzx0mOBHg48pAmPTwSw1wbirJV1sgEy9YWZ3aEBCDe/ErGCmKDaX5NKwYZCpfWeQXsdW9FMAMTx3k3k+s3PH4eff5VnCecj8jUY4+HjF/UsE51tbu8dge8ojIBgiECOvgsspgjrHJ4t/qCrDWzX/+trsUBjvHcl3DSAkAS9VE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706126194; c=relaxed/simple;
	bh=1omc6By5Fymakr1szXnhLFgs2IR3oX675vBN1eKpV80=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KyiCwemCwqJpiEhzLBUkPHLEGUNjXM5VkC08wZeGCRcEvcJ7A2nrgG+A4VDX4Sy7vT2v2Gx4rkoZoOSURBKV1dZdqfV8inz0zOvD3wJFTWaCXfT5Uvep0qhk2t8/wQbQUYIm2vPFoMLsxAxwKTMI8OfiAFrra2OE9MfBXcGNVgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=k0soiINM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vND4HwWp; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="k0soiINM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vND4HwWp"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40OHE2Ds019047;
	Wed, 24 Jan 2024 19:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=UIgqcqozwTSkrnnpKJkkJnzA/cxpng8qQJkDli8zSZM=;
 b=k0soiINMhpSB43DSFHMX2Ey9093kqED567Qit0YaVMk4MI30Yh1JVYDMUEnJ3WXCEIP4
 tkFAOWHG95FJ4P9Zg3CEI18dh+dPytwBPvm60sBbpMKPSFQpPyXZvluHfGK1fOqJ+Zm1
 bklutlFA5mnh0ZTd1JLHEEP8o9LCBBz6O3H6lDQY/feWndnA+qClaMxOsrVZPFTNSD+C
 lri2cWlWnktZKqL/XnZfzkEDU/0Yb0pq1ZLpQLkm1v1xztdQtYme5g+6BwwP3LeYToIV
 ib5ZSQw4cEZpTUjd5SgKitG/iaHSUUe3wXip7Qr8ltZrWmY04meeVS7hWxK/YOAFEaGg jQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3vr79w4x8d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Jan 2024 19:56:24 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 40OIg63J029780;
	Wed, 24 Jan 2024 19:56:23 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3vs33vg7xd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Jan 2024 19:56:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mVRFfhpv9iTMbHUiOxdqWx01G64iMctpEDW+8UaEGLq6ffjRmf0IIRnuN8x6dxiABixE/W8I7sB4ibpn5gDjrqyHQXQUWY2iNw1tm3xJVMmS5WNMbGra8n0ynh+/D7/pREqcUMFOkun7E5p/KXsj9OL6sGlzArXVTT6AnpqTmANP1nP2ZN4rSOpZHoGQ+W2lLjwmSSHTs1prf1A1DtT0Zeuc7yxYOfrrTACkYKlascoTfFvXvehSRGKVN9vgW07o22+3U0xeP+b9OehyCXWDfb3k49SJhzi83MSpIr8yaseVZMh84vH2hTxYeUhw0wIqiKPzZAH+5D/4nhV7kbdU5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UIgqcqozwTSkrnnpKJkkJnzA/cxpng8qQJkDli8zSZM=;
 b=BRBhkr/qbKunBUJd0SpP06CX3Ci8rGwSoLIBLZsKgBElYsphyAk/jmCyXetNtvJ5OEDpjkSsqO17WOdvrNukYRa3gLK8alSimFidnrCk+Wvw5D+M0JfTRaPvd5U8J100nQDBWdyHSDMy+mniGfBAmSmfKPxtlQwu1t6zl/bpEkrNee38CnaAPPA2/9vypWz3E0ir97aCQHRzOpY4TkVyjvdMIhxFE4ZFMKGG+RPDyzvDyuEEIugKPtwNZUjKg/MO+tA+FXpZAyhK610r4i8hjwFyacOJBuN/f3W+jPLbIQ/yJW55jucrX/ukQA26fueMXd+L39cUMBnuv21+PrIEqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UIgqcqozwTSkrnnpKJkkJnzA/cxpng8qQJkDli8zSZM=;
 b=vND4HwWpd6Eu1A0jUHd6CdujyOMFZQqZ6JIMXdjEXP172o+mOPFnIpu8wgeO4sUHEfRJVmKhuegAtuCUjN5dRtJCAeHe2jAzBI+ymeiM+Mjim6C+LygTQcqF3KQgvpbgf/+PHfTD/pSD7CadgzSyywXV1h4GQAFFG4FWCVU/wMw=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by SA1PR10MB6615.namprd10.prod.outlook.com (2603:10b6:806:2b8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.36; Wed, 24 Jan
 2024 19:56:20 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::5997:266c:f3fd:6bf4]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::5997:266c:f3fd:6bf4%4]) with mapi id 15.20.7202.035; Wed, 24 Jan 2024
 19:56:20 +0000
Message-ID: <2a6dc748-44de-4cf5-a8ab-10e0997131e9@oracle.com>
Date: Wed, 24 Jan 2024 20:56:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: docs: requirements.txt has stopped working again
To: Akira Yokosawa <akiyks@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
References: <cb72b3d6-de7a-4c8a-a99c-72d58a23f89c@gmail.com>
 <b0ddcb5d-e735-437c-a828-5e400facb978@oracle.com> <878r4gnsev.fsf@intel.com>
 <2018acaa-a6ce-4074-b3e1-1a12018573fb@oracle.com>
 <6e4b66fe-dbb3-4149-ac7e-8ae333d6fc9d@gmail.com>
Content-Language: en-US
From: Vegard Nossum <vegard.nossum@oracle.com>
Autocrypt: addr=vegard.nossum@oracle.com; keydata=
 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 8A==
In-Reply-To: <6e4b66fe-dbb3-4149-ac7e-8ae333d6fc9d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0345.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:39a::13) To PH0PR10MB5433.namprd10.prod.outlook.com
 (2603:10b6:510:e0::9)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5433:EE_|SA1PR10MB6615:EE_
X-MS-Office365-Filtering-Correlation-Id: 65d35a7b-2126-44cf-8f49-08dc1d16889d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IyCHzqo/AhyIlcrpYlbApgNy1noI2CrKtlLLEsANYKYbGSRwE/6n700FuVUkP8LJO6OsItaTl1WkUdN+ASiD+rcnpYVSGvTKoWGhULIHAJgJDAmwlKfJBvKhL9Db3DkEdpyt7mmjxoUOpkONKHBq/42iYIj8GeclHosVHaEzt2bAqzqvD13GvczPiiICvOeoapBYvWzw8/E4uyADKXEK503d3ZyTl/lBeTu7QgGUnbOP/qTlsIGPJEXD6OA3+jW5f9/dhoDaewWRazu8QGL8y83uHwuEDClpYL9WVWOYT/p1NuSEMLYs5VW1tzGOsGuplTUngGbeZ4nwvac07oDqizSQ/6v06Ecza/gpSWr2rqHhssCCFVBK5FoGpHMXQ64HNsjOk9vtbfWAISuV+LN4bZsjAzQMg+W5l3uJqcP0363L4sjbWj/4l8wNoRbtDNT5Cw2GnfmUvG1vUSyFOrfdvK0NC0YjPq7YDPWXTHNTr8H0RLz3C0i3FtDvSfeIFsj+Z/EJdnh8CSTiObrDSTJujwXmUB7Jts0w145XjxUf0MmoBODMCwr3pb+UBYSYv7GfjlgqFnASidZ5Gc4d5XKZn5I3JCfYCYg8XjZVP+FC7AlR+7l3iVwtHkjkePAmkeJP9IWIx2L4U/wLsCWEBV97Gg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5433.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(136003)(366004)(396003)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(41300700001)(38100700002)(31686004)(8936002)(31696002)(8676002)(44832011)(66556008)(6506007)(6666004)(2906002)(5660300002)(4326008)(86362001)(36756003)(53546011)(26005)(110136005)(316002)(6512007)(478600001)(66476007)(6486002)(2616005)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VVk0WkJqZlo2VXQ1aW0vNTVBNDBqMFQxdHh0NWwvQjFtRno3elo5VnYwdis3?=
 =?utf-8?B?MTNUSDhmcHM2SGFrbTNSMzV2OEQ4L2MxSU9VNWR3Y2xWTit5MUFQaWFwcFhN?=
 =?utf-8?B?d1djazllZ1Jyb0lFOU9mOVNKcEN2OFJoWEFZRWFpbVU4NDJSYzlSN1VneTVU?=
 =?utf-8?B?c3k1U3VKSjBCNVdVQWhoU1RjT3BCUnR3OTB6M3A4T1lmajl2Ly9lVG5BazZU?=
 =?utf-8?B?SS9hUUNVVWxEYllkUVk5S0w1TG1FSHJVK2h3MjlGamZBWTk4RjdHaC9Danpk?=
 =?utf-8?B?NnVXUkJpYmlpQU92S1pCWHpjWEUwSDY2UXdsRVN6b0lidlZZcHBZcjVyR1Nx?=
 =?utf-8?B?NUdGR0hzSWRFd2o2amVna25Jem05bWhTdFM1bHZnVWJUeWhjUEg0UENPVG9z?=
 =?utf-8?B?T3lhY016K3NuaTd6dzlVZzhsKzlBUVVnN01lemE4eVNuSWgwSUcvamVWYlZh?=
 =?utf-8?B?SlNQbGp0RGxLamxMU0FRUnRkMmVnQkRLSkRjd25QOEVCeGptT2NLUEZzR2tN?=
 =?utf-8?B?NHZsUWVhOEZEK0dzVzJXTnN6dzY1cVEvbHBWbnBGTVRRM1dPVmxZcEEwUUE1?=
 =?utf-8?B?RWZMY2QrZ0VURE0vZ1Q3emFUZXNLWWVVNUhvUDg4dFhwOWdoeDBSaDNZNWpB?=
 =?utf-8?B?dG5YeDNuWUg1VWgxbmVxRVRoUzVlNC80dGJhWmZydnNCTG5WN0ZEaE5OWnJr?=
 =?utf-8?B?UGN2cmxUWlhFUnhLUERTZDNCdG94YzFzRWl0Y01LR1owZndEUzk3VkdHVmk5?=
 =?utf-8?B?UFgyMVgyY2docStOdGJLNWF0RjQ2bU5pdG5nR0c3ak5SaEdHb3JlWVVZR0lK?=
 =?utf-8?B?STFicHdWV3hDSDRRbzlWNThDZGd5V2VTaXFENlJUQW10dmJWbUgzc0RteFNj?=
 =?utf-8?B?QmZsZGR2ci9SSk85d0trOW0ySmZock95dC9jNno0dGtTam5Pcyt6MXY0eUFy?=
 =?utf-8?B?OW56SDdWcU1MV1p6OUkvQ2Y5QWgwUFVBZTBQVFVsdDdpZHNmRnZHUDcxQ0tj?=
 =?utf-8?B?ZERkQ2RQSDJDQ0xWclphenI3VFJXdUNIZ1dnMlJYYnMyT2VHeGtsMllkczJ6?=
 =?utf-8?B?UVQ3dWJpd3daT0pTYVU4WWl3UVgzZnBrRWxGSGRlRTBwcmF4UEc3andtUXov?=
 =?utf-8?B?ZnM0TGpLamxmQUVmMDIyZEc1Q0d3TzNQa252dFFRWEtJcTF6MzREQVBvREg5?=
 =?utf-8?B?MFkvRlNWVXZ4ekVCcFpBd1dJN0h2SkRCaEt5TERDODRKdk5YWHZ5bG5MbVV5?=
 =?utf-8?B?U1RZYktWek56ZGRzWXQ2VjFQaVJJbG80MmNoeUhDSmV0a0JiN01qdDRiZnl1?=
 =?utf-8?B?OXd4VWV3OGpXV2dmUmw5ZTFTRXhZZmx0aEJnN2tzTE5ZclZsUFZLc0VGVjFF?=
 =?utf-8?B?VCtGVFBGODRPeWZNY1A0Wm4wMklIQWdxYUhraHZ5dTJRWWl3eXJFakc2WUN2?=
 =?utf-8?B?TVE5ZjBnZlVBZlphTWtUcXFSYmJMSnFzeWo2SjlGcTZQTkVCdWMyTjNzYitp?=
 =?utf-8?B?MmF4MXlSLytFOWp0anNwaVBNM3dCQ0xmZUk4S2tHZHZkOXFzS2xjQ2xHUHRK?=
 =?utf-8?B?R0ZtdDVQU2cwenYwYUQ1MHl3STBXOUk0VVlEMzNMWHdaeWFtaXlvK09remZW?=
 =?utf-8?B?d0hMZWROcVhTTlRwR29aNEdqVm9tbFBLLzZuR1dSZTg2RzNZUlM3YmxhTmVq?=
 =?utf-8?B?NXZ6OXhnOWMyalVqRFZqVklBaTZKeFNOcUNBa3dPWU16YzREcnFuZ1J6QXY1?=
 =?utf-8?B?MVdSSnRmTlZQSTRhWE5NOVhBOFdvOXFsTkExd3RLK3h4anFCcWhqZkRRQmEz?=
 =?utf-8?B?Z3hpNTNqck9UUGtISlhOOXljVTdBR2duODVLMVN1bGh0eFRTd1AxNEk0U2p5?=
 =?utf-8?B?amlPUEFhRlh6M3hDbkp3NWd4RFVvMFdOdmpkWHZJTXRRMWVYOXBTaUg1ZXRq?=
 =?utf-8?B?MldqSlBVVE1GL2UzTnYzeUI5UVBDU095alF1SURZTDROWGExQjFTV3I4Qk9X?=
 =?utf-8?B?TlpnSHg0VjFvdk1ocndaWVQzVUJDSjJ6QXhOUE5nZ09EQXBsR2h5U2piUWU3?=
 =?utf-8?B?L2E2Z3A1cGlMWjU3aWRRTGpVYVpRaHF5WkpZT2FCRzIwOXNwMitnZjVaOGd3?=
 =?utf-8?B?ekNTUENBRUw2NW1FbytPQjdqYzZ0VWI2MWY4TVYyUVNLQ0FlOHA0SDZCK0Rm?=
 =?utf-8?B?Y1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Jd32NVgLdw6FGOain9in0G4liB5Je4YQwNQYLb6W7AbI8MZjWxcvOUwE0hDJ13wIeloDBE1sR72c3OfBjZsUw2ye0Tx+SbRCcq2ST3IWU3dhCUhZ3WzR87zQ2LEXdY8TY24gk4mIBntenv0ifbbA5JsprFsChMhZ36bokLasDZsiilL+P07swjmCCZk/g6BQ+kOnWYP+VXN4V56OsAWYbMJftp+UB8b6bkHla+qPV9mMNa3ebKONX6038DJ9+KOjFs5q2jqtwm4hZR9d2IqfqA2T0jlcmk9S1PLTSACzXRIUY1jhn2IvQ33YxzPLfLoOHDSFNNYlTHzbqmxbuB8WoRoZAEWsyGJmD9BuNURhsC6KXZgIZGmuOmXmKBCZL+anu5XdG/cHNsRkcYc7hrzazl3eRPoM0qgyQRUHGmpNRLkytmINxyLefaHj0muLHwVnjGVeHTfWqxRjBMxq/sCTnta776TDj5xTN0pvI1qYwX8s8Xx83iAto7edzf2lG5isumuVyeAriBe+Iz5+pJfb/uLRhpi1z1wqST/3XUhndUz5mYCzHb+RIxbT8Kq8ybU0Bmm8Dti7won21mgS/n6xH+PrkZfaOpyZHZgpWb5l738=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65d35a7b-2126-44cf-8f49-08dc1d16889d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 19:56:20.0602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cd25KbaFcbXqozligK4SpRtqO2YqLrz0e6mYGho03f5cj+V/2Rk8OnmIxgMl1r2sQMJxxqNYOsCmZXusG9MyC/NWg+Lcp1xV+iUbAWC+9Xw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6615
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-24_08,2024-01-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401240144
X-Proofpoint-GUID: jJ3KkDcu7vhbcjNiA1lKmJLPCIlcgtp5
X-Proofpoint-ORIG-GUID: jJ3KkDcu7vhbcjNiA1lKmJLPCIlcgtp5


On 24/01/2024 16:02, Akira Yokosawa wrote:
> On Tue, 23 Jan 2024 14:21:32 +0100, Vegard Nossum wrote:
>> On 23/01/2024 13:30, Jani Nikula wrote:
>>> On the other hand, if you're using a virtual environment, what's the
>>> point in holding back to a version as old as 2.4.4? You might just as
>>> well go for latest, specifying only the top level dependencies,
>>
>> Performance... Specifying exact package requirements like 2.4.4 is
>> useful since 2.4.4 is by far the fastest Sphinx version that builds our
>> documentation correctly (AFAICT) and build speed matters a lot when the
>> difference is 10 minutes vs 30 minutes.
>>
> 
> I've never observed such a huge difference, probably because I almost
> always do clean build of the document, i.e., run "make cleandocs" before
> running "make htmldocs".
> 
> So I assumed the performance regression Vegard are emphasizing should
> be in incremental builds.

I was actually referring to the full builds, but see below...

> Here are some of the results comparing v2.4.5, v4.3.2 (of ubuntu jammy),
> and v7.2.6.  (v2.4.5 needs "make -j2 htmldocs" to avoid OOM.)
> Incremental builds are done after moving from v6.7 to v6.8-rc1.
> 
> VM spec used: memory: 8GB, threads: 4, ubuntu jammy
> 
> data in each cell: elapsed time, max resident memory
> 
>                                      v2.4.5        v4.3.2        v7.2.6
>    =============================  ============  ============  ============
>    clean build at v6.7            10m08s 3.3GB  10m31s 1.1GB  10m14s 1.2GB
>    incremental build at v6.8-rc1  11m22s 3.3GB  18m55s 1.2GB  19m50s 1.4GB
>    clean build at v6.8-rc1        10m45s 3.2GB  10m32s 1.2GB  10m13s 1.3GB
> 
>    empty make at v6.8-rc1         3.3s          6.6s          7.0s
>    =============================  ============  ============  ============
> 
> I took only one sample for each run, so these numbers should not be
> taken as representative, but they can still show tendencies.

I've done a new test here with numbers that aren't quite as bad as the
ones I gave above:

2.4.4: 12m46,609s
4.3.2: 23m50,909s

I also did some tests the other day on the same machine:

7.2.6: 21m31,522s
7.3.0+/91ed62272712: 23m23,220s

These are all full clean builds.

I am quite sure I actually saw 30m+ before on 4.3.2, but maybe it's
because I didn't run 'make cleandocs' before and I'm running into the
same slowness that you see with your incremental build.

> This means the slowness in incremental build is not improved in v7.2.6,
> which contradicts what Vegard said earlier in this thread.

I think I've been confusing "100% clean full build" and "incremental
build where everything's changed" -- I didn't imagine the incremental
build could be that much slower than a full clean build.

Thank you for bringing clarity and more precise numbers. I'll know to
do a 'make cleandocs' now after switching branches if the bases are
not basically the same.


Vegard

Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985E820AF87;
	Mon, 13 Jan 2025 16:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736786909; cv=fail; b=G98Ki83MiUprM4PqumQZnSibsKdWeEg/JW3Rwci/GAzF669Co+x7EJanw/lwqG4slbQTZZP9kT6869tY+5YcUHg2E2n/d6OU/tU+aBrKp2Ry6utl6ozCq02xcyNFCJvzyv621XP9mHb+UgIFuLKtnAxhNDLwmaMkwUY9SVNat7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736786909; c=relaxed/simple;
	bh=J09+Gznk0yMa/D6DEpFJE5BhuhIIkynykFYDoWq5XEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=N9sO0pU/k6zy5iYEZ2g+9A9g9imhcaWfTXOxq364rfINT5rPgP4Y4qMaQEMzKYbbqmPL9aLJkcd9qwutu5DBTQ9hLfPBhpBJq03L1ut2DCd9iLohc7ndn1kZBqCx3xpVt9cMP5y3eC6nFpPeVEJY0Ah56aq5CfSDxfTlH86ocN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GXR9+n9b; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IhiSFqKk; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GXR9+n9b";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IhiSFqKk"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DGXpI1011156;
	Mon, 13 Jan 2025 16:47:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=3yHG9zTmLmBOj4uH21n3K4Buh7iN+reQFzcRko5SepA=; b=
	GXR9+n9b/vuwQ2vHE24HLUxgwBGjlNulm21DOwthmLe6RHnKs2cPVctv2hV88GHj
	3OHiRV88nMnWV9l4w2yYfHiNOhk1GEp1SuiZlnKy8vdTuEOc1r2+48vwMKIyxZjG
	gkBs958WCZkfa+mS9vsT+BcEpxRYW4J1XzHEYJ2DGQ/UaDlUQ3DCn17dqiUd3cEe
	gLs+TEOzGCok66pdIC8FlNf4Iuc6MRLHNMq3bGyreP0/6gL9WgySGmORY/g4+dqc
	CFR8mPT/Dt3rQm2ogixuENLj4Ff4PJYGVeRYaHDg6JPwtHF/wHjNA99wymXCW71D
	Pj/ZznQy+IyEcsbtkglGsg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443f7y41jt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 16:47:57 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50DGYJdL038991;
	Mon, 13 Jan 2025 16:47:57 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 443f376s81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 16:47:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m5Nh0zKXkcjkGfOfOQx2zgI1MPWDuF5u2jRP7VXjpSIcfue2xuL869An/oX+jMRPZUwMjvqLDBX8VC1oky9LFyRSxL1+bvVVnN/mLcJ5+OWejuUbwCEdMMyv1rjQhZdYll1uS2buxcnnBzuHwxjOCDZnQGApLYgdR7fNI4yDu7atGIB6uobITy1C+D8ipOxabR3LNvxXuz9KhlxNQjMjCERbN4ZVeHbPLN4RWAYnF9RMNSTdGRz+fUGnRA0WBNNpQCgn+gCv1KBrDE7tkMHheC8vDeUli3zPrpRX3ZSRbgvI1eDK9BRaPqorgrwYida0slkQ8WOwxPIO8PCW6IQuJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3yHG9zTmLmBOj4uH21n3K4Buh7iN+reQFzcRko5SepA=;
 b=V57JJH8HcL7BO+pAXIGuXbKuoBccRH8SBUpofnaUAlno0OlcC2gsTephDJAVRLyiBAaszvlywKxvsdQo6Yiry2bhh5j5qmUM8aEZkQo++//7GEaoCuwzXfsCGc6WJuUhX2UWocZQqIJTb4jAHUN3k/8UFiWszlF2+BBE/MbDxJqGNk+llJmPnPmzSIXd29jWyemLDcD1S6XjfMAZuxFgdK20LKIq45PdkrTYJiArqOtzGC0MuHMeuCHFAJhfh3NUAVeeS9qghwcpnRfnnB1uWs8Al/cFI8aD2w/ds2ppWNsgI32gOT0QeiOlN257I5+XnM7BpCRnl7RAimD6zr46fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3yHG9zTmLmBOj4uH21n3K4Buh7iN+reQFzcRko5SepA=;
 b=IhiSFqKkk/3EU9IMeoIz990/Ht5PwGbJXxHFw6Lsuy1ZHeORetOMA2C+RXWs+pxPvlMrtwFGGcajSDLTrsp6q5fQhT5R2drw+Qfb2xQw5EeViAupgpvHtYw56yABfHJ6w2GxCV+F6kuzmn9+bDu/EozYyXjqYwb6A1UH917tLfU=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by BY5PR10MB4226.namprd10.prod.outlook.com (2603:10b6:a03:210::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 16:47:54 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 16:47:54 +0000
Date: Mon, 13 Jan 2025 16:47:50 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org,
        liam.howlett@oracle.com, david.laight.linux@gmail.com, mhocko@suse.com,
        vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com,
        oliver.sang@intel.com, mgorman@techsingularity.net, david@redhat.com,
        peterx@redhat.com, oleg@redhat.com, dave@stgolabs.net,
        paulmck@kernel.org, brauner@kernel.org, dhowells@redhat.com,
        hdanton@sina.com, hughd@google.com, lokeshgidra@google.com,
        minchan@google.com, jannh@google.com, shakeel.butt@linux.dev,
        souravpanda@google.com, pasha.tatashin@soleen.com,
        klarasmodin@gmail.com, richard.weiyang@gmail.com, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v9 04/17] mm: introduce vma_iter_store_attached() to use
 with attached vmas
Message-ID: <640fee1d-e76b-4aca-8975-f6bd4f3279d9@lucifer.local>
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-5-surenb@google.com>
 <6e9329ba-8dad-423f-9741-e5447f85659f@lucifer.local>
 <CAJuCfpGa9YSVtT9hapQqd9r5WFTzyAALtaK6kD7CPBKk+cvgmQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpGa9YSVtT9hapQqd9r5WFTzyAALtaK6kD7CPBKk+cvgmQ@mail.gmail.com>
X-ClientProxiedBy: LO2P265CA0400.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::28) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|BY5PR10MB4226:EE_
X-MS-Office365-Filtering-Correlation-Id: 9203f46d-73c3-469c-42be-08dd33f20667
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VHRwdDc5UUhWNkFHSUQzdFBQb2JCMGZ1ZzhQRkFjOWVNMXNUekMydTl2UTR1?=
 =?utf-8?B?cXdRN1FvVi9sSlB5MWZYUGpOZGNvY2xGby8zdURJVGY2NlBvdUpEWDlDNDFI?=
 =?utf-8?B?S2NHMUFzWlBEaW9zSko2NTNFakRIR0I4NTB3bmN1Y09ua3pJQURrUW91WFFV?=
 =?utf-8?B?cDkzUUdMQ1ZFcXJmVEhIUzVQQmg3K1c5N0U3emJaaENlTXhKY1ZNQktwNDh0?=
 =?utf-8?B?RCtYaE42WjJkTnJJOG5PU2x6UFZvOXV1bXZpbVZyb1ZXV21DbjBqVXlaYnc5?=
 =?utf-8?B?dVppRDVnYjN2TkJyejhjYjhOSDhmdjVZQ2k1bjVUM08vWVl0TkdlTXI2TnZm?=
 =?utf-8?B?NG5SVkp1bkNLY1dIalBURG5oNWErb3gyV3VBWWNuSkJ3Ri9oQnFNS0d6SlMv?=
 =?utf-8?B?QzVwUnNBS3QwSkh4Q1hoWnRMeThTVVJUcVBLNVIvS0NSQ3NGSUhQbGNtRDdB?=
 =?utf-8?B?Q2pCblE4eEdnNG02bGh6RlhubnNlaXovcEJJMEpNMDRxekN1ZGsvbUs0ZTFv?=
 =?utf-8?B?YTRpVTRORi80anhvU0d3ZW04N1cxSWxrUEtKSStYRXlWc3p5MEEzWGVPQUQw?=
 =?utf-8?B?YmR1aEpiYmtVQjQvMFQ3RjhFWUdzYmNFQVhZVHZkSTZlSjBMVDFRYzNvWWtV?=
 =?utf-8?B?cGpSRGxtUUIyb2JpY0huYy8zS09qVVNTcGJvcDZQeDhPdFMxUTkvV09SRTV5?=
 =?utf-8?B?akhXMzNjM3FVSGR6YXV3amhLdjFXWTNudWp4dTUrY2grSXBwMzJQeHJwMWk2?=
 =?utf-8?B?Rmk2NmVYTVNveEF2MUNvTWJWajBVZTZ3ZklKK1RUdnRZVlJOcGFqZ25ZYk9P?=
 =?utf-8?B?WFdzZzZid2xRMGRMUm8yVDlxV25tNml3TlBIdE11eHFoanJkTmlEZmVsdk9h?=
 =?utf-8?B?TnhiYVdLbGdJWFRCai91SlpyTXdPQnBySzlxN0pmUUNzSkhJd2tiZlF3OVhK?=
 =?utf-8?B?ZGNPRFh4SFB3MjcwNDJveWpuQ05YQTgwQkxlMGxMVDZ2RE81aDg3akJIL0lX?=
 =?utf-8?B?Zzd5c3NrbGtOZng1Y0haRkkrVHg1a2ZzeTlOMm41N3ZWdlhyOFRxQ2xza1Ri?=
 =?utf-8?B?NHV6d3RNREhJS2lKa2V1UTlWazVKdzIrc0k2TXNKRktuVUFHREtoNSs5V1I2?=
 =?utf-8?B?MkZicnRtQUZPWEpOaW4xeUZxcFJKVHdYNGZaZVhPVUtlZFhNQUM0RlV1U3hK?=
 =?utf-8?B?NS9oQXBoRXN1Uld1NDZ1V2ZzYXU5YlBhV0ZWR1FBbTZKeEdnZzg0U25YZ1dq?=
 =?utf-8?B?dkt3OWlZOWRmbzVzQ21EaHp1OXZ4aFE1Zk52M0M5STFHNkVUMHpaMXFNRU1F?=
 =?utf-8?B?dW4rZ1p4eW1nWjdmbUdmUUQya3RFc0dTZzY5WHFXdkRMV01xK0FEZzJNR3A3?=
 =?utf-8?B?K1I3WGh5R1oza1BUZ3FnRlF3T2hmQytrVENiZ056TzJYcG9vdWJrUGY0QXp2?=
 =?utf-8?B?WXh0VkI4MUFja1N6dTJuZ3BHMEkraDFhQlhVdWl1K21QdlBSSHNBS1BEaldN?=
 =?utf-8?B?SjNxVGw1dHdKOVk4MC9qTjI2SzJWMERFMENuSWpxT0gzWUVSd24zMi90U1JO?=
 =?utf-8?B?Y2NQcGlPTDRPcS9zUE5PNFhSUzd3Qjg0cGU4YjE4ZXNwb0JxdXozZnkrNVZ1?=
 =?utf-8?B?WldTT0RsTGxnK0N6elRpMzhGaDRuaDR2TG0ycDVNVDd6LzZGaERUMGRJUDFQ?=
 =?utf-8?B?MS90SkV5OTVSKzhtTldDNXEyRWxHTmVlNkJ2ZVFTMXZCZ1hPNUxQbEZJa0xt?=
 =?utf-8?B?TU12ZnRiRFhEdkJ5Z0d5ZVVCYTBYa3Bxa0lXOTdaMk5TWVZkWFQxYlJTOWRy?=
 =?utf-8?B?TEtUVjRQRUtUVkoreUFHMU5JcWZuMFhQS2tMRlMvN3ZmdDhmSTY2LzZUbkI0?=
 =?utf-8?Q?NMgNeNpCwbkLo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWx3REh6TnZUc0U2cGxkY2hWeVA3YlRlTlc4c1RrNFVzSkE0d0hsYXJvL1Q0?=
 =?utf-8?B?a0puWU4rVEVjZnZqeS9aVzBTWFdjQzdPSXZ4ZVIzOC9VMThrOTRmV04zamNK?=
 =?utf-8?B?TG85WitCMlVaMjVhTHlWbitza1FBaTFoeElxSmsyZ2JqZ3ZYT1VsL3h6ZkhE?=
 =?utf-8?B?UUNFYnZ5ZFVLMzVnWkE5NTJ3WWl1VlJLcFhXY21WR2I3ejBiaUcxcmVnWTZi?=
 =?utf-8?B?UTZlKzVHODF3RzBnY01laWZMRU1xb3pnakdWb0k4ai9KeVE0VGFHMHh4Rk8v?=
 =?utf-8?B?OHVrNkRmc0dtR3N6TGw1Z2I3bGhVd3h1cjFWeFVsaGV4Y3grN01UenlVOGpK?=
 =?utf-8?B?MDVqWFlxSmpnbWxXU0czZ3VhL0JZMW8xdWZ3TFlRZUNJSTdGVU1RNkdNNnE1?=
 =?utf-8?B?Uk1Ya0xuSjFxQzd1WmhyeUpxOERIRUlUelhDdm80VFIySUtPcm16S0pBTE5y?=
 =?utf-8?B?VCtnRlRkL3JOQktMYncyOVRpT3ZoRFV1a1Y1SUw0N3NvN1NkSWZlQ2dtT2dR?=
 =?utf-8?B?UHNJd1dEQmU0VmVVSkZXZnBBaldyMG5rYXFQb21hcGNJR1owd3B3eVpMYU9p?=
 =?utf-8?B?WXZ4QUhJV2lNZS9OQ2NIazdvUFhvM3BmSnQ2QldZU1pML3hOTTJ3TVNTL3ha?=
 =?utf-8?B?VGlpYUoyUVdUMUM1RVI1d2hNbjU2ODFLeFJEZjV5OFlMdXBCbmVTZFptdFVV?=
 =?utf-8?B?VS9yVGhYaXJ0NmM0Sk13TDc1QmdQSWpidXFycW1qQkxMc2NwYzIyZEdxLzZn?=
 =?utf-8?B?LzN1Ry9hTVRTK1ZjcTgzVVRxemZ6RDJwYk54UlN5MGFLbkFRNVN2VmJLM2lK?=
 =?utf-8?B?bTFHeUQyY0J1a1UyT1ViMVF1QmJ1SjFSUU5FdTZiWkdidlJFYy9ybE1HNmVT?=
 =?utf-8?B?d2RwOGVzQkR3dkNEeDhHTUg4NlVYTHRZM3gzOUdDU2llc2dMTDR2M1VvWU5L?=
 =?utf-8?B?QXlHQTVzOUhwQUp0TzJ6d0pwakhrejd2UklNTUtrNWxBNGJzV0JQclpvRVc1?=
 =?utf-8?B?emx0NzJHMjl6dDRUYlBLSjF0UzlCZm1nK3VocE51QkxEUnd2RUZzL09TL2ZE?=
 =?utf-8?B?YzJmdEJpN3I4YXN1bkp6T05IKzJkSmVPVXBYSjRLOVVsdnVrMVFxUjR3VFNK?=
 =?utf-8?B?TzBrV2RFZ3RMUkthVnV6V3BZZ2Y4WGs4dE55VisxNi94L1JMQ2RqRFdmU1p5?=
 =?utf-8?B?ekVzSi91VWlNeXVaRWt0MFowM2RMdm9VaWpBZnJPZ2RmWGNreFRlRE5CV2NQ?=
 =?utf-8?B?V1h5YU0yTkdqb3pIU29Oc3FmRXJhNHd2aUZ0TTQ4dDhoN1VTY2k5dlpLUDBi?=
 =?utf-8?B?Z25nT3JCTDNXbE84cjQ4NDMvY0ZCazU1M2J6Nm1yb1RyVkl6dFU2K1VpRnBw?=
 =?utf-8?B?QkE5d29jQ2htZm5oYkxmVm9TOG9LelVQRTN4ckxIT1ZVTm1rQW9PZWNVSzlQ?=
 =?utf-8?B?a2V3dTdRakZTa0NHZHAycUhIWm5YUlpKTkRKbGh4VmtObDRlME1tT2ttdDdU?=
 =?utf-8?B?UXozRVNrS2ovVUMycmU5aVY3dFZEN2F4elpybmUwVzc2VWFMNkdqbk55a1Z0?=
 =?utf-8?B?dEJLY3ViV3ZRQldPMmJlYkhrRGliT3FUT2g4V2t2T21DYUt3d2RzM1c2dkI2?=
 =?utf-8?B?YTczYU1zK0U4VmZLQUdCanVmY0Ixc0oyOTRXOXdVSGNSb3l4YW5lTGphZS9a?=
 =?utf-8?B?dWlGQWU5dnFscEtHMXE5S0w3ZUpTT1huZ0xQa250TEU1STlpc2kvdmp0Rjh1?=
 =?utf-8?B?MlprTnhvUmFTKzVOYjdLYWJpRGE1eUpYaTVrTmFRSFhtS3dITnBldFN2Q3hK?=
 =?utf-8?B?UWpycTNqS0Fpd21lRFkyUmhXNVNXWmN4TTEwNW9Db1VkQmZ3aFYrY0QySUlR?=
 =?utf-8?B?K0QzcGt0cGx1MnpTamNxd2o4UU1ISlVXOW5FTWkvT0RicFVGVkpWeStIRDFH?=
 =?utf-8?B?a3lvS0trSlNFYTZpbkhvdVdOTEk1RVZSMUtoN25zV1FPNFp0T0Rxa20zM0Nh?=
 =?utf-8?B?TnAwRFRrbGQ1dzNFdHU1RFJxU1NXUE12MkpXUFJHWEdSOEhGNGpFMWFQNTl4?=
 =?utf-8?B?eFJuRjhJbWt3MUtKYm5SMjFoYnlGYkM0WG5ZaEFaYjJWSzRhQndYM2JNbi9W?=
 =?utf-8?B?S2FrYjA0T2N1S1h5SjBXNkJiYkQ4dmNxVHFNVkZWZWV0dWpPK2JDazVrSXFH?=
 =?utf-8?B?Q2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	O1jvTgcIMov75Dxcocm6nBCHAqrKk88uTAZNkybfG2dJRRLgu5WDBACXeq5Dxs6kYIlWHhQRkP3fVA4/mhajE7merIgKYAZjmA4vZknsXBT5/0Xhax4i/7PWBbUrGPY+7WkTOaERVHMutMtexAOhrpdsPeuSdxIB3cWfoH1SC2H8S+PS3BDker1rp5iw1DNn3BOl4Q8nRSPNxpuj5ihEEY0woWtOoeOsp9DoY4TURU4EqSIQL6QcaOnCKgICeyLe18Fc6VLf78bW3UmemXC8hfLRPSglM0/2xSsSgf7NCDdohnRaWRrrAA4KjF/aXE9xs+hET3gBS9sDK7NJAi9WyaVYycIhbIv5WbuGyI+BsS1QJBgdK6dMPFNGpPq2LuYpE8rW+oYVmbjFUXzBUceTkDyiOtf8qQJPPN2mX/Upxyu2xvZx7LdM0CefKusO9eBoDp6wXyHHtxvQdZymxxVn+y9NKJGjmUCLqi8OfqjLSpYZdGHT+4FyJJlyBewG+lgDCE2jzeh4cFii0pvBtof7CIpjWJ+TyF/IPqtSJtWH1yQLfwXQa+yYWUc/0PbKKdQEZ//YeXMNG5s9zMi3KQy9hjYk6rmsOdvvTzIWUSyoMnc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9203f46d-73c3-469c-42be-08dd33f20667
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 16:47:54.1670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L9osLkWiqj+P1qYxMvq64XIa4Dskv7AcO25PXlN7Ol4XcJ6b5R3NiijQ08FHCLW5qsAfiprykhSu5wHV8qFTQFYj7hcPOtJCxPCG5Nxzu2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4226
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-13_06,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2501130137
X-Proofpoint-ORIG-GUID: mQxFStKUST5A7w8gUPTQLG_5oMVEqmM_
X-Proofpoint-GUID: mQxFStKUST5A7w8gUPTQLG_5oMVEqmM_

On Mon, Jan 13, 2025 at 08:31:45AM -0800, Suren Baghdasaryan wrote:
> On Mon, Jan 13, 2025 at 3:58 AM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
> >
> > On Fri, Jan 10, 2025 at 08:25:51PM -0800, Suren Baghdasaryan wrote:
> > > vma_iter_store() functions can be used both when adding a new vma and
> > > when updating an existing one. However for existing ones we do not need
> > > to mark them attached as they are already marked that way. Introduce
> > > vma_iter_store_attached() to be used with already attached vmas.
> >
> > OK I guess the intent of this is to reinstate the previously existing
> > asserts, only explicitly checking those places where we attach.
>
> No, the motivation is to prevern re-attaching an already attached vma
> or re-detaching an already detached vma for state consistency. I guess
> I should amend the description to make that clear.

Sorry for noise, missed this reply.

What I mean by this is, in a past iteration of this series I reviewed code
where you did this but did _not_ differentiate between cases of new VMAs
vs. existing, which caused an assert in your series which I reported.

So I"m saying - now you _are_ differentiating between the two cases.

It's certainly worth belabouring the point of exactly what it is you are
trying to catch here, however! :) So yes please do add a little more to
commit msg that'd be great, thanks!

>
> >
> > I'm a little concerned that by doing this, somebody might simply invoke
> > this function without realising the implications.
>
> Well, in that case somebody should get an assertion. If
> vma_iter_store() is called against already attached vma, we get this
> assertion:
>
> vma_iter_store()
>   vma_mark_attached()
>     vma_assert_detached()
>
> If vma_iter_store_attached() is called against a detached vma, we get this one:
>
> vma_iter_store_attached()
>   vma_assert_attached()
>
> Does that address your concern?
>
> >
> > Can we have something functional like
> >
> > vma_iter_store_new() and vma_iter_store_overwrite()
>
> Ok. A bit more churn but should not be too bad.
>
> >
> > ?
> >
> > I don't like us just leaving vma_iter_store() quietly making an assumption
> > that a caller doesn't necessarily realise.
> >
> > Also it's more greppable this way.
> >
> > I had a look through callers and it does seem you've snagged them all
> > correctly.
> >
> > >
> > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> > > ---
> > >  include/linux/mm.h | 12 ++++++++++++
> > >  mm/vma.c           |  8 ++++----
> > >  mm/vma.h           | 11 +++++++++--
> > >  3 files changed, 25 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > > index 2b322871da87..2f805f1a0176 100644
> > > --- a/include/linux/mm.h
> > > +++ b/include/linux/mm.h
> > > @@ -821,6 +821,16 @@ static inline void vma_assert_locked(struct vm_area_struct *vma)
> > >               vma_assert_write_locked(vma);
> > >  }
> > >
> > > +static inline void vma_assert_attached(struct vm_area_struct *vma)
> > > +{
> > > +     VM_BUG_ON_VMA(vma->detached, vma);
> > > +}
> > > +
> > > +static inline void vma_assert_detached(struct vm_area_struct *vma)
> > > +{
> > > +     VM_BUG_ON_VMA(!vma->detached, vma);
> > > +}
> > > +
> > >  static inline void vma_mark_attached(struct vm_area_struct *vma)
> > >  {
> > >       vma->detached = false;
> > > @@ -866,6 +876,8 @@ static inline void vma_end_read(struct vm_area_struct *vma) {}
> > >  static inline void vma_start_write(struct vm_area_struct *vma) {}
> > >  static inline void vma_assert_write_locked(struct vm_area_struct *vma)
> > >               { mmap_assert_write_locked(vma->vm_mm); }
> > > +static inline void vma_assert_attached(struct vm_area_struct *vma) {}
> > > +static inline void vma_assert_detached(struct vm_area_struct *vma) {}
> > >  static inline void vma_mark_attached(struct vm_area_struct *vma) {}
> > >  static inline void vma_mark_detached(struct vm_area_struct *vma) {}
> > >
> > > diff --git a/mm/vma.c b/mm/vma.c
> > > index d603494e69d7..b9cf552e120c 100644
> > > --- a/mm/vma.c
> > > +++ b/mm/vma.c
> > > @@ -660,14 +660,14 @@ static int commit_merge(struct vma_merge_struct *vmg,
> > >       vma_set_range(vmg->vma, vmg->start, vmg->end, vmg->pgoff);
> > >
> > >       if (expanded)
> > > -             vma_iter_store(vmg->vmi, vmg->vma);
> > > +             vma_iter_store_attached(vmg->vmi, vmg->vma);
> > >
> > >       if (adj_start) {
> > >               adjust->vm_start += adj_start;
> > >               adjust->vm_pgoff += PHYS_PFN(adj_start);
> > >               if (adj_start < 0) {
> > >                       WARN_ON(expanded);
> > > -                     vma_iter_store(vmg->vmi, adjust);
> > > +                     vma_iter_store_attached(vmg->vmi, adjust);
> > >               }
> > >       }
> >
> > I kind of feel this whole function (that yes, I added :>) though derived
> > from existing logic) needs rework, as it's necessarily rather confusing.
> >
> > But hey, that's on me :)
> >
> > But this does look right... OK see this as a note-to-self...
> >
> > >
> > > @@ -2845,7 +2845,7 @@ int expand_upwards(struct vm_area_struct *vma, unsigned long address)
> > >                               anon_vma_interval_tree_pre_update_vma(vma);
> > >                               vma->vm_end = address;
> > >                               /* Overwrite old entry in mtree. */
> > > -                             vma_iter_store(&vmi, vma);
> > > +                             vma_iter_store_attached(&vmi, vma);
> > >                               anon_vma_interval_tree_post_update_vma(vma);
> > >
> > >                               perf_event_mmap(vma);
> > > @@ -2925,7 +2925,7 @@ int expand_downwards(struct vm_area_struct *vma, unsigned long address)
> > >                               vma->vm_start = address;
> > >                               vma->vm_pgoff -= grow;
> > >                               /* Overwrite old entry in mtree. */
> > > -                             vma_iter_store(&vmi, vma);
> > > +                             vma_iter_store_attached(&vmi, vma);
> > >                               anon_vma_interval_tree_post_update_vma(vma);
> > >
> > >                               perf_event_mmap(vma);
> > > diff --git a/mm/vma.h b/mm/vma.h
> > > index 2a2668de8d2c..63dd38d5230c 100644
> > > --- a/mm/vma.h
> > > +++ b/mm/vma.h
> > > @@ -365,9 +365,10 @@ static inline struct vm_area_struct *vma_iter_load(struct vma_iterator *vmi)
> > >  }
> > >
> > >  /* Store a VMA with preallocated memory */
> > > -static inline void vma_iter_store(struct vma_iterator *vmi,
> > > -                               struct vm_area_struct *vma)
> > > +static inline void vma_iter_store_attached(struct vma_iterator *vmi,
> > > +                                        struct vm_area_struct *vma)
> > >  {
> > > +     vma_assert_attached(vma);
> > >
> > >  #if defined(CONFIG_DEBUG_VM_MAPLE_TREE)
> > >       if (MAS_WARN_ON(&vmi->mas, vmi->mas.status != ma_start &&
> > > @@ -390,7 +391,13 @@ static inline void vma_iter_store(struct vma_iterator *vmi,
> > >
> > >       __mas_set_range(&vmi->mas, vma->vm_start, vma->vm_end - 1);
> > >       mas_store_prealloc(&vmi->mas, vma);
> > > +}
> > > +
> > > +static inline void vma_iter_store(struct vma_iterator *vmi,
> > > +                               struct vm_area_struct *vma)
> > > +{
> > >       vma_mark_attached(vma);
> > > +     vma_iter_store_attached(vmi, vma);
> > >  }
> > >
> >
> > See comment at top, and we need some comments here to explain why we're
> > going to pains to do this.
>
> Ack. I'll amend the patch description to make that clear.
>
> >
> > What about mm/nommu.c? I guess these cases are always new VMAs.
>
> CONFIG_PER_VMA_LOCK depends on !CONFIG_NOMMU, so for nommu case all
> these attach/detach functions become NOPs.
>
> >
> > We probably definitely need to check this series in a nommu setup, have you
> > done this? As I can see this breaking things. Then again I suppose you'd
> > have expected bots to moan by now...
> >
> > >  static inline unsigned long vma_iter_addr(struct vma_iterator *vmi)
> > > --
> > > 2.47.1.613.gc27f4b7a9f-goog
> > >

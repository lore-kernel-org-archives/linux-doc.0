Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9972015250F;
	Wed, 15 Jan 2025 03:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736913542; cv=fail; b=lS5EJEcyvOW6AU0aPzM7cW4QVzafDUtpoPWeVY1nfJYzQwrirc4oko/UNo/BR3N/Fzc61BSjF6fOYQUXdDW0P+srYh4CZAhP080Uh5cXFgwJ8qaOU+Im6TNa/EGZCFcZjUwl+qqRDUNFbHhojsvp4YE867eBpMzeRqFSFpQMxRk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736913542; c=relaxed/simple;
	bh=yjv9vzAocWy+JHe01pcnJhEZRszGrEnR34F8IuMvAiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=T6IQE0XyW1DQk6dLJ1mCAWrYD6BtY83MmcPCy7OnqY3grQ8SxGeaIe2rWE6lRkPSEu0BtyyXPnfBNdC++tX/Xypul6bzBId9R9BneQMQeONtmlnA6vSwirjQEcopI4rX6/0NPAV5+KUEjvL4R3HUDpZ2UY9SljiyTI+VLN8MGOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ihc29mJb; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qNaBKZqe; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ihc29mJb";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qNaBKZqe"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F3u3M4027002;
	Wed, 15 Jan 2025 03:58:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=YiXLXroeh+IDaeHYa8oyijYIzJxEZNSF5kSM5B8hCC0=; b=
	ihc29mJbDsGfM2wxetFcLIdEIFK95WqBeghIfksBYI/nEJTRS2ywCsx2zfKtfPCn
	8oUEj63eo1U5PcSHNyaLIg6iOj81U18kLo0uYrL4vgxxoGROI6jyLjZYG48p5aqe
	IjDLwhm9CUHoqDJRLcZciy/TmE8usAVmC4AtIOJUQbzM58c7qj4MdC2oAo3SzltA
	sxb8sXWuQigCmRFLjlPH1TiRExpOc38rxZykYYJJmMYQlh/+6lMwCUNu/19gq15R
	9dE0j2jcFEaD2y3VxIVa8KOcIuKpVKcT+hdgNACTGIEQKgto8IuIOzhzS1B4yANw
	Raqs5nW1Y2j8dL274Ro1XA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443fe2f61b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Jan 2025 03:58:14 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50F0tYm3036416;
	Wed, 15 Jan 2025 03:58:13 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 443f39f4uf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Jan 2025 03:58:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lp5MJRIrMntTB4X43rd0Zgi5xJjAl76LD5kM+zVr+C5Q+2P/hPgKwlk3V59GbtTw1R8s/Mq0SHcnyubzcq00su/HRU7/GwP3tBmKFqEDDaF6uz1eRr55U6ubifChcKV5s933cQu+lryFJyXtSMnBI+ga9yhGXRd9NRUFERRAtpifaP17e/V+VNXJZX+1cWQa5RZFLR1BLcf83XfR9s3mPkrlLowtJ7Oa60wXLziyny/UU5tQV2SL16tzjQ87XKuHMW2KhdHdcuW4A0M4w9G4+WFUQxzd15UlxXwubhR3ryWlHFMXXTa54FqWMDWeZt1WTPUFaiq3kCcWSQArWcpUgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YiXLXroeh+IDaeHYa8oyijYIzJxEZNSF5kSM5B8hCC0=;
 b=Q/UFfBI9WVewBKQYS9OuQZxFVPco9CKS5tmTMBEOBB22IbhIHTNC/FQt43mJrG/vb13bnqRLoSAiIglu6q+AUjDxtAWxXfIzfRJCX83nilWNhtY1FnEdna7kRmWT/E5FV+cHKnWGb3hGS9PjuZL+4J2232n42NdvuAQ1pAuQyniaxYADWvgq9Fq3GbQ4yTVFsvMONeKY0aYG2qd6KCnH/l0ovoApuIU6fJMEHpilZl0Zf6IgHVBH1qobaweTB5jGHPSZ5Zz7u9DlJp2a3/DvbpG/iMvUt2pyhYPLfb1gc328bEpaRSUrXEAiypS24jSrxf1U6YYcYoK28VSD4keotw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YiXLXroeh+IDaeHYa8oyijYIzJxEZNSF5kSM5B8hCC0=;
 b=qNaBKZqe4/bH9yg9lWzuQokQPf3svpnxbsvr9/PzY7IXBuE7qRjPJWc4JwT8UHtW1BrLpUkW28bKZjg14V2TZfohBo9DIS//lq/iK67LeSXN2lHFf02lPPOQ5GQJhl640xhb1BKqLcogx8HPMOHbncLP7+6aLJ9kAGHj/Zu5qs4=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by CYXPR10MB7899.namprd10.prod.outlook.com (2603:10b6:930:df::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 03:58:10 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 03:58:10 +0000
Date: Tue, 14 Jan 2025 22:58:04 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Wei Yang <richard.weiyang@gmail.com>, akpm@linux-foundation.org,
        peterz@infradead.org, willy@infradead.org, lorenzo.stoakes@oracle.com,
        david.laight.linux@gmail.com, mhocko@suse.com, vbabka@suse.cz,
        hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com,
        mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com,
        oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org,
        brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com,
        hughd@google.com, lokeshgidra@google.com, minchan@google.com,
        jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com,
        pasha.tatashin@soleen.com, klarasmodin@gmail.com, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v9 16/17] mm: make vma cache SLAB_TYPESAFE_BY_RCU
Message-ID: <zmmoqxelfgnbfdqqcvy25hcte3kku7vrp62ohuxvxo4xsnvpu2@f5kpanslpmnk>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Suren Baghdasaryan <surenb@google.com>, Wei Yang <richard.weiyang@gmail.com>, akpm@linux-foundation.org, 
	peterz@infradead.org, willy@infradead.org, lorenzo.stoakes@oracle.com, 
	david.laight.linux@gmail.com, mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org, 
	mjguzik@gmail.com, oliver.sang@intel.com, mgorman@techsingularity.net, 
	david@redhat.com, peterx@redhat.com, oleg@redhat.com, dave@stgolabs.net, 
	paulmck@kernel.org, brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com, 
	hughd@google.com, lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-17-surenb@google.com>
 <20250115022703.hqbqdqawvqgrfgxb@master>
 <CAJuCfpGShzXxqH8up75WQhdMzkr+Y6eE-h37nEEwVWHC6AN89w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAJuCfpGShzXxqH8up75WQhdMzkr+Y6eE-h37nEEwVWHC6AN89w@mail.gmail.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT3PR01CA0134.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::29) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|CYXPR10MB7899:EE_
X-MS-Office365-Filtering-Correlation-Id: 595d347f-eb7e-4763-468c-08dd3518d378
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bTdRQ3ZuM0d4VmJnYzR6cldUSk1YTnkvdWsyVUk3UU8zeUEwNm9EbnpXWkVh?=
 =?utf-8?B?Mmp0Mm5FRmJuM2JnZUhuQThoT2pEMmkxRHpaU2VFWTZxakQzRnc0bDR1UmFO?=
 =?utf-8?B?N2dlNzZvTXJSNjNHUWxUeDZCOHpjMnpabDlyZG0rdTh3OXBYTW1FVWl4YU11?=
 =?utf-8?B?bk8yQnc2aC9JRjJtUlZLRHVucTBUOUFsSk1iZWJrNDBtaExzaEl0eDB1TCtr?=
 =?utf-8?B?OVdmRzR1elR2MER4bWFDQVlPazJoS0xYVUFFV1pwdFREUzNleVBCZ3pjd0o4?=
 =?utf-8?B?V09LSXV1VFRoamdSc1ZHYlQydGFnZSt3Vnd3STluODNXVUFsRlhEeEhxK2dh?=
 =?utf-8?B?djd6c0ZsSnhWbG9IYlNRbHVqTW9xMEswcnkzSXUwdjVOR0ZRaDNycUVPaEg3?=
 =?utf-8?B?cjVQaG1CdjB2MVRIUjZ5WEpQZWE1OTFQeDBEZGxod1FocmI0OWVWbzFlQTNy?=
 =?utf-8?B?eWpjbVYxR0dYd3NML1ArYnpnZnhDQ3BWaWlNOUdtdEdIUTNRcXhBMjJpTmZH?=
 =?utf-8?B?WmNMand4eitQYW1HSmRsNWVVRHVxN3hIcHF0MkFGd2ZBRjFHS2twMTFnb1Ny?=
 =?utf-8?B?QUFJSDhBYVdJMk5KZS91aFdEeGpjRVRLK2lTRU1rMEExNG11MFhWTm5zNkpS?=
 =?utf-8?B?QkkrbGplSDg2Qmlsekwzd3JvSHNHRGtlQm80SCtsNUZINEFFOC9ydlRFM2tw?=
 =?utf-8?B?Sk1Wbkp6d1laTkw0VXJwQTkvWkdJZG5PR0ROOUk5RzRzNktKY3dYUGR5ODJl?=
 =?utf-8?B?eXA2TUVYTUVpUEFsTXJjUDBCZ1Bpdk9KbGZHMnU5UTNZUWZrcFhzRzRORzhZ?=
 =?utf-8?B?dmZKSU11ekhiSzNhVWhhSC9SQjFDS0l4SVZkSzJ0bkoxVXRGQ1k3U3RmcXVk?=
 =?utf-8?B?dHlvdmc4blFVb2s4NW1QYlB4c3pydUQzMEpaRkgrVFNoT3dpL0g0ZjFRbHBX?=
 =?utf-8?B?YTJuVGZYOGZkUVBLT1E4Q0s4T1BFenpwNWdwa1djdjFqMUtBc1d4ZFptUWtQ?=
 =?utf-8?B?N29OQm1JVmFUN0x1WkVXM21TYlY5QVRtcVZXVzd2aWQwZmE3OHV4YTY5a1BK?=
 =?utf-8?B?L0RXanZoazdjay9EOEtYcW9hMW1IN2FGWnRUbHAzTWR2WFQ4WHptSXpPbm9F?=
 =?utf-8?B?NmhUclZDeWhlMHBEcjRnZVRicjdmblJmS2RxOThsRmNoMCtab3NZL05jVEtS?=
 =?utf-8?B?bDlIdTFiS3V2aVVnc3VDeEV2RFJnQVhZNWRqMjQxTThodDdJdWFZdUtOdTBZ?=
 =?utf-8?B?bmswUGNqZmtzVEJSWVNBN1Z6RlRKN3IvOTJiWkw1L3JBajZCckRGZjJxdlRy?=
 =?utf-8?B?ODNzWHVKdXlCN1ZnNUN3WWphdUtJTUJvbHhmSjJsSnBKbGR5YUt2VkcrTTQ0?=
 =?utf-8?B?Q09BenA5OG5NZ2VUa2tyVktWVzR5WFcrTGtVRGpWQkpSSFhvNGl5MnZzcHhl?=
 =?utf-8?B?YTJyb013ZG9hTGt4R2RvM1orK3lpK1pKVkNxV3A0Z3lYTnAxQldFN3dKaExM?=
 =?utf-8?B?MzVLaUxDQ2o1RkhCVzZQZmtBRHBLUHlHenppQnpVOVFoL0VwclNaNng5a1VS?=
 =?utf-8?B?WU9XbDVYODMySUxXank4KzlrRE5zN0xNdEkwK2RiSWVNRURzYUtTU2lkNHda?=
 =?utf-8?B?UmJNQjkvVi9FQWw2TEN6SksxY1NVZmowRStmRkFuSlhTVllUZkU3ZStRdlNr?=
 =?utf-8?B?ZFVQMERpQWl4TVhqSDBZRnQ1cytlZG5SOVNVckg5cTU2QlhXWnk0MG15WW94?=
 =?utf-8?B?cTlRWjJ4SmVwenZTaGhIVEJxRnd1a3Nndjk4WGtsem0vaGJMeCtsMVFDdENm?=
 =?utf-8?B?YmdXWnlqeFI4VXdydFg2bHZYRUw3cWFaM3VFNFo3cUdIaXRMalZURWNtdnFQ?=
 =?utf-8?Q?rYBU9ThdgzGpF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnhhekFMUWtyTG44TzliVUdFbG9Ib2kxcEY4RjFLaTZUMmUvUGxDRmphTzM4?=
 =?utf-8?B?Qm1hcUJtN2JxZGxQY0lZaWxiY0FtbGVXRXNZOHp6enp5M0U4Y3l3U2loOEdV?=
 =?utf-8?B?K3h2elhYcEJOQUh6S0NPR2xHWUVjRDlONUhOdGI5Zk96Mmhta0syUGpGUkNR?=
 =?utf-8?B?ZlNpeDJvaVdNcWZ5bEdWUVU2TkFINHpYSVVvZUJGdFV2ZGkrdGRDNGhtSkVG?=
 =?utf-8?B?eHpsSjJleHRtblVhNFBlS2FyTDJQM0xRRjUzVVlXV2F3ZXVxS2RWeDBVUUE4?=
 =?utf-8?B?Q2JDU2VpK2x2Z2EyRmhXSHBNT0dVTHRJNHpkVXg3M1NkMDhwMGhZN3BpU2Jl?=
 =?utf-8?B?VDBtZ2Mzb0h0aTFLVndFRldkcE9odE5TdXlqMHAxMi81aXR6a1RVWWtaSFQv?=
 =?utf-8?B?TWdyZzlBdXEwWVBQU0Y0TllXMTdsVnhlWUdzVjQ3NTl1TzM2UmVGOGZPUkto?=
 =?utf-8?B?eWtONWQ2ZGx5bmxEQzRNOFBhZHBZZ0tQcTQvcVdyeG1UMWVYQ1hPR0Vld3VT?=
 =?utf-8?B?YitQUnZ4b1NGb1habWJ2VGI4eGx0ck5CVmppN2hKcXBFMWFveWJTbjhPcHFX?=
 =?utf-8?B?QmU5N3BsNWcxUldsVU5vdEIrWlJGa1NSV3hXY0hMM3JYSmtkelNhOUd6aFpW?=
 =?utf-8?B?U2x1S0l6VldNMGwreWJwczRqSVRSRTBPSy9MRHRmc0l0aytwR0lHQndaZjZB?=
 =?utf-8?B?VmNQWVM4RS9EdmR6Y2I5TG9Nenl4UXlWNitCSldmOWdPSjBwYkNsaVF0Um1p?=
 =?utf-8?B?Z3N4SDEvZit6eDFLcytLblVhYUtNblVSSGh5REhTTXNmSFBaeHNLNFZnVnc2?=
 =?utf-8?B?YlhiU3hpT245S2tFRkloV3RYeXJIYUZNd1lUT0FtcWx0NFlXaFdhbHhJQlgr?=
 =?utf-8?B?YVRLR2N0Mnpkdng1WlkyRjRMNnIwUFg0ZzBHNFcxNjdYai85dGN6aGhLT1FP?=
 =?utf-8?B?RlZkK3lEYi9zUlp1b2U3RTZ0Zmk3QWo0eXFsZEFjT1VpSm1uU0J1SWlQQW5y?=
 =?utf-8?B?VWZBeEZrL1dKdDhmOUZwOStVQUVUdnVXcERhemR3ZVlmWFRodmlaa1loZzkx?=
 =?utf-8?B?VUhhVCs5Wi94UGpCc2orMnlMVU03UWtrUTI5ZVM1N3F6QWFlbkovOXhqNUxk?=
 =?utf-8?B?dmZ5bW9Ja2REWDYvWkJydmxxT3RCWlZXSzFqM1lsdUR3cjcycWIxK3VYbFdM?=
 =?utf-8?B?WG1FbVM5OTh1dnM4T3RFZmtZZVZNeXRqcVFvM2hDZWhhYStzZ1AyRDJNd2lp?=
 =?utf-8?B?eHdSQU4wWDRHQjdpblFBTGIvc3QybDNmY2VrQW92d1dpSUswQjZicGp4WWJV?=
 =?utf-8?B?RHRJdmV6OTd0bkFrVkFPWTlVaU8vaU1HaDR4MG9YK2hzb2N0Sjh4elIvNHly?=
 =?utf-8?B?cDNFMUZmaS9kZTNKUVhqY3E5MkZZS3pkZms5NEJrblRBQUo1a3NwVm9kVWNk?=
 =?utf-8?B?QWtoTm1ndUgwM21DdVpUWDlOeGJuT2liL0VlYnZCUEg2SVNjZVJ0aCtzVnJC?=
 =?utf-8?B?TTNPNzlFRThrYWtmMDNZMXpvZ2YyamJ1c3FTL0dHaDF2TmJSSXlzTDFEY3k5?=
 =?utf-8?B?ZUN2bC90S0lUYjlVNkM3dWNKQWpWK3NPWVBvWFBWVlM1dHpldTQ1MncrU0dr?=
 =?utf-8?B?emRUT1k4eVRjaW9iSWw4NEF4OHlNOGxydWgyZy9DdjdzaWZibHMrS0tZSWVu?=
 =?utf-8?B?YmVqczdFV3BmWEhDZUF1RWlHeXVCQzBIMHRoRVN0YW1ZaEVaR01XZjNlaU1Z?=
 =?utf-8?B?SHh1RG9KTkRxZ3lrVHlaaWl3YkRmVDA4WDlWZ1JNZE1jRFFJZVk5Y2QzbWlB?=
 =?utf-8?B?ZzRDZXlueFdicm1SQStaU1k1bURTcTRCN2FydVVIK0lseDVzaGJIaHlXNG5J?=
 =?utf-8?B?VUxMalBqYlRIR2hnVEdTOFpiN1hJUXNuSFpYTW1iZ2JPdFBYRnZmTmRRUW1r?=
 =?utf-8?B?Yzdrc1FQNGYzN2xhbUlVUmNGZzY0QmptYVFSRktlb2dZamg4czhZVDFyTm15?=
 =?utf-8?B?OXdZMnhHblhiUGIxelRPN1ZsTXd2Mk41QWMrckM5ZWN5UDkwNzhVYmk4OXIv?=
 =?utf-8?B?UVdMamlVMVdrUWVVMEJodmFuS1ZuQjQ2WWJNamJkSnZzVVRIMGNyM3hHVlI1?=
 =?utf-8?Q?QXLt/G4X7pzdt5sdRi8g/TVVV?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HGIfgqJEZ7nvrAgzJMkKOMLJuOP++vb3Js0OUHR4Qza+0JSQwA2vZkJ0/WllbdJDvDgIzTADreSK1NPpQkZIumWpwh51xphA/wzO8CuyDXc9cHVDw5NSR1KQmSTY5KcLRip6GOrbFKlxQG5feQrbuC4B7Grr2U6b1DUuhEz/3PKPEJGgHVtKkcduhhYee9/t0hltBPjlxcHMYF3HBFI7xZPBRQGHuugZ8nADIieMW6gaTMgsTZtPo64GrRCfKFVJRJmwTIGgCm/afJtqZkoOTBq/nhtfd1w7OfAilzk36uk2om7JRCyVFkKpOp3CcyEwpn51M/3bZRuTq0fHZWUd097GQXUm3gHtETLKIV39QFAe5qTaNV9lIJ2S6sZTuJ9rwFx5iBxARXMSrZTRq+zJsr84y2x+u2+dhgCJ6sDa7OEz5z3MyAVRjXYxgriMKhKLWcS9CgQQ6g2tM+cTC9tjIxiylOjgSacZzDBfQgkPYrHEZtf1/6ltjtCdpyJZzG/RTIfoAejg502Qpub5hT3o0IapAgHsGRHOpp1Pb72jf6r4h0jCKKfi2uTvIMIPefKCAut/je00n39jbRB5vevgLKzxldrPvK2Q7+hhOpEnzwY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 595d347f-eb7e-4763-468c-08dd3518d378
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 03:58:10.1252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HhD5ziYroT3lNOT5GA15iHeyFYjlubR7YnmltOuXi+MW9z7y4ZAgvxqxc8ZEkw6yE+myptv1uTfxYOcXHs4UbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR10MB7899
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_01,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501150025
X-Proofpoint-ORIG-GUID: 1bNSyT49KZzfTWLY-ToSxwCHP-PGM1ga
X-Proofpoint-GUID: 1bNSyT49KZzfTWLY-ToSxwCHP-PGM1ga

* Suren Baghdasaryan <surenb@google.com> [250114 22:15]:
> On Tue, Jan 14, 2025 at 6:27=E2=80=AFPM Wei Yang <richard.weiyang@gmail.c=
om> wrote:
> >
> > On Fri, Jan 10, 2025 at 08:26:03PM -0800, Suren Baghdasaryan wrote:
> >
> > >diff --git a/kernel/fork.c b/kernel/fork.c
> > >index 9d9275783cf8..151b40627c14 100644
> > >--- a/kernel/fork.c
> > >+++ b/kernel/fork.c
> > >@@ -449,6 +449,42 @@ struct vm_area_struct *vm_area_alloc(struct mm_st=
ruct *mm)
> > >       return vma;
> > > }
> > >
> > >+static void vm_area_init_from(const struct vm_area_struct *src,
> > >+                            struct vm_area_struct *dest)
> > >+{
> > >+      dest->vm_mm =3D src->vm_mm;
> > >+      dest->vm_ops =3D src->vm_ops;
> > >+      dest->vm_start =3D src->vm_start;
> > >+      dest->vm_end =3D src->vm_end;
> > >+      dest->anon_vma =3D src->anon_vma;
> > >+      dest->vm_pgoff =3D src->vm_pgoff;
> > >+      dest->vm_file =3D src->vm_file;
> > >+      dest->vm_private_data =3D src->vm_private_data;
> > >+      vm_flags_init(dest, src->vm_flags);
> > >+      memcpy(&dest->vm_page_prot, &src->vm_page_prot,
> > >+             sizeof(dest->vm_page_prot));
> > >+      /*
> > >+       * src->shared.rb may be modified concurrently when called from
> > >+       * dup_mmap(), but the clone will reinitialize it.
> > >+       */
> > >+      data_race(memcpy(&dest->shared, &src->shared, sizeof(dest->shar=
ed)));
> > >+      memcpy(&dest->vm_userfaultfd_ctx, &src->vm_userfaultfd_ctx,
> > >+             sizeof(dest->vm_userfaultfd_ctx));
> > >+#ifdef CONFIG_ANON_VMA_NAME
> > >+      dest->anon_name =3D src->anon_name;
> > >+#endif
> > >+#ifdef CONFIG_SWAP
> > >+      memcpy(&dest->swap_readahead_info, &src->swap_readahead_info,
> > >+             sizeof(dest->swap_readahead_info));
> > >+#endif
> > >+#ifndef CONFIG_MMU
> > >+      dest->vm_region =3D src->vm_region;
> > >+#endif
> > >+#ifdef CONFIG_NUMA
> > >+      dest->vm_policy =3D src->vm_policy;
> > >+#endif
> > >+}
> >
> > Would this be difficult to maintain? We should make sure not miss or ov=
erwrite
> > anything.
>=20
> Yeah, it is less maintainable than a simple memcpy() but I did not
> find a better alternative. I added a warning above the struct
> vm_area_struct definition to update this function every time we change
> that structure. Not sure if there is anything else I can do to help
> with this.

Here's a horrible idea.. if we put the ref count at the end or start of
the struct, we could set the ref count to zero and copy the other area
in one mmecpy().

Even worse idea, we could use a pointer_of like macro to get the position
of the ref count in the vma struct, set the ref count to zero and
carefully copy the other two parts in two memcpy() operations.

Feel free to disregard these ideas as it is late here and I'm having
fun thinking up bad ways to make this "more" maintainable.

Either of these would make updating the struct easier, but very painful
to debug when it goes wrong (or reading the function).

Thanks,
Liam

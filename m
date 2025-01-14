Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC6E234CE3;
	Tue, 14 Jan 2025 11:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736854653; cv=fail; b=V2DR78yUI8NCIkTAejr6q0EgTiqN2L1YgVrh9usIhoUdNIbsbkMgYW8JHAxJzfoIduSx3cZIUSSzCjjEfiD92+R/hYIcdwYJ9qX5Pu8+bLGO/0mC2V783ZXJevZZ2wcSuwt87BR85PNxGz26yzvdfjCEYfcg1HJplehp/899oac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736854653; c=relaxed/simple;
	bh=LVYicXns4HPwv5qdxPkRhGwFLqGzQoXOtjf3k6N1Mm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ODQGw4FM5qfX0ciIf7L8kdciEGWPBcfQPZsl9YtnexPW/kR1n9EysjkEgH9Fp7AQYgn9I3cWO43z7GNABHaOxfqs5cyGRhsSHukmniKY4B6DuyNdtdM3mufuL7IZRFDZUmnJjXXyd0clBfYIanqRWuAj7EynI570wtbd3MdPPts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mkb5EMsw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=S+uM5IcK; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mkb5EMsw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="S+uM5IcK"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E1BtMF031335;
	Tue, 14 Jan 2025 11:37:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=LVYicXns4HPwv5qdxPkRhGwFLqGzQoXOtjf3k6N1Mm0=; b=
	mkb5EMswrUQgotwHgKGvC42OmranwOoloM8/LHePgR+jgS9Klqd6YBLX42takEn5
	areDH1eh4VWhczuzyELlZzbXFW3PL0L4Q75ZKB556q1Lg5huHdQT13VQHCdBewN6
	tqTgQVBW2KTbtCDnC0CfYe4exF5OYkQbgUr7tnoW9jep76cDSS2JKiZ5j3ReUd+b
	PH8I7FLs7UgMmzjcJ5vo5LgAjwPu7uZvKbkF1D8AMLqVOVm3RHpJdvHeuQ982eeP
	dySgoSPkCwTmCsoi4YCZgtYp4z3HQ3+KLXBgXbbNXVv5TLK+90vLwC3kVg0e373N
	NaRGnlucy379N+CrHwjh4Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443f2bwk40-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jan 2025 11:37:00 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50EBVtju036283;
	Tue, 14 Jan 2025 11:36:59 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 443f38jn62-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jan 2025 11:36:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NzH8Nrf7HaTOocra18ejhmWKaMs8+jMKn+Rpauh+C7TwoiPOH9TUeKUHJfRM2N/Thlr+XmW50SXb85ddSShzIy9uLucopZgbo0VT3LTMiozIE2UI2YgntyzKum26Bplr6usb6fqPf42gPf26oHh1a4D/iKPychxKg/UQhRXwKWhtHDFqmCCr91x/D21krS7UD96XUaQdtZkpbbV82IHjLdpd/2CzZGl3tOkJmvnqW/+mRHTZiaX6CdwZFVBHpZ9GE6ZSrisO0h0HRcXsdAvaw3/MecSGRBCmmp1cCmddgNqezzRDxCob8i+LC/TPwp+F39TeD0CV4kq6oMamKFcYLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LVYicXns4HPwv5qdxPkRhGwFLqGzQoXOtjf3k6N1Mm0=;
 b=MsjUW3RNAn0jtnf9sDipzdjVy85x726DBQ855s0UDkZ9ZFadJ8xHv8GAax7DekXDZSasgw8YcyYaRkJJJr7PJwQ+pQBsesamt9MEsFdDVzSbPPj6A/1g00yhd74f/N/XmkV5gXo2aaKM3p/qnnZOyjw+gtLl/n2bSLiSf6ES0k2lgVpFIiErEc2eDV08zRZ6fbVwxNY43j86XOuU+J2l1IckkeXRqus2KtJCW6upsc4WWHA3n8Sl7uvZ+uwEGud0KiaUlDirHNAf8XX7WCx3oxLoGPZ4m2UCrpE3CvZ5V+4k/Df8s2JfbSQrl0TWQXgmkWhPg7oC9gGLrFHPEHPKZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LVYicXns4HPwv5qdxPkRhGwFLqGzQoXOtjf3k6N1Mm0=;
 b=S+uM5IcKG2NhTOG4QcsoaqQYw+C+Wn/qT+ze/lSneHTNJezfcwMy7oqWAxl/5OWela2fpyaRJoH3ABH9Bfy+Nnw4VzGZNhg1jrTD5sQOzx5Qrt24UNTI6sBP0yLVapdKFlgjwGUyMLY0rS+dvCldf3n0s7KocZKp0eNES3gKrwQ=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by SJ0PR10MB4493.namprd10.prod.outlook.com (2603:10b6:a03:2dd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 11:36:56 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 11:36:56 +0000
Date: Tue, 14 Jan 2025 11:36:53 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, akpm@linux-foundation.org,
        peterz@infradead.org, willy@infradead.org, liam.howlett@oracle.com,
        david.laight.linux@gmail.com, mhocko@suse.com, hannes@cmpxchg.org,
        mjguzik@gmail.com, oliver.sang@intel.com, mgorman@techsingularity.net,
        david@redhat.com, peterx@redhat.com, oleg@redhat.com,
        dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org,
        dhowells@redhat.com, hdanton@sina.com, hughd@google.com,
        lokeshgidra@google.com, minchan@google.com, jannh@google.com,
        shakeel.butt@linux.dev, souravpanda@google.com,
        pasha.tatashin@soleen.com, klarasmodin@gmail.com,
        richard.weiyang@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        kernel-team@android.com
Subject: Re: [PATCH v9 05/17] mm: mark vmas detached upon exit
Message-ID: <f4bdeef9-4231-449d-b0df-9f6fe6d807b0@lucifer.local>
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-6-surenb@google.com>
 <5d46531b-570b-4f81-90f3-2fb157664f87@lucifer.local>
 <CAJuCfpGJu88XgJUJ45aSPQNfUw4UuBRtGzB4HSybiP8xzyUTPQ@mail.gmail.com>
 <15720844-b970-4b37-b475-bf6e7c72113e@lucifer.local>
 <CAJuCfpEYOJayU7xcpw2VgSYRwB4sNSdxFE28j9GKu_5OvPL6VQ@mail.gmail.com>
 <ead9d96f-6cc0-46bb-9f08-585bd1b152e3@suse.cz>
 <CAJuCfpG8Tm767ptEAcr-9i38M9B0BQm5SV8VBJJVWHhWF3spgw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpG8Tm767ptEAcr-9i38M9B0BQm5SV8VBJJVWHhWF3spgw@mail.gmail.com>
X-ClientProxiedBy: LO4P302CA0015.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::11) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|SJ0PR10MB4493:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a27b8c1-de34-45e6-7176-08dd348fc024
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L3lRZDRrOWpYdmdSTWtPL1NlR2NwTWhKRzZhb1Y1N0diV0FBMUVhU3VGaHVX?=
 =?utf-8?B?RVh6VGU3VW9KcU9nZ2FkNVgyYUpQUGUvR29sU213QWtxSmFuMit4b1c3NmJ0?=
 =?utf-8?B?QmJyMU05cUJtY0F0dFJlbWNVK2dxWXk5MnpsVkgxbVFJZWVlZ3RLUUwyU0Vx?=
 =?utf-8?B?ZGVEZnp0emhaUDd0U0xvZE96U3YzMG9EdXBPVlN0ZXd1Z1BmVUo4bVp2Nm5C?=
 =?utf-8?B?UkJLWkZCbENyOFg5OVZYZ21xYzI1Tml1dlJyYlM1eXcvYkE1L3JLWDRlVDBH?=
 =?utf-8?B?VWNoczJSU2Y3RWdvTkxCTnRlbTlxOHRDWGswOEMrL2VTUHNYbVRGaENTWm9k?=
 =?utf-8?B?Y1dNN2s1ZnZ6UTBuWWJXVTlVSUdwVXQxUlQzeGZGSEJNY2tPYlczYmlIK1Ar?=
 =?utf-8?B?aVY1dTVMZzl6eXBxcFkrU1c3VEpJemRrRFRIc3p2UnF1d0RwT1VtUnBRT0xx?=
 =?utf-8?B?ZGR3TnU1RGJOSkx2SnFSRnNlUWJvSjFUcFV3TEE1NERCcWhkeExTc1RWRlZj?=
 =?utf-8?B?U0xUSkorcjQrVW82ZXVsaXdGcW9HNDZlbUlGMFUyeG5uTGQzTDlwM1JoMHhx?=
 =?utf-8?B?U2loRGM2bURLL0J3eGlvOThYQ3hCenFkaUNrR3RGWnU0elZmcmtoczUyaWtZ?=
 =?utf-8?B?ZlZ1YTdZSEg5emVPZ0M3MGFEMkRMSzRteHhXYWFoZUtrQUpldmlPdjcvRjlz?=
 =?utf-8?B?TXlGZmRwOVhrZkdFS3pPdDdDL0ZRN21nWkpxMEp2MTRKNVY3LzZVYy9PeHB4?=
 =?utf-8?B?dzB0SEhsZkRkOExiK2FKSko0TWJFM1R0SHBWWFgzYjZqVFg3dlhYMmRnRjho?=
 =?utf-8?B?Sk9iMXN0ZThRV1FBbkF6UHA2QklMc0FxOFFiTmFPYW96S2RrN3Rla3JldklS?=
 =?utf-8?B?RHZtVVdaeEM4NzR0alAyeEI4dVlHeFpuVFlPcElINkNUSERGQkc2enFHaDVZ?=
 =?utf-8?B?ZXlFNUVGV2JLNEIrNXZWcklvdll0SXMydm5wbVd6bk03bnZvSkRRUnNKVkZa?=
 =?utf-8?B?bHlyY29BbXJ0T1AxR1RJamRYZ0RTSjRlQzRtcFI3YjgzZ0luTFVFdXQ0RDhP?=
 =?utf-8?B?ZXVCZngxNXA3b2h6cVlkVkI5SHFkUUNacUlYenFjcXZ5eGpFNWNQZlk3N0FP?=
 =?utf-8?B?aFZuVkZrNWI1dDBuT1ZBRTg1a0NRS2cvcmJqaE96OGhFdHhVNFRldWd5T042?=
 =?utf-8?B?RUkxY2xQZExwbHZTUmVDNzZBYXR2eitxWXE1S3lOYVdtOU1iekxBaTRkMUFm?=
 =?utf-8?B?SnVwZzRoRjhkaVMrMlhEbjBkOVV2M3BwOUNMbkRUVHNhQkxZaDNVZ05UUkth?=
 =?utf-8?B?cG1KdmZubmF3aHFUQzIzaWxlYVFaREhCSVcvdVRhaEhwSSs4TG1IYzJrU2Vv?=
 =?utf-8?B?MzhWSU9NVEhLdW1sVHpzNFVlNkxtYlBzZlVsQ1ErNDRWL1RIMGxpSkF4Z0Z6?=
 =?utf-8?B?YUh4dHIxUWlHMmY5RGNzT1BHRjR5ZEFmUzZoUFA1WS9hOUV1cHpzL2prYkxO?=
 =?utf-8?B?eERqRnE4ZzVETGg1cVUvTDVzSWl0c2tzVytBYlRSS2RXMjYzN2tmN2h5UTgx?=
 =?utf-8?B?VDh2U0IvazN5ZnFIT0YxNVdkTHY2YlY2Y0lHSHJZMkxDam1GaUZQYTh5Z1VG?=
 =?utf-8?B?dGNQZ1dDbDczSVRENjRGZ0lyeXpzUG5nNXdSa3NmTlkyN1NkdWVORHNNTFky?=
 =?utf-8?B?UjUzcllPRkJMUHZDUWNIVWkrdXJNTFQvL21YNHVva01ONU8yTXNHeEtldXV5?=
 =?utf-8?B?Z3BMbXdjNklCZzA5dWcyM3krNGp3Q3VIWTJnY0Y3T2h5NktzNngxRXJhNnRT?=
 =?utf-8?B?eFFNV0FOVTI4Q1hNOEo4UG9UMVZuN1RzZjZIMXJISkd0QmxaOVllR21WcEFo?=
 =?utf-8?Q?GblMFfwTEUdQM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2tzakVIaUlJd2ZKWnRFVWJpd1lIZDVJOUJSQ2JZT2xwTENSa215NnJjMU1h?=
 =?utf-8?B?a0M2YU9FQitsd3Z4c1pReUFEWGJPMVV6V0hza0xXY0hPNnkrVmxvM2Q2NGpE?=
 =?utf-8?B?WjlZNVlQVmFQd3h2M3E4dmRqS0xxUnFvcUJpVDc5aVNSNnp2dXBlWkhmaHZw?=
 =?utf-8?B?STdBSnBHMDllN2lmLzh5VXhJV3FhSFhPbk14T3JubTcwa1V1bkx2NGpvcjZW?=
 =?utf-8?B?c3VzZHVld09YcGNFSC9zeEVhWU56eEpxUk93K3BQV3RteE4xbWJKWVNCVlc0?=
 =?utf-8?B?ZDdzZUdMdTdOUVcwcXBBZVd5TjZLc21qRm9KNE9iRVVpU2luRTdYRHZERUpw?=
 =?utf-8?B?VHVFMzAwVXduYnFhZThDQW84VmYrZjlJbkhoZFV3SEZ5cDlENk03ck9lTmRT?=
 =?utf-8?B?WHQ1REFQUitGcm5QcTJ2QjZkSnZ0QUx5ZDc0Q2NPUUVQVWViMmdxSFRvcXFO?=
 =?utf-8?B?VGV5VVd6WEt0VFRCRmI4ek8rNFQ4aXJrRThvVm5NNDFhWjAwdzBJWDl4Qy9D?=
 =?utf-8?B?akVhZ3FFSGx6b2Z1bWRFbVRIYTlCV3kwaEw0aFYxSmYzZkxhSjRNcHdkUDdv?=
 =?utf-8?B?eE1qRXU5UnUrUHk2NkIzaUptWWx1SjgvODZzNVBWbWhETzNUcHNscmZrYkVJ?=
 =?utf-8?B?MUtGVk5POFVocnZBcGlES3JwbjZLZHdmM09qUGp5MkFkZ05vUHVJSlhGdHpU?=
 =?utf-8?B?cGVqTmt2NzdLakZ4Uy9ZSmdOcTM0VEtmVFBIVkt6OTdaMGFqdEVETVFZKzg5?=
 =?utf-8?B?NWMxRlc5cGdvbXdvSENRZWNSdzFhM1dObU43b1U5NkJwTVpBNTRhdGJLemhC?=
 =?utf-8?B?aG11YzF5eXJjWnhXWHpCZFpoanZmUlZzM2M3bGpLR2kvNHdVbm1vdEZZa3FP?=
 =?utf-8?B?OVdnVmh0eTlSaHFiTnlzbWhNSm5leWZvbkF2d2NYY1BUWElGbW5QS1pqK0N1?=
 =?utf-8?B?aHFqTWFUSFo4dm1TRDJ5NDBadllQKzRJSlhIaERwTVBaYkNJV0xpMU43TmF4?=
 =?utf-8?B?Vkp2MUlJck94UWRYSjFBR0F0T2NWa0pXYXQ5d1ZvdWppbXM5RUs1SDlDd3By?=
 =?utf-8?B?S2pkL1dlM09yc0tiZWtSMi9TTExuNHRNVHdyK1BkazRFQThyMVB0UW4xdkdM?=
 =?utf-8?B?VEVoRmZ5QzZ3WTN1MEFReWZHUjNsMDRpdkxYOTUycElqbk9yS1lSc0hMdEs0?=
 =?utf-8?B?a04zbEg3a1Y1cmlzaTdzeVhCcmxQKzJxbWpFV0tzdUFWeWVKOUlDUjlLdXNJ?=
 =?utf-8?B?YU1hOVVqc25JT3FnaUtnNU5TUFVQWVhTTVJRWGF4MERWMjdsRVZzWUJSN0lH?=
 =?utf-8?B?YnVDTnllaUV5UXE4UTV1eGZ1WFpDbVNrcngxb3A3KzdJSXVqMFJXZzRMeGZ1?=
 =?utf-8?B?SUN5aWFtUWQ2T3JLcVh4dTJNOFJDUmNSTFpiYjJNemhMWmZsMWw4K0ovaERW?=
 =?utf-8?B?TVcwRWk4enp0ZGhraDNuNjNaUGNBOXFzZGFLZVozUjFpaVpidm9Wc0IrTWVU?=
 =?utf-8?B?dEZiKyt1eDJWZ0hqV3Q0dWtienhJRGVQcGkvbzRjcWo3MnBjZTlqWWlnMlRu?=
 =?utf-8?B?RnNxblc1anN6ZE1ZOUNYYVQ0ZkdhdnpDTmU3YnlYODNiMVpTQVlFSTZ5amxF?=
 =?utf-8?B?NHhSZHJZQ1d4ZG5iS1JCdXROa0dnODVKZDFYeHJ1VHQ0akhJWFJvMkxWejQw?=
 =?utf-8?B?ZjhweWd4a2hWK1BJckt5dTVTN0svTWNFKzRxMWkyZEpLL25iNHlrN1VuWWpw?=
 =?utf-8?B?cFpnV2YzWFZMS1hwa3R2b2xWSGs3cGMzSW1GNTFCbmRwQTNIdHZVZ2F6bjNU?=
 =?utf-8?B?UGt3SC9CUUk1aUR6T3RaaU5FMVFjMzNjRmlHMm0yMGtYUUVZaS9kZ1FEcWls?=
 =?utf-8?B?YWNEblRoWkEvY1JlVmhIQzlZS3RTRkxZZUwwWU8xU0JtSngvNnlMVzRFN0tT?=
 =?utf-8?B?eWxYa1FXSUxHdm55eVZSdnFrTkpET2R0NDcxU2V6MG9rdTh6S0xMU2swZFpB?=
 =?utf-8?B?WXBSaUswUllKNUZIZ2lmNmRMWmRERTNqZnpoSG4vRG1KSmQ2alhyWDJjTDVj?=
 =?utf-8?B?bjB1cFkxd2pQSmNrYjFhNi9CZFhFV1kwTUFpcXd5MnZZOWhESmExWUduTWM2?=
 =?utf-8?B?eHgyZENFMXVlYmdjVlV5Y0lidTZ1RlYxblY0d0w0eXBCSnUrV05sNUZiNmNB?=
 =?utf-8?B?Y3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iOdNXMhU61ZQkBW0bn1b8SSySZ+QuyEWFzrkSq8Jtdr3WG1xmCxOsAfu3xevTNUUfX90kBINem/CBxbYGLqPAEl+y99QynCDko/LyxlJZBN9Emq8oZKQuAgeWXmn1TmxaCbw0HhoI9VONVyk29zkxFBvk+SIhxwPaeWc4BFvpyG1s5Gn/NBXYOgFer4boPz2fGdaaUpHXJW1dXLEVCplhofX0f77oX52nIIgOiJqk706iPQdEQI/wdy3jO2Kyy8v3ztNzAVAPVuS13LLHLYfCpx8z01GQJtEVnPNkg7FWt+YaXtoDLPhDewYytPz4CqgYO021+hUqoSJsGM7v5qOYMQAZE+ooHGJ1L/v8CL6Yq9UVDm1MH3GOMN+Je5ZZPODr31xgz0RtRmdQXOoxVaMh8POVTwgWl0nloNGPvQtGyRkfFRYngcvK8FQJ8oYV/wfBrwIdpgvsz7TG8wPZpafIrnsPHESfmzo+HFq31to6E8KkG1pB4um7ya4UKyXO8UwLbZenCdyW1E0bQ9NxFSqUDFMAqfHRN72CHi2a38JMP58Jry9+mzn62gB7k1ZVRIsmbc7GAT7Rr4sxxMjk+LtLLRi/tb2JSjHfqahvI2BPHs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a27b8c1-de34-45e6-7176-08dd348fc024
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 11:36:56.7720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5KXKeNNp+kIHE8RrJaIfT2CQYKsHs2cMn6KbW8F6u0NHq/ZNz1U2LrSRCAO1QoXSmkQZdJnKHTgRnojh0ScsF7lHABx73Qx//RYtlk178e8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4493
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-14_02,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 suspectscore=0 mlxlogscore=768 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501140096
X-Proofpoint-ORIG-GUID: a2it5hqYhlsj3aEwFe1SV5jr7m1TVtsH
X-Proofpoint-GUID: a2it5hqYhlsj3aEwFe1SV5jr7m1TVtsH

On Mon, Jan 13, 2025 at 12:42:53PM -0800, Suren Baghdasaryan wrote:
> On Mon, Jan 13, 2025 at 12:32 PM Vlastimil Babka <vbabka@suse.cz> wrote:
> >
> > On 1/13/25 20:11, Suren Baghdasaryan wrote:
> > > On Mon, Jan 13, 2025 at 9:13 AM Lorenzo Stoakes
> > > <lorenzo.stoakes@oracle.com> wrote:
> > >>
> > >> On Mon, Jan 13, 2025 at 09:02:50AM -0800, Suren Baghdasaryan wrote:
> > >> > On Mon, Jan 13, 2025 at 4:05 AM Lorenzo Stoakes
> > >> > <lorenzo.stoakes@oracle.com> wrote:
> > >> > >
> > >> > > On Fri, Jan 10, 2025 at 08:25:52PM -0800, Suren Baghdasaryan wrote:
> > >> > > > When exit_mmap() removes vmas belonging to an exiting task, it does not
> > >> > > > mark them as detached since they can't be reached by other tasks and they
> > >> > > > will be freed shortly. Once we introduce vma reuse, all vmas will have to
> > >> > > > be in detached state before they are freed to ensure vma when reused is
> > >> > > > in a consistent state. Add missing vma_mark_detached() before freeing the
> > >> > > > vma.
> > >> > >
> > >> > > Hmm this really makes me worry that we'll see bugs from this detached
> > >> > > stuff, do we make this assumption anywhere else I wonder?
> > >> >
> > >> > This is the only place which does not currently detach the vma before
> > >> > freeing it. If someone tries adding a case like that in the future,
> > >> > they will be met with vma_assert_detached() inside vm_area_free().
> > >>
> > >> OK good to know!
> > >>
> > >> Again, I wonder if we should make these assertions stronger as commented
> > >> elsewhere, because if we see them in production isn't that worth an actual
> > >> non-debug WARN_ON_ONCE()?
> > >
> > > Sure. I'll change vma_assert_attached()/vma_assert_detached() to use
> > > WARN_ON_ONCE() and to return a bool (see also my reply in the patch
> > > [0/17]).
> >
> > So is this a case of "someone might introduce code later that will violate
> > them" as alluded to above? Unconditional WARN_ON_ONCE seems too much then.

My concern is that there is a broken case that remains hidden because
nothing is actually checked in production, which would then become really
difficult to debug should somebody report it.

We intend the WARN_ONxxx() functions to be asserting things that -should
not be- for precisely this kind of purpose so I think it makes sense here.

>
> Yes, I wanted to make sure refcounting will not be broken by someone
> doing re-attach/re-detach.

Yes, and debugging this without it could be really horrible.

>
> >
> > In general it's not easy to determine how paranoid we should be in non-debug
> > code, but I'm not sure what's the need here specifically.
>
> I'm not sure how strict we should be but we definitely should try to
> catch refcounting mistakes and that's my goal here.

Yes I think it is worth it here (obviously :)

>
> >

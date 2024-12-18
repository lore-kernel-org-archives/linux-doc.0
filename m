Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F581F8EEE;
	Wed, 18 Dec 2024 19:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734548470; cv=fail; b=I7W7Om578HpPOM1XaFpuHXeQYsSJ/pVUWmH5oOCRd7gxRpmF79AF1VfoWgJNvryIEPYUuvKnHEeMKZYQ3uNs6b5ceSUxVxyLoPG+su+HVx8JJ0gGQqZ/45TU90lj/F1AKQDpuNJg3F1MNw0r+Arar2RBTBNgTLKXwMaAPX9w0Yg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734548470; c=relaxed/simple;
	bh=jnhDv0MUiCp7F1A1zCIXX/saBRwZHc4Cqpgc9VcimWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LK4S9NkE0YAfjxxddVPvhyaLzMECioC3wpbtYOXQcmYuSQxeo5IJSlBe4xWIgOGcxeCQhF0TgNt+5YSqNhNBTA1Gtr61fc8zklbZhMPTlGVj189oeMWweXt83Qg4xdo5VZQMFGhjQdNRmpAx153sQ1/RwNouRClV2yKtbb3nvzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=B/umpzO3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Cp8+dRIi; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="B/umpzO3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Cp8+dRIi"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BIHQcw6029546;
	Wed, 18 Dec 2024 19:00:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=NLL2oi/E8RV4PkPnKqWljc3Z67zR0TGydEd+99JCWeg=; b=
	B/umpzO3Q2cKqqNFHsIljzC4WSq3zOHMCjaZgwfiSSmHmUgKSGRbu5B+qkM9oV8G
	s/sk8vLrjZkGFBWyuPvPywYIo0sf9NvhVScEZ3rp+CeCqsz4tyl+dym4f3Zs+Pkr
	fVcSIRrLcHXbYz8+pMCQKPEiWDxNO7uO++BAq2yxRg++/0atwocEUtlaBcgZdQEp
	RYB1e87yKYp9BZ0zyB+UGdFW7Ddh9tc+KWHFKJONjxhLF5i1jR7061qAKpvBWQhi
	MumeZA7uJowSF5dyE0EaGAS/8syn9oXsMiSf8nyymVb+MotXlUuDTODIIWyw2ok6
	C2iQZsXdmcS164FAqHKvAA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43h0t2hbqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Dec 2024 19:00:27 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BIIlvLU032664;
	Wed, 18 Dec 2024 19:00:26 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43h0fgf6ak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Dec 2024 19:00:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yhpzRkA3CCHG9SnjuMKeCFW8dRnvITzV9tyDabi3lSaXa9tgA2H/6HJl2GoEv0K5qT5Ms3o2wr4NeuaRstFbfdVrmlLJaLFruLG+trPBkkb0Ps5Yrkz2g6muXbM0dOpBCVPU201bYnW3iuilqpoQxST71plkBzuuER84hZvv9xVFMMRjlsjCHGwGSNj0sJW1LCSRc3lWIKHYkwIrjP5zIONI0f/WT2vcR5kJ6pGwMTey3OmWBjeUj5r//zgs8iL4oFziQWceVie9CXMWe7mYlVqaXB8BL1YRaFimZKTKqoXy1O9kIed91QiEQrj2cxOcynae8Axqo8C3auJfWHwwJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLL2oi/E8RV4PkPnKqWljc3Z67zR0TGydEd+99JCWeg=;
 b=VRfiYjN6FV2kh1NWuvgrs4KRfRv4bgtH7wlb83Av47mwzlwRGUBDtexnT8bQlJXB28c+fdRladScFWSlz5ZUi7LX/UAiU4AIQH9Mo9XwHAN5acim43+oJPZGEypyQ9Tp7sLEsngjmNZTGui/AQiYCjcgPsBxjxiAT1pf1fKjld9iUgMcmHqxj0kiPZsn81yVTWpnCkYUc7nFh6NXgUIBh1VNVKcayioy4wI8tZ/k8L+qfh7SUpQmPRG3WAk4Tkzjh4rRPnSVygZaGJnDiv9Z4RBDkutEmHimlN3hbazwwXZHBNZcVo7EpczHzbZiB1tmshOvuHZTjUfRlz6qs0ElGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLL2oi/E8RV4PkPnKqWljc3Z67zR0TGydEd+99JCWeg=;
 b=Cp8+dRIi+KFK11PzI98XbsYvQ2r6DVp0SNSjy9ASpNewQ05V+s2rNAWWSC9YTSVpRYcUEcTyYhH3yQDzW+LcgYMLAOKRHFEkh+L7t3NzJS/YYhVu4C3m/KVpwUrUFM3DIJchp8gzyYrBfgkXe7KO1XYfrSFz25ej/Wx+kP1Ye4I=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by SA1PR10MB7737.namprd10.prod.outlook.com (2603:10b6:806:3a7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 19:00:23 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 19:00:23 +0000
Date: Wed, 18 Dec 2024 14:00:16 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, akpm@linux-foundation.org,
        willy@infradead.org, lorenzo.stoakes@oracle.com, mhocko@suse.com,
        vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com,
        oliver.sang@intel.com, mgorman@techsingularity.net, david@redhat.com,
        peterx@redhat.com, oleg@redhat.com, dave@stgolabs.net,
        paulmck@kernel.org, brauner@kernel.org, dhowells@redhat.com,
        hdanton@sina.com, hughd@google.com, lokeshgidra@google.com,
        minchan@google.com, jannh@google.com, shakeel.butt@linux.dev,
        souravpanda@google.com, pasha.tatashin@soleen.com,
        klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        kernel-team@android.com
Subject: Re: [PATCH v6 10/16] mm: replace vm_lock and detached flag with a
 reference count
Message-ID: <r7polqnhdguxrz6npklag5kjy7ipbj5lrnqai2qm3jt7x56hci@cfrcom746iae>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Suren Baghdasaryan <surenb@google.com>, Peter Zijlstra <peterz@infradead.org>, akpm@linux-foundation.org, 
	willy@infradead.org, lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, oleg@redhat.com, 
	dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, dhowells@redhat.com, 
	hdanton@sina.com, hughd@google.com, lokeshgidra@google.com, minchan@google.com, 
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com, 
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com
References: <20241217103035.GD11133@noisy.programming.kicks-ass.net>
 <CAJuCfpHzsQeejdPPbDdA6B3Wa=-KusnYRUyt1U0WnCRr8OKfGw@mail.gmail.com>
 <20241218094104.GC2354@noisy.programming.kicks-ass.net>
 <20241218100601.GI12500@noisy.programming.kicks-ass.net>
 <kfltsrry7qjuycyqpe2wune2ejad6kvusm2zixvfbtprbnw2lv@wcafrui6qaa7>
 <CAJuCfpFYZkc===SXF35s3C0xg3q5RjpCiOQhwK=9_3RnFUye1g@mail.gmail.com>
 <20241218161850.GG2354@noisy.programming.kicks-ass.net>
 <CAJuCfpHDRCoaBfE8y6AppKveSTgayyTNfDyQWH=gMzO-Pkuqpw@mail.gmail.com>
 <20241218174428.GQ2354@noisy.programming.kicks-ass.net>
 <CAJuCfpEKg_h5pw2AxdF1wmFMt4xdOxYqv7U1uVMYcuSCB4kHuA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAJuCfpEKg_h5pw2AxdF1wmFMt4xdOxYqv7U1uVMYcuSCB4kHuA@mail.gmail.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0134.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d5::15) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|SA1PR10MB7737:EE_
X-MS-Office365-Filtering-Correlation-Id: 73294754-64f3-466f-6f32-08dd1f9639ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZzFtNXdERldxTU12ZWVKMXJHc2c5eVJzT2hUNUNMNkplbkxFcXUzVTEzSHFN?=
 =?utf-8?B?NjFkZ1htOGZYNHA4TlhDVzRNSEVaWEpkblpSZnYva3RmNVUrUXNaMjJOM0cr?=
 =?utf-8?B?clY3bE81MTNyK3VlMjJMODRCRjByaEtkZFBkYmg2OXZUSXF5Wk1IYXNkVmNT?=
 =?utf-8?B?QVlhUFdITVg0VHd6WE5ycC92ZUVuTUVTUCtVWlNNb0I0VEllRGJzVzJJQzg3?=
 =?utf-8?B?c0dkc0lRQ2UrdFROcXN3ZlZybFhJZ1ZuVit1V00yT0MwV3NsY1dnejhpKzdM?=
 =?utf-8?B?aWp6Rllud2tiT1lmNzlWamlsQUU1TVFKQk4rS0QvQk50R2h4Q1lMNWVnRGNL?=
 =?utf-8?B?WkJHdDdFQ1JwTUNaWHNzM1l1THNrYm95M0pPS3BNUTFCYTA5OER0TnVrRlhk?=
 =?utf-8?B?eXloUGhGTy9yajZHcjB5YkZqQ2pCRFMwSEZFaE16Um9PdSsrRUxqR3dKUHNq?=
 =?utf-8?B?MjFIUHA2YXlvWk51STd3SmN5QmZKMmZWZUF4Q2FOay83RnZZS2J5ZlBYWTRK?=
 =?utf-8?B?SUVUcEY1a2lsWmNjMEx3QXpoK0g3WUpMRGVOdEl6QVQ4YzlVR2FLWmZMRTNv?=
 =?utf-8?B?Z2J2TEh3TWxaa2J2UERhL2hFM0gyS1VBWEtxZUlaYTJ4Z3BJcm5tcUFneTBq?=
 =?utf-8?B?dDByOHYyVDd3ZDRKRDFTOVR4OFJlOElHK3hqUHhNWjBxWG0wakw4Wnhxdmkz?=
 =?utf-8?B?NnVYVy9kVkhiWUpibFVCTUJjMlo0Znhub2lUL01mTU0yUmVFblBJYjBVajdt?=
 =?utf-8?B?bDBWRGhvaHNFWHI3ems3SVdiMnRyZ2UxL0NxQUp6bXNHdjk0ak11L1RiYjJZ?=
 =?utf-8?B?Zk0vdGIvMGYxcTZWYTV0bDlNRnNlS01CQ3N0dUl3OEoyS2F6dTFPWUx1c0Fm?=
 =?utf-8?B?OE95Z2J5M1Z1d3pPV0k5a1diL1BQSkcrOENHRGFOQU5Pc2tZb0twdDdJaFI0?=
 =?utf-8?B?WGp5RjJsS2dVRVdRVkE0YUVKUVBTbnUva0xaZXE0V3VjRVExbXJLUDBXOWpm?=
 =?utf-8?B?bVQ2NjQ4b3NrckwxRlVRVW01dVAwdVdqZCtKbHRlb28wYkp0WmRZRVlnb2Z6?=
 =?utf-8?B?SXI2SkV6MCtONUdzZzlERThBLy83SEgxOHFVWXZXRStOQU9yb1FJR3BNTTRX?=
 =?utf-8?B?dDZYQjhFOGM0KzJPL2hiR1h4RWZNZGd4RU5ZZ083STJrM1FXczJ4WjZpRFVB?=
 =?utf-8?B?YUR1RFNPNkY5RW5TemFybUJsSSs5NWJkVE9qYWZLUlI3QzNuYTRnaVpzWjdI?=
 =?utf-8?B?eGZHWFZWajRsUG9JUU5hNmtmU1RxZlI3RTZkVTRCSWZMUnNreWxzZjRxQlFN?=
 =?utf-8?B?RTAyaGNTY3R4ZFpodzdtQkFnZGNSdEw2VzYxTVBWZkJqanJ0MXcveEJGWG9m?=
 =?utf-8?B?MkFzcUszaDdYSTVUTWx3cVZVQ05mZnZkNGVpOWtOQXFud2Y3TEJyL0xqcTNY?=
 =?utf-8?B?K2hNcUhEcXhYWHZtbWI0dngzZWFHbGhYaks2M3ZkNStTRzZzMTFxWVdTb2Fa?=
 =?utf-8?B?NHZBUXhtdHg3QjlpZ0VtVEl1UFNqRU90UmV3M3JsQW93NWttakUxeXVIbGdY?=
 =?utf-8?B?Qzg1aHVudlkyUlF1NGw4MzZIWTBaaGl0UFMreEZjOHcweXpySy9IakxyWTVx?=
 =?utf-8?B?SmQ5WE9PWVV6UnJYb3F0VVlrSjJvVERCUjZ0Y1lBZ3dNMDJORlpBdmRodXJx?=
 =?utf-8?B?OUQwM0FPOTF4VExhb1ZRT3Nmc3AxMWE1aFpTL3RsVkpaNVlqT0k3dFZFUTVo?=
 =?utf-8?B?RCtrT01jRnNMWERVdU8zbHFEdWNnb1ljeGtLc0JkMFRKZEUzNFdJRDVuOVA1?=
 =?utf-8?B?S1g4Z2hFMjR1QzlHeVBucTQvK3V6YlBON3RoOU1pbi9UaGFIVWdKVjE0cTR4?=
 =?utf-8?Q?LBLhkrl+6BBLr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjhpOVdDeWJMeDBwNGdHN21XdFZySEZnVHM2bUp5d2MxamxOTEZvbmRZY2t3?=
 =?utf-8?B?MWZBK25kSVMwVyttVFd5aHlPWnRjejRJdlN6MWJENnN0RjdPd0QzaGtUTFpP?=
 =?utf-8?B?Mm9JV0loSDZQa1JwdXVBZHdLb1JHalBLL0tTYjUxcTlIZUIyY3FnV3VaaDZ1?=
 =?utf-8?B?a3Y3NzRqN2pHUFRxek9BMkQ5NHRacStsZVhFa1g5OWZ6M2hkOUhQLzFEajFo?=
 =?utf-8?B?ZWhjZEhPVmxRdDVqVmxsZXdLT3FyN01Ud0lORXVFZlN6MWtqS3dvaHppcGdV?=
 =?utf-8?B?Wkd1YXZRbkFhWHAwV1FxLzg4WUxVdHo0N1NLbVJkcmtkSXhHVVVnVmI0ZTJs?=
 =?utf-8?B?QVlxMkExenRQTkNaTzIwL2wxa3d3UE9CUWhxb3V4VDN4UGlzT2hMVGV5ekRR?=
 =?utf-8?B?TzBUR2JTU29HdGplbGZ3OHd6RVpZemU4c0VMMGdQdnR5M0lyaEN6VTdmZGUw?=
 =?utf-8?B?RjFLK2hkTXBUbDMvaCtMTjY3MXg5VVBnajJtWS9DKzFuVkJ2ZDFFUThEaE40?=
 =?utf-8?B?UVhGUFZ4cHRrc0NLbC9ocDU0aS9QVUtpdDdQZHZYc0YxOW8rcnRqQlh4aldR?=
 =?utf-8?B?KzVLUUVmQjlpeFZwWTk5MkdjR0x5RVBlM3dPTWwxZHBiVFVRRVFTK2dKdUVK?=
 =?utf-8?B?QzY1TjZsejF5cjlablJMM3d4TnZtWndmVUdNbXpSZVdvV1N5TlpBcW1wNFJW?=
 =?utf-8?B?UWRmaXc2bDRIRFlCOXBtdWwycUI1ZEZRQ3gzbU5Pc2lWU2VTRHpNUnVkZHFQ?=
 =?utf-8?B?Z1BxR3AyWVowNHNKanRCMXV4c2p5N3dtMmZqajYzUFh0TXpteUVxSms5VkRv?=
 =?utf-8?B?SEgvdjU4UUpiWFloWjJMdHRjK1lXZ2hUWjlxMHBuODgvd2dXc2lqdllLRWlv?=
 =?utf-8?B?U2g1K09CR1NRdlZwRmJxQm1CWUJ3UkhtL0lRNjI1b1NTNmZDZExCc3J1YXNl?=
 =?utf-8?B?ai8vVE8yeG1STVdkMmRJdVk4d3ZvQlZzcjNzenlBT3hEY0ljajV0MnhhelZH?=
 =?utf-8?B?WUxlWnNYclQrTHJ2WG00L0FzcXlIRFB4TmQxampaYU1MYkVTSDI1UzBGcEIr?=
 =?utf-8?B?dzh2dE45UzNOY2JPMnRZTHZ5MmFnd2tJZWFrT3ZBQVhQT3FFZVgvTjRoU1dQ?=
 =?utf-8?B?TE1wL3E2eHozb3UyTlBZeHZadVRXOGZ5ZGF1N21ncEFhWXlxdUFvZldlcjlm?=
 =?utf-8?B?ZGNmdTUxaGhYY3FvOXd6aVU0QnVzVTJldllkeVlmNmY4L2p2aDN5RkFNbFI1?=
 =?utf-8?B?QWhwcHFXd1Q4dmV6ZDZOMnNNNkxUaEpzUVhQdDJCZE5Ibmlra1htc2VhOTBU?=
 =?utf-8?B?a0ZacHB6T3VmdzlRcWdua1d1WWpHdmF2Y09KcUdNSWpPMytvVWgxaHRvTm0r?=
 =?utf-8?B?NkJYdmMrQjduOHdDbWlyWEthdDBScUNTYlpYK1Z1cFpaYnZrVlBzNGdZOEdx?=
 =?utf-8?B?T3pUbEppYnUzclVrYUQ5M3lXOFB1M1lJSENEeEZYb2dsa25IaFFKcWxlVnl2?=
 =?utf-8?B?c0FEd1NFbW1RMkNybnlEaFJ2UDBKRTdBMHlNRHhLWnIrTndIUlcvQkN0RXgw?=
 =?utf-8?B?TEdNTEtFRW5MSzdBeFV3V2RGd0FpV1F4YlBCVGVZTm5LaHFHRzZ3a205UGFZ?=
 =?utf-8?B?cGY4VCtQWk5YYWRBcHRTMjN2b2hBMnRVbWV0cjBiYUpQYTBoSCtTRVFsY0lz?=
 =?utf-8?B?b0IyR2hCbXJIbENvOFBNUVN5QWVMazBhV1g4QTFsaFk4dnRwc2VVWXhBbjBs?=
 =?utf-8?B?Ukp1ZWdIMmRmcVIrTWp0Z0J5NzVZTFVMQlgzVS83cS9tY0dOV1IvVmRmaSsx?=
 =?utf-8?B?ZmpQR2pIUFY0K2ZnelBsM3pFc2NPWS9uSFVsMHhWRzNlc1lLUEY5cnFOR2lS?=
 =?utf-8?B?ak5xOUhnOEVLeEdEU0oyaEJOdENic1F6TlQ2eE9wVGorMGxjTWJBbm1aK3gv?=
 =?utf-8?B?amFXdjVmYVBNQXZHbTRTY3NsMEwybU5Bblh1Ly9tYk5nQVh4Tkg5MUJ5ZkNZ?=
 =?utf-8?B?cjdtN2dkMVJPaTBlTWxRbjlvRUQ2THM2UnJ6aGJIRkV5ZXlIWXNVTGltZnFv?=
 =?utf-8?B?YVpkT3YrQXM1dWNGT1NtdXUrblgyVlFBYWV1V01WUmltaGswSjN2a1c3KzFL?=
 =?utf-8?Q?Um0aJFBoeyAzG+m1aIYZ3tGlf?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QTdJ0+aPohnvIqXNs6aLW+h7cgp/tZCBqK7xGMgDfPhrddLBlVP4F0u+h6X7NYIyDFsskEavCwDeOe3Eugh8DXzX31Vz4//DG0RqfTcybDyVV8FRx05o9A31GE4k5adltl9ljOiHFPh5JBJimRR+bXlQj/TQ9KFhpD3eDLflEaQsWK+SJLdv0JXes6Ub8MjYM5kfJFgoE7n+slQein3bXxC2k9zT/bxxA66t/qNifeTTXGAHYwZvGeRLGWXtp+yLTUvLkhNHCssCYDyvXH+swcKCUgmioobsaSFqVad6sRBaJ1eTXu2tHS8kt+I9XRzwiD77SSsI4mDb6wNR+348d9O8C+8C4SlF09+ASMSHHqz2hGvaV0+dE+Xo7eSJbMEkHxt+XYTrJozu8RqckETWU1mTRB6uBkGHvHCkKj+5pY8cUHcNHHyYSDtyXwiL/3cuTJw2sapG7rJfgk26sLCPjRUVsABd1Dcbiw9gWtMlNYQCaWu6oTgMlzjjHvPjJPt9Th3VsYCPiY1yhV5n5b9bMjWbamjol9MUNLkL5JQPvzPVFV2/DkHk5iVQBHo9jvfyUVC6RoDjYTdwqZti/A8jnqBgcObadL2S4Q0wgvIzmJQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73294754-64f3-466f-6f32-08dd1f9639ff
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 19:00:23.6526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o92sf3nfNAzsumzHyWTv9L4no0Q9uTXVrzIn8gjd6lUshY+6tv+P8polDzAE+CqntraoZvCdPfoO4QYoCIOE2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7737
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-18_06,2024-12-18_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 suspectscore=0
 adultscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412180147
X-Proofpoint-ORIG-GUID: 2sDWx3R7P08S5wTCVSe65OKkHGvznbGw
X-Proofpoint-GUID: 2sDWx3R7P08S5wTCVSe65OKkHGvznbGw

* Suren Baghdasaryan <surenb@google.com> [241218 12:58]:
> On Wed, Dec 18, 2024 at 9:44=E2=80=AFAM Peter Zijlstra <peterz@infradead.=
org> wrote:
> >
> > On Wed, Dec 18, 2024 at 09:36:42AM -0800, Suren Baghdasaryan wrote:
> >
> > > > You will not. vms_complete_munmap_vmas() will call remove_vma() to
> > > > remove PTEs IIRC, and if you do start_write() and detach() before
> > > > dropping mmap_lock_write, you should be good.
> > >
> > > Ok, I think we will have to move mmap_write_downgrade() inside
> > > vms_complete_munmap_vmas() to be called after remove_vma().
> > > vms_clear_ptes() is using vmas, so we can't move remove_vma() before
> > > mmap_write_downgrade().
> >
> > Why ?!
> >
> > vms_clear_ptes() and remove_vma() are fine where they are -- there is n=
o
> > concurrency left at this point.
> >
> > Note that by doing vma_start_write() inside vms_complete_munmap_vmas(),
> > which is *after* the vmas have been unhooked from the mm, you wait for
> > any concurrent user to go away.
> >
> > And since they're unhooked, there can't be any new users.
> >
> > So you're the one and only user left, and code is fine the way it is.
>=20
> Ok, let me make sure I understand this part of your proposal. From
> your earlier email:
>=20
> @@ -1173,6 +1173,11 @@ static void vms_complete_munmap_vmas(struct
> vma_munmap_struct *vms,
>         struct vm_area_struct *vma;
>         struct mm_struct *mm;
>=20
> +       mas_for_each(mas_detach, vma, ULONG_MAX) {
> +               vma_start_write(next);
> +               vma_mark_detached(next, true);
> +       }
> +
>         mm =3D current->mm;
>         mm->map_count -=3D vms->vma_count;
>         mm->locked_vm -=3D vms->locked_vm;
>=20
> This would mean:
>=20
> vms_complete_munmap_vmas
>            vma_start_write
>            vma_mark_detached
>            mmap_write_downgrade
>            vms_clear_ptes
>            remove_vma
>=20
> And remove_vma will be just freeing the vmas. Is that correct?
> I'm a bit confused because the original thinking was that
> vma_mark_detached() would drop the last refcnt and if it's 0 we would
> free the vma right there. If that's still what we want to do then I
> think the above sequence should look like this:
>=20
> vms_complete_munmap_vmas
>            vms_clear_ptes
>            remove_vma
>                vma_start_write
>                vma_mark_detached
>            mmap_write_downgrade
>=20
> because vma_start_write+vma_mark_detached should be done under  mmap_writ=
e_lock.
> Please let me know which way you want to move forward.
>=20

Are we sure we're not causing issues with the MAP_FIXED path here?

With the above change, we'd be freeing the PTEs before marking the vmas
as detached or vma_start_write().


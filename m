Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB004240233;
	Mon, 13 Jan 2025 15:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736782069; cv=fail; b=SF0kyv3pdLVn86L3UpDjeukDUAtqJ2Jkq9SuSS57o3VDCNYTXzwmFnluyenBx2z0RXVyMK3TNsBf6+io+/HixlT3IQlUa9Vhh2awmvnd43BwKDJSaYKJFb0S0MgkXpnpEdUfaiSPQS64EwJjRYYsHHiAxp0dWhbx9xSZm9f4Y2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736782069; c=relaxed/simple;
	bh=zzEHFC72Y3eTAFC650flQR2ecoOxwCb27USn4JmIqYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eiubvo4h1FaXX/URGS2cMAL9jp2oHBJADKScslZhJhqAmOCn0qm0npJXzS/vTZRoGeoSkFlvNmvOquFa/TOH+Fd18bl7yfCP0/4/VUsLH5QtdOqR9o4qzP2uA3LLQCf+FihNhVRp6bRUCE6zjG1v81p+TWirRmmi4JkyYFWYvBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NRPOKM07; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=x2XaPmJY; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NRPOKM07";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="x2XaPmJY"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DFQndv031064;
	Mon, 13 Jan 2025 15:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=Rc9IfQ6BCSqnQm3RHP
	5T4bvGJyDbnq9bBSjedQT/X8A=; b=NRPOKM07i45hWDiuNn5lTjltXXZf9a6vOu
	dG5LWx5kPC9bKvwMQ/4+35Dh5ovkPdHUjgr3co4abi2S3X3hVZi/XvqHlguGxY5D
	+s+pDb7GVGKBObLC3GkZ6Kx6vxHx0vzXswP4oyad1alkyqGHCUsyFE5dsRIBDlKA
	nnfpLr6BvYUET9ixFs0r2cdXGevZqhEbFmQ3k0n70ympAzykoAs3ZRtr9mvB8ci8
	qQ4on2Q6g68RcGQ6QgS1XW6hlYpqQM4ML3xX0C4x4iDdcGf59oLwVa3/0CO4LVCy
	JJdvjwWGyUHFKn2RYvmUEBmswYI+vv4LsL7IGTVqgCqMeTGY42Yw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443g8sbuc8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 15:27:13 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50DE4fUv032172;
	Mon, 13 Jan 2025 15:27:12 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 443f373u8d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 15:27:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g+FfmAintTl1HK9wrhCNtCUPVexPewjOMMjhU3PyKEwLioQ5ekLXx4r4glYJBqdCo3Z/SuKRK0veKxWwcWRwZu9F8uSLF296Ckm6B5N60Hk35HOCIpGVrFm21ea+woxonB6H7fZB6gwVINkPegn/idgUk4NaqFEgnJTOZ6ecgwtufpYrKr6+rnG51nNR1YK9ExoRi/LzRbpUJuGlXwY8YZUYOmhkXoOcZC9JUzIWUX4AGY1d6/1fyFDhwexMyBL0iaaMFjCrYZ1lDF0YFwktYUY9HBJZxZ+VnK8LnTTHA5LDAVl6KCt2NmqzNBj78b0QO9XayQS39KNrTsUz07xkXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rc9IfQ6BCSqnQm3RHP5T4bvGJyDbnq9bBSjedQT/X8A=;
 b=N0jlBiJ4xmqs6UhqMRxhmI1izBiX7BukKjo4Pw7fF9EVGEr09oIgSdmE/6uJDw6TUWYk3D3VLdBqfzAprAg5ENr+KQxbTCfAIyiM6j6MdRY2ah+AVQ94ZSYP+yMdfxUIm5i+/O5bu8Pek6pe5lklS+6CCuxIOCI7CvFz+//r9dte3gY0uSbgd3VV9k1N6M/EZsG92jsrcoWCQOE5v9fy7SmHQ6t58/m8w0xw3JCFC7e3KKpC7cRNeJiQLGLssHR+k75FYQvLbvTNp23NcKyruqCS56tzFwuwWhbgTGpof9OYy9bqGGDwiyDqczRGtPJBWlZGrGd9ELPGVQlF1njY/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rc9IfQ6BCSqnQm3RHP5T4bvGJyDbnq9bBSjedQT/X8A=;
 b=x2XaPmJYMUiojk+Ey9UivgJxVY5IeBFW+Z/6ae2o6++bW4U7IkyAPz8w/giQj3VVlYD2WQL/5Io9uCe43XBc44JQIpuGlfmp9Ns7VS7rZkZ8QTPN68lWs02Ng4o/L5M+vhqBLXzhHseAISrqoxM3O6T6LmaaaqB/P4J9XLVZOtc=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by MN2PR10MB4174.namprd10.prod.outlook.com (2603:10b6:208:1dd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 15:27:09 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 15:27:09 +0000
Date: Mon, 13 Jan 2025 15:27:07 +0000
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
Subject: Re: [PATCH v9 08/17] mm: move mmap_init_lock() out of the header file
Message-ID: <ab3d690e-4850-4c7b-a19f-093b78bb2ca4@lucifer.local>
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-9-surenb@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250111042604.3230628-9-surenb@google.com>
X-ClientProxiedBy: LO4P123CA0076.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::9) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|MN2PR10MB4174:EE_
X-MS-Office365-Filtering-Correlation-Id: ca211b39-c99e-4bcd-692d-08dd33e6bf00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xM1nQLOmXAfgCDDD0kDvaJBh4qX5UEKsYHn2c9DGTRxp2QqgYt+alvDN3Pcn?=
 =?us-ascii?Q?tCtfevoeq+cTV34gjjjxGdMzqSw6ca0BfBiDgSa3pPSU/ADFvqpMENaicR25?=
 =?us-ascii?Q?w/ykllWh8xG4vn3/72vSfSlpzjg8f8qV+m/lK2NIi5mrqmp4l2ZUl5tRoku9?=
 =?us-ascii?Q?ZzOvD3gbp4gIl6aGT5gV1yakVRRzqPl5t+X41no8gmDhJbkoCcX3MuoPSuPJ?=
 =?us-ascii?Q?aQ2qU6MjKkYj3Wn3O28mfcxfPROq7YrCI1F2e4jNl2AnIXWW0is35xMz6wyI?=
 =?us-ascii?Q?WUl0uVf72G1lWR/boSE9RfoGB+yglU3oBPVwBeILJ/L8kYn48C2ziyXJUABB?=
 =?us-ascii?Q?J4rtEJWR9f8CSBe9EnW536UcIOmIGVlwwOtO3MgNw3zwp8fqtShnPXNsDVkh?=
 =?us-ascii?Q?wcqGp3+8Wole8/7vhmZ9o3hv+28K57BYrNaGQpo2o1gewjmWzD+YY8jIe5HD?=
 =?us-ascii?Q?pD7NKSL6OdXja7Ue6XgAo/7IM8zCCqXmvC9S6oSUA2GEXGCy54G9r5kIQum6?=
 =?us-ascii?Q?PHz/7Tnh1QsGi+yW8h58xSbc12Mzz7r3lBlsmcZZgTtT5DEjM++DTaueXUMo?=
 =?us-ascii?Q?xHaayNkALaolxCRnLHzxOq/OobTtD2s1RkG3rAcsgmYeYwhja/uHL7zf6/Ye?=
 =?us-ascii?Q?BBFF2P3WlxJpvhKlIikVh6/AP2ea5Lo9+dcCOheNKx5BwpO7UIToInoefBOx?=
 =?us-ascii?Q?LZysESl1Y741PQQiG2blL1fD+yHzw1Fyt2xXxh1i7oOgLzgQ9MDzwnbgKGfk?=
 =?us-ascii?Q?ZIq+CZFLremXMEAZarLAzae5i69KqXYR9VVkBfUrXlEMEVgFsFICSqtcXE+8?=
 =?us-ascii?Q?xkMMnrxUBzMFX0w1IROcVjLEaEhnrbzS2VBkVxJ2RNiqrOaxvtrhKqx8IDH2?=
 =?us-ascii?Q?jxGh+2wbSGldLhMCe+O0MVvZHpGIfZMWwtlor+5wlew7MA+dvyHH7fdKVOJA?=
 =?us-ascii?Q?UkJE79g6shHAJkCZmS72teu8PZs7RcTempAtj5qoDPPSqjtQ34JpGK/KxLPn?=
 =?us-ascii?Q?hVX0OJXL0F3awd5cAFOg28155yJsmnrjLEEc4QHV9p0EzA837iL4KSjijC2c?=
 =?us-ascii?Q?9/gIAmpBfExrCB0z4syJrkAf8zhYAi+UDdPX/68qAbHkPnwO8xBJSmYk8BDC?=
 =?us-ascii?Q?GyrBFP2HwYrfTDmNBPqA3VxQOYM5Oo9tpiLxi/OFX2HQQYZIaGsjwlZlqY9M?=
 =?us-ascii?Q?9FQ/DVJect4XCX4eO6XHkIvzhf74aCFYciE3xU/stx+P7rUviR5WI/xj7/3m?=
 =?us-ascii?Q?2o2jJ+DEeRKyEvC6VPIqDydq1KtddUtzTTYvWk/xOZ54WV2A5FwlGFgms68p?=
 =?us-ascii?Q?sQn5GLxa9VtHjYRVIZpGSCD0ZbwslHrPfOJGDzLBH0C7o2XQg947nu+5gYEO?=
 =?us-ascii?Q?nsVHhurbVurq9l8aStG4sJkMJWXa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1rmlVckB8urPcGyKnMeEQTI00QfIcig4zeEJGRu/K+llISUZng7u4G7+UaEu?=
 =?us-ascii?Q?yktdzDFPvUqNGWBLTHbOldMQDhC9o/2p6ovQQlHryyL7HXyjNDalCOZClZCh?=
 =?us-ascii?Q?mkEi3xEPvh6MbF0X1s1GoGi6w7RUkuqLC+2iyd0Vg+BzlVsO7p/Ezz7xBZZQ?=
 =?us-ascii?Q?FztjigB8TdmFpJeJog83zlYNtp51YuHIMrkOjDqOp/iieIZWdTOsv1DJs+y0?=
 =?us-ascii?Q?Bh0ASTBQPNmp7J/W3GBSPhxoxxzz8IoB+xT7dXT04HUPJBO0D2/H9xqEabbM?=
 =?us-ascii?Q?C3lYVCkHldKjcxWHgAaITAXyPKHZdvTZWR0Lzeuv00L4vDC0hiVHw2cyVjip?=
 =?us-ascii?Q?kU5r6mqE9Qt11kTQ2yMYKh0PFhJh9bvCmuxl8ZIY8nroEaAD/zskXLeKz8a7?=
 =?us-ascii?Q?3GWtpM3CHo/GESxxP2HxylSee3/5oYswQrhoWhVH6NvS0mi78zPTifL4YUlu?=
 =?us-ascii?Q?qh30Y7E4cKenoyvhk35svonhZrp0lwk8onVjhtqhcyvrhACGt4lRfvPb2OfA?=
 =?us-ascii?Q?5YuE98VDXzhlG2qh55bowZWP4cyk8rrKYriyIGFVrquLSTAPJ2UmHlNipdvv?=
 =?us-ascii?Q?o/8LtMMvxPxljLew+BuAK9AfkmLfKd4Eguz44AOFJUMlQeA64NeCfCFIfG06?=
 =?us-ascii?Q?ZV7HgxAFhyV6Ar38ZWJ9x5dbqBfJW9YbNXixx1283x3rW7wuKFInXTZza+Hf?=
 =?us-ascii?Q?2d7s8YafZXe7VyRfDBtjLfGUcurvJcOMgqvzHKFeEw9+gBnkYD0NnsXkiyM2?=
 =?us-ascii?Q?lB0XvR76SP67DlCzSD3N/KNqJiI8eDh+w5Odrzv1fAY6NwfXUkiwH+xkZghn?=
 =?us-ascii?Q?8fo3EG8Fo/Am4OOYCLApkd+5ofMTKHbEedIo8rDSElt1W0yci64CfdgM4gEo?=
 =?us-ascii?Q?sysEAOrj8V0LEl44+AEDmNyeZr3TDQxXfs6KJ+ak4OmLMe7C3dOhzMhPeBN6?=
 =?us-ascii?Q?KG/lvUur/qBabzv8gpf1pphilCbCvLtP0biMzCjJacD7UAUt8d7QSvo0BHCW?=
 =?us-ascii?Q?cuV77I+KPJVpizj/l5qRcl3CHbhBaywEsUekl2KorVAhTBxrXmeh+NGps260?=
 =?us-ascii?Q?gdD5BH8cEcqOXHxzDwHDup4ooUs77rpXL2w7rV5ohDMsJY35PmDh1+dQ5pjB?=
 =?us-ascii?Q?4PfmfbSt0/RzbpHjasA65hNob65iz+ZtMv5X+SkseDss0DnbxFgXSxUc6OT1?=
 =?us-ascii?Q?XB3/jTp/YcmaPQATLDN/MY1oHxCNDB9cN+yHtl/6e3TEk5v8T762uUtEaOCZ?=
 =?us-ascii?Q?O/R5WeeZbA3zVUHaV00TX0fYYKpbg3KLeHUt4xOPr2akg1tgz1yUFYZTilJ7?=
 =?us-ascii?Q?xRnEr/ocg/uU4CBbRCDqIA67LZEVa9OA7JsgS4rYkB9PVQjlgpsz/Xk4x2wr?=
 =?us-ascii?Q?7+gcXbMIbdGBtC3ZnLnazs3/nRgSDWF3My/z6SDZgYbDlhA5L3YYgUzrRthq?=
 =?us-ascii?Q?XgnN/+iUsm+KL/qDlTw5x1QZmcjrB4ExvKWX83Bf9JgymG86o2Hm/0M0043p?=
 =?us-ascii?Q?mgjBivbf9GM3+l3KE+FoSKjLopBJ78vHwXZ5FLXM/2ky0KbnU4QD+sP4VMD1?=
 =?us-ascii?Q?TRwuNhupaZOLVe4pIQf/OoQlAE46BSBwHFsRfCimblq44aoXGHor2OEciW9S?=
 =?us-ascii?Q?Yg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GbXC9ibf4NbmWfr3BaH9ot4pBhJEulMTp41tS8Q3a9OmITKUa7qUfG4XKve01MA3dt12jV2t1hDhzb9o2wyNJZebIl4SEkt3WOYZ+2K9LN23Xqb7l/pXwv0qrBbWdDV//Qwl2mMSzYB4ohU0bnRocn5lNF1MDFgRJ2Kj9itNYFvzV7gUt5S2p9rXnUi6EFVJWmSgWVY1/BYqrBKVAixztJGO34BqWSE1QxLEIlKAvs/sM6pIAK10Aqo9p5KOaJRgdIeIoKSEKLR9EDpZ9fFeW/NH4gP0E+xD+uFxUKwkfB8uj4OoALp3eaJ2SsHi8wtPhKn+GkyJTatzSFzVit1IhtryP0hAkzPqHKXalfK1xCdGQNu7OeRMVfgJkvLiErmrdTnYH9clc3crbegy+yqM/axV8p6Qo/bCMxsKj4oKgHdTPQprosORHerqu8cLgr1rEweQ33RgA2Guvwmg1A5dsNQUYn6Z9ZQNNICF3zaSCt4ZxZ7s6YYUVMs3jY0biYBlA84ffrJ4JxPKbgnBvBKGWasXvxjF9T1P7KhPgAUQ4OCL1Ft0r+0bns5aUx0oWzbjSZn7rirED5Yw32K+561BgOWeYzZMpkVQ/Lax1Xb6Thc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca211b39-c99e-4bcd-692d-08dd33e6bf00
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 15:27:09.8058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UGp4FkAgwjdPfzEjGxbapJcPQwa3vkLiw+7jKyWaNgXrXKH8gcZYD8a42qbxjHOdaHCJIeb88Ww5V5mBwou2cCHhb7uTWjhj32l9P6vJGBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4174
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-13_05,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501130128
X-Proofpoint-GUID: XsPYwgzW0nUGL6To9Uu1qu3d3O4XV1OG
X-Proofpoint-ORIG-GUID: XsPYwgzW0nUGL6To9Uu1qu3d3O4XV1OG

On Fri, Jan 10, 2025 at 08:25:55PM -0800, Suren Baghdasaryan wrote:
> mmap_init_lock() is used only from mm_init() in fork.c, therefore it does
> not have to reside in the header file. This move lets us avoid including
> additional headers in mmap_lock.h later, when mmap_init_lock() needs to
> initialize rcuwait object.
>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

Aside from nit below, LGTM:

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  include/linux/mmap_lock.h | 6 ------
>  kernel/fork.c             | 6 ++++++
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
> index 45a21faa3ff6..4706c6769902 100644
> --- a/include/linux/mmap_lock.h
> +++ b/include/linux/mmap_lock.h
> @@ -122,12 +122,6 @@ static inline bool mmap_lock_speculate_retry(struct mm_struct *mm, unsigned int
>
>  #endif /* CONFIG_PER_VMA_LOCK */
>
> -static inline void mmap_init_lock(struct mm_struct *mm)
> -{
> -	init_rwsem(&mm->mmap_lock);
> -	mm_lock_seqcount_init(mm);
> -}
> -
>  static inline void mmap_write_lock(struct mm_struct *mm)
>  {
>  	__mmap_lock_trace_start_locking(mm, true);
> diff --git a/kernel/fork.c b/kernel/fork.c
> index f2f9e7b427ad..d4c75428ccaf 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -1219,6 +1219,12 @@ static void mm_init_uprobes_state(struct mm_struct *mm)
>  #endif
>  }
>
> +static inline void mmap_init_lock(struct mm_struct *mm)

we don't need inline here, please drop it.

> +{
> +	init_rwsem(&mm->mmap_lock);
> +	mm_lock_seqcount_init(mm);
> +}
> +
>  static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *p,
>  	struct user_namespace *user_ns)
>  {
> --
> 2.47.1.613.gc27f4b7a9f-goog
>

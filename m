Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1CB20F078;
	Mon, 13 Jan 2025 16:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736785734; cv=fail; b=X4UsXxqlXPQgPzs48615gAYr6Lvi6EnBOGrz1fmCevZvJ5j3y33s6MyHWw7rdARzIhd9KOTk/gHX/4TQ5WGZhIQd8/uErgTLodvXeC/GhySkw/sI4ORbAlbvCxAbvjHayy2wHr3dP87W/Wa6mpL1iow3j5CwNRwyTkA++OBSf40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736785734; c=relaxed/simple;
	bh=tRADkFNBbj7Z/ZYDfPLiaDY6mU7MQxYnsQC0uQ7Eiqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FGYhacThvp+nX+k95n34F20KG0hzANm7Ek75ZF0hALX69k/RZnqJ8zAj9VTseJwJ86wltcyMkbOeTM4Fkjx+XZQ/HjCvUbL1sxCjyMSNbyb9lCs7Vs92sJ5e11mEaVC89o0YzzZ50xiSn+D97haG2ROgUv1DiQPcXZur6GtjpS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=g3zCAtb8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LLU0DvgU; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="g3zCAtb8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LLU0DvgU"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DGR8dG032719;
	Mon, 13 Jan 2025 16:28:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=PEYfYT/pbatrx5JVux
	eOrY8ELQqIoxUR8DFugMYvxGo=; b=g3zCAtb8hiDYelnn3KRG0WzP0oPsNi+Kji
	rw6DMHJOZZb2lxUUh9pr3Wc5htLeq7z7A0TSkAL1wobmlN1tSsXHB1UITEp6WTwX
	YtP43lvVqOYkFOAI7Af5OtHlueBVBe65kTM+cDXC8Xx51ZAkhIqquPMTnC9xppVG
	GKwmy3R+Q+JmNiQJEf8GxLCg9pwVVsnxYallx8OXDh/6CnuNcKzDA+W8YcoBcomD
	ym6UF65A/nD8DB4+UzbOYP1NYUCXa06zECpoNQZfV7tqsR6TjI8eI3RxeFhCsfKS
	cqKaBnLajkS59cT/kGpnsFNBWbp4cj2di2dEnvdl/2paOHn3x4NQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443f7y4017-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 16:28:22 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50DF08xq037097;
	Mon, 13 Jan 2025 16:28:21 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2049.outbound.protection.outlook.com [104.47.58.49])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 443f37ph7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 16:28:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tlct+/GtFc9gTgLeYQ18rzns1uxpng3oDidAO6BZ8FWdPq6U3QIM9j2Yr/CW48j+vU5GShqkdIZj2yyThhfRDEj2ZK5uRIrQ9KdL8euzi8OvqT4YmlwNzbEAmgz4o3lQw/HBLqShNoe8+lbAFFLOivJBHeK7DTGQf7STD5sbPdvyd5diBw+VAmEUGXE1ZzyoiPVAWnQX46h0b63ER4CqUp0pqc3hSKbUjmw7LTVJrOxw4x0kWnzVOgXAx80GjJNS0SfDOCP5ZRdE1ISowKG5bfF3m4L7fHUhXTFb+o/WyaFPJf4M8xewQf753/W8L6VLrvrmL8TZ1K4uUqACFNTDFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PEYfYT/pbatrx5JVuxeOrY8ELQqIoxUR8DFugMYvxGo=;
 b=dyBsQIU89fucwgURXBoskRXACOHDrvTBsY+gG8/yzTcjo1C5GthXIM0+ULAcE2xQn1EicRamSSmjHMe+3JeuZNdNq1Kep40VXROgNhTXhq9M2adXHchvfpMOZNTjJECH9ZjKgF7m1TbPTGX+oT7Qpg+h7Su2VNTdALAT90+ZPt0dx4JylSL+o2m1vX0RRXCybsKl6l6G1OtIgKNN+b99ybwYo948FK0MQ0lAYcc5StVxv2J+AndT1dRECxEzqWed/YUWahkZavuKJ2I2aH7+CDxQw6DH/DTaEBSbBMLG3aa00aEd+5bC60hsnCgbwPNz02382noigSYqXsk/6DP35Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PEYfYT/pbatrx5JVuxeOrY8ELQqIoxUR8DFugMYvxGo=;
 b=LLU0DvgU0eisgmpoZb0aQ13O6YgTnR1bSJZpCIi7uKLVNgwUliOHb8CIPYLes4VDU0XujBwHMxODIDIwsR+0FhGiLr5O49GdRorvivTCrotORgO1NdmvO2lSWtbFdyRYi1VLKwUbmU4DsewL68ylsowmKC0WNt3eeivDfSsdy/c=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by BN0PR10MB4839.namprd10.prod.outlook.com (2603:10b6:408:126::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 16:28:18 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 16:28:18 +0000
Date: Mon, 13 Jan 2025 16:28:14 +0000
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
Subject: Re: [PATCH v9 14/17] mm: remove extra vma_numab_state_init() call
Message-ID: <5b1d82dd-bb30-4a5a-8f3c-949be4a81c45@lucifer.local>
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-15-surenb@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250111042604.3230628-15-surenb@google.com>
X-ClientProxiedBy: LO4P265CA0001.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::14) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|BN0PR10MB4839:EE_
X-MS-Office365-Filtering-Correlation-Id: fdf2e497-652b-45dd-b658-08dd33ef496c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wIY1ZzWqCcVCFdZDCvk39T3rXVXnBBM8tJ/CjQXYe7aNRLn/12uJvLn3O6h4?=
 =?us-ascii?Q?7jbHD3SFIEogimTioqVsFAdtgjjgOGN9pzY54GfLOYVyLtWPWOSAzclPndUs?=
 =?us-ascii?Q?1hnbwnH/u22pRC88N6HM/3/sAQ+k1lr5cic+C0jRgaQqNzb0rbqOV/raEXSd?=
 =?us-ascii?Q?N4iRhmGg8QE5Qi6Ec+RL7qkpQ2NvQ27kTLvv+OFhZUPHuOeXkmMtZbrEC24K?=
 =?us-ascii?Q?lTJpZHQrVxlC0kEJTQe9WWTAQO7K4abuETHQl+YmZ43pkUHNUTMZ4LpJ25iY?=
 =?us-ascii?Q?6kvEyuunbRxu0ISsz9y2PGxoaxhomSvZvylkE2D9LrdKl8aTLI7DAocC3rdS?=
 =?us-ascii?Q?+1Bn8jDfn5VNuMxQA9hYaPTmVxLV4N2k6aZyVDb86pz2pZZIxjd3t5N5Jl0S?=
 =?us-ascii?Q?QrFLcV4dgjblrHF0ARJmgq/9+0c9mVbhA6iSmKl7+U1GI85VukJRmmwaSTTe?=
 =?us-ascii?Q?1DySv/u3fA+8dmluUp3fUcQ2ZGwiA1ZBtc5SWMmmOf5nbArtc80E9Qd6ZSR0?=
 =?us-ascii?Q?LN+vPZjIJsk3Mf/IfaK6aa+RkEq8MvppzlPVSAI46w8HPE7XS7EOzeOJuWhz?=
 =?us-ascii?Q?9HrXrbkbHbZBIE8GRWWhelBXZyMbAg+FMYHTgi4GE2wQ6em0jXLqO5l6p8i+?=
 =?us-ascii?Q?IGJszmvq11H/U5J2VDlcgpuw0aHsh/s6ERfOgB8zzKpQodk85yQRyofYG0Gn?=
 =?us-ascii?Q?ExmKFiJtBNQA2WqdxWZvRgx/wNW7ZISf+hkFYDn0Q6/af74KenfmybV3yPM2?=
 =?us-ascii?Q?WFxWqZiOsAJjuSZgGju+ZoFIm+4axuDUqQDoK9k+2Hacf4KIii6OmKLB2+4C?=
 =?us-ascii?Q?5XkX5g3J9t5hcqUB4jBXxVZkyVCWM0WZpXK/fYCV7GiRQRHJ6M3ofJitaZQS?=
 =?us-ascii?Q?JBNA+nSK/AOmwt1jYKE54cPgdSid9Sf3A3RmSmcncS06bfCzqPuiDOprHjo2?=
 =?us-ascii?Q?5z+3ynG/mUlkBH40kXLOKKRw4g9lOE2l39eN1diQnCXcbecGgCAeeoIpWp6r?=
 =?us-ascii?Q?pR88Kr7FvSGWEyOdldJKrWR0/h4P0HqMpy1XSh0wm07ylb9f/4CgQC1mPljC?=
 =?us-ascii?Q?d20dFbp2pb53W9jetpuV9jpjKsiGXJmoExx4z3BucZRRtf0SpH0cT0IhC1DX?=
 =?us-ascii?Q?OZ/c43NyYZxZSmxIYYDo7K7eDLu8HKCJay19EJBhFrI6xvrTFV3OiPXhoTqh?=
 =?us-ascii?Q?/Ibk41PZNelZV/cx7/A/8C/V4jy1ZSSmCL7Xjfyv9e2co0DPX+fpCFSRGcKZ?=
 =?us-ascii?Q?4mk2XmieBCiY5HKSwBpznphmkaTsNKyXWPQKdAizMorsen3bs42NBqWGS8+C?=
 =?us-ascii?Q?3NggiPxZeVzwtydp7aUG/tz018nXedqZrjweDcfPQ1qKsN7YkVtiRrTYrW+C?=
 =?us-ascii?Q?mAzrtWZGd2+mKWJtRdsyeZM2BU7T?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5O58qEpI0LZpmeazbpaP+pw4UyN/auVnT67PWdxOuxErNOrwLjeK/xGLl25M?=
 =?us-ascii?Q?C6OoPy1xpNV4d8xHzHpXuritfsZokJtkAet3ysT6dDYNwpdD3tuV2aXeM0yg?=
 =?us-ascii?Q?uuqQP36Pz4X79gBYMaUvmzmnHBNHhyuLbG5sPlEn++LRAlN6bvtTmY02HJLl?=
 =?us-ascii?Q?EG0F67a+eTUTmuqFkRD83n+rfhqTLM/ny7K0Y0HyqtNuhGMrQGOdr8XxxA+H?=
 =?us-ascii?Q?2yl8kI7OtfK7VS+BFADDdoafXaOzx0H4IbnpeLValycChHa6Q+PLdoqV6Z2d?=
 =?us-ascii?Q?/ipHeR5HG/3Fw4hzFdg/oaWy4jzH4RQbybs04TsJGJbyW+CPsaWaObYisaXE?=
 =?us-ascii?Q?du0tYcU0gRMqr1UPTAvClIXrMc+x6B46TUya1DsJv9tH1M0qiVM9Ldo2k1jz?=
 =?us-ascii?Q?zFdDcspkH3bBBKTt5wYEhbH9lo5934d8V7FAAyz9YPI5JzoltU8YidMLr23d?=
 =?us-ascii?Q?0MueJeKVKfhyqEEXsJo6V8VuR074T5Rx285IiGqRBcIIKfpyd4ylkv8qvA1P?=
 =?us-ascii?Q?A8fmQhFePMQlEdS796dnxIcUl5d+thPxwFKmGOc+Rc7KwZqn2Ui+W8OwDve6?=
 =?us-ascii?Q?Hi8dRtGJj0w8pWSpjabeFW0d0qIUPlamLSoZFb0RmwNv/Kbdn05zPJvUlHz7?=
 =?us-ascii?Q?PfW+awar/wvFYrElSNGvYvOjnQLjoYGxpZih7C9MO69vd5HJXkftkXuoNBxa?=
 =?us-ascii?Q?xag6HehdPRUkPR8NhXYUeim0+BCYX7VNqzTY0cyaGN2cMDj6aHKYugq668yI?=
 =?us-ascii?Q?3vws/pVqryKNooRBvKlLvNdueYxS+aCpEXocVgGV+gVAZ6eZo1VBob6Mly7c?=
 =?us-ascii?Q?RGEKGxuPmIYy2D4MVS0bRL0DLjHDyhUf/xPLudYMY8cxhchN0B2gnuxAUVDa?=
 =?us-ascii?Q?P+gpGXQIhbOnyEYJosEJUM1VLvqA5xbQqTKBUfojbVWSeeXnfAL7+2/ljdYK?=
 =?us-ascii?Q?4QkJDuwY6se8fGMDMf5ItoIaXQk9n/9RH8KlIRPiXVkrW9ANCiiw/BfbzzGR?=
 =?us-ascii?Q?CUCwIWQz4uwzOUaf1sgxgzpOiQU/U3VLvITmFXQmks62lt/sZZbVF4j1flZ7?=
 =?us-ascii?Q?V/KM4ToVQo/3Jm0i8FDN+v/T/MHxx2M5p8Me496mypWR7ga+SEYaIIB7g6b6?=
 =?us-ascii?Q?2jJfztJfNQuUPwHnwGT+vZnzFm1K8we2Ehto8MyojTZdywxOJi1aREr8171A?=
 =?us-ascii?Q?huo8fj3Z/XjbVXsof9iEwSyzTqeuIjxGBWVBEYoGaQYj/z5V+DvIGwZm07D5?=
 =?us-ascii?Q?qfNTdCB+gIyw8g1gE6/+YEPZww+GqqePg3XsoKVd/W5r+zXxrihkMM6OUYIL?=
 =?us-ascii?Q?DJNcqO+ObcTb8wzP97T2h3GN3pb4Go8V6JbXNoQHgal6Q6cqrTbsj+pErqyq?=
 =?us-ascii?Q?XB2pZzuJUBhN2SW0v5yDCQtTx76i3gZ0eDEwfQIHTe/oPyWcUcYc+RRzKoVm?=
 =?us-ascii?Q?ZDdXb2S3ygOwy6K7EcWd3y1t225pSH4eRIAUs8hSbFEUPC3FDCFhUbCXlASP?=
 =?us-ascii?Q?ln6eTIb1B5+MoP2ys2gwWRl+Zxix8S6YWPbN+1p5q2k7ZY6Bj6IhVfbowob9?=
 =?us-ascii?Q?qA1OjojVFPhk9iU/2bW0Q6l0fbgpXGwG7tyIlwPIUzmBsTsmvJl/j4HvX7tE?=
 =?us-ascii?Q?oQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pPuBINc8cew2SLIF4FSTVhwEwQUJJiZAWZ69LW4uKAfW0ha4tum/3r0cKdpjH/7ni/mXuR/3aD5QTf2DX/EyCmHPHPFHs4RcnA0dBMUQokytFHl/oAP+QMit5X+RpePMr3VHKrobr2zb3vHcIMWrXn0Sx9AtpdfopzJGDrW3qvBFjDYX4dD6ZdN6fcrLyAHTFTgojTMNhViEGbBP/pAIq9cV49BNxArMe1ZO92FQYQGq9KrPrJslI9EnMvz81CtVbs1gvV34+FvGws+0csZtPn3/JkXJTmT4xyPnAmCwBwgCtUQrbzQ9l3xSDCyqkfYSUdJt/JxBRTj8bdXlxoQERfI939X9cA0fSl+OEDNf4XAiRtw0MLM7s6CcqNmPP6jdzjidxHieYhAUgbJD1NpEkwiAEUu0D5xKk22oyuED5IMwfzfcMB2Gt7dTFXqreYpk+qsJIn+KyMuVrgY3xEqSG0d1G4s6VG4CjBz2o/uJGabOS5kqsZc/jPp15+lPiUvKz06gLSBS8Z81YE6ZNnu7st89hKGEocQxm8iMPJXfzD6AcR5dPBak3lV5kqLVszop5zJCAj/yOz5rEQz+cONfzwCxvReBvnJPHV8vntohV2A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdf2e497-652b-45dd-b658-08dd33ef496c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 16:28:17.9593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UFXLWrDucxGJGk64tAorGWFrJYwn4DE1f22uOrQB1Xkw7RdsbrNU6CaQAOurqaG4Vg7xWG/ymKTZqEtTYX9cE4TZxgwTNJvbtJBlzix2s44=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4839
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-13_06,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2501130135
X-Proofpoint-ORIG-GUID: SLJ6yaLqYP8K04TQALeD-rz8k5X7SHsc
X-Proofpoint-GUID: SLJ6yaLqYP8K04TQALeD-rz8k5X7SHsc

On Fri, Jan 10, 2025 at 08:26:01PM -0800, Suren Baghdasaryan wrote:
> vma_init() already memset's the whole vm_area_struct to 0, so there is
> no need to an additional vma_numab_state_init().

Hm strangely random change :) I'm guessing this was a pre-existing thing?

>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

I mean this looks fine, so fair enough just feels a bit incongruous with
series. But regardless:

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  include/linux/mm.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index a99b11ee1f66..c8da64b114d1 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -948,7 +948,6 @@ static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
>  	vma->vm_mm = mm;
>  	vma->vm_ops = &vma_dummy_vm_ops;
>  	INIT_LIST_HEAD(&vma->anon_vma_chain);
> -	vma_numab_state_init(vma);
>  	vma_lock_init(vma, false);
>  }

This leaves one other caller in vm_area_dup() (I _hate_ that this lives in
the fork code... - might very well look at churning some VMA stuff over
from there to an appropriate place).

While we're here, I mean this thing seems a bit of out scope for the series
but if we're doing it, can we just remove vma_numab_state_init() and
instead edit vm_area_init_from() to #ifdef ... this like the other fields
now?

I's not exactly urgent though as this stuff in the fork code is a bit of a
mess anyway...

>
> --
> 2.47.1.613.gc27f4b7a9f-goog
>

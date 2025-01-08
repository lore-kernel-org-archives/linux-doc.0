Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065711FE453;
	Wed,  8 Jan 2025 15:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736348417; cv=fail; b=HSy7+HOvvPOMKfcKCWFtcZsJlkTRg461bWS2P7y4gkLYgA4A335yJzNK2K3Twm/RVDLWoTJAJ3XtXxEq3mYcdVeHDPu/SyPP9x9Iq8R6IZKS/AqgMaH6TxMuAAWq8zoTq/zDWKZbQnsGeLGPIV89zJlZ6zQUndMx9g1QJAusl9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736348417; c=relaxed/simple;
	bh=SNwUl4+kJDXKFF+8NMyIHMlC5ve9JdZFcqSbLSpIdHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CzN5EWfTAvdWDXjCzPJ4jBGfZR/+BZZHQJGh9JbDSC0AZv2iUN466gTGHb261f7p4TmeHCL8irSn8gGoFtzD2aUnVpk7vbbDm/1YyAqrx5bsqDNmP806v64p2ElztwyduHZ8PTnn9qSM8pfs7H+W362sCJ15A8eFZFqDYIGr9hA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aisbkmP4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=C84jqCB1; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aisbkmP4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="C84jqCB1"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508ENZcq005155;
	Wed, 8 Jan 2025 14:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=KQbXeF6Ge7iEskkHbH
	dy2qL2aps+DMoZo22tevgL1OA=; b=aisbkmP4jKaBX4qZ/emKslqOkNQhCGCJWT
	Fqhtjsa3PVpBOKXh7ATaIGc4xKXTNjE58HGOOv2AJGntgXfskqEuORc/tdGVtTQM
	3cvkA2fbOxIKOx9JmokL/mj6CwgKsELxbiyDRDdHpwSCsIc22Ok6CJR8uh570ZpC
	B8A5yYx9pTiaXL/tKhZt7Z/GeI2tGTyzLKr31M9wdr9qWq3EgjwqUiWq2BGu3y4P
	VCeldKlX26a+b3uEKQ/QtUqOuqBjz3GDV10ERAIe0KgW//ZfUFdkDPaE0Lt8nA+d
	3T2FkNWONNK6tH/VMcn1nnKSng5ZhKD3X0eg1bZ9r9r0N70lOsdw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43xudc75xj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 08 Jan 2025 14:59:38 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 508DMQHj004767;
	Wed, 8 Jan 2025 14:59:37 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43xue9vbck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 08 Jan 2025 14:59:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lXfd4mqZcbNW7gfnRx3CFFxg4aPsRzEu13Fnh10VVIMsubf322HlvXSMLZK9IfmL2lossANpCoXaEWcxkxbuWbCcL0GAICOfoESbwRkzNwH6OdEhlnpm6PX4MvIb9r53XifggMf2zNm6A7zdCZm34bAsSg8HVXkxf+O2KDKgqtTaW4eBnYhEyvZG4DC7ueokL+TEL4/+DzvOJOwvVnp+n72OcjusIODer3xOEwqO7H8Viav/iBvlLyXHQ7Z1Nd4N99D/LXZP0eXB+cwDMWLHh8uGw35rBQVGLpcMhuuxZDITQPYlhnP8w1T7q9RjbO7wVdtDU7z/+kRm76MhviwV1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KQbXeF6Ge7iEskkHbHdy2qL2aps+DMoZo22tevgL1OA=;
 b=m9dgNc2PDBZ+3/yCvFIe70I8CIm8gxlBh9mc1jDiIx2TU49OLuW/AHbt0lp5SenaoZZPNdpjfBQC4NDNGZLNMSh7rDMltf0PDhj4MHxVXvM9CWoBkt6Gb+yzdX9ZjuOLk0VB4cC6Bg69kIuihAdTHHZJvJBYmwBTwQn0RH3FFFhlC7Jn9ZEONU0yr31Lme8yP1R8Yo5a02o9B30NE2Ils2omiYNbCyI2laUEDQYobjPddLiW1o7EitTy82jbhYwjHTTu2tR6dZ3P+hIPvRfROL2orsYY3u1AzzxztWQQONYNl329ynUcgHU/JimKfF17P4ZYkBQslPZnN95fjcIDGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQbXeF6Ge7iEskkHbHdy2qL2aps+DMoZo22tevgL1OA=;
 b=C84jqCB1MhDhu8nJtH79dP3+u/tBfEEQummoKbsMvpF1FW9Y7AmWuf/uegrSQ4Is2DCKwovR2diq1IZiET3LBLuCzKU9bkEoYpbwdFDA/r6Fj0pcxeQj8qqDclS77jR0X3TvdV5mQ5x3Lj/GTov2jRJGk7YsJIZOmSz7IjTLzv4=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by LV3PR10MB8012.namprd10.prod.outlook.com (2603:10b6:408:28a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Wed, 8 Jan
 2025 14:59:34 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8314.015; Wed, 8 Jan 2025
 14:59:34 +0000
Date: Wed, 8 Jan 2025 09:59:29 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org,
        lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz,
        hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com,
        mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com,
        oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org,
        brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com,
        hughd@google.com, lokeshgidra@google.com, minchan@google.com,
        jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com,
        pasha.tatashin@soleen.com, klarasmodin@gmail.com, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v7 01/17] mm: introduce vma_start_read_locked{_nested}
 helpers
Message-ID: <fx7nm755qz2pydgakjrvo3bqtrj5j6fqfy47jj5wo2zdfelvwj@zgxk2nrhqruh>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org, peterz@infradead.org, 
	willy@infradead.org, lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, oleg@redhat.com, 
	dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, dhowells@redhat.com, 
	hdanton@sina.com, hughd@google.com, lokeshgidra@google.com, minchan@google.com, 
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com, 
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com
References: <20241226170710.1159679-1-surenb@google.com>
 <20241226170710.1159679-2-surenb@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226170710.1159679-2-surenb@google.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YTBP288CA0026.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::39) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|LV3PR10MB8012:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ab949b9-6f6f-47e8-44b6-08dd2ff51062
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UuXPZQwUyR7sfXyRREymNqeHvMbU+DLYKincMSMNhdg3gMkwt2D8HT42uDQa?=
 =?us-ascii?Q?3JJmnpCghsYFyTBiOlZqgwccdbmfgv4EvvZz6Glz8r71OIG2B29zlCcJ3XHd?=
 =?us-ascii?Q?v2HPdrIy9+Wgo879PX+MIJLBWg3t9hEGlR3t5P4MsxFViCZjgWnXcM1qfNNz?=
 =?us-ascii?Q?63wLGyMbt1LmF553l6xzhT8TJIFFEPGQ3zdacdDAUC5KuziF08+2o+u/ot0B?=
 =?us-ascii?Q?eUAgFsbm2cIMx9hh/BgaD4rsAfX1Uf8E3YSqynzFA7A/+wt3Ui8WWq4tMkov?=
 =?us-ascii?Q?2bJJTALgZtzvP/fyS1uDHj6R3/iqQSAmqvnBGeDgkPvP6iyz0POsbDr8Ft63?=
 =?us-ascii?Q?em83pbfjmmGrt2wIUuQZCGZC8yM6O37J7Hhj9jbsPhjHsn5HLNPp5EMlLstd?=
 =?us-ascii?Q?2nc47Lbu+3tGuuI7DUj124QnWMVTgCkHNz+R1UufJFevy4e50ZCe4u93bRIU?=
 =?us-ascii?Q?q+bkQNszI2X6tfSVxoPgHrE9JrNsh5V5Lt6YDPky4woOudigaIN+YgJeDRge?=
 =?us-ascii?Q?vFFbu2dsjwaMUT5nG6rwngfmoLhQiIdEKpF0NficXFhQFKmr7/MzacOgeLJ0?=
 =?us-ascii?Q?KDPvY7FOxGnGZwnXBTg9QAHamd7tQT9lEQRGJ84jWUEs3ySxZ2yrYZdr8Bp1?=
 =?us-ascii?Q?zqkqnGVPgG7+A/IYqfoFJ35h+OpGceADGYrYJyCq0i7Rn/nnaTbnd9fyGo+J?=
 =?us-ascii?Q?jAGVDmP+UfTsxF+SjH8BP4kTqbM3OT6BftlmX+u86y1FTqUKXRsHWHirP0LQ?=
 =?us-ascii?Q?stDJG2telmwRktzp2OFeHNRMCLBcrIx8RfBUv+aoRpmxK2VXjuNBHZeZJDNj?=
 =?us-ascii?Q?+27jkj1XchE/fL15T19wKzq/TgotW14YxZocRBOR8Arh1IMu5Ix/N2VDpUz+?=
 =?us-ascii?Q?fbIRu0Xrc+DsVDUfyYuquyKS0LtIwZjqA1d+101eX0tgsa+pIz+T42i9sBPK?=
 =?us-ascii?Q?hau3M4bVGt+L9LuDYN94rqgwviabhRSaTGLrPR3bsFvQQLruZifQ340svr/3?=
 =?us-ascii?Q?j7o5JnnTvKpI6pFd3Xb+EtSAZ87UKMv8tFcqwliFYz8KcnC64gjePB6wQmul?=
 =?us-ascii?Q?NjjeC2Xv0qmlbuqv+Odda3ZhegAoCBHKBk5zW6GiL4xpVPDIE9TVMZooiPWV?=
 =?us-ascii?Q?ZdHwvd1GQ5Bjvlf1FQuy1xaCPbCcbwWy4W6X43OQJPwPSeCYHZ+UJaESW8sc?=
 =?us-ascii?Q?4zhkypgdPheZH+2k666BlevEzNYeJS81iah9nQ82f3nifeprWgeIQZgg7ZSp?=
 =?us-ascii?Q?NHndrXWGv4igByXrPVXgjfxUeNnSPbYNdVX5ospH9bVlYMJZbu4iNBtaGDlA?=
 =?us-ascii?Q?R2qCcltXftnrpkSSwgjnKhviCMTbEvzqA/EYIwL6ggQVt6pYLKBQfas8jFaY?=
 =?us-ascii?Q?nP7mufR5eq2xr/X2mICDgQi//bLJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nWzD3HbnbILmRzvueOBttmJC9qRiGOInCtm0uXRAFVSUO1XYmjdgHGAIx6uA?=
 =?us-ascii?Q?YH6bhhQQPjbx7fxLMQE7CQez9P/54xT+6dVIhL2kGWmjo+pU2C5saMCMrvUS?=
 =?us-ascii?Q?mYhNYvt1KyreVMymYheAEeA797THeP/SjDwuFIltZViBZTIG6T8s3Ko2MrFd?=
 =?us-ascii?Q?VxsUgXuecOjh2Ncp8vghatlA0GrSGVn4sSGE0g3OtMqDGwfDkfEFzxU3RHpP?=
 =?us-ascii?Q?dnGp7ivntiwRNNjK3LHbgATKPeePXqSMaw3SltLfGCbp6PtFnrOHmzxf0ZGc?=
 =?us-ascii?Q?OlDcKWAM6chzkxej0yYDPlOHyKRcSHBKvavju1V381ktJJcu9+V/tACRVk95?=
 =?us-ascii?Q?e5Dyzzt0v6GqA/OJo6VI0XWbcydOOE5GEck6115EFKNtwq3GPQQ5/xKGCEEy?=
 =?us-ascii?Q?a2hkGqpV8vEdcoylTGuZqsmQudONHKR/4FqIb79HVjUNV6z2GWT7Ns24/93x?=
 =?us-ascii?Q?M8MysK9kNsovMJJeo5ggXv7CQXWw4aAO3bZua4pRuFbRQtZnDVfdbzOaVg9O?=
 =?us-ascii?Q?kb9KSFCiYuLVRXXxziWbY4g1PGuU08phPu+Rw18bAkrcPi8IvTbQsv6tw/UZ?=
 =?us-ascii?Q?JByZk/SVvv3NgDqteu1YiYfNPrP1M8Hn8hTLTyEwFO45QgDxZExitwpk7XlF?=
 =?us-ascii?Q?BS/wXgiWQPg2WeKYObew6yof3gIHxTnlnOmZiz4YAeMMWU3/H6QGzajCbDzD?=
 =?us-ascii?Q?d055f6TkX7rT5ISytI6B4pb6pXTJRqhI1l1mgnQQQcjSK1Hl/znj5TEa7X6F?=
 =?us-ascii?Q?3FY8Hmdbo621vzkdsZGJaDRLgMz4MUB96CfMhove4sUssdAqVntnEbnOZya4?=
 =?us-ascii?Q?U9eaIgUpf/QMPCiczS9t0zLc9xbNjr8hcG3ONYPPU1nt7LhXDKWNGazlbPSj?=
 =?us-ascii?Q?fWCTZ7oqXfICkDMd6f9QRkYotfKaVphtiJHHTMsfX470mwGgmV2k8IVOjCw1?=
 =?us-ascii?Q?Q2uHBCkqr5F1utFSRFgxWOvSNrBSR8W5XOjEqclMcl3/+S8JSJ89nhMJRDlg?=
 =?us-ascii?Q?f5fJANfF4lkU2S3y214wh1sNF17uZZIvpVNXxoRPgRs5CVyx0LwrfkTWbZoG?=
 =?us-ascii?Q?j6s/VBVQELCfODf8g55/fywsnPa50P1jVjM2AoXM95+0X2nBILRZKD5IHqS1?=
 =?us-ascii?Q?uKKviHXHcVT+2i2xY2OqfNgSeid49vz+g8RgckyeMzkVOu2i9rdj4Jr+9qLg?=
 =?us-ascii?Q?FwjwSbyFVC1S/h5jljOb5nHQVz4UPMyp0MIaRopJRtP+WXoVmm63+DsUnTiK?=
 =?us-ascii?Q?md+CWareZeRPo0nz/s8jRXZXfSOgzf/tZjejVwhnSt9hK5yS3tSBFfYUi3Ju?=
 =?us-ascii?Q?tANaRytsb49DenBPX//SfbYM6dbypq4rBmyz6tzUfYnqEaKa+O9ozSpvY4Zm?=
 =?us-ascii?Q?KnrvD60MG/uV7LTBTyoMTvG8ZLD/6RbEW24QmpXFj8I/G9EuA5vmHHgxqUgq?=
 =?us-ascii?Q?LSpe03oz3x9PT+SkJM7DPWnn3ih7yet+KgyebMNWN+6kn0j0oxBbCKVzswI0?=
 =?us-ascii?Q?maTqYsEMKKEFrcUUBDEvYBFRv9J1eW0FJmVTS3A/DFRmwF3Kn9wg+LQI74Pu?=
 =?us-ascii?Q?x566khzBucxppJRMXqO73FFEj4Ca1GEGNgsR7iXi?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8VoxzsRDeR87lnu+DRG5BqavAJBTkaFWkvdqscX9fWHNhJS4y+dZhPWn/7XTeO40EurJYcoFWJkWnOdugGCvQ1Kw6LPZy4ZSCBBQ1h+NJ2mocfw5G7o7XtCAIVSNloE1nsLeJDf0m222LMlyPP4LsaRfXRONJGjK6n0QKDw+ccfP7v8MacaZ5aX6C4nrCGYtOzQ6NFcfwsVYUKWkRbkSEwe1JsxLqbflScCsN4lenymVzghD3O0jFGViFA/UdfIm31YGQTaxu6n0xXTS/FwKjtiNarwErLRa4BphQjNcJ3P4NiULBNPio4DtZ8N4sG8XAOHPMBJTx6cTRJhDpts+yeJEAehyaToNI2ZRYyHuR/FxQzb+hieIAlW97yJUUairZADHsq+SW7nA2XPDwbvno1CMOJtR2vlBqe/FBrlFyRqBmN6O3RRpw8XfyAd8hsP8OEpOl0IR9H8VvGRNIgCj8+XqOtICiFbBxRtQzNf1VSY5JCgQMpvxxrWtupv99Yt3nQ3K/2iyma50SfldvjtAathUbK2DWbBzaEelaNTl8695tQn9idlNXMt0RzMaC2jJkqslshmp4jgDOi1AX4yIjHnfHad0JWsk+YVPrL11lz8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ab949b9-6f6f-47e8-44b6-08dd2ff51062
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 14:59:34.6027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A4l+R/rFJPMSZokKn1DR8dqTWxLodUwC6ubcR6kjeFhT4IGPa3ufAYgMJJDUVEkokojOx5C+NtdLMxj/0n5HdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8012
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-08_04,2025-01-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501080125
X-Proofpoint-ORIG-GUID: ngM8-eGCmjXYXB3IRjWScp26fu3qN7hO
X-Proofpoint-GUID: ngM8-eGCmjXYXB3IRjWScp26fu3qN7hO

* Suren Baghdasaryan <surenb@google.com> [241226 12:07]:
> Introduce helper functions which can be used to read-lock a VMA when
> holding mmap_lock for read.  Replace direct accesses to vma->vm_lock with
> these new helpers.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>
> Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

Reviewed-by: Liam R. Howlett <Liam.Howlett@Oracle.com>

> ---
>  include/linux/mm.h | 24 ++++++++++++++++++++++++
>  mm/userfaultfd.c   | 22 +++++-----------------
>  2 files changed, 29 insertions(+), 17 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 406b981af881..a48e207d25f2 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -735,6 +735,30 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
>  	return true;
>  }
>  
> +/*
> + * Use only while holding mmap read lock which guarantees that locking will not
> + * fail (nobody can concurrently write-lock the vma). vma_start_read() should
> + * not be used in such cases because it might fail due to mm_lock_seq overflow.
> + * This functionality is used to obtain vma read lock and drop the mmap read lock.
> + */
> +static inline void vma_start_read_locked_nested(struct vm_area_struct *vma, int subclass)
> +{
> +	mmap_assert_locked(vma->vm_mm);
> +	down_read_nested(&vma->vm_lock->lock, subclass);
> +}
> +
> +/*
> + * Use only while holding mmap read lock which guarantees that locking will not
> + * fail (nobody can concurrently write-lock the vma). vma_start_read() should
> + * not be used in such cases because it might fail due to mm_lock_seq overflow.
> + * This functionality is used to obtain vma read lock and drop the mmap read lock.
> + */
> +static inline void vma_start_read_locked(struct vm_area_struct *vma)
> +{
> +	mmap_assert_locked(vma->vm_mm);
> +	down_read(&vma->vm_lock->lock);
> +}
> +
>  static inline void vma_end_read(struct vm_area_struct *vma)
>  {
>  	rcu_read_lock(); /* keeps vma alive till the end of up_read */
> diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> index af3dfc3633db..4527c385935b 100644
> --- a/mm/userfaultfd.c
> +++ b/mm/userfaultfd.c
> @@ -84,16 +84,8 @@ static struct vm_area_struct *uffd_lock_vma(struct mm_struct *mm,
>  
>  	mmap_read_lock(mm);
>  	vma = find_vma_and_prepare_anon(mm, address);
> -	if (!IS_ERR(vma)) {
> -		/*
> -		 * We cannot use vma_start_read() as it may fail due to
> -		 * false locked (see comment in vma_start_read()). We
> -		 * can avoid that by directly locking vm_lock under
> -		 * mmap_lock, which guarantees that nobody can lock the
> -		 * vma for write (vma_start_write()) under us.
> -		 */
> -		down_read(&vma->vm_lock->lock);
> -	}
> +	if (!IS_ERR(vma))
> +		vma_start_read_locked(vma);
>  
>  	mmap_read_unlock(mm);
>  	return vma;
> @@ -1491,14 +1483,10 @@ static int uffd_move_lock(struct mm_struct *mm,
>  	mmap_read_lock(mm);
>  	err = find_vmas_mm_locked(mm, dst_start, src_start, dst_vmap, src_vmap);
>  	if (!err) {
> -		/*
> -		 * See comment in uffd_lock_vma() as to why not using
> -		 * vma_start_read() here.
> -		 */
> -		down_read(&(*dst_vmap)->vm_lock->lock);
> +		vma_start_read_locked(*dst_vmap);
>  		if (*dst_vmap != *src_vmap)
> -			down_read_nested(&(*src_vmap)->vm_lock->lock,
> -					 SINGLE_DEPTH_NESTING);
> +			vma_start_read_locked_nested(*src_vmap,
> +						SINGLE_DEPTH_NESTING);
>  	}
>  	mmap_read_unlock(mm);
>  	return err;
> -- 
> 2.47.1.613.gc27f4b7a9f-goog
> 
> 

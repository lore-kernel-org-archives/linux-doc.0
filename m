Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3755315350B;
	Wed,  8 Jan 2025 15:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736348444; cv=fail; b=XeQu+I8s8IUDJczNrpMtaogzyZrZ33weiGe3f2+atu0hDGIRpecMqutPZBo1MHfInVfoxnv7Zno6F2lAycT0+TjWTVquGSNZM+pYqAjk1mbR3QU5+EladpwCbsTofVNC+GSHXGopPtm8/P7ADM8i2SP7NeWgPjuoqRdYNAEFGYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736348444; c=relaxed/simple;
	bh=ojyX7q7L3FLQN/pOBZIfMaVbp5rS56UXzpTvUr1o3HA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QeyHj9xv+GToAgoshsmVqAvvQHZow+oDKF4+HjnTh0eXUhKWWmMtOh833xcYdEUMKQZPhAlMLtfRgB2IbHBJVe0QBGSXycp8/55ROFNantyxQcQaDT5zMN1ELyWmkuVW4K5i9wGnnxtwBZi9OVUYE7XVH7DXyb+LZM0LM6YXMiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=A8BZcJc4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=sQPYU/O8; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="A8BZcJc4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="sQPYU/O8"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508ENUVw005092;
	Wed, 8 Jan 2025 15:00:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=th5pPvqzB+FAq+ZGmP
	bsxBhmULS8zcnmB1yE09hnm50=; b=A8BZcJc4jqGuC8+Gi+9YC0Baau+OqRR3m7
	VSZJPccgLQu/5j/oRY28waA9OjFmEMiiFHbAg1TLdVVv4I2SWOEdTnselRGoBs6G
	CP2L8+Km/1DqDDfzs3UXYcw+tAoZ10GJIJ/EkgxxbpslHyyafdmcWpEuujcFBD6D
	ZkeMdImFbq14yI9fiqjuqo8eJegDyKJYVJ9lnDjdZl5hN8CjCY7ee5Enr7nVtiP7
	sHgIZG+szn6Bp9SkPnY9uSmyfkSiyvfkOeFbQFOWCvVhiCZqgOmPY+x1vlB9VJ6i
	M74NmUpUzCr4mCEs/BlonOG4Nsn/QSnXKHVx6CNofH8pj8VphHeQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43xudc7600-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 08 Jan 2025 15:00:04 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 508DaJYG011172;
	Wed, 8 Jan 2025 15:00:03 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43xue9p4se-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 08 Jan 2025 15:00:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LWofVK7RTR4n4rNT8nffi0s3KQxQnQzIsWjDZNmH+uhXj1Yq+pYT0lPniJ5uuS2TvA6gnMvws61BtBfShC6w+T3TtyWxIPLy2XzW8sxr2CvNf++r8+zXZhojzS0ZphSyOlj3pU5FZ/DhTCdC5dSc4uLyCl8cWCP8E2/GP+Y9tz1PK31sHXuFMQ8RsEd8lZ5IMWQOV7bTiXXWggQo2ijP//IWitp9b8zr+k7QxKYBFvSL+NqUIz/kWJOlxLVc8ZyKvlHEgddFt6+qf40fb22oDS77k1eZbJXUnhQiPH57s67KrZCrB2hEG55eXaY+1p4QNcviNiubAiuN2golzyDeUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=th5pPvqzB+FAq+ZGmPbsxBhmULS8zcnmB1yE09hnm50=;
 b=e32YD92V1uPq3SB3sbWvdMs+NQM6ayzOiXGKfo+dnUfcvkanHARDgFXSdSutaNXbClPxRwl+QgQkRVjDvHmFHStILZPUjltmcYvTn2Tk8tuXWgc00UcjEZErKTJ8Qh5vxBk2z6Mnq0NunAhM35zzMnq5G+eLem1knYYSiFUkMuL4b+49Aw6IQz+yA2gUU3KTs+Qaen0Qig2HaIo6zQe5lowvQjHUq6mx7sNaoLeALI3aiHLaHQjG5vZvMmmVHQI7c4vjN9ZDY45e+xiyJfwKe04zkEAidj8klAYodEYT4JF5yEYJVT4yJGd+oevTjHyLaCCHOZy+BuFmo2XLCj1bWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=th5pPvqzB+FAq+ZGmPbsxBhmULS8zcnmB1yE09hnm50=;
 b=sQPYU/O8JBsyoUWSHcNNJvEtQlMCK6TgfwUMXWP7yO5eAHo1yVf6bnxFLsaKoCFBcNMWpJ5evb9VyraDHoBDK57XnjqkvxWquJ6awHZQvsodbk8aTMprPANY1gzZL5f1ElrdjKIQmCBdpZG2LtWXelD1BqGS1LSwzCreyylhLqk=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by LV8PR10MB7725.namprd10.prod.outlook.com (2603:10b6:408:1e6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Wed, 8 Jan
 2025 15:00:00 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8314.015; Wed, 8 Jan 2025
 14:59:59 +0000
Date: Wed, 8 Jan 2025 09:59:54 -0500
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
Subject: Re: [PATCH v7 02/17] mm: move per-vma lock into vm_area_struct
Message-ID: <jcdhaaavbzawxikgntsfxhjmtbxv4trgigfgjg4vvxljz6ruv7@3cu5uh7n5jc3>
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
 <20241226170710.1159679-3-surenb@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226170710.1159679-3-surenb@google.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4P288CA0067.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d2::27) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|LV8PR10MB7725:EE_
X-MS-Office365-Filtering-Correlation-Id: 208822aa-cdc0-441d-40f3-08dd2ff51f6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CcLCSY+azt3GocMt9au7F5lW0L515ky6GcDjNTDvSlwF+3fQ0c9HEu6fovCf?=
 =?us-ascii?Q?DpZF7wPaqCX3zxHRfqDslzJJ7fqOY9LtOD0sfp4+0N9g+GI4WpCOL95wnHxw?=
 =?us-ascii?Q?itBVVW64hDOXrMkFY13nNh0FhUMaBU0Uh8MiddfMuK3b8/+MbqLyr5ilRcGH?=
 =?us-ascii?Q?cSrJ8DDfI+WtozTJ8UYP2Currca5cmeHG+eBPr/ZR2tuyIT1rPLXbE90mH95?=
 =?us-ascii?Q?swD6xwNLlhSa/VnV6XJF69BghT6nYVwXGZ2dTDNg0dP76bAF4OMAwwF8U1Np?=
 =?us-ascii?Q?DPWu0Wd4Xn/RH8weWsP+yOB5Aec1H4eL6kRCshtfokUhIx8nmL+dQ8e2kgTx?=
 =?us-ascii?Q?xKSZ1DPHL0bAi+P+P+yXy1fT3kl+m5U0YKL0LSaowphoHJXEEE/Hvr3Qxv5h?=
 =?us-ascii?Q?gYeYBLJR5v911zUmGaycEAHgvsQZlpZFQgJIdPBxt4QIVusLK1GZUEdSSLEe?=
 =?us-ascii?Q?nCXUzvrtfle5e5hVKiZpAfDZSZGTF5ZNEojm9TUbZcHie8zYlnG9bwz5WXen?=
 =?us-ascii?Q?b1mIqsir8xWgV8gW3+TgSNQ15VJ8m7Eugyg09p4q8UGty6VLun+NLjw74bvA?=
 =?us-ascii?Q?mjMBVeecL7Nfwa3z0WpurT0fhFL0X49UTlSM3WqZjCGTIQkvi6FcsG3TOUEU?=
 =?us-ascii?Q?X+VnBrm6COBD3KREskC2pkrJEXjPKkupBcyJ5oF/m9r71BnUgjmPJn39i23x?=
 =?us-ascii?Q?9nivIDbti+4cBI1TMp+oEnNxpFPgckG3or1R88H2+M+nKi2GImVfxMibHYiM?=
 =?us-ascii?Q?kU3gWkkplFCWQ0fIe+/J9r6wR+dHG+Zdij8tKdOt5XEX+VIcCWVGZeshRRCx?=
 =?us-ascii?Q?my2qjCd/oYdDN/WBx6kjL45WRF7eyPV9uvFJaLZsKtLakKK3Frrc1SiPbHCh?=
 =?us-ascii?Q?ZhgjYRieQ5jNnatRYmm9KrDy+3rHBypP3pdWZvXcH0vwsC9e9uj94Nk+/ckl?=
 =?us-ascii?Q?U5m4cdEH8bYGDP6XpBGncsV1pROKBMYC+LEdCQP/qT9Ljc3mq31M1/BucyOy?=
 =?us-ascii?Q?fLqwL7cpGpa6Z37qtka2o1I3cAVakT5SAjaJXvD3V3mRobKQi+gFcCAJdctD?=
 =?us-ascii?Q?Sp7K7cj+0GjK1NFzs4pURPyMRQ3Bn6eGUPCrlhr1s/xkFbtASLsy06enirMs?=
 =?us-ascii?Q?NE/sJtdf5kUXq4DwskPw27H5+Iaq8iz1UzT1lOy0YM9240XGtENwSf02K20h?=
 =?us-ascii?Q?pXwqh+belF0OoL+ibrfDgZG3l9uIXr56Ny0+DXrBJI+lwrLwv21S+zMaZxPo?=
 =?us-ascii?Q?ofY7pncAMQmAPOrD+0gu/YSGeghrAcVTYWJSjyw3oqqEmgg4J6088dDUheSU?=
 =?us-ascii?Q?xZIg0JgNwppzykTL+bxft0neE0L2UBF8+KqclHW91fbmow=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HwuOPBNM8GewAjAW6Y4Jq9zVJZCiv5v54+dFspB5XnFhjiXNmbuc9YGCcffJ?=
 =?us-ascii?Q?xqn9mdS0ounBFVnZlYw051aDMD57mnF095dLx7AAAyL5XFwSDdJiULda5nVO?=
 =?us-ascii?Q?8sIt1GE0RhOCjVRdZkbyuthb8s1YEqKmZ/JgocvVtSUML8paUusI70I1NK9d?=
 =?us-ascii?Q?DU/GMVQ/JzH1nr/0ACoAzm7IKgAR7KW3/8Lf5WPuWVot87sKPQrPL5GOd715?=
 =?us-ascii?Q?JVORSnBPiyhGf2yERHHCXkf/gm8efCJHeCJfeXoPwiBU+vRuQcco/hxCCsc5?=
 =?us-ascii?Q?PJkeVr82wLwCzdZph40bTO/jAdxTRIJkAmWauJX6B17Ra/FRLoCDn9JOyY1i?=
 =?us-ascii?Q?7XKV9hhUhEwDdMV9zGI/DR52GUDTrgDYOc5nTPe8JwdZVOEge4T7VTuERy89?=
 =?us-ascii?Q?7qCnhrpdXfeCkgCZorUh2XDDWPsgru/YHrz9M5Prjc1bGajgL0RWcpfYpdZz?=
 =?us-ascii?Q?Hi8FHOAwVjZgkVvymu2gf1pj0rtTfJNVVZDXhs5luvG2aRWjUEwan8z5qCWp?=
 =?us-ascii?Q?XxgG6r0I6PX/bN8bGE4QLYh8z6mtbtSxrjkp6iaJOH64RXrU8sLhNOXCf6fh?=
 =?us-ascii?Q?ULlbnk48iOMR4btlJtKj4bO+Ij58i+6OE811DbqqyTefD2epDTUF6lx7eP9K?=
 =?us-ascii?Q?rYgmLTUjLIgHwkPy3oU+OTHbweXryiGKJrCh1khK72kyKFImxDS9SuNfnkUt?=
 =?us-ascii?Q?tLRoyr6Q/vmGj4UmtdHpc6qJ/ekQObJR6a5eAHHBTgo2A8/+LVO6Yddk9FkF?=
 =?us-ascii?Q?ibIt7d7ibaQsuG+w7LlTnOjVo3goJ2WaMbt4GPc1/mu4gMwDW0UFwUYgaCAW?=
 =?us-ascii?Q?W9CM28DnRYo8w+hA9fADtT0y55geKrvjHfrfHg5JESR/8IaDpv/6AHDef9Bw?=
 =?us-ascii?Q?tjSXibTCmQpBA+UVQUr+f1Dhb/XrVmQiw/w05UtaXS61Spfqf/eKbcGUgn6W?=
 =?us-ascii?Q?ZjK0+TYboWciXGTOuFjklC4e+y2vdtopJs864EEgZ5x8uWBKYDQnZvnYZYoN?=
 =?us-ascii?Q?u+L6WluGs9+sCX6KLd4J7QRFEdHmlz3CA0Bgxe7FGkr/b7f5/vYDYhXnW2QV?=
 =?us-ascii?Q?yeQd8zNk/OE4pTM9+nMe+H8MElKGunLj9Q9FvQ557Zy2tSNsE0Avtk8VvMRY?=
 =?us-ascii?Q?cc2YVaMElqk6/JeHIBsi6qOJ9N/BIX+gElJWuReDPeQWN6MmCFxPMCWyvrC9?=
 =?us-ascii?Q?CXLhDEgWHXqBi1Ddg2W5LO/MorRsQnhDhaFlLlB7cXWZHTxXcRSxMI3n7Yfk?=
 =?us-ascii?Q?hahttFKBjuqXPcTfZ63hL8lZBFwpBB9Nd9cagM+XSjtBKsgL6wbc7N/1C+jc?=
 =?us-ascii?Q?BsD9x5Eq2e7AmDTvUe9goJOkoqlhcTpK/gTs3SuF6o6KJH45+5Y1BMIv7JJg?=
 =?us-ascii?Q?zowMEXJl090v9iJEhRl98SKB5CBjrs38nvOyOGtn2GG6Av7rSXe16t0127ya?=
 =?us-ascii?Q?dj1WZWbccl2QAE/n76SeduRksVdzi2Rjwwvu3jKtixAi/HhN7vVBbUfzdicm?=
 =?us-ascii?Q?Me19Ep/QfIlZQekw+jXcbue1APlCUnYTDIyuK9+sXF3dBnZtkI/E9wEYZHMN?=
 =?us-ascii?Q?7gP44+gLlM6kkwUbLbmKeYFPCP7IRw0RAwuWBQS7?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Fcg5B0GNOlEEERC3q/B31YazX+pN3B3q/aThIfdtPeX8LuYaCUdvxLfdcg9Lc/OxXvnTudZDFEZiUb9V+xjVWo2vCvtbbHjBqyN702ftG+OdcoOXu/c66K9/rjDKYHOieGmZ5tfDBHmEVpKhPqyay+xMJTHSpDyJmXlp6Hc+g8EtAFLN5os2VOtovKnAzwUegvOwSN2KRFGeh5mc/t4RKmpmE9Jus+xZYuP+zoSFz+pehxyf8yJbjEpLb91thxqZJ/5dZMMic5OrMimjCC2zZptbriubhJbyLah3VNoaJd9eyZ7wn6Ok0wE2MIUkEf1tcVQ2JMsxw8OvrjnzL0JgPJBgwJ949zowdANnXFSHG0cEuf2RRc8gke5w/Cnt5CeVtwn2B2U4JWgz1VbpNB261iASdTmsH1lQOer0+mBYE98NEdwYk+F54U0uqLnUb5r92yHl89/qFrBPhTWtYQN3BYiufIaHxGcua8NIVW791sGD6IShlj/M5o9h1bl5oEbPbZ0SvdQcJM0f9U1U015SZpppqcCYvvqsdd6KvxbUG8qhzGUZjtrx7DxyvrOTGrBUg7Yc8xB7u9DsK+4Pvom+Fn6A97MVeDMbTBYr5PpIW38=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 208822aa-cdc0-441d-40f3-08dd2ff51f6d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 14:59:59.8942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cy6EntaEt7xJ7tqZ7ZxBVj2ZjN8I3rR/6ayiiqzd7KFr1shJBPERHZ38yz8t6nr/XL7pOL/vcrYnrsUsw8p4hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7725
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-08_04,2025-01-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 adultscore=0
 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501080125
X-Proofpoint-ORIG-GUID: 0AKaUKGYIm9VYgvq42rD7jd63fJRddpW
X-Proofpoint-GUID: 0AKaUKGYIm9VYgvq42rD7jd63fJRddpW

* Suren Baghdasaryan <surenb@google.com> [241226 12:07]:
> Back when per-vma locks were introduces, vm_lock was moved out of
> vm_area_struct in [1] because of the performance regression caused by
> false cacheline sharing.  Recent investigation [2] revealed that the
> regressions is limited to a rather old Broadwell microarchitecture and
> even there it can be mitigated by disabling adjacent cacheline
> prefetching, see [3].
> 
> Splitting single logical structure into multiple ones leads to more
> complicated management, extra pointer dereferences and overall less
> maintainable code.  When that split-away part is a lock, it complicates
> things even further.  With no performance benefits, there are no reasons
> for this split.  Merging the vm_lock back into vm_area_struct also allows
> vm_area_struct to use SLAB_TYPESAFE_BY_RCU later in this patchset.  Move
> vm_lock back into vm_area_struct, aligning it at the cacheline boundary
> and changing the cache to be cacheline-aligned as well.  With kernel
> compiled using defconfig, this causes VMA memory consumption to grow from
> 160 (vm_area_struct) + 40 (vm_lock) bytes to 256 bytes:
> 
>     slabinfo before:
>      <name>           ... <objsize> <objperslab> <pagesperslab> : ...
>      vma_lock         ...     40  102    1 : ...
>      vm_area_struct   ...    160   51    2 : ...
> 
>     slabinfo after moving vm_lock:
>      <name>           ... <objsize> <objperslab> <pagesperslab> : ...
>      vm_area_struct   ...    256   32    2 : ...
> 
> Aggregate VMA memory consumption per 1000 VMAs grows from 50 to 64 pages,
> which is 5.5MB per 100000 VMAs.  Note that the size of this structure is
> dependent on the kernel configuration and typically the original size is
> higher than 160 bytes.  Therefore these calculations are close to the
> worst case scenario.  A more realistic vm_area_struct usage before this
> change is:
> 
>      <name>           ... <objsize> <objperslab> <pagesperslab> : ...
>      vma_lock         ...     40  102    1 : ...
>      vm_area_struct   ...    176   46    2 : ...
> 
> Aggregate VMA memory consumption per 1000 VMAs grows from 54 to 64 pages,
> which is 3.9MB per 100000 VMAs.  This memory consumption growth can be
> addressed later by optimizing the vm_lock.
> 
> [1] https://lore.kernel.org/all/20230227173632.3292573-34-surenb@google.com/
> [2] https://lore.kernel.org/all/ZsQyI%2F087V34JoIt@xsang-OptiPlex-9020/
> [3] https://lore.kernel.org/all/CAJuCfpEisU8Lfe96AYJDZ+OM4NoPmnw9bP53cT_kbfP_pR+-2g@mail.gmail.com/
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

Reviewed-by: Liam R. Howlett <Liam.Howlett@Oracle.com>

> ---
>  include/linux/mm.h               | 28 ++++++++++--------
>  include/linux/mm_types.h         |  6 ++--
>  kernel/fork.c                    | 49 ++++----------------------------
>  tools/testing/vma/vma_internal.h | 33 +++++----------------
>  4 files changed, 32 insertions(+), 84 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index a48e207d25f2..f3f92ba8f5fe 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -697,6 +697,12 @@ static inline void vma_numab_state_free(struct vm_area_struct *vma) {}
>  #endif /* CONFIG_NUMA_BALANCING */
>  
>  #ifdef CONFIG_PER_VMA_LOCK
> +static inline void vma_lock_init(struct vm_area_struct *vma)
> +{
> +	init_rwsem(&vma->vm_lock.lock);
> +	vma->vm_lock_seq = UINT_MAX;
> +}
> +
>  /*
>   * Try to read-lock a vma. The function is allowed to occasionally yield false
>   * locked result to avoid performance overhead, in which case we fall back to
> @@ -714,7 +720,7 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
>  	if (READ_ONCE(vma->vm_lock_seq) == READ_ONCE(vma->vm_mm->mm_lock_seq.sequence))
>  		return false;
>  
> -	if (unlikely(down_read_trylock(&vma->vm_lock->lock) == 0))
> +	if (unlikely(down_read_trylock(&vma->vm_lock.lock) == 0))
>  		return false;
>  
>  	/*
> @@ -729,7 +735,7 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
>  	 * This pairs with RELEASE semantics in vma_end_write_all().
>  	 */
>  	if (unlikely(vma->vm_lock_seq == raw_read_seqcount(&vma->vm_mm->mm_lock_seq))) {
> -		up_read(&vma->vm_lock->lock);
> +		up_read(&vma->vm_lock.lock);
>  		return false;
>  	}
>  	return true;
> @@ -744,7 +750,7 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
>  static inline void vma_start_read_locked_nested(struct vm_area_struct *vma, int subclass)
>  {
>  	mmap_assert_locked(vma->vm_mm);
> -	down_read_nested(&vma->vm_lock->lock, subclass);
> +	down_read_nested(&vma->vm_lock.lock, subclass);
>  }
>  
>  /*
> @@ -756,13 +762,13 @@ static inline void vma_start_read_locked_nested(struct vm_area_struct *vma, int
>  static inline void vma_start_read_locked(struct vm_area_struct *vma)
>  {
>  	mmap_assert_locked(vma->vm_mm);
> -	down_read(&vma->vm_lock->lock);
> +	down_read(&vma->vm_lock.lock);
>  }
>  
>  static inline void vma_end_read(struct vm_area_struct *vma)
>  {
>  	rcu_read_lock(); /* keeps vma alive till the end of up_read */
> -	up_read(&vma->vm_lock->lock);
> +	up_read(&vma->vm_lock.lock);
>  	rcu_read_unlock();
>  }
>  
> @@ -791,7 +797,7 @@ static inline void vma_start_write(struct vm_area_struct *vma)
>  	if (__is_vma_write_locked(vma, &mm_lock_seq))
>  		return;
>  
> -	down_write(&vma->vm_lock->lock);
> +	down_write(&vma->vm_lock.lock);
>  	/*
>  	 * We should use WRITE_ONCE() here because we can have concurrent reads
>  	 * from the early lockless pessimistic check in vma_start_read().
> @@ -799,7 +805,7 @@ static inline void vma_start_write(struct vm_area_struct *vma)
>  	 * we should use WRITE_ONCE() for cleanliness and to keep KCSAN happy.
>  	 */
>  	WRITE_ONCE(vma->vm_lock_seq, mm_lock_seq);
> -	up_write(&vma->vm_lock->lock);
> +	up_write(&vma->vm_lock.lock);
>  }
>  
>  static inline void vma_assert_write_locked(struct vm_area_struct *vma)
> @@ -811,7 +817,7 @@ static inline void vma_assert_write_locked(struct vm_area_struct *vma)
>  
>  static inline void vma_assert_locked(struct vm_area_struct *vma)
>  {
> -	if (!rwsem_is_locked(&vma->vm_lock->lock))
> +	if (!rwsem_is_locked(&vma->vm_lock.lock))
>  		vma_assert_write_locked(vma);
>  }
>  
> @@ -844,6 +850,7 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
>  
>  #else /* CONFIG_PER_VMA_LOCK */
>  
> +static inline void vma_lock_init(struct vm_area_struct *vma) {}
>  static inline bool vma_start_read(struct vm_area_struct *vma)
>  		{ return false; }
>  static inline void vma_end_read(struct vm_area_struct *vma) {}
> @@ -878,10 +885,6 @@ static inline void assert_fault_locked(struct vm_fault *vmf)
>  
>  extern const struct vm_operations_struct vma_dummy_vm_ops;
>  
> -/*
> - * WARNING: vma_init does not initialize vma->vm_lock.
> - * Use vm_area_alloc()/vm_area_free() if vma needs locking.
> - */
>  static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
>  {
>  	memset(vma, 0, sizeof(*vma));
> @@ -890,6 +893,7 @@ static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
>  	INIT_LIST_HEAD(&vma->anon_vma_chain);
>  	vma_mark_detached(vma, false);
>  	vma_numab_state_init(vma);
> +	vma_lock_init(vma);
>  }
>  
>  /* Use when VMA is not part of the VMA tree and needs no locking */
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 5f1b2dc788e2..6573d95f1d1e 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -730,8 +730,6 @@ struct vm_area_struct {
>  	 * slowpath.
>  	 */
>  	unsigned int vm_lock_seq;
> -	/* Unstable RCU readers are allowed to read this. */
> -	struct vma_lock *vm_lock;
>  #endif
>  
>  	/*
> @@ -784,6 +782,10 @@ struct vm_area_struct {
>  	struct vma_numab_state *numab_state;	/* NUMA Balancing state */
>  #endif
>  	struct vm_userfaultfd_ctx vm_userfaultfd_ctx;
> +#ifdef CONFIG_PER_VMA_LOCK
> +	/* Unstable RCU readers are allowed to read this. */
> +	struct vma_lock vm_lock ____cacheline_aligned_in_smp;
> +#endif
>  } __randomize_layout;
>  
>  #ifdef CONFIG_NUMA
> diff --git a/kernel/fork.c b/kernel/fork.c
> index ded49f18cd95..40a8e615499f 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -436,35 +436,6 @@ static struct kmem_cache *vm_area_cachep;
>  /* SLAB cache for mm_struct structures (tsk->mm) */
>  static struct kmem_cache *mm_cachep;
>  
> -#ifdef CONFIG_PER_VMA_LOCK
> -
> -/* SLAB cache for vm_area_struct.lock */
> -static struct kmem_cache *vma_lock_cachep;
> -
> -static bool vma_lock_alloc(struct vm_area_struct *vma)
> -{
> -	vma->vm_lock = kmem_cache_alloc(vma_lock_cachep, GFP_KERNEL);
> -	if (!vma->vm_lock)
> -		return false;
> -
> -	init_rwsem(&vma->vm_lock->lock);
> -	vma->vm_lock_seq = UINT_MAX;
> -
> -	return true;
> -}
> -
> -static inline void vma_lock_free(struct vm_area_struct *vma)
> -{
> -	kmem_cache_free(vma_lock_cachep, vma->vm_lock);
> -}
> -
> -#else /* CONFIG_PER_VMA_LOCK */
> -
> -static inline bool vma_lock_alloc(struct vm_area_struct *vma) { return true; }
> -static inline void vma_lock_free(struct vm_area_struct *vma) {}
> -
> -#endif /* CONFIG_PER_VMA_LOCK */
> -
>  struct vm_area_struct *vm_area_alloc(struct mm_struct *mm)
>  {
>  	struct vm_area_struct *vma;
> @@ -474,10 +445,6 @@ struct vm_area_struct *vm_area_alloc(struct mm_struct *mm)
>  		return NULL;
>  
>  	vma_init(vma, mm);
> -	if (!vma_lock_alloc(vma)) {
> -		kmem_cache_free(vm_area_cachep, vma);
> -		return NULL;
> -	}
>  
>  	return vma;
>  }
> @@ -496,10 +463,7 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
>  	 * will be reinitialized.
>  	 */
>  	data_race(memcpy(new, orig, sizeof(*new)));
> -	if (!vma_lock_alloc(new)) {
> -		kmem_cache_free(vm_area_cachep, new);
> -		return NULL;
> -	}
> +	vma_lock_init(new);
>  	INIT_LIST_HEAD(&new->anon_vma_chain);
>  	vma_numab_state_init(new);
>  	dup_anon_vma_name(orig, new);
> @@ -511,7 +475,6 @@ void __vm_area_free(struct vm_area_struct *vma)
>  {
>  	vma_numab_state_free(vma);
>  	free_anon_vma_name(vma);
> -	vma_lock_free(vma);
>  	kmem_cache_free(vm_area_cachep, vma);
>  }
>  
> @@ -522,7 +485,7 @@ static void vm_area_free_rcu_cb(struct rcu_head *head)
>  						  vm_rcu);
>  
>  	/* The vma should not be locked while being destroyed. */
> -	VM_BUG_ON_VMA(rwsem_is_locked(&vma->vm_lock->lock), vma);
> +	VM_BUG_ON_VMA(rwsem_is_locked(&vma->vm_lock.lock), vma);
>  	__vm_area_free(vma);
>  }
>  #endif
> @@ -3188,11 +3151,9 @@ void __init proc_caches_init(void)
>  			sizeof(struct fs_struct), 0,
>  			SLAB_HWCACHE_ALIGN|SLAB_PANIC|SLAB_ACCOUNT,
>  			NULL);
> -
> -	vm_area_cachep = KMEM_CACHE(vm_area_struct, SLAB_PANIC|SLAB_ACCOUNT);
> -#ifdef CONFIG_PER_VMA_LOCK
> -	vma_lock_cachep = KMEM_CACHE(vma_lock, SLAB_PANIC|SLAB_ACCOUNT);
> -#endif
> +	vm_area_cachep = KMEM_CACHE(vm_area_struct,
> +			SLAB_HWCACHE_ALIGN|SLAB_NO_MERGE|SLAB_PANIC|
> +			SLAB_ACCOUNT);
>  	mmap_init();
>  	nsproxy_cache_init();
>  }
> diff --git a/tools/testing/vma/vma_internal.h b/tools/testing/vma/vma_internal.h
> index ae635eecbfa8..d19ce6fcab83 100644
> --- a/tools/testing/vma/vma_internal.h
> +++ b/tools/testing/vma/vma_internal.h
> @@ -270,10 +270,10 @@ struct vm_area_struct {
>  	/*
>  	 * Can only be written (using WRITE_ONCE()) while holding both:
>  	 *  - mmap_lock (in write mode)
> -	 *  - vm_lock->lock (in write mode)
> +	 *  - vm_lock.lock (in write mode)
>  	 * Can be read reliably while holding one of:
>  	 *  - mmap_lock (in read or write mode)
> -	 *  - vm_lock->lock (in read or write mode)
> +	 *  - vm_lock.lock (in read or write mode)
>  	 * Can be read unreliably (using READ_ONCE()) for pessimistic bailout
>  	 * while holding nothing (except RCU to keep the VMA struct allocated).
>  	 *
> @@ -282,7 +282,7 @@ struct vm_area_struct {
>  	 * slowpath.
>  	 */
>  	unsigned int vm_lock_seq;
> -	struct vma_lock *vm_lock;
> +	struct vma_lock vm_lock;
>  #endif
>  
>  	/*
> @@ -459,17 +459,10 @@ static inline struct vm_area_struct *vma_next(struct vma_iterator *vmi)
>  	return mas_find(&vmi->mas, ULONG_MAX);
>  }
>  
> -static inline bool vma_lock_alloc(struct vm_area_struct *vma)
> +static inline void vma_lock_init(struct vm_area_struct *vma)
>  {
> -	vma->vm_lock = calloc(1, sizeof(struct vma_lock));
> -
> -	if (!vma->vm_lock)
> -		return false;
> -
> -	init_rwsem(&vma->vm_lock->lock);
> +	init_rwsem(&vma->vm_lock.lock);
>  	vma->vm_lock_seq = UINT_MAX;
> -
> -	return true;
>  }
>  
>  static inline void vma_assert_write_locked(struct vm_area_struct *);
> @@ -492,6 +485,7 @@ static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
>  	vma->vm_ops = &vma_dummy_vm_ops;
>  	INIT_LIST_HEAD(&vma->anon_vma_chain);
>  	vma_mark_detached(vma, false);
> +	vma_lock_init(vma);
>  }
>  
>  static inline struct vm_area_struct *vm_area_alloc(struct mm_struct *mm)
> @@ -502,10 +496,6 @@ static inline struct vm_area_struct *vm_area_alloc(struct mm_struct *mm)
>  		return NULL;
>  
>  	vma_init(vma, mm);
> -	if (!vma_lock_alloc(vma)) {
> -		free(vma);
> -		return NULL;
> -	}
>  
>  	return vma;
>  }
> @@ -518,10 +508,7 @@ static inline struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
>  		return NULL;
>  
>  	memcpy(new, orig, sizeof(*new));
> -	if (!vma_lock_alloc(new)) {
> -		free(new);
> -		return NULL;
> -	}
> +	vma_lock_init(new);
>  	INIT_LIST_HEAD(&new->anon_vma_chain);
>  
>  	return new;
> @@ -691,14 +678,8 @@ static inline void mpol_put(struct mempolicy *)
>  {
>  }
>  
> -static inline void vma_lock_free(struct vm_area_struct *vma)
> -{
> -	free(vma->vm_lock);
> -}
> -
>  static inline void __vm_area_free(struct vm_area_struct *vma)
>  {
> -	vma_lock_free(vma);
>  	free(vma);
>  }
>  
> -- 
> 2.47.1.613.gc27f4b7a9f-goog
> 

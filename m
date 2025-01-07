Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074B478F4B;
	Tue,  7 Jan 2025 16:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736268649; cv=fail; b=uIG0ve6lxTkCSdly4hZ+NKkJrbGA8sE4y6x7nUb2OpthIEEIvkA9Oc+ThfGN9I1sjlcJpfBbgTYa2vq6WlysFIwscWUi60z8prT+F1PnkwaTyCPz7RJhZhbTRtBBdqUVwytwBNHardxtRuIh4q+pCszTdcrMLKc5nfvFTZs3Huc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736268649; c=relaxed/simple;
	bh=8z3nROHtyeVPjmDbYCpFYIOklSFNHEP4/wWdvCYhlKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nm/Z9YNGR+OUSjIfjeyEGHRzJMj9hJVWwp0M5cXSZ/eV0IvcLNFb7Sdw31PHWHIf0KajXUcMsWmkDaqfRWQLkWyvNQQ3Stc5/7elYHuBnCTJRn/Mlamxj3LtF+Hv+0VlZ/K4oiS1Zm95ittH4tW+PbfrTh0xSMXQ8JZiIyL+/sQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fbz6GhyW; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=KHNU0lRt; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fbz6GhyW";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="KHNU0lRt"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507GBflE020930;
	Tue, 7 Jan 2025 16:50:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=PK1SErkZuWFvmAjiug
	9N1Cr0PZ8rvvJx6ec5d7Bg43M=; b=fbz6GhyWeX+kYol/vToR2l5MR4NziuLpKh
	kEnPkIs4BjSi3/j9zO35IJtS6wnRTawn7xshXcj6aCU/0sEylrEWPck0AT5p047N
	e9bl8KUE3aeQ5P5bEgab30L3PLdvgD15zmxWIyoddjgXYIpee4mKDzNi56+XDhtm
	1GA4V+2daF+KXPE7xUiT8UKZFrjsPLE+4h29OD548Nku9blxdpD49n83GzUba6zH
	uMaUnmy3gR9EBeltwPvW7HBqoGtH4AQzHmUOv5iMn5whKZML8t3Wk1yVHilcWeCY
	r9XYztlluHaWngchRoYxIwHHt5AyZvRlujoZ+kQ+snM93MGHUVQA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43xus2d6pc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 07 Jan 2025 16:50:06 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 507GEMIf022724;
	Tue, 7 Jan 2025 16:50:05 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2043.outbound.protection.outlook.com [104.47.70.43])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43xue8q7u9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 07 Jan 2025 16:50:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qr3jtrgPxzzn2YEly9saZKrS5Q3i08LKdAydKSEgye6f/ZIqQ5Y58sUPylwjd5/Ut4isNH5eQh6v2D30jZ4jezD1dnlFCAhdPMvCveHb0czqLgYBZtK3eb4V/X3I+HLqXCkJxo3gyVp/k5hUTR/t/q8Tjc3sTxjXcoEOTvjbf5AzjnUmaUnR9Osqy/AMGZvuiG4FDLmkBxmdkO5cL/hXHQdLZu1RFaSFIWUu2f/26sKXhBhWQXiOiz6tiRuj/NdpXUMDwKA1aR/l/tB3y2P019KAFWFUE/dyg6Q5nYKlGjZOXBf3LH2NbuaCKexQIa8M5zCLSXV2pbgjEowt7fHZFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PK1SErkZuWFvmAjiug9N1Cr0PZ8rvvJx6ec5d7Bg43M=;
 b=rnefVzzK47JsA8X1EJ8O9gi18pqNasVd6ELXKI9MCR2xagJ5Lg32gU5V8gqTkMpHQUpHhTNYFu2lgiLM1ym6ZIFboH5Rt0kXPm+QkYuGBNgai8qzYZ1PqMEi8jkyOu7fNl1sdyzNq9hRB0jTmapP5fbGjnJL+a7GB/6+3EIzxxBAEocP3S+KBHtrohTSJ18Jr135Rrv1LzLJb4rUVkB/0+rC5/V/Ge5ZlTJ8Jpyb1B46O7YcqH7Hzy1FvOdoSkE041nVATZ1wgKLKxxlUGiWmDsOdmhFf4SIrruLfFwjldbSVNvan3k+FifMpNK7hgisYP2MKMb8NgUzxNIOkienRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PK1SErkZuWFvmAjiug9N1Cr0PZ8rvvJx6ec5d7Bg43M=;
 b=KHNU0lRtaG1lhGqGy7eWrtt5E1QiX8x05GmTqUmN2vdvDG/0MW49GFHs50Sef1g3/gRqGQDHZ+TDernsSGGdTzF/25GhcK2BqtAy1OcA/DTtGF4a73bDInOcgL0ksGbOSScnaZAm+wwpcxtF43p44TQH6sQzvrMM1+HJRdumpGg=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by IA1PR10MB7113.namprd10.prod.outlook.com (2603:10b6:208:3fb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 16:49:58 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8314.015; Tue, 7 Jan 2025
 16:49:58 +0000
Date: Tue, 7 Jan 2025 11:49:53 -0500
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
Subject: Re: [PATCH v7 04/17] mm: modify vma_iter_store{_gfp} to indicate if
 it's storing a new vma
Message-ID: <luf6pnwp4gazsoquktjkf2nniscds5g5jeeviyd4pmfqdr5ge2@fv5qimjqf4w2>
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
 <20241226170710.1159679-5-surenb@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226170710.1159679-5-surenb@google.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YTBP288CA0017.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::30) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|IA1PR10MB7113:EE_
X-MS-Office365-Filtering-Correlation-Id: ed6a07ec-8ebd-4bad-11b6-08dd2f3b51eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bPnZopddIRJPMrrK1c0OtmkHDYS+7NuDJiNetgZQ2uIEgYpTFrDECcYrRSwj?=
 =?us-ascii?Q?YokffbV0pX7SAufoDC6Jq56AvHT9SzUO6G9Ln26gR897gsLst6y2KKvTiCXA?=
 =?us-ascii?Q?GvxG+OdJNRNz88aWO4s59dobr60/0tv20BfXIaEVrBn6F5LwNS6FCSeUiYwH?=
 =?us-ascii?Q?kaxDqBEOQbjbw+6ZSDCcgU1xYodUr5YATWPY4O0hBUsG7GObrlCeLS2bdXNz?=
 =?us-ascii?Q?SujTGE1wMiLy3euuwHSGsjejN31VGX/ynHjAflHbo9DSdB8tiV3v1MwHAkuI?=
 =?us-ascii?Q?MV14XCnFzrqnK4uc0QY4ZsyhOS+AqZbf/Zie0p0WVz1tZVbVdRmLDNtrRn0Q?=
 =?us-ascii?Q?0qIJ4wETE0HHVEPy0tWgavM8NYy4dvFmfIScLnugPLRp/WB2C7XJ55P6HUUp?=
 =?us-ascii?Q?Xk5pK+25ITiBnpzREIDmhNJIkXGzd1Id0eTIQZrBOX7vq7FJL0OvmNuCE1A0?=
 =?us-ascii?Q?yQv9TX/T16F2WNvBZf1KuJ/+u8P7i7WHD/3pvRZB9EurjY0vTGVzSS0PVgNJ?=
 =?us-ascii?Q?8FNtUPayzMM+Uhyw9yZtHguCH1yi/ZLHFvxJQPHmtbT6ukz4CZvrxcq9VUcb?=
 =?us-ascii?Q?V69GqKzAUFuACG74odo+usyJjhquPiWryymvw1/n2Neqh1zAJM5YsZsNnt7e?=
 =?us-ascii?Q?uq02N+SgwiPQG3yJ/MB+WfjVcqdhV++fBEjUeD9evFVcS3Bn/Sl4kA6ZLvWL?=
 =?us-ascii?Q?tDf5esvfP7b2bp8FUfI/0scLWNBw3GmKqMx5Hr+TxGkztedt4y/izVoOAvaG?=
 =?us-ascii?Q?tLj1/94EB2lKP157xc3QjPKqDBbi2whIhHkJKgBufW1lwiTjibf48gxTsuzT?=
 =?us-ascii?Q?+4716u8vHSFoYLX+PWGoyZuA8Sf+av7LrID4AYykPkkywE4GrCNKo/IaqGKW?=
 =?us-ascii?Q?nbvmxNb6RsSK12ZCjBAZ8+QayHl1dz68pXl2s+I+AzDo6m6MI7PKFknEaq9K?=
 =?us-ascii?Q?rc8UA//ywzTa6mwIjr90zXrTTslbHMZ89obbYcHZAR8lpAiduoWEtmeLK5Qg?=
 =?us-ascii?Q?jDMpGrdVyskmkwGsw8RlN7NAb0rCeKR108odctpJ4JDLqBmJrnDTr/EwBVZu?=
 =?us-ascii?Q?hoOhiVHRC+JE9hPvxL27vyFLutKqvnkDoF0lNWCOi6lCE5OtVbYjc2QuErKf?=
 =?us-ascii?Q?73nGO9hDQU34ncPtDeAui0GNbOK1yGisJqQF8mycSurYtpF7l+ENMT8l4eKj?=
 =?us-ascii?Q?FEQ52SfI2cIOnQEAwq6kMCtg85P1i8JKf9Wax1THSukwbDmnPb8/w6HIJwDi?=
 =?us-ascii?Q?TpeMkdwM2QS8+F70TAbwCg8qjf+IzBotMTLuaVNXTxYlM/Q7kw5rtPn2AS18?=
 =?us-ascii?Q?hhOzftdKYaa2WKIERw3sM05TsKLilhWE42K9ZqICzA9WBJ/KnfnQy80m7/Bi?=
 =?us-ascii?Q?WcrIyYKyS/rAdSWmEf2dBMf3M8oP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FYKJvXnNhGJRUBhU+JcGqNNyyzWs9q3Ih42VS6KN5k5ArAE8TWfqNtdTHrqr?=
 =?us-ascii?Q?qUxywOzKDMweXbmrTzitmetnh9gm4neAh2JeLVBxSWysLEpIRLVmJDjiDjYX?=
 =?us-ascii?Q?wQz3kMcGWVfiMYsFpI/WiA6maLdEp2GFtXHLQErFaf2z2OQtKU2UzPbD5OM9?=
 =?us-ascii?Q?fDTPOgLSF1JYzkeydjxNWkW/x34HeIZ9zf6zT7xY5FXRU/L+/AV6X2ar35gP?=
 =?us-ascii?Q?sIkkhWlZVdu8xi4v2mh21cW4ZC8FLPH2ipaqMb6QUBMs7a7S0I/VgYtsaG2j?=
 =?us-ascii?Q?mhYrKyUEPRu68q0Uu0OgpcH4LMEPRmlc1lOZYotG9nZNfRIvkRcbrrVILK0C?=
 =?us-ascii?Q?3Lx6HF9swWwUiwjJN0Hj7c1j1tDB0IIPHUCucHX0QTShVZ87vKirLRdw83gj?=
 =?us-ascii?Q?AvDygLyL6glRESTEtU5LYQlvPyjhAbyRLEIvh1J/H32go2EaJhs40RMryo4K?=
 =?us-ascii?Q?QEXdqi3qvRDy260FsThCVGBa8OMm5DaqPmvyP4ZePlCJxIIEAtzyXEsHJ4Tj?=
 =?us-ascii?Q?9pxAZB0dzMaCQ9RSf4Iy7dOi8ZOqiY2xe8od+KLKG/PT/zZ+0y1Q+pn94+Ii?=
 =?us-ascii?Q?s3i+6qvD396T4fMiJJHgtvSj/Gs7WOSOYfQwWgQ7A/krMUP1CKRIKXtYlmhK?=
 =?us-ascii?Q?cmV76fpyHg6SUKu44Ww4Jah5PcgbaBOx2fqChxIffMoI8m0N8JFnJ5zJzgJO?=
 =?us-ascii?Q?+L0/xqjjjwSC3pOGcByQmV2zhkPW8xmgSUxvBvilJl7w85nxDQAPayoeZcpV?=
 =?us-ascii?Q?71UeVDF1fRF9lecjaFW5jhWRyIUYMigS9X2LUZFYn2umB77c7Spvzv9/tRo+?=
 =?us-ascii?Q?21vSUTCFyw/vfmPk5OxJu7PjKm1Mqv1NpiWc+Jc/rd6nSyUykq4CLisr8XrE?=
 =?us-ascii?Q?IQXxHO0BEQHGPf7MlE9fmFp8ND6bEGyygxWkGmsg5ssKH4PwhQT1bL3W1uxb?=
 =?us-ascii?Q?SJI3Axh591vMXBYn5IkVjemvOCSZbjLa2/3uZ6sUKqCGpraH6NDIxmZO+85t?=
 =?us-ascii?Q?bI8jXizS2PR+l8AhCcg4Gr+WfgKn+vunH2zC4bDhb80Nq2AySqmzDYD5zgcD?=
 =?us-ascii?Q?5hmsGgh3Tvcmj+WvS3RFbu+hocubRyGLLkWACBzIKcjU+q+m/nDj78+LzqB9?=
 =?us-ascii?Q?RlMRYnAmbzVnkGMjqAndvKUm9Xr16LlOIY05FY3dyxX0TU99qohpUBMEY0J5?=
 =?us-ascii?Q?C5rgllqb78RB2AKaA7re4+h3USvkq1YrblK3sMNsO52HQ2uW8fVNyzf5bZ8I?=
 =?us-ascii?Q?0u4OegUYVWW1OsYJULw+vQEVMedwmUNjyr+A14pOov/7AxXOvNTstuCgQeK2?=
 =?us-ascii?Q?F37wZ4E7dtlxSFS2I2TcnFO7eiAP44alrTuPgXWZr1ww4Zrtahj4jYw/Ka+l?=
 =?us-ascii?Q?ZCAuK70jB2iCE6xA+NjFSZLJAJ2S19fc8GQ8/msBNQJ7sAfbqwvN2Atksa32?=
 =?us-ascii?Q?4tOY7z+cpc5cn4th+QLZCXVLWqnl+UNRKSleXPAUH3wP1TWT7GMSRpMsTkX4?=
 =?us-ascii?Q?WSzF475g7X/QePbjMdkWXx+dKvge2gCzABb2M6eLtMdyWr/OQzbdB51cbuTV?=
 =?us-ascii?Q?7xyYJ2RPSspN0h1jd5qy0VgnXml50xn+JjMNCfOh?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7bj4Jcg3Rkt5sQHKtcoXWGyQitagS3XXqi9lU1dBfNl0L7GkTj9ld7XM03s/tWIA+gx02UTZxj4GupEmGYXSMjgn13FvN1UVHLOD+3qp0PBOq9xfHPo4DeqwH9J4T5CMAuC2j/QYZO0qjjW6x7ItpDCDANbWCnp5EIQ0rdcsXiK1ALSUhGwohYT4MKmdQXZgHdsJPRTvO6Qve9i1mI0kV6VfadkqW80lexT3pIcUxUhoNO7fFRTHZXQ+W3SW8H/uP8RqwBVdoiDzMLG991RjCxaKu/SAVAVQXpm62h1LhNBjkpRXHIC6AJ4WkbzSBlz6HcMJEaicMMB/yB3LzBHORuMnrPb+hqTrr1C46SglZJQ0soyOiXDrcqTiHMMFJAbVpa3Vjx/7XGG18nta0LzeC2doNcDIKmTZQ+hksbcohymuZwfHdtu6CAsnsM0fbZY7lP/K8IXvwIALV8XvTVnBGtAqf7rHs62EI3OTo35E9Vi3MgKb9P8jZNQsuZ3UNOnnHpEXCKR/ix3K4XBxgdeIbQkT/pEU8LkrkkbZsbSL+G+rwx8jgM3j7ym1UYyRn3lHPg8cXOLrzaJRb/vXd/eq1UooxH1RttY7UMOXhMl0xNU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed6a07ec-8ebd-4bad-11b6-08dd2f3b51eb
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 16:49:58.2496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ZWvUeJ46cKUhmB/t1j0M8UbUMlHRGZakYaqhYVJtvV5CG3CReF/6FVuJMp1TNhCvsHVx+wzEiFzdnwwP6XBpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7113
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-07_04,2025-01-06_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501070140
X-Proofpoint-ORIG-GUID: pf5jQ38STAB3k314UNdSK7JaMzRcsQg2
X-Proofpoint-GUID: pf5jQ38STAB3k314UNdSK7JaMzRcsQg2

* Suren Baghdasaryan <surenb@google.com> [241226 12:07]:
> vma_iter_store() functions can be used both when adding a new vma and
> when updating an existing one. However for existing ones we do not need
> to mark them attached as they are already marked that way. Add a parameter
> to distinguish the usage and skip vma_mark_attached() when not needed.

I really don't like boolean flags - especially to such a small function.

The passing of flags complicates things and is not self documenting. Can
we make a new vma_iter_store_detach() that just calls vma_iter_store()
then does the detach?

> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
>  include/linux/mm.h | 12 ++++++++++++
>  mm/nommu.c         |  4 ++--
>  mm/vma.c           | 16 ++++++++--------
>  mm/vma.h           | 13 +++++++++----
>  4 files changed, 31 insertions(+), 14 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 081178b0eec4..c50edfedd99d 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -821,6 +821,16 @@ static inline void vma_assert_locked(struct vm_area_struct *vma)
>  		vma_assert_write_locked(vma);
>  }
>  
> +static inline void vma_assert_attached(struct vm_area_struct *vma)
> +{
> +	VM_BUG_ON_VMA(vma->detached, vma);
> +}
> +
> +static inline void vma_assert_detached(struct vm_area_struct *vma)
> +{
> +	VM_BUG_ON_VMA(!vma->detached, vma);
> +}
> +
>  static inline void vma_mark_attached(struct vm_area_struct *vma)
>  {
>  	vma->detached = false;
> @@ -866,6 +876,8 @@ static inline void vma_end_read(struct vm_area_struct *vma) {}
>  static inline void vma_start_write(struct vm_area_struct *vma) {}
>  static inline void vma_assert_write_locked(struct vm_area_struct *vma)
>  		{ mmap_assert_write_locked(vma->vm_mm); }
> +static inline void vma_assert_attached(struct vm_area_struct *vma) {}
> +static inline void vma_assert_detached(struct vm_area_struct *vma) {}
>  static inline void vma_mark_attached(struct vm_area_struct *vma) {}
>  static inline void vma_mark_detached(struct vm_area_struct *vma) {}
>  
> diff --git a/mm/nommu.c b/mm/nommu.c
> index 9cb6e99215e2..72c8c505836c 100644
> --- a/mm/nommu.c
> +++ b/mm/nommu.c
> @@ -1191,7 +1191,7 @@ unsigned long do_mmap(struct file *file,
>  	setup_vma_to_mm(vma, current->mm);
>  	current->mm->map_count++;
>  	/* add the VMA to the tree */
> -	vma_iter_store(&vmi, vma);
> +	vma_iter_store(&vmi, vma, true);
>  
>  	/* we flush the region from the icache only when the first executable
>  	 * mapping of it is made  */
> @@ -1356,7 +1356,7 @@ static int split_vma(struct vma_iterator *vmi, struct vm_area_struct *vma,
>  
>  	setup_vma_to_mm(vma, mm);
>  	setup_vma_to_mm(new, mm);
> -	vma_iter_store(vmi, new);
> +	vma_iter_store(vmi, new, true);
>  	mm->map_count++;
>  	return 0;
>  
> diff --git a/mm/vma.c b/mm/vma.c
> index 476146c25283..ce113dd8c471 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -306,7 +306,7 @@ static void vma_complete(struct vma_prepare *vp, struct vma_iterator *vmi,
>  		 * us to insert it before dropping the locks
>  		 * (it may either follow vma or precede it).
>  		 */
> -		vma_iter_store(vmi, vp->insert);
> +		vma_iter_store(vmi, vp->insert, true);
>  		mm->map_count++;
>  	}
>  
> @@ -660,14 +660,14 @@ static int commit_merge(struct vma_merge_struct *vmg,
>  	vma_set_range(vmg->vma, vmg->start, vmg->end, vmg->pgoff);
>  
>  	if (expanded)
> -		vma_iter_store(vmg->vmi, vmg->vma);
> +		vma_iter_store(vmg->vmi, vmg->vma, false);
>  
>  	if (adj_start) {
>  		adjust->vm_start += adj_start;
>  		adjust->vm_pgoff += PHYS_PFN(adj_start);
>  		if (adj_start < 0) {
>  			WARN_ON(expanded);
> -			vma_iter_store(vmg->vmi, adjust);
> +			vma_iter_store(vmg->vmi, adjust, false);
>  		}
>  	}
>  
> @@ -1689,7 +1689,7 @@ int vma_link(struct mm_struct *mm, struct vm_area_struct *vma)
>  		return -ENOMEM;
>  
>  	vma_start_write(vma);
> -	vma_iter_store(&vmi, vma);
> +	vma_iter_store(&vmi, vma, true);
>  	vma_link_file(vma);
>  	mm->map_count++;
>  	validate_mm(mm);
> @@ -2368,7 +2368,7 @@ static int __mmap_new_vma(struct mmap_state *map, struct vm_area_struct **vmap)
>  
>  	/* Lock the VMA since it is modified after insertion into VMA tree */
>  	vma_start_write(vma);
> -	vma_iter_store(vmi, vma);
> +	vma_iter_store(vmi, vma, true);
>  	map->mm->map_count++;
>  	vma_link_file(vma);
>  
> @@ -2542,7 +2542,7 @@ int do_brk_flags(struct vma_iterator *vmi, struct vm_area_struct *vma,
>  	vm_flags_init(vma, flags);
>  	vma->vm_page_prot = vm_get_page_prot(flags);
>  	vma_start_write(vma);
> -	if (vma_iter_store_gfp(vmi, vma, GFP_KERNEL))
> +	if (vma_iter_store_gfp(vmi, vma, GFP_KERNEL, true))
>  		goto mas_store_fail;
>  
>  	mm->map_count++;
> @@ -2785,7 +2785,7 @@ int expand_upwards(struct vm_area_struct *vma, unsigned long address)
>  				anon_vma_interval_tree_pre_update_vma(vma);
>  				vma->vm_end = address;
>  				/* Overwrite old entry in mtree. */
> -				vma_iter_store(&vmi, vma);
> +				vma_iter_store(&vmi, vma, false);
>  				anon_vma_interval_tree_post_update_vma(vma);
>  
>  				perf_event_mmap(vma);
> @@ -2865,7 +2865,7 @@ int expand_downwards(struct vm_area_struct *vma, unsigned long address)
>  				vma->vm_start = address;
>  				vma->vm_pgoff -= grow;
>  				/* Overwrite old entry in mtree. */
> -				vma_iter_store(&vmi, vma);
> +				vma_iter_store(&vmi, vma, false);
>  				anon_vma_interval_tree_post_update_vma(vma);
>  
>  				perf_event_mmap(vma);
> diff --git a/mm/vma.h b/mm/vma.h
> index 24636a2b0acf..18c9e49b1eae 100644
> --- a/mm/vma.h
> +++ b/mm/vma.h
> @@ -145,7 +145,7 @@ __must_check int vma_shrink(struct vma_iterator *vmi,
>  		unsigned long start, unsigned long end, pgoff_t pgoff);
>  
>  static inline int vma_iter_store_gfp(struct vma_iterator *vmi,
> -			struct vm_area_struct *vma, gfp_t gfp)
> +			struct vm_area_struct *vma, gfp_t gfp, bool new_vma)
>  
>  {
>  	if (vmi->mas.status != ma_start &&
> @@ -157,7 +157,10 @@ static inline int vma_iter_store_gfp(struct vma_iterator *vmi,
>  	if (unlikely(mas_is_err(&vmi->mas)))
>  		return -ENOMEM;
>  
> -	vma_mark_attached(vma);
> +	if (new_vma)
> +		vma_mark_attached(vma);
> +	vma_assert_attached(vma);
> +
>  	return 0;
>  }
>  
> @@ -366,7 +369,7 @@ static inline struct vm_area_struct *vma_iter_load(struct vma_iterator *vmi)
>  
>  /* Store a VMA with preallocated memory */
>  static inline void vma_iter_store(struct vma_iterator *vmi,
> -				  struct vm_area_struct *vma)
> +				  struct vm_area_struct *vma, bool new_vma)
>  {
>  
>  #if defined(CONFIG_DEBUG_VM_MAPLE_TREE)
> @@ -390,7 +393,9 @@ static inline void vma_iter_store(struct vma_iterator *vmi,
>  
>  	__mas_set_range(&vmi->mas, vma->vm_start, vma->vm_end - 1);
>  	mas_store_prealloc(&vmi->mas, vma);
> -	vma_mark_attached(vma);
> +	if (new_vma)
> +		vma_mark_attached(vma);
> +	vma_assert_attached(vma);
>  }
>  
>  static inline unsigned long vma_iter_addr(struct vma_iterator *vmi)
> -- 
> 2.47.1.613.gc27f4b7a9f-goog
> 

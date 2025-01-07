Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930B21F37BC;
	Tue,  7 Jan 2025 18:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736275526; cv=fail; b=Q9S0LIAI52kwLShA05BxMMt975QGRXWdHHlTKjoNQLknJ5CY9qHMN7+FjeWZzaBECa3lrCC818448Cm4hr8/7or6cZNsHso0eiJBgI8ASSRE/hkdGhhlnPzjB2HvgEiuv6JszFpni0At9DLhGhG0uogg4hhrrJb4exvspXheS2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736275526; c=relaxed/simple;
	bh=X2TSZPwR3MwoFG87JmJKXsVEKNewalWUIHAn3jIdpe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Y3ReKBCLFnM1xFtX6fyjCew6aVXBf75ckpBNjA9bt4Ie/9RNv5ZZMnAYuxRHWTJC6aImpujwK32S5TICKQoHF4+bYazu6ZmYdEeHQyp7sEgF4uHdKANdZjw751AqZJPcQqLqXZoLLdnkYVGjX2y3R9IwiqVkqRvDawGe+r9YESw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KWKY/yVr; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hAikRejv; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KWKY/yVr";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hAikRejv"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507HMpWY008138;
	Tue, 7 Jan 2025 18:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=rPGcZzdy2nq8g6bXOs
	w9sQqleACIBU4qNVCKxiUWyQQ=; b=KWKY/yVrtPmuBxrXx9UZkILHsclIhozhaA
	LJsd9QUbdnUgNFZVmQAw1WHL99Wq2H848mvSWqmCNhz7nzNR8p7CVPUj8shZADC5
	oGz6whrOK0FlCk42HJsIrACz7hm68TwOa3cQoM2q1M6LhF15KbZ+wRWahS34ruDw
	3aPbYETF61hPlPv7ATtlcPsk7+ZDB8MGoKB84alrLeGqQVVSe/Q8Ntm8rgkD5BWe
	7pclcU+lO9YUAnnKQSmjVjBgGhETQiO1Z5QwpoSy7acMzRvHt0FWchYA9dSIKa/S
	eGxaS41S3fvTA8iQlUrhpmAfALrcL5Fodp3h+ZkIOS+SzxsMvI1Q==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43xus2de6b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 07 Jan 2025 18:44:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 507HKiOX004824;
	Tue, 7 Jan 2025 18:44:39 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43xue8v1u4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 07 Jan 2025 18:44:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lcALeK9hmrHjDbYo+jT74Hy3A461MwqBN64bweY0SPew00CuAxLgT9cLVhjYjDYqiL+QNQChRUigKlnin3+Q30nx7sCckLppt49f9qiVa29s0cFAtX2tjaiNLp1Z+k1ks8+oFOkQHeKxQ6T9BwaachVxyy/NaentubpIZrqGcIU+G3uZpKoXX0TDvnBE5szhFQa4xrYhqh0r5vXtoiuaypOIlEHGnvfUq2y8NWS/qitJPBnPvxczneFvstwWunv+agKC2e2hMekxd86wkTSaSQgR173tArxoiRkbdqH/1/gHA5t+CGpsnFrhJWgFDx5p8TQjmrhJDrmn9hNESLPxnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPGcZzdy2nq8g6bXOsw9sQqleACIBU4qNVCKxiUWyQQ=;
 b=G2bhH+hKB0k726JRt2g818HK7zZehbS2GW79WkDINY30euLyw7Zed5Rxf6n5NX7ZERNzzFyeTq9/WViBH53at3TGQY0dty5fUwtWM6umCjjlFa24ArKM6ZIkzBwdhqAuhvg2OxlBDcHe58KAPPzT+tyYz50CONEDW/IvwDuM5bCrsOWQw44x+DXnnjpvXrYdvLXsa+b4qML2E6M67E4Y+GSQtuqR96j34JJtYB/EfRCvNfnZ+n6evZtoGFjOjYR3WdciOHet3RhHSbp7149WxigFng7Xy0QhhQa0ODtAou6vJiqwJ0my3hR+yDYyrDugwOF8MH2vvYqB0xRYlCwOtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPGcZzdy2nq8g6bXOsw9sQqleACIBU4qNVCKxiUWyQQ=;
 b=hAikRejvISiNd15zPk/B1BCXbI/kHkyPu0ZE42NpVC669blBsB1PLwooKRQZJIhVcabOR0Ct/COO16hKWd4so+ACl3pEaS49Fxb5VSOaJxt60hamB6P48BFBptIhKqg/dfR/BB+VOWIo2uB7BZl08TILiFzgGOnhPnZ4IyS4rH0=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by BN0PR10MB4949.namprd10.prod.outlook.com (2603:10b6:408:12b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 18:44:32 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8314.015; Tue, 7 Jan 2025
 18:44:32 +0000
Date: Tue, 7 Jan 2025 13:44:27 -0500
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
Subject: Re: [PATCH v7 12/17] mm: replace vm_lock and detached flag with a
 reference count
Message-ID: <dphnaz6h5kt4aukx5efcu2r3uxxhtyp2iods3275hrraldmny7@xghcoifpwd3l>
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
 <20241226170710.1159679-13-surenb@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226170710.1159679-13-surenb@google.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0054.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:111::11) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|BN0PR10MB4949:EE_
X-MS-Office365-Filtering-Correlation-Id: 68d3e85d-d9a7-4ca2-aa98-08dd2f4b52f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aOVv+uHjDYozb/P7yGMBURl5SiFP1Jr4p6ssoWGbRjKGJSpgTsGvMXnu3D1j?=
 =?us-ascii?Q?h43IkMnjt8kHBZxOIDsUcEdFSA3Ikw05zJLAZa56iI0vcLDnwOUsy0cudLrY?=
 =?us-ascii?Q?5bwMoTTq+OcdyEsFogzbgXQ7Hr47PAf4nq23V4ioVCM/ccA5AmYsNj1p/Gzw?=
 =?us-ascii?Q?1OgNe/3gyLZvO67IQLCGoKZRZkq14Md2lLmMTX9thh0OiXwydvgc+LsYlcS9?=
 =?us-ascii?Q?ZBTLWtqOVru4APJ9knj0dt8tLKxXl7mm56kJOzsN5h9nmZg6rZ67rCGzLzw4?=
 =?us-ascii?Q?zY2a2X5YmxL/Bz3pmXfhqMq4TpoR5JpvgVRFpK6ho9m8/WDBKpjFDKWsgHjF?=
 =?us-ascii?Q?2c/ZcRznhgAyotI+61/0FXelh8hPAbUFI8jHS2qcIGArFhB7/DNwalDTHgRf?=
 =?us-ascii?Q?zGPxsW+sLuOWD9Jvq6+/wTLhWAyMk2qgwb5SfaUwu4k8RZqEeMzDMGe3nX1L?=
 =?us-ascii?Q?9pfJR44bLg0h+L0jtRnBaqTClM8LXXA9xKtQqinqKikRd/hxGtm6p6OBHBOr?=
 =?us-ascii?Q?+YN4aRF19OH1vLk7zM+7K/hjAioZHodiHJhEmKrUegotws/iStLge+dgkuSr?=
 =?us-ascii?Q?3RDzYB4aapIdlnbtjQ/GRS4q0qJAIDjkCsdaMPS3gZlN+zN0Fz+gqIBejZjY?=
 =?us-ascii?Q?31RYMSgltOQYEatFb/V5UEtUYxRCnhavAZWTPSJdyi1v0Nb8p3evpbzGOAKp?=
 =?us-ascii?Q?OhdFoMnwYO8dKDCxSkPAxV2bXzWbLiERhCG6ahxr945gm/WUmj9Jh/JsDCsr?=
 =?us-ascii?Q?LFojmFYIp082N/eOO7IY66WavfWAOtRONvFqokOg8vK0rpa/rPL7OLMfBRlw?=
 =?us-ascii?Q?dctM7oeKphHrQMbqdONrTU8RN71ouCem0wPkk1YeJIXNAvddkpcm5QKaC1c0?=
 =?us-ascii?Q?jC8MKKeWDtlGafgcvSa6gd7J5096WcnBieUxln42pycRtJXc5wd+EGAPbY3N?=
 =?us-ascii?Q?qUVXlcGIPemZenjfaFyekRt5xD66SXh9eoyx+02iapxikPwHc8UnmGCY/wjK?=
 =?us-ascii?Q?vB3dI2/UKNPre1jyM/gIxpC0ScPhVytIOsogi//9/gFa1fAFFI0YC1L4eZvw?=
 =?us-ascii?Q?akmyK4WD+ts4NPya8jiGCoWoecHILfuk0gQv6swzbtSMbNkFqHuUfFETFadO?=
 =?us-ascii?Q?aunyrPKD+Ft8FdOvjSv9x5GFtJOqDcm+gq/2orCJ9Dciby0CNcbsn9MDQKr/?=
 =?us-ascii?Q?Bq9JcUKb2uian7n4W2bOIJv2wNTpnLMS6tCq6J0FWMF6cu00YucPI4D8Phhi?=
 =?us-ascii?Q?WyF4j/jvabi7H0A94xUCTkNUctvefS0OQatYZ2UwB/Q4On3wNzD8L129rD81?=
 =?us-ascii?Q?iZelK2D7TgIM6S8pq+5hMBslwHK0oVAHZDW/jnrbQHoSz5fr2OzlAAzQ17Nn?=
 =?us-ascii?Q?G/rH2j1JS16nV20yz8IUer+6bUHD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JlBTzW/1opkPG4AeM2NuLgLsd6WzkuX9q5TO1s6YzOqHQXWcQ8nKtDHdKDF6?=
 =?us-ascii?Q?GI4pnpXJhO6p7bLN+uWLdDQP42DcOXc9SXYrrPKCEnn1XuILIYCScjl+OrNf?=
 =?us-ascii?Q?bi0GHyxJIgF7awfsTUQNsdCo2AZbjt9mCHjsagmNvbLdlwJn8etZnZJea2oL?=
 =?us-ascii?Q?kOzurYrIHuNwTJV8YPXGr/JbJ6/vG+fZeY924sLIyZcIJ2v3RJza2sNXMIY5?=
 =?us-ascii?Q?8Q7V7+o0sBoL9G7k2wRTz5tq6WzrXSauKtPP2FLk/Twut/wyYI3QlBMOj3Og?=
 =?us-ascii?Q?p8uxcxTrm3lPHuS6VkZSfypZPAUdqQ02TcWPqfXJsAvz6NqlnlAI/3dNY9Tz?=
 =?us-ascii?Q?1HANO7gvZ33IlVmhjaQD9JauPIOKWTyeFkyBecc++9jboEf8tZeeKO0fjm/Q?=
 =?us-ascii?Q?dwzxKDYK9R3MU4wlFMPT+mTNaUrIWBs8W7J+XhNBKkOWkao4hTJxqqgD+0Mz?=
 =?us-ascii?Q?sIrrDt5zHZYH7c6yhFVlRH3usYenX/wI3VDpiBp2uhGiCE8gZXwTosVJWypL?=
 =?us-ascii?Q?YQKHuSDs1LvPgtY1QkVlFImEHNX9r35CZmJH8sfeqYjuA+x0lkyt2rGR8U08?=
 =?us-ascii?Q?D953RqhAVcj+kOLmn88XztPCq9ZOzLkAnhnHLKoUSk03f7uOFmY0582382qT?=
 =?us-ascii?Q?jbicHyWEPUXD9QxEfWKEB3oCiR87JTObX+jVBHNOC0SQxfdVHVjbAcw54B80?=
 =?us-ascii?Q?2RyZ3y8xyDnq+DpARVifU3vU/OhyB798wqPfOa8/Zxi7BdbP8qboi0jWcTBs?=
 =?us-ascii?Q?D5ZQCgmSG9oYldY7bOU0n64EqhhlB5JMWeaSln8p5eLIa70ygVUXtxQbbPNd?=
 =?us-ascii?Q?au5WS4XpvN2PUk4KBWmXPU3psv5sGQ6LEJKMpbisB6e3LcAT045digu5buPm?=
 =?us-ascii?Q?VvqamQOXFNRrC7PIgodYpW4BeCosER6OmZkHm+sGKq9iRdYJiOi/sGy+9Gj8?=
 =?us-ascii?Q?X6sfvqndBVPMJ+WL6aFdxFrg1RcFBUJZm+Or06UTtGIGid4il7UgO6fsCHzn?=
 =?us-ascii?Q?8ipMZ7SCWGH2PuBsqftf9F/CRIJ3D7NeLQdG01Fe5fnB+U9JiY9U39x4wKte?=
 =?us-ascii?Q?26QaKccfu0KoX1tC8XzwvHwP8hb+aMkUWhrQCIdatqLGhQkZyFuEoXdqNyCN?=
 =?us-ascii?Q?ZVgN4kepvU7abVtOY2Ys0YC7Agd2f7Wn8QiiEjjUShWdXVk6OFA+uNUbBpVG?=
 =?us-ascii?Q?HmzWrL17u150o5FIVHHFyInLoa7pB0tJonvNvt5A8THQD+gtv0jRW0DVOgmi?=
 =?us-ascii?Q?7hGWqlP0jYPyUudUdR9afabbZi/B3HdKFygFymFVFMQI+BGV+d4GmKfvPTyb?=
 =?us-ascii?Q?Y99UQHqX6rM2ZfSDHm4aDfA70PiFjxzQYTupQLNAsbg9eukT28Nky1vVU7dB?=
 =?us-ascii?Q?mBXZV2zKvlNHGJtR9Tfz5WFZmIwSTGi3ash5f5oie8BgA01Qmatb8p8Ovien?=
 =?us-ascii?Q?k7XmcyfiVZNFyt1R2sBkkZdO+b2JenlSzLDY8FS9Pds5mZBCsY2WaHdBt03C?=
 =?us-ascii?Q?Ki19yPuCAejsiU0UYZiqjI+TRrCKeDyEkIKxeYrQ3LXF8JbQyRSzuIZccCCw?=
 =?us-ascii?Q?QpX0fOlLCxnJbJV9pAGHuH0yBn1xxFdq5WURmeIb?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dWOl/Uyvc0APuN8Ox9IPIPEnZBvYScMP8MPkMxfU6+8ySIuZ1SrP20T8V0b9kbSUyjY/a7FsZi1VS0Yq80Xa1XD6DaNBZrZJuLWN7t2U6aSkZi8qJouUrTALXK7jDUUx+mD4jshp2o7OxyACyj308rV125Fiza4UVMlB8WfcEXxkEPPL9yXZtM5tGa5Dqivh0HtHciy8lmOcuInjgt/oxn76cQxgJ0j7Vsa2M1JG5dHruhpnjIqiH8oqsWOd6e3YQKcH1neLq2tHKyxdsMgjNN9PMS3whnt9Ij94dGKlstsy1lOze8zkVx/26MjiokTRziPaixfwHv9/jr9qvWFZSit630QVQo0Fu8aI5B6XahVhr5W84zqh+2bASobwroIz7NSO/f/prsMkfx+hPT2nlQ2/WieGfUujkiZ+QxDef0P+9o/E0yfHD3MbGAX4e20c79OLaGR7PV/TktvRvCWa2rnwkfHeC6Faa215gZ/DPqDXSe5FvgfrxqWlRVBZe49PGfswjSmk2nX2zVJ8ZdPs4PiJnW1o/nHb7wcuBXjLENwotRWgiFo6ytteeOn5OqV4cuZ0xY6W6f9QjLZBz9F5pgnvlilM4oC7sNL/GIU58ZQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68d3e85d-d9a7-4ca2-aa98-08dd2f4b52f5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 18:44:31.9915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j4cOsfnano7gUOrTbzZXkJ51sgzgknvYx9KHHtDSu/iB8pGkqrVVKWPUZzKyNd9nxoF9K5i+5LfNYg7KcYXLLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4949
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-07_05,2025-01-06_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501070154
X-Proofpoint-ORIG-GUID: PQ7lf7cNaOjpIfo6jWYok4I2qwqtDoUU
X-Proofpoint-GUID: PQ7lf7cNaOjpIfo6jWYok4I2qwqtDoUU

* Suren Baghdasaryan <surenb@google.com> [241226 12:07]:
> rw_semaphore is a sizable structure of 40 bytes and consumes
> considerable space for each vm_area_struct. However vma_lock has
> two important specifics which can be used to replace rw_semaphore
> with a simpler structure:
> 1. Readers never wait. They try to take the vma_lock and fall back to
> mmap_lock if that fails.
> 2. Only one writer at a time will ever try to write-lock a vma_lock
> because writers first take mmap_lock in write mode.
> Because of these requirements, full rw_semaphore functionality is not
> needed and we can replace rw_semaphore and the vma->detached flag with
> a refcount (vm_refcnt).
> When vma is in detached state, vm_refcnt is 0 and only a call to
> vma_mark_attached() can take it out of this state. Note that unlike
> before, now we enforce both vma_mark_attached() and vma_mark_detached()
> to be done only after vma has been write-locked. vma_mark_attached()
> changes vm_refcnt to 1 to indicate that it has been attached to the vma
> tree. When a reader takes read lock, it increments vm_refcnt, unless the
> top usable bit of vm_refcnt (0x40000000) is set, indicating presence of
> a writer. When writer takes write lock, it both increments vm_refcnt and
> sets the top usable bit to indicate its presence. If there are readers,
> writer will wait using newly introduced mm->vma_writer_wait. Since all
> writers take mmap_lock in write mode first, there can be only one writer
> at a time. The last reader to release the lock will signal the writer
> to wake up.
> refcount might overflow if there are many competing readers, in which case
> read-locking will fail. Readers are expected to handle such failures.

I find the above a bit hard to parse.

What I understand is:
1. all accesses increment the ref count.
2. readers cannot increment the ref count unless the writer bit is 0 (no
write present)
3. writers must wait for the ref count to reach 2 (the tree + writer
reference) before proceeding.
4. increment overflow must be handled by the readers.

> 
> Suggested-by: Peter Zijlstra <peterz@infradead.org>
> Suggested-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
>  include/linux/mm.h               | 100 +++++++++++++++++++++----------
>  include/linux/mm_types.h         |  22 ++++---
>  kernel/fork.c                    |  13 ++--
>  mm/init-mm.c                     |   1 +
>  mm/memory.c                      |  68 +++++++++++++++++----
>  tools/testing/vma/linux/atomic.h |   5 ++
>  tools/testing/vma/vma_internal.h |  66 +++++++++++---------
>  7 files changed, 185 insertions(+), 90 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index ea4c4228b125..99f4720d7e51 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -32,6 +32,7 @@
>  #include <linux/memremap.h>
>  #include <linux/slab.h>
>  #include <linux/cacheinfo.h>
> +#include <linux/rcuwait.h>
>  
>  struct mempolicy;
>  struct anon_vma;
> @@ -697,12 +698,34 @@ static inline void vma_numab_state_free(struct vm_area_struct *vma) {}
>  #endif /* CONFIG_NUMA_BALANCING */
>  
>  #ifdef CONFIG_PER_VMA_LOCK
> -static inline void vma_lock_init(struct vm_area_struct *vma)
> +static inline void vma_lockdep_init(struct vm_area_struct *vma)
>  {
> -	init_rwsem(&vma->vm_lock.lock);
> +#ifdef CONFIG_DEBUG_LOCK_ALLOC
> +	static struct lock_class_key lockdep_key;
> +
> +	lockdep_init_map(&vma->vmlock_dep_map, "vm_lock", &lockdep_key, 0);
> +#endif
> +}
> +
> +static inline void vma_init_lock(struct vm_area_struct *vma, bool reset_refcnt)
> +{
> +	if (reset_refcnt)
> +		refcount_set(&vma->vm_refcnt, 0);
>  	vma->vm_lock_seq = UINT_MAX;
>  }
>  
> +static inline void vma_refcount_put(struct vm_area_struct *vma)
> +{
> +	int refcnt;
> +
> +	if (!__refcount_dec_and_test(&vma->vm_refcnt, &refcnt)) {
> +		rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
> +
> +		if (refcnt & VMA_LOCK_OFFSET)

Couldn't we only wake on refcnt == VMA_LOCK_OFFSET + 2?
Right now you will wake on every departed reader, I think?  We know
refcnt is only going down if VMA_LOCK_OFFSET is set.

Also, maybe a #define for VMA_LOCK_WRITER_ONLY or some better name?


> +			rcuwait_wake_up(&vma->vm_mm->vma_writer_wait);
> +	}
> +}
> +
>  /*
>   * Try to read-lock a vma. The function is allowed to occasionally yield false
>   * locked result to avoid performance overhead, in which case we fall back to
> @@ -710,6 +733,8 @@ static inline void vma_lock_init(struct vm_area_struct *vma)
>   */
>  static inline bool vma_start_read(struct vm_area_struct *vma)
>  {
> +	int oldcnt;
> +
>  	/*
>  	 * Check before locking. A race might cause false locked result.
>  	 * We can use READ_ONCE() for the mm_lock_seq here, and don't need
> @@ -720,13 +745,20 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
>  	if (READ_ONCE(vma->vm_lock_seq) == READ_ONCE(vma->vm_mm->mm_lock_seq.sequence))
>  		return false;
>  
> -	if (unlikely(down_read_trylock(&vma->vm_lock.lock) == 0))
> +
> +	rwsem_acquire_read(&vma->vmlock_dep_map, 0, 0, _RET_IP_);
> +	/* Limit at VMA_REF_LIMIT to leave one count for a writer */
> +	if (unlikely(!__refcount_inc_not_zero_limited(&vma->vm_refcnt, &oldcnt,
> +						      VMA_REF_LIMIT))) {
> +		rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
>  		return false;
> +	}
> +	lock_acquired(&vma->vmlock_dep_map, _RET_IP_);
>  
>  	/*
> -	 * Overflow might produce false locked result.
> +	 * Overflow of vm_lock_seq/mm_lock_seq might produce false locked result.
>  	 * False unlocked result is impossible because we modify and check
> -	 * vma->vm_lock_seq under vma->vm_lock protection and mm->mm_lock_seq
> +	 * vma->vm_lock_seq under vma->vm_refcnt protection and mm->mm_lock_seq
>  	 * modification invalidates all existing locks.
>  	 *
>  	 * We must use ACQUIRE semantics for the mm_lock_seq so that if we are
> @@ -734,10 +766,12 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
>  	 * after it has been unlocked.
>  	 * This pairs with RELEASE semantics in vma_end_write_all().
>  	 */
> -	if (unlikely(vma->vm_lock_seq == raw_read_seqcount(&vma->vm_mm->mm_lock_seq))) {
> -		up_read(&vma->vm_lock.lock);
> +	if (unlikely(oldcnt & VMA_LOCK_OFFSET ||
> +		     vma->vm_lock_seq == raw_read_seqcount(&vma->vm_mm->mm_lock_seq))) {
> +		vma_refcount_put(vma);
>  		return false;
>  	}
> +
>  	return true;
>  }
>  
> @@ -749,8 +783,17 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
>   */
>  static inline bool vma_start_read_locked_nested(struct vm_area_struct *vma, int subclass)
>  {
> +	int oldcnt;
> +
>  	mmap_assert_locked(vma->vm_mm);
> -	down_read_nested(&vma->vm_lock.lock, subclass);
> +	rwsem_acquire_read(&vma->vmlock_dep_map, subclass, 0, _RET_IP_);
> +	/* Limit at VMA_REF_LIMIT to leave one count for a writer */
> +	if (unlikely(!__refcount_inc_not_zero_limited(&vma->vm_refcnt, &oldcnt,
> +						      VMA_REF_LIMIT))) {
> +		rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
> +		return false;
> +	}
> +	lock_acquired(&vma->vmlock_dep_map, _RET_IP_);
>  	return true;
>  }
>  
> @@ -762,15 +805,13 @@ static inline bool vma_start_read_locked_nested(struct vm_area_struct *vma, int
>   */
>  static inline bool vma_start_read_locked(struct vm_area_struct *vma)
>  {
> -	mmap_assert_locked(vma->vm_mm);
> -	down_read(&vma->vm_lock.lock);
> -	return true;
> +	return vma_start_read_locked_nested(vma, 0);
>  }
>  
>  static inline void vma_end_read(struct vm_area_struct *vma)
>  {
>  	rcu_read_lock(); /* keeps vma alive till the end of up_read */
> -	up_read(&vma->vm_lock.lock);
> +	vma_refcount_put(vma);
>  	rcu_read_unlock();
>  }
>  
> @@ -813,36 +854,33 @@ static inline void vma_assert_write_locked(struct vm_area_struct *vma)
>  
>  static inline void vma_assert_locked(struct vm_area_struct *vma)
>  {
> -	if (!rwsem_is_locked(&vma->vm_lock.lock))
> +	if (refcount_read(&vma->vm_refcnt) <= 1)
>  		vma_assert_write_locked(vma);
>  }
>  
> +/*
> + * WARNING: to avoid racing with vma_mark_attached()/vma_mark_detached(), these
> + * assertions should be made either under mmap_write_lock or when the object
> + * has been isolated under mmap_write_lock, ensuring no competing writers.
> + */
>  static inline void vma_assert_attached(struct vm_area_struct *vma)
>  {
> -	VM_BUG_ON_VMA(vma->detached, vma);
> +	VM_BUG_ON_VMA(!refcount_read(&vma->vm_refcnt), vma);
>  }
>  
>  static inline void vma_assert_detached(struct vm_area_struct *vma)
>  {
> -	VM_BUG_ON_VMA(!vma->detached, vma);
> +	VM_BUG_ON_VMA(refcount_read(&vma->vm_refcnt), vma);
>  }
>  
>  static inline void vma_mark_attached(struct vm_area_struct *vma)
>  {
> -	vma->detached = false;
> -}
> -
> -static inline void vma_mark_detached(struct vm_area_struct *vma)
> -{
> -	/* When detaching vma should be write-locked */
>  	vma_assert_write_locked(vma);
> -	vma->detached = true;
> +	vma_assert_detached(vma);
> +	refcount_set(&vma->vm_refcnt, 1);
>  }
>  
> -static inline bool is_vma_detached(struct vm_area_struct *vma)
> -{
> -	return vma->detached;
> -}
> +void vma_mark_detached(struct vm_area_struct *vma);
>  
>  static inline void release_fault_lock(struct vm_fault *vmf)
>  {
> @@ -865,7 +903,8 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
>  
>  #else /* CONFIG_PER_VMA_LOCK */
>  
> -static inline void vma_lock_init(struct vm_area_struct *vma) {}
> +static inline void vma_lockdep_init(struct vm_area_struct *vma) {}
> +static inline void vma_init_lock(struct vm_area_struct *vma, bool reset_refcnt) {}
>  static inline bool vma_start_read(struct vm_area_struct *vma)
>  		{ return false; }
>  static inline void vma_end_read(struct vm_area_struct *vma) {}
> @@ -908,12 +947,9 @@ static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
>  	vma->vm_mm = mm;
>  	vma->vm_ops = &vma_dummy_vm_ops;
>  	INIT_LIST_HEAD(&vma->anon_vma_chain);
> -#ifdef CONFIG_PER_VMA_LOCK
> -	/* vma is not locked, can't use vma_mark_detached() */
> -	vma->detached = true;
> -#endif
>  	vma_numab_state_init(vma);
> -	vma_lock_init(vma);
> +	vma_lockdep_init(vma);
> +	vma_init_lock(vma, false);
>  }
>  
>  /* Use when VMA is not part of the VMA tree and needs no locking */
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 6573d95f1d1e..b5312421dec6 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -19,6 +19,7 @@
>  #include <linux/workqueue.h>
>  #include <linux/seqlock.h>
>  #include <linux/percpu_counter.h>
> +#include <linux/types.h>
>  
>  #include <asm/mmu.h>
>  
> @@ -629,9 +630,8 @@ static inline struct anon_vma_name *anon_vma_name_alloc(const char *name)
>  }
>  #endif
>  
> -struct vma_lock {
> -	struct rw_semaphore lock;
> -};
> +#define VMA_LOCK_OFFSET	0x40000000
> +#define VMA_REF_LIMIT	(VMA_LOCK_OFFSET - 2)
>  
>  struct vma_numab_state {
>  	/*
> @@ -709,19 +709,13 @@ struct vm_area_struct {
>  	};
>  
>  #ifdef CONFIG_PER_VMA_LOCK
> -	/*
> -	 * Flag to indicate areas detached from the mm->mm_mt tree.
> -	 * Unstable RCU readers are allowed to read this.
> -	 */
> -	bool detached;
> -
>  	/*
>  	 * Can only be written (using WRITE_ONCE()) while holding both:
>  	 *  - mmap_lock (in write mode)
> -	 *  - vm_lock->lock (in write mode)
> +	 *  - vm_refcnt bit at VMA_LOCK_OFFSET is set
>  	 * Can be read reliably while holding one of:
>  	 *  - mmap_lock (in read or write mode)
> -	 *  - vm_lock->lock (in read or write mode)
> +	 *  - vm_refcnt bit at VMA_LOCK_OFFSET is set or vm_refcnt > 1
>  	 * Can be read unreliably (using READ_ONCE()) for pessimistic bailout
>  	 * while holding nothing (except RCU to keep the VMA struct allocated).
>  	 *
> @@ -784,7 +778,10 @@ struct vm_area_struct {
>  	struct vm_userfaultfd_ctx vm_userfaultfd_ctx;
>  #ifdef CONFIG_PER_VMA_LOCK
>  	/* Unstable RCU readers are allowed to read this. */
> -	struct vma_lock vm_lock ____cacheline_aligned_in_smp;
> +	refcount_t vm_refcnt ____cacheline_aligned_in_smp;
> +#ifdef CONFIG_DEBUG_LOCK_ALLOC
> +	struct lockdep_map vmlock_dep_map;
> +#endif
>  #endif
>  } __randomize_layout;
>  
> @@ -919,6 +916,7 @@ struct mm_struct {
>  					  * by mmlist_lock
>  					  */
>  #ifdef CONFIG_PER_VMA_LOCK
> +		struct rcuwait vma_writer_wait;
>  		/*
>  		 * This field has lock-like semantics, meaning it is sometimes
>  		 * accessed with ACQUIRE/RELEASE semantics.
> diff --git a/kernel/fork.c b/kernel/fork.c
> index d4c75428ccaf..7a0800d48112 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -463,12 +463,8 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
>  	 * will be reinitialized.
>  	 */
>  	data_race(memcpy(new, orig, sizeof(*new)));
> -	vma_lock_init(new);
> +	vma_init_lock(new, true);
>  	INIT_LIST_HEAD(&new->anon_vma_chain);
> -#ifdef CONFIG_PER_VMA_LOCK
> -	/* vma is not locked, can't use vma_mark_detached() */
> -	new->detached = true;
> -#endif
>  	vma_numab_state_init(new);
>  	dup_anon_vma_name(orig, new);
>  
> @@ -477,6 +473,8 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
>  
>  void __vm_area_free(struct vm_area_struct *vma)
>  {
> +	/* The vma should be detached while being destroyed. */
> +	vma_assert_detached(vma);
>  	vma_numab_state_free(vma);
>  	free_anon_vma_name(vma);
>  	kmem_cache_free(vm_area_cachep, vma);
> @@ -488,8 +486,6 @@ static void vm_area_free_rcu_cb(struct rcu_head *head)
>  	struct vm_area_struct *vma = container_of(head, struct vm_area_struct,
>  						  vm_rcu);
>  
> -	/* The vma should not be locked while being destroyed. */
> -	VM_BUG_ON_VMA(rwsem_is_locked(&vma->vm_lock.lock), vma);
>  	__vm_area_free(vma);
>  }
>  #endif
> @@ -1223,6 +1219,9 @@ static inline void mmap_init_lock(struct mm_struct *mm)
>  {
>  	init_rwsem(&mm->mmap_lock);
>  	mm_lock_seqcount_init(mm);
> +#ifdef CONFIG_PER_VMA_LOCK
> +	rcuwait_init(&mm->vma_writer_wait);
> +#endif
>  }
>  
>  static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *p,
> diff --git a/mm/init-mm.c b/mm/init-mm.c
> index 6af3ad675930..4600e7605cab 100644
> --- a/mm/init-mm.c
> +++ b/mm/init-mm.c
> @@ -40,6 +40,7 @@ struct mm_struct init_mm = {
>  	.arg_lock	=  __SPIN_LOCK_UNLOCKED(init_mm.arg_lock),
>  	.mmlist		= LIST_HEAD_INIT(init_mm.mmlist),
>  #ifdef CONFIG_PER_VMA_LOCK
> +	.vma_writer_wait = __RCUWAIT_INITIALIZER(init_mm.vma_writer_wait),
>  	.mm_lock_seq	= SEQCNT_ZERO(init_mm.mm_lock_seq),
>  #endif
>  	.user_ns	= &init_user_ns,
> diff --git a/mm/memory.c b/mm/memory.c
> index 236fdecd44d6..2def47b5dff0 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -6328,9 +6328,39 @@ struct vm_area_struct *lock_mm_and_find_vma(struct mm_struct *mm,
>  #endif
>  
>  #ifdef CONFIG_PER_VMA_LOCK
> +static inline bool __vma_enter_locked(struct vm_area_struct *vma, unsigned int tgt_refcnt)
> +{
> +	/*
> +	 * If vma is detached then only vma_mark_attached() can raise the
> +	 * vm_refcnt. mmap_write_lock prevents racing with vma_mark_attached().
> +	 */
> +	if (!refcount_inc_not_zero(&vma->vm_refcnt))
> +		return false;

Can't the write lock overflow the ref count too?

> +
> +	rwsem_acquire(&vma->vmlock_dep_map, 0, 0, _RET_IP_);
> +	/* vma is attached, set the writer present bit */
> +	refcount_add(VMA_LOCK_OFFSET, &vma->vm_refcnt);
> +	rcuwait_wait_event(&vma->vm_mm->vma_writer_wait,
> +		   refcount_read(&vma->vm_refcnt) == tgt_refcnt,
> +		   TASK_UNINTERRUPTIBLE);
> +	lock_acquired(&vma->vmlock_dep_map, _RET_IP_);
> +
> +	return true;
> +}
> +
> +static inline void __vma_exit_locked(struct vm_area_struct *vma, bool *detached)
> +{
> +	*detached = refcount_sub_and_test(VMA_LOCK_OFFSET + 1, &vma->vm_refcnt);
> +	rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
> +}
> +
>  void __vma_start_write(struct vm_area_struct *vma, unsigned int mm_lock_seq)
>  {
> -	down_write(&vma->vm_lock.lock);
> +	bool locked;
> +
> +	/* Wait until refcnt is (VMA_LOCK_OFFSET + 2) => attached with no readers */
> +	locked = __vma_enter_locked(vma, VMA_LOCK_OFFSET + 2);

Does it need to take a ref count at all?  Could we just set the write
bit and wait for it to become 1 instead?  That is, 1 would represent
detached or writer is about to attach/detach it.

If we do need it to be ref counted for the writer, we could set the
write bit and the wait for the ref to be 1 before incrementing it to 2?
I think this would be safer as we know there is only one writer and the
readers can only decrease after setting the write bit.

> +
>  	/*
>  	 * We should use WRITE_ONCE() here because we can have concurrent reads
>  	 * from the early lockless pessimistic check in vma_start_read().
> @@ -6338,10 +6368,36 @@ void __vma_start_write(struct vm_area_struct *vma, unsigned int mm_lock_seq)
>  	 * we should use WRITE_ONCE() for cleanliness and to keep KCSAN happy.
>  	 */
>  	WRITE_ONCE(vma->vm_lock_seq, mm_lock_seq);
> -	up_write(&vma->vm_lock.lock);
> +
> +	if (locked) {
> +		bool detached;
> +
> +		__vma_exit_locked(vma, &detached);
> +		VM_BUG_ON_VMA(detached, vma); /* vma should remain attached */
> +	}
>  }
>  EXPORT_SYMBOL_GPL(__vma_start_write);
>  
> +void vma_mark_detached(struct vm_area_struct *vma)
> +{
> +	vma_assert_write_locked(vma);
> +	vma_assert_attached(vma);
> +
> +	/* We are the only writer, so no need to use vma_refcount_put(). */
> +	if (unlikely(!refcount_dec_and_test(&vma->vm_refcnt))) {
> +		/*
> +		 * Wait until refcnt is (VMA_LOCK_OFFSET + 1) => detached with
> +		 * no readers
> +		 */
> +		if (__vma_enter_locked(vma, VMA_LOCK_OFFSET + 1)) {
> +			bool detached;
> +
> +			__vma_exit_locked(vma, &detached);
> +			VM_BUG_ON_VMA(!detached, vma);
> +		}
> +	}
> +}
> +
>  /*
>   * Lookup and lock a VMA under RCU protection. Returned VMA is guaranteed to be
>   * stable and not isolated. If the VMA is not found or is being modified the
> @@ -6354,7 +6410,6 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
>  	struct vm_area_struct *vma;
>  
>  	rcu_read_lock();
> -retry:
>  	vma = mas_walk(&mas);
>  	if (!vma)
>  		goto inval;
> @@ -6362,13 +6417,6 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
>  	if (!vma_start_read(vma))
>  		goto inval;
>  
> -	/* Check if the VMA got isolated after we found it */
> -	if (is_vma_detached(vma)) {
> -		vma_end_read(vma);
> -		count_vm_vma_lock_event(VMA_LOCK_MISS);
> -		/* The area was replaced with another one */
> -		goto retry;
> -	}
>  	/*
>  	 * At this point, we have a stable reference to a VMA: The VMA is
>  	 * locked and we know it hasn't already been isolated.
> diff --git a/tools/testing/vma/linux/atomic.h b/tools/testing/vma/linux/atomic.h
> index e01f66f98982..2e2021553196 100644
> --- a/tools/testing/vma/linux/atomic.h
> +++ b/tools/testing/vma/linux/atomic.h
> @@ -9,4 +9,9 @@
>  #define atomic_set(x, y) do {} while (0)
>  #define U8_MAX UCHAR_MAX
>  
> +#ifndef atomic_cmpxchg_relaxed
> +#define  atomic_cmpxchg_relaxed		uatomic_cmpxchg
> +#define  atomic_cmpxchg_release         uatomic_cmpxchg
> +#endif /* atomic_cmpxchg_relaxed */
> +
>  #endif	/* _LINUX_ATOMIC_H */
> diff --git a/tools/testing/vma/vma_internal.h b/tools/testing/vma/vma_internal.h
> index 2a624f9304da..1e8cd2f013fa 100644
> --- a/tools/testing/vma/vma_internal.h
> +++ b/tools/testing/vma/vma_internal.h
> @@ -25,7 +25,7 @@
>  #include <linux/maple_tree.h>
>  #include <linux/mm.h>
>  #include <linux/rbtree.h>
> -#include <linux/rwsem.h>
> +#include <linux/refcount.h>
>  
>  extern unsigned long stack_guard_gap;
>  #ifdef CONFIG_MMU
> @@ -132,10 +132,6 @@ typedef __bitwise unsigned int vm_fault_t;
>   */
>  #define pr_warn_once pr_err
>  
> -typedef struct refcount_struct {
> -	atomic_t refs;
> -} refcount_t;
> -
>  struct kref {
>  	refcount_t refcount;
>  };
> @@ -228,15 +224,12 @@ struct mm_struct {
>  	unsigned long def_flags;
>  };
>  
> -struct vma_lock {
> -	struct rw_semaphore lock;
> -};
> -
> -
>  struct file {
>  	struct address_space	*f_mapping;
>  };
>  
> +#define VMA_LOCK_OFFSET	0x40000000
> +
>  struct vm_area_struct {
>  	/* The first cache line has the info for VMA tree walking. */
>  
> @@ -264,16 +257,13 @@ struct vm_area_struct {
>  	};
>  
>  #ifdef CONFIG_PER_VMA_LOCK
> -	/* Flag to indicate areas detached from the mm->mm_mt tree */
> -	bool detached;
> -
>  	/*
>  	 * Can only be written (using WRITE_ONCE()) while holding both:
>  	 *  - mmap_lock (in write mode)
> -	 *  - vm_lock.lock (in write mode)
> +	 *  - vm_refcnt bit at VMA_LOCK_OFFSET is set
>  	 * Can be read reliably while holding one of:
>  	 *  - mmap_lock (in read or write mode)
> -	 *  - vm_lock.lock (in read or write mode)
> +	 *  - vm_refcnt bit at VMA_LOCK_OFFSET is set or vm_refcnt > 1
>  	 * Can be read unreliably (using READ_ONCE()) for pessimistic bailout
>  	 * while holding nothing (except RCU to keep the VMA struct allocated).
>  	 *
> @@ -282,7 +272,6 @@ struct vm_area_struct {
>  	 * slowpath.
>  	 */
>  	unsigned int vm_lock_seq;
> -	struct vma_lock vm_lock;
>  #endif
>  
>  	/*
> @@ -335,6 +324,10 @@ struct vm_area_struct {
>  	struct vma_numab_state *numab_state;	/* NUMA Balancing state */
>  #endif
>  	struct vm_userfaultfd_ctx vm_userfaultfd_ctx;
> +#ifdef CONFIG_PER_VMA_LOCK
> +	/* Unstable RCU readers are allowed to read this. */
> +	refcount_t vm_refcnt;
> +#endif
>  } __randomize_layout;
>  
>  struct vm_fault {};
> @@ -459,23 +452,41 @@ static inline struct vm_area_struct *vma_next(struct vma_iterator *vmi)
>  	return mas_find(&vmi->mas, ULONG_MAX);
>  }
>  
> -static inline void vma_lock_init(struct vm_area_struct *vma)
> +/*
> + * WARNING: to avoid racing with vma_mark_attached()/vma_mark_detached(), these
> + * assertions should be made either under mmap_write_lock or when the object
> + * has been isolated under mmap_write_lock, ensuring no competing writers.
> + */
> +static inline void vma_assert_attached(struct vm_area_struct *vma)
>  {
> -	init_rwsem(&vma->vm_lock.lock);
> -	vma->vm_lock_seq = UINT_MAX;
> +	VM_BUG_ON_VMA(!refcount_read(&vma->vm_refcnt), vma);
>  }
>  
> -static inline void vma_mark_attached(struct vm_area_struct *vma)
> +static inline void vma_assert_detached(struct vm_area_struct *vma)
>  {
> -	vma->detached = false;
> +	VM_BUG_ON_VMA(refcount_read(&vma->vm_refcnt), vma);
>  }
>  
>  static inline void vma_assert_write_locked(struct vm_area_struct *);
> +static inline void vma_mark_attached(struct vm_area_struct *vma)
> +{
> +	vma_assert_write_locked(vma);
> +	vma_assert_detached(vma);
> +	refcount_set(&vma->vm_refcnt, 1);
> +}
> +
>  static inline void vma_mark_detached(struct vm_area_struct *vma)
>  {
> -	/* When detaching vma should be write-locked */
>  	vma_assert_write_locked(vma);
> -	vma->detached = true;
> +	vma_assert_attached(vma);
> +
> +	/* We are the only writer, so no need to use vma_refcount_put(). */
> +	if (unlikely(!refcount_dec_and_test(&vma->vm_refcnt))) {
> +		/*
> +		 * Reader must have temporarily raised vm_refcnt but it will
> +		 * drop it without using the vma since vma is write-locked.
> +		 */
> +	}
>  }
>  
>  extern const struct vm_operations_struct vma_dummy_vm_ops;
> @@ -488,9 +499,7 @@ static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
>  	vma->vm_mm = mm;
>  	vma->vm_ops = &vma_dummy_vm_ops;
>  	INIT_LIST_HEAD(&vma->anon_vma_chain);
> -	/* vma is not locked, can't use vma_mark_detached() */
> -	vma->detached = true;
> -	vma_lock_init(vma);
> +	vma->vm_lock_seq = UINT_MAX;
>  }
>  
>  static inline struct vm_area_struct *vm_area_alloc(struct mm_struct *mm)
> @@ -513,10 +522,9 @@ static inline struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
>  		return NULL;
>  
>  	memcpy(new, orig, sizeof(*new));
> -	vma_lock_init(new);
> +	refcount_set(&new->vm_refcnt, 0);
> +	new->vm_lock_seq = UINT_MAX;
>  	INIT_LIST_HEAD(&new->anon_vma_chain);
> -	/* vma is not locked, can't use vma_mark_detached() */
> -	new->detached = true;
>  
>  	return new;
>  }
> -- 
> 2.47.1.613.gc27f4b7a9f-goog
> 

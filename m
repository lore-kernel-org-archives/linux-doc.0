Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF2C3A8D0;
	Mon, 13 Jan 2025 16:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736786063; cv=fail; b=RA6f33c5dhvl1L2dKXmsbcS0MQQjn0bzyjVIqomTdqG7RuvN5TMUgagVI0OIAFDTWiBwtChF6erMaTRaQtOvNI6jSduygJphsXLpDcvNmpQrhOrpfM/wwQrFt9ulhWiI0HwcE3zEUfBEugFy/QjfMsi80lzam9GmR0WXgjEdoFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736786063; c=relaxed/simple;
	bh=yVteZi23jweYnPdSpHeM7tjMtxCxIE17LmHvQwAfwX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jxnvV11/OHN1USkKgbn6hHwPP8Y4jND/hOKxFPx/ihD6X1hjyMoLqUG2yXSiZicHR5Ztoi06iJmbA/nAgawJ8c2wSULS96Sz5E2TrMQfaD3hvwQ5/65U5msyjus2SWU7Yo4LCUx7jb3sxFo1+4uNkndLcMG+2Vdv225g0bfOzc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KUt5tskt; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=DSjsDnpH; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KUt5tskt";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="DSjsDnpH"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DGXoM8017208;
	Mon, 13 Jan 2025 16:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=KOG5MRPgR/YHfmXXAQ
	RwjaEPNclF5D7mrORSZ7ZOdpw=; b=KUt5tsktprWXZTbaE4HLTC5Vr7jq6UGqTQ
	LJET6/ftmUK8B0lvYmlT89YtCj/TjzUGmR3DGuhISjthXPbFa0RZu5wwv+/gXVQH
	R5l+18v6bepBVYYH4H5hhyxPmOEuGst6aZifmzO59TvB6SsaFHxy5nSydMNmW5dm
	1TWO9JLpTqylkaQ2Hb5YNQzWfb11GVDHW0+NYTAmqm5RlEuMN3GthQt0vm4NuadM
	irQBfoASZti73bbO14nVHkCKDP7zssv6G/c1UjDphzyHg15exeAiMMMezbAkeZOy
	D9pN6YnsdvK54amGf/4OxKHfka1J93B6/4upe8pe5mzo2UFNW3gA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443g8sc0nm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 16:33:49 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50DGQ2Qa020430;
	Mon, 13 Jan 2025 16:33:44 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 443f3df93e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 16:33:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZkKFmomuQ0Yqhp+G6j9YlFVXEHbLIHktLhSkQSDDJ5tMgG9VVcOBSafxKtL7BvsTz3mBn6upbYuI+G2SRGJ6jqpzovQR56rAXNZmiQqIH25GaaQLkztpc5GQ40C4wqxPcbTvs2sYyHkG67gtmIFC/OUFke2VNLhssS+OOuSBM5NdokepAQkI9XMhSw3PZ5jEU0m/JQ/vIVu5mJqqxBRhP2PzbK7hMWI9lGzJKB00M5QpsskvnL7BAFSZTSgvn3hUS2KdrJEmzxa4nmdm5/hMS/Vs/8Wfy4gjPFbjI7sEcmGvbaxigPzzbPSPCYH93Xj3B4HQZxN7eZL+VDx3rsztBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOG5MRPgR/YHfmXXAQRwjaEPNclF5D7mrORSZ7ZOdpw=;
 b=DBjf69Zlsc5NDcURabHNp/lcqZR/WHiTWWD8AkkMH5YL84faBf69n8To4y3nJXuD/LdQZPCvmsE7IqPLvJlymQRX9dc4h83eYWBNqkySZNn59TkzySUaKuNKT0tY1MQgXlg3CsaNe/KC5nbEXIWz/QWeMTloEHe6VQGpDeciZfgxtePKwri8Y8mfv7QuQei+SPk+ZWMIkJR2CRRYS64V7QK4F9piK/+0WT1Bjhje05WtqLk02CY06VaYjNc+kNKBzSJv4w7SFdpYe+CtK0aChuzYCPfUAb/BeA7O3DQXRyi9ti2zGDBLHge+AyHd7GA1DEWhvANd3osdb6y4icfjfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KOG5MRPgR/YHfmXXAQRwjaEPNclF5D7mrORSZ7ZOdpw=;
 b=DSjsDnpHFFJhj/KyFiwSH5jsSDYU7OkLUyHbVISWOsXDWp8dxgex3vux/3SfxDQKwnvZBc/QBXB79v3GPepvdmat+Jtr11pSgZabRlfuExHrrqLf5IlAOk9giqKlLG00whrTzAbq3lNgBLBR+9L0b2QlP68l/C2Ntlj1wBUDrbk=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by DM6PR10MB4393.namprd10.prod.outlook.com (2603:10b6:5:223::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Mon, 13 Jan
 2025 16:33:41 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 16:33:41 +0000
Date: Mon, 13 Jan 2025 16:33:38 +0000
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
Subject: Re: [PATCH v9 17/17] docs/mm: document latest changes to vm_lock
Message-ID: <096e5619-a717-4263-983c-e55c8c26f7e9@lucifer.local>
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-18-surenb@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250111042604.3230628-18-surenb@google.com>
X-ClientProxiedBy: LO4P123CA0664.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::8) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|DM6PR10MB4393:EE_
X-MS-Office365-Filtering-Correlation-Id: 2742924f-b265-4e2f-2248-08dd33f00a47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?49Yj/BGtU8vmdyAIinguLKeodluyBKPia/Q06qGNL8+l6+4rYCwUFnKjfj+h?=
 =?us-ascii?Q?BhzvD/+kbP3RD9BD43yg3zzG9X2EE6yQ2kSurHaKT6dA5JXpQyE4dLv1RYiJ?=
 =?us-ascii?Q?E2gxiztw1zpXQ/OdxMgVT/lO0seCjyO2TH9PuOnH+eqAeIeVBxC7ZqEoXSL2?=
 =?us-ascii?Q?TPBEkpvt21woW9JheEuM12h5fNKBcijzbVue1UHJkDMaAR6GZ2az0R3GuNqS?=
 =?us-ascii?Q?f6R3m9SzOOayZ4m+UB/7gGw0k4m5H3V78y6R3mUOV07iQ3c6oiC33aeZ7yaB?=
 =?us-ascii?Q?BuU20P6SMgMprgCsrdR/kyYQL+0duoNyn4Q1Avz3E9ZZN6BRr9eq11t1NuV1?=
 =?us-ascii?Q?pY9bg1/H5aa//YbSu79k2cQwq59j8KUrrubvLZu7xl07kGVNlxUA+qrcvyhh?=
 =?us-ascii?Q?KvGW4Bg70R8V7WteH5e0T7xahMXxej5NhAJsv3xkEq/JsiWjbTKSGHpM1jbj?=
 =?us-ascii?Q?K6FZgSlC//g0f131P0AkmfXZKQKEt8Hew+hWw7T3xVITGTNaorzVG+vahbWJ?=
 =?us-ascii?Q?oqBBJhkGgsKaZQTyAcTCjxVTVAzVvT6YljytKsZxDCyB1CMy48V2Pag6aUfw?=
 =?us-ascii?Q?dn6ZCRdX7bzUuCwOAso1vMzwbH2TKUmzSZDNuz1LHfyRWT6lZksrFUH8Ip/x?=
 =?us-ascii?Q?WwPg6yT1SnKPXH88NULlfKAe4Zffiq0pFOdnrg+c/vVSu2pJY+8TkEMzKZkh?=
 =?us-ascii?Q?BTyC2X9ak3U263PN0/y9tOZsJJ2yIh5M+1jaD7xRgwAJsw+Y9a3fT23a16Uh?=
 =?us-ascii?Q?Wx8UqUIGGMlTop79nhVf8RLdW36INOHK/d5HJ2VpDc2FS90HsoNFjFXts2cK?=
 =?us-ascii?Q?hyGfqCL2o+i3MiA5aqTpDGXtAsAzmoHqzGR14HI9OLP8WkbbasTE6PmbvCS/?=
 =?us-ascii?Q?SwtZkrC8Gj4BweWh60M0WPsjKAytmWQk0kXC8tl8PQ0oeIXnffC7joR3Miwn?=
 =?us-ascii?Q?1MzXq6hZE8sSPY7J39tiooWwluNmNWvFS9BvMryvc2YkktszqVI/NvXgCX8m?=
 =?us-ascii?Q?xJgRlEaz+T5ICxZmDo88yTofDTDi1BaubaJq/X693WAj53fX7/GJAtKJkpXB?=
 =?us-ascii?Q?N9cmHn6abmFG0d5Q16nHW2sr58UlPtr11L9nNqQDK1SiDnn/tR8pD+V8hDZM?=
 =?us-ascii?Q?5MePtUNnnbTTT+bXwDv7p+bZqAUQslYmduaPkr1xQ/vamDaPkE5vbPz+66TW?=
 =?us-ascii?Q?uDr58xJybeYjhL8EWAHGGx7KdhTZkUikCdj8ZjVBchEC7rTTtKutQLoaTjuI?=
 =?us-ascii?Q?0EsPT2yEBmPRO59vMUHlYRJD1l6qyK14yhuha4h938BrKpuV7faDWdCeOp83?=
 =?us-ascii?Q?jMh/K6b9YNjs2/NyvLIwpxZmAeq/VkUg30jEzWxu9YsfInX8ZbTwt00vWSZ/?=
 =?us-ascii?Q?wJbhYGto2wzc3XtqRP4cvPod15Of?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8elkNvbrMW/+gAXjPCHXsfV1r8r0zk3SgB7236nJX/18akkwlEpYaNTClikf?=
 =?us-ascii?Q?uUB+Mtiyb3hBTeCukdz9SxDMEJA/CUeaRPh/066rd7O62QTIUG6LbXvxrE+C?=
 =?us-ascii?Q?tnQeGSum53XOPs3RluxdiUpDIxaq0ZLkWbzkRQ3tKHHdpXUMw1/iMBAVBSpY?=
 =?us-ascii?Q?eUYXJBb4/kz6v6DD8/41+SyaBIM9qIanBF9MufZGds6NDGPq0cULx/vuKD7x?=
 =?us-ascii?Q?/NBVcihEKvPIb3rzLxaZxICZir088+/3O1GzmTCLp9f95psES4Az1cmRGwP4?=
 =?us-ascii?Q?VEGZi00GeY32K2Hnvxj2Z3NECkNFBwCKGVYF33oAKsy7zEfoNaPICh97KzTr?=
 =?us-ascii?Q?GkRP2g0X7NSLq0yoUCn4Q+QqaFEDIRpD6NlNWcVjCFNRSpGREcba4UFvL0XB?=
 =?us-ascii?Q?AJtODExg4winGe1J0UHXgF3S4qkLlPYDvDCwo6SjjumUbqjStCPw0nEYno+t?=
 =?us-ascii?Q?42nqovnnsqZLIi1z46FC2tMVHibMPUXoeWgtCpmouVD84qcPjZuMcXiBdevp?=
 =?us-ascii?Q?i1wZbkbz/LwOoZj00nGYIO7KPv25S5/PwGT4I1aYTJT54hpr3AvtCpYl5ld+?=
 =?us-ascii?Q?dZVfZK9OW3qoFbHoDgoIdh1wEa2Yk1j0Hg1KP2Aqu3HWSS9y04eyCxz7aU7B?=
 =?us-ascii?Q?L6ntASE+bE1wRdZDTtDAbQ8TNd4Mkakdzi3m/DggRRWq1ZW+L9PyHgpwIaKr?=
 =?us-ascii?Q?SNgN/1g3CjabLyIezLlz/KEEPl6VzF5uTT0poNvst7fzhCKrGSjXBG6ApieY?=
 =?us-ascii?Q?G9MYvC2IYoOFOh9twaUzC87kAz5FB7xNxWAqI1ozU7IY2vIWS0bqnkK7SniM?=
 =?us-ascii?Q?uQmSMD5HuHvlBMbMdzQaNU2SKIwl3uvCNbJOfXz1ZDMB0LkGm8575bRsiB7a?=
 =?us-ascii?Q?JEe7bmmR2ovfqdR37BBCaHYn77mzqppVeKMQueEBkRa7CjV2cxYylTa6ugTZ?=
 =?us-ascii?Q?gV8F1YF63DqUdXMB1pznwtHJzR614t4DxsoEaG7lwyWxbVWEwwwUXLc2yjMT?=
 =?us-ascii?Q?wDGhZ5LB8UgROikgZ9+qDKj7CeTgpNc13lhW9czCkX6N40PfBBsPUqXvLkBA?=
 =?us-ascii?Q?/9jb9D/yM6sbwPxBI5/hqZc4zTwVcTOBJ1tCHaZa7YtZ8SrJgA1EWNaDao8r?=
 =?us-ascii?Q?i6F0sf5Q5w9Jsyl5rkycVi4CRhiVOYPTFm9EKrfpEkoFAj+dov/ip+yBvpPZ?=
 =?us-ascii?Q?N0aToiRukyPC9en/MUUd2f7JMcq3WhJJxF7Ie8d2/2jwScx2s8lHtBBtBP7E?=
 =?us-ascii?Q?aWGYqb1kHmCtQiX9YuA8m4YP1AwyRxYMOo7V77rRmAMDK/DT0ZjKChv4cK2Y?=
 =?us-ascii?Q?RraHdkUcBPHYoI5hH26qXOjzHoPAkex5K9d0bWOs+J6iXGt5dJpDOUNsCeaA?=
 =?us-ascii?Q?byD7V475wVUavvXVrSR67LlsbZ853r15lVO+JZ83FdixMI/uPUIeudBwz6FN?=
 =?us-ascii?Q?LYsyaN6Dx/KV1sgMdCzkcRXJYwl5+xO+fhL6g2vdEKV+hgov6jxZaNn8J8Vh?=
 =?us-ascii?Q?VkjP2uq7u87muRFM+CZ5vAIY5OqmR891pvSqDvIgD3l0m1WjS3hniIlZ2P62?=
 =?us-ascii?Q?JnYL8MHe4Dp/hYON75aL9X4TraRn8KLmxSrlRNBbtGlB/eWRT8/YK3WitIvp?=
 =?us-ascii?Q?hw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nKpgu0UklAHhR3K2xaLtgYl4/LprDl59EPLLysJaFhkUWj4V7PS6W2zQ7y5xojYEysshxPdQ5kssvmE2HhaQ6lDKPgkGhcjNAfNQXcMIYNfM67v5FjqYUxhG988REoxpZjgQLlyIaH+hq1DlLN4KMPFjTW5n8SeOZEym7x5jUSlP3ZVNY/wTXEa64GWm+WGctaKeMHgLLJbSK6Khz3pT3HTogL3F5LekeptLvP3O+OQnQWC00LKcvXLgjdQ6NS/OxQkMZRqg6Yn2dzRa1GW8Zy8BOwWWPbp91UlPZ8rSUH3oGtIfCDytTLzKaSK2GTQg4gHqI6LnxbuWipuoIh1UN1f28VPzS8ZQriLY64I4aBDPcMyPBt+hNpVQi3GLRpXOmsxFHVgwa9rBVQx9X4suNF/LfpvTKhX3hoVBlHjrKPY9dz2V3u7NsAyVKpiWYc3RnyV3fW9l/4JKt2dO9cuWwfbQdd5Ytl7mACN6Fcrwz+wh2Po8eWz6HCFXDj53w2sQE7Eqn7fssUfAOFE+0mjoZ6wwjLhUl8eKl7+TRCchDXQ/M/VwHVAVbAfYaDQWeBl7HXbtnYNyNqMTdQOUVyiI8kat8chlahq3Oc6W/gmpeFs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2742924f-b265-4e2f-2248-08dd33f00a47
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 16:33:41.6804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f2h8HIiXDCyt9SAGmngmdC2vGDh64kZVjNu+3MyRADclG2ldqTe4pPaxpW+Umfx6hqwhTf/SL7m65loeVczE8a7sz/FoAGiEfizHzQ5RIFY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4393
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-13_06,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501130135
X-Proofpoint-GUID: 8PreicC8fnHji_gq2uO5T17p6gideNFz
X-Proofpoint-ORIG-GUID: 8PreicC8fnHji_gq2uO5T17p6gideNFz

On Fri, Jan 10, 2025 at 08:26:04PM -0800, Suren Baghdasaryan wrote:
> Change the documentation to reflect that vm_lock is integrated into vma
> and replaced with vm_refcnt.
> Document newly introduced vma_start_read_locked{_nested} functions.
>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> Reviewed-by: Liam R. Howlett <Liam.Howlett@Oracle.com>

Apart from small nit, LGTM, thanks for doing this!

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  Documentation/mm/process_addrs.rst | 44 ++++++++++++++++++------------
>  1 file changed, 26 insertions(+), 18 deletions(-)
>
> diff --git a/Documentation/mm/process_addrs.rst b/Documentation/mm/process_addrs.rst
> index 81417fa2ed20..f573de936b5d 100644
> --- a/Documentation/mm/process_addrs.rst
> +++ b/Documentation/mm/process_addrs.rst
> @@ -716,9 +716,14 @@ calls :c:func:`!rcu_read_lock` to ensure that the VMA is looked up in an RCU
>  critical section, then attempts to VMA lock it via :c:func:`!vma_start_read`,
>  before releasing the RCU lock via :c:func:`!rcu_read_unlock`.
>
> -VMA read locks hold the read lock on the :c:member:`!vma->vm_lock` semaphore for
> -their duration and the caller of :c:func:`!lock_vma_under_rcu` must release it
> -via :c:func:`!vma_end_read`.
> +In cases when the user already holds mmap read lock, :c:func:`!vma_start_read_locked`
> +and :c:func:`!vma_start_read_locked_nested` can be used. These functions do not
> +fail due to lock contention but the caller should still check their return values
> +in case they fail for other reasons.
> +
> +VMA read locks increment :c:member:`!vma.vm_refcnt` reference counter for their
> +duration and the caller of :c:func:`!lock_vma_under_rcu` must drop it via
> +:c:func:`!vma_end_read`.
>
>  VMA **write** locks are acquired via :c:func:`!vma_start_write` in instances where a
>  VMA is about to be modified, unlike :c:func:`!vma_start_read` the lock is always
> @@ -726,9 +731,9 @@ acquired. An mmap write lock **must** be held for the duration of the VMA write
>  lock, releasing or downgrading the mmap write lock also releases the VMA write
>  lock so there is no :c:func:`!vma_end_write` function.
>
> -Note that a semaphore write lock is not held across a VMA lock. Rather, a
> -sequence number is used for serialisation, and the write semaphore is only
> -acquired at the point of write lock to update this.
> +Note that when write-locking a VMA lock, the :c:member:`!vma.vm_refcnt` is temporarily
> +modified so that readers can detect the presense of a writer. The reference counter is
> +restored once the vma sequence number used for serialisation is updated.
>
>  This ensures the semantics we require - VMA write locks provide exclusive write
>  access to the VMA.
> @@ -738,7 +743,7 @@ Implementation details
>
>  The VMA lock mechanism is designed to be a lightweight means of avoiding the use
>  of the heavily contended mmap lock. It is implemented using a combination of a
> -read/write semaphore and sequence numbers belonging to the containing
> +reference counter and sequence numbers belonging to the containing
>  :c:struct:`!struct mm_struct` and the VMA.
>
>  Read locks are acquired via :c:func:`!vma_start_read`, which is an optimistic
> @@ -779,28 +784,31 @@ release of any VMA locks on its release makes sense, as you would never want to
>  keep VMAs locked across entirely separate write operations. It also maintains
>  correct lock ordering.
>
> -Each time a VMA read lock is acquired, we acquire a read lock on the
> -:c:member:`!vma->vm_lock` read/write semaphore and hold it, while checking that
> -the sequence count of the VMA does not match that of the mm.
> +Each time a VMA read lock is acquired, we increment :c:member:`!vma.vm_refcnt`
> +reference counter and check that the sequence count of the VMA does not match
> +that of the mm.
>
> -If it does, the read lock fails. If it does not, we hold the lock, excluding
> -writers, but permitting other readers, who will also obtain this lock under RCU.
> +If it does, the read lock fails and :c:member:`!vma.vm_refcnt` is dropped.
> +If it does not, we keep the reference counter raised, excluding writers, but
> +permitting other readers, who can also obtain this lock under RCU.
>
>  Importantly, maple tree operations performed in :c:func:`!lock_vma_under_rcu`
>  are also RCU safe, so the whole read lock operation is guaranteed to function
>  correctly.
>
> -On the write side, we acquire a write lock on the :c:member:`!vma->vm_lock`
> -read/write semaphore, before setting the VMA's sequence number under this lock,
> -also simultaneously holding the mmap write lock.
> +On the write side, we set a bit in :c:member:`!vma.vm_refcnt` which can't be
> +modified by readers and wait for all readers to drop their reference count.
> +Once there are no readers, VMA's sequence number is set to match that of the

Nit: 'the VMA's sequence number' seems to read better here.

> +mm. During this entire operation mmap write lock is held.
>
>  This way, if any read locks are in effect, :c:func:`!vma_start_write` will sleep
>  until these are finished and mutual exclusion is achieved.
>
> -After setting the VMA's sequence number, the lock is released, avoiding
> -complexity with a long-term held write lock.
> +After setting the VMA's sequence number, the bit in :c:member:`!vma.vm_refcnt`
> +indicating a writer is cleared. From this point on, VMA's sequence number will
> +indicate VMA's write-locked state until mmap write lock is dropped or downgraded.
>
> -This clever combination of a read/write semaphore and sequence count allows for
> +This clever combination of a reference counter and sequence count allows for
>  fast RCU-based per-VMA lock acquisition (especially on page fault, though
>  utilised elsewhere) with minimal complexity around lock ordering.
>
> --
> 2.47.1.613.gc27f4b7a9f-goog
>

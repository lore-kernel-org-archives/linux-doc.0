Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39ADB1C32EA;
	Tue,  7 Jan 2025 17:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736272334; cv=fail; b=DT+YGDzm+8vWIFVv7kc+EhHpWbp9xtQdTLISnwt2yOR1zViNX/fR7yC/7IfjksQI5EttYJ+2rH43r6MViKbQfFPTgTPJOUVJEd//H6y+HigL7sVVIfUOaAQA4sF62BWFhTkpJgdZtbV2oAVFovJYLWf2SH13TDeeKyafRi3zSAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736272334; c=relaxed/simple;
	bh=ESyFSsez11+B7bcztOdidAgBju6E4Qje4pfFQPTnC10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dSaMVXfNY2jSuvkFfVgYu65T9E/eyKZ6xmZhJHFan0ax6GzY7EgAw8Nrx7rvODvEBCpoXu1RMDdcJWs+uOxH3+Rvk+1+P9h44D23aBgFS5TMBmcAjea1DafOJ4eIRzMntI9u1E+9iZL+w7luEauQIGrSlzDso9hozWFzFIRM1+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=eF0bK1TO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gLm/pV2L; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eF0bK1TO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gLm/pV2L"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507HMtKX010818;
	Tue, 7 Jan 2025 17:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=juewfX3+bVPs3UUnJP
	wLiHAM8+YiZu2TBaOKskUoQvM=; b=eF0bK1TO4yQq4n6pnPEGUz/Dx6r4QgFwO3
	SH2HUmU5OfkRFKeIRV/6DQSvIAI2FdWMtp1Zh4L9BsiD9PpQekZiwyct4cSFiyD3
	hiiiB0+OinD7unvybpet4GtAFLBqXvjKmpJZTSUYLYQWl/zgPw1BkV5ZVEFdf/5y
	pqcZuk1EnejmAoF4fXZCzNByY5h7JXYL5s/SNzs83Ge0fUVHEyE0oA5qWCjkNrRa
	ZfWIf2+BA/MdrQ6FglmY2KoZia9OOgVXDBsqli3y46F3ggcgYI4xOlKAhL3d5c67
	MsmWZUUarFoR8qJl74fgPZbBWHKKMz5YnQK8kbucZhRQzuYI0Ldg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43xvv950s5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 07 Jan 2025 17:51:40 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 507H4cu9011008;
	Tue, 7 Jan 2025 17:51:39 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43xue8kgmw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 07 Jan 2025 17:51:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aQvLAx9YWBPwxsEBma+CjZAkFFxCs++w0q/kzLCChfXI4NEBXHhonc6s7DscHzN/L0imupsWcx6VHTwvq2zgxrl3L7ea18coOMNe4yPFjblzDzoNYYBZH1cvYMS1wEiE993YMw918ZZOGdG1TMPba1DLB8/jjhXymKXiYKB25+3AcWC63Jv9Uih8OEnhKnMUxf58+weXdp3PuTvE7XMFTF53MgR6kOD57vaO3pybm+4NbY1XL9HeulTYkH02xBBxdDjxN1/V7nRELPL02SmXVfXvABT21p7lhmcBB/jCxKEc1fYCZ3xWoIM207eei02UHPWSJH2xwank0r3s0gp8SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=juewfX3+bVPs3UUnJPwLiHAM8+YiZu2TBaOKskUoQvM=;
 b=tEd6eySr2guaDKhYvgSM2toiEGYBY41PYzHtxUlqdVL58eFPMI25VjU9MKt7bWOIfiTrZ+OFjZ1gQEujydkWj8LHb+JOQm0AF1geOWJelqYRXdYCIEPRDZUHGllJQTEdwCj8uXfikocmZd5bE8uABKBSWtVHvANmD7iNyh55xmuq+AxJ0mTAOiEi55xxW4Monng1YtGndGmTRMxZgGFjox39YtFxez4bO1XV0Hr41f0eNZ8ZVBeSA5V6YyfXvBZ8xkSY4kbvsKO4cVqOuYKQ9mgBQeV7Wkw9nHS+xOvveBoWyzazHuc0okfhFbc5nx00naTDHzw9k7U9ccFFwwi5JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=juewfX3+bVPs3UUnJPwLiHAM8+YiZu2TBaOKskUoQvM=;
 b=gLm/pV2L4bBdlK2eGqWgHVNBbesJ5xAciR07oSscAjwuDWhbxmVDd1JHhVuQfTAg/msgsOxnESqE822fv+1jQ0AMG6anxrddi+8I20v5g6iSXBK6YpfkOx4EheKZvQl1NQ5YAxT+K/Wx5LYZWKFHLoSp/pO7Tia5Xiujw/bigGI=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by LV8PR10MB7845.namprd10.prod.outlook.com (2603:10b6:408:1e5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Tue, 7 Jan
 2025 17:51:36 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8314.015; Tue, 7 Jan 2025
 17:51:36 +0000
Date: Tue, 7 Jan 2025 12:51:31 -0500
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
Subject: Re: [PATCH v7 06/17] mm/nommu: fix the last places where vma is not
 locked before being attached
Message-ID: <lravkk2p3gm4x75d7ut4d4godowaguliciuixs5exlpgfzpc5o@nwtcwqyf46mq>
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
 <20241226170710.1159679-7-surenb@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226170710.1159679-7-surenb@google.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT1P288CA0012.CANP288.PROD.OUTLOOK.COM (2603:10b6:b01::25)
 To PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|LV8PR10MB7845:EE_
X-MS-Office365-Filtering-Correlation-Id: 2171a4a4-0609-44d0-b959-08dd2f43ee09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b9P7FPNF9Gkc0H92hGdo7e+xoxUYHDW8EaD7ZYBYmsozKcxzibVjjBb9gH8E?=
 =?us-ascii?Q?5Xcqo9m4HJEpogq4O98IInV8H7G2keQpmBg4zC7VmTd2OQk1yAY8aUJCsR5E?=
 =?us-ascii?Q?UTZ5cmeGQBGQAh8jbiHUReh4TUQD1LClUJ0Pr3ZAhmZyEbWKLf8SHyfKe5Dk?=
 =?us-ascii?Q?SExeIy1I1iEJ1zsIS8IIAwtMBcMvUzmCQTczj6LcJjMAJiR9zOjbGa7NllGk?=
 =?us-ascii?Q?8JqZliZq+ORkayYcM7Sso4rW5vQabaSQm8Ni4DNDICScfrHTqusksfofhdUN?=
 =?us-ascii?Q?jDxkUUqymHH+sCZ1p8pAr/jei72dV4mWDtqIzz+f1v7jFCau9GonBsu8Iak9?=
 =?us-ascii?Q?AGrF0RuczSs4daQ05FWM1wdMqS4RpB3XsDaeXQoNIhNADd8EGfCiYs3icLi6?=
 =?us-ascii?Q?QVOl+RYLt0R4rFUBWQcb3mzpT9I2drgpDwgRFsMOmbpglo5yN23nP7iJY9Hw?=
 =?us-ascii?Q?ZPTxKOeJI5Tnj73aJt4sIakzLrQt1IBPArzRYZ2EU6aEC/fwfnAK0YzmVcHo?=
 =?us-ascii?Q?9sw7lFGoDo67khMTfjr1YXktBYkuUxL9La1a2NLWKQS5sM+36O9EaS/76I82?=
 =?us-ascii?Q?czRieyVtCrN8PqAqtPT4DsJVHH/jjV7Usd1LkzFlsxkv6yxSsMnasKy/mrUZ?=
 =?us-ascii?Q?85EOt6vmg3MCv+Om/2Ksyw7tZgmaarfSYiFIkb3suXwDqc3/yUKVXaht8vFM?=
 =?us-ascii?Q?djrgeH1DPwZoSbcqzZRSH1bImnBwIDetjUHQjWy8XW2Rh/5M1GZh/rSPESc6?=
 =?us-ascii?Q?I3aaJrMzywQJ59cXY9z7nhOShet6aiZ6wAda9i7rG93XrQc9NUhCFateEPaw?=
 =?us-ascii?Q?QemE5RGBTnrV7o1L1ZdqodpBGfIskZsJioWGWp3Mnk3LWQCyV/0dn9zlli3W?=
 =?us-ascii?Q?hkEpcbRYM5V24SRtmgAF5cdg8cN0cjA6nAy3E3fKjzBLYnxJrXj+MkZQq8Ki?=
 =?us-ascii?Q?D1JIQr7ufJE41ixmBiKS73S1+2GBj1D4k0/duzu4fFFziL1isCU7bbsFTIBV?=
 =?us-ascii?Q?24BJcI6FkDmzLTFjPLMNZja72nt8i2lNea5LBDuQCnBP/H5WNGEu8IdsdL/M?=
 =?us-ascii?Q?lbtZULyYrqlXAPENSjx49wlHYKttXyaebnRxGQH+yVfqsHUlXkdGVk1Cuq/q?=
 =?us-ascii?Q?xIsDj3aq3mg+BBO+jJ7tSRYMRhv+53MWzf5Z4eiUZ+2soUUAFiILNplEnqLY?=
 =?us-ascii?Q?hfn04+aSPcqK7SDcl6yAsffn9dA47YSwC/GQAUUoHSFwk7C7V2KKIfGvVVi/?=
 =?us-ascii?Q?CB1PVxjAHRTZbWvjHFjPP0GpiFiwDhGckFqZRn7j0VyFjz21vJ1+hrtPqrjZ?=
 =?us-ascii?Q?DEne7qapGZS7/+jijl0Ak/pgN9TVacSKUUsqzKI/3/uKqwLa0gwt3ltFaTbl?=
 =?us-ascii?Q?zd+JxMuyh7mL4IL2yMeR8sFKUD9y?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mAJM8mf+tIKG/j3zD34HV3hvAK4EZcou01wg7fINsXWsrzDfrobUg0bWOrtN?=
 =?us-ascii?Q?jqVW3w7bmvBK7f71RbYc1EX9QSEuDUcyMrMA8Fx1JMeUrd7TO1HxS/7P/hQM?=
 =?us-ascii?Q?g3n0UDuqL/wDzdsZmiYBUo8hUKmXdybN6SJ96SRi7ANaZkawigzbXlA9sy/y?=
 =?us-ascii?Q?ZiZH9/lIfOJbhQpKMtykydxRe6au1pRwPth+7MilgPmNgeedAkH7bWwLAEGv?=
 =?us-ascii?Q?UZ4YD60d0zt5HHs8f3QL0OFCuHojtzBZRbKU7dj3DwMvRslaMzDps0BGieKf?=
 =?us-ascii?Q?ka3VQxv+2n10nwIjDwjEVq2SgngD/qBztUYXgyce/TPUwzWS7EJ9L7DE+wdC?=
 =?us-ascii?Q?qUJ8KA/jsm0jPwgcvEdw1jUdhf2d2RW+OTTQgV5kn3WpataADkunM0+Mo+iG?=
 =?us-ascii?Q?m5QxWnyRA4x8fjhvV3pH2kFyvTJqklRfAZ1Th5Iks85qhnr9tXEvfesKN8YU?=
 =?us-ascii?Q?/1ATH9qASlyofvbWliNT8wF+Eod157KIk0SZzAXFasai5YxTh0wHeLmdiije?=
 =?us-ascii?Q?5LJM76hyk2autdAVuDE0qVIcwPr6HMvzo7HDsPWp2+g3ArzLDznn7N1UL6Zg?=
 =?us-ascii?Q?dfTjho8WD2WmmNlLqrteCbrdO6Lo4a99bl4ajyfavHYAN7kmrtuDh9maar8h?=
 =?us-ascii?Q?n3ejALlOPOmjcvEc2a2D//ohBZp3XEaRYajDTsf5sYia3p5dSvHzFHDpfD6H?=
 =?us-ascii?Q?2xuBbosg0J7udgtXYuACLCr0UMZtS6N5RGmCcOG/XC93RDPsDqxrwK0q+kw7?=
 =?us-ascii?Q?YBthDyvn+Qeo9n9LPFz/gNJ0YdJ2K0TPfol7F5rZ/k7nQBqkIDedtxK97smP?=
 =?us-ascii?Q?p9WRWLQE5gk6vs7F6HcAfUVQjzqCwcL2UCV/2A4HYTOdstL07uuSoBWx8u6Y?=
 =?us-ascii?Q?ohZh86yi4gnClX6Aj2zqLT9DFg8SWLv1ALqvl6RNgY1WG2QMvR23b2j+RUd7?=
 =?us-ascii?Q?uE/+1R+Gseey1P/gXctMKIQct4/Aa8tVGzijPW1hEWJihBf+D4GSMS9rBtqh?=
 =?us-ascii?Q?4leE6GJlZxz+7QlJ/RQxJJqUnADoMi1dpRsXvt7Bgkn47GIa1SpNShFBWbhv?=
 =?us-ascii?Q?pUde3svMpH39oPkIwC6ZAgP2c7utqfmMGBamDmo2t7OXdiR+Q1tEkayf2cHq?=
 =?us-ascii?Q?jLWxaGO/gmvahIAgW+T+NU10LBDH8n8B8HtT/IekV7M5NfoT3MEn12NlmYGf?=
 =?us-ascii?Q?1dV1Cppm0FAX15G0+PwVmoveZ9xuZPe24wXEvwK6Ak+6RSmPUWvh4TTmBxsJ?=
 =?us-ascii?Q?k/XCr/2UeAmgKqocJHUKCNM+UzwN10syD/P2pkF/vILmKQf1Wx3rpk3KCAye?=
 =?us-ascii?Q?lb6jS5rnNo2UaTtH6hHf+Hi1XTfDd4C12jHuVuFXnABuqjpGkJ6gU+w/WatC?=
 =?us-ascii?Q?j/N5LOFopb68FQ5Qo+oxs8w5MLqzc0ivMiKUySKDhbgpY7B+UAg7undVEb/L?=
 =?us-ascii?Q?j7DdlT9vcMq6sOuYbX2ii/FiyvqY4Gisvh0USsWUUvvHmpzs7sxvVBZbWOJM?=
 =?us-ascii?Q?S2cGBz9ozb44VzmUX97mRhYhAWe+2OXyQ4l+/tSysZFizuDngBN4ldfoetzG?=
 =?us-ascii?Q?8MwhDyM5lRwrIzqoPqC9B1D7hejt+XjpJK7hYEqD?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zJWztlkFwMIuGXfUD1nk6iS82zJjkz85avwN9ELu2VoqUt4le86gY9ndm6IJIeBCT+BIPPiL4Ddn+lyK+dTASM9MokXehLRQ5BnK6oCF2fBqbLC0c5j/isoU/TpxnN1LIkgUekDdSK+eB2mc+og5vde6+w0h5HGD8j4hILpQLbldJZ3FoeCdaqh5JfnBOF7tDvfkw25Og0hwRFSByqCEUDpLrfku/4HTV88DHG3n9dge94PUP0sit1gLakw3SRdacYivXFEUhqQ8FfjY0AU3YYP/AIqSt1YsFONkDCz4Xpc2D7/KBn54HCAkjWOylkZD4jGZbQTKgQC9cxqU1+6oTCLVA+Ng7GRIIztVN6woGpVlP5igzKu/1AKm1nRKJYLY8ij81TdlmuZc5RIo8uvSJy+pLlgg31jJ3eEdvoCXFY9oI7+PWv7FQ8UYT4qJVx4TMvlJAwdNW57plQ4Y+H7405DKlrtCi86vMk00qJMuItty/S3IpiWshTgCzX4iWUcOpEuBdrpBqMiqWQQNBNEy6ui+UXouT9xGZTlaPNwS/vZz/4okQP1DNLVJXDHvr54cIeYsTbK5InJlUTtLdrMwMLc6Jh2XbvmSPzhSCpxzwwU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2171a4a4-0609-44d0-b959-08dd2f43ee09
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 17:51:36.0674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HHQgKCavS/ZznpLNktXeFkpSBUIemTqYrm5wJE6oI0NP6KyvtXJyRnAf8cO4rfFTfK0pm/fP2rPuhtSMMYzocg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7845
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-07_04,2025-01-06_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 adultscore=0
 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=874 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501070147
X-Proofpoint-GUID: c-da4Xnpx2yMVhgSO3lXhujLQv0pD11-
X-Proofpoint-ORIG-GUID: c-da4Xnpx2yMVhgSO3lXhujLQv0pD11-

* Suren Baghdasaryan <surenb@google.com> [241226 12:07]:
> nommu configuration has two places where vma gets attached to the vma tree
> without write-locking it. Add the missing locks to ensure vma is always
> locked before it's attached.

Does the delete side need to write lock as well?

> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
>  mm/nommu.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/mm/nommu.c b/mm/nommu.c
> index 72c8c505836c..1754e84e5758 100644
> --- a/mm/nommu.c
> +++ b/mm/nommu.c
> @@ -1189,6 +1189,7 @@ unsigned long do_mmap(struct file *file,
>  		goto error_just_free;
>  
>  	setup_vma_to_mm(vma, current->mm);
> +	vma_start_write(vma);
>  	current->mm->map_count++;
>  	/* add the VMA to the tree */
>  	vma_iter_store(&vmi, vma, true);
> @@ -1356,6 +1357,7 @@ static int split_vma(struct vma_iterator *vmi, struct vm_area_struct *vma,
>  
>  	setup_vma_to_mm(vma, mm);
>  	setup_vma_to_mm(new, mm);
> +	vma_start_write(new);
>  	vma_iter_store(vmi, new, true);
>  	mm->map_count++;
>  	return 0;
> -- 
> 2.47.1.613.gc27f4b7a9f-goog
> 

Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE66919DF7D;
	Thu, 19 Dec 2024 17:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734628676; cv=fail; b=nvYcQ0+VwW0B1tiHi5KcA1laPB0ajLYDMIV96ryGXQ6H55ajjrsT2PjlDWapxDif4Rm9idA3SrHUkasdjdY5vr/csSWZ+JNEDD1zYnZuSOaKEnjfzCwBvFEhhh9w9cJ3Thc4I8Vy6SJQ5lTeZ+LFyKi669pslDnt9wtbNMHnnAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734628676; c=relaxed/simple;
	bh=4l6EufOwORNKAF556N9e8nX6TyHZcK7XK7wiPNlWkcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=etLo+jrKevPZtriDZyZAhY/oRfYeueO7mAj3O7FVmh2wYJ+vgv3qJMZbA8gx6vN1mshLzM1xDLyQhOBd2605oWkr0T+1uVs8UqEVgsgA38kylALbO7yXUyGqrFo6gDuOXLi8qbeh2ZV7EucP2nzdcqNSJweOS4/+5rSr2PgWHig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ahUtxs8P; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vyM/KxcB; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ahUtxs8P";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vyM/KxcB"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJHConS011199;
	Thu, 19 Dec 2024 17:16:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=byaKxgoUvKJ0WIphzB
	O4O79RWdaPmnR25H+q98njE2E=; b=ahUtxs8PKpTV32Y3b7l+jXGSmd0E46jR0s
	mItHb5m802JYqyIzpPelEd3ma6Xdixvow3WY/PpWr+GdsCh8SQBourHV6DlGIRq3
	F6vRFC54aez+iequJHHL6DHK/yUb4ljm+WI7Ku9ztx2myAuicMWF9nVIuwQ49NMB
	b3mB4OKj767KV5E1p8vVts5zlCPRahP3iHZp2wuL4rhumqay9nJHyubY67Tjn40w
	jZCbDAzkT4AOx8pCsiUhjQNXExMt2C5tLmRw3RSxp+azcugBKM6Yx9s9g6X1W2n8
	cNqt+H/vcpKPWfXVo5c9qwSWmioUuLo3IREmRo7TUMt2JgteBZLQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43jaj5h9pf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Dec 2024 17:16:54 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJGMojv035296;
	Thu, 19 Dec 2024 17:16:53 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43h0fbfr03-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Dec 2024 17:16:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lhOlETZOHxGjCIb9L+8+qJoLhMFROecLFcS86hiVv6RUS4qwiAI7fE5uOxmdNyKvgSfUQPX9rG5Lxq0KPoO3/J8ZugvshqbtGjOY0Bb7JTszglyqV0oWTFCZRDo9HXf6sxpNlOMpuZgubjvaHJnpNXyLhAO5AQc2/ZYEDUSKUgf+pe7Lbl2ZVQfCUwnMeRLM7SOgbllyCPSBo8apRYJzGfBfTr8FaFbY8pzJO/dQE0f4Q6UqD6bcI+ilm5zuZa/PJF0Kevxe3Sp+HRu8B0cIYpa9fXZ1ghnXG+tiQ11dg5H7b6J1e+eJZg0lI87mtJjrhkPTkcYsPyNkMuWV6CQBrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=byaKxgoUvKJ0WIphzBO4O79RWdaPmnR25H+q98njE2E=;
 b=RI0uBMWxjuRTSRNSONPT0DYmz5W/rKGX4dcJhzyk/wJX+R72K62sjIvazKgTArj4uEDvKpnaLyrJ4guUCWkGSA/xL9nj1HD6r4rP6n6vVrn42fQlkjqp7VI5jBFQQ+0vXszW8SXuLPsqgUpfohFllYlg3duTpzBYUhN5G2eaE0hI6wYO6gRzqYpEdx9JjwxmcyuCnCAIePzp/inDtDrmSMHP3hNcWJrLtzyotsIcJjTy8e71QJ7Sxq+I2KAi50vqoxB/i70LVNjLtbiNRc3RRN2oyUeOCz6h0+xn/GiKzy+7JDUgBp9BLgsA9zx36fi0C60V5H1GbO6UYKX1l9QArg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=byaKxgoUvKJ0WIphzBO4O79RWdaPmnR25H+q98njE2E=;
 b=vyM/KxcBq65a7qd8nwCPasJvdkzXBOgH5t32oDPJEyCsD3+Ca0EpZfpRzPEj9MddkWXjZHxoDOpKTiCKI79X79aKMzV3kawRv6dEfyf/dP9acTAgvLm/tSIA9569GWIzwZIvWuA/4nSBm78MHDfldDqv/juEpabADpzw4wNdvdw=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by DM6PR10MB4266.namprd10.prod.outlook.com (2603:10b6:5:210::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Thu, 19 Dec
 2024 17:16:51 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 17:16:51 +0000
Date: Thu, 19 Dec 2024 12:16:45 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org,
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
Message-ID: <wfzu6jvbazlxdybsjc54aoivleif6memaxaacd56bcep24nkv3@s3e3aj253hd6>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Peter Zijlstra <peterz@infradead.org>, Suren Baghdasaryan <surenb@google.com>, 
	akpm@linux-foundation.org, willy@infradead.org, lorenzo.stoakes@oracle.com, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, oleg@redhat.com, 
	dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, dhowells@redhat.com, 
	hdanton@sina.com, hughd@google.com, lokeshgidra@google.com, minchan@google.com, 
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com, 
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com
References: <CAJuCfpEKg_h5pw2AxdF1wmFMt4xdOxYqv7U1uVMYcuSCB4kHuA@mail.gmail.com>
 <r7polqnhdguxrz6npklag5kjy7ipbj5lrnqai2qm3jt7x56hci@cfrcom746iae>
 <CAJuCfpGeRi73E94VCDPDGAGG+5-Sj-_YGf3JNnf6Bh4GH_M6jA@mail.gmail.com>
 <CAJuCfpHJwVXanjG0WGjo0KHHEbg1-T0HWTZqDpssoq3FvfG++A@mail.gmail.com>
 <jes252u5qfhla2bdmg6pdkfpi4a2jfhf7d5b6ra6ol2bmt352x@gunhzaca56df>
 <CAJuCfpFSD98fw=844AJPy+LT5y=zREQGtSEVj3_FCXiZ5cFR_A@mail.gmail.com>
 <ulbspoec633hfm54f3jzvoqs6ilskxou3qykk2u727pbaltvfl@lb53vjcaxnuf>
 <CAJuCfpHXRX=LLa67eWYvrK=UDxKMaOequFXfqOqDHbRrmsT9SQ@mail.gmail.com>
 <20241219091334.GC26551@noisy.programming.kicks-ass.net>
 <20241219112011.GA34942@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219112011.GA34942@noisy.programming.kicks-ass.net>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0212.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ad::10) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|DM6PR10MB4266:EE_
X-MS-Office365-Filtering-Correlation-Id: d21965af-aea4-469c-6d05-08dd2050ed69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UPUiEhvErDsmNzrJwMFNiBggHr74YOtaeix6lAGd+0Hw/zSi00Lj6zmW6eaK?=
 =?us-ascii?Q?sYhyZvOezmE/oYiT1zm7UzAVxxHk7caadVWDPp7XWP51UZYzV4ROBCOCWiB5?=
 =?us-ascii?Q?QmoHFzmO094IGdOGLV4nl2dfQ7WVmYDOaZNji8Dji1AilTsNZn+n7qxvStyS?=
 =?us-ascii?Q?QN37/9ceRs2zuBhi77lVijqY0HINIoGKbZSGkdlhrRo94hgeQE3+1Zh1xSZo?=
 =?us-ascii?Q?cY06bFn83bY4XHonpWa3zXJlbOhXFNQs+Hw2o+sbpLS2llYhu8YFj8cp6ftV?=
 =?us-ascii?Q?vfiMSLieenq9d/nxqAb+zme2qK4d9vE+oioB8/zJTBKqi/B1p1biHlmTu36K?=
 =?us-ascii?Q?Z1qDe6EkFH54mWZU5IAEjA3Z037idnJHjvnf517J+cpl1iunlbU9yL2ty1T2?=
 =?us-ascii?Q?hPZoDkLy4LdDfGo2D+Tlv/rF9PburS4WoiK6NFZvRHAGrWAkNB0kfI7wWqDR?=
 =?us-ascii?Q?L8fVw1P/ddstcr4TSH7us0l3XjWDPZHFuywa9JhU5vP9DDFWcnhykXwSCw+h?=
 =?us-ascii?Q?/knkqIOaVSj+xUW+genpEfjfkofe++miS9ektNHYCtvcVniqUdqpLNDaMpls?=
 =?us-ascii?Q?pzrmhMmRqo2qnl+FHQ2PRKkqnqowR3G3YEQwHB9kU8A1juiQYhPHUUYnbDXl?=
 =?us-ascii?Q?SrCNbM+eHN7BtpXp0K/vBwd1jBT4ROGo9TZmBGaOIa8KOp4t+K/tNSEdzgFE?=
 =?us-ascii?Q?1fQJU+aSvV80P9KqCJzUbxxLrQBRqAT6hzXUrqI7a8zlvWiqqxRAPxQP8G8t?=
 =?us-ascii?Q?gmDgTBbyusNLijmeUje/q8FpmTqiGY7OBQtUbsjiCGLxkrjdQ2wlwFnfSD82?=
 =?us-ascii?Q?ctspkF+p2rrge7AZxAmhKXZ5vVQdrT9c2+QKk2lc1nKegtFOxaZhg/B4Dk+w?=
 =?us-ascii?Q?OdQQ54/5ZRVQ0YhsaZtc+GmNH5x3nyjB9fQmCjfJNSC7tdJJelzhdUS57mZW?=
 =?us-ascii?Q?FkC0G8VpzSTUFWRDUpIHbKGTPJOxHwHHPhtH/Ap+zO2VkZaIb4EJwsgd95DZ?=
 =?us-ascii?Q?Y9xxenHMSOYuVbjJnrRbv75m0CF98HshrfEzuX/yc6EV29PPxOJQzzbz4CEU?=
 =?us-ascii?Q?7oD2wEClA38LSMzCzocnULt3wWgRaaORl8DxcLBww9UuIOCHJ7baXAScBofA?=
 =?us-ascii?Q?Fvla//kOSxloJKQjXuKp9vQS7ZGiR1CcZzAe7LcqXKVhpxM11bO9UW+L/CHx?=
 =?us-ascii?Q?IHFK/nqJEDQ2ns3V1ExzKHCxSqeXvVkkT7cpF7KqGMIwdWvhAFXo2SmxeovZ?=
 =?us-ascii?Q?EcQ7QOoOoJGQPFwqxCXvBjvYB6nnKql89m/AOiDHgX1lhp+6/H+7nkODNpja?=
 =?us-ascii?Q?JpBY3/LvlNyJSL3Tn/ETMgDT9mIlWS7tckbOxebAOo+1cgAo8r+rr0hMPbOr?=
 =?us-ascii?Q?k4yLKy3XQOSFTOs0oIYerYJKGRYr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sR5Swgae5/VyHkLAfSVs+Y+ZS8AyIVv/93/4F6gONYv3g0kUztwuP9qqcN6p?=
 =?us-ascii?Q?1VIxoLwTOxvzWa7DH8PdBHR56HqpFYrep/9zgjMzSoOPU+PlAseu9cnj2I11?=
 =?us-ascii?Q?CjiX2zSyxqn7a0wRgraDhdSRjG30HHlfyP9ayScC0AxbgiSULHnc97CLx376?=
 =?us-ascii?Q?lWVKX2Fq6sgsT58iP2qUvnOsy9V0yiJC+j6ntyymeOTKWy9Qfp7gYxOJ9RMA?=
 =?us-ascii?Q?IJLU2guky09YH+IEtzGdkOCz/JHXPR/4GZTfJDfQzPFOqxgi9XdErcNlZNBR?=
 =?us-ascii?Q?rJDT2M1aRT7RpqtbSLhHua9pfdMmGm6JqrHZVFNGYZ4ls8FR5x9xbc2sihNk?=
 =?us-ascii?Q?ZxDy8BjmB+h/sMt/S56skSHpq1Vrjk6ZFghvir1+LTtIgZP3x7ausedtCpHN?=
 =?us-ascii?Q?EKb21wZFhQYK3nGmOIfslh5SDNSwLtdwzTW6Da3jr8E28SjzMLHJN/ca2sQW?=
 =?us-ascii?Q?5ENjq3RIWE0LCBOv85paN6IkzoR+SRAP4FEr2/kw3fPBu9RCj8bqS6jLjYx5?=
 =?us-ascii?Q?LgkKfGdNM05GaqqZlaRDfRk33hEMsdpMswzpBJz1cJ1JJC2rQG68Hm9x16m5?=
 =?us-ascii?Q?nX+Nldwz4DJM11lbXJxMahvm3EO+MWTZDz9oFSqkZyKBV+EJizZZidmlLLsN?=
 =?us-ascii?Q?E+imB3pqsXO00n1GWFPOKy1oVVPp1G1Ki42F/3P3sAGrGo+KFOCf5J7oMFAs?=
 =?us-ascii?Q?KnEYyNHQWCHEFI0+ne+d+B2NCLQcJtfWbIJJVHlB2mGyOz5XBlHMCDsPgJ9c?=
 =?us-ascii?Q?LDxoFBRmLJGSCsZNzuieD/UQM4yFM1HV7ICKEsTY5aw/ymd2RAzf2E+7Ps5C?=
 =?us-ascii?Q?nuSXzo/dbE4zJc4aKuIsFqpsUZ2lPrhaicxxOqMEGisKiw8PuEPxQInlyoO/?=
 =?us-ascii?Q?JWooOGM4VxX3urdlUtGw5oqc4HltkhwyEd82AWhkEVe0WQ7xMjgK8pUBpMfP?=
 =?us-ascii?Q?Q0HlK69zuN2rZP63SlIjkSZmz5Vkk7tMgYnau45g0CZ3BxGPNDR/wnaaG6pF?=
 =?us-ascii?Q?c77g3sdJRDR9h7JKRHLGN568bz4RUOseEK5g44Ba4MIE3tWyabdq9p9RWAuD?=
 =?us-ascii?Q?GNawnoGzKhMOtNnzf2rhKLorstkVIwmRrb3OvP0nCjYOUERgp9vXiXmNferW?=
 =?us-ascii?Q?xSZMOgKo/ZoHDxrncqZ73qOKrTfdWUz9n1sIMKP8d043vObkp3zvs/3wYmfl?=
 =?us-ascii?Q?heJOLoYp2fBRwWisC5JVUoyNna7w4LyT3axeMOAW4TlkRu7Yyb2M6YWJYsyL?=
 =?us-ascii?Q?bKUPjx7WmHSYCNzeIf2gMv95CGrZgGb3xmdpGA+zfPFTU/CK1P7jOo4N0rnc?=
 =?us-ascii?Q?CsqmUYZ+uMg7AcYOV5fbspgnIeNwCZYkFdW9VjQUfxAuUeZo1T8w5YEkhSze?=
 =?us-ascii?Q?1Fp2aLlo6b7tPTSobh845+aV5XVieKC1JnYwVsBJtpwidgrGq6cs7VructZb?=
 =?us-ascii?Q?5gg2X+RD2QQZchyF8FIlPmzHDtc5KufdaOVvoRK64eF/LJDS6tHp7xlIsXeV?=
 =?us-ascii?Q?747RIZqAej9QQX7+RW1j1eM+hKc3olm5UGejQSBSTcdpIYuDgzKpZZVqeqlf?=
 =?us-ascii?Q?OqWiCCZU0kfoYoCjv2V2F59x4TpwPLyPE0mH0hGZ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aBHOMBy/tXduh3hZDitODLHz1Nl0skBe1ExgO+tEa1qIT0qVTwIagfoacxDxH5hKKmR5lqSV1lLJKJ1tko4JN0BJIPWWqMUgIxK7+IvhobBjG3XtFdxsX7Erre04cKgyIWkAsGpuNNhOwXkSjRIUYfKM9fOMTwnMRjDrJcM8J0SWZGluqJfLA+1sijRc3ceQXus5802kp57gVMHnzKFG4lzhuLtv1NSRf+VNpXzCWJDicZO8WwotlErG7zhaTemnXzZGqVXhXeHzCYEshDouKKCk+i6KofcaL8tE/HkwxGUC9i5hn7ebz5TjfJLgnsw1q7ZcW84WJMIX7yMzJCsHcBFCzDVaK1TkgWOVVOUrwXgnZgCDmmd1v899XebM0pqQuxN4xwzWBmqf0PZP73heSUugIhwCjkeIHzb0e/SsF7dN28kY2viWHBm26zzHyoW9hTVHlwA2Y896PA2dyvQmr/ckyQQmru4RbmcVJkiKCzQJJDDh2mPjCo/rGNF1r68ajarEeQyQJ1HUQI+g3eZTF+vYxFArL1iDK6zlRMMhSHL4rlIHknDjwlO30moFFwpO7dhLzbVHC/collvTc8rq/GZ7gWTyiZTGeSYR/QCsbyw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d21965af-aea4-469c-6d05-08dd2050ed69
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 17:16:51.0511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UD4eZRDTRThV0i6qsYgCWu09r46NoGRo8tpZg4xIbqUAbGBcH5KN+YU1IavJETc1aqjbc92wa2vnwFG2dX3rRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4266
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-19_07,2024-12-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 spamscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412190137
X-Proofpoint-GUID: oh5LzTHZ-9M5U2m-V73J-S6tN1YzeTTV
X-Proofpoint-ORIG-GUID: oh5LzTHZ-9M5U2m-V73J-S6tN1YzeTTV

* Peter Zijlstra <peterz@infradead.org> [241219 06:20]:
> On Thu, Dec 19, 2024 at 10:13:34AM +0100, Peter Zijlstra wrote:
> > On Wed, Dec 18, 2024 at 01:53:17PM -0800, Suren Baghdasaryan wrote:
> > 
> > > Ah, ok I see now. I completely misunderstood what for_each_vma_range()
> > > was doing.
> > > 
> > > Then I think vma_start_write() should remain inside
> > > vms_gather_munmap_vmas() and all vmas in mas_detach should be
> > 
> > No, it must not. You really are not modifying anything yet (except the
> > split, which we've already noted mark write themselves).
> > 
> > > write-locked, even the ones we are not modifying. Otherwise what would
> > > prevent the race I mentioned before?
> > > 
> > > __mmap_region
> > >     __mmap_prepare
> > >         vms_gather_munmap_vmas // adds vmas to be unmapped into mas_detach,
> > >                                                       // some locked
> > > by __split_vma(), some not locked
> > > 
> > >                                      lock_vma_under_rcu()
> > >                                          vma = mas_walk // finds
> > > unlocked vma also in mas_detach
> > >                                          vma_start_read(vma) //
> > > succeeds since vma is not locked
> > >                                          // vma->detached, vm_start,
> > > vm_end checks pass
> > >                                      // vma is successfully read-locked
> > > 
> > >        vms_clean_up_area(mas_detach)
> > >             vms_clear_ptes
> > >                                      // steps on a cleared PTE
> > 
> > So here we have the added complexity that the vma is not unhooked at
> > all.

Well, hold on - it is taken out of the rmap/anon vma chain here.  It is
completely unhooked except the vma tree at this point.  We're not adding
complexity, we're dealing with it.


>Is there anything that would prevent a concurrent gup_fast() from
> > doing the same -- touch a cleared PTE?

Where does gup_fast() install PTEs?  Doesn't it bail once a READ_ONCE()
on any level returns no PTE?

> > 
> > AFAICT two threads, one doing overlapping mmap() and the other doing
> > gup_fast() can result in exactly this scenario.

The mmap() call will race with the gup_fast(), but either the nr_pinned
will be returned from gup_fast() before vms_clean_up_area() removes the
page table (or any higher level), or gup_fast() will find nothing.

> > 
> > If we don't care about the GUP case, when I'm thinking we should not
> > care about the lockless RCU case either.
> 
> Also, at this point we'll just fail to find a page, and that is nothing
> special. The problem with accessing an unmapped VMA is that the
> page-table walk will instantiate page-tables.

I think there is a problem if we are reinstalling page tables on a vma
that's about to be removed.  I think we are avoiding this with our
locking though?

> 
> Given this is an overlapping mmap -- we're going to need to those
> page-tables anyway, so no harm done.

Well, maybe?  The mapping may now be an anon vma vs a file backed, or
maybe it's PROT_NONE?

> Only after the VMA is unlinked must we ensure we don't accidentally
> re-instantiate page-tables.

It's not as simple as that, unfortunately.  There are vma callbacks for
drivers (or hugetlbfs, or whatever) that do other things.  So we need to
clean up the area before we are able to replace the vma and part of that
clean up is the page tables, or anon vma chain, and/or closing a file.

There are other ways of finding the vma as well, besides the vma tree.
We are following the locking so that we are safe from those perspectives
as well, and so the vma has to be unlinked in a few places in a certain
order.

Thanks,
Liam


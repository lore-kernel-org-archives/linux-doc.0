Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4047E197552;
	Thu, 19 Dec 2024 18:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734632356; cv=fail; b=CUk7BxZTIiFAEwoRdDuhL3qc2fWmHVVuMkF2VsQIvZikCkCoKYvcZXTievNyH/k/s/LfihIyViEK/CB9oxJe89ERrKMz0KVNgzxI9COcL63ioWmtAsde200HQ4XjzrqZHDyF3W/ACPjfS7T83f6cjGDGpRzX0k5QtHRoktu7LNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734632356; c=relaxed/simple;
	bh=dVRNybQ6wscJD3Pj8jNyg+4DVmcyou0wC6m/fUnt3A0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KX/rtCJ6lEkv/aHJxDlTYvxvFFsdTO6FjsD0GLuCaBL73y/AZelI2pZF9CVESnU18Wdw988HfcCA0i8pyBP+6wBodHQQBkDMV6YyvIv0QPrVh7j6YPI+1WE8J5EUbvF2KM8Ifv2axXeRIJe98SsNm5MCal/RbODxL9ljaNXB3f0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=eM5oAD9B; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tVJwNX9J; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eM5oAD9B";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tVJwNX9J"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJHMoF3028279;
	Thu, 19 Dec 2024 18:18:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=11G+Dq65tDIAOaetep
	plPuzrqKSS/Wefi0Bkvm0vaaA=; b=eM5oAD9B8hEoh5yORTP3ZW5wr+lJbiI/yc
	Q4pAGM/Wg6ky3SRghoN8SsM9t97UW1w6x2HIQxJgS/F1KKFg0QAgAceSWPbGwYXs
	0EngdXY6ppvzhKO3yPw1+fnv9do5o1TnUNzXsE82bJ/J0jbCEJxjS5Z+/v1KB4ky
	hy6+BiHDMm7JqbaDwMk+TBe3gbAb4XffbK8RZXlZgrijIywNGGTeL13yqCiOtNY0
	LRKoG00AFyGVdK+YDlpyT2P7KllXAaCvNf0LIeAFv4ycgNQqaGoIU7VGZE5K1NpO
	ZDmlmo0GzXeYCZNvMkUgLVr6dV4fC+ikc2wI4atZ8a4JupmMbcRQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43jaj5hdkm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Dec 2024 18:18:33 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJGvIth010845;
	Thu, 19 Dec 2024 18:18:32 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43h0fbchc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Dec 2024 18:18:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bBPav+VRcM2+dtKQt/pHNJZzMMOtS+XqFNn7QKNACQ12cYyU5uLWggY2yeb3WCq5t0m9VqUJDFVH6PFNofcfOVxqsFxg//iruq4lwoqC2C/L7+fQTPu5sh+PUraKcEMuP1Z1vM84/BuEAXR3thwT5dwSAQ3hEMO32gO6q7DDuu2vJD4WhPcuxWxaZXLNrdgTGI6N9vvDaFdkaYBTL1oMnwzmfovxd5fbdfVlRWjAorpS0N9719ZTsp7SJqzvqtSHWZmmTT4sHZFggVYUrAbAIJzRAhlLlm8Gjs71qN6jWGDirtVsgFSqD+ptnawevIAfw5a08+TtPVt/ueW4EVimlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=11G+Dq65tDIAOaetepplPuzrqKSS/Wefi0Bkvm0vaaA=;
 b=bW6RgciK1KP4s/aetnWEqN7i3XgYsKENXXAUwHMG6aI2QqOaMDBpznwTy1RBMMWrA/KEVvXnU1dAv3WhwyO7I2o/tYmG8op+cOMaklLwS6XjMvWmoWUVyylSujhd+sghZRJO2QLLaT/2RfG/EDGxxDtNAG3Dq2oJQLs7St6tsQmFpYapjQju5dZqenBGXsRT0JWW6YvGPvIcvvg18VK+QTdbPgdEs2OYqmIzKNLJOM9sS2L+kEwhOSyQP3iQu7NfU6calbbthV0TeGcNkyuaUCbAO2rJOi/RBaNtCu7B0nJfuSWJYu2SLgCnYsuqGRDTv91Vk5/iZcx03c33evefWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=11G+Dq65tDIAOaetepplPuzrqKSS/Wefi0Bkvm0vaaA=;
 b=tVJwNX9JxDdBEkm+ZsR6kS/XY5+Z6bYSEaOUHVXfWmSL2ScEPxyRLyYWfgdq4LlQjz6TAuk+Xb5JtOlocfLoVmodwBPVqH3xOpHU41X7aQr3R8hlaGgYgiVx3jCqGDQR3Xv1PFIyjS8nYpU6SFx4X4CDwDHabpOS+rMl+4JZmXY=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by SA1PR10MB6591.namprd10.prod.outlook.com (2603:10b6:806:2bb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 18:18:28 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 18:18:28 +0000
Date: Thu, 19 Dec 2024 13:18:23 -0500
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
Message-ID: <rnanfpzs6fmojyeaowt65mug6xekorrkeefvn3b4zc7buunzhc@rrzcbhkrjdv4>
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
References: <CAJuCfpGeRi73E94VCDPDGAGG+5-Sj-_YGf3JNnf6Bh4GH_M6jA@mail.gmail.com>
 <CAJuCfpHJwVXanjG0WGjo0KHHEbg1-T0HWTZqDpssoq3FvfG++A@mail.gmail.com>
 <jes252u5qfhla2bdmg6pdkfpi4a2jfhf7d5b6ra6ol2bmt352x@gunhzaca56df>
 <CAJuCfpFSD98fw=844AJPy+LT5y=zREQGtSEVj3_FCXiZ5cFR_A@mail.gmail.com>
 <ulbspoec633hfm54f3jzvoqs6ilskxou3qykk2u727pbaltvfl@lb53vjcaxnuf>
 <CAJuCfpHXRX=LLa67eWYvrK=UDxKMaOequFXfqOqDHbRrmsT9SQ@mail.gmail.com>
 <20241219091334.GC26551@noisy.programming.kicks-ass.net>
 <20241219112011.GA34942@noisy.programming.kicks-ass.net>
 <wfzu6jvbazlxdybsjc54aoivleif6memaxaacd56bcep24nkv3@s3e3aj253hd6>
 <20241219174235.GD26279@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219174235.GD26279@noisy.programming.kicks-ass.net>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0082.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ff::6) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|SA1PR10MB6591:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a9cd311-c6b0-438d-77e8-08dd20598954
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T92fcStW6aaD2MokT0m7g+9xEwKuiB1+uAEqIw3DHHDBOF5M6KIFzLwIrtvH?=
 =?us-ascii?Q?FUjlP5FFXh/a4h8ohZZbqj8f7SCJqKuOS3MO877hl2tEv4DAKgYTAEkiliPq?=
 =?us-ascii?Q?C71tp+i4EyAhuXPhkoRGXS0LCYBphF8XQkbV2kT4f19UUEbzhLmvBnmlfgAf?=
 =?us-ascii?Q?SrXcK6DzdcADMtw7GRkKX0GDyaJPPZ7xgiPuDdTFE/vapBjg4viptmjz2Upd?=
 =?us-ascii?Q?1hVDdpORBVxBDAAhi5AgW9FcmKcNClTQfMYjJVFQuvX1aj2Dou0MJEaCJZoD?=
 =?us-ascii?Q?6g3mXQBXNVJ/5NaPsyPSMx0cKFYhafaO6rmsmXkq1y2EvTLAJeQnvy1vSO1l?=
 =?us-ascii?Q?jMkJULsGLc31zEyuen9hzOAd4KH4SdMtlPQqfO2Hq2AQC9P+eijHltEjSz41?=
 =?us-ascii?Q?JTs4JIVDEwkLzG+LrydwmHL4ahsJ1Rv6roazuktXKuqMPGeFBLbg6gqq5moi?=
 =?us-ascii?Q?D8cfkwo2T0/U8PjEv/m5XARtG2OH56lBqcFopfA17OLzD9upO5Ygk/LL/Sxt?=
 =?us-ascii?Q?12QWU0zYOqir3rTL7WvpBwZ5VQuFuBbV5QDfdIPBjf67GeCY8/VlJIGkhIox?=
 =?us-ascii?Q?DYYdpp9260Jvxub1cykpHWkXEIh2RXUVe+8Ltp35ye5OPE6iZNURqTooQb1k?=
 =?us-ascii?Q?kC0TqWbTrklr6QopkIm5s38ew16zUjZATnxCOJQ7NivoSUmgCVV9XGo9sUb3?=
 =?us-ascii?Q?MhCGLADuGKXw/kSmG/hf3IIir62yza0f3ZjENqdNrzUs17e7BCdkKb8o7gSE?=
 =?us-ascii?Q?tWv/iYDWW7DPHvbGDFCzGWhuOVF8XpO6vgAlbZqyYhBOjffMt+NSB+9j3IOb?=
 =?us-ascii?Q?cjtirBTQdUrU4MtALyEUQCiCSu3ijsqOj5ZPGrQmaDA56mqHS+3K+9nQtPqr?=
 =?us-ascii?Q?KCiWcpbV7T9vXGBzLFIrPuvVKqDBp7fEl9GBwc1fFPTm3OxQOwdzNlc4gLwY?=
 =?us-ascii?Q?AzKawPUG0LBu+s6lJcPQxdcDc5aVz41Tm5hcmSEmsMkaSxba937Nn5Ukto7+?=
 =?us-ascii?Q?CnXsurriEBe0NXkQiOVo1fcsm8rERKH9/nKKm5BAbv2XCAG/ZmA5mUMFy6sw?=
 =?us-ascii?Q?Xn7mbASKCfd2xfBkzfgsCf8RZBgjdINdg7hiurWmg42PsXmpxslMnvRw20SI?=
 =?us-ascii?Q?MOOk1T9JOhGAwS9x0UIqHDMgon/iEDiBQhhuSBlkptVymdC4dBNJ/XOzm41m?=
 =?us-ascii?Q?wCcVaBNFz7ocE6mBTRV2hpFL164Xx8z/cN4YG5TS9O3tlSuYA967yzSWVB0k?=
 =?us-ascii?Q?ybNxFc47Lhw4K7QN+6bfWOO9eUl7acCGMbAxRknbi7BnhCqkeFSY1A6qPvYO?=
 =?us-ascii?Q?EmX5dAOxg7LXlWsWNpxIJSeV4YjVv1DJgIJNdmA7mD0MPwO2UnMF0OarvoYB?=
 =?us-ascii?Q?qScQBXhif0y6AOfalsDAO5uxOhO+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yK1bOyKv0Eow1xglV2ZBWlTehDQRZKwOPodx5urOVA8DT1vWNRZ7cNqZHFee?=
 =?us-ascii?Q?+XQISkwffvowtcp77OsIWXwTt/54uhb8iGiiFZMAuOXyxB9wfjtvlRNbCYm/?=
 =?us-ascii?Q?JimLfXdEYlXiBSG+PLLPSGlg6TZph1IXJHgRsoyinwMnrdHNIOMDjx2gbozl?=
 =?us-ascii?Q?/6yg4wkJSTwpiy/UdLyfnmh12rm+UyU1Ex++xoBORgiWmOKw7QrLnilYLmB8?=
 =?us-ascii?Q?x3citsD2e6iysC1Z6tI9RteKzOYov/KhsUCQ1+xqoQMMX7E8UJJn3aQidw+0?=
 =?us-ascii?Q?mJDZGSP0SeI7vFJZU/qPxtDa60y5VaP0t4SGcRAumfuaV2texnWtvSsrQ21h?=
 =?us-ascii?Q?+TB942DJtao+bfCEwhhTFmxpkMne6EzMz/xSybwhMx0OrbB4HciJSAlTtzLv?=
 =?us-ascii?Q?x6pmNn1avRy1mqD1OHnFoHZLzZrMdMY3YFuEaeyZYCnRlDLyo6TCPwX1J+Lg?=
 =?us-ascii?Q?4wlZuMfi1ZtAZz4p1yYuOcFsuypFl8HbuY52UX2EjJjX/31UkvXFoPwIovfc?=
 =?us-ascii?Q?b3bYgNSHneVRGTH4uSvgL9gAbaXjV4zjsGB/OwOcRzp9i7oqRwfqznJ3lOF6?=
 =?us-ascii?Q?8YWbYXWwBbytEtztIDCGYDBAOVfjLuFMtE6VnenUmAmWmnodlPP7sS7mIDt3?=
 =?us-ascii?Q?6uYiEW6Iu2YUqrWBlP71OmLSuW8Ja0uwr3ecziB1PHbyCptB5fqkZGS1Yz4z?=
 =?us-ascii?Q?2N28dn4FMOzMlfb6tuZNOuBc/jJaNyyFmsjTnV3Ma45IOlU0OU30sLPC1lBV?=
 =?us-ascii?Q?nnN8OlHTXY4/QDVmRhJxfC8o+VfnXFYcGg1Zx6pSzYSd02bNCPkY6tGLDpSo?=
 =?us-ascii?Q?/if8C8CRfFuxnJZMbKNbyA7sf0FSch3rjrRYAP3rx4mHmdDD0PJ4BgHgbM+V?=
 =?us-ascii?Q?MlnhXJ5rILoPqEtojch+Akr0QDWCrAi8mExABFLn6UW/AQXC78S4fLKGXGvZ?=
 =?us-ascii?Q?q5NKlsVy5Gd9AfbRl7L8d2uJmVeojT6sDBWk/MYd/Qtd0kQ2mlMIOb4YsV3Y?=
 =?us-ascii?Q?tUCldmDm/mDuQze6ZzoDZ7xnSGJVodXW/NlfPni15reLwcxMTTawYH56SQTv?=
 =?us-ascii?Q?qWBknD7TQdGNdE4NRS2pIfyf6sLWYxEATmvWt1FkqMURAVZfeyvOFw2f1oxa?=
 =?us-ascii?Q?FdYiqIzAAB6VMoZtZoToo2SP7Iru1f2j0WVB5nIjY0YVik/VFog1NBa63Ja5?=
 =?us-ascii?Q?OIY38WqfHecLGIkfz/WvOLj4myZBicwnFIVOonwdzMn6lF2jKCgGtE5ueC9n?=
 =?us-ascii?Q?V4o9v9zuOYtQBuNXHAtLiOLsYeeEh+WMD3LLG1PrAjsFVuaQ8QKWzvUUZp4W?=
 =?us-ascii?Q?XLd0hC9HPUNBLBaErCfs/0jdCSJIJBriqpPyjTTeFGbgYW/8QSkrQnZpkEM3?=
 =?us-ascii?Q?LbSRu+KY5wJgceyDNryZmvmzHpAMiyAxxv5Y+QFvh2r1uzg7v/j04LaoT3MQ?=
 =?us-ascii?Q?fBb4uhknJ0lqPlu9fb/tUBZs3tfQnretHvSMt4HBifTvxxAFK+cKv9OUiZRJ?=
 =?us-ascii?Q?ScgatQ4WbG1mYB0YUlcvsPmhp1xMaMBfV2HlcW1AEoUq3m7n1NV/KsnPFxpa?=
 =?us-ascii?Q?/kVxHvQcUJBOsasLjbNOUouaNgcGk6pMeJP82s35?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	sqr71mSCdrLvbv6gO5+QinYgyl5CNd3rrXrdHOf5IkymbbomULDqr3oZdeT6DscynIxVr97ggCiwn/2UuseYmf5LD79yYA8sVbFqiHrdjOvjkVAm7p/Hg/bHxBRQOa9lpmMyz96ZFtoi9O174WQuYGuCTx21dJ9YN+3SBbbY1wsNXD0FpqgFSRl3VSKHWTceCMC3CnVxc/oxPJszm4kNl6ul05i7xwyivtN9nO2jx7L/99zbWE+9m7jBM+Jz3iipBA4//PnLkoL91G+3lt/sUNZi3564taHsY+VaH/35ig4vw38SqADu8rJBL65wSMPDS4M70HiZp5HF0vaGOWqjb3yH2Y5Vvaedx6OTEqTUiTvClHA/WV6c01++iGoXidLJAIVD+I7f54ClP66mOcEvub0B4+FdEUVP9r5I15u3NFY19mQ8Bgh1fdfT+3euwfvEKINKmLFyrvTpQDKSAeOlphCFSL3BSdVOTl3clkA/mLfMSPcm46FujmQFluKVk2vzrBnE0tjW2PIZCqZ6q5qVX45luUbgkxhlPtyu8TbmghsQ0E4Isj9skNVJGMWD0lyXE7oPX2oWvuUI+5mBih8jd+Alk8TaiJQOms+tH53EbBA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a9cd311-c6b0-438d-77e8-08dd20598954
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 18:18:28.6307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iUWMpoY5DUczBqvgwdlPe+1K/VIiVa1enKS+Fxvi2Nv3loYdDWI2z1MfbN4Km13mH5H0T3AfBmzGYdZlTu63Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6591
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-19_08,2024-12-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412190145
X-Proofpoint-GUID: HhwgXFCoxzdFBxbLOqyfod20WD4qWnG9
X-Proofpoint-ORIG-GUID: HhwgXFCoxzdFBxbLOqyfod20WD4qWnG9

* Peter Zijlstra <peterz@infradead.org> [241219 12:42]:
> On Thu, Dec 19, 2024 at 12:16:45PM -0500, Liam R. Howlett wrote:
> 
> > Well, hold on - it is taken out of the rmap/anon vma chain here.  It is
> > completely unhooked except the vma tree at this point.  We're not adding
> > complexity, we're dealing with it.
> 
> So I'm not entirely sure I understand the details here -- this is again
> about being able to do rollback when things fail?

no, it's so that things can be ready for the replacement that won't
cause issues during insertion.  We can't have two VMAs in the rmap for
the same area, for instance.

I would like to be able to undo things, but if there's a file that's
closed then we can't undo that.

> 
> There is comment above the vms_clean_up_area() call in __mmap_prepare(),
> but its not making sense atm.
> 
> > >Is there anything that would prevent a concurrent gup_fast() from
> > > > doing the same -- touch a cleared PTE?
> > 
> > Where does gup_fast() install PTEs?  Doesn't it bail once a READ_ONCE()
> > on any level returns no PTE?
> 
> I think you're right, GUP doesn't, but any 'normal' page-table walker
> will.

Normal page-table walkers will be locked out by the page table lock
while the area is cleared, it cannot be re-walked after that because of
the vma lock (except rcu walkers, which is why these new locks are
needed).  Any direct page table walking won't be a problem because we've
removed any way to get to it - I think?

> 
> > > > AFAICT two threads, one doing overlapping mmap() and the other doing
> > > > gup_fast() can result in exactly this scenario.
> > 
> > The mmap() call will race with the gup_fast(), but either the nr_pinned
> > will be returned from gup_fast() before vms_clean_up_area() removes the
> > page table (or any higher level), or gup_fast() will find nothing.
> 
> Agreed.
> 
> > > > If we don't care about the GUP case, when I'm thinking we should not
> > > > care about the lockless RCU case either.
> > > 
> > > Also, at this point we'll just fail to find a page, and that is nothing
> > > special. The problem with accessing an unmapped VMA is that the
> > > page-table walk will instantiate page-tables.
> > 
> > I think there is a problem if we are reinstalling page tables on a vma
> > that's about to be removed.  I think we are avoiding this with our
> > locking though?
> 
> So this is purely about the overlapping part, right? We need to remove
> the old pages, install the new mapping and have new pages populate the
> thing.

No.  If we allow rcu readers to re-fault, we may hit a race where the
page fault has found the vma, but doesn't fault things in before the
ptes are removed or the vma is freed/reused.  Today that won't happen
because we mark the vma as going to be removed before the tree is
changed, so anyone reaching the vma will see it's not safe.

If we want to use different locking strategies for munmap() vs
MAP_FIXED, then we'd need to be sure the vma that is being freed is
isolated for removal and all readers are done before freeing.  I think
this is what you are trying to convey to Suren?

I don't like the idea of another locking strategy in munmap() vs
MAP_FIXED, especially if you think about who would be doing this..
basically no one.  There isn't a sane (legitimate) application that's
going to try and page fault in something that's being removed.

> 
> But either way around, the range stays valid and page-tables stay
> needed.
> 
> > > Given this is an overlapping mmap -- we're going to need to those
> > > page-tables anyway, so no harm done.
> > 
> > Well, maybe?  The mapping may now be an anon vma vs a file backed, or
> > maybe it's PROT_NONE?
> 
> The page-tables don't care about all that no? The only thing where it
> matters is for things like THP, because that affects the level of
> page-tables, but otherwise it's all page-table content (ptes).

It sounds racy, couldn't we read the old page table entry attributes and
act on it after the new attributes are set?

During the switch, after we drop the page table lock but haven't yet
inserted the new vma, then we'd run into a situation where the new
mapping may already be occupied if we don't have some sort of locking
here.  Wouldn't that be an issue as well?  It seems like there are a
number of things that could go bad?

> 
> > > Only after the VMA is unlinked must we ensure we don't accidentally
> > > re-instantiate page-tables.
> > 
> > It's not as simple as that, unfortunately.  There are vma callbacks for
> > drivers (or hugetlbfs, or whatever) that do other things.  So we need to
> > clean up the area before we are able to replace the vma and part of that
> > clean up is the page tables, or anon vma chain, and/or closing a file.
> > 
> > There are other ways of finding the vma as well, besides the vma tree.
> > We are following the locking so that we are safe from those perspectives
> > as well, and so the vma has to be unlinked in a few places in a certain
> > order.
> 
> For RCU lookups only the mas tree matters -- and its left present there.
> 
> If you really want to block RCU readers, I would suggest punching a hole
> in the mm_mt. All the traditional code won't notice anyway, this is all
> with mmap_lock held for writing.

We don't want to block all rcu readers, we want to block the rcu readers
that would see the problem - that is, anyone trying to read a particular
area.

Right now we can page fault in unpopulated vmas while writing other vmas
to the tree.  We are also moving more users to rcu reading to use the
vmas they need without waiting on writes to finish.

Maybe I don't understand your suggestion, but I would think punching a
hole would lose this advantage?

Thanks,
Liam


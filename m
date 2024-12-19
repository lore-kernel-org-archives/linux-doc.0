Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2601E198A31;
	Thu, 19 Dec 2024 18:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734634569; cv=fail; b=FFs1OIzg3m+3z1QLWP0BNrhCn3NvcYy15YS9OF0hZVhuiy6cTBraYNrJ9Bkwm4xzwxz1kwbHbPo/kPTsCyRQohEhzL6oy6PDdnt/FMu5sb3ov3Ob8L5p8Y+homkIW9/1H7t7cSuNR3xL16Sma+NcoXEnJmzOqqpKLWJ4l6aYSrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734634569; c=relaxed/simple;
	bh=b+KaSYbDJVySadP2dBhUxp06EQIzpls1e5cdRKlOlgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UzhVbxYPfYmKYSKG33YwFWwrP2ZYE8mGoixQ32/dBOpGETq2/VNi8P1i1Oep9GTEjL2jsyyLx18jgBLlXHc5XX635gFYHDVbv1GwPpwnzaTNf6RWjbC7LOrHjH0QuS8ZcrGu1veSRZBn3pVKnUsrBuQW7JzwgQsacs95wguN52E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=B1e9kMFZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Fl2uHKbB; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="B1e9kMFZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Fl2uHKbB"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJIMjYr031481;
	Thu, 19 Dec 2024 18:55:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=jbtCk/L9uYdkbRw7DH
	Ma5Qp0InFpVImnCpNSQhptTmY=; b=B1e9kMFZwDIHM0fLOn4HU1uF/wQJTTyuDh
	j7CjRV45UhJTYCfnhg0gJ2CWAD1FpNIZpOOTa9eikX6ROaRBsDgO77eteEWcHQvW
	FD9wAHd43y/Z6smHy3jghQqZvvXg3FZZJXkVE6tRrHN3e0tq9mRkdnMQxuBfZyW5
	tk53LQ21RUy0mc/JsOdgXMJWbaBZCoKicPu96u2xiXOpZkPw2ShJyprrjFlZ2aC3
	5Hhfok/eWWygIAUsTYWEVlA/W8fxoU3ss9fjUJPwp6Q1nKaKRxA8nmNnfQLaLipc
	DfvZetxILUddoI3OqprKPQQYVICbHNJesx0OfncGdlmoHwYXhIgQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43jaj5hfmm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Dec 2024 18:55:27 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJHaDbt006407;
	Thu, 19 Dec 2024 18:55:26 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2044.outbound.protection.outlook.com [104.47.58.44])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43h0fcekw7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Dec 2024 18:55:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qikruj0oqN6dMFf/4rpkcjcpooO1k6f2zGM0EonTTZEHeE1esHJkQdv7qh9WreKubFsCPiPDrKYuwY+5axFmLTBWPlVUei1+hgRzp+wbctKVxPfYa658lyyregvIzt3tr3eo7H0/8eqlMIfWTk9SXcFk87iAh7dIzFW8IXkEM37WDpwcu+SS6geb8CBlXy+lYtVYxDxTIr9++9bPU4PQPvcFoiJtt/8KANp0tLx35Fnz8u/V96kjcYS86itq60xqlBCuS2MtGIkwncIiXo+k8QNzuQKsZ7e3WyGh/mmf37GGsrDoYEIubtc8qdCBIrPyqTEKyNapcI66Iaz6Fu8ClA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbtCk/L9uYdkbRw7DHMa5Qp0InFpVImnCpNSQhptTmY=;
 b=Y3mVCHcRMqsa+YnzEovEb1T893BlQTKhUkxdlmwdyAk0tjoeUX9UG2ySqw+kV4ikOt4Tqq+iR8vt3P8ZXqUq3hCmgXk0MZTI8/GN13v82mjHKPHXEVQ0PCryahyzfETZkP3YlfuV538ArhCrczb98XfGy/v30lAG1j8GANMwVdovEJhy8ZeLO/QuvQoI+qTXpY8KKpU6ZF5VgEJ2cKCc7Qt6b8saWGpkQ0QEKDjvRVkvhngRWUI0KV1QHYrcUt+5DQIC4i5gw4Er+N/33rR+fxw18rwSCZlYRuf63Y8ay18QUZ3NayG1qYPx5WSDkr6Xp1xKVg9KzpP7EodzgWGN3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jbtCk/L9uYdkbRw7DHMa5Qp0InFpVImnCpNSQhptTmY=;
 b=Fl2uHKbBmQlLNu5dAnfi/6dQRjbFoLDahdoIgQq7sMe01mgVWS1OAZzuBZWsRzDcYf65+hAPQ5FiPqS9k+IUfGYlrqcKyU6mPH355SSguBx37Lc/vGzxEx3S761RMgJvXebVhvk+YhxRTHCzYXr7oxIqjr2h1dSY5AXzA5wZqAE=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by SA2PR10MB4489.namprd10.prod.outlook.com (2603:10b6:806:11a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Thu, 19 Dec
 2024 18:55:22 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 18:55:22 +0000
Date: Thu, 19 Dec 2024 13:55:17 -0500
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
Message-ID: <6nck2rfwcytqdinsavmewytgcca43mldlczmao3zztrpr5v2ci@4xn6nwp6tcih>
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
References: <jes252u5qfhla2bdmg6pdkfpi4a2jfhf7d5b6ra6ol2bmt352x@gunhzaca56df>
 <CAJuCfpFSD98fw=844AJPy+LT5y=zREQGtSEVj3_FCXiZ5cFR_A@mail.gmail.com>
 <ulbspoec633hfm54f3jzvoqs6ilskxou3qykk2u727pbaltvfl@lb53vjcaxnuf>
 <CAJuCfpHXRX=LLa67eWYvrK=UDxKMaOequFXfqOqDHbRrmsT9SQ@mail.gmail.com>
 <20241219091334.GC26551@noisy.programming.kicks-ass.net>
 <20241219112011.GA34942@noisy.programming.kicks-ass.net>
 <wfzu6jvbazlxdybsjc54aoivleif6memaxaacd56bcep24nkv3@s3e3aj253hd6>
 <20241219174235.GD26279@noisy.programming.kicks-ass.net>
 <rnanfpzs6fmojyeaowt65mug6xekorrkeefvn3b4zc7buunzhc@rrzcbhkrjdv4>
 <20241219184642.GF26279@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219184642.GF26279@noisy.programming.kicks-ass.net>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0353.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fc::7) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|SA2PR10MB4489:EE_
X-MS-Office365-Filtering-Correlation-Id: 2de30091-866b-4143-9d2b-08dd205eb10f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?J2N/EXUlqE237WGYrAp+pO16+gQ3gwiCXPG3ly4a70GBfsG2B0dQlVVUHDBe?=
 =?us-ascii?Q?dLy/+fyW9jGmiKzbPJDQBIOvBVoWNjIzbnGnBdJcbTEsyleE6DX3WVL3VxL3?=
 =?us-ascii?Q?qzW4hUuBflVN7OvOGKU7/DYT+YQ0Lh+rdThXO0fpZKMkXZRyto6hWouhs3ew?=
 =?us-ascii?Q?cgGnrrZJ5RzAglGmJqRwuVgIJ66Sbyj7GPZRlZdoDYgetznEot5rZkxlCVyQ?=
 =?us-ascii?Q?Dj1crhqVpPwGb3/3n9R1NRCX6b1Rzz4sHrIhi+rBNeCOaeF/NJLYp/rFqPGI?=
 =?us-ascii?Q?KRwUnN60h/xvCuDSW+uy/sKDg0CCtYAFvBnwtSDFZxO/4O1j9nzUdUXz8BTd?=
 =?us-ascii?Q?0U8zt8G6bcC6AMCaSM6BVZRVwKuVVSw4wLZMzWXOpwt6m7rV5bxKrHA3E4XV?=
 =?us-ascii?Q?TfVG8ar5nW/rm9YpTOApVd5h3RGWoOZ9bebyCXA+isw1S39djbMLefdPiUKR?=
 =?us-ascii?Q?e6Q9A9NAZ5REwseENrGpJCZcCeIwct5hOKwCcGDcGprHA9qylA7DiT5K5snA?=
 =?us-ascii?Q?ocu6pi46K5lPcYC0SStUKOIXz7UTUA6G529Qcb6mLjW9KkhiO7Xijn+anbRk?=
 =?us-ascii?Q?f2anr5K1aNrn9nbd0Zcf7uiMfj68IW2s+3niSI9V68lxgUu6LME95iMZl7so?=
 =?us-ascii?Q?6NfbtyoRbkN8l9HJqnCN/a30DQ/Ei5YiHwAgXzyClNRYPzFiRSMLreXrbgZR?=
 =?us-ascii?Q?N8GyhBiCRGlboCDgqdNOAiTXnXe167TnpDp+IQEtOhC06PKFVoM/546Zg40s?=
 =?us-ascii?Q?btJ7zXQWYJ8KR0YayBieP2D2TmNnfMCrfDaEq2LW4qzgPiyR+guYTJwSABle?=
 =?us-ascii?Q?tqSLXFs3oPZVe83HDkM+IimI/M6fkSwweiC1gxCVQcBdMQJ0Zfrn8sqYdTqO?=
 =?us-ascii?Q?sXNiwAeEA8cyRIrhgUgABFdV/oWt2EcLdMCtJYRYtXeN4vJ7jtR23zDlmfcr?=
 =?us-ascii?Q?Z9+i7Ij35Lmp9Zl0T75rnpYI5t/6Td5m8z/0AHXd4ipqaR11kmEVxkAtfUCe?=
 =?us-ascii?Q?mv4+xZ+RnYFrlJo13vvC9odiFEMj8RryVQIB6VMlNH3bIHuBhR7W3L/6pC/p?=
 =?us-ascii?Q?4dqs3lqOmvF8blaGF0JmWkNS+4Ji2YVhR2oSFdzHuO1swucXohcuLtCCrXLl?=
 =?us-ascii?Q?XmqMccJ3S9wM/+lGfOj+6OGxXE2Vr0c2FYdemGqUNkb73uA6QGVCfZVUAhP3?=
 =?us-ascii?Q?amSz8PWBkYCaV+MJAMU16pJjxnlrzGXYGLVeaAsM7BqpMVRFRHKqZAptnD2d?=
 =?us-ascii?Q?9HdK/63sGuSGqZcGQU37OJunYf9UMWmROnGoTjlxAhNHxC2DGq0drT8TTvOI?=
 =?us-ascii?Q?nqL2Yjn5PF0mVIoh2tkR62Tf/f9Y0JF3qzx03g5nuKFK3Ek6vem6wPbc2njd?=
 =?us-ascii?Q?4VlLNugQB6VgLW5oeNpp+uVJwP7N?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gsjQ5szhTlXn3gKwPJ4HJ8mzKpOJUqGEi9fpzGD+5AfoD76lpfg9hRZIl2H6?=
 =?us-ascii?Q?vheUrKeMtE/lvGR/e/B8c8n/vRjh0hnEEP/MWVgkl6RCKACBqXi7kHpIsBnG?=
 =?us-ascii?Q?OO2zQUM9OXxLrthTSssYlWCR/yYwmrDD0XuVpj5O9B1aKQIy6QBOsVjlcTsc?=
 =?us-ascii?Q?fFWdoPVsCYUKvacH/IMi6Rd9SPDQTyuzPlVb9zmg3xGIK0JHMMPNuLlrl7Jj?=
 =?us-ascii?Q?tD0xAWUmXoaZ+mwsdRKjJuH9r7ytp0gJCAp/PQnxG/1HR/L946yKsw+aPW9S?=
 =?us-ascii?Q?Czaaux93LhRyfC1ZjVCzY0s3BHlH7/Rh9Ix3uGp+uMS1oOoc0PgKA3+bHey2?=
 =?us-ascii?Q?mImMZL5SVi2+wXd0FUKczo/QZTghxxYlLMYerNWSCcbQHjsbE2ChvGZly7C2?=
 =?us-ascii?Q?o25Fdp1FI8jDCEz4fgTVt9Bipj6yuTEXksx2FpsFgOcCvPgz+ZbqlKzPS5I2?=
 =?us-ascii?Q?b+8mz4GCoYPyBJAb2r8YO+rKmnJvDzRO94AKUtvXxRYJyITYhnyP5C4m3W4c?=
 =?us-ascii?Q?WRuA+ktmynq74HuvZZYN9DpimPHe2KvXShqZD9hDu221zR4SdbDPhnWpgcx1?=
 =?us-ascii?Q?bWVyKT7l9Ywa+MJxB28OlXPk5UCFQoSNrK2Uygx0zW1ZcooJ3Et1XD5dcaL3?=
 =?us-ascii?Q?y4qP+SIRNr8BWnmwWs5crUGY7GZ27ccTzbUlHGAIwYkioVsi9mP03WriuU/3?=
 =?us-ascii?Q?NTBJC/XVX+hRNwLG9GXjr5dKseeqovYfY7VlfMW9duC1fWYKaDnLG1kqIueG?=
 =?us-ascii?Q?Vze3VtkYwDnvb1tqSNUmZ622FM1UvgX0GfvlFpZJ48SFGDyLCqVj6i2f0ukS?=
 =?us-ascii?Q?943rF7DMDiSqQpA/LGekuLSM0emzUoR33Xb7vuyey3yNp/EUlX+nYeyrcHFK?=
 =?us-ascii?Q?K7EdfhoecGnpTSvv22PKzIi1GzGCb72zfane1wpjnke++6id39CtSCb7FNzI?=
 =?us-ascii?Q?nqeYq4I3bvO2xnEURFZRbzdLmP53K7IocwQ05hNr2MUeJgilyB0ydErTPJ5l?=
 =?us-ascii?Q?ym3PE9384Cq6VFf+QS6D0DgjhwyLkUXS5IRuSG4WxDZekoPpM2pwmsWB1/iN?=
 =?us-ascii?Q?nN7+xWhF8c3/uS3NIfyhvCoH6pxftjyak5rB4ye+fs2AwOtI2EBklFuYyAra?=
 =?us-ascii?Q?KgyuSkNbZ+mSMTOYWlBIpaiIxwbjgwCOrjJQXxIDkOY15/FinFtznnDBRF0l?=
 =?us-ascii?Q?6B6z/S3hCnazt4ajlDro8vNMtbi4S229PAC4j3dvjSqJZYN7lc0p8CMPYCQX?=
 =?us-ascii?Q?yYVVpyIKHPmDIWDrGqbU5JABJt1/BxY8nC8ZlFMsi9SUJdf6kHCrpR2jYX47?=
 =?us-ascii?Q?Qyw6gpQRvl/LPqOFz3qFBC0drf/sOqcqEWL4NECBPBa3MJA/RG2R8tzaC22s?=
 =?us-ascii?Q?O2K5YkqRh8xuFLBN2JWHINuSPIPEVGyLG0X+w2vz4q7Y3RiCxpzxZ3oBxc7Q?=
 =?us-ascii?Q?/0YpvG9QHE2Wty7fusNaBrKO+n7ZHZlIx8ruoS/JFBA+6+pQPzTvcgk5nl9k?=
 =?us-ascii?Q?EvfEf3M+xIPatfm0XwBrqJRQLijBbI8Rw1NqiJd41vvxviP1IWe6AfD4mBs4?=
 =?us-ascii?Q?fD9uuL8rI/Y/6dlx/X/MNsGPF3cM36nlxL3vjC4r?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oeiL+pM+ZGyPKhDvIOFEZ4rsRXGzdlyyeQovvqdcHB1PT1oys0iv/fWiAFagRGgTGcUVViWAQwmXmMv79Dg9nAsAnFdiWb5oreNg2hbW9gxK2qdmfsydWuxP1jd5jtZq5TVNN8ds3JP/aXLGhzqe7hbYdR724A5+ByavPZ12g11aQ1SMiqeHJjsAr3gwTARNTBV7OKc2lnWKBJfB7qflOVuCaywq0CmSxFkejUyd+evo0IDKvZ92FcxvB4hxxI1+PWLNCpjtn6hqPexRckLVl8uzGfHy9BA73ILV0DotnDb2rq4L5OPar4wRJARZfTuSORykPNRbdzfpx9Q4l1BA9IFOejmO7VBqrI8dXFX21McDFHdrx3qf564dE3i/P6yIoHS5JOr2RDxOmD8GmSuxGevuHsN4c0dKv5PnWc5C06rDEF8H/S0/rFZuuXwvWPducCgUWfeeZrskWPtejEgvATxq1v6dywiJeiqPbo6T6g3XTPXT4ma1VyXnirQPTJeD9URtD1PwEZhu7aTKaRe7KJDWnENzQ0raFvi6z82O7LPQ6HMd7dq/tpZnxtKi48GozUjdWtzkvvYC7dL0w9ECP6FLrHyC2ePOYHG3Un4HjxA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de30091-866b-4143-9d2b-08dd205eb10f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 18:55:22.7117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KU2KN8vJ5Gg+d9TSOU3jPAJGEEcyNv+Ez9Mcay/qGtXITfZmu+xuMIdASmOTiNz3J1y1rkS+KOqJBipMvUzKeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4489
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-19_08,2024-12-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=742 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2412190150
X-Proofpoint-GUID: PCqdxY6ukobofuBXQtGEVGlek0PxrmT2
X-Proofpoint-ORIG-GUID: PCqdxY6ukobofuBXQtGEVGlek0PxrmT2

* Peter Zijlstra <peterz@infradead.org> [241219 13:47]:
> On Thu, Dec 19, 2024 at 01:18:23PM -0500, Liam R. Howlett wrote:
> 
> > > For RCU lookups only the mas tree matters -- and its left present there.
> > > 
> > > If you really want to block RCU readers, I would suggest punching a hole
> > > in the mm_mt. All the traditional code won't notice anyway, this is all
> > > with mmap_lock held for writing.
> > 
> > We don't want to block all rcu readers, we want to block the rcu readers
> > that would see the problem - that is, anyone trying to read a particular
> > area.
> > 
> > Right now we can page fault in unpopulated vmas while writing other vmas
> > to the tree.  We are also moving more users to rcu reading to use the
> > vmas they need without waiting on writes to finish.
> > 
> > Maybe I don't understand your suggestion, but I would think punching a
> > hole would lose this advantage?
> 
> My suggestion was to remove the range stuck in mas_detach from mm_mt.
> That is exactly the affected range, no?

Yes.

But then looping over the vmas will show a gap where there should not be
a gap.

If we stop rcu readers entirely we lose the advantage.

This is exactly the issue that the locking dance was working around :)


Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B330A15530B;
	Wed, 18 Dec 2024 19:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734550774; cv=fail; b=haww+ysoGk8q6l0AeTso+ni0AvHJoEjgxCNyI8yBiWoOtcODrt/oT2odXTdkKPsejrtzbd5DIKDn5ZG1jLRx/KB9BieMjPidi5xdYlLU6q9da/fmLChdiNQJvxe09s4nIOly8xKx/g5sBSpV8nCTE8Epu1mxGpCyNniawBCIRp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734550774; c=relaxed/simple;
	bh=8HLD3/jP1JSE8plg3xNcfI94ib1d5frecL7ZrdiJ8n0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PdhiYLYpTfDUxfN62h5KnROyvXpMtWYpmUhHqegX3QxDdJkMCuNdx228PFBkr4hy1ftSUr0HdF1NAYAoLsB6q4OMthzZwyA83wKB+MaEEBxo63Fc9D7DuKjHPr+m8e8mZlFYiuF1GLc9SuY3SnJ6B8Bw15RhbJ6AHzWwBd1oNdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gqZg4tZy; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vCxTzqpU; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gqZg4tZy";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vCxTzqpU"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BIHQmsU012993;
	Wed, 18 Dec 2024 19:38:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=q4lliwfMBZd+KZ96g7Zee6EQQJTSG6kk6fWDMTcvk7M=; b=
	gqZg4tZyx42WLBrKADjniPfA8CqB4lAHgf4wxz46sd2ZBd4/TsgUKJ+i2P4+w/il
	3jmYq938gh3JL8l7brmRtmSTdfxujMTBMFTGNPtngllDmfVKJAvhgFVbF1K6q1U+
	9Y+6HSxnT57h9AjJHTf+rYUM51UzQHIoLuy3j/Acm4+cX2ONDaLmjPS4L62br6pK
	9DxJ4a14RyxqPKL7YOXVScpsB6xw5wPUV0BV5XIFyyxzfQw8i1oWyJk35stDyhhx
	ucikRHvmVUyg84hOSRZQ1jVYfe2jyzGMnMs7uBwiVqkw1cmH4frzbCv0yGZts7rG
	XRR8yJjkYgTqNHv8FPH+bg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43h0xb1h10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Dec 2024 19:38:46 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BIJP0XY006384;
	Wed, 18 Dec 2024 19:38:45 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2046.outbound.protection.outlook.com [104.47.58.46])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43h0fb5cpw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Dec 2024 19:38:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TP+sAdzAkkQ9XoVVCUupqRUDUWsWqAWub7PzQi3l+l/Nku3MKAfsuFaaCzQCUEK1r5Sg8MbzkWFc6C2IMeamqn2YGkRlr9QVAesF+AsFTi9uKmLMhzf/OtGcutPzrCsTTy2tkT6mYidB/uxa3a3EU6pzVMEyOi8bYYqDyO3/s10tz1jlwlIAGhFGBG0l0QkaGRYkbTdkAohX1EMuolQJsNoIVXGgKX7NgXCRrB7MMZfVpDWbJe8/hoiREW/eBBYf4ma/plFC1v+wkSCNxjwB+IOrdtnVTGGHmrxZwz7JLF3NrH0qdBD/0dBcHXKq9RuOqNcmE6Di0oryzmt+5D7pRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4lliwfMBZd+KZ96g7Zee6EQQJTSG6kk6fWDMTcvk7M=;
 b=DGDSMAc14nPLLtntjMsszJhpWb9w5TIOTvjIMU7m+0K1lMSnx/2a46hsnuycT8l5xkNGW6elva01CvpXzPJ+s951XmbL/jokJNygMWhi520bgzuNWHbNy35VoHnzjTmhgZ0QRCy47W48pKpOEFwRj/YnsJv5RDu2j0tWCQAeVPxKA6CRj2Iwl4uyYdfPvtxNdVkRkk7Oja3uiSrGnYgaxFMGmBNmdFY5mn0q6EhqkSVThxGfVpLI44GNfZ+uOR2gEXSWXVlv0OzAsuWjofmXg6IOnpRxpIbCHIrYbRWNiBl9+1c9jGBpsipDq/G0KsvCFjroN5jJOJ890qrJqQ5r2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4lliwfMBZd+KZ96g7Zee6EQQJTSG6kk6fWDMTcvk7M=;
 b=vCxTzqpUoKMP/TaB/qpOOUJBlC/EEpWoWEKx0t4jGIJ6G7WbpOMEXFrwCVKpAbCpLS6PuW7x6CNvtBSDn2T5jYCds6Juaad7Cf0klkOXZza2XnYCkMWwuVfmQvk1wdGvAAm+SUa+Ro616Hoxpbk9uVDryPV2h2795Y50brjcn78=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by CH3PR10MB7210.namprd10.prod.outlook.com (2603:10b6:610:129::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 19:38:37 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 19:38:37 +0000
Date: Wed, 18 Dec 2024 14:38:32 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, akpm@linux-foundation.org,
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
Message-ID: <jes252u5qfhla2bdmg6pdkfpi4a2jfhf7d5b6ra6ol2bmt352x@gunhzaca56df>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Suren Baghdasaryan <surenb@google.com>, Peter Zijlstra <peterz@infradead.org>, akpm@linux-foundation.org, 
	willy@infradead.org, lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, oleg@redhat.com, 
	dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, dhowells@redhat.com, 
	hdanton@sina.com, hughd@google.com, lokeshgidra@google.com, minchan@google.com, 
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com, 
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com
References: <20241218100601.GI12500@noisy.programming.kicks-ass.net>
 <kfltsrry7qjuycyqpe2wune2ejad6kvusm2zixvfbtprbnw2lv@wcafrui6qaa7>
 <CAJuCfpFYZkc===SXF35s3C0xg3q5RjpCiOQhwK=9_3RnFUye1g@mail.gmail.com>
 <20241218161850.GG2354@noisy.programming.kicks-ass.net>
 <CAJuCfpHDRCoaBfE8y6AppKveSTgayyTNfDyQWH=gMzO-Pkuqpw@mail.gmail.com>
 <20241218174428.GQ2354@noisy.programming.kicks-ass.net>
 <CAJuCfpEKg_h5pw2AxdF1wmFMt4xdOxYqv7U1uVMYcuSCB4kHuA@mail.gmail.com>
 <r7polqnhdguxrz6npklag5kjy7ipbj5lrnqai2qm3jt7x56hci@cfrcom746iae>
 <CAJuCfpGeRi73E94VCDPDGAGG+5-Sj-_YGf3JNnf6Bh4GH_M6jA@mail.gmail.com>
 <CAJuCfpHJwVXanjG0WGjo0KHHEbg1-T0HWTZqDpssoq3FvfG++A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAJuCfpHJwVXanjG0WGjo0KHHEbg1-T0HWTZqDpssoq3FvfG++A@mail.gmail.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4P288CA0054.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d2::11) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|CH3PR10MB7210:EE_
X-MS-Office365-Filtering-Correlation-Id: 07df0feb-073e-4b29-055f-08dd1f9b9108
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N0RTdUptcmxjbWRjdDZJcmJPOTZtUnpMdmJxRGtwZ1lDUHNNbGdSS21vRW9N?=
 =?utf-8?B?c0djbkZXcmh2OU50SUVHMGZzY3l0R0VRNzVIWTJvSFhQbEt1S2lSMWhxTFBs?=
 =?utf-8?B?TkNvQnZ1cFB3ckc5TTRsYUpaZnVYSkwrOTFrQlpQUmhPdFc5TVA2UjUxUDJk?=
 =?utf-8?B?RzJOMzgwRWVibkVxQ052UzBxZ2VVQkF6QUR5dW1oN093eGZTWXhLQVhvZUwv?=
 =?utf-8?B?dnN0cUdtMW9qdlBLNmF1RWVmWGl1YVZBZHhUYkFDbmV4NTFUakFmQjBpb0tq?=
 =?utf-8?B?OVNTRlFwRTlEVWRYR21MRGtjQzJ5a2w2eFFIZGozd28vbmRrVG5jMTVrb1pr?=
 =?utf-8?B?eFdwUWVRdE5LNlV0d2xIQTdsZU5udlBuL09oU2RYQ01VUUFVbVlMTzhqWWIr?=
 =?utf-8?B?TVhGMm4zb2FyK1RiR0IyNTY4MlEzV054YmNLVXRVdk1kYklENW5wYWp6TlZt?=
 =?utf-8?B?ZUgzUXh0emMzaTVEeW9vUTdYa3RUR3QyRWtmWVFhaEpxMWJuNk50TVRwK3p2?=
 =?utf-8?B?WDZhTThBeXVVQXNTWDBPS004bFNlR0x0SUMwVGtzdlMrTFdBMWpJeXNRdnRp?=
 =?utf-8?B?Slg1RUlSMTBPR2g1YWVjZjFwZ1RlZENmazBZRHBDWWF2cW9DN0orN0JwMzRI?=
 =?utf-8?B?RStIVzdEWjcwKzhpR2Z2M0hROEN2dFBHbTNLN0hPQUNSeEdwZzExdU5Iaml6?=
 =?utf-8?B?VzNVWHBaMGZpTkUwL1JZR0FDZGFQclZ4SkJ4QUtPdDdJYTU4S0lYQ1g4VDND?=
 =?utf-8?B?ZkZCS0tvRkJZMjZLMXR6blZld0I0SEtCSHhkM21STHVJTDJUUnpKak0vTldv?=
 =?utf-8?B?RlFKNVR2ZzBjTllvZzI3RmkxeEpGTE9ZYkFKTmkvNE92dDB3cXQxdkdsMmhN?=
 =?utf-8?B?NW5JVk1PbzJHS2o2Sk5WZFVZcUkvK1l5SDVqblBDTEFwRXVCMGRRL0g2bUUr?=
 =?utf-8?B?bExaa3FaOENxTk5pTkc4aEg2U0kwalJ4WGtvOXF1bU03ekwrRUY5SWRxVjdw?=
 =?utf-8?B?UFFlOUh6Nkt2Slp3VW84T1YyQWJnZWJPeHBNaFNKczkyRHZkc3M1YXFBVGk2?=
 =?utf-8?B?MDV2UHdmQnVpbm1zTlRtb1pOdkt1TlRlTjVvL1U3UDh2QldzQmYwMlduODZ2?=
 =?utf-8?B?UUhwVldCdTlGMGFScjRvNnR4WUhNTU1LcWduazRkQnZaZG1rYWcwWHZDT2d1?=
 =?utf-8?B?cWdBT0dFMGtOQVNTYWJUa1dhdFJ0NmtBbFRlMWROMG5CNFlHUXlNV0pkMm5M?=
 =?utf-8?B?dHRuZUtkaytyZVl5R0J5UEpza2kyYkphdElUeFlFZm93OWw3ZzA0akgyY2s5?=
 =?utf-8?B?b2I5YzFFOWZRcmJzaFFXai9VbmV3WGdrS3E4ZGN6QUoxRWZOcjhPRkF2S0JK?=
 =?utf-8?B?SE1sS0h6UFhoOFpkK0g3c2piQUQxbWtTUUVFNkZjWVp6bWFoSWhrVHNLeGgz?=
 =?utf-8?B?M1pHNXQxa2U5V25hTVYrQWdGQ09zWS8yNFBmcDJlRUdDZ0xHWVZ2VTQ0MEgw?=
 =?utf-8?B?Q1NXdHI3dGxHWEZnQU8wYmtwRkVJZi9Fd2dZU1ZyNUYrQTV3WTJWZ3FGSkJo?=
 =?utf-8?B?Ty9oR3ExdHg0S3A3dUdsWWdSUVFjU0xaSG44dWJ3MkRDYzhJSzZURi9Wd0s5?=
 =?utf-8?B?TWZJQy9CaEo2YkgvL3EzNWthVG9GWnN5dU85SGJWSmxRejEyV2R4a2lMSFBC?=
 =?utf-8?B?LzIrZmxlMDYvVUVOaWVoaCt0WXFjU3VqWTdncUZjWnRhU2poTDBqNFM4U3By?=
 =?utf-8?B?eW5HNWVnNjNIeVRIdkFKdy90dEIwOGF2R1FrTlVocWhvMXZuRjdpeVNPQUt1?=
 =?utf-8?B?TkJxdWttamR1SmRRWitYM2RnMXpSbTFuci9DQVQzUGtET293bWVoQXhXNk1q?=
 =?utf-8?Q?oQV5Zd1EkCPC+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHZ5Qzh6RUh4OVNnQVU1TXhOZEpERnlOWUVYSmFRUjM0U0VyN1RKeDhnbE1X?=
 =?utf-8?B?V1VVdHFJKzNPZ0d3SnJ6c2pJVVcvc2w4amdKL1ppUlkxSU91dnVxVzlvaHln?=
 =?utf-8?B?MTdOcnVVK0tFV2g4UmxsLysxTU03K1piWEFyVzBZT2JsdXc4ZnpnU3dXTDZ1?=
 =?utf-8?B?dldCWHp1amhFMElrZlljWllOc1kyZUFHMjBzQWN4VFFoTElLUU13NVROSGdr?=
 =?utf-8?B?UHNBYnRZQ1dEUEtoZS85UEtpdnFLT3o2VHlOc3NJd3lYeXFiOVNLU01lOGRy?=
 =?utf-8?B?M2VFMG51OHBVNHhPeDZhL3MxSFI4SDY3MGIxUzdXbEYwZ21hZ1JmcU92b2g5?=
 =?utf-8?B?QXNyT0pPM3plb0s5UkJ0ekdibDF3cEp6T2JiNDcyUUc2KzNuaEs5MTR5Z0Fw?=
 =?utf-8?B?QVRaR1ZESmJTYThwVis0NVgzNEFtdFk5b2pQMkpYbnJKVVpOc2hhaWs4aHR6?=
 =?utf-8?B?eWxIYUQ4VXdCOUVrdzhQMXV4TXFPRGQ4SWNxZzdKNXZvbnZJMGtaSkd2eWVi?=
 =?utf-8?B?MkZJMHV4elQ4SStkQThhQURieXlHd01NcTBlcEVMTDh6cTVqQnM4SEE3Sjlj?=
 =?utf-8?B?Q2pnWEFuSUYydzhCb095MjI4OVlUL1NPRXlwSTE2Y3NIMzVDbG5ra1N5SEdo?=
 =?utf-8?B?OHFWamlqeTZhZWxEdVFZeURCSHpSWHp2Yk9OYVVoUXBsRklGSTh3bXcxaEYv?=
 =?utf-8?B?eXhLTEFuR2dPeW9QQlduR2FtcVZpb3lFajNQQlM3MjY3ZDB3SEgxVWpWRnFr?=
 =?utf-8?B?N2NCODlFYzExZTVKOGp4eVNCZFUyQ3gvMWFFRnhZR0hqYnhhVURCdTdjN0xJ?=
 =?utf-8?B?TGVQSU5pTjhvYW9ZWEVxWHZHNVh3WEh6cHVKMFFEeTkrSW9mNGhUNmFpNU40?=
 =?utf-8?B?Q3lqdUpIVy9uc3hhMkZndGQ3bTFTRXZQR3dhVXpNMDArVzduUEZ5TmEza0p6?=
 =?utf-8?B?K0prUHRxak9YcU03V2N5RGE5OHQraXF6akRveFFsbzQ1RXhiOXVuREFFNXBV?=
 =?utf-8?B?Nk9Cd29OZVUzVjdFN1U4Wno5dDJnTjFLRVFqdGdhKzFPMlBydytlZDlJSklD?=
 =?utf-8?B?bG81NW5hdmhnNjZkUGRzb2R2dG95K0NFdHYxVnRRYkpaQXJmSzhhcVJjODlO?=
 =?utf-8?B?cldhK01HSXhtTGd5dkJaOG9JZHQvbVZ6bDNmQ2pORllYUU9NaUM0aklxL2Rp?=
 =?utf-8?B?LzZJRUpzUXlqVlE1ayttUStsb2lldnVCY0I5MWxoSU91a1h4M2RldHhucnNK?=
 =?utf-8?B?aHhkUU0veit1U09tMkt5V2FoSTZIZ2VaSnBEaEpDbDdoMmxhOEl4UGhHR1p2?=
 =?utf-8?B?V3FUbC90MDQ4d3V2Z0NiSk5nOWZKY1BVNHExNTRqZWRGenRiTzJ5NVpiTkhI?=
 =?utf-8?B?amZ4aDEzQ2JzNDBpbU5CZGpsdlFZLzVaWTlIczJyVE1Ga1BDZUh5Y2tEZEU2?=
 =?utf-8?B?WVoxWi96Qk1Ed2JRTTJoaFlselM5Rk0zdXV6RE5mbStUQmlMSXVxcHhyU1Vu?=
 =?utf-8?B?TU83TWVsVC9UbjFzYzhhZUJ3L284b045YlFBYVl6Qm9qNmJkNjR4Um1FYUhh?=
 =?utf-8?B?TENCVjVHL0hNbHZyaTZPdWpzclJLRThScURPUHAzSUl5VUdZbk1WbXMrbWpk?=
 =?utf-8?B?dGtNbW9nQU10aFJmdWR1azc3a2FSSEZEaFIzcGFzU1kxVU4ySlJ4ZDl2Y21M?=
 =?utf-8?B?OXdTVVN1MTJFbTQ5NzhMZEozQWVUcTdmbVZXQU1XaWI2dmdVbUpLMTJBVmdI?=
 =?utf-8?B?cW92bGUyelJrbFFCSFNDQzBtbGk5NnB2bGY4ZkgraktxVjg2bURvZG1yeUpC?=
 =?utf-8?B?Z3hkaSt1bHVjUVNsMWc1UEVVUFQrU3FpYk5IdU04Vk1QeWdQR24rRktFNngr?=
 =?utf-8?B?Z3d1TXdjM2ZkQWZXOExIRUNiZndiNnY2ZVc4TlRoeEJSdW56SFA4ZWJUMlRn?=
 =?utf-8?B?eHJSUEM3Z21jUVRYZUxGY0lwcGRPaFVWU2ZYTU5RcHhLZnZ0eXJ5RVRnQUtQ?=
 =?utf-8?B?ZENYRWU5c3dISE1WZkxDdU9FUXBrVFh3b1NVTWdFQ1ZaQnRYb3NOWGV0N09K?=
 =?utf-8?B?M29oV01rTktOYjVxR0Roc3A2Y0VkRjNQV0dCaFBtcjRFa3YvV2w5WWNEKzlG?=
 =?utf-8?Q?tW9nfv0E3X9cho6svezadGXk9?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pKSCA/qvdUJAwZquUQH+NnwhIkQmsk2DOZ07E9RQz9XhsNhCoUffbxfdSeITUEoYsAWvPbp/knQP+C24F/0xD32keNjhhkmeougrMAgsDlVE3gbCFsHy/+IYEcDA2MuzJ9ubuZELakLLNNRJFrEGMyfgHeJUkJDkDmqf3SskIFJXwnPh/m5Abq/nkpVvfzDyvBECFlGlwWGOTPMdtDWt/nR4C/s2nYvjZVQOxhfk0jFzOVw8k0O7pKp86JFh2qCxhYRaXkF4QKG57W8uKws/+6FGuSPCK8sLwvYDdKGvkiushU4qsvVuqfW7TkY3AWFz0jwiBvrW32vLRC9P0bDg2PLYSFkxfb7LunrTdeN/Di1KZAn2TbAPMv+MVomWlMSnMVLQdrRf4iqQk3qMkX+QZnpFSGLPFC09LxLp38EjGSxxAwv6gBgUbZnBlZg1NfWCG6Pv8CYqEn0yRW1Uo+vh4mXXkYtX/Dw7/E3UAIWWtL1887/0EtreGZvAtAiOtYTQt4nlIoHIy6qGcXNV7BzipquiN5HFw3SUHhzpVAcwHRWah+v53gzn7Q49xiWFabnoADMXr704lihA+ntBeq04GFGRuUoEyu63/t2f0LovlSg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07df0feb-073e-4b29-055f-08dd1f9b9108
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 19:38:37.1741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GPcgtK+qu+Fh3T2Hl9vrn5HUIjpkdRP7UMFv+dfRvtF6Tn63AS1ep/9/GzSdfPPh0V1Dw6JxFrWTKQhxyrQdSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7210
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-18_06,2024-12-18_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2412180152
X-Proofpoint-GUID: 5Pg2BX1SfO-p2MHDlkC6aHOewNueyK9n
X-Proofpoint-ORIG-GUID: 5Pg2BX1SfO-p2MHDlkC6aHOewNueyK9n

* Suren Baghdasaryan <surenb@google.com> [241218 14:29]:
> On Wed, Dec 18, 2024 at 11:07=E2=80=AFAM Suren Baghdasaryan <surenb@googl=
e.com> wrote:
> >
> > On Wed, Dec 18, 2024 at 11:00=E2=80=AFAM 'Liam R. Howlett' via kernel-t=
eam
> > <kernel-team@android.com> wrote:
> > >
> > > * Suren Baghdasaryan <surenb@google.com> [241218 12:58]:
> > > > On Wed, Dec 18, 2024 at 9:44=E2=80=AFAM Peter Zijlstra <peterz@infr=
adead.org> wrote:
> > > > >
> > > > > On Wed, Dec 18, 2024 at 09:36:42AM -0800, Suren Baghdasaryan wrot=
e:
> > > > >
> > > > > > > You will not. vms_complete_munmap_vmas() will call remove_vma=
() to
> > > > > > > remove PTEs IIRC, and if you do start_write() and detach() be=
fore
> > > > > > > dropping mmap_lock_write, you should be good.
> > > > > >
> > > > > > Ok, I think we will have to move mmap_write_downgrade() inside
> > > > > > vms_complete_munmap_vmas() to be called after remove_vma().
> > > > > > vms_clear_ptes() is using vmas, so we can't move remove_vma() b=
efore
> > > > > > mmap_write_downgrade().
> > > > >
> > > > > Why ?!
> > > > >
> > > > > vms_clear_ptes() and remove_vma() are fine where they are -- ther=
e is no
> > > > > concurrency left at this point.
> > > > >
> > > > > Note that by doing vma_start_write() inside vms_complete_munmap_v=
mas(),
> > > > > which is *after* the vmas have been unhooked from the mm, you wai=
t for
> > > > > any concurrent user to go away.
> > > > >
> > > > > And since they're unhooked, there can't be any new users.
> > > > >
> > > > > So you're the one and only user left, and code is fine the way it=
 is.
> > > >
> > > > Ok, let me make sure I understand this part of your proposal. From
> > > > your earlier email:
> > > >
> > > > @@ -1173,6 +1173,11 @@ static void vms_complete_munmap_vmas(struct
> > > > vma_munmap_struct *vms,
> > > >         struct vm_area_struct *vma;
> > > >         struct mm_struct *mm;
> > > >
> > > > +       mas_for_each(mas_detach, vma, ULONG_MAX) {
> > > > +               vma_start_write(next);
> > > > +               vma_mark_detached(next, true);
> > > > +       }
> > > > +
> > > >         mm =3D current->mm;
> > > >         mm->map_count -=3D vms->vma_count;
> > > >         mm->locked_vm -=3D vms->locked_vm;
> > > >
> > > > This would mean:
> > > >
> > > > vms_complete_munmap_vmas
> > > >            vma_start_write
> > > >            vma_mark_detached
> > > >            mmap_write_downgrade
> > > >            vms_clear_ptes
> > > >            remove_vma
> > > >
> > > > And remove_vma will be just freeing the vmas. Is that correct?
> > > > I'm a bit confused because the original thinking was that
> > > > vma_mark_detached() would drop the last refcnt and if it's 0 we wou=
ld
> > > > free the vma right there. If that's still what we want to do then I
> > > > think the above sequence should look like this:
> > > >
> > > > vms_complete_munmap_vmas
> > > >            vms_clear_ptes
> > > >            remove_vma
> > > >                vma_start_write
> > > >                vma_mark_detached
> > > >            mmap_write_downgrade
> > > >
> > > > because vma_start_write+vma_mark_detached should be done under  mma=
p_write_lock.
> > > > Please let me know which way you want to move forward.
> > > >
> > >
> > > Are we sure we're not causing issues with the MAP_FIXED path here?
> > >
> > > With the above change, we'd be freeing the PTEs before marking the vm=
as
> > > as detached or vma_start_write().
> >
> > IIUC when we call vms_complete_munmap_vmas() all vmas inside
> > mas_detach have been already write-locked, no?

That's the way it is today - but I thought you were moving the lock to
the complete stage, not adding a new one? (why add a new one otherwise?)

>=20
> Yeah, I think we can simply do this:
>=20
> vms_complete_munmap_vmas
>            vms_clear_ptes
>            remove_vma
>                vma_mark_detached
>            mmap_write_downgrade
>=20
> If my assumption is incorrect, assertion inside vma_mark_detached()
> should trigger. I tried a quick test and so far nothing exploded.
>=20

If they are write locked, then the page faults are not a concern.  There
is also the rmap race that Jann found in mmap_region() [1].  This is
probably also fine since you are keeping the write lock in place earlier
on in the gather stage.  Note the ptes will already be cleared by the
time vms_complete_munmap_vmas() is called in this case.

[1] https://lore.kernel.org/all/CAG48ez0ZpGzxi=3D-5O_uGQ0xKXOmbjeQ0LjZsRJ1Q=
tf2X5eOr1w@mail.gmail.com/

Thanks,
Liam

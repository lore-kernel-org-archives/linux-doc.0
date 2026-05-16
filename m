Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020116.outbound.protection.outlook.com [52.101.195.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4804F191;
	Sat, 16 May 2026 14:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778940786; cv=fail; b=ODbDIRuQRJQVAW15lc7xsUVsqx7GwA32r0oAZ9iByR/Nxd/6rqkn0ijnFf3kHN/YITLr/zmSFkN0oYxH9bjhZuH9suhE4cqfRDE4fCgxNLGEpiv6GKvBE2uirBeSUmesbbsso7o/1UV84PFnll2G12oAbd2RRgV1LzKiOP2IW44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778940786; c=relaxed/simple;
	bh=IYe05sl5caQEPJC/V4y+A5q0oNk4VRKlEM7VUCqGk8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=n0ibNTCqDxG68PzPu6jU5ZGGp4UCoDMpSrRbc/ec3Xsj3cK50JWzGh9aI6M//i9Pq/3CJLQ82y6QWHlwSC2K0chTpI+pu1CS0Di3RyJSwxryhWPl7kLCIiftlMZ+2HmB0KvUmnCk5QFl2yAIXgeMBKtd9vu6zcv2aLzVA2pzIVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.195.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tw27M22/r9hik06Va6FTKM8V4Ek9wjKW0S939UQSYFoWAeff7NKk/HQXzKldlqx6leEjrAhy9uhTrIEiaCkejidD8ZvMdOIbivTdF6Fzvw/RtG14ufyIjO/VOETGADE0THUqnIde9CUI2qMrdp6wz0119oSPGGNgmIl1MVwv+EOEPHiccIYRF9SDlSaY+yhEJwIZjHod4PnWCfqia3jimmi6ikWUclE5zV7/Z3katStSq4IVFMkjT+ibzY4sQW1wEklFtR6rTgIOFYt5FiVPVfHyMzfFmsI0DEZUY/pcvuY/ptp3C/LAbBvOEfY6OjPll84+vIbx5LqnLkC6AVOsVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pr3jGN7JE7RS8nf0t5cwKW71wvjtnG+9dQuUczrXGEI=;
 b=ZXnb+8EGOxqEkaK65ykqxvi/E2LV0uPanqGabpxUJ5iK7WkSkvCVr4A/LLFXfNLJKOZtaTNS766l6njXLK9HlRqj5myCPxMJ/xUt8R5NFHCIhHfpjVZIrJtq9DE5VMRsW8C5HW+VEMTi8h06YtMx81WNyq/NdPvcWqZJZ6nspmpMm03X0FywTrK3BAIUlwYuI9qgVcgpfHJkdM+3Mpf7sJxkQuY2C27m53Hlkgg4uO4YrqcweXmqDSHiaamfJ0pPZhzVHUdmHQCQBIig55kxYjr5oT66aTHt+WlXHoTeoS+2xOvrcDBcElHbS5mPge0RYLJnlV2jtxNTTuuB6ly6RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:70::10)
 by CWLP123MB6608.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:182::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Sat, 16 May
 2026 14:13:02 +0000
Received: from CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 ([fe80::de8e:2e4f:6c6:f3bf]) by CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 ([fe80::de8e:2e4f:6c6:f3bf%2]) with mapi id 15.20.9846.025; Sat, 16 May 2026
 14:13:01 +0000
Date: Sat, 16 May 2026 10:12:58 -0400
From: Aaron Tomlin <atomlin@atomlin.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, tglx@kernel.org, 
	akpm@linux-foundation.org, bp@alien8.de, rdunlap@infradead.org, dave.hansen@linux.intel.com, 
	feng.tang@linux.alibaba.com, pawan.kumar.gupta@linux.intel.com, dapeng1.mi@linux.intel.com, 
	kees@kernel.org, elver@google.com, paulmck@kernel.org, lirongqing@baidu.com, 
	bhelgaas@google.com, bigeasy@linutronix.de, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: kernel-parameters: document scope of
 irqaffinity= parameter
Message-ID: <4wkrwzwng2bvtmjntc2i2h6eijrec434cksvwqu5vtidgepm2i@5sxuzbuqm5zv>
References: <20260421150911.42404-1-atomlin@atomlin.com>
 <afMAAL4lB72HiSQI@archie.me>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <afMAAL4lB72HiSQI@archie.me>
X-ClientProxiedBy: BN0PR04CA0154.namprd04.prod.outlook.com
 (2603:10b6:408:eb::9) To CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:70::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB3523:EE_|CWLP123MB6608:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f478af0-1b25-4ab9-37e8-08deb3553d31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|56012099003|18002099003|22082099003|4143699003|3023799003;
X-Microsoft-Antispam-Message-Info:
	We5gAqLOuLiBMJGk7Hv7va4uMCCfPWu7Lebk8q7S3J/YA8945K1LgRxB7H4lwywwU1WEHVCIOLEZ9qWAgFA8eyTiIc5P2OjEEKM7P6Q5xndQCLCeUE8phaQWOwk6aJxlbRAOc0XmYB80SfVPlrKcHnXnYoZyC7Ug5yR0lTKt9SiA6TJ7D4Ijztj2Dsea4q+AldHko7FbT6zruDBLK05fvFrfsH8JpM1bZSNFaRAMfGcJGJpz3/WZs1SxSV5K/W1H0G2KAZ/yc4N36V3RWmcbSJLBPExOIFSGi8+0Py1REMZqNclcDdJ06SAS6GdJs5x06rOWiJIEgW651IjAZZyfrP7aQF+X3bqCF/gEsnx45JLreo7aUPGzKcqvzHgAh7L88Y+Fh7ViQGvfegcQRS9VfKXWPMVTap9tp7MEqTc2vAVNIk4LGPO4Cjpka6W0JEYxHXq7wVy4eYebI9EgdoF/bGietzHy0e3Y2h/N3o9gqz3UBBiukDnzIHsV8z60Fra+Baecrhp88rN0MV8Xz7nnL/Rg291QhCP0f5X1FSt0p/mde6MTGhmVdtc9JgBX0pya5VXB2gWEGrjbSLdfINsIpPm57PF2b9viPrYLHGD7IX9IATbyZhQ9IKRrgtVkwQyOGuE74PIuqp9NqcBb7HYUIxGwoGcV0jzSnCae2g3MkrhTR6Ibk/0sLpX1WnUEzKPl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003)(4143699003)(3023799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHpaWDdUc1A2ZncrVXVXZ1AzOEowYy9veDdiLzZ4T1RweHNsY1gySDh1Ni9u?=
 =?utf-8?B?Q0lEUTJjYmhObWRFZVVoa25LbmpmN0NNM25TRDUxRm45dUVWUlBTN0Y1cHlK?=
 =?utf-8?B?VXo4a0RHQlBlQnlHdWdTSmx4UUVsRC9HZmIxQ1VPbTM2Nmw2Q2gwYndpWkJi?=
 =?utf-8?B?dWFzMXFUSlpLa2UwODNyN1VKVHpJUHhHZmdXVGdNMGpLdmMySDE2ekNpaFNF?=
 =?utf-8?B?TXdneG5YbG9oUVhkSXVYdkx0Y094RGhFekFaRXNlTmdQalZwQzZwZjRDaWhU?=
 =?utf-8?B?dU9IazFPSXJWVzRheGNuT1dVUHJ4bnU4VXVqMEg2aWdJNGlCb3hBRlR3ajVJ?=
 =?utf-8?B?bUdzN0NkaER6amJwbEhSeVpZWW1CcHFFcS81bnc4M1U0STBLR2JHcmx0Y2JL?=
 =?utf-8?B?ejQrOVdwaDNweXdNYVQ3OG8xU3UrV3ZXS3JKQWJyelhreTFLbzkyeUw1OTAz?=
 =?utf-8?B?ekF4d0hFd0xzWmVHK3BrVmllM1ZjaGY2RmxUSW16NHpXTmYzK0wwMHB1ZlNV?=
 =?utf-8?B?YmdqL0IrZzRGS2l4T0JJNE8zYlBEamUxWkRzcmNXaXREcHVPRGh3RUxTUnNJ?=
 =?utf-8?B?QU5JR0F0L1JKeUVTdEE4eDlPeVo3emVvbi94TU5pb0dlaE9NZklJZ084QjNL?=
 =?utf-8?B?KzdwVFJZM202dVFSay9jd2FXaVRaeGxpU1RJWkxXb2MyR2NyUTFkdVhRZlo5?=
 =?utf-8?B?czZPZVFvdGt0YklXazRSY2EwWklxRmJGMWJKOFlDNjF1UmNnUU8xbXhBQ0NX?=
 =?utf-8?B?YWwzcC9MbHdmUmhwMHJNUjhrSHkwaTdXekY0SVpGVk8zNUw0Z0tOYW1ZKzdP?=
 =?utf-8?B?WTJJYlYxcFI2UlRJSlFKeWkvNis3V2htd2pKbFdnK2QxUU94SkRNMEg0YnEv?=
 =?utf-8?B?c1JpL3J3dTN3TGhjcHZQWTY3S0tZcDNBRGpja3dHdWxwaW96M2tUT1dtMmdH?=
 =?utf-8?B?N0RwWFhkZ3BmMzVSTWMvSnpFeXBYR2xwZHp6b01TOEY1QjVPSDhMOXJMWHR5?=
 =?utf-8?B?Rm9vVXNsSlVJS0ZURXFjM2pFRHl3MkJzSFZoWFVvWWphVUhrL0poTjlaWFFz?=
 =?utf-8?B?RzA3SGpJM0YwaTlNRjdEQTFwWmZKc1lla0cvZnBSTDgvYmM5clJKSCtWVnpZ?=
 =?utf-8?B?N084NEw0cXRtdkJDYldyNzlZRHNBQ1Y1aVg4RW9KMDVmVE5hWWliSkNFb3ll?=
 =?utf-8?B?OENnWXRMRkg4a2ltK0RCTitjZVlWcDJ0NTRkUjFVOGJ1VWNXRlJaVmNPa1cw?=
 =?utf-8?B?MmV6NjEwMUtCTDdMYVloVXliOWJiN3hPZVZVR0N1dXRibHNhTU1rLzFQRjNm?=
 =?utf-8?B?cmNobHpHL3NNYXFSQVdqMkRCejkxbFZOZUUvYytCMFBIa3hvUjZ1bUVuR0Yv?=
 =?utf-8?B?VHhURzQyUzVtdUVxV205cVNuN2FOL01DVXJtdW5oSlNhbUhWT2ZaajY3SGdH?=
 =?utf-8?B?ZVREVHpTd09HbWVuNnEvcFpKQ1IxSVY5WFZKSU1xOGxocXlNejgxN0IzT2ZV?=
 =?utf-8?B?ZE9vbjh0TTJEejc2c2hRcjJVZEFOOVdDWlhFSXdRUUxBUEpjYzRQdEZ1NTQ0?=
 =?utf-8?B?ZVpVY3lWTktMTlNkdFlNeXRGN0d0dzhMNUsrcllqS3crYVlseStJVUw2SXRm?=
 =?utf-8?B?RVpEbXBiKzRuaUhaa3dFVXBObURIZ05hY3Z6c2o3YXU0aFN4WVAwWmhLSUM0?=
 =?utf-8?B?ZW1zNEtnUHZjeUN3WFdBNXJmNnlwLzk0UmVTUFpsS0ZpTHNPVFZhVEh3MnhL?=
 =?utf-8?B?Vi9FUjFBZWFjdk1RNGNlNDk2Q3J4MjdCRXRrd0ZwSEtod0RLREtPNjh6T2RM?=
 =?utf-8?B?OHdiWDgzd2JlT2w2cVkvc2xCRmd5N1dTemZYeEhnUGFZMm9rcmFVWDZsYS8v?=
 =?utf-8?B?WFVuYWx0RTdwdWE5UHBXNjRPT3AyYVpkeXVFWDV0SC8wVStIMS9RVmdyZ2JH?=
 =?utf-8?B?b2pYNi9mMDNFN1JCRnNLZlZaTFBrSjhhUFBDcnJ3U2RkcmVFY29zQ3NNdTNy?=
 =?utf-8?B?K3Z4RG5GWk1CeUE0MGFzWW5xOFFIL205ZVVVam1pYkh3QlEvVFo0OWJDNWFy?=
 =?utf-8?B?N0xyTW1KM1BrY1RFUHd4eXF6cE00bExFQVQ3cXJVRzg3MkhCdGJBRlZCVXdI?=
 =?utf-8?B?dkswYmh5cUp2OW4vaEhSdHVic0t5TWx1eER1Mk9pY0dCQmxGb0VmUEE3cVZO?=
 =?utf-8?B?MGxSZy9vWEVWQXJtbmw5NG1TdjQ4TzIvQXBHbnhBZWhsaG9VNDVMMlVuNUlq?=
 =?utf-8?B?eHRzVmxtTzVhUWpFRURNK2w0ZzRoWnUvRmFkQ0hVOUhhS1FneXp2ZHlJSWkv?=
 =?utf-8?B?cEE5NWg5eUdzK3pLRDJJc3VxWVBXWTBYb1M5LytYbUhWc01mRDMxUT09?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f478af0-1b25-4ab9-37e8-08deb3553d31
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2026 14:13:01.4697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4O3Ayu11MxuZkOqaviTtKm+D3yFEKZdGkB7zK9shubXEljlxXisRBJfSsCjt3JurhEG3hZwRMzN2hOvISLiFuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP123MB6608

On Thu, Apr 30, 2026 at 02:08:48PM +0700, Bagas Sanjaya wrote:
> On Tue, Apr 21, 2026 at 11:09:11AM -0400, Aaron Tomlin wrote:
> > -  This can be verified via the debugfs interface
> > -  (/sys/kernel/debug/irq/irqs/48). The dstate field will include
> > +  If the Linux kernel was built with Kconfig CONFIG_GENERIC_IRQ_DEBUGFS
> > +  enabled, this can be verified via the debugfs interface (e.g.,
> > +  /sys/kernel/debug/irq/irqs/48). The dstate field will include
> >    IRQD_IRQ_DISABLED, IRQD_IRQ_MASKED and IRQD_MANAGED_SHUTDOWN.
> > +  A managed IRQ will also include IRQD_AFFINITY_MANAGED. For example:
> 
> Use double-colon syntax (i.e. ``For example::``) for literal code block
> below.
> 
> > +
> > +    # cat /sys/kernel/debug/irq/irqs/87
> 

Hi Bagas,

Thank you for the feedback.

I will resolve this in the next iteration.


Kind regards,
-- 
Aaron Tomlin

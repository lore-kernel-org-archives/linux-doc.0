Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010071.outbound.protection.outlook.com [52.101.56.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B204232143D;
	Mon,  6 Jul 2026 19:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783366006; cv=fail; b=BppWTgJGMDOZMiyY9Ur8ZdBQoQYyf2Ud0yXW2YCMXHpPBAoksQo6QLu7sLK7VArnn+X03s25WoR4NYZJ2kf0VRgxdNVFjKQTDD6cFMRelqeq4En0huIoaNvhCLWepBpNomt9NLJUYGTDNlJo0+Uvxs7aalcFSDDstdxu8lwPbF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783366006; c=relaxed/simple;
	bh=xIRjJTrhRM4qD/kArTn3CdGUH2vesRiFwnrP87kILXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QPU/FHSCQbSqERVddSA2fH5tPJ8JWyh+1OTUY2WkWrFUK2jJK0CxdGcQ2RrpId+xQZ126Cf6ZiRPXbN1BRaX9X2fZgKQ8OiUyt5ilHtf8v950Fx+oHrzbq212N+UFYSqutodXmtwtzs7JaILpYE0MpwMsQ8nKFAbB/+ABOCjTME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ydwhpb0e; arc=fail smtp.client-ip=52.101.56.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ydwhpb0e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ge/xKyW4EBB4mpKDgZXEv4UJXcSb/V6Kv8Ks+nGimxAR2pv7DpL5HqzWFZouIdHv/Kxvsy6HGqGQKuE8VXzTKV5VrgCNexZfakiF4xDhvU7AHlxPwfNSW1rlo8nyGwSY3k+W6my7xZnLaw3fIZZaLdXPOSdPDwVc29LEmQCN9N5wc7ece7f9PsDbLgEKoRyEDWVLU16stLvsaCIcfR0JTGCI4MsJFYAmU9TeABuxrnXmBoViuoFyHFdBvABEFXrJ2JhQy6YQOAoFS2DIsJQmyJTx9VSCHGhzjRBz7my8Z3JFfEc3cDw8ybrolUF9PgzZ0n+Z352iP2y4Ra4uQPVoIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x2bVm5A1nuw5GPOG7J06KqIdtDWelxaQ0Z5vQvRC6DE=;
 b=XUL0ZnTcOHkto7KkCVugYhR1CJBmLA5VPGqZ0DDKys1hJ3HBsXboJxg2vYoZdxTlODfZR8J/FYx8CIqcFoeXEc2Eiri0bf9//oiRP416gb19Ii7fTxVQrdTWaia7oLzhPwF0uahG9dzFhaonATUsDUkEGW5CeKeek5W8w86bhH6l6CTZIsgUGqOdUP3+Z+mBxBvwtLXg1PKJWt4+kniYDlItpN1P/n4gbns3kqID2AEo48PN2NU/AWWBAcnVYA6NsazE8dgcoepOpMpxmo4vDWIZ6M5fo3zg0/f3QNsup4dYu4QO+RXKGcEaCv0kSMS7E3Sk9rgpG6feHYO8ZeFpUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x2bVm5A1nuw5GPOG7J06KqIdtDWelxaQ0Z5vQvRC6DE=;
 b=Ydwhpb0escOEwf0D8qrzDCjTyyKSLGOpigr6HXa6pW2Tq/A4TP20mNZnbUQiL6vU2Wi3sAYtTV2C7U1CZDhdhVt27ruoxUKL5hVh9jA7s4JXYvpThXyrlNnK4eZ5IVWC8X89+W64VWffAV7t1XmaOBYxc1lDLnH9Kp54yWk/JPjGlyFsWBft7GbZbR3EwTm3FnMZce3dxe57rDfX/qQFcEm1F16f2R7+miNb+WppusQQU7ii0wKf1k68lIcoI5bO19d0T/aM83INVeEafx+ybyeRGhm/Fvu2y9OoVKAP1EE4HK4Vxu0Xt5N+h+GjhgkAEQRnHt1Ox8ujV/JrW7St8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by BY5PR12MB4211.namprd12.prod.outlook.com (2603:10b6:a03:20f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.12; Mon, 6 Jul
 2026 19:26:38 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0181.009; Mon, 6 Jul 2026
 19:26:37 +0000
Date: Mon, 6 Jul 2026 15:26:35 -0400
From: Yury Norov <ynorov@nvidia.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, mingo@kernel.org, peterz@infradead.org,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	yury.norov@gmail.com, kprateek.nayak@amd.com, iii@linux.ibm.com,
	corbet@lwn.net, tglx@kernel.org, gregkh@linuxfoundation.org,
	pbonzini@redhat.com, seanjc@google.com, vschneid@redhat.com,
	huschle@linux.ibm.com, rostedt@goodmis.org,
	dietmar.eggemann@arm.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
	hdanton@sina.com, chleroy@kernel.org, vineeth@bitbyteword.org,
	frederic@kernel.org, arighi@nvidia.com, pauld@redhat.com,
	christian.loehle@arm.com, tj@kernel.org,
	tommaso.cucinotta@gmail.com, maz@kernel.org, rafael@kernel.org,
	rdunlap@infradead.org, kernellwp@gmail.com,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 19/23] virt/steal_monitor: Provide default method to
 get num of CPUs for steal ratio
Message-ID: <akwBa4aXjsFkrMOh@yury>
References: <20260701141654.500125-1-sshegde@linux.ibm.com>
 <20260701141654.500125-20-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701141654.500125-20-sshegde@linux.ibm.com>
X-ClientProxiedBy: CH0PR13CA0023.namprd13.prod.outlook.com
 (2603:10b6:610:b1::28) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|BY5PR12MB4211:EE_
X-MS-Office365-Filtering-Correlation-Id: fe0fb141-323d-49a6-08ee-08dedb947fb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|18002099003|11063799006|22082099003|6133799003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	Kb6M7rAzky2LkvZAnm6cSPUQ8SrvaGp6YUt/eZe4FQvQ/mR5JAUj7CRA83i1kb5tS9hmJ0ziZxrrsW2fT4DFyxb6d5pR1cD66ZIjSF7/IlgQAMIATASIrpeHjxWMzfzGxEhzCMNjoE09oya7MJbkV0ydw/07F0Sl7DklwCsMQHB5v0EMwhUg8Hhw7AF34ualqJymlA47bzEb0uDYsAwRLBKfdlggJ1JeVkNI6O3YkzLyRjfz7MNqAWemFbq2YumdzHIRMvLbncU9cL3stNddQ417KQyrUc95nwWy5K43OA6ir9jO9KiZ6AHr5sVmekDX2ToT+PiLUviNQtFZ1hsmxWyMiIaqi7VVmt2pdy9+SlzaouOannGNBmF1AZv7q+EwueI66NGs6UFBdOrWJMTfylIC++lIGcz0H0o2PMattXt4fHR9tIa5tKPJmqhjNxgPdLSagdOE/8e5ydv1kYQFlRxKneJH2sVysqFr51a9BDeqyQu9hyxYybxZA377p2FeRYS81QGjry+i269W3+5LlxTSF4uQM7OSmYPoWCFDphhlQ8uyvWXEMD5x947TOpJRtfKAePCw6QAUowK5z7XLfYo6pJ21gM+24CfpdQJ1xacUswuJ2t4/7lokUxpbmifXKh77db9S4y3vNqZ1nWM/AQHR9rK65Y+8pOdsA6A30O8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(18002099003)(11063799006)(22082099003)(6133799003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XXoXe4hms/YkWKGedP4wjLQw1aOMAoiGA7foNNMwSd0grOAKFy+2D6o8snNm?=
 =?us-ascii?Q?mkZ2ANYFrd/RojAqsv1QpePohgybrm74CSWGSEmbS9cUrDwr7p97qpzel2iw?=
 =?us-ascii?Q?ga6fBbvRVebvSt7Y3YAjBED1KBLLYk9j5xKTrLrPWBCDyn96ujWW88TxNGvw?=
 =?us-ascii?Q?GpZoouiEeKpAnJd4PXXK9CsWstXFsADpEh+wcB+Ly9l3IoiMyOu82g3/57rL?=
 =?us-ascii?Q?pYRc9x+HO/42586nOi1xthHiooBzFi6PSzSqN/6GNTLulkOoNj0XBJltzCWL?=
 =?us-ascii?Q?WlTY88yYkd5lWCklGMdInEDGZjCc8Ucn2rtlOq8pHkRkffUZiDqNuA52oMqe?=
 =?us-ascii?Q?kJtDv11AVP0J+KzrlIWz8p8oyes/AWvGRl6MZ1LN2Kfjj1FIuGlv5PLHje2G?=
 =?us-ascii?Q?JXgMe/WcJ7LyexnY1cA9iiA4GmMzCTI18439ebVcMhcaSO0/T4pwe7ioecko?=
 =?us-ascii?Q?o1uCu2A6bKJhmNHxRWM/FiBjL9Lh1ceCGPs6oVH1z1Brn/vVrQY6huUt8G+K?=
 =?us-ascii?Q?D2Ec2uvbCAgkDOR0MU4LYhvGKVxGGZSEp9hSB/68cRntTaTfALo1fp6i+mCG?=
 =?us-ascii?Q?2dP8CGWxCAbED1CbwIJbFad+FswF1e+vJg9Tz0EYVcKNtgCqkSvgWyn1TZiX?=
 =?us-ascii?Q?KJ4YrTyFzGsrR0XpdedQNH0yW+NPM27OQ5esMtWrF+eZo4unWBnOv9kY25Ia?=
 =?us-ascii?Q?/Dzd12ioov2guK65Z/+obiiayotR0DFU42dtjjZ4RWWe04gSa5bqPsNHcYQS?=
 =?us-ascii?Q?xtaMdN8tVLHt6+IbnAsQZO8SZ1YYA5RXSDk0nFKs7z/WFNVZhtfiemIeevv/?=
 =?us-ascii?Q?8R+dWBOEC4Si/WQ3xs7vZckH6z9JT1CrRgog6LFAtyKZGBlE07kI/VxLmUOM?=
 =?us-ascii?Q?4MLItN0TaBZs5HheGJCP1xHeBF+TMcPC5T6dSIXfuTyrkY0WShHnKmqKNgJZ?=
 =?us-ascii?Q?kXvjvgftzt5FTHfv3IaWS7GRdCiE9gpWAVEr7Fnmxp+5+M2IeVKtA9C3qBtQ?=
 =?us-ascii?Q?9OxKHcAQK1vIg8XBbh22MI+QD9ePbu9S/rNfZCaApO+q8KItbMtNNIAtzQH1?=
 =?us-ascii?Q?YWHULK9YUwyaKIFRyJiv3w9/+FDoArzhg5ATo2VAniRJHZh8BHnfk8rcAE9S?=
 =?us-ascii?Q?KY5DgB2pzsTnrPkL8Gd2zVLg3nPrdj7fZKcXfrRO7JbbQjh4uH0TYuaDl5wx?=
 =?us-ascii?Q?Kg5dEUfQoF1gG7n2gFtuyUrcIKjgGjfN/gj/hF2V4eRpSOLdfZRzDeDGPyX/?=
 =?us-ascii?Q?keBy0ZSRQaK67u6uW0l0BQPGyklD1jgsPWQTRh8CMIQJQ+MDvASDTUriaqWL?=
 =?us-ascii?Q?rrGJfsdVTpVljVZ8PRbWaEc/ktutd7vwuttKK8OTuCnrdSqlpvBII/KwJmXR?=
 =?us-ascii?Q?KeLfkdoXpQR8qXUFRa1+xtpxificQuVmz0JeWX9TGFVdHhoHwW5JLxoSY+XR?=
 =?us-ascii?Q?vOkhzhIgyiNLs/yzTnYOjOQN2xmEr8oip9MtWaafzsYXEl0+aUhKmiW2BCnI?=
 =?us-ascii?Q?ETfJ8rUwEZj68BA89rZqjbqk4fsFOI3fyh38fgk6y2kJJ3VQ35IB3pV9YJQd?=
 =?us-ascii?Q?keeh2ovjxq4sOdrGFROiJ1UMR6xRqCJgffSTS7vl3TIY+ANIz9nd2gssGWwz?=
 =?us-ascii?Q?ldXlUP9uGm00/nzb+9SXr7cDsirQBR4ga+5F6H/t05y0MaoXYwcZHKHHAVXp?=
 =?us-ascii?Q?+pxe8ESL94sB9iv57dgTnCIET9RAWQJtLjRMcEO6NxtZxmZ2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe0fb141-323d-49a6-08ee-08dedb947fb0
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 19:26:37.8687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8t2PnsWMx1AA5LnCgig9YeSajksuZtNSQQa3jqM7EpUIfqAXw6/PyuFla57OVItAZlOhnglmW9Sx8rxOaJOUuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4211

On Wed, Jul 01, 2026 at 07:46:50PM +0530, Shrikanth Hegde wrote:
> This method informs the steal_monitor core, how many CPUs it needs to
> consider for steal ratio calculations.
> steal_ratio = (delta_steal * 100 * 100) / (delta_ns * number_of_cpus);
> 
> Default method returns number of Active CPUs since it calculates steal
> time across active CPUs.
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
> v5->v6:
> - Add cpus_read_lock() for hotplug safety.
> 
>  drivers/virt/steal_monitor/defaults.c | 11 +++++++++++
>  drivers/virt/steal_monitor/sm_core.h  |  1 +
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/virt/steal_monitor/defaults.c b/drivers/virt/steal_monitor/defaults.c
> index 4e2e5b233948..70dcfb1ce4cb 100644
> --- a/drivers/virt/steal_monitor/defaults.c
> +++ b/drivers/virt/steal_monitor/defaults.c
> @@ -27,6 +27,17 @@ u64 __weak get_system_steal_time(void)
>  	return total_steal;
>  }
>  
> +/*
> + * Return number of CPUs to consider for steal ratio calculation
> + *
> + * Default returns number of active CPUs.
> + */
> +unsigned int __weak get_num_cpus_steal_ratio(void)
> +{
> +	guard(cpus_read_lock)();
> +	return num_active_cpus();
> +}

How is this lock supposed to work? When you exit the scope, you can be
interrupted and your caller will get outdated information.

The other callers of num_active_cpus() don't bother taking the lock.

> +
>  /*
>   * Default implementation of decrementing the preferred CPUs based on steal
>   * time. This is simple logic and decrease the preferred CPUs by 1 core.
> diff --git a/drivers/virt/steal_monitor/sm_core.h b/drivers/virt/steal_monitor/sm_core.h
> index 030f6236c38e..794d3be04248 100644
> --- a/drivers/virt/steal_monitor/sm_core.h
> +++ b/drivers/virt/steal_monitor/sm_core.h
> @@ -26,6 +26,7 @@ struct steal_monitor {
>  extern struct steal_monitor sm_core_ctx;
>  
>  u64 get_system_steal_time(void);
> +unsigned int get_num_cpus_steal_ratio(void);
>  void increase_preferred_cpus(struct steal_monitor *ctx);
>  void decrease_preferred_cpus(struct steal_monitor *ctx);
>  
> -- 
> 2.47.3

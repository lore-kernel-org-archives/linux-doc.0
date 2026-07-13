Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011029.outbound.protection.outlook.com [40.93.194.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC1B439335;
	Mon, 13 Jul 2026 14:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783954444; cv=fail; b=Z3dcmX61ZKl8u4N6S6eLVdguffmrvF1F7+GMGN9QdNOFe2Ul2FwE98y8u0AFhekidnLIUSB8EwcMQg3N66C8CRcUHiJuOFobXwc64t1PkqPfOaFC8nJGFJfr+rzyyvAcqzUR6tL8Ra2xkcJ8Cum4Rr/OXLNS/WJaelbdSju1v4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783954444; c=relaxed/simple;
	bh=MHHIocul/N+KhHQH1b8hjknuIBbQLltjo9WfyyAMn3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qiS3J6BDTub+Xj5vGjHlgFu/0UseMoAfD9k8RgJK4lDY7gMx1VyePHCUxA5KPbiPvv7G3Ibfusinz5fys0qdP+b7SANiLCJ2IYy3lIq/J9LUa06XgGklgPbZaTTpAaWzoIVyhGx3z4NIBH32WdhFWCsVBDBU7S9cGJ1+NHSa0aA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rwAX+S0J; arc=fail smtp.client-ip=40.93.194.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rwAX+S0J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ksevZDyPr2BzDHbcQp7SQZu8iXpUdOVL8MFqStd+f5BcqaKJqSNRV12m2Ck/1cNyWp/HytrHg9aHiqAb1pglYEnn7uZiPDHvCgNN3fYmsoSET6zKwWsKVjq2WtNM0GVArP9ZIewjDx90FDQNYcAvwz2pyhZE79H5W+4i/dNkeV5Xs7Gm1CzAwgdYY0FjEPsbAOFFjcmlyJkeYo40lUOPbE0iwVuGc1gqdXMWAa9aOiXX41j7soURpQLNEQXTLSsQl4UETHGfrWNQgCByBX0hjHBIk1+uDNKb4byQd7t/D2lLZPgsdi8MnuqeJGwaY25EsX+JkB58s+2Mgs0uGe11pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c5Rwd7Y6+jX9ZggMaYE0EQjrwuYL8DceUGBjRZaKO0I=;
 b=vFE5hpZphRLErXevB+ZUwW62eJR2M7S2h9Dq20MrOBZWSJcjxicqKB0YwwC6uh895K8Io92GHI3xD6iu663yqkv2QMxxZ9moUdYe2DitJ3bIG9ZpmQ0rDh5/l1g+k2FcKmHx0Vh2gzBAJxv/kbfP0vlLRWUAzqGkG0Epc7ix8S09uWSxVjvChk8YHIqfb1XM4JQAOt1VnxIUlQNex6jXHKsR0AAxTGvHUMiuS6h+Ngtg4suZEMyuWdAKYvnMUKLriXLlGap6Gyge34AjZDidNWGLaSOR6Pk2IIXka4ZtzX74SQsbciPRI8EFbAWrv82yfwdbK+NROMHW/L2cEN1Mrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c5Rwd7Y6+jX9ZggMaYE0EQjrwuYL8DceUGBjRZaKO0I=;
 b=rwAX+S0JFMcdhBzowYUinqR3hjowgR6QdbxVGJHL5kOf7i2SJfwT2s3dIADTYQmySg7y4KHhX75E8p+aA/G7wfuA1yrH1W98thu1Ir9ESv7EWRW1UfkCR01chvN7TBY/MWSlEHOFbKez1HcKtRj3hPBAnYXYVevb3VgxOYr9GgE4msTCwy/9JqakbR9c1Gl82s5gCruIcwuFpwUfvFgQF1TLy4E8uxmRnexiBa3d025sj0+5ptibRnxKY1abG3zc59q1xqjljDjpjgF10EPtjvlTj6HG9mBglJNTMTKMS5h4dcBJUpC5cqbMrSseNwf+CfoDLcdrBzGbgn+OMM98zA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by CY5PR12MB6622.namprd12.prod.outlook.com (2603:10b6:930:42::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 14:53:57 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 14:53:56 +0000
Date: Mon, 13 Jul 2026 10:53:52 -0400
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
Subject: Re: [PATCH v7 02/12] cpumask: Introduce cpu_preferred_mask
Message-ID: <alT78Nzt3xa-7G5Y@yury>
References: <20260709215648.1246821-1-sshegde@linux.ibm.com>
 <20260709215648.1246821-3-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260709215648.1246821-3-sshegde@linux.ibm.com>
X-ClientProxiedBy: BN0PR04CA0108.namprd04.prod.outlook.com
 (2603:10b6:408:ec::23) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|CY5PR12MB6622:EE_
X-MS-Office365-Filtering-Correlation-Id: 5222cd6d-9150-4cfc-efeb-08dee0ee907c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	X/l4vNNKTa5F/m1FX6ZVVbAYGF/uEOncFEukvkKSzD9L42IVuox9mVJeyfV/0McCH3IrcVYgjEgtcVNDDAco4x87KbsW6jHCt8VtBnuQRg4yyMQawkMXXv81N/2dOL6cVhWChktCtE4gYXh+8lShib8+rMPwpPpOFSztt5dmNQi+XFIoLTh2a6SclUalz/Wi/4pgtFOM6FL1L2jnEiywGVUnTjLPFmsM/FJeiYIuvF/aIFq80P2RngnU+L44Afj4//hQa90hdvOnZV/hUZv/X2sdRRgFOWvoa4gpBRKd4P5Ksdhx1xmru6jxHdH6Fit2wvJRT5PEHExGGjBxmoYexCkMrH1Onybl4JkJgDnCINv/h1N+yqqvw6301n0S9D2u0COSOHgoU6fwd+qW1kX3U4CBsdgCFSSEKlWEQuBJXsu27JtgxklcLUn7AUfCFW2n9XSRDsedkFbUB3Wal4Dx2XwkoNpbxvIbKxStjeRyLJtbigSjyJlTUBxWjjsdIJ6ZlEb6hsFw1NrhsLF7T0HaaJfwrWTm+OwZb1+SAx5pkXkJ+nlERt0vk/aCyTxDOUmtpHU8ev8/sG9HbvC47gEPDnMp9b0E6095mZC/QOgyShVvuOdMNhx+Rayk80irMbUn6dvkpTt6PRdW6taZeyL5vEnxCl+Y1qKIcYoUlvrUW1o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1ZaNnpQU0pGSUlxVllMOWVpc1gzc3YrcitZRkVjZ0Rmc2RGWGtsSEtZZ05w?=
 =?utf-8?B?emZ6ak94Z1FiekRhUlo3ZjBRdVBaSU5jeW1sZkdxY2hjMXI5K3FDMVJaQnBL?=
 =?utf-8?B?dFZZWkpxaFpNbitrNUlzVXo5OHpOeTJPZHNpMFZRUk1ZL3BLU3hKUHVQYmRt?=
 =?utf-8?B?QnB6a0pGS1lmUTlLMnAxdDIzRkRsUVY4ZXhGM1M5dlV5RlRjY2p1Q0xhQlFk?=
 =?utf-8?B?L28vSC9oVjJpU0lGanQxVFNBaTY2Qllrc3BzOXM3V0ZxdFZKNkg3WjFMTkpO?=
 =?utf-8?B?SVV5SmpLdDFlbzUzcld6My9zM3FCN01hckVibjhtc0pmZTVrSWRab2VSRHVL?=
 =?utf-8?B?ZXhIa01wOWFnU0J6SXg5S1UyQ3p5K3dlb0JQNlFLRzdyeE02SlU5L1FNQXNs?=
 =?utf-8?B?L2d4eUhyRXZnRjdPdEJlblNVcXdEeW5xWHl1ZklBTDh0T2pEQnZLQnhnTnho?=
 =?utf-8?B?Smo1ZHhmTjlYMWVCYm5WdCtkV1RRNmRqZTRjV21OZXZoT1N6d1dxakZJaVpR?=
 =?utf-8?B?QmNBb3FSdncxZzRNTHhjalIzMGltcFdDY1dydmR2Tno5eEl4b3RSWmdXMEFr?=
 =?utf-8?B?QzdkaURHNzhkc1VEVnNYNUx1MnVpSHJrRkNGK1VVNktMNlpVOVpGODlraUYr?=
 =?utf-8?B?NWtWekk3ZVZNVEh4RmpLamg4Mzk3L0NkdW9QTnhvanJyWkF4aDBtZzllVUJi?=
 =?utf-8?B?TVk5OElaemR4U3lPT2RzdldEb2Z0eVFCNWtYS2lmdTI3ei9BbW51dXhqYjZv?=
 =?utf-8?B?cFFMdGZ4R1dZK3RUS084VnNZRlk5TFdoYk91UHFOaWpwK082TkNFRk1WeXN5?=
 =?utf-8?B?OUozcG1iUGpyc1ZwWVMwVldoanRDT2VJZ3R2cCtQd0hUVnRuOTR3Q1Q5T09l?=
 =?utf-8?B?bkJjMXJiOVROeC9jMnZuVlIxM2YxSnh6RS9qYTJJYTdVTGJFTzNITmFNRjAr?=
 =?utf-8?B?akhWQ0RZWWJGVmdyNzJ3QU1yUjl6RTNNUWNuOHowOWYxR0wwOHIreUlCR0xF?=
 =?utf-8?B?U1g2RUhnMHdneCtYcnVtcEE4WndMZnNDWmVubURUM0pVZkNGR1VaUFE4TEEr?=
 =?utf-8?B?QmQ3N0NPRVpJUFl0c1U2OEhZK0JKcUZiOFYyWkhCaTk0dTRidytqMVFzZUxr?=
 =?utf-8?B?WDU0cW5PRlpDeFJSRmtaaUpQbEtCLzkzNEpvMHRXdGRRY3JnUFEzQlRWY3Ja?=
 =?utf-8?B?UUlyLzB3RUFhbGN5MDdxR20xNmZ1MU5WTGMrQmd2ekJRRmY0YXM1eVpJN0Ft?=
 =?utf-8?B?NnJQeC9ianFickMyd3pzdEFrYU0rZTBqaDAyck1yWmYvcTlTdG5UMFN0V29o?=
 =?utf-8?B?WEdONjgwQ0tMRTUzb3gvb0JGbytpNjdITmFTMStUWFRSVkNsbGlXM0FlaUg5?=
 =?utf-8?B?ZWJBd3ZVZjVmOG10YWJVKzVpamlMQTNhRlFzNmNxMmxqSkhES0JDZVB0d052?=
 =?utf-8?B?ejRYY3owV3dTRHBzdGJUbWw4cTBNQjRZUjQxUEdXbmowWFNQdmQzN3FSRXVF?=
 =?utf-8?B?WmhOSi9kdkVXVmJxR2J2bDFEcFJKOEE4M21rOTFqejRGbmZ3N0Z2cmo2OVJr?=
 =?utf-8?B?MGs4ckdjVDJEM0txMXNMSlFGSVg2SkdmZ2ZUa2gvSWQwckNhbVBvZEhSN1Jz?=
 =?utf-8?B?RklDeTRMQTVOby8vejhaT0lvSE5uUDRHUmtwN0o1QVJSMitiVkZwczdaT01u?=
 =?utf-8?B?dC9qa0JWN3dUbDRQWUtvSFU0a3B3N0JhTkgrMWFJYkg0MXVkcUl3WDNscmxy?=
 =?utf-8?B?VjlaNzE1RTFJelpwUkUzaGxXVmpLZW55QWw2MUxUR21xRmNJYmcyOHRRY05D?=
 =?utf-8?B?VEZLRXZTblpMUEJVVjlURDJGSUYxbGswNHFCdEQxL2oxWlJFNWQ4aDlEKzBq?=
 =?utf-8?B?dSswRXdLajg2U29ncnZBaUVGZEZKTXl2UDcrTlEwSXlSZHVnd2xRQ3VBbGo0?=
 =?utf-8?B?djhCTnJFeTlrTUQxYUtMd3lLQ0lCejg0NlFPb3Z1MFhSb3RBaHUwNWFaUm1n?=
 =?utf-8?B?UDI4K3U4YnI3ZjdrSWdKRytuWnBRVTNEU29DR1c3bFNDNWpWNm4yZFdHckRD?=
 =?utf-8?B?Y0lqcGN1NUJhUDhkMjE3QlFvVURzeHhjenhvbzZvVzZoNjFia3dlOTdpeDcv?=
 =?utf-8?B?UmxwazFXOXFmbnQ0MVRUaS82NG9uM01ZWmhmbzlSWkNjRm1YRWVWcTJhaVVu?=
 =?utf-8?B?dVd4TWVXWHNicWo4Rll0Q2o4TEJRWXlQODhzNzhVanV1ZWRSWWh6UitHZDlN?=
 =?utf-8?B?THNEYklqZWlkZURYTzlFWWxCY29jNzhtM0ZpTmtVZkVFTmZSODNEM0xYeEpa?=
 =?utf-8?Q?IYTgqt7l3E6yL16GXC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5222cd6d-9150-4cfc-efeb-08dee0ee907c
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 14:53:56.7749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tkpd3ee7nMGpJy0d7G01r05WeL1XA9m64PEk7yc7OdhBfG9kbepW0//XYURqcBa1r+GksjL6OozFxWMJ5/imJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6622

On Fri, Jul 10, 2026 at 03:26:38AM +0530, Shrikanth Hegde wrote:
> Provide cpu_preferred_mask infrastructure. Define get/set macros
> which could be used to get/set CPU state as preferred.
> 
> PREFERRED_CPU config will be selected by the driver which handles
> steal time values. It is going to set/clear preferred CPU state.
> This driver will be called steal_monitor and it is introduced in
> subsequent patches. It periodically samples the steal time and
> decides on preferred CPU state.
> 
> A CPU is set to preferred when it becomes active. Later it may be
> marked as non-preferred depending on steal time values with
> steal_monitor being enabled.
> 
> Always maintain design construct of preferred is subset of active.
> i.e. preferred ⊆ active ⊆ online ⊆ present ⊆ possible
> 
> With PREFERRED_CPU=n, ensure set_cpu_preferred is a nop and get
> method returns the active state in that case.
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
> v6->v7:
> - removed CONFIG_PREFERRED_CPU as user option.
> - Use do { } while (0) for nop 
> 
>  include/linux/cpumask.h | 24 ++++++++++++++++++++++++
>  kernel/Kconfig.preempt  |  3 +++
>  kernel/cpu.c            |  6 ++++++
>  kernel/sched/core.c     |  5 +++++
>  4 files changed, 38 insertions(+)
> 
> diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
> index d3cda0544954..34d08a3d80e1 100644
> --- a/include/linux/cpumask.h
> +++ b/include/linux/cpumask.h
> @@ -122,12 +122,20 @@ extern struct cpumask __cpu_enabled_mask;
>  extern struct cpumask __cpu_present_mask;
>  extern struct cpumask __cpu_active_mask;
>  extern struct cpumask __cpu_dying_mask;
> +
> +#ifdef CONFIG_PREFERRED_CPU
> +extern struct cpumask __cpu_preferred_mask;
> +#else
> +#define __cpu_preferred_mask __cpu_active_mask
> +#endif
> +
>  #define cpu_possible_mask ((const struct cpumask *)&__cpu_possible_mask)
>  #define cpu_online_mask   ((const struct cpumask *)&__cpu_online_mask)
>  #define cpu_enabled_mask   ((const struct cpumask *)&__cpu_enabled_mask)
>  #define cpu_present_mask  ((const struct cpumask *)&__cpu_present_mask)
>  #define cpu_active_mask   ((const struct cpumask *)&__cpu_active_mask)
>  #define cpu_dying_mask    ((const struct cpumask *)&__cpu_dying_mask)
> +#define cpu_preferred_mask ((const struct cpumask *)&__cpu_preferred_mask)
>  
>  extern atomic_t __num_online_cpus;
>  extern unsigned int __num_possible_cpus;
> @@ -1164,6 +1172,12 @@ void init_cpu_possible(const struct cpumask *src);
>  #define set_cpu_active(cpu, active)	assign_cpu((cpu), &__cpu_active_mask, (active))
>  #define set_cpu_dying(cpu, dying)	assign_cpu((cpu), &__cpu_dying_mask, (dying))
>  
> +#ifdef CONFIG_PREFERRED_CPU
> +#define set_cpu_preferred(cpu, preferred) assign_cpu((cpu), &__cpu_preferred_mask, (preferred))
> +#else
> +#define set_cpu_preferred(cpu, preferred) do { } while (0)
> +#endif
> +
>  void set_cpu_online(unsigned int cpu, bool online);
>  void set_cpu_possible(unsigned int cpu, bool possible);
>  
> @@ -1258,6 +1272,11 @@ static __always_inline bool cpu_dying(unsigned int cpu)
>  	return cpumask_test_cpu(cpu, cpu_dying_mask);
>  }
>  
> +static __always_inline bool cpu_preferred(unsigned int cpu)
> +{
> +	return cpumask_test_cpu(cpu, cpu_preferred_mask);
> +}
> +
>  #else
>  
>  #define num_online_cpus()	1U
> @@ -1296,6 +1315,11 @@ static __always_inline bool cpu_dying(unsigned int cpu)
>  	return false;
>  }
>  
> +static __always_inline bool cpu_preferred(unsigned int cpu)
> +{
> +	return cpu == 0;
> +}
> +
>  #endif /* NR_CPUS > 1 */
>  
>  #define cpu_is_offline(cpu)	unlikely(!cpu_online(cpu))
> diff --git a/kernel/Kconfig.preempt b/kernel/Kconfig.preempt
> index 88c594c6d7fc..ed02e4431230 100644
> --- a/kernel/Kconfig.preempt
> +++ b/kernel/Kconfig.preempt
> @@ -192,3 +192,6 @@ config SCHED_CLASS_EXT
>  	  For more information:
>  	    Documentation/scheduler/sched-ext.rst
>  	    https://github.com/sched-ext/scx
> +
> +config PREFERRED_CPU
> +	bool

This still should depend on PARAVIRT and SMP. And maybe to enforce it
even stronger, your driver should fail to build if PREFERRED_CPU is
disabled. Imagine a scenario when someone makes PREFERRED_CPU
depending on some other config, but doesn't modify your driver. That
way you'll build the STEAL_MONITOR successfully, but because
PREFERRED_CPU is off, you'll end up with non-working functionality at
best, or corrupted cpu_active_mask at worst.

Also, the name 'steal monitor' implies monitoring, while in fact
you're actively affecting the scheduling process.

Maybe 'steal governor'?

Thanks,
Yury

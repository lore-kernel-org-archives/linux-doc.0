Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012008.outbound.protection.outlook.com [40.107.200.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E976D3876B2;
	Tue, 14 Jul 2026 12:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784033274; cv=fail; b=XxYVDKNYikX3O1ICvVAx/PiwLCPzDVET7LeeVia3Yj7Pu93gJqCfxICU/5PwIB8zcHl3jWnHZzH1nEvdnKovveSCu3woHUdgnBaJAowHMNDyAsI1gBM/rtnqhTassOBHftHqZNptzYdqWVzptcQ+6rdE4aUAhZiYz6dmNEvizVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784033274; c=relaxed/simple;
	bh=Ve3qxzuW7qnibf+EBsON18dNBMXlwIe67uOIKH2eoTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Am9m2xu0YCBl5d5aFWOso4Bbv6n0TuDukSoJuorLlxOrQndOUGQSaaPXrFTG1Uj8TaZYZ556deS7blrJ/hGTceDc+SRbbwHsuUTUW9YUpNcjcRIWV7Nu9LrWmZ2bMs25RAmV+kRiVhPJYJKORps4eK8y0q9uyY2KuEJjpmzm0mA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AtKQ0KA/; arc=fail smtp.client-ip=40.107.200.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AtKQ0KA/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sh4iHFPuYGZRkPwOcO8Db+tlp+qxXVPwFQ0G2ZHapGFOpwXklZp560LtEDG/HMpl0y9xELS34Geu/zOm9/rfmgo5nox0cTDpLE+138MQ2cvuxsPA8wnR20DDfyREnZZU1YUM3jkjLgiO0tgW4cYC1mxZb+dP1SGSQ6q9zfLF53nCjnNEAPA5y4TPmDeYI6pRm822imdxx8eGG6gBsOv79BGbfDK8yWfLjtLhMgF9KWS7ctS4VfOay833heM2tzNwRcRQV0WmFFY5aKdCurD6IKIjns1+H2+R7aKQ+8d5P+DkosClbEze0qewpYu71Du/z/hSyUsCAfKMDnPLeA1Rsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gzVtRE3Mg1Fng9GQf7NlMrCzVNucvTyS3l1PDjTGs+0=;
 b=vehEDyXSp4//EL9b/acnjWWRRWoWJYDsYTgl3Gw2p74PuUZ+Szg1j5i1b1GM1CM2tI/FEQCxLp08ZhshPIo/icblxpnOzvEnXLtVdFdILBTny6in/xshA70sUHIIbB/HogKmsCkzwPlioKQwoiidUsvPBt8D86O8Tjx2yG/c/4tUY0zVUgf38qg5Q5vI/07Fnh2x0QN3Vuxxtst78gNe7aI2YnqCWJ9sCUx5xomwxSFKxwaxAfkdk5f7TvnXs+/T9p3Q7W97jRo44bF2yhnjydpsrWftiNSbW3dObdD7kI8ZqYDQ192/FJh9lRN0XND+U/UwIDTEtmSQJwVZMkT0sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzVtRE3Mg1Fng9GQf7NlMrCzVNucvTyS3l1PDjTGs+0=;
 b=AtKQ0KA/qQBdlzVqoqaVnkDFsU+YP6Q9nFhI2XXPuRIPaCMVS/dUevovct36aXgk9SKe1ZSqgQniqhROEK0IV9AHS1dGPqSEGm9SB5/POQhPRzhB3GDbEXxMYGuXEAAaOXeVrA9eMJ9hTcurPX5FpkPN91NAf9k/rXHRjifhvRESw5Y3+DL4fHorVrA4fTUbvZgsjFYOU1bSHld/jjOrC3iI1NFoCD+mPgJbUbNU1ndjidvEIbEw2jgEkusdJJvT7OrV0uoCbkb6vfn1nccLX2wbmq/6McfKbxocUL9E+hIM7Y11WVLgA0H8B0FNITqjoQP3AsEEw6qvwePSAHLNPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by PH7PR12MB6610.namprd12.prod.outlook.com (2603:10b6:510:212::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 12:47:43 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0202.014; Tue, 14 Jul 2026
 12:47:43 +0000
Date: Tue, 14 Jul 2026 08:47:41 -0400
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
Subject: Re: [PATCH v7 10/12] virt/steal_monitor: Provide functions for
 managing steal values
Message-ID: <alYv7QGbsdLaMPH3@yury>
References: <20260709215648.1246821-1-sshegde@linux.ibm.com>
 <20260709215648.1246821-11-sshegde@linux.ibm.com>
 <alFPb9lUKCGTN8Ky@yury>
 <b4b7591c-8edd-4f45-9e03-37d7353ae5cf@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4b7591c-8edd-4f45-9e03-37d7353ae5cf@linux.ibm.com>
X-ClientProxiedBy: BN9PR03CA0152.namprd03.prod.outlook.com
 (2603:10b6:408:f4::7) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|PH7PR12MB6610:EE_
X-MS-Office365-Filtering-Correlation-Id: cdeeea99-d1b0-4c56-0767-08dee1a618e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|6133799003|56012099006|4143699003|5023799004|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	sr1F57Yj4T2RGA+gr1mDayDZkcbm/s6Faja8JOTm812GeFXWHX8fopak9azozgfRKECjAEs8cb5Km+SR1jFE2cqNMIvKB3nZyD7wOy8DqJWP86NIipQs0iIokV1SouJqm8/kZqFd2fip+ApFCOyjzJ+kf7KaZIQve8yHv8avuCEKgZK16AlT+ZDm0Pz4ZlQsuLSdxTSp9EeShABMNHNJC9YUYhY3E3oVkHL1Dk/pgjPMrFVcuOD0Hnve35qhrb4es4YTVgT6h8/Xv+/Rx8mmOXhKjeH4axvBFy4DMuP5DaBlMaWl6oLYnaw6SBercHep3IDCqmQWCciNGOu9uDao5ClpY7S572fyFjNGR+nZSAEb4wPSku+trcFWV4W1qVFmp2EdwXlJw+PZM3y1hvgFkabYhe+bhBxPt9n3ptRDwNC+WMyM45L4brC/TncqVE0P2f1OYVqj6ABB/z3L5PnxsBf6Repc7hSlYnSXPYN9snvg9tYi6CyuSOVvLVFnG8AKHoOwnDTp8NH+kOLpTSfJwHVCmTVnhtDpvu1l+i7kV5extgfAkW8HYbDUiZ0WDpYTmZt6+LTE3KP3O6nSIxQ06DoaQVvTaFu2mB2gYxBxOEddKCX/oH2E7+urSld8anWGpR22e1J16dtbf10H8Y1iuXaxPgwHIOZ36vlpMCmRNxc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(6133799003)(56012099006)(4143699003)(5023799004)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Nw2eJym8W5yNf91gC+Z/hIOBB8dQ1Y2L1B1kUhlBJj3ncC2TkNeOiVuXO1dI?=
 =?us-ascii?Q?eHs3tRCF/YGaMAFHkioQSlliz1jdsAQCsL67MCmdjG9cyxJJ8IGCXOzJ/QEX?=
 =?us-ascii?Q?ShQK46ps36scnyo9Yi74tR/nT+F+E9m9TH/utxBKYyjuh4ojy2ScH8aslZ/u?=
 =?us-ascii?Q?RgVG1hlNFIT3uJHVuRkfWMwg2I98YiJ8pWpF9rEIeThrjVqJxmMz/59fNigJ?=
 =?us-ascii?Q?rn7KiAkV79L4/AEHd6D07Gsrddn6SXyhAfV0FyDOGlDx/h4M1r4MRJrnghfD?=
 =?us-ascii?Q?6fNBlg8/QXcuIcwl3e0DDOfFF7ICaigkYJel5MqFfrtzA7/bwTCA4Am6PCv1?=
 =?us-ascii?Q?U0jAAtCWCUIdiiMkbdmsKvZC4yYM7AzCyZ8NE2nucpCX44wrNo4d2VxVXUzT?=
 =?us-ascii?Q?k5Udo6InRDDSFz9T9NAyyW8m+etpYainclwIdq91xhAHWcYvZzv+PV/Wc6Ko?=
 =?us-ascii?Q?wJ1sL9CzBda5u1oOefXpugVF2F2YfrtO/DtIO10TCfofl/k5wbwTdAVtn3pl?=
 =?us-ascii?Q?71llzFdg5B+EQgOEbw4uXkTHezv9SGwLXWr7qsmhf1YqBiQDpB1u1Vqx0nRa?=
 =?us-ascii?Q?674tLiR1afZgYC2+DxeGg5WY445EJCW/xe2bwHefIwrkHRvo4itKkEfj/U68?=
 =?us-ascii?Q?ViY+uq8p9CFdTfaYv26Veb6Xh4pua6oQQkGeOfNqPdJ8IBH962AQ0kDA+sEj?=
 =?us-ascii?Q?MKizi0ejYL2JbKYUiX7MuOm14ERVLZYFp1eU5mRthfVkXm1FI1S913X0T9PX?=
 =?us-ascii?Q?7qRukIV5YiSI3GZ6WuB69JdT0zQvzYTDKRZiZ3D11BXPhjJ7W9jxouW0jUbh?=
 =?us-ascii?Q?nB9TGLONXl8id5sfHywkboY4ksHoFT2P3ot9E0bT6LrXdJjmngLt/fw7IRyQ?=
 =?us-ascii?Q?eaBwpRMZTiBJLy+j3R1g4rjYDupOTMRm1pGlRTci++RaG5ZQI3moeRz6rnPv?=
 =?us-ascii?Q?BqmVVYbXtcm+B2EOdVWPDryAlQSZlwNXPp69iuYXtmHMrJHt2gXv/h3UNvSW?=
 =?us-ascii?Q?Ov7AfKMOs935ojMGeIItxUtjQyJU90F8NynXEoK8x0t4rjlW+gPqIzBlBC8g?=
 =?us-ascii?Q?EnBvc6O6PdKivGvxZ5qO1C65F+IQoBV4osqoVihin9b3Yzpq+QxzWjKOjI4h?=
 =?us-ascii?Q?pi/AGh1zcacexo+JWy++fAkMFLJLWRF9cXYrPns7pVBxFylWPQbboiVwP4ij?=
 =?us-ascii?Q?fCM1Q1n2PvOCOiXYruGPiZtK+rSHFbJao0A7LBtwcSJRC86CbNcAE0BNa/Hd?=
 =?us-ascii?Q?qI9RUipWw52A7+APgUEGTofL58kgJuHS02Zz1aPtzZerbZHEcoyNWZ5cB8hJ?=
 =?us-ascii?Q?ZLLKH0lFg4v2tbr303RVR0quLac54+RFo5t0MaekRBHFGRIXEBbD0EYKe/wI?=
 =?us-ascii?Q?rFz/THIMY2OmKORPRkHGr5QS5HIfTVRrmgbJcFnUN8sEPJuufwyAOMYS2LXZ?=
 =?us-ascii?Q?V2vakaLqXVPmkFRuem1NfFBBMigxbQRAle070md9fxPQv0es4K2WokbLk6ad?=
 =?us-ascii?Q?NQvsrFVbB8gGr+IbPg8s78lX7ZnOxEDRyqeo1cNTFsOG9YY5gS47WjXx4DQD?=
 =?us-ascii?Q?55FibucUe1ijlebDqFPcwlUVldIbKGOtg2qf5pSe3NhWNLJNRQaTbEXbp5J3?=
 =?us-ascii?Q?wZCd51dXOE6MKU9vx9PxID45l0qDV3JYkF/QT6QUfFYN7XTU3NNPEnYv07oc?=
 =?us-ascii?Q?biHh8Bl/3ebaBLR1W7zkNT3IlkSzhgbairLpm6Y5mMlhCpMheaZPnGLkqC7L?=
 =?us-ascii?Q?nKc6O5paAA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdeeea99-d1b0-4c56-0767-08dee1a618e5
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 12:47:43.4433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: orv6mo1W0E7H+VFiTGtyyYjYwsCMP/28XqbLXsmuCwSq8jKo2FYE0lAynpBSTv+YFNBCO6ISJAo+9bcJ+Uslng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6610

On Mon, Jul 13, 2026 at 10:43:15AM +0530, Shrikanth Hegde wrote:
> Hi Yury,
> 
> On 7/11/26 1:30 AM, Yury Norov wrote:

...

> > I think it should return status: if the function can't disable CPUs
> > now, it would be a good hint for the caller that it would be useless
> > to call it again.
> > 
> > You may keep status in struct steal_monitor like:
> > 
> >          if (steal_ratio > sm_core_ctx.high_threshold)  {
> >                  if (sm_core_ctx->status | CANT_DECREASE) {
> >                          pr_something();
> >                  else
> >                          sm_core_ctx->status = decrease();
> > 
> > It would be a good hint to user that he has the driver misconfigured,
> > and save the driver extra work. Same for increase().
> > 
> 
> I thought about the extra work in function, but doesn't happen too often IMO.

10ms is the shortest possible interval, 100 times in a second.

> Also, it is specially not a misconfiguration for increase.
> So i have kept it stateless for the below reason.
> 
> - Under typical operation of this driver, user will enable it once.
> - Once enabled, user will use their VM as usual.
> - Majority of the time the steal time will be less.
> - workload are bursty in nature.

Not necessarily.

> - Occasionally many VM will have high utilization and there will be steal time.
>   This lasts for sometime.
> - After workload completes, steal time goes low again.
> - Cycle could repeat after extended low steal time duration.
> 
> So when the steal time is low, though driver is enabled, doesn't mean it
> is mis-configured. Just that there is contention and driver has nothing to
> do. So, adding print there could easily consume the console.
> 
> Similarly, there could situations, where decrease cannot happen though there is
> high steal time, Though they are corner cases.

OK, that makes sense. If one needs to fine-tune the driver's
thresholds, he'd monitor the preferred cpumasks statistics.

> For example,
> - one small/few VMs have not enabled the driver. steal time could be high, but this
>   VM has already down to one core. It can't decrease any further.
> - Though all VMs have enabled the feature, but task running is not FAIR class. Though
>   steal time shows high.
> 
> Hitting only one core or all cores isn't necessarily a misconfiguration.
> It is a possible behavior during severe contention or complete idle system.
> 
> we need to continuously monitor steal time so that it can expand/contract the
> based on current situation. If we stop calling the functions, natural expand/contract
> will not happen. There is no interrupt which arrives due to high/low steal time where
> we can kick start the driver again. Also it is a difficult ask for user to keep enabling
> or disabling the driver.
> 
> Since this can be called at minimal once in 10ms, I guess we can incur the additional
> overheads to keep the logic simple and stateless. What do you think?

OK, it's your design.

> PS: I will remove that additional SM_DIR as you suggested in other reply. That keeps
> it all stateless.

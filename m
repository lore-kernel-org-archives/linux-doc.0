Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297E718BBAE;
	Fri, 24 Jul 2026 23:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784937217; cv=fail; b=JCb675h1IAYq/XgypqIxFQx5WpiM08Q8fo6eV3kLVC6mWgktOZSjBV3RIMe5bXrOFnk6UzkPnTGnXc7YhZt+lXyd2CdJjlUqMFV1CKPhq4eT6C7GcR3YNZkszJIR6qL1h5l6wzj0VPJeWn1xQFZBIimu7xB3nZbyZZOBDAb6rJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784937217; c=relaxed/simple;
	bh=4FpgSOoJZ6YBjVIDevwebCMXaTd3nIJ9gjfvU6E1Wgw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BPoNg/C/+GmaNVDjt3T+Z+WSsVo7NQxlsKZr5CbfDEKohLmZtEAPmn4fm0pFHCAVlewWYKfPHM/iGKEayeK9U9aP779XIAi8b1seLtij5vonsBTb2fbQnMQRSeT3Xr23ODIhftPRplKYPZGO8YEV/+7x9JOqxwzmL8wboZZMeZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mwzYsJtB; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mwzYsJtB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784937215; x=1816473215;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4FpgSOoJZ6YBjVIDevwebCMXaTd3nIJ9gjfvU6E1Wgw=;
  b=mwzYsJtBemNyLRjIDEVeYcYR/bd4iMBSBayx/0brJ8c3lcma0wdaPunL
   cxPOk61+7bykpE9QCW0hAHCTCCT4pCCAcZiMzy8kxcon9pgBDNVA1tvND
   IO+ZrJ4QZqIhfdn9ka5ImzQ5IkwcXVPlIGFbH2/Pz48lwXuN4tijnm1S5
   DXhRsGRj4sTmqz4iuB7BK/gOJdRKdcQNViPz8qb4zSEgOt/KjPE2A9fBm
   R02oo2Es/aNqcf/CuqBcbMBmC/Uv58r10Z66L7OfC0vXYC6Hp56caJov4
   IzDDWA/d26XJuMOlfzHqKLJSs8sWtQKX1ig9dotlFu9wvz5492LHFGIIi
   Q==;
X-CSE-ConnectionGUID: GfPKIC9mQRqJaFgIetglIA==
X-CSE-MsgGUID: 9vKOSLjpTN2ljg1G9XLu/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11855"; a="89278913"
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; 
   d="scan'208";a="89278913"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 16:53:34 -0700
X-CSE-ConnectionGUID: qFP9sfeVTOSNVJ+SbyKPcg==
X-CSE-MsgGUID: vOpgsn9JR663BFeqqfgTmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; 
   d="scan'208";a="263149226"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 16:53:34 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 16:53:32 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 24 Jul 2026 16:53:32 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.55) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 16:53:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FoPoPFmLIr9kYLm47cKHQRl0DSf1R2mmwIxKRoC3m179WCvGVq/OLRcF9bIbcbuKH7zcc1uVpKd803fR/thKEfHTleogByChFqnfX9B4AgLTDUAjzCiyMNf6We4MqBd6ykEfyqp5oPqqpw0JMqkZqr1HvQkHy05S/zI53knewm7hdqW2XNPSvOnh5YiFjUdNGfMGi6TY/gp+Ns2qdJXCtKLyMi5aUxnbi4Ea0HIWK3nDm51WQi4NxlbFoZV/xL58Ysh8cQQ2YJ7IxAs4xlXKzi8ejuOOQ7zKGEVxj85nAk3T8GRn8qQHqonvOkTkafJZIWBIGkw8MnwJHnaaAK/Nyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nyZoUgqnRzW5gX4FujbYrOYSwu/NB/V4sx9pfxbxc8w=;
 b=AERN0LTSQEhD63OHm8ApDmwMCJunSMd+rX9NYdLRh4a1eA8ReykVo3Ex+pn9XOac3F+h2tekhvnxWVeDxsC8Y4QK18r25t/LRbVoMtTaCZG8+zqKjZJ63ShjeuB2zSeFcdQaE6mQ2tDtPCzTndFEab6paJG4qJFC3Jr+UyJU2pqzJFuLHT6kptTSPX7Y/JhH0T/zK8hYfUIRUsesKWL9ThXheQm8SEDhW4gLRHJ95Jznv3pvOZ0sIHK5KDYekgC9Edo6kNyjhiatGO4KYPg18DSSlMm0378gbsVcLRf3bGmzg+WrcYpdYBv5GH2bXDnhxv01HGtASvZ7aYMYj2cAlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by PH8PR11MB7141.namprd11.prod.outlook.com (2603:10b6:510:22f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 23:53:29 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0245.009; Fri, 24 Jul 2026
 23:53:28 +0000
Message-ID: <911ccf29-e152-4bf1-9773-04680bbe9638@intel.com>
Date: Fri, 24 Jul 2026 16:53:26 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
To: Borislav Petkov <bp@alien8.de>
CC: "Moger, Babu" <bmoger@amd.com>, Babu Moger <babu.moger@amd.com>,
	<tony.luck@intel.com>, <x86@kernel.org>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<tglx@kernel.org>, <mingo@redhat.com>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<eranian@google.com>, <peternewman@google.com>
References: <8cb66e18e32e4087a9712c1e68ee6da614efe244.1784322818.git.babu.moger@amd.com>
 <d337915a-ef4c-43b2-a915-e97381b7dca0@intel.com>
 <b0dc49dc-ac35-457b-90c6-842a3cfcf8e1@amd.com>
 <f3fd774d-0662-4094-90b6-f0c5a4bc5d26@intel.com>
 <78996219-a8de-4dc3-90ee-db4c19e0d66a@amd.com>
 <dbbe2eac-bb0a-4655-9d0e-6e8feb702717@intel.com>
 <e77ef79c-5241-4f7c-b0af-dde6f131600a@amd.com>
 <bd739e7e-7a86-4291-9c08-f2c72bc2dc3e@intel.com>
 <48fef38f-8e2a-45e3-bb60-f293a1d60be8@amd.com>
 <c1979f4f-eabc-4d71-a711-ab465b9d9c1e@intel.com>
 <20260724231239.GAamPxZ2IZiFYRmAfg@fat_crate.local>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20260724231239.GAamPxZ2IZiFYRmAfg@fat_crate.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0110.namprd03.prod.outlook.com
 (2603:10b6:303:b7::25) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|PH8PR11MB7141:EE_
X-MS-Office365-Filtering-Correlation-Id: 86298796-5052-490d-1dbd-08dee9dec22e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|6133799003|11063799006|4143699003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: LgroRt3rcBI3x2l2gU+NXp2WBH4Sm+Al10I48qlOgE5kKa2W2PgU/+aZ4Ud7+aBFJgKBYIqGcTK2RRbeuEGVUV330qsgEk5dNRPCvhnCyiJuhPB9C8H5hMx7/RqNsDNAXevhmkNKzkuKCQkBKwaIXyyUOlaCfAxLx2gxaxKjt+0a0ZIg9n1SnKoI6CopZ+qu2SA1TrsnLAFQC3g9MX8nG2FltWoXkcFbRUt6J3fsnyJsaO2jdlu48Fkp5Y+4Et5aojlBVJu9zNBicIKjjSbFDzZiISmCIR/+eFeRUlq8ZYZEUMNaHoNNoC8RyJFkOAclHcXK54Ncf8+FnIxAgwOAG6IsldlwGsiNfRKsMKsjg1HqIoE+a5T5txlIFW62wwkxbJWCVo8uBJ9/qqj/DF6KphFt6v3YyONsfsJRDPoSWq74mIL6j/iRFXjXpd53bnFDrcolh7CdSiEzPNDo0JaOBJLJx3w2QN6g0EE/hq0zvoYiJLW9nFv/2H9vaIHMrRIt3CZF5AeC1JJVXGFliRrtMDq7xZWG0Tmws5c1/hzjzISE39/Jm5+yg3wx1ug0NBTcufHL/yMPnzTLXiGsGJDfQa8Fs4BvUsiIf9qcm8f+MLlfdprd75+P0KKSkubCC2oMiU01rua+mVwOVDrtauJ/GA/d7/8x4LqoEQn0Ngx6H9g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(6133799003)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzJGcUdBWDREUFpXeE0xRjltakMwbDRRc0xFOXc4MG1oQjgrOVB0VW9sQ1dT?=
 =?utf-8?B?d1g3ampXenlST1FCK0dXZFVLS0lKbEYwYzk3b0dhWkRJdm9JMlU5Q3BEcFZQ?=
 =?utf-8?B?TjVGWnpxYkZQU3JTYkdjQ3JmaVc0Y2JLQ3hWcERpWUwwd29lSUhmQXNYM00v?=
 =?utf-8?B?RytvdUd1cnNIdE5rdStwUUlQMFg3N3NQZXVKWVREbExIOE9lUVBOMVNLdTRl?=
 =?utf-8?B?MDRrNHBjUU5FOEI5R2J1dXd3eFphYmZURTdQUUtuWkpCTTBYSDNnRXRQY1FE?=
 =?utf-8?B?cmxkQzlOdVJsM2FWK2NvM1lVa0kwWnRreHBwNHNjaXQrSzlwc2k2TzJCUnlZ?=
 =?utf-8?B?QTJKM2RreHo4S2cwWHNhNVhpSEZHWjB3TStSaWNsRWhlU3daWTVjd2xwMlZa?=
 =?utf-8?B?T2hvcEVnK0dVSlpRR0dKZWg5ajRXQWJ3UDdFTEFKejlWZmtYbklxQVAyYU5K?=
 =?utf-8?B?YjlNUUdocXpMbzdUak4zM29rRWZ5Z0NqcHZEUG0zR3lDVU1aUkxVaTF2clpP?=
 =?utf-8?B?dEJoZGdkSTdyWEw2dklWNjJvaUxIMnFNRWhJU2h1eFRWWHVna0ZLaDI0eXdr?=
 =?utf-8?B?Zm9yYnRCcGZDRDBnOWhST1h6bG5GY0U5TVNlcWlGNnYzWXdTME1rTi83MUhU?=
 =?utf-8?B?N2Z2ZlUzUzFwV291WS9OZ0R4OFBURmFUT0hTWk9sWGZBRFlFOVluU3ZjdTV6?=
 =?utf-8?B?Nk5MOWlaWUlNMzJUMDFvZmxyUU9mSDFjMWw4NDdQY2pZMzBYdm9tdjBDbXdP?=
 =?utf-8?B?MWhvczErUW9zR2trSmo0aTdsaVowTUtkdDJpNjlNY3RWZlkrcExLS0FCSVRt?=
 =?utf-8?B?UW83NEpVOEFaYTJQdDc1YjlaZDJKbmdSa01RWUoxeUtkNGJzekV4ZGxyNjZX?=
 =?utf-8?B?UU0wZ2ZwaUxIak13b0tTUHY4MDlScEpPNUsxL2FCMVdmNUFVRkRtZU53YTBw?=
 =?utf-8?B?NG11QVYyZkFaa3JjRlhpcDBHeU1ZSHQzQUF0NGFqbFJvL0NKeWwvSllyb1dJ?=
 =?utf-8?B?aVJKTXJjTmF5V1lUcnZRRkEwRFp1eEQvb0tHUzZPMi9OSDNGb1B2blhHUnVP?=
 =?utf-8?B?amM5UHhWejFjUnpOcmtCNXR1SGVrSGNsRWVUQm1kWHBlVjY4TW1GOUFoV0pu?=
 =?utf-8?B?WDAyeWxRNXRkR0p4U1l3UDRFQ3BMMGw1QXRXTkdGOXNpdCs3MkVHRVRmcml6?=
 =?utf-8?B?ZHFBcWlMV2dxb2pGbDFaQU8xNkMzVHNxS3J5WnZreFlFVFJBOTVFQmJDY0FF?=
 =?utf-8?B?VkQ3NjBTWEJ3aVRyVlpBd0YvS0RQNWIyMWU1K0QwZlZKM3NGQ092T200SjhL?=
 =?utf-8?B?KzhQbG1idXAvWFNMR3hiWjVHODRBZXRaUXQvUmJRc21aa2FwdGRuTm81RW01?=
 =?utf-8?B?UGsvNWkzZjRXSUoyREhKc01uczRaQ0RPSjFGSU5vbHRjL3U2U3prZ25pS2xk?=
 =?utf-8?B?aFA2VkYrOFdmSW5lOEsvS3JVRzhpQWVrYUdRc0xRY0dZZ1g1cEFqZVFSdHVw?=
 =?utf-8?B?MCtFRC9yczIrMEFHcmtOaXNBdkVoMUlxWmM1bEl1d3pmU1JnQ0o2SDdLWWdm?=
 =?utf-8?B?a0VnZHlLOGo4SWIzYmQzNjBJRS96NTFpZU5qSkVLQklOZ1o2WnhHR1l5R1Ar?=
 =?utf-8?B?b29INmNqSlFKMjh2czN3dGQvbXplZS85RzZzTmo2NUt2MHR4OWM2NTZ4SVZQ?=
 =?utf-8?B?UmN2MEw1ZGpsWW1FNlhzVkdiR1J6eEtYYy9nV1BYSW8wNFU2YmtYUDdkNWJX?=
 =?utf-8?B?ME5QakoyMm4wbmthanoyMi9YZmJNVWJEUi9SSWdtcm9PZXlwQXVTREtsMVpW?=
 =?utf-8?B?cWtSMHcvN1hud2tOWU5PNEFoZUxYR2Y4WkQvaXZZUzFKYlN6WkJCTHNrSHJN?=
 =?utf-8?B?U2tPaW5VbzNGd2V0aGF1Yy9jNTFFUUxHUWhURjd2M3lBSEVFejVNdkE0YVI1?=
 =?utf-8?B?eXJNUVR3bmV6OGNtME42OHA0bjdSUzY1RCtyMGM4a1l2MENjR1lucHFnMXYy?=
 =?utf-8?B?Mk13czdGWUFrMHZuRnRZcGF6QUFrYi8vOUlMSXd5NzdwVlNxRkRSSGI4c2RD?=
 =?utf-8?B?Z3JmMHI1N2hoTGhGSkE5RWNTeWR3bk5XQUtScWEzWFcvY0p3a0NYNkFwRGZj?=
 =?utf-8?B?Y0Zjb3FQMW5oMUdwaUd4bnhib3VpYzNvWWNxck1kSUVNdXgwR0xoVVlySGZK?=
 =?utf-8?B?TFZsNFQzbDJORnRhaFptdkVUbm1ScGZoamRBRUltVkVrUXN3enczWDNzREo5?=
 =?utf-8?B?YjZpL1Z2eFltTlpMUk5HUzFGckFmcFJPRnpiT2J0UFF2dmh0SzdqMU9mN2Rx?=
 =?utf-8?B?Q29HVFdsamdnelhTRHRhbTN2YWxuQWhpaENmc2FuMTNCVG9SOHpnNGI5QjZP?=
 =?utf-8?Q?L0XTQXIj6yAHt0Lo=3D?=
X-Exchange-RoutingPolicyChecked: MHcbePzywV8M0g5GdlLx0fHyAv9uLdkZmf7nBYNcHxYu7KQIHfFuoIrwXixkrsF8KEzhTvla8HhjFN7epT8ww9YstCGxodLyTBqipbqIQSZ/p6KYPjyNWDrFYAU/7Zx6eXKz+P51GtfezGClK0qJfIAiRK10b2rM5RGSopl2kFyglHKR9cMUUcbsBz5eWdPb0J79C9fK+7XqaW1DKrb41l6uTfv84vRDHhR2F8akf2YPRVo7WPKbg/rdYhcWslhQnYxo5Jrec8km6tKk4IIRu7SpPvBfP5ZVGQjIPGlXwZUqK2fOIgBj4Aeu9sjSFqACqmPPtTXby3Vx0NwVTKIGPg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 86298796-5052-490d-1dbd-08dee9dec22e
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 23:53:28.6014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qOgWFNxmMy8LN2VY9J3WlKl8cwpnJ/KbBwAEfjSjvY+AsBisl2GxOj1ti8PrrL7xqj+/395xKgRp3ycMTmVUr+28FJQ5UU01ZKhyNY+Y5i0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7141
X-OriginatorOrg: intel.com

Hi Boris,

On 7/24/26 4:12 PM, Borislav Petkov wrote:
> On Fri, Jul 24, 2026 at 03:28:18PM -0700, Reinette Chatre wrote:
>> I understand that if users only use a fraction of the supported monitoring
>> groups then the counters will indeed be valid but (a) this is a small number
>> compared to the supported monitoring groups, and (b) hardware does not
>> expose this number.
> 
> It takes only one user to go to Linus and say, my tool doesn't work anymore
> the way I used to use it. Then stuff gets reverted immediately. Because we
> don't break userspace. Ever. 

ack.

One clarification here is that as I understand there has not yet been
an actual user complaint. At least not that the pqos utility mentioned in
this thread is aware of. Instead I struggle with the speculation about possible
user complaints with different interpretations on how this change could be
perceived by users. 
> It really is that simple. And I see your point about wrong usage and so on.
> But as long as users do use it this way, we don't break that usage.

ok. 

When considering a change like this, should it be a stable candidate to
help reduce the number of kernels with different behaviors?

The patch notes mention that this change is planned to be reverted at some
point in the future and I have not heard of any changes to this plan.
Considering the stated intention from everybody to maintain user interface
I assume this plan is off the table?

> 
> But let's see what other x86 folks think.
Thank you very much for your guidance.

Reinette

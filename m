Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0866143D4EC;
	Fri, 31 Jul 2026 15:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785512101; cv=fail; b=t1YEmcyK+aa87tUR+do7mW6z01udMlupz9zNmDJgAoMFvOiX8i9qhmjat76YjGkbSexTwCnXNY1pNlIXwqu+1tMbkGnkpUQvG6neN+oLtzkrLcm7m5hd546tdUdCefBiuXZeb5ijhVyvYKE8dkhAEz2DEqacmDXfxCQMvAMxpLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785512101; c=relaxed/simple;
	bh=gOoL+Bq/NInGrE4uHImdBcOBO9GPj4F6CXoaeUgwLho=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EgAUmz6R+yL/MdS+zqzhfh12wF7rDPFh9ev/qPElGTPDp01wA4dQtJlC9sG/7j56EuC7VAKjOZcKBbHIBAYk840h+xtLWmBS7882KrQmhMQqdKMOm0vMWRHGTEMq0oNX1gsk0WYJSqEzMX4gc0hGKO/ukTSn1QBTOx1gAxZiY0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b3AWOxgs; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b3AWOxgs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785512100; x=1817048100;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gOoL+Bq/NInGrE4uHImdBcOBO9GPj4F6CXoaeUgwLho=;
  b=b3AWOxgspYllI8vH+o1aMRItZZikxGxdXLLuUgdo8OFWrV7LmkT4FPgh
   8pk4NfCQEvZvpFpgCx8r1Vu/OxQRv+UJ3irBRs3IJVbDFohwka7eaRWJl
   sblaloq+PhrpqHeNrj6HgLBXDhpeeWmPkqsd3trO/eIgWYb3t1nmHhxqJ
   a7JfanN32L1V3d4t435A3jfbwJxSnFFfrgpPcx3e2htO3hsPcn/jYtCQl
   tmcvAFjrrpWJSBiXqSHVb5TOaCptHbChvHJWlJi5WSYj2bbmav5+dqRV7
   QMPkCgj7jfLLwdO/OQ7+xqiGwiUJhAzgDvhRbNw3FtAdR4bIS0JZrLOJt
   w==;
X-CSE-ConnectionGUID: cLzOvhP3Q3WQuF7aYvTgLw==
X-CSE-MsgGUID: PF0tv0p6RrC+H3V4KkjFEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="96496335"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="96496335"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 08:34:59 -0700
X-CSE-ConnectionGUID: B5OAV/rkRCSYQJQGmTKnqg==
X-CSE-MsgGUID: Xid1X3KURkmvJKyGPXBcQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="265662049"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 08:34:59 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 31 Jul 2026 08:34:58 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 31 Jul 2026 08:34:58 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.36) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 31 Jul 2026 08:34:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BTDPrrKosRwrJwuK2+vQH2+yspN2BxgykbJdjnb8RiFJ/aPLkIcLFsOWUnDSNRlxPrq4btidgiUuG60R1VZcEULt/MXo29ymXcwDNzcNGBHjcns5uZHZFU26y046sxJOOBy3xFJNoDRfh++CmzxMFaRpyfRw8MLfHq9ndeNAKa3aaHHGtp8h7GiAM1MKPdRZcJVGgncFdMI7/i/iSwhk3T9xEH8sEZOxOWimcEbnP5oLTcVIhiVn1l9SIF1lpOIhMHNEaw/4xME5zX37uPeSEWjjLECdJdqJUAZe8wGHx7vjwpwVA7+K2K90gMS9pmQbu3Gu/dsFhBzlzhAbinT5XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gOoL+Bq/NInGrE4uHImdBcOBO9GPj4F6CXoaeUgwLho=;
 b=Iv5LXJ67f7Q9dfW9dMMAyKNHV0Ct5nmwuWpgIjMLoz7mcre+JNMgvLPWbU2kDWvu6P5fi4DBfghA4/a/byEPjC7YFhRSqRM5ASDiqwoNnG/2JuTo2v1bFr8mznlso6umtUsPKbMTUvZNm9ZmWoVxWlF/qzeyDTl6igH6F5IBwIaIr81c23HCfiJWGXZ3f4T3jqUC9vivEstTGhVLg2tT/KVl9hSe+HHa+04m8511oZ+C2j4AMtZ85OltZTAvSIsAXdmCa3DxVlm9A4aFS6uoc41c8hn0Kx4DUxgH7dC/SpcRPbW8GMMWyzHNOr4IAiUcA697nOFfMcUVTswyRCrDpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by SA1PR11MB6687.namprd11.prod.outlook.com (2603:10b6:806:25a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 15:34:53 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 15:34:53 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Borislav Petkov <bp@alien8.de>
CC: Babu Moger <babu.moger@amd.com>, "Moger, Babu" <bmoger@amd.com>, "Chatre,
 Reinette" <reinette.chatre@intel.com>, "x86@kernel.org" <x86@kernel.org>,
	"Dave.Martin@arm.com" <Dave.Martin@arm.com>, "james.morse@arm.com"
	<james.morse@arm.com>, "corbet@lwn.net" <corbet@lwn.net>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, "tglx@kernel.org"
	<tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "hpa@zytor.com"
	<hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "Eranian, Stephane" <eranian@google.com>,
	"peternewman@google.com" <peternewman@google.com>
Subject: RE: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
Thread-Topic: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
Thread-Index: AQHdHtxAj4YGLGgJr0yKZVW5LIjWgLaDgPwAgALovgCAAA7gAIAAARAAgAABkYCAAA3vcIAAQdcAgAD6FoA=
Date: Fri, 31 Jul 2026 15:34:53 +0000
Message-ID: <SJ1PR11MB60834FDD547CF5511D323E4BFCC82@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <73737438-01ed-437e-846a-5aa8bd687462@amd.com>
 <SJ1PR11MB60835A80CBA4ADA35A617EF8FCCB2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <7495c998-4f3f-4ea5-a383-350584afb42c@amd.com>
 <6d006c4c-907a-435f-ac94-32974562ce2d@intel.com>
 <e37866f2-974d-475a-b68a-8b74d6051dc4@amd.com>
 <20260730184626.GIamucAtZxMUUGagGm@fat_crate.local>
 <7d3dd384-9101-49cb-ada4-b8320198233e@amd.com>
 <20260730194328.GEamupYLsURg6VvxBU@fat_crate.local>
 <d364100d-45e4-458e-97d5-05416fbe5bef@amd.com>
 <SJ1PR11MB6083F7EC6D533C4E183D5876FCC92@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260731003436.GKamvtnJlKydaEqstA@fat_crate.local>
In-Reply-To: <20260731003436.GKamvtnJlKydaEqstA@fat_crate.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|SA1PR11MB6687:EE_
x-ms-office365-filtering-correlation-id: 9134642f-e577-4842-ad9a-08deef194464
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|38070700021|6133799003|4143699003|56012099006|11063799006|10067099003|3023799007|22082099003|18002099003;
x-microsoft-antispam-message-info: qoMnx1q9uejFpe8D8mSvbZHavmUrx5diK1mOf6CQuPcIquKMyu0oNfeZqMbHesxWXVoOVXVgcVQYlkePnU2gftJNfficQYlmiEWETt19a1BtVSdnQhK+V+8esDFM54VIGUC7Q39plqWIKS15tPv7jv16h03D69cB3d0sYFvqFmZtcKuc+03pv/K5R4LKv8Ty54FLSPjVwOEr/DR+3ZcYpskcvsAdQGMEnV4j4fUKVqIRHCiOF2wZLlQHlFF1QPgh/ypM1jMwmxsHqZJk0206XcskGsIuUd9Hb2oRS78r57u1XSdi+FZGLhio+lv7i0vRnFQ2q96krHPw93Ps3LQ4O+6BsvizpwsEvVhWHxE8pkMzPvra00D/mpEQOjN9VHt7uQ5dM7rl76KfxdSPsTQWSdPvrEI2cOJFQ7k+z8J6Lzdi/8H0/e3bP7f/l68ZMQ9i7PbFQ3cCRjUgRO1167JjC/3Wc2H3xw3+E/NFGXUIULRTs1n2NbAaWdrnlBJT711eTUzWjudCOERhO9/CjZm6yCdztk6cYvPZnQ8pvAw1QkT+5XuDwllg2ndd+cIgY+C+mfmqUQAoDleszrAQhLSQ5ZSPz9UoQTL9PuW66wWlyKgYtY7GoJqsPNqpRngxGaUvtL5ei9c60eZfJtx32gcAI/9Nv1O6Mt0780oKDO7zc88sOyU7X4aUcEGRT4kRcXGoZeKnOVLsSN7arjvFezeI/SAkSLxc8ujXBbS4Q5nJd1M=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(38070700021)(6133799003)(4143699003)(56012099006)(11063799006)(10067099003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y0hOV3EvY2ZUSGt5aVF1SFFOUUNRR2lLM3BhaFZ2NXlobWxWa25mWDc3bjNt?=
 =?utf-8?B?Wkl5TUVsaFFpdXdrc1luM3d6Uk9udFFydDNMQ1lTei9QNHBZTjNUY0hWdHk3?=
 =?utf-8?B?eDBFWEk5bGprdERVZVlpUm5DSitZRGtUdHBHMlQrT1pIdTBiVjZCR003c29o?=
 =?utf-8?B?RzYrR3drTUJhRlBXWkNqOW5admJMK05jbURPQ1YwSHlpRFl5c0E1TFlxWUoz?=
 =?utf-8?B?ZG40Nll4NE8vY3lwTnY4Z1lxdjZlN1U4M0hWaVBmczBTemxnbVc1VGYwemJE?=
 =?utf-8?B?MFNieEVFYngxTU5HZFlkdFFxV2pSbW9zYWtGTURmamlVa1haVXA0dktTNmJj?=
 =?utf-8?B?YnhpL0g5cTU0YmxBcnJoWE9iSHRMU256bExKbGJpR0RSL1ZTMVU3TGducU1q?=
 =?utf-8?B?anV5ckpHdVAwUGw5ckVVN3RWMWM3QWNlOUMvOUxiaHJ3REY5OEtpNERqQzdp?=
 =?utf-8?B?QVpzRytaOSsxWlJ6eWl6K1g0Vlh3N1dWYWs0RE1acFhUcDliQ0Q5TXhpRjY0?=
 =?utf-8?B?cWpmZ2NGenJlMlo5bFVaeGV1cWJDRklhZDdMdlpmYnkyR3VQVDJ3ZkRMR2Vx?=
 =?utf-8?B?em5MOHdWRE82UFZMVVc5Wk96WkpMR0lZTnowcDdMT3BIay9NcHVSZG44WlhG?=
 =?utf-8?B?d2hGVlNIeGI1ZFd4ZEh5amRiaEFnWFFtWnhKMC9XU3E2TFBsdm5CSFhRTzhj?=
 =?utf-8?B?dkhjWEJaT2N4L0U1bC93ajdsM2JvazVMRU9DVkhCMkkxNzdtd0xKNFM1alk0?=
 =?utf-8?B?aHFQNnZLUmpPOWhYZzRwRURFOXVERHBpTWVrQkRYVmVieFBvUG1HVFg2OUdQ?=
 =?utf-8?B?T0ZRYzBiUmpzL05uQ21qVmlNT1BVYWMrSUN5cVRJRjRaa2ZTaHUzODRlbGMv?=
 =?utf-8?B?S0JHRThmY3VMTFQ5QWZEMFBlRXRxeTY2UGYwN2tNVE9naHlsU3MvaWo5SEsv?=
 =?utf-8?B?Q21NeDd0RXhHb2l6SzNYREFTTkNZdlVkczd2MmI5WXlBNzVsWG1JRkxDZUZ6?=
 =?utf-8?B?bUNjUVlLOC9waWxTUVhHRlE3K3FneUtiYWUxOHQ4YW9HemMyYVFzbCsxYWRJ?=
 =?utf-8?B?c2lTQnRVU0dweTVMNFVXdG9oT1B6TGJBQmNTbTNLOER4dWJzczIzcDRheTVZ?=
 =?utf-8?B?VExxYkJvZHpOQmJpWnFuTHo5REptWGgxc1NUVTNUTE1KTHEvelE2V201MUhi?=
 =?utf-8?B?Q1JEbW9iZ2JNZkpGNkpNVnc0eGVXZ0JpZHlCem5TR3RpdHEzM3JqVWpMVitx?=
 =?utf-8?B?bXNpTVpKUnI5NDh4RlNwSzY2N2FsZ0Z1RkdFME1sdXRhRXBFSldka3pyZnFI?=
 =?utf-8?B?RFo0cGxHUXR1Mnpoam9lVEZNWXdDYjh6MitMcURHSW91V2h0aW9wY3ZCUDFZ?=
 =?utf-8?B?MW9jZ3d1YUpOOGFIMnk4T0hnT2pZTUZJaS95aGs3bzkrRzVwWVZhazNod2J6?=
 =?utf-8?B?ekZyQ1B4TktrY3A1aE5xUnI0TWx2eCtzb3hOUHhvVzNCaENyVU1qdXp5cmhn?=
 =?utf-8?B?SUJrQk56L01vK1lIc25tSG1PQ205M29FVGFmZExZZ1JMZWcvU2c3cEs4NGN0?=
 =?utf-8?B?RGhpSFV1VExFcHdkUjFDdkxHd0UrWEVsanZYUWtNdmpRWWVlbG13bU1BODdO?=
 =?utf-8?B?dXNmU1NZWUVPMHh1blZOc1FVSEVKNkpZay9rWG5XeGw1QTFWUVpHV0ozcGha?=
 =?utf-8?B?MXhjN2xsZlIvNWtJN044cUtSWGpONkM0UlFXakJyUXU1TjR3UjZIWVRWaHZZ?=
 =?utf-8?B?Y1c4RXV4dkdHcGZTRzJPWjh5UG1MZzAxbldVV25CaCtMTEFDRE1CQ3pneDNs?=
 =?utf-8?B?UnllUk1oWEVLbFNjR0N3UDVOSXMrVWdHRXREZTR6Z0tiMHAwZ1VNcjgvRnRJ?=
 =?utf-8?B?MjdtZGk5KzlpaVdHUG14L09rRmF4ME4rb0pQMGZFYkV0UlNzUVBZY1NpZjJN?=
 =?utf-8?B?bWZYMThSNTlZemZKNXhwK3BRWHU5VU93N0FVWkp2WlIyQVIzWitwaHNCVCtJ?=
 =?utf-8?B?VWxkMmhoeVhIN3JBZTlRZ3RiMzRZMks3aVdIYUdnT2trYU5iNkN4YmVVUEl5?=
 =?utf-8?B?ZU5KSm8rbFhBUGpiQytUMTlUWDhqdWtjRmtLYXpVcDlTa0l3NVpmUTFZb3Jk?=
 =?utf-8?B?eFVab2RjaXJWcHZlSFcrQzR1ekJCV1N2QVhLSDhkN1dFUXFnR0ZBN21EMU5V?=
 =?utf-8?B?bWluTDhRdFhZeDhHNGM3NXJMcVNDaGVPaWREYUhFeGQzVzdKOXVQRW1WM3Y4?=
 =?utf-8?B?U2t2NEFxK1JiOTJvQ2k0WjBRN3hqVC90MGZNV3lBK0plVnFnNjJjTmQ5Tlls?=
 =?utf-8?Q?3xC+CjnEwUbrEyWUWM?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: OEaBG+e3UACuMIqjgvZ9jmD8mge2gH0YPhWGkj82MIo+Ku1TYcnSy1kEtyQjp6IwQO/qijsPf6kQvC8FoxYMKtV+OxdZF4Zn8bM/Y6L0sWUTsWzblJYiMn9wtzbncsovOv2hzUh6Sk1cWo/YIReJOdPx8KMAYwCM6FhW0mFuFMM/2YfuVQxsdxP7qJFxJTSoIBFxSb/BNGgGh0YM0/qbN2E5jB89ox4B7j6WJjeWq43qzylB2Q30b9yvutb+Ngw0ANScQI3sQvn8w7fGgKOzgx3PTAaCdmO+vCT/Bp79RPXuvulSYLZXOLTp7fC8EfWH7JU+HV+ZYqyQ7MiAF4tzXA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9134642f-e577-4842-ad9a-08deef194464
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2026 15:34:53.3625
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IqttxJYF2ZUrrldJJV0ppVVy4seeIlkg3cOAr53Xgusyl0oxmEMiAHzvc2A12iTjM4D+4L3tTjKluzg17LuyHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6687
X-OriginatorOrg: intel.com

Pj4gSXMgdGhhdCBtYWdpYyAiNjQiIGVudW1lcmF0ZWQgYW55d2hlcmU/IE9yIGFyZSB1c2VycyBl
eHBlY3RlZCB0byBqdXN0IGtub3cgaXQgc29tZWhvdyAob3IgZmluZCBvdXQNCj4+IHRoZSBoYXJk
IHdheSB3aGVuIHRoZXkgZ2V0IG9kZCByZXN1bHRzIHdoZW4gdXNpbmcgbW9yZSB0aGFuIDY0IFJN
SURzKS4NCj4NCj4gSG93IGlzIHRoaXMgZG9uZSBvbiBJbnRlbD8NCj4NCj4gSG93IGRvZXMgdGhl
IHJlc2N0cmwgY29kZSBoYW5kbGUgY291bnRlciBleGhhdXN0aW9uPw0KPg0KPiBEbyB0b29scyBn
ZXQgc29tZSAtRTxlcnJvcj4gdGhpbmcgaW4gdGhhdCBsYXN0IGNvbW1hbmQgc3RhdHVzPw0KDQpG
b3IgdGhlIEwzIGV2ZW50IGNvdW50ZXJzIGFsbCB0aGUgUk1JRHMgYXJlIGJhY2tlZCBieSBjb3Vu
dGVycywgc28gbm8gaXNzdWVzLg0KDQpGb3IgQUVUIHRoZSBJUCBpcyBub3Qgb24gdGhlIGNvcmUs
IHNvIGF2YWlsYWJsZSBSTUlEcyBtYXkgbm90IG1hdGNoIHdoYXQgaXMNCmVudW1lcmF0ZWQgYnkg
Q1BVSUQgbGVhZiAweEYuIEVudW1lcmF0aW9uIGZvciBBRVQgaXMgZG9uZSB3aXRoIERWU0VDIG9u
DQp0aGUgUENJZSBkZXZpY2UuIEl0IGluY2x1ZGVzIGhvdyBtYW55IFJNSURzIGFyZSBzdXBwb3J0
ZWQuICBJZiBBRVQgaGFzIG1vcmUsDQp0aGVuIHRoZSBleHRyYSBjYW4ndCBiZSB1c2VkLiBJZiBB
RVQgaGFzIGxlc3MsIHRoZW4gQUVUIGNvZGUgZm9yY2VzIHJlc2N0cmwgdG8NCmxpbWl0IGhvdyBt
YW55IE1PTiBncm91cHMgY2FuIGJlIGNyZWF0ZWQgc28gdGhhdCBldmVudHMgYWx3YXlzIGhhdmUg
YSBjb3VudGVyLg0KDQotVG9ueQ0KDQoNCg==

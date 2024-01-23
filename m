Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97493FB09
	for <linux-doc@vger.kernel.org>; Tue, 23 Jan 2024 21:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706046887; cv=fail; b=UbddEpK1gd5yncFCDYWxUeyYIIkItxQP+7QbZ1JtO1+T4lQ+5TGVo8Ih9RNxQJ/YNtE+DaB66q1zD9cuJtzkFhNyK12R6uz+ToOExS1TCIoUPUr513rlpoP3TKyGXf7iq/9jzKbROjLOewBP0RGVL4ajmuBLLNiF11AEcT24cd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706046887; c=relaxed/simple;
	bh=J8n0x5jPqP2HaTksOSZeqnBDMtdAoUrdqNpPDJeHfzo=;
	h=Content-Type:In-Reply-To:References:Subject:From:CC:To:Date:
	 Message-ID:MIME-Version; b=MdpXglb1A8lP1hldvapGHb9uED74i+EGCFTocotTE2vsgk/ywwKOrSIeI+UCeUOKM879k9/jBVqHI/PeDxqGtzzH0NtE6r36AmwUFpKg991keLP7hT5B7AvfX56yPWTnNzz08mnp9dAOYtOLaUEQ4QkGSyrZUNyRAf75am4qq/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d1ROjtf8; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d1ROjtf8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706046886; x=1737582886;
  h=content-transfer-encoding:in-reply-to:references:subject:
   from:cc:to:date:message-id:mime-version;
  bh=J8n0x5jPqP2HaTksOSZeqnBDMtdAoUrdqNpPDJeHfzo=;
  b=d1ROjtf8HrEdvEk7Wrtk6AgM387ArZwSTcCxCaNgS4PRcuFwka9vUzlF
   UFaneQpneryaJrxsOuxKDhKKj3QvqfMN4ScTC6A7h/ozx+tAQtKI1Ct+p
   jRHS39pubwkWZ+/OmGVm4j8+F6NZJ0Xjz2+uDYzXnLKdK8R9aozr8y+YP
   EqDKUPHqPbG/q7Q74foa+AgXB4go7OxhTUCCBu6o5u/ka9Y1A1/QWzSN+
   wACNkawUcKZG/JaPKV2cdjKRdLxQfeekMNyAvG+jWH/W1Z1Q4x9D9Edr7
   1si/5KQQ5hlwxJBlRRovoI6cPEWUTG329DXhOH0bh3BKLETiBouwNo2OJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8336213"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208,217";a="8336213"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 13:54:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="909442686"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208,217";a="909442686"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Jan 2024 13:54:44 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 13:54:44 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 13:54:43 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 13:54:43 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 13:54:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IgBXZ9DO0X+R17om8K8gUt55w3LZA1tfNQIv4DVppsSnSrAbkXxwFFQ1RKdhv8aplDA+Npk0rLT2llaC5MJq5oVakKbU7iE3PRgM8ML8DgmD84kyAJIrejtEbE9W4zaoudjl8srp8o52Gvv7M5BGb5e93RcvDI79CObpCXimoJ/OoJCNEAq2w7OK+mRn8u9dIxgLFe+A2JjNQu8Spb1o7W3NOFuEQKNKiAsJ1WKx4skmUbyyd+BPDdKYjBMn237CBmX4U2XCrfbpQr933ABxvz0X3/JQ8bXHKuIxCLltk3UkZuBBX+RsLpp3UajeuHqAIzXjAcVWi7kdZ72rrr9L5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zerUImfSrGLMMbVGqswioqQgIQSgU+swIt4m46IcTEo=;
 b=S/9cvZb5nvtVg5uu928z1xWDU5ID6Rz9Ey8evKIkCtqpJNRn5OOSBmTkYl5DEfOth5PAfIN640nMZgVYvnmjTsQX8itCEvQtibRlkv3idbe9kwGYfdP1EP/crH8ZuicZr6bD87govZoxxo/DDansZxDAqCaiAeaXDWDzRCk7/a8CXcD0I0lpUMqrjXKU+RIO60UKE5tDp774Fm1UozsOw2HYQhivFpQMdIbveXiCxW0ZeGbF8NqCOYYdzfhNvE5GTZ+lH0Sq60dNPF3cfLmsF0De2ywHr+znY9AIIYijnDIMYp9e/mEY7qhOS3a23FB7rkamsc88PvEm8adNFOzxeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA0PR11MB4704.namprd11.prod.outlook.com (2603:10b6:806:9b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Tue, 23 Jan
 2024 21:54:41 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::559e:7844:adc9:7793]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::559e:7844:adc9:7793%7]) with mapi id 15.20.7202.034; Tue, 23 Jan 2024
 21:54:41 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <87o7dbka4f.fsf@meer.lwn.net>
References: <20240123162157.61819-2-gustavo.sousa@intel.com> <87o7dbka4f.fsf@meer.lwn.net>
Subject: Re: [PATCH] docs/sphinx: Fix TOC scroll hack for the home page
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC:
To: Jonathan Corbet <corbet@lwn.net>, <linux-doc@vger.kernel.org>
Date: Tue, 23 Jan 2024 18:54:36 -0300
Message-ID: <170604687665.12457.16657471340475658193@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BYAPR07CA0075.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::16) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA0PR11MB4704:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c30c8a5-bd07-470b-c271-08dc1c5de6ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ok20JMejXtlwVJ4MPaOK+iPEk5RS5S7E32YTbU4DJk1ZgDvlOXHD9qqOpqVO5NUqUnAR9czh39KpgMqBuHVnE2mZweb1UA2ivWPvyx51DRkKYF9ZBk/OoVdCGZUA0W/1dDy4YXHyOkr5Cy44an3W+DbnPsME0nf9DemUHW90YRovXt+piQGq7Fc0zK8B4rYPEo0Dp9V6kjv8PCUnrlIPokr+d4tbW1sflgMWFxmx0MuQ905dRJ6+OUvS6mB2a63AQ7EJm8zuHqNVBky7X9dyWj3S5FTmFza8uU/ZzmVe6Byj7uU3fJbh2RpP2N8NOo7kqfPo4aBQFWvybHc35pb5cO9oMvCX2qc02mfybPl1EQVITs/o3vaKcUv204KDCgAw/+QfGxOb2Eq++3xeDscqZCWAJUo5xywJGxyk1rBqc0HKAMm9kfTvkCL8RtL41k7JtJX281R12PVy2NlHiCjdQ78+hICkVcOgEpv6SUNYdNbvH4u729tRuuxc0kfqHOE2S8OKdDAyzWrIRWloS5IG6K/oIK8uQ3INLk9+GJt5KM6j/uNHTHHnkAXy5nmJiP84
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8287.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39860400002)(396003)(346002)(366004)(136003)(376002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(26005)(86362001)(33716001)(41300700001)(38100700002)(8936002)(82960400001)(478600001)(316002)(6486002)(6666004)(8676002)(66556008)(66476007)(2906002)(6506007)(6512007)(5660300002)(83380400001)(9686003)(44832011)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RC9WckNrajB5MnRLOEpRNGhGRzY4MFQ4em5zMlRzVHRWRG1PV2ZWTXNRUnUw?=
 =?utf-8?B?TXlwc0tvcVdhOUJUTzJKZzFreXVUdWRxcUU5MWlTQ29LdDRaa255UGRaVlR6?=
 =?utf-8?B?SUhsQm91ZkFjR0xqZTdKaFFVQWZvTHJLdkdSZHBPMnVCK1lUMlYwcjFLRTh2?=
 =?utf-8?B?SDVqQkM3TVROay81Q2RoZ0Vhc2Z6dWIvUzVRVG12YjlqV2ZKZEZWUW9taEpQ?=
 =?utf-8?B?ZmpnRXEzbEtVdUorU21VM3RlcHA3allrbDYyOUZHS2J4VENuOUI1S1NoeG5O?=
 =?utf-8?B?VEE5aTNsRjRtSjk1bDBObjhXN1o5cWhYcGNXRWpqTUdyRGEvV1AwZURWdzZS?=
 =?utf-8?B?aHRFcnRZWHl1RUNDb1FVNWpDeTZ0SUNsNyszM2t3aWhZSk12dm5tbEx4RzY4?=
 =?utf-8?B?T1BRZ3Jha3RFZnJTK2o0bUdpbTd4a2M2MFMxSDZpamRtUFFmVVA1UHBMbXlQ?=
 =?utf-8?B?N25VY2xyeVg4K1FVRkliUnNvK0twaVlXeExpRTBMQjlad0d1cE5FRG11YzZQ?=
 =?utf-8?B?YUZQRUJFZTFVOFB5RWhLeDJqRTRpbXZWQld4V1dxWU8zbFhTL09zZjZ5MEJF?=
 =?utf-8?B?S0lKNnRhSm9CWmZVaUtscFZXK1p4QkYyR3JxMUhuaGd1cGpMN1doQm9PZlVX?=
 =?utf-8?B?WjZOM1Q1Y001dGpUVWVvQWNMWTAwR2w4ZjlKSUR6Y0EwclNnSTMzOWUzdzFn?=
 =?utf-8?B?NkJvS1pETytZWFBHeUQxYVdNMThNOHBjeWZTZjdJVTk4QU9kOWhxeVlvQS9O?=
 =?utf-8?B?MDF1aGIwaGYvLzg0Sjc1OWI5QlVEbk9PUkFVUmp3QnlzbjRDNkJNeVR3SzVO?=
 =?utf-8?B?RGRkYWc1amJTWXZ0RWdiRzYzUFppNUpzYW1YUVNkU3RRZUthVVFtYnM2c3Mr?=
 =?utf-8?B?MnMwU0t2eWxJNXpuWDZjR2d0Tkl1eUw2OFJHV3FmZTJuWmZpY004RGE3UWMr?=
 =?utf-8?B?ZnI3N2hHZ3hTNG5WMi9aSkxOSG1PMFFOSmhZSVVyV1RJUkhMaC9PQVJtd05m?=
 =?utf-8?B?aDVLNzFDRkU0Wk91V3dhNmk0ZGNhdi9hekx0bjVPLzcyUGo4dmR4RytKSVRY?=
 =?utf-8?B?SE4yNG5sU1JVazZ2MkpGWHNqT0I2RlBFcEZRNG81OHo3S09CTGVIeURlWFBX?=
 =?utf-8?B?MzJSN2Fva0hkUk1aeWdZOTdET3oyV0xVZDZYZVhueHlCZ2VQWStDNGpRd3U3?=
 =?utf-8?B?MmVwdXhtbzZDSkFTZVFMeDRXM1l4TVpkbis0WU0vNDhueWo1M2ZpYU1hTzY3?=
 =?utf-8?B?M0Z0ajIyd0JtMXRKVGkrS1FKZm42N25qV2FsY2hsRG1DV1VHYStWZ0hZMTV2?=
 =?utf-8?B?Yk9HcU5YZlZsN1poWHJya0F5am9STnE1L1p4VnphYmlpOXY5bHlTazVJNVlC?=
 =?utf-8?B?eWIyVC83eE5KRmRUYndHYU1mOUFQSnljTjNWOWtIOVo5enZPdkR6cmdnVm40?=
 =?utf-8?B?VnNpQm1aN2VwNzVRU1dBNU1hMncwb3htTFEyQkhZQ04zT2srN0FPaVllcm1M?=
 =?utf-8?B?ckhHdXlkWjhlRVhST0pvWWFBQk42eG1tSy9PcVcyVG4zMWtHVU0xYXE3endj?=
 =?utf-8?B?d2J6MTFJSWZUTm9aMkE5L3g0QkM1aW9mczNjaEZSWklIdDFJb0JKUmREZk9o?=
 =?utf-8?B?OUZ0STRFVXR6UzNpSG92dEV6SzZLRmxWclYrSlAwVzA0OFRIUHlmK2p0S01j?=
 =?utf-8?B?bkhSUnExMzhOa0Nna3liSXFxTUdGbmVMUGNHM1RSZGoxMUxzT1gvb2VlRE9Z?=
 =?utf-8?B?Y0Q0UnpVWWRhY241TjdTeHV5OEZtVUJPZlpibzZSVWc1eUw5c0JuR0QyWVlm?=
 =?utf-8?B?aGRUQ210N20zeEZzTCttdmlyeDRBM2s0Z3g2cXJGNmhTc0wyak9RYVY2TGpr?=
 =?utf-8?B?N0xhSjk3N3BXdnUyT0IrSVUyWC9yM3E0K0h6L0RuZ0p1N25CQmdlRkY0Y3pZ?=
 =?utf-8?B?T2k2RHIyNlFvMk91UU9RUjI0Tjd0Q2lSL1Yxei9tdy94SXNXQWZ5bEFZUzhK?=
 =?utf-8?B?SVh5Q01ORkR2SmRBcGF6Q2pvaXo1YkNwb2k3aUZSc3locmFDcTVKbEdSWmg4?=
 =?utf-8?B?V1g3QzNSNlNMdDgyUWJJR3gzL0xwYnBKcnk1b2tES0VPZC9VMXg0SG53QkJX?=
 =?utf-8?B?cWNqNXorN3k2eWZKbVJwYW1rajFrRUZZUllyUDdMWlc3dHNXNThjcUNqTjg2?=
 =?utf-8?B?UFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c30c8a5-bd07-470b-c271-08dc1c5de6ee
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 21:54:41.3982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SPOcn2+MSGrNijN1C0KP9/VZm5XzUvX+73G/nfUkcK1BZacN10MBCPoBqa1Duj+X64L6yvdaqb9WjNIe3JwhIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4704
X-OriginatorOrg: intel.com

Quoting Jonathan Corbet (2024-01-23 18:33:52-03:00)
>Gustavo Sousa <gustavo.sousa@intel.com> writes:
>
>> When on the documentation home page, there won't be any ".current"
>> element since no entry from the TOC was selected yet. That results in a
>> javascript error. Fix that by only trying to set the scrollTop if we
>> have matches for current entries.
>>
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>  Documentation/sphinx/templates/kernel-toc.html | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/sphinx/templates/kernel-toc.html b/Documentat=
ion/sphinx/templates/kernel-toc.html
>> index b58efa99df52..41f1efbe64bb 100644
>> --- a/Documentation/sphinx/templates/kernel-toc.html
>> +++ b/Documentation/sphinx/templates/kernel-toc.html
>> @@ -12,5 +12,7 @@
>>  <script type=3D"text/javascript"> <!--
>>    var sbar =3D document.getElementsByClassName("sphinxsidebar")[0];
>>    let currents =3D document.getElementsByClassName("current")
>> -  sbar.scrollTop =3D currents[currents.length - 1].offsetTop;
>> +  if (currents.length) {
>> +    sbar.scrollTop =3D currents[currents.length - 1].offsetTop;
>> +  }
>>    --> </script>
>
>Interesting, that's definitely a bug.  Did you stumble across this in
>the console, or did it manifest in some other way for you?

I just saw the error in the console :-)

Fortunately, the error is currently harmless, but it could become a
problem in the future if we were to put more stuff after the offending
line.

>
>Either way, I've applied this, thanks.

Thanks!

--
Gustavo Sousa

Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 52E607DE78
	for <lwn-linux-doc@archive.lwn.net>; Tue, 10 Apr 2018 17:52:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752470AbeDJRv6 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 10 Apr 2018 13:51:58 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:55914 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751874AbeDJRv4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Apr 2018 13:51:56 -0400
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w3AHpEqw002284;
        Tue, 10 Apr 2018 10:51:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=facebook; bh=G8rFIC7jVtNohf5a9DXq6S4FrqlaGHgAfIKTqbbv/rY=;
 b=a+jMyDExV+GqGrya464Yi+kXsnrmyQfHFwnIF94ET3UmVDmzrpnmghdl/YSoW2eoZKR7
 nH7o8/cJQHwIwE4ltgv8AVADdUFHciS5JAGf2syEVJO+DlKFxpvfVOFn+rXT5QL8H9Pv
 kjdB0wtiyzP2BXeeqJtuy9XjcghWg3DoT58= 
Received: from maileast.thefacebook.com ([199.201.65.23])
        by mx0a-00082601.pphosted.com with ESMTP id 2h91uu041j-4
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Tue, 10 Apr 2018 10:51:32 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.34) with Microsoft SMTP Server (TLS)
 id 14.3.361.1; Tue, 10 Apr 2018 13:50:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=G8rFIC7jVtNohf5a9DXq6S4FrqlaGHgAfIKTqbbv/rY=;
 b=PFNXBh1ujWLjAzYhRTr1FhXI69CLDcFit4TS6/cmC+mVTjvJ5aNo2979Dx/FxTv8JWX/WuxABkvnv1WGbsbsHeZ9nKI/OqfdEhq2diQsdcuj6VVbU4oIOoeigNnd6aNuWcKpXrhwbbNkk4JqtM7Z6afMBnn8ME8Ix3EfoqGpoIM=
Received: from localhost (2620:10d:c090:200::6:c1a3) by
 SN6PR1501MB2048.namprd15.prod.outlook.com (2603:10b6:805:e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.653.12; Tue, 10
 Apr 2018 17:50:19 +0000
Date:   Tue, 10 Apr 2018 10:50:16 -0700
From:   Andrey Ignatov <rdna@fb.com>
To:     Quentin Monnet <quentin.monnet@netronome.com>
CC:     <daniel@iogearbox.net>, <ast@kernel.org>, <netdev@vger.kernel.org>,
        <oss-drivers@netronome.com>, <linux-doc@vger.kernel.org>,
        <linux-man@vger.kernel.org>, Lawrence Brakmo <brakmo@fb.com>,
        Yonghong Song <yhs@fb.com>, Josef Bacik <jbacik@fb.com>
Subject: Re: [RFC bpf-next v2 7/8] bpf: add documentation for eBPF helpers
 (51-57)
Message-ID: <20180410175015.GA6762@rdna-mbp.dhcp.thefacebook.com>
References: <20180410144157.4831-1-quentin.monnet@netronome.com>
 <20180410144157.4831-8-quentin.monnet@netronome.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20180410144157.4831-8-quentin.monnet@netronome.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Originating-IP: [2620:10d:c090:200::6:c1a3]
X-ClientProxiedBy: CY4PR13CA0025.namprd13.prod.outlook.com
 (2603:10b6:903:99::11) To SN6PR1501MB2048.namprd15.prod.outlook.com
 (2603:10b6:805:e::19)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(2017052603328)(7153060)(7193020);SRVR:SN6PR1501MB2048;
X-Microsoft-Exchange-Diagnostics: 1;SN6PR1501MB2048;3:xXeQUznxqdKrxebOlGs3tGKcdLxMR57ndkxDWislw7DGi2HB6NHntT+Fu03D6BclDp1s9NupeTByI0LdbJF+1pKZfbE6Bk/fv9KbMBpvOwBafpcHyEXwiMUOMcEJx2mSMCKnKvlOf9puTPkirT3JTSKDwcLCbIX8lpdpEAermMyePIRvXBnP7LXNH+V7Q4h7n3oYoUUaMtsOPXE1vwILfW+wQ1lZtA74ZQ05QkBIOVc2r9VMG48D/jy5G3rXqqsp;25:p+Kfuj1J/7OHr9Z8K6yot7bpuoyioUdcij8pTNU5SG/l4Tu+mZuAPCoLBU2oL0c36WLR+HTrtlOfgeQazYCkF7XHuH40ODyocN2LukLkXjxHi3B7wQwHINaM/jiOOfRDk8gXc8WXJk+wfI7QoSwjwqdgXkpkLUYyEsrkSVBXCbfMYaMTO8W6/ute2SEzxG1JHXgMkBnLNxB/nni+MGUinmy3hDaNqTn9Fle6kulTjmecLc08LYwwweaeNA/idLXI+QKZOOTM/tay+9ugDBNBwnK4PTevS8IOTK7oJNrJIR15DwmaG6E2l7elcKo6SzM7DRKF5SPX77FByU2nEPXiDw==;31:qOSsqS9qdgHZFjl4rpzCJwMvWK7MqajgJwgY4lVr38Fv9Eyy/ettLhMWWHOuIJNMZucZj8vmR54lorprxuAoCGs2R45SF9XqhvC36FDvB8zTL2mv7/QQDuXMkmHWOihGaBYeIDBoSF6/lpQMeNQ/tc6Ov7rebBgxQllWIXSufgOmbHaKy+EUPgdZKr7ulGoz7dDghIdZULSGqfrP5cmCFvmGeaRvupp7TUQsp8BjDXs=
X-MS-TrafficTypeDiagnostic: SN6PR1501MB2048:
X-Microsoft-Exchange-Diagnostics: 1;SN6PR1501MB2048;20:QA8TnDH4G7WIyOyyN5/J1kQXjhGD78qPGRh9W72eSjHkpFjoqGXHJRDwOfhokgEMMJAWvrBrIQX/7Ngo/lQNWiO0N5JUta1hST3gIsjkBcVwpA7tx9d8OsHPOabCZZMeNhuL2P5587K1Mcw6+d5KBokIJQwM6NjOLWF6t3mAMKIdlJJ4rspBBo7amnIa3aGn40Qi+35j27Z3cwOh06cEf8q4qky1yd9kdZe8ZAta/HlV5fZRSTlJNRgt0761gqX6yEHELFRwME35XyhKkF6wT2jorpNcQA72Sp+7qh+jbE2RnXTGNMTDqTvJlVPP9CiGpVSCYrEnjVZsTVa1m7LFkFKcD3JYYNr1YICKbXOukXmEeN3PkkHpobr7c96hdaVJkO03phZkSOea08us7syOLfRQgE4tXiuhuqM/tguHa/x8/mS842/OPFDqk0cOZszp/jMrR17mA4y6MIfwC9ddbO6yWqYwu23ZYhedOZUad5gCx3PrffFuxFPoou2So/t1;4:HdN/jZgsDC2xGWHMH9gI5V9r26q7qeZZEh0aiPk1w4eQ3t46D+mFtxUL7Www+3Ksx+n4Ic4Mh+Q9C2rtgo1cJ2EMHz4nuJ4m+ozL54J9oyGTP1+CAeGwKDi0zPQ1lKYVFScdFuq6qfLMmK0UpNf6e2iMX1dubfQidILOoiHLyKFHczVIyTV4Cs0w1Bt5GjWV16vqYg6H1HeaurnYilJvuE/aclyt3Vf7kVzGZxM/n+d+VQ0UHvV6AWgNAQVz91kI3ZjXEryODn7pOFX4ILwVQbBX0LsKJeRLg/Y2Gnlm7czdbPiUkXCqsv0Jp4HMId9a1WsfaIvFWM+GynfUABE7KLEVMXZO78GA0grbILviry8=
X-Microsoft-Antispam-PRVS: <SN6PR1501MB2048D58B30DAEAE1E50325A6A8BE0@SN6PR1501MB2048.namprd15.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(21532816269658)(17755550239193);
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(3231221)(11241501184)(944501327)(52105095)(10201501046)(3002001)(6041310)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(20161123560045)(6072148)(201708071742011);SRVR:SN6PR1501MB2048;BCL:0;PCL:0;RULEID:;SRVR:SN6PR1501MB2048;
X-Forefront-PRVS: 0638FD5066
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10019020)(6069001)(376002)(346002)(396003)(39380400002)(366004)(39860400002)(377424004)(199004)(189003)(52396003)(23676004)(2486003)(52146003)(39060400002)(76176011)(106356001)(68736007)(1076002)(9686003)(33896004)(52116002)(5660300001)(2906002)(6246003)(33656002)(76506005)(47776003)(6116002)(4326008)(105586002)(229853002)(478600001)(305945005)(25786009)(186003)(7736002)(54906003)(97736004)(53936002)(486006)(6496006)(58126008)(6916009)(16586007)(16526019)(316002)(446003)(81166006)(6666003)(81156014)(86362001)(11346002)(8676002)(476003)(386003)(46003)(50466002)(8936002)(6486002)(18370500001)(42262002);DIR:OUT;SFP:1102;SCL:1;SRVR:SN6PR1501MB2048;H:localhost;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtTTjZQUjE1MDFNQjIwNDg7MjM6Vk9EZ3NqMHV0VldMZUZHMGpMUzdVYnZI?=
 =?utf-8?B?UThNUEFQdHVQYm94MTdTaWxrc2tVandOcEdKWmNMb2dwY2t3YkhFeVJrQ012?=
 =?utf-8?B?K0xXTWFvbnFTNEtCUDlNRUFqbFhES0tKSzAyWkV5cVlSK3FyWDVNV0NOUDhE?=
 =?utf-8?B?clpTRG4xNXE0dGwyVGg0Z1hxYUtFc3IyczQyUDl3dEtTcS9xSlpzeE5xYjJs?=
 =?utf-8?B?TGs1dkp6MW0yUzNkRmhyZVU5SlZVTUZGZXp2OFMyQ1N5SmxzcTFYWDhvbVVX?=
 =?utf-8?B?VFhxQ1ZmRVNrZ1Mrb0dHZHhzNmE1Skd3OGt3Y2FnRy92VGg5elE1blF0UzZv?=
 =?utf-8?B?YzZNeTdvWFE2Ukk1U3JCcFpETC9CRVhpYVZhSjI0Qi80dnRlTUp1SzlnRTY4?=
 =?utf-8?B?dXRYQ3h2cmtnbjJNbWNyOUY1dzI0S1NHT0ZLNVJjNEdTUEhsWlFEdWZjckxN?=
 =?utf-8?B?T0VadjZrZm5IUER3ZDY2UkxMaW4zRlJIbG1CZHo1czNFa0k0TDlJUG8rMWVW?=
 =?utf-8?B?YXMzSVNzT1RXSVhZd29CbEN2c21vZzhKcWhRY0QxYXR0b0E3Y1Yrd1hjZVUy?=
 =?utf-8?B?UFBERkxPMzIwMHRad1cvVVJxNTFSV0tnVVIyMVY2aTNUUmRvcGVRb1hDMmxP?=
 =?utf-8?B?bysyNW1LbGlZUDVLdUtma1lNQzg3RnB6ZkpzU1Zsbi9OVmkwSy9Kd2lReThM?=
 =?utf-8?B?cjAvTHpZM1FKNDVEQ1UycStLUVVMSGxIb1BvVkNoRTlaalBDTmFjMUhrRGFu?=
 =?utf-8?B?ODVsNUNjeVMwM1VaUVVySzRldzhLcTNwdGVmWlFCL2RyanpBWDVzbklwVm8w?=
 =?utf-8?B?dnBaNUM0VEhxWVFkQ0NLR0YvYTl0RlQvR0FCRWZQNDBxZ2tXR2hxdm0vMzRS?=
 =?utf-8?B?ayt3SXBBRmgyRGFkSTRSb1lkMWJ5UUoxOVYzaFpuUkNxU1VBUmYwTXIzMG0w?=
 =?utf-8?B?ZjNjMFp0dHpVSjBBYjVhVFRudGFVR2ZWM3BVTG9FNk9OTk9uNXlNTXVQczUy?=
 =?utf-8?B?d2V1VDFDY2g0UHRSVWg3QVZHT3ZTdVdMTGZ0djJXTjR6Mnkwd1FJTnZ3NVRz?=
 =?utf-8?B?bFRjeUg5ZDgyajZaeWhvMzE3YlYvM3NJMzJObHE0Vm1Nb1JtMUFuSjZ4NlFB?=
 =?utf-8?B?V2g0dlExUjB3aTM5WEJtWXJvQkxwdmk4a1UwNGg5UmxjdEJpR1pqaFRQSnZo?=
 =?utf-8?B?NXlqNDlHbXd4ejBFMURwdkd0WUJmVnBNWVVpdFVOVTRDYTdhNEd4R29BTmF0?=
 =?utf-8?B?LzFlYkZtb0xhemF6Z2E1V1h6MzNtdXYrN2NqSVMvUDQvRUJWS3A0d1lCNDhz?=
 =?utf-8?B?SlB0MTNnTUxvc3E0K1BhWFVHYURCZWpnV3FFMi9HdngyajhSUzVRS001KzVy?=
 =?utf-8?B?eGxQd1BmOTZjOVFCY1hCMDBZdm5aODVqU0IwQmVRTkFxbmdMTG1XOGJSUFY3?=
 =?utf-8?B?elp4QkdXc3NSaEdJZkM4QlNFWDQyaVNWZ3F2ZTBST0NUTnExUGo2WGF4ZDBs?=
 =?utf-8?B?TFArUkFtbzNJVkhxRjczUEIreDVvZXErcHY2VWJETk43b0VmUUhyLzNvcUUv?=
 =?utf-8?B?SjV6SnlEbG5aRG1ZOWxZTkQ2REQ1TlI4Q3M1Q3oxYXB0TFEwV2tDSGlNN3Rs?=
 =?utf-8?B?OEFTK0V5ZE5kMWY5SWxzMlRQM1hiTC9RZWo3OE5OTGV4eXN6UXE2bWNGUmNv?=
 =?utf-8?B?bTZQRXVWUDJDQ2xLRFViTEFKRGZLRlV1UkV4MnBXWVc2OHlWTTV2cldYZElt?=
 =?utf-8?B?VzBXSDYwUnQ1YlNuSzRta0pZOVp6TDEzRFdmZFY2Sm40QlUrZFpyNXJDODBQ?=
 =?utf-8?B?cWJZNE1TUHFHRUZPcFVxTHZIODc4cTBOd0tMd1pNaUdWeTB6UWFaYU5ZQ1Vt?=
 =?utf-8?Q?RSxK/O5CihJvs=3D?=
X-Microsoft-Antispam-Message-Info: +r/WkR4krk5p2fhijIhBPjv0TSzb6gQZypaBjoABHNjyk0hGtkAhY66coLjwCIhWADqyo+BIAxr4dyrR9AHdkV3GZQqnRNQpTWAIwo63mFr6OqKonK2EM5YPqxhRJhwQw0VzRE3uynlicLcIUHpdqHCVMHeXsHfac5G27JR1Epd4+1r/JnmKIjzzoJzxLL3I
X-Microsoft-Exchange-Diagnostics: 1;SN6PR1501MB2048;6:dtqGz1BTldngezU0FnzJZSKgaZu+pLjByiLWJyeOU1ykUBVhB47NZeubppOVdlw7U7/LkgQgUXMAX1UrVbYBP/44QogZn6kZUawG1rpFSxM/TTDFjFuKoqaRMPGMM6VMQ1KxjsWNVZ76oM3qYA3V1fHOUt/5cSTog7EBIMIQOTLRcXRDTs/fgcPPvmH9B/KyYNmRJ3gnwzJgDA0x2k+t7me49JgUNLgg7OhM9t8CB2DuTLV3cflJyTRJeCRGCP8HYjVUxVV84aelZCdbV1QeF/3oaApMy/wexXRzBkDxoKxnt5HzXbKidIHb5/VwFANp3unWmF1c+2a5I5ri0V1gYZwvKWvMIfaW9JHT6w2+omhDUZdX/ND7ye2prvpAYNpBQjamxXsJx7+aPpFWU4uJgBRbJgjuB0P9hBwlPMFslVLS4w6c3N5+kgxPip7UVUL3auqvmIHRQLcuNvOCsTkAYA==;5:Uej3+hmPN/oWh0HOF02/qviIZmU7mhl5gnKSIZWi7PpqQe8XK5mNk1fC1Ce/7qDAuAuhJtf3zb9gm9fSbxxYtKE/M4v6aVmSdaFeWQyjvdu3PQjfTLxBGMcAG+S4Oi6kH/BJt+tHhZXGTwSMika+E6QB5QIbjXv7aEtqP9Hwyk4=;24:fXuBslcFZccTfBpeJDg1lxBYxWJeaZF19hi+wV7PMrlIZyIBfwBYEIvLE7gg7RYKtBQjHg/1dtd4Jc2rxE2BkYTWlCQWCR1uCMj5cNoti4A=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1;SN6PR1501MB2048;7:yhcWgzXA12dDfiGHmyoG4wEuA3kne1D2GEf5y9DsIE5ngfwWMsUw2kVmtsJSor0l4R/fy4YjXLMkfG/obFjnwSqmk3rFU4G8TzFAOTpmBGl5SCXlVqwrAHbYDQ8RONzf8CMXLzGgDCJqrBVpIpIBwspVIOD48IZIzSg1QhQJfLOPBYtt8RJX3mo0tSDXOB4kC6oQEZFRwCs5KUBWQdQGbbgZgJu18pn7SqygblEVfOPYMEA+qo+FGjDaYrtv6ioP;20:2t8QZELEObbMJmgDyVhTJD3vZzcVPTVrSV5s5va4CLeDzvce4LCebNHzRXxolkQJeQgaWeroDbxrZZaqH6fQIPz1PStuEggcRwMb23U78CNsDIFg+qhUy5mVie4Ku+JCjWp/WQHx8lmb55GSlbsNzr2U/RzmWDldsUarFwWVj2Y=
X-MS-Office365-Filtering-Correlation-Id: 82f96638-7e01-4a67-6deb-08d59f0b86ea
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2018 17:50:19.8041 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82f96638-7e01-4a67-6deb-08d59f0b86ea
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR1501MB2048
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-04-10_07:,,
 signatures=0
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Quentin Monnet <quentin.monnet@netronome.com> [Tue, 2018-04-10 07:43 -0700]:
> + * int bpf_bind(struct bpf_sock_addr_kern *ctx, struct sockaddr *addr, int addr_len)
> + * 	Description
> + * 		Bind the socket associated to *ctx* to the address pointed by
> + * 		*addr*, of length *addr_len*. This allows for making outgoing
> + * 		connection from the desired IP address, which can be useful for
> + * 		example when all processes inside a cgroup should use one
> + * 		single IP address on a host that has multiple IP configured.
> + *
> + * 		This helper works for IPv4 and IPv6, TCP and UDP sockets. The
> + * 		domain (*addr*\ **->sa_family**) must be **AF_INET** (or
> + * 		**AF_INET6**). Looking for a free port to bind to can be
> + * 		expensive, therefore binding to port is not permitted by the
> + * 		helper: *addr*\ **->sin_port** (or **sin6_port**, respectively)
> + * 		must be set to zero.
> + *
> + * 		As for the remote end, both parts of it can be overridden,
> + * 		remote IP and remote port. This can be useful if an application
> + * 		inside a cgroup wants to connect to another application inside
> + * 		the same cgroup or to itself, but knows nothing about the IP
> + * 		address assigned to the cgroup.

The last paragraph ("As for the remote end ...") is not relevant to
bpf_bind() and should be removed. It's about sys_connect hook itself
that can call to bpf_bind() but also has other functionality (and that
other functionality is described by this paragraph).


-- 
Andrey Ignatov
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

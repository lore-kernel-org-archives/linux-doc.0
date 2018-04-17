Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 984F27E87E
	for <lwn-linux-doc@archive.lwn.net>; Tue, 17 Apr 2018 17:52:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752254AbeDQRvz (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 17 Apr 2018 13:51:55 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:57090 "EHLO
        mx0b-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752145AbeDQRvu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Apr 2018 13:51:50 -0400
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w3HHm6UP031825;
        Tue, 17 Apr 2018 10:51:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=facebook;
 bh=/4luoiZogo2meTej6OPjWDjNGwFRU9ugZ0w0xVbC6ho=;
 b=kB+xPXuQLx8O+s1gJAEHqhHJGIDQHDZ/YvuJxsPg7bsnqc4lnfRdOKIUEXo728l4kFn2
 WAe2CYOcLcw/lQnSJ42fsMFvWgCMRDgs/2YDM/vziPySER5VhxUOTEbtpkV2Qz4BqObH
 drdjgI9p/rqfBXe/vpzziJXlTmMbenDJAj4= 
Received: from maileast.thefacebook.com ([199.201.65.23])
        by mx0a-00082601.pphosted.com with ESMTP id 2hdnga01a0-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Tue, 17 Apr 2018 10:51:26 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.29) with Microsoft SMTP Server (TLS)
 id 14.3.361.1; Tue, 17 Apr 2018 13:51:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=/4luoiZogo2meTej6OPjWDjNGwFRU9ugZ0w0xVbC6ho=;
 b=iu2EjHpBvg1L1hrl0DMidr1U1t9oh1LC7kA3QbADEr0xGFg9yIKFEHJjlQSI6j2Lr8gkYCvyV3HDQqLifBxuw6vVokiKR/qfYELPtZjJQNe6MCvKDvC1pphvcmPFXLauTpk65+FOK8pbBn1uXy20az+uFQk3qRW8jgbRRlYrA3w=
Received: from iphone-409c2846b52f.dhcp.thefacebook.com
 (2620:10d:c090:200::5:2bfa) by CO2PR15MB0075.namprd15.prod.outlook.com
 (2a01:111:e400:5068::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.675.15; Tue, 17
 Apr 2018 17:51:21 +0000
Subject: Re: [PATCH bpf-next v3 7/8] bpf: add documentation for eBPF helpers
 (51-57)
To:     Quentin Monnet <quentin.monnet@netronome.com>,
        <daniel@iogearbox.net>, <ast@kernel.org>
CC:     <netdev@vger.kernel.org>, <oss-drivers@netronome.com>,
        <linux-doc@vger.kernel.org>, <linux-man@vger.kernel.org>,
        Lawrence Brakmo <brakmo@fb.com>, Josef Bacik <jbacik@fb.com>,
        Andrey Ignatov <rdna@fb.com>
References: <20180417143438.7018-1-quentin.monnet@netronome.com>
 <20180417143438.7018-8-quentin.monnet@netronome.com>
From:   Yonghong Song <yhs@fb.com>
Message-ID: <9e7a907c-f43c-4db8-60ad-8c156fb09bf9@fb.com>
Date:   Tue, 17 Apr 2018 10:51:15 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180417143438.7018-8-quentin.monnet@netronome.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [2620:10d:c090:200::5:2bfa]
X-ClientProxiedBy: DM5PR21CA0039.namprd21.prod.outlook.com
 (2603:10b6:3:ed::25) To CO2PR15MB0075.namprd15.prod.outlook.com
 (2a01:111:e400:5068::25)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:(7020095)(4652020)(5600026)(2017052603328)(7153060)(7193020);SRVR:CO2PR15MB0075;
X-Microsoft-Exchange-Diagnostics: 1;CO2PR15MB0075;3:F4HDWxdwBq2jaCxNabGRHchHs4E9ceh1RTBhDfHm3nBqk1umOClE7/vWMKDVSqjOMZkzYm/DjwPefSsskYDcwuHwsejgycKWoAtRhr9XYJmZpiZCCcCWcMc6fLS1TI1094Md3HAyhS1hDfUjZStl9Q8MIXNn0ElUiZoYmXVHuzTG0cA9H9JfP2TREm+UwZtgCrpU3pmlnV1R2RgVaIEthMaU/N8S/ScjJyG++ug5X3HMOZpE0hh+26t6sr84Js5h;25:esVROm8gh1hHjR/6SxRA5hv2uhWVJj7QMV35IZsGpMKSjurs5LnViKF0heTK+aho+entjuCo/1qFnnNRHx++o13ovv8hiSXF42dNZrPp2ilelFTzOB89Q6LcCBPuJWKGZ5csxpPPa/9FtRD1g7T1QBLaIMts2YZdYMqqGuPW7g6r4ZxpUi4ZTuEhxL+Fv9QwH9DEZMX+94LF9RLU+y08SXZVRGwACrH72l5rGXbOciQJfbXNzvKw9k5+pfCVFjBQIPUj+3yXJtGsH4Nq6mvXvZlcGrTJANmic6uKzkCa6l+LcfYYcoEFn7dlrJRX1SHDFm0MUPnwHp2SrJmKdfDA8A==;31:WZcRsv93yEb+6/MPrBINZBoVy/YgGT/PezUej2n06/vLYnIr+yyqve9P6uzWjFGouBlJBqP5PXu3W+8GmAE344or9x9VNEcjh6UXPgUZecAtwtets03oEgLRaYTvc4mBGEERXdGEWDJL3CHhmpdh580r9AWjxbbvKB7ld92roh7gP+E3O35BrA/PgCgF54roEiN4uiGXKyvgeM8g5XdG2VO9f465TVGRJ2EpuusGOpk=
X-MS-TrafficTypeDiagnostic: CO2PR15MB0075:
X-Microsoft-Exchange-Diagnostics: 1;CO2PR15MB0075;20:E7JoQi5ZjcVPq4+sf6jNm86qwgsRTWoNA+17Ur4fYM1bnI6xunuVjyO1TliJ/qHahi19Tf2I496JKE/x3gGuwFBg0yO6KeL51oirrprgX0u3hX62GAEyYO2iO3kFSk1Y3DgeylbNMURtibsemjQBB0nu/fPXVUwxXSmc404qD0F3pW+31HSh4ImIsLPQHLDmX84qHumMTB47HUYfANjw5cddfDnpVvV/CKkE8F1PS38bh53Mf3qgb6XuxZxYha0eRiXrqSLeETchGTNXr4y+haUBdBnwRG8SYHBruKCXWa9BnrEqo5ZlN1/qbSMzsUkEx9EXPTroid6oB3uAYtT9sMn1ahYwLqVF6UDg+R2L+4q1BqrnnpE1rFaGR3r6yPQWVDI+7QWDkigz6P2slkbZaJw3CKRHDTw+S267C101FX4nxw8ls44t1cz6J2ACscsd0m7H//LFvuhTCJJ8PdeqCWQ2aW15jNpk/13b1+ynPs0viS6ufdtRDs0j2dXAtssO;4:OqWtGFfdptL/5kRS+CRCx/1pOz3s0B/fDDhsB2o/R5AFJ8kpi4FZJ1jXn6U49V0EZK/LTfjyW1VhkCkC5t8octeoFFzphjRkZrIN2DMMytMIu7flQHZK/yw9mu0kFzzQe7CkRdG82et1deC8TLrqBR3wXn4TLoNuoZI+g3CksLtwsU7mrdm5O7Xreai7b5vmi7++a8l4gYFSB0q6FjPQmOyVanr0kCSJEWHYaCnnb3ZIuPGHPwkwibVSlue3UmLuf1W6MQKMSLMO+APIxznNn7fRVn41gyMPGABRxNXT99SoDi8ILs9qq1oJDDubcnn4CUlFzUtDhrh10ue8PWwklc9ooM3sdNrRtVpFKnSDfBIn8FUh3LOJ4uJzkEHf8axg
X-Microsoft-Antispam-PRVS: <CO2PR15MB00751F62810D642F35C565DAD3B70@CO2PR15MB0075.namprd15.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(72170088055959)(67672495146484)(17755550239193);
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(93006095)(93001095)(3231232)(11241501184)(944501327)(52105095)(3002001)(6041310)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123558120)(20161123562045)(6072148)(201708071742011);SRVR:CO2PR15MB0075;BCL:0;PCL:0;RULEID:;SRVR:CO2PR15MB0075;
X-Forefront-PRVS: 0645BEB7AA
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10019020)(346002)(396003)(376002)(39860400002)(39380400002)(366004)(199004)(189003)(6666003)(25786009)(4326008)(316002)(229853002)(58126008)(54906003)(16526019)(23676004)(52396003)(31686004)(2486003)(8936002)(53936002)(31696002)(6246003)(52146003)(6506007)(46003)(6116002)(47776003)(6486002)(68736007)(86362001)(39060400002)(5890100001)(6512007)(50466002)(59450400001)(53546011)(386003)(64126003)(8676002)(5660300001)(65826007)(446003)(2616005)(81156014)(11346002)(81166006)(486006)(7736002)(65806001)(230700001)(97736004)(105586002)(65956001)(76176011)(305945005)(2906002)(52116002)(36756003)(67846002)(478600001)(106356001)(476003)(42262002);DIR:OUT;SFP:1102;SCL:1;SRVR:CO2PR15MB0075;H:iphone-409c2846b52f.dhcp.thefacebook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDTzJQUjE1TUIwMDc1OzIzOjBtd0pKWGZrVGp3OVd0bjJxNTN6T3hFSW4x?=
 =?utf-8?B?bW90K2o5dWhBMGtFaVo0c3BLUzAvbjdlbER5RzRKT0ppRXUxMmYwd1gvcHcz?=
 =?utf-8?B?N1BUd0lsL01ZL2tSOEt5c2dudS8vTTE3ejc1MzJIWHVhMjBGb0pmenJCUWpv?=
 =?utf-8?B?VHZYTHFwcjB3ZGFvNWxtcnVwa3d6eHFhMnVpRlE1U3VQTmROQkU4ZFpxN1F2?=
 =?utf-8?B?S0ZZZFU0MkZzQmJFQUJKK2loYWwwVDFqMi84STdqUTNyQm9FRm5tSWZlUVhk?=
 =?utf-8?B?TkV2RWwvcmw0aDhlcXp6ZnlPL0E0WUpnTkkvSytlcFBhc3I4Zy9oRERDK0h5?=
 =?utf-8?B?ckZTZmtVRjFldGkzZDVWNFlPaUZ2MjJHMUJVd2Y1VjJrNUlJSmZXVnJjVUsv?=
 =?utf-8?B?MFNqWTFGNHlMbk5lNzM3dk9jVGpzalB1dEFFTnAwNkFxT3Vqdkd4SHhCQ09k?=
 =?utf-8?B?ZkVxNkNSRUZ5OWJ5N1BTcmE2bTF4RzZrcURLMC9GdzQzbThVVThnejM1OUxG?=
 =?utf-8?B?cFd6Vnp0Q2krMlBteW5qYkxUZmplaGVDOVlMdkFEMmZXZDhsdGhCTzQyQWVV?=
 =?utf-8?B?cTFMS1dJOUZxOFVJU1pwUWpYY0Z6LzdaRS9aekduMG4wZlo5ZlV6TFZYK1FP?=
 =?utf-8?B?ejYycWNGVTczTTFlcDI3aEtPU3hralV4TTE2bElqVGtMbmI3OUxqYWo0dWJU?=
 =?utf-8?B?dnNjMC91SHZHRU90YjArNWFsTDRCenUxTVhQcGloVmdCZGoxckp5Zms0ZGcw?=
 =?utf-8?B?UWFnc0xCS1FncGMxck04UCtZRERBa3pQREJVUHhya1J1TXBiMmc0Z0x0VWlN?=
 =?utf-8?B?dHRRbW12dHJ0eTZQTmhkbUxGbVZQT0Q3TkZlUGdWb0RJS2xNREdMYks3T1Fs?=
 =?utf-8?B?ZW9CTFFwaUFyWUQzVFRaVVJYYmJtUkUxVUVobGFMaTBTb2tPc1lpR283V1BD?=
 =?utf-8?B?eE0rRUM1WmZpM2xVUU5xakxnK0tab2xPYW5acEhMeUxuYjIxeHZLUDkxTVZw?=
 =?utf-8?B?c1g3NVZDNTVxZXJmVVJwWDhZUCtsWnNXeUJZUmRKZko0Yk8rbTZNZDg3WXhT?=
 =?utf-8?B?YVF1NXAwbmhrOUZzazNTRFM0ZzJMdytOUmcyaUVHNXpaYUJSZVAvdjdzaHVJ?=
 =?utf-8?B?WlZuM2tvN0xvYUtXTEtLL0tTV1lUOFBvRXUzNEdabzR6dDMrZVljQ1BiTWM4?=
 =?utf-8?B?WXRiUnZENkdxVWNSc052VTJVN1pXVjZYeWVXaTRTQVB2K3hVbFA3UUVHYWpR?=
 =?utf-8?B?Yyt6U2VRNTZmWnRhWjJpNnBoQldRdGs5MHVxc3U1WEplblAxK2hjMWt2RWFN?=
 =?utf-8?B?Y3RLdEFBTThOV2FBOEZHU0hlcm94c3N1OVMyaldTMWU5aUoxdEQ3WGw3QmJ2?=
 =?utf-8?B?ZXJ5MTJrMWk4WUZDalhtVElFb2ZUKzk5TlgvQWQyQTNldlVSckZUQjBEZ2RF?=
 =?utf-8?B?SU9Td1RqQmpUUGZPNnNuRHpOOFV0KzJjVFQ1cTh0c2V1V0JNTW5JWEhNQWI3?=
 =?utf-8?B?bFVuNGx2aE51aG9lRXdVVmNVakdyTGpJQ2ZTQ1k5SFMrREJVUk5pRU1NbUNY?=
 =?utf-8?B?THo1WklLYnZMQmlZZGNJTnp5M2gxZFpmQzA5cGhWblJPUTV5L3YzeTltaGxQ?=
 =?utf-8?B?OTFNSkF6bjZZdlArcElpeGxUMHo4UXA1RkcxNWoyMENOL21qajBIQUJVRnhH?=
 =?utf-8?B?dGhpajR1MnlxUEFuWXl2dTEvN1MreE5xd2FMeHZxWVA3TzZrZ01aa3VmZWN1?=
 =?utf-8?B?QnZOTlRZV3R4MDR3QlNKckR0b0d2OUkyZ3lYQ2FxalBYL3YxaHZNZWUreEN4?=
 =?utf-8?B?SklsWm1ISHJPcGJLbDhBM2hjdGNNQW92SXBEWTg3ZVFhckhsa0o1WGlCdlRU?=
 =?utf-8?B?V1UxZzk5S2VxalhMNzBJclQxVm1hekhlc21QakZEY0pCVDYrQnRSUmxNbDQ1?=
 =?utf-8?B?Q0ZsQ0JiOUtCbk0yYzY4dWFzSXZ0QVlBSEY4dTlPTExUb3JOaEF3aUtzaFlY?=
 =?utf-8?Q?4vUpJv?=
X-Microsoft-Antispam-Message-Info: KMevoA2cvB7uw7zMhKmW6iNfUwddgcGfYfkv9LQREBlsZEZy7yaj9StUXSDJCqda1D3zqua2/2D9hMW6CiTiBUxiFNruRlcfo7BLjerC+wQZQvsxGB6aAWSGSBO7MQAzKUwl4SR7nFRJgOL84Q71jyd8STGuI+6zsHYYSOWamyhBe82d7Dkdf3ViKy/oEHdt
X-Microsoft-Exchange-Diagnostics: 1;CO2PR15MB0075;6:xVQjMeZuvWR4AG6mP4ec0QiqoipIEi7JRJGf6RU2/OxmwsX/foTZNWsRfydgo33SzhY9gj3SnqIeWa7AaNvIX9V8UhOMT5x2iKZWotK3VQFqdLTGYP8wUJXgzWKeaKdvSa6Fmo3iKxdQtzzpsm/ixYK1DQca+sqj6oEJAsXDHrqgGxhNe5ODDSeLJJ5yKFJpzFkyZ/9rj6X2IcUr5ajng5EljewOym2AUyRaQ0UaMv8neZI7I4chY8ltF2l9/FR4jei866NYX4BQbfSkUM45cCif6QE0+KGumfNlRfeZCEEb8bsNVY9xd6/DdNnOBxGniblS94uhVGimvRcrhacTJb5VQkuQAoQNqwGNE2d7ix+C6YX/fLRp2kKb11MeSy/U2xckig78msaBEMZRadaLHNdzVQXzNk5EKNlo5Y2bXG72ua/FnT+sLwPUlNIUWtTscD6WeRaeYWdskh7jbhK+kQ==;5:hHi6E3aQ7up2zXLtj7Xc9M2RTI2e38ZQNjPDCSKtdH9TF+x12CQD9l/9IleP/Vj6EUWM9eUNkkN3HZ2QjS00aESaVRU6Cai8I8c7uciMq6y61geyWQHc7aP3PpgeVQOjRbB6BT5PmH9NJGxsC7Awsq7/8VlVoKK85HCfvUgW3rw=;24:9rZ3tYRJ5vm206cKrZTWiDC8rFJoZh1x6wsqt6/2vIv6bkEyYixO5xzQuMdHRZNB33FzfaRYCXcHVIQRARdutsuBKuRykhFm++nPly0ehyE=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1;CO2PR15MB0075;7:cc0kb3FSCwuG63G6wRjhrTsFKPCH+Igcr/3dAvNFza6szMByeEJGyQxLRDpUzg+YiVa0EUCE9PQOXNWKS3pHlMmLjusQJYkXWj7JX5Hq/PU0Ul/iRYge30+8roFN//4sKQDTaElHrWWMNhaKIDagoZ6kqliZquC20vSu1OjWlWudNFPWRYTSCOW7nGr+3a4WxrA7aKpSmQNxRHwMdc5/NbvJBiaiIFkx+iJ0284W7EOEiwYhMscrd+RJiAdn9yfK;20:k2M1TqVS81sRiq7VUz+kYACi2pZTiy7TdntgWTZLWqVOHBriEZhvWbtNQOI3C1nC6SzgwRSlHur6+UhJTlEqR2Zf2L4qFRpSVcNqxnMr3D1jXjfmJn0/x1LMw9CnAR4WCFuc1gzu+6R/KQCNlCAckEd+guhVTrM2u1iUUbAl1ro=
X-MS-Office365-Filtering-Correlation-Id: 2b18b8da-188e-4cf4-0f99-08d5a48bd522
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2018 17:51:21.0356 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b18b8da-188e-4cf4-0f99-08d5a48bd522
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR15MB0075
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-04-17_09:,,
 signatures=0
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 4/17/18 7:34 AM, Quentin Monnet wrote:
> Add documentation for eBPF helper functions to bpf.h user header file.
> This documentation can be parsed with the Python script provided in
> another commit of the patch series, in order to provide a RST document
> that can later be converted into a man page.
> 
> The objective is to make the documentation easily understandable and
> accessible to all eBPF developers, including beginners.
> 
> This patch contains descriptions for the following helper functions:
> 
> Helpers from Lawrence:
> - bpf_setsockopt()
> - bpf_getsockopt()
> - bpf_sock_ops_cb_flags_set()
> 
> Helpers from Yonghong:
> - bpf_perf_event_read_value()
> - bpf_perf_prog_read_value()
> 
> Helper from Josef:
> - bpf_override_return()
> 
> Helper from Andrey:
> - bpf_bind()
> 
> v3:
> - bpf_perf_event_read_value(): Fix time of selection for perf event type
>    in description. Remove occurences of "cores" to avoid confusion with
>    "CPU".
> - bpf_bind(): Remove last paragraph of description, which was off topic.
> 
> Cc: Lawrence Brakmo <brakmo@fb.com>
> Cc: Yonghong Song <yhs@fb.com>
> Cc: Josef Bacik <jbacik@fb.com>
> Cc: Andrey Ignatov <rdna@fb.com>
> Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>
> 
> fix patch 7: Yonghong and Andrey
> ---
>   include/uapi/linux/bpf.h | 178 +++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 178 insertions(+)
> 
> diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
> index dd79a1c82adf..350459c583de 100644
> --- a/include/uapi/linux/bpf.h
> +++ b/include/uapi/linux/bpf.h
> @@ -1234,6 +1234,28 @@ union bpf_attr {
>    * 	Return
>    * 		0
>    *
> + * int bpf_setsockopt(struct bpf_sock_ops_kern *bpf_socket, int level, int optname, char *optval, int optlen)
> + * 	Description
> + * 		Emulate a call to **setsockopt()** on the socket associated to
> + * 		*bpf_socket*, which must be a full socket. The *level* at
> + * 		which the option resides and the name *optname* of the option
> + * 		must be specified, see **setsockopt(2)** for more information.
> + * 		The option value of length *optlen* is pointed by *optval*.
> + *
> + * 		This helper actually implements a subset of **setsockopt()**.
> + * 		It supports the following *level*\ s:
> + *
> + * 		* **SOL_SOCKET**, which supports the following *optname*\ s:
> + * 		  **SO_RCVBUF**, **SO_SNDBUF**, **SO_MAX_PACING_RATE**,
> + * 		  **SO_PRIORITY**, **SO_RCVLOWAT**, **SO_MARK**.
> + * 		* **IPPROTO_TCP**, which supports the following *optname*\ s:
> + * 		  **TCP_CONGESTION**, **TCP_BPF_IW**,
> + * 		  **TCP_BPF_SNDCWND_CLAMP**.
> + * 		* **IPPROTO_IP**, which supports *optname* **IP_TOS**.
> + * 		* **IPPROTO_IPV6**, which supports *optname* **IPV6_TCLASS**.
> + * 	Return
> + * 		0 on success, or a negative error in case of failure.
> + *
>    * int bpf_skb_adjust_room(struct sk_buff *skb, u32 len_diff, u32 mode, u64 flags)
>    * 	Description
>    * 		Grow or shrink the room for data in the packet associated to
> @@ -1281,6 +1303,162 @@ union bpf_attr {
>    * 		performed again.
>    * 	Return
>    * 		0 on success, or a negative error in case of failure.
> + *
> + * int bpf_perf_event_read_value(struct bpf_map *map, u64 flags, struct bpf_perf_event_value *buf, u32 buf_size)
> + * 	Description
> + * 		Read the value of a perf event counter, and store it into *buf*
> + * 		of size *buf_size*. This helper relies on a *map* of type
> + * 		**BPF_MAP_TYPE_PERF_EVENT_ARRAY**. The nature of the perf event
> + * 		counter is selected when *map* is updated with perf event file
> + * 		descriptors. The *map* is an array whose size is the number of
> + * 		available CPUs, and each cell contains a value relative to one
> + * 		CPU. The value to retrieve is indicated by *flags*, that
> + * 		contains the index of the CPU to look up, masked with
> + * 		**BPF_F_INDEX_MASK**. Alternatively, *flags* can be set to
> + * 		**BPF_F_CURRENT_CPU** to indicate that the value for the
> + * 		current CPU should be retrieved.
> + *
> + * 		This helper behaves in a way close to
> + * 		**bpf_perf_event_read**\ () helper, save that instead of
> + * 		just returning the value observed, it fills the *buf*
> + * 		structure. This allows for additional data to be retrieved: in
> + * 		particular, the enabled and running times (in *buf*\
> + * 		**->enabled** and *buf*\ **->running**, respectively) are
> + * 		copied.
> + *
> + * 		These values are interesting, because hardware PMU (Performance
> + * 		Monitoring Unit) counters are limited resources. When there are
> + * 		more PMU based perf events opened than available counters,
> + * 		kernel will multiplex these events so each event gets certain
> + * 		percentage (but not all) of the PMU time. In case that
> + * 		multiplexing happens, the number of samples or counter value
> + * 		will not reflect the case compared to when no multiplexing
> + * 		occurs. This makes comparison between different runs difficult.
> + * 		Typically, the counter value should be normalized before
> + * 		comparing to other experiments. The usual normalization is done
> + * 		as follows.
> + *
> + * 		::
> + *
> + * 			normalized_counter = counter * t_enabled / t_running
> + *
> + * 		Where t_enabled is the time enabled for event and t_running is
> + * 		the time running for event since last normalization. The
> + * 		enabled and running times are accumulated since the perf event
> + * 		open. To achieve scaling factor between two invocations of an
> + * 		eBPF program, users can can use CPU id as the key (which is
> + * 		typical for perf array usage model) to remember the previous
> + * 		value and do the calculation inside the eBPF program.
> + * 	Return
> + * 		0 on success, or a negative error in case of failure.
> + *
> + * int bpf_perf_prog_read_value(struct bpf_perf_event_data_kern *ctx, struct bpf_perf_event_value *buf, u32 buf_size)
> + * 	Description
> + * 		For en eBPF program attached to a perf event, retrieve the
> + * 		value of the event counter associated to *ctx* and store it in
> + * 		the structure pointed by *buf* and of size *buf_size*. Enabled
> + * 		and running times are also stored in the structure (see
> + * 		description of helper **bpf_perf_event_read_value**\ () for
> + * 		more details).
> + * 	Return
> + * 		0 on success, or a negative error in case of failure.

Acked-by: Yonghong Song <yhs@fb.com>
for the following two helpers:
   - bpf_perf_event_read_value()
   - bpf_perf_prog_read_value()

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

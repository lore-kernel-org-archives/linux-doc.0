Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C0AE57DE78
	for <lwn-linux-doc@archive.lwn.net>; Tue, 10 Apr 2018 16:59:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751611AbeDJQ7R (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 10 Apr 2018 12:59:17 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:33444 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751367AbeDJQ7P (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Apr 2018 12:59:15 -0400
Received: from pps.filterd (m0044008.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w3AGsTgg022327;
        Tue, 10 Apr 2018 09:58:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=facebook;
 bh=og4uCv39CkudYiJTQ792ii+cB+R1b1aQEeyVkwxxANE=;
 b=iDax0o26QwH/dpjdFaWpMgiSuMbhUE+k/F7QlCcU2pOXaT0vlfstZaFi/hYbpV11XtTx
 h8K/c5Lo76KHJxET5bzCFodaxHQf+lUcQWTZuOTN0w24y35IP8T5I7a8Xb8aJ7M1R+do
 r5qWcUxNEMouLCOxlA4qG6qA1NCaA7K4fhU= 
Received: from maileast.thefacebook.com ([199.201.65.23])
        by mx0a-00082601.pphosted.com with ESMTP id 2h8y6a0gtk-20
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Tue, 10 Apr 2018 09:58:52 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.25) with Microsoft SMTP Server (TLS)
 id 14.3.361.1; Tue, 10 Apr 2018 12:58:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=og4uCv39CkudYiJTQ792ii+cB+R1b1aQEeyVkwxxANE=;
 b=ZawM4q9UXWZqNRxhQjBT3SQSixHdTSKxJ12ThcUvSCWItwqFuOKqMjGfyDJG/H8lUf/g0SXQ1tYDaIbEu01XKbAaUyPth+XEjVKnYLgHgSKNTxKzEjwBixgPc3XRjm14klK6Pm5TDH8F97pXc/VSnJsTZHEOGvqUk7U4pOMWVGw=
Received: from iphone-409c2846b52f.dhcp.thefacebook.com
 (2620:10d:c090:200::7:d5d3) by CO2PR15MB0075.namprd15.prod.outlook.com
 (2a01:111:e400:5068::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.653.12; Tue, 10
 Apr 2018 16:58:27 +0000
Subject: Re: [RFC bpf-next v2 7/8] bpf: add documentation for eBPF helpers
 (51-57)
To:     Quentin Monnet <quentin.monnet@netronome.com>,
        <daniel@iogearbox.net>, <ast@kernel.org>
CC:     <netdev@vger.kernel.org>, <oss-drivers@netronome.com>,
        <linux-doc@vger.kernel.org>, <linux-man@vger.kernel.org>,
        Lawrence Brakmo <brakmo@fb.com>, Josef Bacik <jbacik@fb.com>,
        Andrey Ignatov <rdna@fb.com>
References: <20180410144157.4831-1-quentin.monnet@netronome.com>
 <20180410144157.4831-8-quentin.monnet@netronome.com>
From:   Yonghong Song <yhs@fb.com>
Message-ID: <cc54b41e-3f2f-e87f-042f-842c96308626@fb.com>
Date:   Tue, 10 Apr 2018 09:58:23 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180410144157.4831-8-quentin.monnet@netronome.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [2620:10d:c090:200::7:d5d3]
X-ClientProxiedBy: MWHPR22CA0029.namprd22.prod.outlook.com
 (2603:10b6:300:69::15) To CO2PR15MB0075.namprd15.prod.outlook.com
 (2a01:111:e400:5068::25)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26fc55f4-1dc0-4f1c-3008-08d59f04481d
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:(7020095)(4652020)(5600026)(4604075)(2017052603328)(7153060)(7193020);SRVR:CO2PR15MB0075;
X-Microsoft-Exchange-Diagnostics: 1;CO2PR15MB0075;3:EMzozff2dR+lNq5duvhQ1bjj1ENmJMCT+7jutf2XYLf0HjMffAOIBPsBKI5nVkta9jbN9Gv4NtSC0jesnSgu8nvtrDkiB+XWswl3M+ulN5oK6bM6WXYRXbuan2U9zyodvxTC7cWLfGkHkMgCg8SiQ4V5AicMNKRGhjRyvdZcdeVAfaXlqy7YMcrxdaMGgWdlOUDE5jP81+e65oEN37beqbt1mW+I7RZsXucnPvVj7HlQkCK5JWPL5wI2FldzeX4p;25:6NbsE+Mr9hj/KoxwrNsY5ErNpM6uDoNUh+xzY7HX6Jn9Xq/Wz1owjhHIJTOSbn3jlCo6xuh5PEBq2hkSrpwLhSosYztzJA9EJpGJO4VOja9owWwrCmQRhnnwYmLWjJ8mMVh6bhPAvii7dq8KkwbZ21VQyiD78Y6DxslUfIQa9m/7vgmNwzFi3siElzkyF+ber4Hwwkelx+9/xPyppoGChHoYeWWgxej4sGZBEZkIXwyGnW26kepvyO0auLvhjIe1uUwg0yQU2thK3XMYnCbIOJJh1ZpDaLqKpbwHC3PAxBrdPLTgW+CBPc5PCKd9X2foasb3WUqS0/3oF3dHtHF0xg==;31:tZ+LQd49oQYlnkP+Z50ER7d25PJkz++mVgjUHrIKfWkPXQ9RJj4Uk0j74BFQAgrccPF3oZeW6NRVV7hLnFpJJXrT6EE9xSasRv+t96jmwm7zmT7an4+p8J/z5RrUV0v5Jy/aiDKb7ntlMLFhp2F1SrdquDAA+VeZem8aTCZWUp9FmUQHV8IIerIDRydQFx6Na0hfdXq97M/cI64MEQplb/r//eqV/qxSBS22hSzj1N4=
X-MS-TrafficTypeDiagnostic: CO2PR15MB0075:
X-Microsoft-Exchange-Diagnostics: 1;CO2PR15MB0075;20:Gj2GTTyR7X/YxVquxNpfltqL7ULYp8L0/16ZtKAqi/O0kEWQYyRXo2GZvrHRHw1/lCotWcDL/e812Cz8v+05YRKUSX8jzY1uX8fwFoU3Qb4q8ExFuI2kGM1OPYIktazmYTeM9AJXGZxdzasUa5HcfZxhomDZ2lkREf2HjnT5nBU8m9UXzXwmyslt0hrPnyUanfzNXk2kgznpTlgHaCxJmCnx0H941MFqE5ndUPlaMboJ6kyTDPJGjX1vMRVJQRH8bmXqzQvGDiJBrLCZIcvU15wA6+W9TbajA2ZYEL+c085ZVxkaz121cw0ncmcN2Ir4/iFSLWk+EH5ktVBcGW3HeAJA7aUOVSuDAc8r+tQBC/keedijUOgbbLam7mmWixtcwktzYURit9I5DLnm7bE47KmEBMrjygBXZcuwTbqfP4Yc4TRT562CW+C/dNg6dB/6ZwjTnJlMXzov8nm3f1kwVdLyDJtSygMYiVcWh4XxGrSuJgabwamN9FvFrCI7tYNR
X-Microsoft-Antispam-PRVS: <CO2PR15MB0075B08612BA39D9DB971B98D3BE0@CO2PR15MB0075.namprd15.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(72170088055959)(192374486261705)(67672495146484)(21532816269658)(17755550239193);
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(3231221)(11241501184)(944501327)(52105095)(93006095)(93001095)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(20161123560045)(20161123562045)(6072148)(201708071742011);SRVR:CO2PR15MB0075;BCL:0;PCL:0;RULEID:;SRVR:CO2PR15MB0075;
X-Microsoft-Exchange-Diagnostics: 1;CO2PR15MB0075;4:9zGfCj2BhbAmHNICAXFfTPgnFadORi8XoLwjzkJLd8SXEtXpd5cKAiloAlpB1XvR9M+c6xGD2Af9GOi99Xf8cONk3+iVI7HxPuEmnUmEnvwWBkj7UAWVb5AGUUr5rOPy+48ax1aeD1qzyNa7tNckbPK97aWaNdYWm20EQpoXZHbwHWzca8u0n8SAEoCC/TAI77IUUaAh22R5dDRtfNEwZXc9Xc3SPmuPRzbB/3/Wu/z5V325JUv9WKpfYsZo97ZvwgGwHE6E0lcCoMK93nCVmuM4z/58PBqj5Mj5Vx09v84yrgDktQzl8Qe04bIP8gSDJ4GeE6GOaOCDPghbSsbf+dX6zJxdr9pQd7LWE7WSZZcyeEMBQ4xl9bAJpk6h6Dn81gJeUAhoDvmFu7JEFxuINd6eFFQhcNTZEhqIeZJaIGHdXURkDEzPepxydKKpHsglhRpB+OWHl6/2nZSHwcj8rw==
X-Forefront-PRVS: 0638FD5066
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10019020)(39380400002)(39860400002)(376002)(346002)(366004)(396003)(199004)(189003)(65826007)(8676002)(53936002)(230700001)(6246003)(6486002)(2906002)(6512007)(31696002)(11346002)(4326008)(46003)(446003)(31686004)(5890100001)(105586002)(16526019)(97736004)(81156014)(8936002)(106356001)(36756003)(7736002)(67846002)(25786009)(6116002)(478600001)(305945005)(58126008)(5660300001)(316002)(6666003)(81166006)(229853002)(68736007)(59450400001)(23676004)(50466002)(64126003)(476003)(39060400002)(53546011)(47776003)(52396003)(486006)(6506007)(386003)(65956001)(76176011)(2486003)(65806001)(52116002)(52146003)(86362001)(2616005)(54906003)(42262002);DIR:OUT;SFP:1102;SCL:1;SRVR:CO2PR15MB0075;H:iphone-409c2846b52f.dhcp.thefacebook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDTzJQUjE1TUIwMDc1OzIzOitqM1dTVmdTcjZQVG9ncDFWR3p6NGgxRzEy?=
 =?utf-8?B?NzJRZU4rTy9NaStEZFIvR21DaG5PTUNLakVmQmZkcWQ5UG02S1FiWFdPWHhN?=
 =?utf-8?B?RkNSaVZXNy9pbEtycHhwZWF3TE53L1haSlk5cWhZN2Y4SlJ5Z2RkWnMrU1Jn?=
 =?utf-8?B?R0w5VmxXN2FFWUl6L1IxVHFGWDlRWWkwTFVmeXFGWGEyNk1rRjFPWEh5NlRh?=
 =?utf-8?B?Mm1jWVQ5U0N5SnJ1NVZSOWVySzEremJZV3ZJVjlhMUg4YmZublUrSUh1QndV?=
 =?utf-8?B?MGVrRmcwOFlRVnA2SHZTeG1GSEo0bnNLdEUxR3Yzd2praE94QUNyZmgxVnMy?=
 =?utf-8?B?aVArNTQ0ZDB3M2RYSkRwVlB2WlllSVpFc3ZGNGk1enZFbXpPUXRDcG9na1la?=
 =?utf-8?B?eEpRdTU4S1c2S2xHckFsVHRDOTFaT0J2MEI1TVlkVVFuZDBTWjAvbEhNS2pV?=
 =?utf-8?B?QnRwTnhyVWdHOEtRdWl4TDFJL3Z5SW12bmRQYko4bTExREpXeDJNSm53MVFC?=
 =?utf-8?B?Y2llWGFWeU5MOFZwcmNvSjZNaFZndUtGcDJDWWlsMklXeUt1RE5ORURVNjIr?=
 =?utf-8?B?N2I1YjZiU254TzZ3STlXcjduQzU3K3VxZVQrMTZnTEg3SjZSWXpjM2pUZ2VU?=
 =?utf-8?B?d0dSZWZLMkpvdGtvc1VUS1k0SFkzazA1UlE0ekJXTFI1bTF6bUtjS09IcTFq?=
 =?utf-8?B?NWFzbGtZOXk1bXRiWTFvKzIvd0p0b1o1N1RURUcrS0hrNmJUYTA5T0M5VjJV?=
 =?utf-8?B?Qk1lTS9CcU42dHhGWllRWGlUcGRSdmdWU2xwbHZmN3k4R2p1OTR5NWhJbVN2?=
 =?utf-8?B?T2QwaU1kNzJFcjBURDdza0xtb3I5elE1U1BrUGxNTTBNbW4yVWJKNGo1dXNo?=
 =?utf-8?B?bkprNXJiaVRNZ2dVSG03cHJLU0RKcU1kRnM1SWFJU1k0aHp1UTJxYThoMHlu?=
 =?utf-8?B?QWh1THkxTURYSG9BbFhDYlEzbVZKQWR6Y05TYVpNZHlkWmI0aUFpMUc3TkQr?=
 =?utf-8?B?bjdHVmowcXFnVFJpSG5CaUwveHVpNml1TGNJOW1CTGUwVVZQVlhReVdOUWR3?=
 =?utf-8?B?MFJRelozR0k2WHd5UEMyTER4SFlQcWxKSmNiMWw4UE4ycm9ZdHEzTUZqOXhw?=
 =?utf-8?B?d0MzdUI5bzF2aGt5R2JzYkFyZUVmTGVJMTJ4aHZHeWxldm5pTWZ3a21KQ1Yz?=
 =?utf-8?B?Y1FsVjJnRWZDdFJJZm9GZHB3UEFhYlpudFRrUnM4NE9hYWNZU1diY0tjeE9s?=
 =?utf-8?B?NDVoV0hSZmYxWjgrYWJMVm92Zy8ybmJtVkpMSExIbEZhS1NNYXVIelc5Q2FI?=
 =?utf-8?B?c09oMkI1Y0xFdGhEaWp5Z1hVYVh2eEh3bGFjYnhkd2xkZUZ6eHhNNkFzSGNW?=
 =?utf-8?B?VHhDK3VyRnhaSFpLVjhEYWlteERzOSt4eWdrcjV1SUlpcUQ2dWpSTnVMbGNQ?=
 =?utf-8?B?MVNYTGxXN2h1SXhiWEhoV1V5OWlSUENqbitJbDNCcHE2ZnhOWWpRVzVMN3No?=
 =?utf-8?B?S3NxcmtIQUwwVmxZOVdGL1RWOHNhdXl0WnhaM2pkSU1NUUxBeXllNHl3RkFw?=
 =?utf-8?B?L1lwdEpWZ2FXN2VxUHc0eWg5NUNVbmQrWFd0QXRqaW1iUHJUblFhY05YQTQ4?=
 =?utf-8?B?Uld3TVZUVnF3UmhDMWZENUVsVVFPOVM0QUg0SVEwRHFxWDRVeHQvNVZOY2Vv?=
 =?utf-8?B?UHRaMUp3OWloS1R3TlB2NzdvQXBqNzVTemZuYTF0RmdkTFBKSUl1OTUrOTU4?=
 =?utf-8?B?ZzYyZXF1cHE2S0NwWVd1K3FNVzhFMy9yQjBuYnp1d0JHaXZvanFLVkM5MWF4?=
 =?utf-8?B?UFM1WExTZGI1U1RZWFRlSkVkWm5jMVRRdjdNMUV5azlDZFV3Qk5lS0Q4Rng4?=
 =?utf-8?B?Qk04K2tuSW9vOTdCRGNVMDNnRTdVbjFVRDNTanBSTjdzTzBWdDQvMUpmQ3RW?=
 =?utf-8?B?MHYwQzB5M2dydmQ5Z3Bqd0w2cEdkZ0M1UGw3dkpyYXVsRDZUa3FkemVMbVlT?=
 =?utf-8?Q?WCpzzd?=
X-Microsoft-Antispam-Message-Info: sjp/Fgo6zYLynlh8Hn+ccPtnJEvS7yI2LA605zPzT7tufP/TKcRFCEkah9DUxgRkinVkw0bXtFQtEkidnVcGy6pabYDJ35OgslGC/oclZunshuullydR3GTBlmirYU+rDWT0beAjoJrQ6pjxExcEcaCU0M+FaBVKMmUkL/h0BUXeYSb7yomAfmSS8jix5ahu
X-Microsoft-Exchange-Diagnostics: 1;CO2PR15MB0075;6:cAXJYa+OOroY+x0ZDMOaDVr6YJC0evmOShgnRZKZazN1Ket4cbYsNJthrasMawXQOLdaAA/rZhJHLsF3FgZh46RdjrEE1N49BQXee9F9+5khbyr45fQ2N95EUzoo1Z1mGerNPoGrpP476d+roOIs+dASg8DsctJ/LEmsB4121noJpPE9BI9GZ14bzgbpL0iB1R+4YDbEnVMPIUqBBg73RnaRrQcKZ1DwTSSMm7/w7NCggL4DARhhACOPq3L5vta1J/tXGFXz5+aFXGw1Kfexi2Qu2ip8lQMhuRvde2WJJZ8e4G4Kl9AeT0dNm3DiO0z4mafF36DDP7uSUZPUFflus3//B2/gR60yITYS7IKIkYv9gxdTb/5hwJfAUjLNeX6bhciRrY+EW8Eg0PCbZzdg7CRmi52ZuiDzXTYHwygnFh4JdE7fqUyOfe2zdofJ5m4jjSTtAXdiSWj4DDfLKZ0o4g==;5:V+g0IwKEZlG6q2Cx5eR/upKQxt8qh9RtXyYeGLjfb9DMga6XtcmoqgaKAJQh0SH/9or5dppj/qX4/y2Z40jnAYpHOFEy8MWKVw8o03nPfpRVRzn4TA5essHie98iY80rfXK+kbu1/dPT7+FmHXLakymIowakFR9zehR+nWvBVRw=;24:Z6uZkON72176j5Q1VS21RiTb20T0axMybOIgcnYS7+L/dE32rpewLc/jt+COSbzq4kAevh0FzKJyNO1XSeLKmgPKHYiAtwlOlmYItHdtV/o=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1;CO2PR15MB0075;7:r21BRaJhxSlwD6eMHPNJ2nD8Jl5Y2iaPHRkq1VV2WbPOtC1LAlucQwA2amO2rFFL0387WSVDfkMm1ox/m8GPElPtUnaaD3vVefmDgsGdruCfWoKEBBb1GiCRJsrvCF8hbG67KjxG2v8qlrairY0hSg/AinnmV5ZtSUe/iZ0MM5/6fy8wN8GxPREBtPl74E/aJopTyPq3VuTZemmMst5AHj2uk7QeTEbv+E5ilUPg6uqCLzbwhBuYHhZVP3zJ9fz5;20:JvvZZHw607DfTKHhcLMPK7Ahr+8zdCdszkaYgK8q6iTuDqjcu8Dy9oKevZpoIVNvmVSwHm3V7gdUGKH0KZewhISPG2OHXnZx3BZpwzz/DZKXfWjA7VEpq0KGttRdh+VeBiL4Ejg5zOAOgZFnr9chBHOTOaqsZo7VkEtcMjQhObI=
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2018 16:58:27.4319 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26fc55f4-1dc0-4f1c-3008-08d59f04481d
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR15MB0075
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-04-10_06:,,
 signatures=0
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 4/10/18 7:41 AM, Quentin Monnet wrote:
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
> Cc: Lawrence Brakmo <brakmo@fb.com>
> Cc: Yonghong Song <yhs@fb.com>
> Cc: Josef Bacik <jbacik@fb.com>
> Cc: Andrey Ignatov <rdna@fb.com>
> Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>
> ---
>   include/uapi/linux/bpf.h | 184 +++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 184 insertions(+)
> 
> diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
> index 15d9ccafebbe..7343af4196c8 100644
> --- a/include/uapi/linux/bpf.h
> +++ b/include/uapi/linux/bpf.h
> @@ -1208,6 +1208,28 @@ union bpf_attr {
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
> @@ -1255,6 +1277,168 @@ union bpf_attr {
>    * 		performed again.
>    * 	Return
>    * 		0 on success, or a negative error in case of failure.
> + *
> + * int bpf_perf_event_read_value(struct bpf_map *map, u64 flags, struct bpf_perf_event_value *buf, u32 buf_size)
> + * 	Description
> + * 		Read the value of a perf event counter, and store it into *buf*
> + * 		of size *buf_size*. This helper relies on a *map* of type
> + * 		**BPF_MAP_TYPE_PERF_EVENT_ARRAY**. The nature of the perf
> + * 		event counter is selected at the creation of the *map*. The

The nature of the perf event counter is selected when *map* is updated 
with perf_event fd's.

> + * 		*map* is an array whose size is the number of available CPU
> + * 		cores, and each cell contains a value relative to one core. The

It is confusing to mix core/cpu here. Maybe just use perf_event 
convention, always using cpu?

> + * 		value to retrieve is indicated by *flags*, that contains the
> + * 		index of the core to look up, masked with
> + * 		**BPF_F_INDEX_MASK**. Alternatively, *flags* can be set to
> + * 		**BPF_F_CURRENT_CPU** to indicate that the value for the
> + * 		current CPU core should be retrieved.
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
> + *
> + * int bpf_getsockopt(struct bpf_sock_ops_kern *bpf_socket, int level, int optname, char *optval, int optlen)
> + * 	Description
> + * 		Emulate a call to **getsockopt()** on the socket associated to
> + * 		*bpf_socket*, which must be a full socket. The *level* at
> + * 		which the option resides and the name *optname* of the option
> + * 		must be specified, see **getsockopt(2)** for more information.
> + * 		The retrieved value is stored in the structure pointed by
> + * 		*opval* and of length *optlen*.
> + *
> + * 		This helper actually implements a subset of **getsockopt()**.
> + * 		It supports the following *level*\ s:
> + *
> + * 		* **IPPROTO_TCP**, which supports *optname*
> + * 		  **TCP_CONGESTION**.
> + * 		* **IPPROTO_IP**, which supports *optname* **IP_TOS**.
> + * 		* **IPPROTO_IPV6**, which supports *optname* **IPV6_TCLASS**.
> + * 	Return
> + * 		0 on success, or a negative error in case of failure.
> + *
> + * int bpf_override_return(struct pt_reg *regs, u64 rc)
> + * 	Description
> + * 		Used for error injection, this helper uses kprobes to override
> + * 		the return value of the probed function, and to set it to *rc*.
> + * 		The first argument is the context *regs* on which the kprobe
> + * 		works.
> + *
> + * 		This helper works by setting setting the PC (program counter)
> + * 		to an override function which is run in place of the original
> + * 		probed function. This means the probed function is not run at
> + * 		all. The replacement function just returns with the required
> + * 		value.
> + *
> + * 		This helper has security implications, and thus is subject to
> + * 		restrictions. It is only available if the kernel was compiled
> + * 		with the **CONFIG_BPF_KPROBE_OVERRIDE** configuration
> + * 		option, and in this case it only works on functions tagged with
> + * 		**ALLOW_ERROR_INJECTION** in the kernel code.
> + *
> + * 		Also, the helper is only available for the architectures having
> + * 		the CONFIG_FUNCTION_ERROR_INJECTION option. As of this writing,
> + * 		x86 architecture is the only one to support this feature.
> + * 	Return
> + * 		0
> + *
> + * int bpf_sock_ops_cb_flags_set(struct bpf_sock_ops_kern *bpf_sock, int argval)
> + * 	Description
> + * 		Attempt to set the value of the **bpf_sock_ops_cb_flags** field
> + * 		for the full TCP socket associated to *bpf_sock_ops* to
> + * 		*argval*.
> + *
> + * 		The primary use of this field is to determine if there should
> + * 		be calls to eBPF programs of type
> + * 		**BPF_PROG_TYPE_SOCK_OPS** at various points in the TCP
> + * 		code. A program of the same type can change its value, per
> + * 		connection and as necessary, when the connection is
> + * 		established. This field is directly accessible for reading, but
> + * 		this helper must be used for updates in order to return an
> + * 		error if an eBPF program tries to set a callback that is not
> + * 		supported in the current kernel.
> + *
> + * 		The supported callback values that *argval* can combine are:
> + *
> + * 		* **BPF_SOCK_OPS_RTO_CB_FLAG** (retransmission time out)
> + * 		* **BPF_SOCK_OPS_RETRANS_CB_FLAG** (retransmission)
> + * 		* **BPF_SOCK_OPS_STATE_CB_FLAG** (TCP state change)
> + *
> + * 		Here are some examples of where one could call such eBPF
> + * 		program:
> + *
> + * 		* When RTO fires.
> + * 		* When a packet is retransmitted.
> + * 		* When the connection terminates.
> + * 		* When a packet is sent.
> + * 		* When a packet is received.
> + * 	Return
> + * 		Code **-EINVAL** if the socket is not a full TCP socket;
> + * 		otherwise, a positive number containing the bits that could not
> + * 		be set is returned (which comes down to 0 if all bits were set
> + * 		as required).
> + *
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
> + * 	Return
> + * 		0 on success, or a negative error in case of failure.
>    */
>   #define __BPF_FUNC_MAPPER(FN)		\
>   	FN(unspec),			\
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 98E947D071
	for <lwn-linux-doc@archive.lwn.net>; Tue, 31 Jul 2018 14:02:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729762AbeGaPmc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 31 Jul 2018 11:42:32 -0400
Received: from mail-eopbgr20081.outbound.protection.outlook.com ([40.107.2.81]:31552
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732173AbeGaPmb (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 31 Jul 2018 11:42:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mreGh27/qk/ifpOr8jx3729VKSnAtd9uISlRfsbEJNk=;
 b=mibpdsawuo3AqOpEwpU2vXLkOypLGcF1XvtmqMnncaZWISAq+93PE7jaxUPRXGPID2fLfifdBKAf+8kLhaoBBMfu7pmRr8/svlT6qNxYM9d0zikUFPycqHnu9SJVRB1hy8pDgmJOTOhRgxgE5TTVzU26Bpp3bSyNSjcTW19Kktk=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=petrm@mellanox.com; 
Received: from dev-r-vrt-156.mtr.labs.mlnx (37.142.13.130) by
 DB7PR05MB4185.eurprd05.prod.outlook.com (2603:10a6:5:18::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.995.21; Tue, 31 Jul 2018 14:01:56 +0000
From:   Petr Machata <petrm@mellanox.com>
To:     Nikolay Aleksandrov <nikolay@cumulusnetworks.com>
Cc:     netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org, davem@davemloft.net,
        corbet@lwn.net, jiri@mellanox.com, idosch@mellanox.com,
        kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org, shuah@kernel.org,
        dsahern@gmail.com
Subject: Re: [PATCH net-next 1/7] net: ipv4: Control SKB reprioritization after forwarding
In-Reply-To: <5746599c-64b1-f283-cb15-b980605cb704@cumulusnetworks.com>
        (Nikolay Aleksandrov's message of "Tue, 31 Jul 2018 16:50:12 +0300")
References: <cover.1533030830.git.petrm@mellanox.com>
        <56e17ee7750b89ff350735ff7cbaf14c63864586.1533030830.git.petrm@mellanox.com>
        <5746599c-64b1-f283-cb15-b980605cb704@cumulusnetworks.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
Date:   Tue, 31 Jul 2018 17:01:15 +0300
Message-ID: <wihr2jj1p3o.fsf@dev-r-vrt-156.mtr.labs.mlnx>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [37.142.13.130]
X-ClientProxiedBy: DB6PR07CA0015.eurprd07.prod.outlook.com
 (2603:10a6:6:2d::25) To DB7PR05MB4185.eurprd05.prod.outlook.com
 (2603:10a6:5:18::26)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6cdc6c9-569e-42d6-7483-08d5f6ee2e1c
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989117)(5600074)(711020)(4618075)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(2017052603328)(7153060)(7193020);SRVR:DB7PR05MB4185;
X-Microsoft-Exchange-Diagnostics: 1;DB7PR05MB4185;3:AxPalnNTQBmiUG9VcqXqL5brFp1dlfxrZSrK8S8PiwMtUKLfxpE4iUPF7sZ+O8woBGErppAecoFPrOWzFQyQGdqQNGgnw352vJsE1g8S8z62VxR9a8UnOk6AnZz4UTFzqpeYwQeIWA+qi5Mogo/0PCUpuaVBz5Ey/6NXLGUiP0IXhiovvwtMZqevPX6EuU6IhsLlRKqVKNcdyoFa9rKhIpymKMjS9Sf8srwG1Y6lfy9J3b0f3S3dBkebr1Msuqfl;25:usQol/5JWZEDwzHZFyEiuZ7/RUIr5Z8HknaohtljLI+7UYoAYcKPf9DX6Z4fWOKFFM5cH63H9+ciPw4FY8DZWPNqWUqwC0XaOQJX0BlMmGQ/9QQD4IsK6GG2AW7VldQR9NN/mS8GJFr92e01mJsiZseWvwOcMcRphRVclLm+7sE2K/4Uynrcm6uWLtraFxhBa+jdcEFTnB02BRhEPoyiKiwFvrsmnPGyN14wgJMhyCt1kkvY1TYrMtoANX2g2hK82owzK9WxberRxIy7KDj/EWR2XMSCJisAa4xC5kzhhMnP9ebrMziYEyKtNHFH3pkKtW7txiLxTHkexukTrBqhqw==;31:bmlfdaLcrmNXOoFvHkceI2lqagqVkhOJxyaRennqlxHqxXdI7DRDIrowJGfkbJyb6/uMJXPopYtDAt5Obkqv8TWu7/z/lFg5dLlM9khd3BUkua6E4474PHfFUWIB6nX+0rE1Jb5KGTt+PI6n98xJV37jH41z8F7iSKr6Mm/yzD2nldxWmmrq17/vjBGHZdHHyEFksW0xTrJsIyxQfDiiCivWgxGtjONg0tbyEhdiDCg=
X-MS-TrafficTypeDiagnostic: DB7PR05MB4185:
X-Microsoft-Exchange-Diagnostics: 1;DB7PR05MB4185;20:8gSPSym9Ela1VSoaOI2FCIg7qx2EfxqqR/MvvtYAZFZhquOliotjsErDHqc66Ep/04KsS8ac5tiSbUtXq9S8Zk4FF7D2suzOxyKZNVAO7t+sW8Qp3dZx4mTI8OoSnmPNGZlxrV4ijkul7bHXyYyC0YJUuvGn4s1B8rMSIoO35z7SaQs0u7H18LsljW+ze+hYkaSvuGrUZiIQH5S+UUg2/1cy10xw533oKYvJOeQ2qawAWy+FFeJmGNFlYj0FqO5Qwlxt7lUQ5oORjxPo2VHLPkC+B/ltnf1bKLadVzHfXPeZCIbEKWnaWIt3nJROSSx9lhZLowCcOnI7F4U7sd4PMiL7fvOUux9ep5Z4zWH6nrKium/5WA3rgf6YUz1c3WAB2v1RsVGG2PQitzUSCYJ8IssY1Z9vDkKQekmhM7+lynt3e8q8BiO0gYVkndlwb03eEa41EpA2BRvRfZXozPymaYYDhPTvN4++yEwdl+M6uW9FWnpqkYf07WwWSh2xwGyB;4:oqsZTgRV5eSQ9usBxWrv/p1/rYHu4UkrzvPLjsciAGCZitCbgyWUlB5A8zNK0oihOMlQsUTmi7DnSx6f7LxJKUHDMqq6z8i/APpyVKAqez29Q9syjnaQXidx1+7nFgTQkVnK2aBKiBKONjlVy1oZojnaRjy8GqDPvOXOBmW8zpZ/LFWprmpZaDW/AYPTvSashDWn+495NK8yea2DaXHr7IXJnABWFg12QCM6vqBPZD9H67QR/Jwvq6VEAXhEdEqgJUUF4NlbBbPLabEv3+LOIg==
X-Microsoft-Antispam-PRVS: <DB7PR05MB4185D16F76B587CA135E1293DB2E0@DB7PR05MB4185.eurprd05.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(3002001)(3231311)(944501410)(52105095)(10201501046)(6055026)(149027)(150027)(6041310)(20161123558120)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(6072148)(201708071742011)(7699016);SRVR:DB7PR05MB4185;BCL:0;PCL:0;RULEID:;SRVR:DB7PR05MB4185;
X-Forefront-PRVS: 0750463DC9
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(376002)(136003)(366004)(39860400002)(346002)(396003)(189003)(199004)(7416002)(6506007)(9686003)(76176011)(48376002)(386003)(58126008)(16586007)(186003)(8676002)(16526019)(486006)(81156014)(81166006)(106356001)(50466002)(2906002)(105586002)(26005)(6116002)(55016002)(3846002)(4326008)(6666003)(11346002)(5660300001)(478600001)(446003)(6916009)(305945005)(39060400002)(52116002)(25786009)(51416003)(316002)(47776003)(7696005)(7736002)(53936002)(956004)(6246003)(68736007)(229853002)(14444005)(66066001)(575784001)(97736004)(476003)(86362001)(8936002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR05MB4185;H:dev-r-vrt-156.mtr.labs.mlnx;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;DB7PR05MB4185;23:rGVShrVtFL1kXYKjnAuMQuTHySJL0Q1sTHdzYhIjz?=
 =?us-ascii?Q?AV/oyPFMWvMhbXVXt5ScconBncFI9Rgjan0wJgjqXLKaQ8b13P5RvxcQLBCi?=
 =?us-ascii?Q?ottbhRtopIHEBw1W1WNKyH1xEvXjHkW6PFZhP7P5BA04aQ2RVXmyH9oBr3eU?=
 =?us-ascii?Q?vfrWFPIvaHH9TdV+JebXUCRUwc4EEUqg2p9Xe9rUp8u6cJufrP7YMSbgSRyi?=
 =?us-ascii?Q?JPXKkleL8NIswrCXz+lqEu5bwqpofNURMP5q3Gxfi1YEMtOX3eLX70e4SqUQ?=
 =?us-ascii?Q?1s/NYqlKr1R5kghNnUCphvCLbjBs1enX7OFwyRevWv0Fc0t7aLvM8YTFzJkq?=
 =?us-ascii?Q?dHb9MtXuFHQ6+1whSWprtHLW7W7Vf5AKYz0X00R7BGbTmFIuXWLbXs2ErUcx?=
 =?us-ascii?Q?Z/aYHr4ZJ33X3HcOWPurbfO2kIcOFOwgRsFszbwlT9rYMcuyLVA+bBW1yiR3?=
 =?us-ascii?Q?+QDlpzh5khBwJ70nWb/gE3Ag6GmLatA/M7EpE/W+NeM+bgRriS1rYBaacSKS?=
 =?us-ascii?Q?rzq3gpEIfSCWCg9bqwudriMHyXErpXgTjzp/d3y7/KMV+DDB9pMr0MWksxSn?=
 =?us-ascii?Q?3cQeToPNvNqMoLoexboNkWd23jql40HZ++wP10hCXmNIzzcWLdviFY3g5IfK?=
 =?us-ascii?Q?O7LmLLBF0nPDdYLSfppBGGJqM2CDt86KOLs2Tyvr5vt7TKCpenC4bCR0wH79?=
 =?us-ascii?Q?GDETqtqd8yGwYGHAS/cpspUnt/daxYXUsc7JgiqACoR+5ktginAZjv2ZvJQd?=
 =?us-ascii?Q?8sN32h4TWv6uJq0B+JBjXpibxfwPPUUgz0SdO4Pyc8J7DVl/JsYIijKx4owR?=
 =?us-ascii?Q?qFyh/htgy4c2Py15Yq0Lsw5eLS9DdbQCSyEnUX0uh2MgPUcjV8zDGY2rnoc2?=
 =?us-ascii?Q?/ENNQortRDOmw65poY9JlbNmVMEQ4lGW7+g2q1yfKis3A4CKEL61N+IsWGMq?=
 =?us-ascii?Q?sF9bSH3JH7BbvszM83WvDwIfmJiaQxuzlMd8uooM/4NQ0CJqVepRa+vQsabP?=
 =?us-ascii?Q?sWGm3CySXHx2QnnIXRCnb+3/Utg3x/MAGcoRGCEugVE3bg5uwHJ1CJclC2RZ?=
 =?us-ascii?Q?PMu1mPUNTGXee1ZNKdZTdH8lqnC9JryBVcETkKEk8UNpNi+5sf0nt2ghMwnm?=
 =?us-ascii?Q?EQHeeMXu/mfFgsFxJp3kRKWc3kmP2Zw/RKOp267PYNneiJQndzcheaWlR/nG?=
 =?us-ascii?Q?mwgWQpGxQrAMBue0y8Z1WoJ6PxxrDlChei8TF2j9BaXAuXCccQc5+QS9PMwL?=
 =?us-ascii?Q?tDaMUIuzR+CCO9nXsxB5zwdCDdomVpiiIV+cOgF?=
X-Microsoft-Antispam-Message-Info: QHSRwxKwybj0ruD094dSJO5oW5w6P9B23gEFoOskNgzye4agwSsnH8FiZeUWbQpkmcfKGcbMKsRwWZtjbmUaf1c8nCDz9jNC+HOtGTtrOAzuf6jJ2R0J3NjvwqP+6ZauiAb6FIescL5ypvMvR2/aHKaepe6dHkOu6N8rN1wk5onADBY2R7zKeCtrcFK1v+BQpxc4PONARBH1aIhbVE1RCnMPV6h4cmAgg4GrtXA3oWqQPv6+ELmK58xDp5sc0e4lcHCpBpdTTE4b+riASYDpgsyLVmYUmgwPN9dRB8V3vusPhDMncHgIoIdbKuhhRa63i4u2E2r6K4JUEcww5oeF+aNpmfhltLVr5MnaVlql6WQ=
X-Microsoft-Exchange-Diagnostics: 1;DB7PR05MB4185;6:47S3P86O84jqmxfWPQ1oJKdh0wrmuPLQiHNPHLhM69AmSWU0Ww3AJPurdX09E/21ZYdODrV3zg8PDMk32g6P72tNwPX9JjqTU3K1JGQAN54ohVibrncR7Fqqh2QStPactfrOUKHlVpn6bYBVOk+UrvOJM4KDCOE0YPgoHrJO4GiK1sYTAe6g0WlQjLfHFsrltQMt74QgMMOITKA9BQpn2axhjKAWGUh0HXP5FVc13jSn3/75AB1FuC3eFMwKlijpgCQhoqa4bQP+kz0ICUSV1onj3eb5/U28pNnYULdc0Aw6gqnRJ/0QWav+zn1uqF6vkGXkQQqqwIb3/s8e0RMVS+pu/+cSXafUz8SoiwAYk8SDVHfso4hfO++uQNCn6NyiPy/s4A/y0dBBD5F/4nKmYS1O4ZVlO8TMavWVm98H0+gBJlcdjVfwriiN9773nHtkOVvVSmBe0B5RkXWfqCuOkA==;5:B2qRTg5dy/F/o+URqVi9wRs/99atNJQEi7zEEl6TKyHQScmNSjU+lgbzNYgIHXoguAV8M0b5gd6tm0ucbatY+1dPVfydioJYfQ2L/DG1AeybT+5neB1EKFsveSymPSJHFD2FKeDX9COM551qJ8E7gPdANZ1ya1TW7Cr27peNtu8=;7:MMJfgeepI8MK93g9XO+hcWRgSW/+mMUC5ed08/e0SEddKMsckVnIDW0dZ/cWC9xcFmoBFFqZYW0LUDJWnHnZxzWWvB4HN4wTtqcTdfjadAb1ZuiN60MJd2CIdaN7w++cStvoKutxao2Oghi+UXPrZWQi33gPUGx3kx3csIM04dmf+uYMu0fi4ZXlTM0OYtt+g3y/SZ/QKwnB2y/798B7J4/5OkGJuXjcGpUIfYGKI1Z4qPHn0FPp6OukH/O3lpMD
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2018 14:01:56.3097
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6cdc6c9-569e-42d6-7483-08d5f6ee2e1c
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR05MB4185
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Nikolay Aleksandrov <nikolay@cumulusnetworks.com> writes:

>> diff --git a/net/ipv4/af_inet.c b/net/ipv4/af_inet.c
>> index f2a0a3bab6b5..d3cfbd89ca3a 100644
>> --- a/net/ipv4/af_inet.c
>> +++ b/net/ipv4/af_inet.c
>> @@ -1802,6 +1802,7 @@ static __net_init int inet_init_net(struct net *net)
>>  	 * We set them here, in case sysctl is not compiled.
>>  	 */
>>  	net->ipv4.sysctl_ip_default_ttl = IPDEFTTL;
>> +	net->ipv4.sysctl_ip_fwd_update_priority = true;
>
> nit: since this is an int and to keep the code style of inet_init_net()
>      I'd suggest to use 1 instead

OK.

Thanks,
Petr
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

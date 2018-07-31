Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 39B8A7D071
	for <lwn-linux-doc@archive.lwn.net>; Tue, 31 Jul 2018 22:36:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732572AbeHAASh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 31 Jul 2018 20:18:37 -0400
Received: from mail-eopbgr20041.outbound.protection.outlook.com ([40.107.2.41]:51664
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732475AbeHAASh (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 31 Jul 2018 20:18:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ElDUYuzOoCksjwoHhAkHLj/sx9iwuuQxN6UH3oIM+ck=;
 b=cLpvB3NPrx/6GPbrOi13ZtjZwq65LjZHN9jkXQvhz6eg76uf4YDPtGMWE16baW/sl4+vuEiuhiHsbhAVBYyJxwxAKq1ZzFvBNi20jjIbcrqMAR7gv6wETHUjYlbQOAojUp36kquULxGmtmf6KfLunG10GBmaYZ2Ug/zM3TZVcQI=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=petrm@mellanox.com; 
Received: from t540p (89.176.83.59) by VI1PR05MB4191.eurprd05.prod.outlook.com
 (2603:10a6:803:4e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.995.21; Tue, 31 Jul
 2018 22:36:01 +0000
From:   Petr Machata <petrm@mellanox.com>
To:     netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Cc:     davem@davemloft.net, corbet@lwn.net, jiri@mellanox.com,
        idosch@mellanox.com, kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org,
        shuah@kernel.org, nikolay@cumulusnetworks.com, dsahern@gmail.com
Subject: [PATCH net-next v2 0/7] ipv4: Control SKB reprioritization after forwarding
Message-Id: <cover.1533076217.git.petrm@mellanox.com>
Date:   Wed, 01 Aug 2018 00:35:53 +0200
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [89.176.83.59]
X-ClientProxiedBy: AM5PR0602CA0002.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::12) To VI1PR05MB4191.eurprd05.prod.outlook.com
 (2603:10a6:803:4e::17)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f2d9f65-5c10-434b-6817-08d5f735ff17
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:VI1PR05MB4191;
X-Microsoft-Exchange-Diagnostics: 1;VI1PR05MB4191;3:CV8L7gI7fmz9VrgVlAZg2kVWrPYQ1FTDXgQSCf8j3PK6hBI7HzRQovhZYrrDgARsXiTqqAAfquSbjyg57IYi6WKWSFZ1E1ACUn352I/rybAUQH0bJBln1a0jGpqUL8cWzsYgmsFxbgXF5gcie4KqzTnaxWwd5zw3zL7AvR1MeN6wcalbxcoUrX+BV48KP1BjTUUh3HUZD8RY2jGR6aLDN0sUe3ejBBoW692D/+qFi5OTij2YgwhVscb8gFQmcjf8;25:+bTXmAZK7SsIdQ/uFkCTEN12jGdKak7YZ3pwf2Z9Zjf9rCMHWfD8B0giTVFdfRlbEmCSdcpX1mbvVXm37M1fvZ/UI93dVdnS5huwWCzbs5pLYJ87ugre6Xa/qu9CG5269gIkp0/r7dhGGla+G+OvjWggniy1VPE/tc9q1z9CXyvXF8RwY/oMgm/iZQ9qmm2j16G/oibZM12Abd1zZ16XJlJx98YpFBGWFBnc6JbcvyyFMLNX0jBdym5Dm266I4y98jZUKXa/ZhxvIgOJwdCHX92L3zB2Vf4P1vsIOUIixV5br0SabSTx49j5KgXiO2x75MTQ0qLOh5SMZk/3B0r0gA==;31:y7dvkVO+bFoP9+oF1Mto1GXrh8o3LZVMxQaZpJNBsYAMb6Etkff0DQ81Qw8NZahsV6sL3d80lwcyFC7HbcH91SeqnbG9ix38/4baC5pglPFpeVYrbDufkBJ0UqHohs+oE+MjpKOhHYOfhos4jjPEfBnxCioSJBVgfRwPDyzaWdajK6M34cVWzcDXod8rlTs0meG+yqbgmF+3gJa2I1ztmbU5bL0ZjrnbXbfM64B13lE=
X-MS-TrafficTypeDiagnostic: VI1PR05MB4191:
X-Microsoft-Exchange-Diagnostics: 1;VI1PR05MB4191;20:eSDHVYWe1iKF0AZ40wCmm0i49IBnJYdgmozu3W5Dh5y/wRynHmV6+UMdvdcH21RBaE8mCM7irPWDDnn5zqeCMeuEwXO50AK2ebEwEgqxinsV8uucXARmw6XPVPMIyc2JUK990CfHn1YhaKFA0jZSlcI/uFCPC49Z+yl5k+e2xpH0mnK+ysvhLHtUv4W2DM5NpFA+Sy8wNNuBYD1T+J7ngtPe//09GkvlrjfqGrfqfyn/2/DqvOnGh1knqRbK6391YX+dEgVYlp0oo7ko58dHqu/9qs7tDeVi+PmpKyP2VeaZTyXfUTmpD/ZFNWoo/PRJWJpqc3ltI89Cq5BSjtk4XzeIzfElsNs9pJK2T7b7reJFhjYOECgxfMl5yW9F84Q0VEhTEECUU59RQZNQJ1fRtqvrAqLeM2BHZDCiXrfXyZLpVamFKa9RDDePKfnXOpQ0SNYllJ6kggFXbTtDhDPY8ufTZg7E+a1OiCY9AkspEXX/A9N5ldzDGlZrnpwGBjK7;4:VTJDeBfTXhSBIMwcdF0ttMaajfAl9LVaAgW8FJCTiz1dwhmUrdS07WPwP5fcC9zt6fXdHEoW+nuKpT7KRTyle/wGjoDaBmZNPUANGjB3QqSaotIlNeXxaZ3v92xtKpmd1f4UYdZDQi7bDmU3o/RD+CZ2PXBzBEUXYctMIhdFvTQjSEqjSeKqM/TpozOguSgvdP42sYS2OMj9f/IncgQDDBuACpRQJtY1NTYp/t3+b2U+z681q8oAZCdeYxIHRqO7Hpb/yReFJD2YXm6vfNqThg==
X-Microsoft-Antispam-PRVS: <VI1PR05MB4191D28ACA043BF35424179ADB2E0@VI1PR05MB4191.eurprd05.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(3231311)(944501410)(52105095)(3002001)(10201501046)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(6072148)(201708071742011)(7699016);SRVR:VI1PR05MB4191;BCL:0;PCL:0;RULEID:;SRVR:VI1PR05MB4191;
X-Forefront-PRVS: 0750463DC9
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(366004)(346002)(376002)(136003)(396003)(39860400002)(189003)(199004)(36756003)(2906002)(956004)(81166006)(486006)(81156014)(476003)(2616005)(8676002)(39060400002)(305945005)(8936002)(4326008)(6666003)(25786009)(50466002)(48376002)(5660300001)(14444005)(7416002)(66066001)(52116002)(51416003)(478600001)(3846002)(16586007)(26005)(86362001)(6496006)(47776003)(52396003)(186003)(58126008)(6116002)(6486002)(16526019)(53936002)(7736002)(68736007)(105586002)(106356001)(97736004)(316002)(386003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR05MB4191;H:t540p;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;VI1PR05MB4191;23:GGkzwBwT8qQGCXjTdHKKwI4HozDn3fSVRlcyDThNs?=
 =?us-ascii?Q?Zixs4wAuqq3VtDKShJUJdHZ/3/EjIsLjwrqppf1sj+3UWPiSx6IEq2RX7CVl?=
 =?us-ascii?Q?wJwhnUqetG0OAhpMT1q2e8Jx2jkhLRgnoXEFv2pDaUw/qumfYTfek2CyHTTP?=
 =?us-ascii?Q?jGlkJa0I/nPfrmjLqeInFQHysXe+A1Xgwuvu14GXmdegXoseFmV7w5Fcg9II?=
 =?us-ascii?Q?dND8hwWgvp7laYAhfHHQDYnDwDKz6YLaS3tsf5zAAc0k45L6GKWpvbG5G/mf?=
 =?us-ascii?Q?nNalmwxtgvqEUVqd2lmlYCxHRh4nWDH4+/R//oof7l1xkcF+TFUmbQIE/G2s?=
 =?us-ascii?Q?Y+zqFYks0DN05ONGHug4yeqmIZu5UTTRfLDHwoX9ruLyEUEk0rKm2c7V4mu0?=
 =?us-ascii?Q?WIt5TEZdo5Qj28DBCV6o49CJn2uWKHAoR3lPCj04c5lwmvg1vcBKO4GFqkn5?=
 =?us-ascii?Q?adXUWX25yBjhn8WKVLmW2ahzYquYvJHnzCPuzxkG7TJYkmub/6aYW7cVv5bU?=
 =?us-ascii?Q?4ZaLWPf4kNmqeaw65ax5//vNONgY4ec7XrtCxpqTEjKBtgJTfhSqt+rvPFnZ?=
 =?us-ascii?Q?XuccxPNWIvaPx261QCHxrfw72V9zdKyr8fb3f56/myRtTpeK5dhQL1E9Otak?=
 =?us-ascii?Q?QCgrXWzawl69I3PTbA9HmN8eD3/ojOWiSASKjdN/bwUA6+6DwK/1HME4kZGn?=
 =?us-ascii?Q?bcAGmY+XDlxm338L+0ydnY8hHCcdPZ5Hwda0T/5bH7w6XQFO6lW/y3eSkfOi?=
 =?us-ascii?Q?l/4dQ9Xuc2z1ZznikA5JgKF8mqorGrteALGbxtfhS5IAE+Gj4SeXsNwxEuRD?=
 =?us-ascii?Q?/2uDCMiykVsPoC+tETlsfTaq88BbIMIG7Rj0OADExDvc9UUb+RP9epTtGvZA?=
 =?us-ascii?Q?KkteEUcrjCY34fEsARLxlJfOD7VzkG1/qFg3iuqxVRI84Wb7KPSr9z6Bbgth?=
 =?us-ascii?Q?3b8VUrQctWS+E9pJPuO8XjVLOLVMN2cBpmkh60IRt+xBHGNnZq2x0vK+1XJI?=
 =?us-ascii?Q?ObxfXTyH4NGhJieXmojTqmtwQrzWoptsS8eeOWKGQi2dFPElsfVekCPYRJMc?=
 =?us-ascii?Q?EynbuLZwZt1mUg0A+9Fa8bfX88AsqZjtAFahRVxSIdxkL4dotrloQbIjlQQH?=
 =?us-ascii?Q?82LwUj1dqWDDbQjrK6+IZdhPAUsoyxfkHsNdPcG6u/CstFw2pV1pQ=3D=3D?=
X-Microsoft-Antispam-Message-Info: b8OjdiEC9zQQGIbVncf5hgYVymCgQP0Lk6szBbfMTCkk4wisWYYmJrNnmTzPK3EBRW9v/v3FZ4J5j4MQGSQPEr07S1aI+8c3lGbE6ZwnqPWfDAKbOLEAg9NCth09HF6q89OEFs2M+r5b62ae7OKmZtB/4OHOw0mKuRZ4qoUReuqNzFjTOgbGY64f3jxxQbcafdpGgJcdcVnL9ekJlX1xAmun+ememZEyxt2CgQDTnCIo39JvpillHKZO/O5BQLZDMKuXw8QcvjOANa7O/9QBxTurtlmB1WD+1y75YwXbBJgloJGBUD8v7pu1imM1snsxTpQ77Z+V6NanToiGYpZcVUZXeyAhSumE8DeDB8NJmDg=
X-Microsoft-Exchange-Diagnostics: 1;VI1PR05MB4191;6:tOg59gtFVzPtUKphBysWxj2KZVUCiQmprQ41GPzjGUbRS0xHQuW1Wyg4ktUK6DYlIaTbycRFu9affLNdgx52JPW9wFrZtdIBc/OAli2RCds+JMnxvqJiIVvvP7JJlBmFoKuV7Bs62VzzrUVCQSIy//d4E7/6RfH5MtrlZYbsYr+Li7FmQSwINc8W0pEqwUziZG20OxQAJawFKH3Hg+85trheKFUTApueLba1kThg8hKBe5RKmjGcU9yyQqKbC0x26Ks8rkysTzYfunKq70RHVqc7oL0EyeDgXnr0nsqUAavOfXRWt26Sd7bWqeThKB8jxn5bMdtD46IT1jLUxueOFfN33Js4nuaFLRSJvbJ5bsH07gUv/IzOLC5JkY1lcVGTENJaGkuQmMmCECLsn48u4uAZ/rQx9Acjbs0/njle+sbXnz1X4BGQN5948qRVmlvElo294/6+5ahcxg8EVTLsrA==;5:QjgO5rq1B8oduI+CQhi9zl2iUP/pnCqP4FTXrne1qWDsgwEaB4feyxN8b5Y5NuVdnfiHBqdoIk6XJta8xpMvhOK4lm4rgMshq09NZAFV7Qopm+HNLPmtv85OZkHW6/2x1OpA7zJyuRWXdnCJUhjvv13qM+NDywrEHnLNYS4BJ8o=;7:h0DsiklODwVmYB91SDR4/F3lYaQZyllnQuw7ddoTNps5ZeaH2hGQOZXgFHUR0DvUslVWdwNwxR8pxx/G9SkzTQp2v94t8zhlzMSnHv+VAxvIOAvxJ/oYrKi7XSQRkMJ7ogihN8yuC9wXTpJD7lNTM48/+Tj3FUcXjfA2aKwJ3h7tvN6fhgZf3S4gYQfqd3Jwfx+yyXi+I/YQ46GFz7E0/QjXB1tv29y2LJQkXlqLsFLMFtHVa8dJugAutEN+ndTT
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2018 22:36:01.9258
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f2d9f65-5c10-434b-6817-08d5f735ff17
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4191
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

After IPv4 packets are forwarded, the priority of the corresponding SKB
is updated according to the TOS field of IPv4 header. This overrides any
prioritization done earlier by e.g. an skbedit action or ingress-qos-map
defined at a vlan device.

Such overriding may not always be desirable. Even if the packet ends up
being routed, which implies this is an L3 network node, an administrator
may wish to preserve whatever prioritization was done earlier on in the
pipeline.

Therefore this patch set introduces a sysctl that controls this
behavior, net.ipv4.ip_forward_update_priority. It's value is 1 by
default to preserve the current behavior.

All of the above is implemented in patch #1.

Value changes prompt a new NETEVENT_IPV4_FWD_UPDATE_PRIORITY_UPDATE
notification, so that the drivers can hook up whatever logic may depend
on this value. That is implemented in patch #2.

In patches #3 and #4, mlxsw is adapted to recognize the sysctl. On
initialization, the RGCR register that handles router configuration is
set in accordance with the sysctl. The new notification is listened to
and RGCR is reconfigured as necessary.

In patches #5 to #7, a selftest is added to verify that mlxsw reflects
the sysctl value as necessary. The test is expressed in terms of the
recently-introduced ieee_setapp support, and works by observing how DSCP
value gets rewritten depending on packet priority. For this reason, the
test is added to the subdirectory drivers/net/mlxsw. Even though it's
not particularly specific to mlxsw, it's not suitable for running on
soft devices (which don't support the ieee_setapp et.al.).

Changes from v1 to v2:

- In patch #1, init sysctl_ip_fwd_update_priority to 1 instead of true.

Changes from RFC to v1:

- Fix wrong sysctl name in ip-sysctl.txt
- Add notifications
- Add mlxsw support
- Add self test

Petr Machata (7):
  net: ipv4: Control SKB reprioritization after forwarding
  net: ipv4: Notify about changes to ip_forward_update_priority
  mlxsw: spectrum: Extract work-scheduling into a new function
  mlxsw: spectrum_router: Handle sysctl_ip_fwd_update_priority
  selftests: forwarding: Move lldpad waiting to lib.sh
  selftests: forwarding: Move DSCP capture to lib.sh
  selftests: mlxsw: Add test for ip_forward_update_priority

 Documentation/networking/ip-sysctl.txt             |   9 +
 .../net/ethernet/mellanox/mlxsw/spectrum_router.c  |  56 +++--
 include/net/netevent.h                             |   1 +
 include/net/netns/ipv4.h                           |   1 +
 net/ipv4/af_inet.c                                 |   1 +
 net/ipv4/ip_forward.c                              |   3 +-
 net/ipv4/sysctl_net_ipv4.c                         |  26 +++
 .../selftests/drivers/net/mlxsw/qos_dscp_bridge.sh |  65 +-----
 .../selftests/drivers/net/mlxsw/qos_dscp_router.sh | 233 +++++++++++++++++++++
 tools/testing/selftests/net/forwarding/lib.sh      |  63 ++++++
 10 files changed, 379 insertions(+), 79 deletions(-)
 create mode 100755 tools/testing/selftests/drivers/net/mlxsw/qos_dscp_router.sh

-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

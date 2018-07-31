Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 64F697D085
	for <lwn-linux-doc@archive.lwn.net>; Tue, 31 Jul 2018 09:56:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731210AbeGaLfk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 31 Jul 2018 07:35:40 -0400
Received: from mail-eopbgr70053.outbound.protection.outlook.com ([40.107.7.53]:62086
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729784AbeGaLfj (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 31 Jul 2018 07:35:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uyKkYxjDFHm0NC2oEEQY860kIEABbofBN4vR8Zl+fFQ=;
 b=rafBVwvRvQyETQKTuuOh1Au26nzpFGcBd5zZA8WnaXqq57CZqxWj3U/mCvM2lL7MnAhS5zrk3SEGOTb/1O7gGGuLXhyfJiYuDs8JwhNI6fkz3hE8NsgoOGMyLaDSO+Qw3f1nLZJXTqmB2QZE+yU3rPY/GOpogpUv2yaL2iS6LUU=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=petrm@mellanox.com; 
Received: from t540p (78.45.160.211) by
 AM6PR05MB4184.eurprd05.prod.outlook.com (2603:10a6:209:40::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1017.14; Tue, 31 Jul 2018 09:56:02 +0000
From:   Petr Machata <petrm@mellanox.com>
To:     netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Cc:     davem@davemloft.net, corbet@lwn.net, jiri@mellanox.com,
        idosch@mellanox.com, kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org,
        shuah@kernel.org, nikolay@cumulusnetworks.com, dsahern@gmail.com
Subject: [PATCH net-next 0/7] ipv4: Control SKB reprioritization after forwarding
Message-Id: <cover.1533030830.git.petrm@mellanox.com>
Date:   Tue, 31 Jul 2018 11:55:57 +0200
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [78.45.160.211]
X-ClientProxiedBy: VI1PR04CA0093.eurprd04.prod.outlook.com
 (2603:10a6:803:64::28) To AM6PR05MB4184.eurprd05.prod.outlook.com
 (2603:10a6:209:40::29)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a5d3ff5-a841-43c0-9c07-08d5f6cbd395
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989117)(5600074)(711020)(4618075)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(2017052603328)(7153060)(7193020);SRVR:AM6PR05MB4184;
X-Microsoft-Exchange-Diagnostics: 1;AM6PR05MB4184;3:65GDyYZqZ7UzbZWTv7/EvbQv9vZ/N4RDSajEnzn9JNkYxkh6Ozq1pRezKyNWvfSWkswtmjTOrYAg8gXGB+1coKr3EiKAOVlHtmFh5mfZYsDZCg6Cy21Ic6zGQ+b5DSQBoxrz1d2ZBXrO8zrHc+n/uS0v1BYUhk77hhlEzaiCazhmi8lm+uYDVDz6OACRhOBP1WQOz9utI5jpINDBmXauElR6KeFOjsRzCvbYc4qnng2/pNGStQDUQ2L1T3NsWHA2;25:if0J/BII4THb5We+kYDZgwsHzK6Nne0QqO+AG61wx4RLgcVE1ecBlgV2L0GW5uM7it9o6uw9Q9Lukoi0cUZ/da5ttraMsCZ6cOCtinXJXFzMNRt9lkBA1cgmsigyBHcNk7UfXiMyvZFuhcSzKePackVVXMW91PoXBL4xTh6CFl9vBcRdLiZcNM597cIMdoXxvARJbSqsc3hDqLhCwAtThlS7UnSJJSl5Z6lvUDCjkeyYz2rTfO/E908Lq9Y04NgT3v0E10v2GYlP5oYWG+QxeniaRrHVavygLirIBBWyKbrUHLk47HcbCGjR8BbuMjLexI7BhLSAQgfibaSJMXDWEw==;31:YJG4+lbycRnv73dms88zWda8VBrQRqDLKvB9HVrlKdrVggjpLL+59IX+/9wR8e16LdUlWcdrycb8JzdQdfR0IBeBshYp+9jRUwMAwWgkT5z0GQOOv7zIdWg7cZUb6PE5kWLzlG8b1wCKgmp8/JbI/PNpodJ8dt+J0NGlWce2lRmirG8qVA9Ovb6MuYhmhddU4cyQKkGqNQtB/TF1c061iZrT0vUPMA9wBJo/wC5m0yo=
X-MS-TrafficTypeDiagnostic: AM6PR05MB4184:
X-Microsoft-Exchange-Diagnostics: 1;AM6PR05MB4184;20:cecWEFucam0wpdY3EgOpNY1OgRDg9/xFnC+kDuY7uJXspye+s3cQU5sNA2FHF100RNeMpZhl8hiCSqllZp7CDseJfATA/8k8dmoJyVPh7W0TNHcsU9/3OB+QohtLUzFjByac7THonu4oT7SRrYvy+LZ93IIoXMVF6Rei6Y46ZLWaoWuGlUcl7QpNdr0WCA9j728RdptoLZGNxbbDmPk0sU2iil1S7Svd+VACbA12B/0YIyN8pL2ZReRN+Lb83bi0VVABS8tuWa82ExxLNjLxSAEyIEYp2u9VG1T2YeVQnK+Plbny3byoVjLVenEcQmnU5Uv+oURHnpaYfikfs2X98x8ch8I/MlHkB9eBe3Iwm0HreoKjyyDzPQu3/I7OCjwFF2al+JXr7eY8kfndiAkE2Jv5IoB/PBx86N6jUnySluOC85/gMPpIC7ezIpu7t53a8GL1cWuE35Nt2Mfk0xRxMA//HAx8pDMrgHnHXcO/0nQe5TzO1n2JEV/lsDeAcm/G;4:E0XpuSlC534/VHLPpVAjJNzyZ3+gKbFhqrxjpqKxt9Ki5fps7M3cj7oIr2dmr8MLzBBQYHNKAkZytFTMau8p6hCT/wAg9au6uJiniFiW7RDLdzlYiDmjxQ5d/Wvu4oXccioMhaeYStwjVp3oF6mbSXearfw3zqGinrRElSdTAPfsj77F4gJzw3gzGFxRnKwOLzzrxmonmmn3g6gGpeBL8tflXYdcfvC9J21jyTITzBZuRCZ4OODO83WvjGC71OFYSX+NiB4gS+bbLLdqtBgJ4g==
X-Microsoft-Antispam-PRVS: <AM6PR05MB4184B9E40A5525C71F7F8B0DDB2E0@AM6PR05MB4184.eurprd05.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(10201501046)(93006095)(93001095)(3231311)(944501410)(52105095)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(6072148)(201708071742011)(7699016);SRVR:AM6PR05MB4184;BCL:0;PCL:0;RULEID:;SRVR:AM6PR05MB4184;
X-Forefront-PRVS: 0750463DC9
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(39860400002)(366004)(376002)(396003)(136003)(346002)(199004)(189003)(7416002)(58126008)(39060400002)(50466002)(305945005)(25786009)(478600001)(97736004)(48376002)(7736002)(3846002)(47776003)(26005)(476003)(6116002)(2616005)(956004)(4326008)(6496006)(66066001)(386003)(51416003)(52116002)(16586007)(316002)(16526019)(486006)(6666003)(106356001)(105586002)(186003)(36756003)(86362001)(81166006)(81156014)(14444005)(53936002)(8676002)(2906002)(8936002)(68736007)(5660300001)(6486002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR05MB4184;H:t540p;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;AM6PR05MB4184;23:NUWQU3qgmUIpQax0hoF8PDJ77EbK1die7ZS3nrOTi?=
 =?us-ascii?Q?V5YBAKKZ99DUQ9gva8NCdJkoEUEnnFoftNHvrQakSkIsfIBvoL4Q/bYdqz81?=
 =?us-ascii?Q?OAbmpaqJ+ykLwB6iKeGZLyWk4krsZKuYR2y2dmCHy66yFgGIQVBeotL4/YDh?=
 =?us-ascii?Q?0ijyWidz5MzQGDfvzDZwsjRuG0Pe0t2i/hLhQUdtgb2PIrVuvGkkXM/OqoGF?=
 =?us-ascii?Q?owEtunhejtnh11oITlT1cSahrC8uQkNADWOVrGTmw/o6EuR8/OfhgIINR/mA?=
 =?us-ascii?Q?jNI476u5lnQY6i5ENc8CWl87SyuUYBAdgyn9y/b4Gmjc2t1POQ2Ml5Hh+oE9?=
 =?us-ascii?Q?mADSPJn+EvRhEPX+q9AX3tkTQpp7DKRNG8jMLehMuv3Zpl1tHxwpmI2xUvrJ?=
 =?us-ascii?Q?/CcGG9ZIB5vzh8syvRxdiSXo6zos6YFKuUHINItfXepeZDM99Uzdxfu/wwgT?=
 =?us-ascii?Q?Zhx96eF8ah3qMRx7gDvH2U3Gvrv0yHLSYvPPhlaKSuWwBp2h3oFng7lvaeBR?=
 =?us-ascii?Q?NO8svNLOvRQyr+8/YiH0/5fMRUEtlipUY4Xgn2+BhuRfZHZTArY0hUTq/i0K?=
 =?us-ascii?Q?au5KcKLOVISIBQdM79aciH3k2SnvOv76IThwRFBaUnGIaxhE2hH0HuUHZ7dO?=
 =?us-ascii?Q?2o5QON/pgjHKty16Gj1OQmILiCXeWc7IGynYu7Usc0+10j7SepqujmkgdNHa?=
 =?us-ascii?Q?P9BOwCf19rUEbWQmzOLI1nEBLAxKjEIWZG1v7jW6WGVIQZ4RuKceT2liPuL5?=
 =?us-ascii?Q?dESCHNr7tUGGFoWOFP6qDZwrS5wIwThKRAr3fm6Erkp/JbBEm24HI6XHZmNe?=
 =?us-ascii?Q?PP0QMoXHTZnykdYHDisv2b4rWhxFImWDENX12s6WgrHsyJ4gTAlkwmO2jVAZ?=
 =?us-ascii?Q?P6aCWAbm8qCc8RcTIv4TvJwsDOcv3TNZ+AkWoIFyWE7apcJIV9HOzIAkbukZ?=
 =?us-ascii?Q?6uLxoKA5Okk/Hr+EsSc5/udT/6syzLSc2ZtWEWTGU/ZzcfLsKs5naZ4pWkuJ?=
 =?us-ascii?Q?hs62t8cH3ustoJC9dMcwNiTMvHx8vcxdJDtJh6WcYSNE/WqSRnfnMXITCnDu?=
 =?us-ascii?Q?UGxGkBJVa+hnKyEckQ5HYFiqPOFklmVuBYaxpDGwz7drZVqu7g93rUmXTmha?=
 =?us-ascii?Q?d8uu2xCJkpXuZjBu0hKhSfaOJNAzaQt?=
X-Microsoft-Antispam-Message-Info: qbseb5A8u89sFHkRGAcPABMOT9K4xYY9/0SfWyFeRksVYhk8CbsMQmAut0I+JrYnRh/t0wWQl8uNfQUTgU++XWVeFssZowwsR4JUZlJwaUAazcJo8pGrgApmVhe+0xKpsLnR0Sgc69WHXNXcofZwKkqqGuzdtCSzvZUf/pYrxObJV8ZqpFkcTYhoQTIPCikSfbezB52tY9aPxmCtWGTa8m8Ffag3WqVjBUcwbweel/rRsEne4h+U8FxeaaNEJq8qIqcj9iXkV4dAt0bCvGYI1gx1NiOUjZB//L8cqEtrCgleTTgvva2argVFfcT6xS1mUS5YHBsPz5pqN4eXxIyDSVJewXXHej/joDIPESw1uA4=
X-Microsoft-Exchange-Diagnostics: 1;AM6PR05MB4184;6:Wx3vV++rcILtQtPE2sOi8Rt3TPVNvZRlvq2yG8J96JgarrHsWH2TRKcHajqXh7Wv+3koGvpyWEbrWEiE2wyqPxh2Pz2GSWDKPK00/sS3ObYQq2tAqMrrQGXRa+kcNngmDzPHAKVMR3QQxDpgmjwRFgFD6phVpmyXCKFkZ8oew5abO8R45+mY9rfEwWe0WJCqcGTnQhUd9yjDfic83tw4n8rZ3yuKDrj6bArFvaPk6weLJoH346l0uiqoE9yRi4uvDtCIzBG87KheTR4T9R7PYXwOPIAZYEs239kSwCrMDnyoVcUFIWUyTQfwjlj4cACv0HmR5AKDScvox/swnjVXDf8bq19ZMbu5Vu/QSxhofrBEJQQ2U4k5jrP3xu7e2M3snVduyfgHEq3lqXhl174qGJiAYVlOn9hloGh1xNOoIPK0UsMxa4MK+Lf+vuHuKm0MPHploz76d350xgYg0RlpCQ==;5:9KRQ3gaCtRRlhfuyH8PE9DRZtHRurJiXvPkFq1jVaSQS1K3eH3aOBfOqrdoJiXd8XQyWy9x9RtFi7/JycZWM+Wk+k07kSZBCV2KKm+CVfGA6Yndt1dbtM6Tbw55/fE+KMG5kjlNY4wfm3YG8BCS6SxU4lMtI+E17NbY3vy4OrX8=;7:W+ryPUQGitQQxEjI9WDQV7eEBfT10BKOEfMpl6IoZtvnV/6MP9EQaP8XUF+507jVwvUo92DpQOIEiMsopQEfb+4LNa+ucXZu68Wi3ZomlYXMnFUf63dAp0FBroxmIan/p0K9341h3NZlDeOIXLmUhxsokFIQJ6A8sxczJtWX2Oi414DcVX9YN5OjTyHm4lF421LJqKnUurkQH1UIHesWak69JF6T6j5H1w04BqKtX1HDdjCZRjGGI2EXCVKW/Tbj
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2018 09:56:02.6190
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a5d3ff5-a841-43c0-9c07-08d5f6cbd395
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB4184
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

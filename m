Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,LOTS_OF_MONEY,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EE4167D072
	for <lwn-linux-doc@archive.lwn.net>; Tue, 31 Jul 2018 09:56:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731931AbeGaLg1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 31 Jul 2018 07:36:27 -0400
Received: from mail-eopbgr10089.outbound.protection.outlook.com ([40.107.1.89]:33463
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731503AbeGaLg0 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 31 Jul 2018 07:36:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5EN6NKCIp/5HkrnYxZsfnPA6lprStfSxqZHHAgzVX6k=;
 b=kP/kHPKLckbtaQsVDO01zQBnYOdQanbR1cDXZVE5yVlSdVZygzKrty1C8XVKoj6qKsMha1siwomJdO9tp5c3QbxTJrcX1/2l1keflsokMIby6mdiP4kL4mFQ7nZNr8AIsa9ttS+B5wutzsvDatCdhkF1NlWrsn5xEBve6lnc1L0=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=petrm@mellanox.com; 
Received: from t540p (78.45.160.211) by
 AM0PR05MB4179.eurprd05.prod.outlook.com (2603:10a6:208:57::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.995.19; Tue, 31 Jul 2018 09:56:47 +0000
From:   Petr Machata <petrm@mellanox.com>
To:     netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Cc:     davem@davemloft.net, corbet@lwn.net, jiri@mellanox.com,
        idosch@mellanox.com, kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org,
        shuah@kernel.org, nikolay@cumulusnetworks.com, dsahern@gmail.com
Subject: [PATCH net-next 7/7] selftests: mlxsw: Add test for
 ip_forward_update_priority
In-Reply-To: <cover.1533030830.git.petrm@mellanox.com>
References: <cover.1533030830.git.petrm@mellanox.com>
Message-Id: <2b4f5320ed8e520ccde44474bfdaf47ee20dbc94.1533030830.git.petrm@mellanox.com>
Date:   Tue, 31 Jul 2018 11:56:42 +0200
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [78.45.160.211]
X-ClientProxiedBy: VI1P189CA0029.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::42) To AM0PR05MB4179.eurprd05.prod.outlook.com
 (2603:10a6:208:57::28)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7791b7ef-8f7d-4381-ab95-08d5f6cbee4d
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR05MB4179;
X-Microsoft-Exchange-Diagnostics: 1;AM0PR05MB4179;3:F4NnFlrj246lc9i0yi4uMjJM95W3IK5WspBLyeSU5GcSUQFZKDBSoifXsvMhMaqmiMrpK5EVS0Z9qkqDhVSLVMz8zj/it2JB7eNftnsYzygmiXkSG9N4a52uY8K3UeI7F/DKyh/kQAutv6OZwPGisltC8EGVuamFT1fUDCfloxuxxc8n1LlG5szRjYhPCP4+sQPaLXu+IfzhtlBia7ZuPeCHNRqyXdD5KjAXT7eySJ7tQG/v93e0uo6SBy3ImQMQ;25:IGw3/R7wfi40YL4BD/4qIdNhlQ/OM2Bp8yL40irUYOu5zmgMMIiiIB8zqXlWgfG6N2vwZHBMfyXZylH0URLKn9cL/0TfuZQ/CH+N2zBTU6EOXLgdHgh+MpP5dh5LX6NHLb7wlqPjcaaWf5lJN5ge+POD5d+0tupXknYqkxxt57+Z90902amNlPqkycNANS9J3qapXqJvsuzOUn7xRVy0XFQ678AGIBPN57hKc/ta5C77Obt+AQoJiCj8z0PRnAWqjPgkLabWGgt3aSDuJCRCkN5xOEgtx3pBz+/D9IWQPq8/F0MUIXgBSNZ30QQ/nB9sdUER6Mowavpjy3A9s8m5Qw==;31:G5W2naVhLVjENMnJ85yOzNjbnZvGtwww42NEnzK7H+glQ921NnpyOXvhDdfTr73ZLOtRXZCD+OAUVK0Apju6vk8XBQHkXn/yghIKzPO7PRblyHbvgSPMGXv7R5f544/yU1Q2EHE8w9U+0o4kSxk8gSoXf3RLnVi+Al9gKEONkGGlz/pzZW1RxxzjyHGtkKEuTmW28ctxhGOLz3gQ2McTcKH0DFGDAw/Jv88VgigCwTw=
X-MS-TrafficTypeDiagnostic: AM0PR05MB4179:
X-Microsoft-Exchange-Diagnostics: 1;AM0PR05MB4179;20:sTmZzadQpg7sBUPLUU/sXpEwPJblQNZv6Fk25/jJAjzqHX5ljwnrY3ct9gosIiklX85INRo14GP0aonO4pXfqXU81BffLxxTFEZzfX9ii1yYaMCvAty6j1aFSyVLsu2up77RTgtRqkLvhG72tdHMGK5chYbLOg7UG5UR4dISZm/tBwW7mdG4gMLw+TKUyRBH2cQbWLWSD71OmXIwkExl7D+L2H3ItAl9eIKD4Zeep+Bh0QLS/4gRzlJmcaMU6waOllUfeAfQmt7Mgkq/tfdRImTclZg/yZGlxLEJd3GwaFbsG78NKwfWtnZb2NdrOtJEF9j8Uhpuo86W57voCJCttLJ0RdRPXZtpsTGU421Koim07V9GrmxiR2xUeaNeLntkXm9wfUFFFVm+ZxqE6BIFJM62WUuYjVA+d5TKOB0sVJstm4BLxJSPLDHEkSqbcIV6oMnJGSYZkMWdt5KQpzd5IaCsY/kodPJq1mfKmR+DTYwvQ8SHaC71hU2OxGBl5PGb;4:KDqA1Apej2psMFggqLWCX/E4f+V/q6uHCNb5nMtXVQ2h2PpgDrXdw/QcO77aFAG07Oa5KZJmYjqkWPxtK1+sLAEE9J8IX9YnGdZfp6+VSXJvKFOhH8Jw7FUjL3YPEKjIRG0rlNsRyo8j1pWsPG1pT5eEPFWXDsI0+7+4SXD64nqRDYLNTdoYZ6XkfeeSsPfQSS1AXg4LsXsgA+GWGni+fTJ8J3ZQSfPoPz345LL5Pa4RecTKnjHJXGU3ojHF8RjgJj13hILjkM+UUqe42ce/NQ==
X-Microsoft-Antispam-PRVS: <AM0PR05MB41798B114C1D850820D6FD6DDB2E0@AM0PR05MB4179.eurprd05.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231311)(944501410)(52105095)(3002001)(93006095)(93001095)(10201501046)(6055026)(149027)(150027)(6041310)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);SRVR:AM0PR05MB4179;BCL:0;PCL:0;RULEID:;SRVR:AM0PR05MB4179;
X-Forefront-PRVS: 0750463DC9
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(376002)(346002)(396003)(136003)(366004)(39860400002)(189003)(199004)(14444005)(36756003)(4326008)(575784001)(86362001)(2906002)(25786009)(53936002)(50466002)(39060400002)(48376002)(305945005)(7736002)(68736007)(8676002)(8936002)(81156014)(81166006)(6486002)(478600001)(66066001)(47776003)(51416003)(76176011)(52116002)(386003)(3846002)(6116002)(5660300001)(97736004)(6666003)(106356001)(105586002)(118296001)(476003)(58126008)(446003)(2616005)(956004)(7416002)(11346002)(26005)(6496006)(16526019)(316002)(486006)(186003)(16586007);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR05MB4179;H:t540p;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;AM0PR05MB4179;23:/eZtzSTG1B15ntOHoGeTCYCgzBklrDQ538N/d+6pe?=
 =?us-ascii?Q?cSrU84iq7K+DmX4cT7ud6eMRrSZ6lkgluCEtV/bMD5Kjo7H8eN0R/2yQ7ZZu?=
 =?us-ascii?Q?0AuBmfmkMN08uIVEmb7dh+Si5PIJTnqT/c9jlNqF0y7EM4nPMvkwWAN8b13r?=
 =?us-ascii?Q?HSxUzYuyEB6d5q+1AKv7AY71kJR3YJ6VB3tm1hsk7sIgOrl1QcmyYzA2Ra+b?=
 =?us-ascii?Q?4Pzh058gfZLKcC7eXjZ0INj5FPDby79Ptcu3h7uu4xGAundNq6zFYMu4szB2?=
 =?us-ascii?Q?5m3+ye97K5x/sz2UficbTZPUXqN9J+nPwnHAkEOiAgW0VGBvryiwspLwBZU8?=
 =?us-ascii?Q?i/PjAE7EJLjoQqipS4GBAoqmzN7M/7gvXQsjwI81MxA/uO+j6Bg0IElCWhF+?=
 =?us-ascii?Q?an857Rbsv+3pmrwlShHdin11xdH0tlkrm0F8EX7HtUGWhFlmzoNhcu84GYnF?=
 =?us-ascii?Q?Ps1Fw+pkPVTvpccTxZaRCC4gqAph56M6rEsVbAzNC0Faa4jD6a9fxx28I7kd?=
 =?us-ascii?Q?8LAgs4VUGIU60SePuDxtiESN2rujBwkXQIbQxtX8AhuZu8pnCVkNOgzi7fOn?=
 =?us-ascii?Q?u6oDLJ/lkTOLDJytnq9CSEWlaqtrUk7HaVGT4yILv50knL3KtOVW+EBV4bnz?=
 =?us-ascii?Q?SDztGbwKICrq6sNj8zwcpCnKclDQeAqW9TTEwWaZhJHoAnCfThxzHxh2I9Jo?=
 =?us-ascii?Q?jwjucBgNRNYtaeoTfco5hP7MSSyTEswki17LyTbKMPn9R3/rQNvtGcDYHEDc?=
 =?us-ascii?Q?YTB853sMUM2laJOLlm5LAWR/pPFcsLmQv2qelQVLNXaM8CD0YE/4FCP9EkK8?=
 =?us-ascii?Q?Yb0YlPNBe9nVJLThANk2tEeCwJtKfnsQhxvg9GwNsP/aXpY7AfKvHBmiUTuv?=
 =?us-ascii?Q?NcUrrpXHvY6jNEhJYNM2g8oVe9PfyHR0hjDxpdYcrR7jMjHCbjPZ7hbNIGNX?=
 =?us-ascii?Q?/kvgTazrAx3IdPd5zxfOQzU6jCPT2T1LZBFVgwagGwXlNMayr2gjxHxu+gUi?=
 =?us-ascii?Q?iFtCq+zPX6wPKDiwlj+GABtjXrXj54GC3zbc1PyIxMxIS/1cyQkXbXzptZrG?=
 =?us-ascii?Q?JLV05X7S4uS54iBdaRyyhamD3qwMAjISSOuG7m/s8mkbOYN4BZjM2UoLGczf?=
 =?us-ascii?Q?21Cet/PY6GNBBqrvbeD3EJpUjOltwo7Bj3Q4JUTuduCA4MNqFqZFadTjOy64?=
 =?us-ascii?Q?IHAH+MCTpFZiEeBZ8PrTyzLqxAmeTGiit5flGXQk+8MKye+ZuHgNO4eHitFv?=
 =?us-ascii?Q?11eVUoie5eg677TcPs=3D?=
X-Microsoft-Antispam-Message-Info: CDxT7ZcneZdze772qxqtchDCLvGHSA28Jrt9o4yxacaGLkZalXUF8P1FP4AXE6xYkD80k8elPonUKRN5km/0LDQCJMs+w51qXSFbUKrLI/pUcS4GKxekiPXz3pvVQmNcpprVFJOn+KK03GM47o1ixfjBpfCumHtVOyL+CwbBqFcy8o9fdMq2NpqMLUNpafoKgaWlgz6O4W5D73D18tHs/eqGSdaESQIX4X6E7JgZlnSgrTOwrq8P2nb4+uBJj6c7rpy7vu8UyD6nrNhXQaWJ2086hx31tOTgoXzEzZIau9irdLONqIadxAsAc8W4ONMRtiM4kuZIpcnfdsyT+mxgFsGbY5wIpPH/zZC7h5U0n6o=
X-Microsoft-Exchange-Diagnostics: 1;AM0PR05MB4179;6:GcKzJAG4b8tFxH8K9RjVJxVaCTy5aQYEwpUKvgh/gjq6T2v3MT0eDcxhdIFQMf0wEe5HScf0zbXO2jvE4PMiheHrX+5mvYXRSxJM9tbG/WLbLwf42WE+tRgnP7bEhg3JFS9Xt/I5PXVL5cabKzPkgiQRcdwECovSMh1P3ck7UuETinkQ7Usf/YqqoGDrKWwhhPuytmsITnyu2irRXbitlEgzpZTtZJizUECqu99AeHI0e7AJZZMZ77y/rNB4GLhVzrCNs+KPP/gU7gh38eev5qw/y0PFn1VlZDxZ+9iY4PQHu2HDqoJ09ysruKFhdPUd5/6hyBAmz2KPLBOxhHsHQOzP7jYsSw9YpRABQmScTyeACdq59PWamVizgpOM29rZCnqaCvkizzdK1wGxg+WmyF7AywRWlILF1n6EbuBrmryIPp1JkC3tZtchBvMxnsc8/pxVMn9Na1uMUWm0o+s8mw==;5:XT/no5qYueOSlYspdzH0P0uWd+mzE6wlPP1U5oP602wVSbIu5i8kbslwOfE+/ZASMZzTB7n62s7EDANkS/Ci3vyHSNF3LV85C5TfWCBhA6kw4ibiaV8IgjZnXoiaKFHBV7E9nuxAikdzg58n0ndsE91XEJBXdBjvg5UurbqtEP4=;7:SnCWRFFghtb9nu5ej47Jo9dlrOnvsEOhG1Yph/xLmDR1reVl7cEjhg4EN9u8lzcgchb3rWlVUI4EJGA87V0HZUpSPVn/n6u3Q0q1QboeYCnYEnku15YUaKddaNTANnd/Dl592/MY0esHWBWABiWI1n/ZK9yuqvkm1zJLpBXfWvL4rPHum8tBd+iU5QEq5NVLQW4eihI2bUE2CYyV8UGkA1J/qI0idc6X92st9Nc77xX0tzDzuJNrEWPVFF7H3T2D
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2018 09:56:47.3240
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7791b7ef-8f7d-4381-ab95-08d5f6cbee4d
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR05MB4179
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Verify that with that sysctl turned off, DSCP prioritization and rewrite
works the same way as in qos_dscp_bridge test. However when the sysctl
is charged, there should be a reprioritization after routing stage,
which will be observed by a different DSCP rewrite on egress.

Signed-off-by: Petr Machata <petrm@mellanox.com>
Reviewed-by: Ido Schimmel <idosch@mellanox.com>
---
 .../selftests/drivers/net/mlxsw/qos_dscp_router.sh | 233 +++++++++++++++++++++
 1 file changed, 233 insertions(+)
 create mode 100755 tools/testing/selftests/drivers/net/mlxsw/qos_dscp_router.sh

diff --git a/tools/testing/selftests/drivers/net/mlxsw/qos_dscp_router.sh b/tools/testing/selftests/drivers/net/mlxsw/qos_dscp_router.sh
new file mode 100755
index 000000000000..281d90766e12
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/mlxsw/qos_dscp_router.sh
@@ -0,0 +1,233 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+# Test for DSCP prioritization in the router.
+#
+# With ip_forward_update_priority disabled, the packets are expected to keep
+# their DSCP (which in this test uses only values 0..7) intact as they are
+# forwarded by the switch. That is verified at $h2. ICMP responses are formed
+# with the same DSCP as the requests, and likewise pass through the switch
+# intact, which is verified at $h1.
+#
+# With ip_forward_update_priority enabled, router reprioritizes the packets
+# according to the table in reprioritize(). Thus, say, DSCP 7 maps to priority
+# 4, which on egress maps back to DSCP 4. The response packet then gets
+# reprioritized to 6, getting DSCP 6 on egress.
+#
+# +----------------------+                             +----------------------+
+# | H1                   |                             |                   H2 |
+# |    + $h1             |                             |            $h2 +     |
+# |    | 192.0.2.1/28    |                             |  192.0.2.18/28 |     |
+# +----|-----------------+                             +----------------|-----+
+#      |                                                                |
+# +----|----------------------------------------------------------------|-----+
+# | SW |                                                                |     |
+# |    + $swp1                                                    $swp2 +     |
+# |      192.0.2.2/28                                     192.0.2.17/28       |
+# |      APP=0,5,0 .. 7,5,7                          APP=0,5,0 .. 7,5,7       |
+# +---------------------------------------------------------------------------+
+
+ALL_TESTS="
+	ping_ipv4
+	test_update
+	test_no_update
+"
+
+lib_dir=$(dirname $0)/../../../net/forwarding
+
+NUM_NETIFS=4
+source $lib_dir/lib.sh
+
+reprioritize()
+{
+	local in=$1; shift
+
+	# This is based on rt_tos2priority in include/net/route.h. Assuming 1:1
+	# mapping between priorities and TOS, it yields a new priority for a
+	# packet with ingress priority of $in.
+	local -a reprio=(0 0 2 2 6 6 4 4)
+
+	echo ${reprio[$in]}
+}
+
+h1_create()
+{
+	local dscp;
+
+	simple_if_init $h1 192.0.2.1/28
+	tc qdisc add dev $h1 clsact
+	dscp_capture_install $h1 0
+	ip route add vrf v$h1 192.0.2.16/28 via 192.0.2.2
+}
+
+h1_destroy()
+{
+	ip route del vrf v$h1 192.0.2.16/28 via 192.0.2.2
+	dscp_capture_uninstall $h1 0
+	tc qdisc del dev $h1 clsact
+	simple_if_fini $h1 192.0.2.1/28
+}
+
+h2_create()
+{
+	simple_if_init $h2 192.0.2.18/28
+	tc qdisc add dev $h2 clsact
+	dscp_capture_install $h2 0
+	ip route add vrf v$h2 192.0.2.0/28 via 192.0.2.17
+}
+
+h2_destroy()
+{
+	ip route del vrf v$h2 192.0.2.0/28 via 192.0.2.17
+	dscp_capture_uninstall $h2 0
+	tc qdisc del dev $h2 clsact
+	simple_if_fini $h2 192.0.2.18/28
+}
+
+dscp_map()
+{
+	local base=$1; shift
+
+	for prio in {0..7}; do
+		echo app=$prio,5,$((base + prio))
+	done
+}
+
+switch_create()
+{
+	simple_if_init $swp1 192.0.2.2/28
+	__simple_if_init $swp2 v$swp1 192.0.2.17/28
+
+	lldptool -T -i $swp1 -V APP $(dscp_map 0) >/dev/null
+	lldptool -T -i $swp2 -V APP $(dscp_map 0) >/dev/null
+	lldpad_app_wait_set $swp1
+	lldpad_app_wait_set $swp2
+}
+
+switch_destroy()
+{
+	lldptool -T -i $swp2 -V APP -d $(dscp_map 0) >/dev/null
+	lldptool -T -i $swp1 -V APP -d $(dscp_map 0) >/dev/null
+	lldpad_app_wait_del
+
+	__simple_if_fini $swp2 192.0.2.17/28
+	simple_if_fini $swp1 192.0.2.2/28
+}
+
+setup_prepare()
+{
+	h1=${NETIFS[p1]}
+	swp1=${NETIFS[p2]}
+
+	swp2=${NETIFS[p3]}
+	h2=${NETIFS[p4]}
+
+	vrf_prepare
+
+	sysctl_set net.ipv4.ip_forward_update_priority 1
+	h1_create
+	h2_create
+	switch_create
+}
+
+cleanup()
+{
+	pre_cleanup
+
+	switch_destroy
+	h2_destroy
+	h1_destroy
+	sysctl_restore net.ipv4.ip_forward_update_priority
+
+	vrf_cleanup
+}
+
+ping_ipv4()
+{
+	ping_test $h1 192.0.2.18
+}
+
+dscp_ping_test()
+{
+	local vrf_name=$1; shift
+	local sip=$1; shift
+	local dip=$1; shift
+	local prio=$1; shift
+	local reprio=$1; shift
+	local dev1=$1; shift
+	local dev2=$1; shift
+
+	local prio2=$($reprio $prio)   # ICMP Request egress prio
+	local prio3=$($reprio $prio2)  # ICMP Response egress prio
+
+	local dscp=$((prio << 2))     # ICMP Request ingress DSCP
+	local dscp2=$((prio2 << 2))   # ICMP Request egress DSCP
+	local dscp3=$((prio3 << 2))   # ICMP Response egress DSCP
+
+	RET=0
+
+	eval "local -A dev1_t0s=($(dscp_fetch_stats $dev1 0))"
+	eval "local -A dev2_t0s=($(dscp_fetch_stats $dev2 0))"
+
+	ip vrf exec $vrf_name \
+	   ${PING} -Q $dscp ${sip:+-I $sip} $dip \
+		   -c 10 -i 0.1 -w 2 &> /dev/null
+
+	eval "local -A dev1_t1s=($(dscp_fetch_stats $dev1 0))"
+	eval "local -A dev2_t1s=($(dscp_fetch_stats $dev2 0))"
+
+	for i in {0..7}; do
+		local dscpi=$((i << 2))
+		local expect2=0
+		local expect3=0
+
+		if ((i == prio2)); then
+			expect2=10
+		fi
+		if ((i == prio3)); then
+			expect3=10
+		fi
+
+		local delta=$((dev2_t1s[$i] - dev2_t0s[$i]))
+		((expect2 == delta))
+		check_err $? "DSCP $dscpi@$dev2: Expected to capture $expect2 packets, got $delta."
+
+		delta=$((dev1_t1s[$i] - dev1_t0s[$i]))
+		((expect3 == delta))
+		check_err $? "DSCP $dscpi@$dev1: Expected to capture $expect3 packets, got $delta."
+	done
+
+	log_test "DSCP rewrite: $dscp-(prio $prio2)-$dscp2-(prio $prio3)-$dscp3"
+}
+
+__test_update()
+{
+	local update=$1; shift
+	local reprio=$1; shift
+
+	sysctl_restore net.ipv4.ip_forward_update_priority
+	sysctl_set net.ipv4.ip_forward_update_priority $update
+
+	for prio in {0..7}; do
+		dscp_ping_test v$h1 192.0.2.1 192.0.2.18 $prio $reprio $h1 $h2
+	done
+}
+
+test_update()
+{
+	__test_update 1 reprioritize
+}
+
+test_no_update()
+{
+	__test_update 0 echo
+}
+
+trap cleanup EXIT
+
+setup_prepare
+setup_wait
+
+tests_run
+
+exit $EXIT_STATUS
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

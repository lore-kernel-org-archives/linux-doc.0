Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,LOTS_OF_MONEY,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C8CBB7D071
	for <lwn-linux-doc@archive.lwn.net>; Tue, 31 Jul 2018 22:39:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732702AbeHAAWK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 31 Jul 2018 20:22:10 -0400
Received: from mail-eopbgr20073.outbound.protection.outlook.com ([40.107.2.73]:18880
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732123AbeHAAWK (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 31 Jul 2018 20:22:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5EN6NKCIp/5HkrnYxZsfnPA6lprStfSxqZHHAgzVX6k=;
 b=O+CauxXwvlFl2oObWMaZxbtBYxk5bRZt93cemYq1iXJBMCkI05hSWFmYBjvBJ+uRTE6bPvUDzhgZ5IL07xvERjYlgzoNOEMpa4YarRJJnZ0Rl5NWxyx2eS2i0DG7lvpbBfwWSMxDudVOgNpNY/H7UTVOREszQeNFfQ9XYuGqV5s=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=petrm@mellanox.com; 
Received: from t540p (89.176.83.59) by VI1PR05MB4191.eurprd05.prod.outlook.com
 (2603:10a6:803:4e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.995.21; Tue, 31 Jul
 2018 22:39:33 +0000
From:   Petr Machata <petrm@mellanox.com>
To:     netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Cc:     davem@davemloft.net, corbet@lwn.net, jiri@mellanox.com,
        idosch@mellanox.com, kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org,
        shuah@kernel.org, nikolay@cumulusnetworks.com, dsahern@gmail.com
Subject: [PATCH net-next v2 7/7] selftests: mlxsw: Add test for
 ip_forward_update_priority
In-Reply-To: <cover.1533076217.git.petrm@mellanox.com>
References: <cover.1533076217.git.petrm@mellanox.com>
Message-Id: <c5637eb0b26da090c740b5adfdbf7cf5359d4a71.1533076217.git.petrm@mellanox.com>
Date:   Wed, 01 Aug 2018 00:39:29 +0200
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [89.176.83.59]
X-ClientProxiedBy: HE1PR0301CA0007.eurprd03.prod.outlook.com
 (2603:10a6:3:76::17) To VI1PR05MB4191.eurprd05.prod.outlook.com
 (2603:10a6:803:4e::17)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b668f25c-df39-4e0f-7407-08d5f7367dad
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:VI1PR05MB4191;
X-Microsoft-Exchange-Diagnostics: 1;VI1PR05MB4191;3:3JUfTcJlvTKOY1csV0qyVgZz5G0ljKG+u0joH/uqDTVsR4nayF0RuqS8PEaaf3OykEZdWi/eBL+Rfs2etORBVzHgpdoS9ZROl5cj3g9JxL9uGasf412G28R+ndhUpUoOE+J0nfRxfKVPsEfD09k5Z4foK8mrs7Q1QB9z5kAdWyp4bNPDqcNbZzYeEmNYcKiF3kRlrg6etQ4NVUiIcqDunUiYVTMsL8H/oGooVJ6O8TvxYA0vknaVd1lqB1/Qdn5G;25:xcG8X7LpM14nGvizfYjuYq0czBgDI59nwlg+IYdUxXu/F/oAUbZMMUZ2vw2KhHEcL6mLI/L1d81LOKNm4DS+KQODTWrYdgfoYixL1OR1ss+fmFkdlkz2pSzexgBxVahaFNTNIeav9PNPaRq1jvqYRJMG4t4uF21fE1yXIzeB/tovmCuVpq2hbT7oXnhBEfeKTiuoMSaeYclT5bnwS0PbDd4obDz+1D1T5kj+DZjcht3oxIoobvazFBnlnrn/7JPGwgG/7FDjCw6nllaQiTX6aeS0EElhur+3+kmSLtnjs3lp3J8R0bk0wD2ZBPURSPIc9GOvaSj2aKXgC5k3gbv/vw==;31:v/IFi8hl0Q2dn/4ZlB3qpCS8BvUtePlkndBTqW7CyQXhkQWlkmn5KbBYPGacNeh7LP6VebPpDRjZFD0Pli0eiknY/kYnvmgVLgA3ERUnLSXComoq5CwyFdRn8myLzhPdOhbSEJu3Mw6AnlN9w4M/XX5Anamiw6/Foqw61ySyAhT/cm3S5ipEot1raQdTyliqeqB9TeuG+Y6UDFT/nVk4NMxc7AiGH7UK7uc4uS4EMtI=
X-MS-TrafficTypeDiagnostic: VI1PR05MB4191:
X-Microsoft-Exchange-Diagnostics: 1;VI1PR05MB4191;20:uQVB52LkCQePEbL9KvaIw47nuTYx1wRqVFnCkdNC5sQE+gB1XkPrAJ1gmMwYg93cHvQEkrr5p595ReMMEVuJHCPXXn02XgoDL1TgaaeQcnD5Jkkee564Yz27Nu8yH3DCWNV8R2uvW5VtNc0SNA5B0gujgnYAcWvG0SYX8kYXSXH51nNwwOiVC+MZjmh02LR0z59WhL9XQpbXefsAZi0Ss41R7bhuhKTssO7qRVf37LnuSgbEjG16yH3z6xBLWGIWrTE1s5dls3iwdJfJxfp1EjBDV5XCcFw9t752xp4ta02GL4XDQwcEGoL+4N19+ePEAoapAIkTA2jdlQ4lfTGgjOwUk+CAGJxlmShIBmKchuZwxyceMe3EY3MV1yqAQFrYK1px7ic+r7a1k8BcPuJDJK1ID5+A+hPn1tBLLpeG5uORmJ1oTEd1fkh+bZoXOJyMTuAl3KjUETCGl+LsLx2Xg/1dtgXQQWPB2bPuJqO6MnYfQGA3iGW5d65e8xaA3524;4:PFWOpnhwzL0ejQBPCKUWWA8pcd8tMOBUi7UOsLeVuQ96ljZc9tvQOkAlhmngenS0b0WpbR//kd4CNvTbnsSfZVxllkYItDEjXl9Fy09iSJjAj9/A+Fy9ll78hV17r0frWAEeuvfmpgWtBXsmUOwTHx2cyiRhiCQDPkh3v+D1AppRGvoe/KZUmSZWmmUut3WTfP3KWclO8wwRfzOfZQATWY1IlMSXfVGYUi2+ubGbjd/aRC1uEaVykpMSYU3Xht1aabsOJUKsQ9/4WsPS8SmBUQ==
X-Microsoft-Antispam-PRVS: <VI1PR05MB41917C473751C8E506155803DB2E0@VI1PR05MB4191.eurprd05.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(3231311)(944501410)(52105095)(93006095)(93001095)(6055026)(149027)(150027)(6041310)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);SRVR:VI1PR05MB4191;BCL:0;PCL:0;RULEID:;SRVR:VI1PR05MB4191;
X-Forefront-PRVS: 0750463DC9
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(366004)(346002)(376002)(136003)(396003)(39860400002)(189003)(199004)(36756003)(2906002)(956004)(81166006)(486006)(81156014)(476003)(2616005)(8676002)(39060400002)(305945005)(8936002)(4326008)(6666003)(25786009)(50466002)(48376002)(118296001)(5660300001)(14444005)(7416002)(66066001)(446003)(52116002)(51416003)(478600001)(3846002)(16586007)(26005)(86362001)(575784001)(6496006)(47776003)(52396003)(186003)(58126008)(6116002)(11346002)(6486002)(16526019)(53936002)(7736002)(76176011)(68736007)(105586002)(106356001)(97736004)(316002)(386003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR05MB4191;H:t540p;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;VI1PR05MB4191;23:d8zy2tl/brU+xNV/oLleIPRDi3z6h2aDZJEeCA0XC?=
 =?us-ascii?Q?A6ij6ylIK15EllgT5JpIdwA4Z4QL5ODBvQ2WjbYYkY9ER5o9LfFSxKcmDxlT?=
 =?us-ascii?Q?yhYd2mFAxliFF3YusHbZpk0y7WmbQM1TrRLTQlFrUVpP2DTXUAunCQiGdNv3?=
 =?us-ascii?Q?lBvoLQB2seoTUQDgGhBJn/kAmf8uB7F8NkKURW0jB1cizjCtH1LmSwyfaVRg?=
 =?us-ascii?Q?lXxppd00ddcZAhjfhgyckw4PVXDeK3RSuZ24PBJvNN7F/Crm3K6oG2oujlRT?=
 =?us-ascii?Q?9pT5g9loRUwQCI/ATxcWbgTwxYJXPZMCEmUaw/kj2YEXRDsn05DBU2Nq0oHC?=
 =?us-ascii?Q?oxRMwpEk1HK5Yy2/z86DWNzmwKrE+VRZDAOpl3vAgKa++uhrBMGXDwrUNNLz?=
 =?us-ascii?Q?SHXpi/w0EMwGdfE/ekgLdjK0zn2bucia8JnzYH23yhpdEjlH4lhnkZse0Zs9?=
 =?us-ascii?Q?+ULGD1hQRW/Y0bjOMlz33S7y20PgQXpY0pyGqNJA6jGcKFtCkNRbC8pOhWo7?=
 =?us-ascii?Q?xJ5kfJRYRhftbA2kMuWH8YQMsWPrMZKs0xVw4ybe5HCheZ28GoUcy7DCC4Lz?=
 =?us-ascii?Q?5lSjHYUiNHYu/mXzSBNzSGZWYJJ8aiD5N+Mxex549eu90stxh0gGeAZSg8H0?=
 =?us-ascii?Q?EL3XZexrJ+M98esuioV0mHHzkMXRHUIjCHwZ3Ifro15wju9Y8FggkKq4o6T0?=
 =?us-ascii?Q?Pv/ZiU/wmL94tZApb9NK4nD9LdPDUp6NMF4xizIcc2Kz8IOGpu1a6VkrRzbH?=
 =?us-ascii?Q?Pja0IzLOm9kRdsLzcc8pqcdM5RvejgWwMo+wxFfJA27EddwZDANSxTz5ps4r?=
 =?us-ascii?Q?uzJPdlhGwiWhuRIg2xdcIWIY7oUsRFqu1MeKVumZnSkOUfWucJOz2gb8tbJ8?=
 =?us-ascii?Q?rpqB2WihESO9y76y5myDvbq/NaE9OLvxV2F79gxGXHgwHkrVye6JlOUfZkJy?=
 =?us-ascii?Q?EFUn+97FuAY1u4dPP/eWv0+xrTNbeZbnYaXjo9wsn94t0J6hmoNBr6/l3hAL?=
 =?us-ascii?Q?Ytex5hgCgC2udORvQd9j/l5KIgLqdmN6Pfih24lCg7jJf7lmSb1ljNmbgIuV?=
 =?us-ascii?Q?1oxL0zbjDkGuQ4is7qPsR+LHmDYq+q3QivDKqzRUQ5FiJEiSHgILiKep03b1?=
 =?us-ascii?Q?bBdyLLrEl07frhhpTNSjQyWKd5eLYd/cgRRNxnw1evjkmHwaViLSUQbA1W9D?=
 =?us-ascii?Q?5oIRA9xxUSfT5F/CVyl9WqmgQskZqZCcEAifPBO9naGb8uPGEltM+GAu+Ml3?=
 =?us-ascii?Q?Exc+8LAMOy+eIveDT+FdcdnFwsCQLANw4qx9wJV?=
X-Microsoft-Antispam-Message-Info: 49A78icFfniJZtiWt8VlXDL7b7IYxKlSzaPXqB3vx8vc1uXZRjxF1OiKglvuoJuh1LG7wurhAXnIkDh8m66guZetkp5nwFIqINlXyjRFgdZiCzr8giqLT7srEnIE5km62IhzoD4WhOlHLTUz14oLtJuImOo7kP/75Ubx2LlDuJLA6BJ6Lzce7iZU3ccnMg8cAHiamgIz1LFvpPbAl4jgFD5ZP7hycf0Mq+XcIEz3ca2VmRaXU0dMix0xgOWVazKBnrOQ1s9h8kokBiYZLCX4j1TxWuLokHsBC60/rSsSWfmYapgijYcLD4b3glBIUSaFNXHAY0H7nMSyYU2yGhJvVpsplHLU3xSMbEGoLeFQgdI=
X-Microsoft-Exchange-Diagnostics: 1;VI1PR05MB4191;6:XnMwOsqifgGBnUveg7D8PeuFwf1H9uqq1feiVxFLUfVPU64Xeaa0Ts0+gh5qxXl83ySp7WHlpgwKU/rp/tL2MTvened0TSam9AyGvLcepsYGkCO6FApMJHnnGBEYe5Xq9WJP5U/PL4UAOC/wE4PjeSc5K48+hM0Va/qS7zI4PEzWEgydhqVBofM/csZEmgaPJjZ9HphTf4wlD3gJYXhnERVxAvrXwgXBH3E7+SqfqiQBkN/zLUUCN8lXBiNBpWMxHYHB82bFHHfkRZiTZfhrYbxvyiMRmbJDSZ66kfUu4YAk6EusgdPp5X1+KDXCXEehvig9EO8aAs1jNqEZyLkdhJy73+SIVv/0rQxfXNf8kaTafs2Eqz93vPOr55t1F2Z0pDBtRn4MWg1P4qo3usqwd9cGYZD7lVNxrRER44exU8Dp0EOdWzlsvsRfbrH6I33pBchgvW18HGfujzpRF4U2gg==;5:jNUG7SM+3Ukn98XquTPde2QEa0a+4dHFP78vcr1f3CzjAF2umnhAya6jpI3bOvYYyf6V7MxKxDaHFxdSAGQ2v2Ped3OiNi2m6R43ByYCe74Xgb4WZEdxx4R5Lds7MT40MYirKRbnqZ6wQy6lx/XjE56LgyEff/xx9mGtgD8Kz5g=;7:dXmrkIqbSFgZeDZbkxc7SrueEwpyFTcPBbFyFVKIwcZqXVQ03iUaWGrXmNjohjLblISQyZ5g3sGhaCVztS/H4uCSsyMDjpss2Nxi2t1m8xmnElMNiHeLF/3cpH8Z9kj3lkynN7tRRtLcn4i5q3ZXPXLwt8hEpg3iZKh/Rk9vrt5xhW6GhTTDuHQ7plAV07P7CzjQTcPqU/B21ivVQMT7jCFjzSSym+F1P2+HTBw73j+yOpq6j9AttLi5mwoEe/tO
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2018 22:39:33.6436
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b668f25c-df39-4e0f-7407-08d5f7367dad
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4191
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

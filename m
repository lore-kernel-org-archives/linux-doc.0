Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0F56E7D071
	for <lwn-linux-doc@archive.lwn.net>; Tue, 31 Jul 2018 22:39:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732725AbeHAAWD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 31 Jul 2018 20:22:03 -0400
Received: from mail-eopbgr20068.outbound.protection.outlook.com ([40.107.2.68]:13680
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732123AbeHAAWD (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 31 Jul 2018 20:22:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fyzJFC/wJuO4flzYHhRaNmXPKfJCqTEMCGD6gcByqb0=;
 b=ibpPmFVp5aWRZp6Y1UnvXwHzqQcZJHifKciAwcAG1ysLX8R4PwbQzi+sQTetg+UEZ2GczkX8UNfH0nM/IbuRwEqlP7iFOykOlVZkmsKanPWoElU1HtgJ2baBB3b+GCwdRA63bO4N17uUjy9IuuPl8BP43L6/pOzydq9QM6Rb/t0=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=petrm@mellanox.com; 
Received: from t540p (89.176.83.59) by VI1PR05MB4191.eurprd05.prod.outlook.com
 (2603:10a6:803:4e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.995.21; Tue, 31 Jul
 2018 22:39:28 +0000
From:   Petr Machata <petrm@mellanox.com>
To:     netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Cc:     davem@davemloft.net, corbet@lwn.net, jiri@mellanox.com,
        idosch@mellanox.com, kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org,
        shuah@kernel.org, nikolay@cumulusnetworks.com, dsahern@gmail.com
Subject: [PATCH net-next v2 6/7] selftests: forwarding: Move DSCP capture to
 lib.sh
In-Reply-To: <cover.1533076217.git.petrm@mellanox.com>
References: <cover.1533076217.git.petrm@mellanox.com>
Message-Id: <e260842f25a7a082315dd42a0531718f306c8a6a.1533076217.git.petrm@mellanox.com>
Date:   Wed, 01 Aug 2018 00:39:25 +0200
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [89.176.83.59]
X-ClientProxiedBy: AM4PR0101CA0071.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::39) To VI1PR05MB4191.eurprd05.prod.outlook.com
 (2603:10a6:803:4e::17)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12c3aabb-c278-418e-b1c5-08d5f7367a49
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:VI1PR05MB4191;
X-Microsoft-Exchange-Diagnostics: 1;VI1PR05MB4191;3:EG5UpHCX38bncR32p/uaLbouFxg1zMTyQkyyaKAmNE2/tr8mG+Qx5AW1DuBG+/WbKK5iUAOkj6opgAtk7B9MeGwNO6JIFWbzPkNNb2TJb4Wbxri+/gD3J43tD9ja9RLwvBuCRy77fIB3oM1bQoc/FsL1V4GYNVQN9pM51Sz1brYNrTLoGY5EghJjwyqJ7ohxamu1axfNtnOdMULqkdmcKzkwk82IrdBvpsVYbhy9I4VwxP1MEep1K1/htDc/47yY;25:ABn66G6F2u7GWkgj1AcGAjD9MFiRPkPmX3Sp4KxxJ9bMzOCyUw1TEszIs1z8XvpQ2pCDgjeHeXPaR9F01cEbgDxIaatTT7WRCAUFeholBZKVnsbc4tvMPLKirOocPxaYwNj0+t7UjM9bGivrZd4YfcvO2AKGqz3KbpgCv3433FdQT7jdmhLxEMCdWBGcpJAN9FPnSQZiN2fPkv/jPfvtly+PHyRV6iTJZ5kqKDfWOepYR5xspWTBn3SSlzRNnbns+tGd6BiVJ4N9+wrnL+NOUZ7B5WKpGJXa1Ubkw9seCxAAUqYiVeUfCm3M7B2S/vYbMdSGuayF87cZY0cg3g2zIQ==;31:gfX/z8CfQCopzysNqR4cH9hreAD6ZFnt45LNATh5qAhzuI/ORi07PHZXQmt11rhZnMNR/hdBKc0io2L1ieqeCPGBjMeON+uY1NDjj+cM92N9vBo5242Z6Rc8woGvmJnH6JaY25hGMyAh8vEmucWHtj0M1FPSKaiYn4ThUFo2KMPMo+zFOK3BWKswAcyqX1ZvtLnkrZfOW/CRAIAfHrnDrQXZmtWvbi+M9Ab0M+mOydQ=
X-MS-TrafficTypeDiagnostic: VI1PR05MB4191:
X-Microsoft-Exchange-Diagnostics: 1;VI1PR05MB4191;20:jLSfvf8mhr5uuQ2OJCMV8zvWoPHAqQ1mGXmNwJcrbYDb8nTzmM+EekldfeGYbDKb/EwDSAMEfuAn2kLpBVw9E/5jU/G84tMr5TAaH5oCQ/Md3Ce7B0E4G9viAmyiqo6wBbnFTsxP6CBhMOmc7YbGja+waxL9e68NmroDZbyHA7lM/wc7myGcK/sn0fIDiYsKq+AxGCQpg7q4tiBRa7tKjK+vmcOkjy15S1bMg6lV1BQLpSPmB11K4dCNo+yMIFGOb5+J3xR1JCFqAvD3xqT/FZ+JZKJaZ+kPsc6xLzd/JpTHj1wq2XTD1go7Hl1dQybUZ4zGpeK8SPJOss8KXBBBbkNH3Lm7kyMRR90HvvNntoFpqJtVw/mT/0ceVjCUmVU68GJLzDMbZNI+nlfPRhfWOSz9UfmVtw4HRksjYjpnjEfrua3OD71MFXX9IGN4NXI9CQ4yb/qzMc3DB9ZjxusuUzbTz50nmHLpyYib6vt+x1YogUpHTX8Lfvf5bJ5RIglS;4:cA5u9DzYu0x/PHqQmMjr4wWmgtG2jNWF7+TZRfbKLu49Fety8URMgu1CGkbNUs1Z6kP5y1e6nDzJw0rJDmKySse4RC1sFf/C7ECI4hL9mXHDwoWSnkVYhIaW6zlw8jYH+ZnIdPIcJn7OhniK3BfZ0OaCbYEwPv5onUNPWsNDwQ2/pqBBdGCy49BOdFXxC9xDncvnR2cp0sidO41rLKXvS6DPBtYufEPDBDq3vJ/1AXGiAD290NdsJO//MLbHLWLuz2YxGAc7mYInbkeaqAU7NA==
X-Microsoft-Antispam-PRVS: <VI1PR05MB41912E4DD7C49FECF972B144DB2E0@VI1PR05MB4191.eurprd05.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(3231311)(944501410)(52105095)(93006095)(93001095)(6055026)(149027)(150027)(6041310)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);SRVR:VI1PR05MB4191;BCL:0;PCL:0;RULEID:;SRVR:VI1PR05MB4191;
X-Forefront-PRVS: 0750463DC9
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(366004)(346002)(376002)(136003)(396003)(39860400002)(189003)(199004)(36756003)(2906002)(956004)(81166006)(486006)(81156014)(476003)(2616005)(8676002)(39060400002)(305945005)(8936002)(4326008)(6666003)(25786009)(50466002)(48376002)(118296001)(5660300001)(14444005)(7416002)(66066001)(446003)(52116002)(51416003)(478600001)(3846002)(16586007)(26005)(86362001)(6496006)(47776003)(52396003)(186003)(58126008)(6116002)(11346002)(6486002)(16526019)(53936002)(7736002)(76176011)(68736007)(105586002)(106356001)(97736004)(316002)(386003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR05MB4191;H:t540p;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;VI1PR05MB4191;23:YkJjNQ9tUlmnMjxQv9TPariwmZHgNNJUNhT9kYckT?=
 =?us-ascii?Q?LtuLkkzxKXXEjiraHIT2xCsw6HRFGiaKUCwMQ1oeh7u9rTP3cARE0dr6EWh+?=
 =?us-ascii?Q?R3Kc1wIOz7E/h17sCp7Q1pooeMDFOABveh+lMWGFbbpqznati3uDYMoqPc6D?=
 =?us-ascii?Q?S4zzZWsXr4nDSjxtreTYViLsCVCGctbofmK/FWyO/Bbtkt/hs9u4Kg6hCxpT?=
 =?us-ascii?Q?yNGlOe4Kdrztg2wjrd6P2CkKJRK/R6cBbzwi6EtlcFH6sWgobDC4ICdhnBVX?=
 =?us-ascii?Q?XCZ82xbHCu0Zxp9z9kMok0IXHMALftNJwDn4dnhUA4YHA3VFjnjMNY5N0ZnR?=
 =?us-ascii?Q?3GVu5arf16uft/AZqTVJ+SaI0ye0ILLcmtHvTMdhvgGyaMAMJTBmqoVF+efo?=
 =?us-ascii?Q?uhWba6lOZP0xErBQ4shRS4jRK1jH2sNsjcRo/GGGjDEO5jveBdfbitasxNps?=
 =?us-ascii?Q?f+JRjKh1IWgj7I+9bPwg9X7ICUqGrAF0ak4H+a4UbNH7E2FzD7pOthwPaH8k?=
 =?us-ascii?Q?l2zhmeohtL0siq33y+N1um1jLlIpdNxktAuSL33hL1MxuUBejmGvaByqvG3D?=
 =?us-ascii?Q?d2LS0PwURLiy5YPehwYXURC1xKsgaFdMsr5IskVftF7TCwdUd/89+Eh1rBbl?=
 =?us-ascii?Q?gx0bvQAyLsfeEDQKc0bHM4YRSUJg6HUyCuoOOmIaPrtYRMuaFeOOPXotDArC?=
 =?us-ascii?Q?bp3hJYKAz7HJN84xnzdzTmDSANgcS8ncXKP0h6Lfj9vcyLxaBPrRgbIeVdeY?=
 =?us-ascii?Q?cEOCDzdVv/L/xsK9DpJ2hQk673CFRPwNk2eicE2TzIbQT+Jzul7ONtB/5ObA?=
 =?us-ascii?Q?9YIKt02+VfdJB1G89DBcvpfOyPvXh6GFjtRZnZ+6IwikWyFdp7Lp+j8TFxBv?=
 =?us-ascii?Q?o9w5ar2qLQijRE4QDzrR6n++mcRsrYtSC794qtSBrl/WHoLYdsmFawhgAqFX?=
 =?us-ascii?Q?+lCcdhHnRkKvIe4zhvf6JXY7GEG8XSaxkyxILmoJN2GuwX9p4FKdg9QtSI/w?=
 =?us-ascii?Q?d+qjah3l8cE/XvxEvDSOzgvIgDozgPgMIthv98iqwEPAa4rl0ldIuE3xD8xG?=
 =?us-ascii?Q?amRq6BnI3UxIjJZhLTFDrx6CV2f+fc7oo9aiNCzyV3Oz0qGAhpnWpJU6dul4?=
 =?us-ascii?Q?sS593XYGsv0nW3VEHFfyzmg9v0GsgA55CnlvsJkSJAqneGwBehiHOH8Bg5wb?=
 =?us-ascii?Q?SNgMOb/DZ3TlpW0ivVDL5jpNir7PbRnfwGDPvmARS1yK51yetMVpaWtfg=3D?=
 =?us-ascii?Q?=3D?=
X-Microsoft-Antispam-Message-Info: sGwNJlb/IhzAKysMzRyW8znlPFWHFjzDnL/xd8I0iQI/fqwnJsjKr60P7O104aL1fRDdZ8eQOoHB6ud1XvnC79KLUGWnN88lizMZJVHQHOmsBihPy1FQR492PPjKQVeVnqIRYjmZILt7lOEvTsXv07mqpNt4mWseqkxKzyAq6YS7AyFYvrB/Rf4xePKfUpMJJR7ghFf35ThLyNcW+p6IavvNs20g3fY2AMDKN9MsfaRLz9PH4FZr4l9ISK+qSvEcfVO8ezXdSRN2qqj//GKGilLYK37a91CcAJtWFRkiufhkiif42W6MX20TgBsqH3OGnK412D7VjUspRQkTR6zkLvAai/zwBu3pr8H1WyDYizk=
X-Microsoft-Exchange-Diagnostics: 1;VI1PR05MB4191;6:quKv0qIlaRS93Y4BYKU4JmLyRARMNpwU94LduismoqcMIfour4yF3BRL8EPOCeK6HJnLNI8aOsil+th0ptgzCRyXeWuo60II95KY+FdIgQrSg96WsPawxZLT+KiFgrf2U4UqXnK4Hy6KhndCNTrIlHqFCrATM3Hnn2JGKuo8EorQUdhtzvCsyH2ZFFfe2oLFoAIflXEL5Zqx+vYChwu5TPDEgr0W8209ELo9LyDFx5WZ/bK3lAF7P6gGfHfc0XSLp7ilI+JROmN3SjCwJ2In96c2FSb96Xbt4tBzrXH+W3tCDSqH5rST5ZotWIbwbVB1/GaQGxHM/R6vYn3Da0zpt4UjNjh6+K4iB6jZt0GQbpw/ID0xhqou8ndwj2xaYy/ZIHwc3+MVW29AOZILn37emTpKPWUZgQO82NAktw6/J4Pj+9p1asSgYrqGFg8E0KWtyAjtTTL/rN9yYWQ9Ben9lw==;5:jTMs+h2UQ0E5x3S0KieAZGjLCaeiz8yUdzo83RCapoe/PIl7ctRRLgl2+acZEFi2zewesSEtZNZKgUjkxMR39NQCHZKNNLQjgBGvHQ+WMxJ76l19/h+L2aYr26x2MtyXdNy5q/t6lJ4SFIh41YDijiXVm7HveJHoSfuhZc0CXUQ=;7:QWoJsH1j9M+WkBP+i5exj5oV4CGw5lCaLfFpP2+zNvuNsDkD1wGesUr2Oye/DnFJawYrgy7nVNYNxdkrmErOkhtRukyx1L2w5gN42j0SpiAPoL+MvWvo5ZDigLTW8c0lGdifkxqgLMp9tflV7Dclk5eOT5vE5gs0WY17AaqZttCJqjhWENQewB9GdRsGFfasSlh32KEZ5dhwyEhPTXFk5orVonNwiUSSJP29oToMya9Doh/Uys9lpKPPCWOndwzD
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2018 22:39:28.6171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12c3aabb-c278-418e-b1c5-08d5f7367a49
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4191
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

dscp_capture_install() and dscp_capture_uninstall() are going to be
useful for a test added by a following patch, move them therefore to
lib.sh together with related helpers.

While doing so, change the rule preference from mere DSCP value to
DSCP+100 in order to support adding captures of packets with DSCP of 0.

Signed-off-by: Petr Machata <petrm@mellanox.com>
Reviewed-by: Ido Schimmel <idosch@mellanox.com>
---
 .../selftests/drivers/net/mlxsw/qos_dscp_bridge.sh | 42 ----------------------
 tools/testing/selftests/net/forwarding/lib.sh      | 42 ++++++++++++++++++++++
 2 files changed, 42 insertions(+), 42 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/mlxsw/qos_dscp_bridge.sh b/tools/testing/selftests/drivers/net/mlxsw/qos_dscp_bridge.sh
index 9e875ee8dc1c..1ca631d5aaba 100755
--- a/tools/testing/selftests/drivers/net/mlxsw/qos_dscp_bridge.sh
+++ b/tools/testing/selftests/drivers/net/mlxsw/qos_dscp_bridge.sh
@@ -34,36 +34,6 @@ lib_dir=$(dirname $0)/../../../net/forwarding
 NUM_NETIFS=4
 source $lib_dir/lib.sh
 
-__dscp_capture_add_del()
-{
-	local add_del=$1; shift
-	local dev=$1; shift
-	local base=$1; shift
-	local dscp;
-
-	for prio in {0..7}; do
-		dscp=$((base + prio))
-		__icmp_capture_add_del $add_del $dscp "" $dev \
-				       "ip_tos $((dscp << 2))"
-	done
-}
-
-dscp_capture_install()
-{
-	local dev=$1; shift
-	local base=$1; shift
-
-	__dscp_capture_add_del add $dev $base
-}
-
-dscp_capture_uninstall()
-{
-	local dev=$1; shift
-	local base=$1; shift
-
-	__dscp_capture_add_del del $dev $base
-}
-
 h1_create()
 {
 	local dscp;
@@ -155,18 +125,6 @@ cleanup()
 	vrf_cleanup
 }
 
-dscp_fetch_stats()
-{
-	local dev=$1; shift
-	local base=$1; shift
-
-	for prio in {0..7}; do
-		local dscp=$((base + prio))
-		local t=$(tc_rule_stats_get $dev $dscp)
-		echo "[$dscp]=$t "
-	done
-}
-
 ping_ipv4()
 {
 	ping_test $h1 192.0.2.2
diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
index 90af5cd23417..ca53b539aa2d 100644
--- a/tools/testing/selftests/net/forwarding/lib.sh
+++ b/tools/testing/selftests/net/forwarding/lib.sh
@@ -653,6 +653,48 @@ vlan_capture_uninstall()
 	__vlan_capture_add_del del 100 "$@"
 }
 
+__dscp_capture_add_del()
+{
+	local add_del=$1; shift
+	local dev=$1; shift
+	local base=$1; shift
+	local dscp;
+
+	for prio in {0..7}; do
+		dscp=$((base + prio))
+		__icmp_capture_add_del $add_del $((dscp + 100)) "" $dev \
+				       "skip_hw ip_tos $((dscp << 2))"
+	done
+}
+
+dscp_capture_install()
+{
+	local dev=$1; shift
+	local base=$1; shift
+
+	__dscp_capture_add_del add $dev $base
+}
+
+dscp_capture_uninstall()
+{
+	local dev=$1; shift
+	local base=$1; shift
+
+	__dscp_capture_add_del del $dev $base
+}
+
+dscp_fetch_stats()
+{
+	local dev=$1; shift
+	local base=$1; shift
+
+	for prio in {0..7}; do
+		local dscp=$((base + prio))
+		local t=$(tc_rule_stats_get $dev $((dscp + 100)))
+		echo "[$dscp]=$t "
+	done
+}
+
 matchall_sink_create()
 {
 	local dev=$1; shift
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

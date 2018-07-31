Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 975FB7D072
	for <lwn-linux-doc@archive.lwn.net>; Tue, 31 Jul 2018 09:56:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731848AbeGaLgS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 31 Jul 2018 07:36:18 -0400
Received: from mail-eopbgr00089.outbound.protection.outlook.com ([40.107.0.89]:55568
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731503AbeGaLgS (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 31 Jul 2018 07:36:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fyzJFC/wJuO4flzYHhRaNmXPKfJCqTEMCGD6gcByqb0=;
 b=Wg5fNvsXoPVm0foKh5VmXtStn+xFsDCsrilIi//pw0LTPfWuimHsiBKJ8RH9q7ZmDZk2S6Ah7HZthng5f8xehJWCuKKYbmqftkAzo2n3fbXYGb3kp9D2EpOtR39+Ls52pDX3B2xBhLVTYgREEN0blYv5cpxGLaBXMnJA8l5+ZXU=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=petrm@mellanox.com; 
Received: from t540p (78.45.160.211) by
 VI1PR05MB4190.eurprd05.prod.outlook.com (2603:10a6:803:4e::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.995.19; Tue, 31 Jul 2018 09:56:41 +0000
From:   Petr Machata <petrm@mellanox.com>
To:     netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Cc:     davem@davemloft.net, corbet@lwn.net, jiri@mellanox.com,
        idosch@mellanox.com, kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org,
        shuah@kernel.org, nikolay@cumulusnetworks.com, dsahern@gmail.com
Subject: [PATCH net-next 6/7] selftests: forwarding: Move DSCP capture to
 lib.sh
In-Reply-To: <cover.1533030830.git.petrm@mellanox.com>
References: <cover.1533030830.git.petrm@mellanox.com>
Message-Id: <b34620eb166408437e74626775eeb99969ad48d9.1533030830.git.petrm@mellanox.com>
Date:   Tue, 31 Jul 2018 11:56:35 +0200
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [78.45.160.211]
X-ClientProxiedBy: AM4PR0101CA0066.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::34) To VI1PR05MB4190.eurprd05.prod.outlook.com
 (2603:10a6:803:4e::16)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2df45db6-fe12-4685-5511-08d5f6cbeab4
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989117)(5600074)(711020)(4618075)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(2017052603328)(7153060)(7193020);SRVR:VI1PR05MB4190;
X-Microsoft-Exchange-Diagnostics: 1;VI1PR05MB4190;3:+atL5wSWocvGLsxVTTQZ81wmK4LEbK5x3Ewp4/9/95KxuKOYsB82HgScuXGx1J07Zj8cBF8LIxrOBsXGXwcWpud3TODRmuMEqfTp2cvGCvrbuvf+XraUBc4QdSCGDB2mmikm9mnqnqNYOv9nVGWCqCyKnFNgggfMnCp0ilLOkK98PSq5d32sElSIszwT/FLb/aI+32UE1YqPXsubefjJWozrhv5q5yaQRMACCopG5F+tIcGqIaRvIn0BLKc5lV5c;25:a9sfuJmoidDRz9RQlCScvwfoj6vZ+qoHrxFyoTrsIe8ZycAJM5nWIZDRSDN1zqA886WHOPmFZgp6Bg77cv8aQs1M6ARMLMPCDH0RO2pkQsJWZOaKEglUaLfrz/tVgRAvZWXpIyz+s2okZWSvS5BprdhVJ5XeeY6PHsKI6bhAFC61v0srujygwXG6TZG6OvQ3dYpaNQ03lXyVoqhtTWPHJFYdBuglsDzNFHR0Fh/lJKH2BvsbpfpBiIRO8MI5cPLypPgDiIWe9k/yZn/GkDB2x/SPSOZQL4d5VHw6F5vBklOlkn/De+WMD6Bt6VJ5E2rHqba0RH0Nwr9mpyg5+KRoTA==;31:gnBLn5IXsif+F8nzxAUL9oC92QN2DlrydR6tf9NJu0z+5iutvz0j56l39mWY9wDr03SHsAyBI6swyxoTvZHJhRIk76psSgGGGYjiSzbcn/sPk4rEqUJ6wOQuV/grI1XEXynqksPciELE+zjj8WOU8Xi6CQP/2Sgtcvp8zMyTyBO69Wg7pNrDejEmE9qAaAE8VDMv8qznSCJV2sYdSXDPskI/AxWc398RW3vJ97V7utg=
X-MS-TrafficTypeDiagnostic: VI1PR05MB4190:
X-Microsoft-Exchange-Diagnostics: 1;VI1PR05MB4190;20:6mvHh95Hgdrm8b/h7qqDVoX22MrXpFgK06h4kBsn/R5Ik0t86tCuEcaYlnNHRLKijFs7yaK6mexDF2fBrvBo5s+GzvEpoIe5/SuF7L/d+f6c02qiwUn9vqa00dLOkpc3hnWyeOpMLYPivevgnGIQaD/++KdCLvSSf29ZpCyRD562vQD51TruzYyb9oaVQbyZles2g2EqNzLDxRDi3Tlo5hyvhf949nBDp/cm7vr+fyeZnjANWd1cwtI+H17rr8Qg0rpYD3gKNq9Jl46yL5ATDHn1qLgVsSQmfwXvHVP/BwvdELICIkUbatlRjRvBi1XnTvc/P1QEn56PW/yLN9FBig2Cq0FxlxsyZqKuAepUv/z/F8X2d1O57URJLATn+fxaLzDv06v5JQROA3qKaGi7OZw1ZitDfyJxM2flZRnFULFuOu8ahyXLrUJ8JWqZmLeHOA0D1pE6/HLV4wBFaBtb8tXtdhkVkEEjaZqjIgnl0PZkXYL2ixc5SGM80ywDNJ5D;4:x5auAKbksHkV5Pjwl82vv9bhskMJOCI41xGcqJxfflusOd8+kD3Hp2iLEWqiF0KTY915aijhs5JhZZH8WtFteg2YfMjK/je8LZeYzsGlTrY6J8ggZYoTUdEesqrVFGhTewAFuGcUN2dX/f+1jJNXK/nY1LY/nehR/qpAN/17/A0YvxgU+tGV6kIj1aGM6qtj+LxTwPOMUs+1Mf77ischuNvlFF3cl46W5aV1XpXw90FjRZo2VEUhqBtD0TvvfXqp8RHhOr+FyVJ59C+ktReZAg==
X-Microsoft-Antispam-PRVS: <VI1PR05MB419014A87891FF032E804C25DB2E0@VI1PR05MB4190.eurprd05.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(3231311)(944501410)(52105095)(93006095)(93001095)(6055026)(149027)(150027)(6041310)(20161123558120)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(6072148)(201708071742011)(7699016);SRVR:VI1PR05MB4190;BCL:0;PCL:0;RULEID:;SRVR:VI1PR05MB4190;
X-Forefront-PRVS: 0750463DC9
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(39860400002)(376002)(396003)(346002)(366004)(136003)(199004)(189003)(446003)(305945005)(486006)(11346002)(118296001)(476003)(97736004)(2616005)(956004)(6496006)(48376002)(50466002)(3846002)(53936002)(478600001)(105586002)(52116002)(76176011)(81166006)(51416003)(8936002)(81156014)(8676002)(7736002)(6666003)(47776003)(106356001)(186003)(5660300001)(66066001)(386003)(68736007)(86362001)(4326008)(6486002)(36756003)(16586007)(7416002)(6116002)(58126008)(25786009)(316002)(14444005)(16526019)(2906002)(26005)(39060400002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR05MB4190;H:t540p;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;VI1PR05MB4190;23:Tghnsa2cjW80vWaNEStq49Jcp1/zc2rEh+Pdcz3mT?=
 =?us-ascii?Q?OXLzh9hmR9u9/3fRERMmuY6R4PXHO1YRHdKOKs0jdGo6By+Rw7jtb3ZFM5ic?=
 =?us-ascii?Q?5n99CYopnRIBIqJEJpky51Gd4c4FJ79Jd510bnBtXvsONxClUT6j0vrZzlr6?=
 =?us-ascii?Q?+HjrkQUFcKsWNt9wyAD7a/iANqboHwO1mlrSYAPWL+fLmrP5qe4vwLuvxCk2?=
 =?us-ascii?Q?JLid/fZvZ5+9v83YaqWbYt+4hTC4gYtIIQPPTS8vB3NuqyejORcZFmpxLvZ+?=
 =?us-ascii?Q?K01SEh+WVyRYm6+M9kflSaqeCibHSsIOB9v1v+vacUEMkocdcyh9BmIWVTdk?=
 =?us-ascii?Q?PYxMelbV2rhhYfgCIwuhkbyQKYzwblqeZ9WKUEpYIF+jJAqztihTeQ8+uNFB?=
 =?us-ascii?Q?SVgge8QRdMcjakKwut4Djd7ViyB6m9tL/brE58Ohspe7MQZUx0FLfjcke7ZB?=
 =?us-ascii?Q?q7dJOUqSXJNhTdDVw3266OGtJC5PQcnjtEsIjOyrsTpM+hEY6DHYUgA+/UHc?=
 =?us-ascii?Q?mmtKEGJg2fPM/fSa0RfRTOtldL4N31ULWfZphxuEx1tmX8u2yG7HEm9CpEKu?=
 =?us-ascii?Q?Q0Jo0YlrJ8ExEzO4+JRQWaqRbNQHQLQZdJUZ2qM++DGLTRAYtqKQkBdqsoNh?=
 =?us-ascii?Q?NCrGbyKKmLp6M1/UgXcyGay/iEwkKJy0eS+vTSU3FstDw66UuNa4wXZEZwID?=
 =?us-ascii?Q?5crvPUh2w6bu3/ta7oWdgjy/dUn9haMjh95djXJMmbzxVYYnd39qndPXJ3h5?=
 =?us-ascii?Q?Wrng605CF8jzh6f9P7Ib8CBOK4hXwac5/C6JILXV/l0M/MnO11fxRu3+X1W7?=
 =?us-ascii?Q?fowvfnJiANUB5ekRhQA1o51olduMEfHr92i+BGQCTW33Arr8Lscjo/pQXdya?=
 =?us-ascii?Q?VqpTfW8lzUJG9vQIjdOYRjIZVtaRUHzu1VjBnybuZqgOoGwT1wGs4L50J0OB?=
 =?us-ascii?Q?1tLHMUmAv0Kj8ghDXr1qA6jjbNzqgB6ZVS6/Yoo4Gc+PiZjBw/2o+tC9GYUN?=
 =?us-ascii?Q?NVY7sXOBsMSlaoULd9sT+iy3f2gZPC/Do/hGHOr+XaEZDwRhNCcYKVFxfMV9?=
 =?us-ascii?Q?m6Z90OULeltNIXizWxl7ZT811qlPgBcP6EI2oKOpwiXQz+hZlb3CQxsd5dpi?=
 =?us-ascii?Q?58uaIiVVO+hzDWtbbdk0tRshUdeEUuzCH4azPpoEj4LEz8teFJ/SyPBCBwWc?=
 =?us-ascii?Q?6i89DGoKwqohGoXeQi095vhygzLQ/GE4mIR?=
X-Microsoft-Antispam-Message-Info: FKY7GuxMDiNVdKbmqmz9HseoU0Sm6QTb/30Zec5/igSV2a/Of1oSS8t/YTup+WW0XSBQzzaw726KofxRsvHDVxkXr3vmXWSOUyNq6TlsSvb2wMcok9o/qaGt3glMBQTYww5eypp0HOEa0vmpwmikR8woM6QKIc5kpkLZsy361XdAF8OwiQiOc97Yue3D8U5tltRUS3t0odEZlmtypjjwctZOB2K+oK+ciAbI6OPCeAj9rxiZoxKfu7iMXvY/FyEcLTra8HSaN3zP7jz5NV1B3LqrL/Ta2L9GnfBQ8kcjdojyCKo6gEYW5iUFTkookx8ZxHyai154/H6d4RB1rmhCni8GZ7MlAmonPz/PorS2/gs=
X-Microsoft-Exchange-Diagnostics: 1;VI1PR05MB4190;6:5shUrNMs2dm0akyMYOdiB+206xQDP39k2Q1T6YCYnUifohWnsxt28u3rXgh9Zy6tu2lnSS0i292gWwWGES3HHOWEtII7KrMOu5Aae1S5h/PUSxmQVrp5o5KPJErFGfTgVigNw9SjgKMdUBekMWCn8t+MFqyn/33PGELsFUaoRII/1ha+VWlVLKPm5hAsshScw6bIR/dU7O5Ul9pEIw5toFTgpCNXGBjS9zygm7pmYdTvGb9ATLdfdUKcFQ2PnKb9koMuYh9K4L3Mlyp1eDYrRG6k/SrMc8R28nsFsIgpIW4xnYJn3u7zQVvr+4paBSdha7Zm9yXkLBO22oFcAN7aQE7OUzcEemlT/eg951iw6afsfZoNHTQjOd/VaH9s70H+yXwb+7ni6DmWd5rS+B29QVIAS/CQh6YY7JzICyQUmN86jq3DRhbb3iOUrHBqFOF6gCUF9PkRCt/wj6+lumWhcw==;5:YrzTGn0m7GrAhGy3Nhist0yCCvuawaBXrgdx121UdeEpNbyanGKMEjTPFNilaZ8iBye80SoMdmvpXr7i+PkNzgTkzYp2hBUGTDjruxrjjqlWcTTgl0gQhAYxZbH3DJOYUYUwwaH/H1qNSHeh2rDE5zrtjrcIdqnXOLaDXeigCQI=;7:dVcePawJWh9iR23aYCYviOu8EtT4dtcD6oAdNx5scKfrEyH9AIuxdOqAz+YUjPRsUfmGPR38Z4vPFoKecqLlfzhUf/192QjhjhDWykqSB+xsdbuK7Um+YTuma6s1mBVqv9dIEzuIVNabzFEOG7upD9rZ7pnypayq9LdAaU4iwF7ixGBIyMVKbVneu/CH/W7fS9DZBtpS8PN7xnnbEglRic3UJjR6mHFDCUH+uehKogsoWteWFVUB1OdQRKo5oq+z
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2018 09:56:41.0877
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2df45db6-fe12-4685-5511-08d5f6cbeab4
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4190
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

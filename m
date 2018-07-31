Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5A2647D071
	for <lwn-linux-doc@archive.lwn.net>; Tue, 31 Jul 2018 22:39:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732666AbeHAAWA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 31 Jul 2018 20:22:00 -0400
Received: from mail-eopbgr20055.outbound.protection.outlook.com ([40.107.2.55]:21521
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732123AbeHAAV7 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 31 Jul 2018 20:21:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pxkkZRNH2z6ysnmzAIMne9rMz43xFTDKowLcjqD/pLI=;
 b=iPxslGJfUzjJ/kzCgDRwlGnZlw4na1PjPGxnpiQGvYiUwifQN0ztfb3UDghjMqm/MhEmVSwcWJyOU9XVX1LJd1vYekEQjoboiN9HgX7hoyInnt8+o+ozmcjd8G/ajkmfhgUtlPgGLvUwdn2LLxhlqgjimtwOnF9GGy+YxcZ9coU=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=petrm@mellanox.com; 
Received: from t540p (89.176.83.59) by VI1PR05MB4191.eurprd05.prod.outlook.com
 (2603:10a6:803:4e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.995.21; Tue, 31 Jul
 2018 22:39:24 +0000
From:   Petr Machata <petrm@mellanox.com>
To:     netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Cc:     davem@davemloft.net, corbet@lwn.net, jiri@mellanox.com,
        idosch@mellanox.com, kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org,
        shuah@kernel.org, nikolay@cumulusnetworks.com, dsahern@gmail.com
Subject: [PATCH net-next v2 5/7] selftests: forwarding: Move lldpad waiting to
 lib.sh
In-Reply-To: <cover.1533076217.git.petrm@mellanox.com>
References: <cover.1533076217.git.petrm@mellanox.com>
Message-Id: <94801d18bfb830355aa1b3c8be46492b5711fdc0.1533076217.git.petrm@mellanox.com>
Date:   Wed, 01 Aug 2018 00:38:59 +0200
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [89.176.83.59]
X-ClientProxiedBy: VI1P189CA0017.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::30) To VI1PR05MB4191.eurprd05.prod.outlook.com
 (2603:10a6:803:4e::17)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0018962-f7ab-4c70-e92d-08d5f73677aa
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:VI1PR05MB4191;
X-Microsoft-Exchange-Diagnostics: 1;VI1PR05MB4191;3:mNvwwI3+5m7WbUuP9qLAt0WB8kF1SsScCw3CbaCh8w4nyuDNn3jqJLEljzuKcsrs7g3JrBC0zmlvZUVO1HiYGDfIfeAq1ZzEx9gxhGcwv9HQiSz1Si4z8mlDp4tpD1KZFU0fk091BREPhLa+5xM+Y6ZGdUj0IaaeDBNiirvzTVjjV22QNOVTN7l/CVk0b3n4M1sInjM456hykQlKf1c10gm/l0LyabJV2deYj2uUsxAWKC9uO2nkX8WXUty+3PUy;25:8nYbIaTolDfGd1FCAoP8d0vAKIXRRrI6bfgbev9GpALX4WZw6z+jRFCWrYxsFJpABd8R5XmREozbM5DtV851bl8aHEROexMZ0FfBOw3M+i7S0VFZcK8B6BtLJejjV38jfa/TF+2X5BpWSkO0+Xy9A2XnrurBqxrzeC+Kbe40lOeCntcGylLaT9VEYTUc5vvLSqIS8KkO4i6UgpmUpuoZBboEdY57EBMm0Gp8o0kzs8IXawrQoE5+4Ql9Je4E1YmDa3AhHuyKJm3FRe+1tTmUVjNcNUo5Jz6rrnNoXRsDKXPhRu1I1+Ln5IieHQgtUhIjrSPVFCfQq/kM4AmsQybLJA==;31:me/5C8bUago+OoAUBChIR9nP0GV//krKF7S5uLcBvfl4eGdt8VHn4o0mzFrPE8rpA9Xvn7sp4W4SfbnF3S0sbc1lbl0qiIc4VGLMfSav+Gjqi6mMGFrlIJI28c+WMPG7kG3cn5+RZ5pX56uPRb9W0CzAhan73oyGKIgXq48PGI4Y/QxKQljHiFAVM1197I0EGE6c3FXzDs3fzqSylTpXtD/7dGreGVHyAxvcCZKgr5I=
X-MS-TrafficTypeDiagnostic: VI1PR05MB4191:
X-Microsoft-Exchange-Diagnostics: 1;VI1PR05MB4191;20:0iX8Q9f62C7dVE3E2PI7DPxsl8+zKKZ3KAgGX9ye5nK1idJv4l4QRo5smMp7uEugupKNttnN63t4Glz2vn3TQuGSqZ7sKC7JBrBUAW2XvWeclhutuA+D2e4BU1Zo9+1mnftmn6LhOIoNU10WUTBye0FWdLbt/5pMmvBIXeJiK8JZpswrzjDyQ6C0nqRBrrprMV22Ezzrvclcu+JOit9jYxhx+HfUv52H6fRrXHpNGMei0UYtnRnJIQArcNmPTY4cZvHYdY2MI8HqDGT+oUmEG/CQ6M/+R2z/5iWuB0rInsXiFJQcODlUWOMBBtsTPR2DhiATBA/c8FwijEfECoi/PQrC5gp2yRKxRry3NOxdsQ+UdNMWUFAPQp7Imwxok7NhRI6R0/Yu+eggYGIBDh5q32oYWQn7QcH1m0bOzCpi+IdecHkq38QYe2vDqEJUAgSHn66YDaBT7wcqASzeqzfed5YX4/DA1SwbH3GHkFRSouAEFZHb2q7lT+rJMQx/0C6Q;4:rxZMnQ6brVFe7QG3YxrwUhxNr9pG30aGXi/Hy0B2Oye+ug80w5f859nhfHuBLEiruUKFhuKisH7KAL6oOBc8ZI//q0TjrDeM5N4oMXONGMghEBa/VZ0yemgAE9yFYzug8z3IDtt+uei5c6EIopVISS3Lsx6leUguS8ZAE6zNxIanyT8q5mphCs5UwEDYJd0VbCJLObDR+qupuh+sL0Ixy+Z+R7jLrpVTykuQ0x2R1nEAWaMvtiMQo1PmXEBGKQNlS9mNQAWpGPvCsKaot7EHbw==
X-Microsoft-Antispam-PRVS: <VI1PR05MB4191752DC442C486B12203A6DB2E0@VI1PR05MB4191.eurprd05.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(3231311)(944501410)(52105095)(93006095)(93001095)(6055026)(149027)(150027)(6041310)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);SRVR:VI1PR05MB4191;BCL:0;PCL:0;RULEID:;SRVR:VI1PR05MB4191;
X-Forefront-PRVS: 0750463DC9
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(366004)(346002)(376002)(136003)(396003)(39860400002)(189003)(199004)(36756003)(2906002)(956004)(81166006)(486006)(81156014)(476003)(2616005)(8676002)(39060400002)(305945005)(8936002)(4326008)(6666003)(25786009)(50466002)(48376002)(118296001)(5660300001)(14444005)(7416002)(66066001)(446003)(52116002)(51416003)(478600001)(3846002)(16586007)(26005)(86362001)(6496006)(47776003)(52396003)(186003)(58126008)(6116002)(11346002)(6486002)(16526019)(53936002)(7736002)(76176011)(68736007)(105586002)(106356001)(97736004)(316002)(386003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR05MB4191;H:t540p;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;VI1PR05MB4191;23:8lhs74VIndpOZFqOA0q+UNSAIKT4IwdCOO0eMJimn?=
 =?us-ascii?Q?KNO2tnadT0ndyNthCgFSTJ+dTER46sdB0MbI6yTyesNzWJ+vCUsqQzZo5S8x?=
 =?us-ascii?Q?bx8XXbecboD0o3DssBU9qbWzf630PyDWZU7Fz7xR+EDZraE5fkMQmmBuNp0I?=
 =?us-ascii?Q?rjJjDDW5ea9MgQkW3kX3akX1Z9Ft1sU9h34Wbn231Sj9W+501TAPZvJHhehw?=
 =?us-ascii?Q?NizIaKPs2NmuvXjRyGv1IEAnkgZ+6YsXSHN2LQ9mO1cosWJUVSG45dHpLR8O?=
 =?us-ascii?Q?sRnL+YgYomvSPxMKpBjUNTO06UIYyBmNHPjSxgL3NFOAcXIM1TYhkBdmi9FS?=
 =?us-ascii?Q?zeOtHN/0HQXu0sMdTrDIR/Q3x8iP/DmhwS4SB4mbzrdVPxZGHIQeXHNW6zPC?=
 =?us-ascii?Q?4Oeoa5IdPrSfLcTiVPT/OUg1PGFwjb1CQaGpKRrOJLUbVh3m1wSQUZ1dO2kD?=
 =?us-ascii?Q?oGm/hFbgR+oNOCWGUTxAld2pncHHFB1c0c3ytoqixZ5bte00d9KKmyOkS/yl?=
 =?us-ascii?Q?XInsbWjMu+gb0CiIbuqbveCYJPdiUsmeE2r2lXGv4bQEVbH6IDDOC4lleLmm?=
 =?us-ascii?Q?XCK4vjSIsaAcTQ7ZDe/LWb53gyVB5TNxqiEbpJK2zT9nJpU2aL8cGCvMj1kc?=
 =?us-ascii?Q?6eUOKO2cGTbZJoA2B1W3qs8L/+BOk0ozWogey3mRTwE/BWwBexe1Hc2lXLvI?=
 =?us-ascii?Q?pQcej8zlLxafoh7z7AmFbtZSeFWEPv5rF1InsUyaos1Ydoz2LMH9sqpjuCrq?=
 =?us-ascii?Q?nQH15qWtaSmdLZKe4hPPL7VIajJk+ybhFHIIDi8u1XzsZ8nkk3HlbIRckfCE?=
 =?us-ascii?Q?qgao2xDG50cb5lq5bEtMauehLAwsz5RkoGhWw9AVVTIh7YedlARpib9BAY9p?=
 =?us-ascii?Q?mdBuM7+P540R9qXh8KTQH91jR20eup+TWmSjvv2G30Y4+FqCG03XWOFXztb/?=
 =?us-ascii?Q?9Pg+fYy2L85KtvZQPzvVZjoxVZdGX4hRpW/V6Urv9SJZk4047UN2p+BF2o8H?=
 =?us-ascii?Q?Ljc+KQfSNuOSaRVrwS5Mq8xKWiI3NsVfQrtCMtQxlpctHKRvhtWOQlqBuhPB?=
 =?us-ascii?Q?+2wp9I8wUlwTSXWWCNeLdfiE7ONRi/C0vMhB0RKHk5J2lW9DtMBi3Qkwnu3Y?=
 =?us-ascii?Q?DzgGgSjC/bRneFy+v0WrH2X6FFKiraN2gP88YSmLhza6aYEkCk7qk5JzfpI6?=
 =?us-ascii?Q?+uCY1zAx9zOkeL9/COrYyTGZ+krgDy9vKZ9V1FOOCoX/BenKXC4v6kmTA=3D?=
 =?us-ascii?Q?=3D?=
X-Microsoft-Antispam-Message-Info: eUgTJGZWvUIUA4seAUukCL61oiSZO1HRi60A1cZY34paWWsEcS6drGGrbseiEOHSmrwQNNGAoiO5OkkjYE9jC16685vbSwhOh/m5Mg79MVqmXgIa+75J3/2g1T5I0DICKBg/IwJAwLV6/hwg4qmyF3BbKb/OOj2lUw6pAq/KeoZOVvqDEm9E0wcpB3G6JZd7u6pr2NDmFx1q1hgkzce6wUbhzuOaRWA7qoWOxJTfyqQpfPTXgUlQgZDsNhVVAldBlSdCoCO2KZT2W3zCTsM9XazqMbSnCGamqPg5owzofsJQj5yG+LJH+pJ5Xa4fOGuVHNMFkwbNkmApQbOcf0XwVUA0WodHw87D2J8ChPGFVu4=
X-Microsoft-Exchange-Diagnostics: 1;VI1PR05MB4191;6:IUk6sJFNVSNny4fRbzk38BKokYybZe4Vrabh58wQx28rvydWVd7Iup1yDiIFkOHmkGmUXHj8CUA+PYOVp8i9pA/vExggpQIWKDSF3IforZLMc4/cZdXUVD1Bpt6BXzYTjklakJef/geyfWsyc31pUZxm/gzL1m1P82dTTQyg0SgZjDY/ZL8EdBrEUuj2+pqC3l2MdzF03vCHsRZ7F+4w47hnQvv+iWP4kvQoDepRzaHQaxBw+6fbZKYCNz5jBoPmSCIg3JOj/3vScoFxDpYtnWxr1PjVQA3Y+8U7qp5AUsqEidZWejaywMiiE7vS85MR4nL1Kas3TXmTMDcvQ7230qlPzycKWBb783nNM051zOPEJleCT9k/n01X91x7NP5EaJK7b+0hFqKGHG7oAdSqrpClXoOHPWSxENbTYV2mp2d2dYGOY2S3XWYOlPQIDz1bZt5b8h6ZK05sac/NyVyNPQ==;5:qW9KLa+D/4QgxKeTsV5DV1pq1tYH2PrxWcCbnVX2UmtSsYL4JmKORVDu4loC5SHGIsYd0b6GIb9M1ttP+KS0UY6iiZDoUpBM7L/CajLUzAW2BpI7mw9YBK5Q+kz2bNiWwcKfjUdgPnEl+dIaCtzJAt/taMt/USDRx5m8LnMHuIw=;7:bWf4/OE/qsgaVyYljqp6nYeWJAYq0V1pQstdTDDCVnrer9mbg81ep3CTKADAWW9aVrKEhj8uHSiHyrJf0tvp2lV2HW/jZPUexT1se58BiqbFYploPTSxPNw9JvFLKEjj9X6Ka7G9b2UPYMS+pOcyjADd1UN+LEOfrbaPE67CrBu3OjK3ltm+T6ay1nZAt//s63XksQyJgdUYm7jw5yWXFeWBC8JnQtqCvOI/H4iaTYKWHY+gEz69PeRH6szLDRBp
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2018 22:39:24.8285
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0018962-f7ab-4c70-e92d-08d5f73677aa
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4191
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The function lldpad_wait() will be useful for a test added by a
following patch. Likewise would the "sleep 5" with its extensive
comment.

Therefore move lldpad_wait() to lib.sh in order to allow reuse. Rename
it to lldpad_app_wait_set() to recognize that what this is intended to
wait on are the pending APP sets.

For the sleeping, add a function lldpad_app_wait_del(). That will serve
to hold the related explanatory comment (which edit for clarity), and as
a token in the caller to identify the sites where this sort of waiting
takes place. That will serve when/if a better way to handle this
business is found.

Signed-off-by: Petr Machata <petrm@mellanox.com>
Reviewed-by: Ido Schimmel <idosch@mellanox.com>
---
 .../selftests/drivers/net/mlxsw/qos_dscp_bridge.sh | 23 +++-------------------
 tools/testing/selftests/net/forwarding/lib.sh      | 21 ++++++++++++++++++++
 2 files changed, 24 insertions(+), 20 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/mlxsw/qos_dscp_bridge.sh b/tools/testing/selftests/drivers/net/mlxsw/qos_dscp_bridge.sh
index cc527660a022..9e875ee8dc1c 100755
--- a/tools/testing/selftests/drivers/net/mlxsw/qos_dscp_bridge.sh
+++ b/tools/testing/selftests/drivers/net/mlxsw/qos_dscp_bridge.sh
@@ -103,16 +103,6 @@ dscp_map()
 	done
 }
 
-lldpad_wait()
-{
-	local dev=$1; shift
-
-	while lldptool -t -i $dev -V APP -c app | grep -q pending; do
-	    echo "$dev: waiting for lldpad to push pending APP updates"
-	    sleep 5
-	done
-}
-
 switch_create()
 {
 	ip link add name br1 type bridge vlan_filtering 1
@@ -124,22 +114,15 @@ switch_create()
 
 	lldptool -T -i $swp1 -V APP $(dscp_map 10) >/dev/null
 	lldptool -T -i $swp2 -V APP $(dscp_map 20) >/dev/null
-	lldpad_wait $swp1
-	lldpad_wait $swp2
+	lldpad_app_wait_set $swp1
+	lldpad_app_wait_set $swp2
 }
 
 switch_destroy()
 {
 	lldptool -T -i $swp2 -V APP -d $(dscp_map 20) >/dev/null
 	lldptool -T -i $swp1 -V APP -d $(dscp_map 10) >/dev/null
-
-	# Give lldpad a chance to push down the changes. If the device is downed
-	# too soon, the updates will be left pending, but will have been struck
-	# off the lldpad's DB already, and we won't be able to tell. Then on
-	# next test iteration this would cause weirdness as newly-added APP
-	# rules conflict with the old ones, sometimes getting stuck in an
-	# "unknown" state.
-	sleep 5
+	lldpad_app_wait_del
 
 	ip link set dev $swp2 nomaster
 	ip link set dev $swp1 nomaster
diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
index 843a6715924f..90af5cd23417 100644
--- a/tools/testing/selftests/net/forwarding/lib.sh
+++ b/tools/testing/selftests/net/forwarding/lib.sh
@@ -247,6 +247,27 @@ setup_wait()
 	sleep $WAIT_TIME
 }
 
+lldpad_app_wait_set()
+{
+	local dev=$1; shift
+
+	while lldptool -t -i $dev -V APP -c app | grep -q pending; do
+		echo "$dev: waiting for lldpad to push pending APP updates"
+		sleep 5
+	done
+}
+
+lldpad_app_wait_del()
+{
+	# Give lldpad a chance to push down the changes. If the device is downed
+	# too soon, the updates will be left pending. However, they will have
+	# been struck off the lldpad's DB already, so we won't be able to tell
+	# they are pending. Then on next test iteration this would cause
+	# weirdness as newly-added APP rules conflict with the old ones,
+	# sometimes getting stuck in an "unknown" state.
+	sleep 5
+}
+
 pre_cleanup()
 {
 	if [ "${PAUSE_ON_CLEANUP}" = "yes" ]; then
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BB31D7D072
	for <lwn-linux-doc@archive.lwn.net>; Tue, 31 Jul 2018 09:56:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731781AbeGaLgL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 31 Jul 2018 07:36:11 -0400
Received: from mail-eopbgr10042.outbound.protection.outlook.com ([40.107.1.42]:41697
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731503AbeGaLgL (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 31 Jul 2018 07:36:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pxkkZRNH2z6ysnmzAIMne9rMz43xFTDKowLcjqD/pLI=;
 b=mYAKoU01i6AntPYAHV5HZR0s3vbkhsEbKuv+h66HK0Ad843T5NMgJwujrB4Sol0hJ8A8jnWyZAYv/zFj1Xy0OLrHAc6TOZbFax+rZi5J0l/2gk0wiArxSzWpdrleLkQx4HDXpCFJUhD4dfdUrNwNngq06QCu418wm7WBlOehuSk=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=petrm@mellanox.com; 
Received: from t540p (78.45.160.211) by
 AM6PR05MB4183.eurprd05.prod.outlook.com (2603:10a6:209:40::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.995.17; Tue, 31 Jul 2018 09:56:33 +0000
From:   Petr Machata <petrm@mellanox.com>
To:     netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Cc:     davem@davemloft.net, corbet@lwn.net, jiri@mellanox.com,
        idosch@mellanox.com, kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org,
        shuah@kernel.org, nikolay@cumulusnetworks.com, dsahern@gmail.com
Subject: [PATCH net-next 5/7] selftests: forwarding: Move lldpad waiting to
 lib.sh
In-Reply-To: <cover.1533030830.git.petrm@mellanox.com>
References: <cover.1533030830.git.petrm@mellanox.com>
Message-Id: <a485b5656848639080c61353e0fc367dcb9ee7a0.1533030830.git.petrm@mellanox.com>
Date:   Tue, 31 Jul 2018 11:56:28 +0200
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [78.45.160.211]
X-ClientProxiedBy: HE1PR06CA0141.eurprd06.prod.outlook.com
 (2603:10a6:7:16::28) To AM6PR05MB4183.eurprd05.prod.outlook.com
 (2603:10a6:209:40::28)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6336cc35-c2f3-4a53-512a-08d5f6cbe6ab
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989117)(5600074)(711020)(4618075)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(2017052603328)(7153060)(7193020);SRVR:AM6PR05MB4183;
X-Microsoft-Exchange-Diagnostics: 1;AM6PR05MB4183;3:UMD1msiKpq9Kj/vBdGO8XP8G/Ovkq5avHjhg7oYcdvoF5GowDUzaoEzSfYEAFdl+bs2uTCTS6xlqrYDrsYt12BnN6w5HmNbWvh+2qVnhki4VTR8ru9UsHTAHqcZUTmfXnWKj5/6/NkJ0PkfZmLTzfCVfRRVLQeLqkz1dRkMTtLduuOuYFpCviVg4BT+KIog+cwP174u2umxylnySYBfvz9wHSDebZxDNojWvLWqWqVdxYuR1PjOTHPu0UuFoTEK+;25:JOcvASF4G53bNUQ5RM+97AEscFE7HQCTV73nUkXZzOkhJ4l3jpfj0wYEL29u5lWcfSOAjfs2YBFvcIoapEUvhxnddgYhDgZsivOlKrpP0D1WXUN8GQwNKOC95INCJDZPuxW6tuiv8cVz8NfaqYLIDBEwUmUsFa+e6Cn1B+7uQqpz4k7ePc+4N1gCwxGXhveEp2jH/F2iR1B25zxmfQ7h3ahjlBsA675wMcMdZ9fMdYcLgVqBWfdpdTUXzgjqqh7fXpXlIlIRlvxWn7K4KY6P71cqLGdib2/q0BwadEmPqetNttGiN2WONFrAcrXJ/3eZsOO5vIe7pRuCyBtO8dkA1Q==;31:8IDxP2f2VJVCw5S/oDuPV0Mv5101EovxKdtA37XHqRsoHELURqMLpNlDSGTBOMQu6mI7fYRHJYtYZH+FT+0/PXodF8rlZ0HIiODCf0F/jSjFCxUGTkwFHfnG7Vx24JCTHAnA5BwTw4yuGuO3YynKt2/KQ4IRBkanY3TCq7XB3GcyncJlNH2h7KayAfm0yUOR08CVZef5Pci7q8QnUPXiIm1qhVfW5QVeISHKsvZz7qM=
X-MS-TrafficTypeDiagnostic: AM6PR05MB4183:
X-Microsoft-Exchange-Diagnostics: 1;AM6PR05MB4183;20:sEjikdMQAjQw0QoSkSo1jamlCxaFTu7n/fTWr9zQHvT6sZAnEQ3MHM8LheUIfnudzcl0pwiad1QunDpyroomRL1/fMZAFGUSOy4GpOieqEdha6SNl8hKvo/eFvH31WzoXweH9lgWNPVg5jm9UEsYhxL2kJzfyObiRGjDy66SOaLoN4jAWr+qRyXhZ01/HJfgZBHsVFOsQhtz5eEZ94r1RFar9RceMO6cAOaBXCmz57zTNNAa9KMlIebkJ5J+U+w0TJpBzHp35J3qiDgznvO4LVi64qjvFsT0jW0MwxIQ9bbQAjMFKRjmNSsM39N/QqZaiXEUAdhUwYW3V0m7NAq8lOme8I7uDhAv84T21H/94DlYXnv8wckYiO+bZX5FQVcJt6LUf6YgprQLTUgLLDx/U2ZV3dsLETAm3Si2dL6PBuXAG7n5pGt7+oCRMmEy9JrkJGrNWUYNMc5LVHFIO8vPC8R5VNRTWEBgMeogJtRVvxTFeD25ZQjd5dvhtxK4A2J/;4:gdv89XoWi8J+XxYfDa4BU9KEmdM7DjRZiXst2wG0xqqOhUG/6GPvVyHgSutns42mxcvhaA6akV7RVwGB12rVN9SVqoF5b8CquM55WmLyzfmHzXbzSrRgryrz8WEyh8cdQ369RrsF9wL3oDiezOr7DSQ4q8lQeV4p/8H24ifdTbIMbNw+q/I0pHC2cuZjSSLXL9sr1lB17oP0v/442Hn/Z/tJ6rpNXuXhtMpe7QFhMPsvAqE5H+QSTrX23h/85VArBnyqCGZL/JXmM6zzUBPwpw==
X-Microsoft-Antispam-PRVS: <AM6PR05MB4183923FB702CE1CC52169DDDB2E0@AM6PR05MB4183.eurprd05.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(3231311)(944501410)(52105095)(93006095)(93001095)(6055026)(149027)(150027)(6041310)(20161123558120)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(6072148)(201708071742011)(7699016);SRVR:AM6PR05MB4183;BCL:0;PCL:0;RULEID:;SRVR:AM6PR05MB4183;
X-Forefront-PRVS: 0750463DC9
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(396003)(39860400002)(136003)(366004)(346002)(376002)(199004)(189003)(956004)(47776003)(446003)(11346002)(16526019)(86362001)(478600001)(97736004)(7416002)(6666003)(5660300001)(14444005)(16586007)(486006)(51416003)(36756003)(186003)(476003)(2616005)(4326008)(6486002)(386003)(39060400002)(8936002)(53936002)(81166006)(118296001)(105586002)(26005)(305945005)(25786009)(106356001)(58126008)(68736007)(66066001)(48376002)(6496006)(50466002)(3846002)(52116002)(76176011)(81156014)(6116002)(2906002)(7736002)(8676002)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR05MB4183;H:t540p;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;AM6PR05MB4183;23:fT3mx4h5aZ0t0vOJyKCynnWdU/jUNUvAHAccC1cNw?=
 =?us-ascii?Q?AnWXK6r3sxUFV225QvXbolFDtak/1AV8O0lMrlwYr7aAgx3y/Gpy6PZAGIIX?=
 =?us-ascii?Q?VccsosUDTBtxP8aMgCfJfgWXchCr7gfPJ9YulgSH/lgiXjDaA0fGrF2LO3S7?=
 =?us-ascii?Q?Fv7dDCkP+Mj1fdN1+KGlVE4MvZljzM5eQRdxVuHC7SEjIWYC5OcGtINglv9k?=
 =?us-ascii?Q?oKbVk5o8ShNjYbw4WUhBIQY50OqWx1hvymbi/6q++TucsUheZ9vMyeE+3Tja?=
 =?us-ascii?Q?Yzf4qVYNXOsPIIpg7/0kBTW7JD5wc/3kg0WxTVqfJlUQrU1PinDKVXdzOlUQ?=
 =?us-ascii?Q?0a9KqUIuGKYvETaI2QZYHvvkd5QHaZS9PoCbdUqTEgD8IDifMxZYibAB6sw4?=
 =?us-ascii?Q?kQAtERq87v9EAZZAiNOto6QMVi4AhsIutxqioGBSy0i+wWzK+AMYBFMKBh4D?=
 =?us-ascii?Q?ybp7rKb4kTW9seVVXHBBD5zrRzaYd5OkY+xsV7SB+c9+q6H4+qdZSKLPdCgX?=
 =?us-ascii?Q?92a9W+hPC7XqsL2b6FGVGm+NDZsB4v/O/K7G3gG4eKj8vMUkQsQ4WKXExPPN?=
 =?us-ascii?Q?hPoHADymU4OtF6Oxej/JpEgUmmHCZ6oTP7d9x0mUdBuHE6BKE6yn3Gtuv5H8?=
 =?us-ascii?Q?6SasONaM842Z6hNZDhUovFhzyAkDQNYHHjOZRhNphjFYVpj0DF6JYS/3BZHS?=
 =?us-ascii?Q?47TyJ1vR2xNMfz9oFHsvPc78kv3Njbj+nJrlAIO7Ah5nxYdnngSECAu/+4gZ?=
 =?us-ascii?Q?9pXOhDBwrmWoHsYLaug+sNBBR5kTnNzg796TQv6gLbky2SScWiqHELlLL/b0?=
 =?us-ascii?Q?Ul13VO394zKjsCDybEYsoxpPF3M8jZlDFvGUkLEWJfqPLeeUwblW7VjkoDtM?=
 =?us-ascii?Q?+edEZ2M1P5k10Th73hIb8W56fwAvmJYe2FHPLe6Lm0HOxiYkft6xhkgGClDe?=
 =?us-ascii?Q?yno+8/iPMf0faEfJQDzP8JRaLJB8ubq2Jw5vezaicA6THDXxmB5FUEpfSZoD?=
 =?us-ascii?Q?0jBijuCeqfApzd62QXVM+SF/f9M68YucIJTG+pSfkyuvVNG3NiY4gclnAsQZ?=
 =?us-ascii?Q?4gdteQ5BX68Q0yVzPfT5Tx66LxaYqT40alwIoZhi41f47Wg5kFhhtVq2xLY2?=
 =?us-ascii?Q?FKSIvbLPPGliFfS76ynEXMUXzmJNAqmRCElWoVsEKlnEvoDtRHthey2bju8W?=
 =?us-ascii?Q?Fd7kVWdpcqaDfeLguFPihF/j4XLwyWIZMds?=
X-Microsoft-Antispam-Message-Info: S+w+zi+AMDsklAathaLqsFfhwlFd4c9DkFlZLEdfOrty08M8sb57l/i1IxU9D356CobBoeL5F9LPc77UOccevm3J5Ttqx9QzDp+krR9hGMzmEL0vtmg6qhLUNJ5wqMBpxAiAh7jD1Cci+RyUSov7hUbAyjrp5RxlwQoyuE85f7ZadpaFVdURmA72upYhGTP55sSIMwENK5kP6QWHooFDaKMIrBhsqkatpYrt0f1HqTKguqkYD8Jql3N3iou0gNZs71y3zGJPRFw8ce8SS622eXRgY29zzlmjQbmW6khQQvVzYdZOEtQZsvgHSZp0UJpKTN8V1L+NvvwYJnn//6LtmQy0rz477d4+9r1zP7dSjVs=
X-Microsoft-Exchange-Diagnostics: 1;AM6PR05MB4183;6:A2MTh6RqDQYDs1aE8EgNp/AqVi7G9GtPdFzFwpRTPyMoM2Oq7NKwkVl5PRJ2woHbkqrzhGBfsMtvvgy/4j6qfXAMrqusyIuA5ouJd418uQj6jhCq+wp8pyAsehzsylpTqRLknyK1RmTHuroMK8hwyad3oKWInXZI0fBw2agSyT9ScCPBCHrcI251kCcACM9rNf4JWOKGY/OAWllCCBg8eXFUWqTcyn0ZbuS99f2pQqgyNp7esxZgSz096MTXmfGg2R+ebb1CbiAufPwXOKC02lYvwtbWXa0G/O6vzfdWKJl2v8yss8ONDNOqYVcKfPdqbTIv8pLYJ7jtuYSPi4flKYgLDQuLMRla3wobYzSCcq5X3jpeIaXS/QjF4XJhAPF/fd9eZXghrVfwuV1VdMnlenvgPhCqQZDmZb57oYHHK4tHBL8RjwQb5kCk8kMN2L1vLSMIe+spHG2gsIKKmuBvvA==;5:2XeeQjRWSF1tlbpKYyH1p7w9R7+wtoYVIi1uJhFTbZ5OGZ1tlwBr8E3ie+a7inoPh3/ajCFK4hxPxnbBLsZ9EKIu/vPYe6WkF2PUkoZQCTbx0EzNpOoL6MGohMmzjeZF6qcRgsc/C97Uysa0B3jm2t03yB4cUQe1eOrDwauDy5w=;7:B4zDIHoj9gfSGANJpbTIH5X5BscZyNKwfRWyukh6OpzgBEYj79mTyptOrc9oGDKXGx9kaempE+ZhNjcl1yviDOgV1eN7BmyhX0uLFk4iCbKhqRXQ5WMZcZeEAqMg7GRSEKs3OszPLGuypzOR6x7ApQiVvSmBV8IOFOtYDw5BIKcmOnWdE10ULH78tEy5pLT00gf6+ee255Zqww3uC+E9RWVf0EHLNhCa6TbAsCYrpCPlsKKuhmWVuN/EISPf4BqV
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2018 09:56:33.8292
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6336cc35-c2f3-4a53-512a-08d5f6cbe6ab
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB4183
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

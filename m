Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 62BC77D071
	for <lwn-linux-doc@archive.lwn.net>; Tue, 31 Jul 2018 22:37:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732698AbeHAAUL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 31 Jul 2018 20:20:11 -0400
Received: from mail-eopbgr20053.outbound.protection.outlook.com ([40.107.2.53]:10870
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732123AbeHAAUK (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 31 Jul 2018 20:20:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efwbVaSQFR5ERFmo1RdtxQiWHzsNe1jz5NOKb1E4snA=;
 b=NsUGwuLX4UkYDUVm+QzBcCQqqQ+INk8tQUUtSOHLEBB5CRyCDteS9H1Ee9HcpmJtvKwqsbpVeRarAEzjbGqHpgp4sM/pIJ4iDUVmoRnwxN7EIzn0zQgTCJvm0LpFOqQV12bEPkHRwD2tUGTJCfKqZq3BfkXusVB0GRSxIuK3yDU=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=petrm@mellanox.com; 
Received: from t540p (89.176.83.59) by VI1PR05MB4191.eurprd05.prod.outlook.com
 (2603:10a6:803:4e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.995.21; Tue, 31 Jul
 2018 22:37:34 +0000
From:   Petr Machata <petrm@mellanox.com>
To:     netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Cc:     davem@davemloft.net, corbet@lwn.net, jiri@mellanox.com,
        idosch@mellanox.com, kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org,
        shuah@kernel.org, nikolay@cumulusnetworks.com, dsahern@gmail.com
Subject: [PATCH net-next v2 2/7] net: ipv4: Notify about changes to
 ip_forward_update_priority
In-Reply-To: <cover.1533076217.git.petrm@mellanox.com>
References: <cover.1533076217.git.petrm@mellanox.com>
Message-Id: <55313c0467f038b52be81b48c270747848c0ad21.1533076217.git.petrm@mellanox.com>
Date:   Wed, 01 Aug 2018 00:36:42 +0200
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [89.176.83.59]
X-ClientProxiedBy: HE1PR05CA0227.eurprd05.prod.outlook.com
 (2603:10a6:3:fa::27) To VI1PR05MB4191.eurprd05.prod.outlook.com
 (2603:10a6:803:4e::17)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78c3fac4-50f9-489d-de00-08d5f73636ca
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:VI1PR05MB4191;
X-Microsoft-Exchange-Diagnostics: 1;VI1PR05MB4191;3:cawH/sgwJDXNHCvtSGgvf8UmzNOseXSewUC/RISJ85L12ekrnCqI4IGDLPofJMtLQvi891/fSMtqW0/WqKiVDmBdUpawAMzUnvDR3SCQZMAQnQfR9TfWPrU/5PHYjVqJAuYNmPHJ5beMBx8CTT2XQaZCzeqDGohYmx3hdT5xlhaDIwEWXY8kQQlnUbQMLy+29vNo9cQ0478W6OOj/FbZcrSzzl7+c77VfPFJ+JC7JdCrWWS6bswfECK/nQr0ePXS;25:HkDE+xxW3anIAS9Q78kzmJpfr02xBiVQuYu8oXp6N+M6bHFMuoF0KPIQzBtzrZiUvJEj2j7lWL0APJ4hx/Og0r9vApUMthkAS84mUt9J4JRdR5dSY0EXqQ4VAxN1TQoCT7Ord6S4vTvUNzFaHpmPYC/H8pIcjpPGvxKg8dxWQEon30kglP+AdbdO06HH477MZ1/+ReNC0jmz9zW5RKfR+bnqdHZ9l2hjHAUGsp+eH0/QVlNIrm+5kMnViGbSb8/vIDlCVJaCTQL/mLG5Jp715YN/J68gKLVR6pJhE8zp/rB6m4z4/Z/N4NcDMBwjAOFxfRcf8IS8PoHRj/6QcZI8iw==;31:q0HNFRwmMA9ic3EwmFhh9q+hVO9XECfQg5d/YpRJsAa7VlO7FmNTULUvQEitl3EPMgwp/9fK3rW/fwL0Lb5drXs5wPw87NXUUNjuEyxdBhbOM1xBCQLGE5v8r+hKPM6xUf4dnZCExFVqr3VeYbDrQnKD5BIOF5j3VXBwX9PY6X0Jw1nPuraFbD7dxOqAgZTphMzoixVnNCKKpkYzFxG72N52Er8WRM0Kow/L0vQtZvY=
X-MS-TrafficTypeDiagnostic: VI1PR05MB4191:
X-Microsoft-Exchange-Diagnostics: 1;VI1PR05MB4191;20:lNWKY6BEZxNUOA/Wld4V/wbPxSfNiveW34kg+v7/RyoaZ/XEEIjSHtWUiNoKjCUPu/v0KvG3YOFFxR/kifIRtRoH4LzM/ee5RQpcwW1v0XAVSkvHORrZXeI3VQIWtV0TV4YEF10iKuDrdyIhO++bhSGAIk60gNRABevQf6HX923DhJH/bbV/LuW3prhPRFaigkL8rdCvdZi8bAsbdu/7GT1sZkRx1YRozrUjYWL/yEa+lrRDavvY6DDNIGmbph/I5+zhk2hldTmKozmDJ/o5JKM/9WllsMXRLbgF+ZoSU2OLMD4IxVJbStQ9YoAlh7VTtTTYF735R77f4ULuKtUsRBaeSg8tTHxPwMiF3msVylAlresjvceHqTmVwr/Z6BP1uNHRiMszxTYBzml9iNAtsNnWQJd/20Zp/fQPaen8hvEw4vj8gLRY4u+1bc1/pNgjZQlFptcCZ5ihdrNXQocIIximkPSMpq5uzYFIAFUMZ1rG0M36vtu2svTnxVuW0xTw;4:+Un/J4TofGq17oBKqTfz5a2TsQVr/Ch56Ri8JWATMood7WURHeTDWDXh9BV1lBEcxOvvMA3vSI9bXk4w9o9Za4hs5cotZycVUSK+oabPhv/vn2n4Chli/a4S3bOIP44OsfYrSJZVq2vKW2SjNuXeln2NaZx6pTxSoRlEonm0k+m2PI82cAfNdJAf3oR2MaSp29yTXkRSZ0O9Srvwa2Mn5zDEtSu69yGLut4amcjUBXtWsSVwHwOHnXvDH5l3UwYi5zF8DCWuDwY60O/jNngnHg==
X-Microsoft-Antispam-PRVS: <VI1PR05MB4191E3E30107F576A8A1080FDB2E0@VI1PR05MB4191.eurprd05.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(3231311)(944501410)(52105095)(3002001)(10201501046)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(6072148)(201708071742011)(7699016);SRVR:VI1PR05MB4191;BCL:0;PCL:0;RULEID:;SRVR:VI1PR05MB4191;
X-Forefront-PRVS: 0750463DC9
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(366004)(346002)(376002)(136003)(396003)(39860400002)(189003)(199004)(36756003)(2906002)(956004)(81166006)(486006)(81156014)(476003)(2616005)(8676002)(39060400002)(305945005)(8936002)(4326008)(6666003)(25786009)(50466002)(48376002)(118296001)(5660300001)(14444005)(7416002)(66066001)(446003)(52116002)(51416003)(478600001)(3846002)(16586007)(26005)(86362001)(6496006)(47776003)(52396003)(186003)(58126008)(6116002)(11346002)(6486002)(16526019)(53936002)(7736002)(76176011)(68736007)(105586002)(106356001)(97736004)(316002)(386003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR05MB4191;H:t540p;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;VI1PR05MB4191;23:PxFe5Vpg/3VzIOrtn1KNDX4ofFYb57nrMSHblWgBS?=
 =?us-ascii?Q?yR+YtZJXypWN2yPM77Wt0gJKPCOJIm4JiYYgHkl1HKRKpDkGbFXXL/rdgTNA?=
 =?us-ascii?Q?RNNRl8f+RcLaFnZ45dVHR3WXGuyujPRwGo9vfhaw8g8xHTk5aRZMi+OjQNbH?=
 =?us-ascii?Q?ezzXWV64DMPfMMjS7vCT8dsaetO8Nsq5EvZJpFww1LqMzh1t1bpmQlk0l49w?=
 =?us-ascii?Q?Lm8SVcd4KfeEJfn9+mDKA2z+sdXksDDrW86b2ICiZyJLJb3AE5b4L/VjBSq/?=
 =?us-ascii?Q?TqQbtngckoZ7FGyR0vbPC9QOWb3mXTcp2rDWYnx2sHCnroCCMQnwvG5Vy92V?=
 =?us-ascii?Q?q1kkCZZoDJKxt10rBbpeO2lEmZ6WSh91fPz6bm4LQsp7pmuCGiXAq15KetTc?=
 =?us-ascii?Q?iD2aMXCm9mfwK+8WLr5aBozu5AaPQt/UyYETPCUfqLW33+rP2SLAeBfzERtR?=
 =?us-ascii?Q?25DQr1LAB5OEyIRBTnV40x5moDSInZ3fi0XruUE/vMiTT2/avWdODnAPcOW/?=
 =?us-ascii?Q?5ciB1hKqgSQgAGM2UeCslMKzBBEJ5/zxin5fIZP9nttgr09/9ce8q5iM/Hfz?=
 =?us-ascii?Q?rGlPlrefgm9xusFBkHtu7bQmjzLjUemi5sNw3mlMv9uTP+NDqKts/giJ7ibp?=
 =?us-ascii?Q?tQhBsATUqL5GcQAyvZ3DEVV41xAswzau964fMh9uHfRJnpgi6hA17So31soX?=
 =?us-ascii?Q?Qi8LofW9503FE6wUtpuxcBd6PBsB9EIIX/0OZh3FelHEqpJ6juqZZaBM7biu?=
 =?us-ascii?Q?zpSCK+GNkzdnaR6cLqULoNWHI6NjK4LJPYZgTyOVQO+vLZKuLBpsRpAk1aLz?=
 =?us-ascii?Q?NWnN7OGzSJ18Q69WkbUtTPed2mITkNJpbNMzc5qXnrfx7YqyACYnPTJc/d20?=
 =?us-ascii?Q?929Qn45vGgzYydN1QfQIkp3okM4JhES/UT1TcT1vEjEpkoCiebfnnsoo5Rtl?=
 =?us-ascii?Q?BIgiumFKteRrXTwjHIpen4Byu0PQM0C92EoQLL4yJPEGXQTTpKp/nhgKNVpd?=
 =?us-ascii?Q?HyI7qaWuizm3JY4Y5fAMJwnuV2EQvWQWzu0v4St4npY0vsWrhlftCMWhIxXN?=
 =?us-ascii?Q?/mbbOrWR/rmKWaQQtRsB329VSW9O38IKfsSfFCfjKosTJ45UjmCo+XxF5XcE?=
 =?us-ascii?Q?SXXVsVwNEn80pPCRp8jtB4ZCe90L2Yz/+LWhR5SoPDEBzgWY/gsSLJG90bx7?=
 =?us-ascii?Q?CXkP3fKDaNZ3eaq56e20HyvR4vLUu2NVYvDCnrX1kllYy758xTjtOdHEw=3D?=
 =?us-ascii?Q?=3D?=
X-Microsoft-Antispam-Message-Info: bZtLqa1bSVeLceUN7av6HV246Cq+Hol4i/aKuiSI9e9EfgkrRZeE683OhBZeJmEFxeak5loIJ4QEqKVYu5+6liRO92LIlXL16YEDgKrDllZRId91WUJcuahIfDMK9VDyuheFbNFJcM9M5fwzpPIlum1zVIM11hwpUszwgwaQVC2yIaGWcKuBa4XFJxnqo9cKoUx8Hh/c9dWpxwTt/AEaRyerVDEKdGXcyzqoWSkLwkiP6MUMDnO6ZQdaJxOC2k5juMG40XyIhfOLVvXmj31YqKQBTRRO0CjBaZ8tCpYiwwdoocPvYcOrPhJoLqdJFLZB3fZWNePeBglRoz/JC/tsInuowaaprLDo0py50fXU5A8=
X-Microsoft-Exchange-Diagnostics: 1;VI1PR05MB4191;6:VBYWyPGz0cuaehAV4Zn5GC1SSKDUyKyRYgaocZniZYe4WMRfdX0kScK8OSVEhAckWp5cj8pi+vZTVkD54hqElrWGGNRVRrmjMOA/VTp7HECBnf+6ZTtdgKpgr1FPFW1/vGi5jxIjbL/YcIZBz1iCiluFmj6ixDcXFeGDPAJxlcpsIauhY9ggHvPaI6vafywxvBTOwF2jgt4yqulYkJeXNq0on5DCUah7hxaawQZyGme7+YvxrURI6MLFPKdnoi5eEZTpWN35KMFmMpp1GCLp/+01I0MffX2/OnNIsPAEzZwnl7H0jHQ/OcIsBsvr1AwccgYXDlCoPvfKAJ/lbngtOwnOygW3mi7bA6tV2dYkGpZIT4WCoWhZGlPPtZJayY8vUzYsXpa6ee5qVtfyn+TJnx8eLr7uy3nqeQ0jVLeWnQ9yyUJCpPyeMz0LUcDAbU698zMbdJRakZ7SREeN2/x8NQ==;5:k7JrJcLQXh9VNV+Q8Sjp2iohYyxiQ/om2S5aGFyUb5xrByRU+iDOHg2peAo4PVk0DrUGO/R0pmRtG92xAYG/LL9lsn5n33tUOrL6kfPwIWnNTIsbt8yuJ6Wc6uboDi+NRtjLdcOuEhPhzeaoLb1MVushU3EBxxEPZy0iSf4ZOwM=;7:rVJ1ojm/jnaWeafyrMW7hLiplTCOvp5dAHJtkX27qua3aYUGO5wb/688LclHmaEvAI2WXFG4jhlQ6OAXi6Fo+lb5eZ0+fG1dhkd4+zqkoexUymVEIQaZL1GEIYJ1qwj605BFWF6/EYCJ66aUcRAg3/IgY1f2xJCBx5JoYAnHfSjOgxEtkOMk55v5NNjb6HW17TtKgspKGNfcIUVhAsLnRRmMCPT/xPsq/XA1FENuP9DJwFX60u33uXhZYZLjfe0d
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2018 22:37:34.8723
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78c3fac4-50f9-489d-de00-08d5f73636ca
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4191
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Drivers may make offloading decision based on whether
ip_forward_update_priority is enabled or not. Therefore distribute
netevent notifications to give them a chance to react to a change.

Signed-off-by: Petr Machata <petrm@mellanox.com>
Reviewed-by: Ido Schimmel <idosch@mellanox.com>
---
 include/net/netevent.h     |  1 +
 net/ipv4/sysctl_net_ipv4.c | 19 ++++++++++++++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/include/net/netevent.h b/include/net/netevent.h
index d9918261701c..4107016c3bb4 100644
--- a/include/net/netevent.h
+++ b/include/net/netevent.h
@@ -28,6 +28,7 @@ enum netevent_notif_type {
 	NETEVENT_DELAY_PROBE_TIME_UPDATE, /* arg is struct neigh_parms ptr */
 	NETEVENT_IPV4_MPATH_HASH_UPDATE, /* arg is struct net ptr */
 	NETEVENT_IPV6_MPATH_HASH_UPDATE, /* arg is struct net ptr */
+	NETEVENT_IPV4_FWD_UPDATE_PRIORITY_UPDATE, /* arg is struct net ptr */
 };
 
 int register_netevent_notifier(struct notifier_block *nb);
diff --git a/net/ipv4/sysctl_net_ipv4.c b/net/ipv4/sysctl_net_ipv4.c
index e21dda015513..b92f422f2fa8 100644
--- a/net/ipv4/sysctl_net_ipv4.c
+++ b/net/ipv4/sysctl_net_ipv4.c
@@ -201,6 +201,23 @@ static int ipv4_ping_group_range(struct ctl_table *table, int write,
 	return ret;
 }
 
+static int ipv4_fwd_update_priority(struct ctl_table *table, int write,
+				    void __user *buffer,
+				    size_t *lenp, loff_t *ppos)
+{
+	struct net *net;
+	int ret;
+
+	net = container_of(table->data, struct net,
+			   ipv4.sysctl_ip_fwd_update_priority);
+	ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
+	if (write && ret == 0)
+		call_netevent_notifiers(NETEVENT_IPV4_FWD_UPDATE_PRIORITY_UPDATE,
+					net);
+
+	return ret;
+}
+
 static int proc_tcp_congestion_control(struct ctl_table *ctl, int write,
 				       void __user *buffer, size_t *lenp, loff_t *ppos)
 {
@@ -668,7 +685,7 @@ static struct ctl_table ipv4_net_table[] = {
 		.data		= &init_net.ipv4.sysctl_ip_fwd_update_priority,
 		.maxlen		= sizeof(int),
 		.mode		= 0644,
-		.proc_handler   = proc_dointvec_minmax,
+		.proc_handler   = ipv4_fwd_update_priority,
 		.extra1		= &zero,
 		.extra2		= &one,
 	},
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

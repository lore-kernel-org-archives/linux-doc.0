Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D412C7D071
	for <lwn-linux-doc@archive.lwn.net>; Tue, 31 Jul 2018 22:36:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732640AbeHAATS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 31 Jul 2018 20:19:18 -0400
Received: from mail-eopbgr20083.outbound.protection.outlook.com ([40.107.2.83]:10421
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732567AbeHAATR (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 31 Jul 2018 20:19:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYfH6hQY17eIUV6jhW705/SHJ9RapsCAlW9okZeQ7LY=;
 b=g8qAXVynjMAl4oHCTakRBGKB1M66l6L+0yUCiHI6yYeDYBIeUQzDKbFVFXe82zzxkm+UjhE9mpEeoo4LJ26GG4rgQjUm+wTgL/NlXFiO46q6JfCj/befQtCk5duTyLCpRmxsNV6aNXUlbagcc3tNRF+Bq+OgfeC73FOuw3MqP4Y=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=petrm@mellanox.com; 
Received: from t540p (89.176.83.59) by VI1PR05MB4191.eurprd05.prod.outlook.com
 (2603:10a6:803:4e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.995.21; Tue, 31 Jul
 2018 22:36:41 +0000
From:   Petr Machata <petrm@mellanox.com>
To:     netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Cc:     davem@davemloft.net, corbet@lwn.net, jiri@mellanox.com,
        idosch@mellanox.com, kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org,
        shuah@kernel.org, nikolay@cumulusnetworks.com, dsahern@gmail.com
Subject: [PATCH net-next v2 1/7] net: ipv4: Control SKB reprioritization after
 forwarding
In-Reply-To: <cover.1533076217.git.petrm@mellanox.com>
References: <cover.1533076217.git.petrm@mellanox.com>
Message-Id: <f73a1f0944d84e75e8bb0b3ee4240561ae2e0f12.1533076217.git.petrm@mellanox.com>
Date:   Wed, 01 Aug 2018 00:36:03 +0200
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [89.176.83.59]
X-ClientProxiedBy: DB6PR0202CA0018.eurprd02.prod.outlook.com
 (2603:10a6:4:29::28) To VI1PR05MB4191.eurprd05.prod.outlook.com
 (2603:10a6:803:4e::17)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 449d39c6-fffe-491a-4e02-08d5f7361698
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:VI1PR05MB4191;
X-Microsoft-Exchange-Diagnostics: 1;VI1PR05MB4191;3:2bW1GDVcI8mcQDOrjLu7vBtxHSWM8a+M8V7T8pp8GVNct8f+mxxlhtjwfv5Q3brngaX5jhhVnO78wAppVZNq1A6JP2um2CSk5fVcCZQlb5e3YdSOA27pEeVTsLvL9QYlaoWbaue6HGVgsWjk+7/9I45NtO/tHMgjs5KF5MjSY96eKw3ILMK7CCdz2PYQrKWDF3/w5IaUyM6ZLJDAcVrLHX44ZgzD99iYUYX7i3gLiCzkdsNXehR1Hs6B3Kw6Dk3u;25:zi2Lo9hJQ3Eh5FLZAGrEdol8iT4+9FCq7Znf4tpT0FTWfim4NWcP3sXKNhBwxLKSr6531AUSc+UdG176wXlwPLS0YBzb+Trjrxm7mEEJc/eq3PQdX5p02yUSIvd1d7rTHVvNy05rCMUBR174BYzzG/m6R4nBzQz0x7YUEFubWbSaOBIsgB9F/kZqPPXeF4bEvE4levlPtyExhO22s+arW4x9/EFBwtLPnMBN+OnpNcUGoD5wz4yMLSt+62osQTI5ZS3I3oS4MzPt+GBzkXIeo4njGg9SItO/JXDAsvzMGRP6yTWJxszQXR9EkXA2ZbclUSxHEvs0hfSWBEm2E+FhvQ==;31:GTMhXJS+0c36nrO00OLlQfqMrGQFZDqgM44BF2JpviOw/Uid4aomv/0h+ox8e/JoKM5f+8N3xa0jMdOL+oBQEVUjmVK0d/kXwzsWltts7YSgvm5AS4yNu7KNPdHbNFIhs/UauR6WS9hpFkSjqLcFLNcX83ir91BE9vOh6073UGrC2HdKNej7U4Rov1SRrvzVGlX+WzotRGEED9FnVTWk+1gJKANNB7ooOGnPzBjPJ0w=
X-MS-TrafficTypeDiagnostic: VI1PR05MB4191:
X-Microsoft-Exchange-Diagnostics: 1;VI1PR05MB4191;20:OV6UMIqXZ4pqh+OELdLFZqvDAp/qtDRlYjRqW6G19LAZ19Hm34f+dQlSFF75c0FNuiL+JYyxIvlC20F83xOAITc+IAw0F4sKrCdCLG9XHnR4SPS7OlI7HlrGG+e39YJC5oofetmen22LdhShrJKWBtnDEBExgGdoDEJbv8LixCFOQ8T7NYccyv6cUO4OhUogJ06rB1Do4m4YPexea/kX3mqiK+wR61HxnJWMk07IfD3jmNgM9HWDt7SxBZkXJ9MQgJFtLY/oqTQMd0iI3/B5FS7FWyiEN8sLxnWIg2w91ywlV/sPxFeoUKlwyMBxMCIoyvNIc7sY3lTtQgL4w8P91z7N+T/nRgGe9on0CcEnatTPGyI4Jf9UYY2qVttxypmNHz7THngiLSVlNTtCG3WxHAUfm7dOWwCFxTCA0ciYULV70maSI7i538NZ2ubMgjhsxNbKtMBq/UzAEA8w9zxQJP/w5Joa1OnWkk1mr/UTCVI+ZTERQFNBNYBVmwUQ33jd;4:krjn/mGrLj2Dab+6lq5iTC2OBt+atZt1JIP++5IcWd2Br0K8jBteXnE41lcyFWxUlSZE2gRoJZz3Vv/WtIfmzmDEnBmGAP4+ktf0SDoF+XHDnU93W+qglwhu+T6QNVPs3KDmt9Rl+5hJ+x+uwSilLuBoEqtg7a6XpuhlxUeoX5ppz/pdUO1x9L/Tg7ZyT+nByxFuXqAQsAdLHmL1xk1BYdgmFUaLfUZyWhxHuM1iZPWpu6quh1n8V5/3pcfZxV/o35rFgcW9bnGRKnqYU1WftQ==
X-Microsoft-Antispam-PRVS: <VI1PR05MB419195193762A613A80D6CB0DB2E0@VI1PR05MB4191.eurprd05.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(3231311)(944501410)(52105095)(3002001)(10201501046)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(6072148)(201708071742011)(7699016);SRVR:VI1PR05MB4191;BCL:0;PCL:0;RULEID:;SRVR:VI1PR05MB4191;
X-Forefront-PRVS: 0750463DC9
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(366004)(346002)(376002)(136003)(396003)(39860400002)(189003)(199004)(36756003)(2906002)(956004)(81166006)(486006)(81156014)(476003)(2616005)(8676002)(39060400002)(305945005)(8936002)(4326008)(6666003)(25786009)(50466002)(48376002)(118296001)(5660300001)(14444005)(7416002)(66066001)(446003)(52116002)(51416003)(478600001)(3846002)(16586007)(26005)(86362001)(575784001)(6496006)(47776003)(52396003)(186003)(58126008)(6116002)(11346002)(6486002)(16526019)(53936002)(7736002)(76176011)(68736007)(105586002)(106356001)(97736004)(316002)(386003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR05MB4191;H:t540p;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;VI1PR05MB4191;23:qfSkkKui1IidfELWOmx70mj1ExDE7Vrymq6SJ/T7h?=
 =?us-ascii?Q?SoOdj9/XMOVQW2kmAVoTNf2BZeB7YbvYg+iLA3mcLURk4SDD7YBctY/g4PEA?=
 =?us-ascii?Q?yi3Ps09rqG/v3Y333lX5t/4JD2oAsNqU0dONRinG7vJ+h8zspxQleDknGovQ?=
 =?us-ascii?Q?Tg0Jc1AooP785ZPfAGLMP15iIFJkSPcYapiWiu6aq8pkr4vBt5ZLTblVkQz4?=
 =?us-ascii?Q?6Bwgs2hvE6dcEs/P+u74CE28qAPOxibl/UpH2gS+9lo2E2X3yYUXCDMVwXg+?=
 =?us-ascii?Q?F2o+yizRwTfQjjXcINKb/0YykqpDRSVPylA0MufjgG6gFBI8zEOpKJPuk36S?=
 =?us-ascii?Q?wGTxwZEryaplOlMJLpQkn2KCMof8DMJgrhYNH1Ts3edHwl9H6FdswMj1pAQ1?=
 =?us-ascii?Q?6Yt0TUIMuNshirMs6qMXub1iJMM6dMQZMlm9LNOUoHqnE+RYXosNBRStLANu?=
 =?us-ascii?Q?Fz2A72WYPBdXYXuBgPPHjXwjtDpdyi4YorUxSgc4VI4TmkCb5HTl78ysTxy4?=
 =?us-ascii?Q?YIYN1ezWNVnUa0uG8+qzzLicPGEpntr5sZQFL7F2ulN7mx7LTM9+khNqbMLt?=
 =?us-ascii?Q?zdWR2oXvRwjrAG/PQGF8hws0Oe7b+3ZMRB5bsNhB1Q4E7iR8COebVD3Ra3HS?=
 =?us-ascii?Q?DtGwy9YG/buS5FnuNFo7xybt4tdMweeHDHAshX4d2EocxY5Bz3Oh847Wlb4/?=
 =?us-ascii?Q?Jf855yIKTsaFsvz2v9co6o7udvtFCV9lwl5EWl0Y16DQTVubedfETM0Lcpy7?=
 =?us-ascii?Q?v6Oa4wX3eNrQEmyI9CoOOthfjZUGmJS3jbPkj+FNNqgs7Mrp15xc6yjEaveI?=
 =?us-ascii?Q?zlHuP2RO1UW+6OmC1ggWfR2k97bLYVBFiFGSQhCrapvpHkLmXslcRV8rvVbs?=
 =?us-ascii?Q?X+Yr4/1HKbWXi11COFE26ZHT+MKu0zosTwhXxlwvNlmoQNToWQ1T0jxdYVbH?=
 =?us-ascii?Q?iIEVyl1j5RNesh5AkvjcoaS8YK/xJEI70ykZYQtjklIFRYhCUONceLExu8li?=
 =?us-ascii?Q?cg5UYmtYiEdy99JTm6q2wapTIL+U8jPi3e71kLUaVQWac7RaWVBye3lwCjOe?=
 =?us-ascii?Q?OecsTKkMcvBvvIOnbUrdJh5be77R2fUBAhW0OZ4Kt0KjRpBI9xa+fkRorKMA?=
 =?us-ascii?Q?2fO9BeMPQaKigsyF5bcl28oNbIBBQhmS28d84B0IrKjnfwYvjDuLNuPv+Daq?=
 =?us-ascii?Q?YX1674FaHZ7FNIYeC2rZaGAqJX4lq+z+h4GYQkZGLaD3OXVj9SpqFrQVie4D?=
 =?us-ascii?Q?1Ynk/EkshPp0+LiIr4IA+CcoOqGsZQDWGUC2fL9?=
X-Microsoft-Antispam-Message-Info: +sUPaGC+hINQZpsh4Rmj3XnW7J7kBvI607XCEwkyxP5HVYODxG0mQUKnwyXSODHGz6rG92rjmnx5HwORpKPn9L1fcxPQf+xLI3SBHcuO5+nQumygv1h4Sj7FuM0ZLsiC8FUeybDIb6naUfBF40avNqKgAUoqo58ckHByiRun/9CrdSljpqTWP/EcE/RuY326s6nFt6JQT48qFd9zzbFhR88yqXu5LleEVea9IXxTj6hgtJVq+2vR1tCre7x5jVpQ9J00pH+e22M8vYigl5P4fLEddXgmtXcX7W4qM4y8idoSm9X8o4xO8VIYhemYkEbkekS2O7KWcXhUVJOYeOnA+rLvMGAkjVtDd2jASy3U+Vw=
X-Microsoft-Exchange-Diagnostics: 1;VI1PR05MB4191;6:h8KFWW5ETxyA2KW36buHVnrWlHPT9x5Q8TdALEXG4R+q3p2m5EFO0iJk+1OY4cAD3nD0fWQeYQ7ZG0fIGrx3zx9dfAaKqNoErZ1iqPfunJQepILBhXuk2ghEfYOkFCru+kqEzLZxG1t/+tmvW376mjK8qyfetgjWc+cZvETnlHHvFUl60JtN5mprndRSS7peIIX47cGp1A6fSPXp1WaRd+9zb9SvF8T1YgKbi5Skq2jcso8nb4F9ylKkHy2DE4s9lUlJuOPbVhFZUHi9yVAD0SkG3l9/qTyhvx9TX3gae/lDXSASOhZReyycvk+VwnBI8ikGDLrt/xiPKarw9GS85LpdHlD4jriRBYtkd21XQBUK1gWiIBFXPMS26ehNLE4Vu8tW2+ztNdC1CScr6j9uf971HgFFk1ZxM1TGYzRsUQ5wVvpPGZCW33YfV5FmhGxslckTsPeLlbHns1Z5CIK+yA==;5:QEy+XcaWrqm/FaJwwAnDavpiRUFaKEmxK2eLzIxRzs5yQJQw8bxPZJMxrhLwu/HKsDsuYxPDDQPPdr4Z1jfBZQWcmtouSBFQU3fFSY7p3hWBGV07oANf9L/mhfdzKE7eTPeMv6egQvXv6c0UsvJNZxksMQFMqWB/+qV3VPYZxZ8=;7:d+oYcTnsA62ew1HnK2Cgd5whW7FWhRqYTaZ8MjXIi1GxmhxHC6pGF5TWWN7nStetro8OnOPY5DswET/EJTvBUWChZ4/6wYFs+UGjosKLXQyuHyYSr+gnCALI3/ZdrFJKNAB6sr/aN8eDh6NRhYIpseGRcUo23U0488RwnTVsasPhZAWfdO4gygCGwIOJ8gJ59XH3kKhGvBL2cg9goZqYbLyURILTARecEZYUeRAKbyAwedE1Femf6UcLBbc2Ka/F
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2018 22:36:41.0459
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 449d39c6-fffe-491a-4e02-08d5f7361698
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

Therefore introduce a sysctl that controls this behavior. Keep the
default value at 1 to maintain backward-compatible behavior.

Signed-off-by: Petr Machata <petrm@mellanox.com>
Reviewed-by: Ido Schimmel <idosch@mellanox.com>
---
 Documentation/networking/ip-sysctl.txt | 9 +++++++++
 include/net/netns/ipv4.h               | 1 +
 net/ipv4/af_inet.c                     | 1 +
 net/ipv4/ip_forward.c                  | 3 ++-
 net/ipv4/sysctl_net_ipv4.c             | 9 +++++++++
 5 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/networking/ip-sysctl.txt b/Documentation/networking/ip-sysctl.txt
index 77c37fb0b6a6..e74515ecaa9c 100644
--- a/Documentation/networking/ip-sysctl.txt
+++ b/Documentation/networking/ip-sysctl.txt
@@ -81,6 +81,15 @@ fib_multipath_hash_policy - INTEGER
 	0 - Layer 3
 	1 - Layer 4
 
+ip_forward_update_priority - INTEGER
+	Whether to update SKB priority from "TOS" field in IPv4 header after it
+	is forwarded. The new SKB priority is mapped from TOS field value
+	according to an rt_tos2priority table (see e.g. man tc-prio).
+	Default: 1 (Update priority.)
+	Possible values:
+	0 - Do not update priority.
+	1 - Update priority.
+
 route/max_size - INTEGER
 	Maximum number of routes allowed in the kernel.  Increase
 	this when using large numbers of interfaces and/or routes.
diff --git a/include/net/netns/ipv4.h b/include/net/netns/ipv4.h
index 661348f23ea5..e47503b4e4d1 100644
--- a/include/net/netns/ipv4.h
+++ b/include/net/netns/ipv4.h
@@ -98,6 +98,7 @@ struct netns_ipv4 {
 	int sysctl_ip_default_ttl;
 	int sysctl_ip_no_pmtu_disc;
 	int sysctl_ip_fwd_use_pmtu;
+	int sysctl_ip_fwd_update_priority;
 	int sysctl_ip_nonlocal_bind;
 	/* Shall we try to damage output packets if routing dev changes? */
 	int sysctl_ip_dynaddr;
diff --git a/net/ipv4/af_inet.c b/net/ipv4/af_inet.c
index f2a0a3bab6b5..8eb6c74819b8 100644
--- a/net/ipv4/af_inet.c
+++ b/net/ipv4/af_inet.c
@@ -1802,6 +1802,7 @@ static __net_init int inet_init_net(struct net *net)
 	 * We set them here, in case sysctl is not compiled.
 	 */
 	net->ipv4.sysctl_ip_default_ttl = IPDEFTTL;
+	net->ipv4.sysctl_ip_fwd_update_priority = 1;
 	net->ipv4.sysctl_ip_dynaddr = 0;
 	net->ipv4.sysctl_ip_early_demux = 1;
 	net->ipv4.sysctl_udp_early_demux = 1;
diff --git a/net/ipv4/ip_forward.c b/net/ipv4/ip_forward.c
index b54b948b0596..32662e9e5d21 100644
--- a/net/ipv4/ip_forward.c
+++ b/net/ipv4/ip_forward.c
@@ -143,7 +143,8 @@ int ip_forward(struct sk_buff *skb)
 	    !skb_sec_path(skb))
 		ip_rt_send_redirect(skb);
 
-	skb->priority = rt_tos2priority(iph->tos);
+	if (net->ipv4.sysctl_ip_fwd_update_priority)
+		skb->priority = rt_tos2priority(iph->tos);
 
 	return NF_HOOK(NFPROTO_IPV4, NF_INET_FORWARD,
 		       net, NULL, skb, skb->dev, rt->dst.dev,
diff --git a/net/ipv4/sysctl_net_ipv4.c b/net/ipv4/sysctl_net_ipv4.c
index 5fa335fd3852..e21dda015513 100644
--- a/net/ipv4/sysctl_net_ipv4.c
+++ b/net/ipv4/sysctl_net_ipv4.c
@@ -664,6 +664,15 @@ static struct ctl_table ipv4_net_table[] = {
 		.proc_handler	= proc_dointvec,
 	},
 	{
+		.procname	= "ip_forward_update_priority",
+		.data		= &init_net.ipv4.sysctl_ip_fwd_update_priority,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler   = proc_dointvec_minmax,
+		.extra1		= &zero,
+		.extra2		= &one,
+	},
+	{
 		.procname	= "ip_nonlocal_bind",
 		.data		= &init_net.ipv4.sysctl_ip_nonlocal_bind,
 		.maxlen		= sizeof(int),
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

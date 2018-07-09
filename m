Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 17F307D048
	for <lwn-linux-doc@archive.lwn.net>; Mon,  9 Jul 2018 12:10:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754474AbeGIMKo (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 9 Jul 2018 08:10:44 -0400
Received: from mail-eopbgr00078.outbound.protection.outlook.com ([40.107.0.78]:9536
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1754468AbeGIMKm (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 9 Jul 2018 08:10:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xY4AiCOfz3tzLFsib9tIYdQgDc9z11USEsQZM22gFE=;
 b=UqIWLf89V72pnIVSGPzJXijYeA17IfykU8iGvupGhHdRUg36E4/QrKazl0jQN4/0KuCWqs9mlKj254BpJXF7OqkNH1Se95gqLEToYqifgcS2j+Z9nSccZDFAJwxdn6F03ruCAaBCtE4HhUufU/wMBtEY0s2jdR0Aku5VEi1v4i0=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=petrm@mellanox.com; 
Received: from t540p (78.45.160.211) by
 AM6PR05MB4183.eurprd05.prod.outlook.com (2603:10a6:209:40::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.930.20; Mon, 9 Jul 2018 12:10:39 +0000
From:   Petr Machata <petrm@mellanox.com>
To:     netdev@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     davem@davemloft.net, corbet@lwn.net, kuznet@ms2.inr.ac.ru,
        yoshfuji@linux-ipv6.org, nikolay@cumulusnetworks.com,
        dsahern@gmail.com
Subject: [PATCH RFC net-next] net: ipv4: Control SKB reprioritization after
 forwarding
Message-Id: <7f3e78990fbbae15da1b1269eeb8ca081ee72b4b.1531137972.git.petrm@mellanox.com>
Date:   Mon, 09 Jul 2018 14:10:35 +0200
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [78.45.160.211]
X-ClientProxiedBy: AM5PR0102CA0021.eurprd01.prod.exchangelabs.com
 (2603:10a6:206::34) To AM6PR05MB4183.eurprd05.prod.outlook.com
 (2603:10a6:209:40::28)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65b43636-231a-4f31-a13f-08d5e594fca9
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989117)(5600053)(711020)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(48565401081)(2017052603328)(7153060)(7193020);SRVR:AM6PR05MB4183;
X-Microsoft-Exchange-Diagnostics: 1;AM6PR05MB4183;3:v+4IMuxuEIyphoIqG5rcWiiaJ/AVfAvax3E9CQqF/5HOlYv9SWhCqUVfvp+R7sIBBFk8uAsGF5sufCWD7XQeEy3JSMctsQm8C8MCBVnOzuignfp6CEj2897R+LK9L4fGqdVbehsX8tC9T3RmibgmLmvAcm6hbSg8A4zTSQ23/wONbgvZ/X4trrf+N9kTdIWJGFf631SqwaNSfrgIQe3XhMPgTueNtGUVUZHfngWZ/tGzpXpmjTd6uf/RnCaifE8t;25:8Te2v2op08O6Nsmrs7oC0iBCMWpxbhMxBoO2l89l/NzdmDdNnSh42hbs7pdc9OsK18rll3TABVP3Q615+++JcRTt7ZZ4EORighyiFY9sTn7ni6yLuIyPYSYotn7iUM2Y/I+i+JNsGR+VoNsIzJvqIEiE1aviFhPWWAnzCfAdSU/wtwtKUtUkyT0YxOj7jS4rSwhK5BNQlpsAcDKpVDzWloFVH7F+PLCMg+FR8SJugWesZxI22b7gRVQKVmSFmJT3qAqRGc6EslBu3y/g1MLkLxQPhIfkmBt5deS+OgstQqkXHPgtM7wnNoK7Gj3gvMZNGTE6/VLmvX5as/wI+v6ETg==;31:01yeQ24UYHNBmat6cbsOkyaV+8+UwSfv5DvY5uv+ZKDLUP26Wkn6uTRvDzpDQsOhASap31HhoLvV4MufLtUDd0P0cFKCdD6zMxkotabhbmOLod9iETONU3KZKmAPTJT0esDBL0EKtU9Ew2hdvzQI2w7fSleAzqEmrxXhQuwg/fwlHVZM5o+HyAmZJMSdTDbjOqwXI5W8KarBXrZ0BoOlqVmRzqtxcVYANOfmk3+o05k=
X-MS-TrafficTypeDiagnostic: AM6PR05MB4183:
X-Microsoft-Exchange-Diagnostics: 1;AM6PR05MB4183;20:dK1oaqi+7tCi7o/4MMIP636b43ixtXBZzjA7YmItaGn6obMcAs5fHIkDhSMzCglY+VpXxXdgAPSRrIU9XXYPTzEbEezo6oU/fyXbG06UTuPjFJThzpTTOXkPyVXGszQbDSP92OSrOwmyYNY3+wwGeVHOLSLuZ7/zzuVaFBCgToIX91d5CdyQzlxVYMLn1XxZB4v+4xVFvRcw5joGdkWAlSFldSZpd/ouzM1NKJQpbNQbBfz7dN8l5qBBqPv1USAr0ebtPQe+b0hNk+tiG2n96It6BdOCOh+jVamIhyKpfGnW2PmN+zaFkPqZVOeubXQcSkdCpLlv1niBc6YCuTJsmtj3sVhgFVgsdmxXPedMQgpfS8OuMHIGlETtjkiZmoYsW8J5zIyP0ruOYtWkgFpMppEwbSwaqTxTR3EqES2rLcrCXaPi7Dm7EyMh4QkylI9Sh7JlI/rYPIh3lPATgyFQPxv7fk80ObVkBCyMmuMuH152jH+AJ6xWG0lSzJdzlbF8;4:8ctpdNYWu8Hp3PN48YNGjDvO9IGN8sWCj/0dWWxxuMxCrouIqW6xDaorH6WOIVSYv41VMx4PY8QbV4LZ+zS8HYpPzg8vEkxhjPD4q0rKuDzvdOAGOBzmsTFKpuiWd6tiYemILEFXviUL4wd28waN7LpnoSDcf+ZlmJ/RfuHDnnpqRX2W1anr7XbpidPYW0uUTkWltUZHI+5XgknA+RFRYbxAod8ua6YdzHsu5gBBiLisicQ80lXbvxHF4aMraKS9C57xN/BC8PFeJdfYJpbUow==
X-Microsoft-Antispam-PRVS: <AM6PR05MB41839B951F29672490B3D39FDB440@AM6PR05MB4183.eurprd05.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(3231311)(944501410)(52105095)(10201501046)(3002001)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123562045)(20161123558120)(20161123564045)(6072148)(201708071742011)(7699016);SRVR:AM6PR05MB4183;BCL:0;PCL:0;RULEID:;SRVR:AM6PR05MB4183;
X-Forefront-PRVS: 07283408BE
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(39860400002)(366004)(136003)(346002)(396003)(376002)(199004)(189003)(8936002)(118296001)(4326008)(81156014)(81166006)(36756003)(8676002)(2616005)(53936002)(956004)(7736002)(6486002)(86362001)(486006)(476003)(66066001)(39060400002)(51416003)(52116002)(48376002)(478600001)(305945005)(50466002)(106356001)(6496006)(386003)(105586002)(25786009)(68736007)(47776003)(16526019)(186003)(6116002)(6666003)(3846002)(16586007)(5660300001)(316002)(58126008)(26005)(2906002)(14444005)(97736004)(217873001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR05MB4183;H:t540p;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;AM6PR05MB4183;23:SMkjg15Dsy3RjTLL1vxHIY9mUmks0/uoJILxXJT1K?=
 =?us-ascii?Q?q+qMPyL31dfggOqPAENeoOE9aGrgTPefKvairkka0MaiOQ6hpiUD1TNPXpQO?=
 =?us-ascii?Q?ansx+HxS5o9Ow/nlG+x1bW0srbH4LFyT1vcITbdjFkNtVW+WPzceOP+vt3v3?=
 =?us-ascii?Q?ZAQW5yNtm64w7tcwmNKcsulovZWzdSSdDFJFsLt7qiG6NJR8JAHsHAO76Viw?=
 =?us-ascii?Q?F5c3JHm67JWwEynaSTp4Lgs3kPo1NEfoHPogm2j4OzTsYabqKIq+kbszeMDY?=
 =?us-ascii?Q?SmmrtyVfV+DSrw/gImelxWEcJjLVRzfMjgXPd35bj5v1h1hKnrRTCTVuJVt+?=
 =?us-ascii?Q?+ZP5YiK/hOexun+VTgvtCXATv0BcJNvD9/tb2l/NR2bo+QvvN57Kb6yF4myb?=
 =?us-ascii?Q?9NKyUAQGEAfavzYX2vZyfHp0107CImK5fPjfkNLwwhb39YnFnQXfaVDvJgmi?=
 =?us-ascii?Q?bM23GipVKwT0n/EIcjRpF5+8jMGDt3miENpNue9Sp5LsxK3AUKWbhlpjCfVR?=
 =?us-ascii?Q?iHxZyoytaZJCPNy2lD0tF7ufZHE9sYOZsX1YnXHNvzWNOQbOq+ufvPfBx6nY?=
 =?us-ascii?Q?gBZQohnL4iAoo4t3VgY2VBMXH2sYT7mlwcXMCD25bVWKaxWPiBfYcwur3GUG?=
 =?us-ascii?Q?VE57yGmogIj13S02zgt26b9fZ02jr4smnObLZ5q+hrZ/1gQQ8b2TQWbZ/Zev?=
 =?us-ascii?Q?Z8ckdJ3ErT9pTkBVlZ9KXicomDdewD2SzadRNYYFR3Q+839hpMbGmJz6Umz4?=
 =?us-ascii?Q?wjt2HLcGOqJaelysJTP7LejRR1Tb+5ueJuTlNlU/k45DoBNIt9It0svX+vkG?=
 =?us-ascii?Q?k5ynLXCPaQKDSzDU9XBdQj/631EFpFqoHKs/m0NDRqQxA+h4UDIEwBa0q+mg?=
 =?us-ascii?Q?/twqBITQXTePjGRgiuk4U9WHlimQsq2u5PQBQshou3HIBPTQe2zi+tcq+4YG?=
 =?us-ascii?Q?KeHflV5iglXbYMZdzjFHw/Dn8NjlrXm7yH2Z+jjsXJA17odmPko32tfC7zhn?=
 =?us-ascii?Q?l3Lrzw00tcGkV2lcDZrY3gU8lKObDQ6tLcqK8o/5OFiy7mCSY85zhrUf2RAy?=
 =?us-ascii?Q?Mev2za+JqQJQN6vvUTZ2wM3KFbRrIUz5sBrNSq9Bu1oyO3U3q+7mC593VLQz?=
 =?us-ascii?Q?2fUuudWsV46bxQBO4MOaN9600yVM0tIVUPKk7wtXXz0VV+NXmgE2g=3D=3D?=
X-Microsoft-Antispam-Message-Info: vkl7fT3IQBIE230GZQVztWQke4gp5dLiaQxJb0AsqOusJZgmkVnUENbCDNRejpx+iViwgOuycCgM70ZX5ue5W8f3x6pdDI/p3BdErPRmtcQDFb14LMILfeVXzcDhCVZ6GDBqSUTne1R+SQE1YyQPg6gLjelFFsJxFbNg1jVlxH9j+YEcR1qMDIZ3lxn8M6OuJYvdJYBWrlg903Eq+rOevQmSa08L9T0VqWrDdPhjMghAj0Wp8XjkArjazw59t9xuJO6800QftsUMIVNd+k8dT3yGSAXWprQRG8PzPh9HDrcLMQoNfYp3QiVe1Aq93Zt95sfgKfsZB8G3CLQy9U1zs9mViRCp8A0J8jqvTICGV/A=
X-Microsoft-Exchange-Diagnostics: 1;AM6PR05MB4183;6:SjZLVHWjKp+oNcadl69og3sSUcGMHH9rfAzVnkiCTyI9dMIVnTKfXXzxIAXB825p3JbPS3ljMxSmy9WG0pekGeNFxw6cjO4ltbdaKSsHAS5N0ExVTJwY99RV5iW1awZQIKE9cKexlcKdd2fM4iftFKS+v1jCJcvMNfjg3FdTuU+OPHQtCBiqFvahMzxktqVztxIiptjs4GMdnWogcKcI3//4S8UmsOmp2zNG9j8jAjd1wtfIhCuCW3xbHCPEWMGD/nZelmajUXgMO9urQkgG24FRSEbCyL6a/zUUeG5WVQDRDfYKqLTvNmytlbT2VOn0hJJoHb3HH187H6BX5kB8UpVknDEdAkFLRK6SDoQLzwqQmk6U9ttSaW2/jp87YSJpWV1GnzuIHsXcia5sgBe6wVxB7DyQKNUM6cwXMY1Gj97GsRqEG22X9AED/Eix+QjVgDED6ubFi/M1AfPii1Dq0Q==;5:OX2nKU2TEI5Tm6Fs62bjyeSbgQiCvp4cRaMaH7bQHorviA9iLTI189yTfCAy8m/mEGFY72EqszN9g8W/ldy+5bnWFD1ktsijCuPJ+RQq49GG9go0A9mJWr3wMVd3SWEEnCGi2SG8FTOTqARremJnDU/10J2GLdg9X4VKWEeI0g0=;24:B8kMCk7/mJVhn3vgPGkAiewRApqC9WUgoFusz6ror9DO/VFOUqdsJi+o8EG44teiYeNp0d1Ij0eIbT1ivtqBLJ0v5OILwPRIuevR4UwNUfA=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1;AM6PR05MB4183;7:LZJ47xeaZNDkl2rK5FHf32I3Rdlae7iRXIcVc843wJQ3COB7RtYWdndqUN0Qa2xia0ih+XOEcvLXt2JwWLvfg4+1vZs5fZykBKrIgpN1BqpjrZld8CWPcvJGzb1o1FTiqkq0TD/KuUaJT9hFgOxm6xlL9FBjcVGkkiGNIBLfyQ95xyaxmE45FyypNNfvr+2hsxmspe3qQ5DDnaCLdd8l2FJEs4OBEjs3BTYzDTH8aDt7YjJ+IifciSO7gSmqInib
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2018 12:10:39.5666 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b43636-231a-4f31-a13f-08d5e594fca9
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB4183
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
---

Notes:
    The full (non-RFC) submission would also include a notification chain
    and mlxsw support for these notifications.

 Documentation/networking/ip-sysctl.txt | 9 +++++++++
 include/net/netns/ipv4.h               | 1 +
 net/ipv4/af_inet.c                     | 1 +
 net/ipv4/ip_forward.c                  | 3 ++-
 net/ipv4/sysctl_net_ipv4.c             | 9 +++++++++
 5 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/networking/ip-sysctl.txt b/Documentation/networking/ip-sysctl.txt
index f4c042be0216..d1fdd2c3e060 100644
--- a/Documentation/networking/ip-sysctl.txt
+++ b/Documentation/networking/ip-sysctl.txt
@@ -81,6 +81,15 @@ fib_multipath_hash_policy - INTEGER
 	0 - Layer 3
 	1 - Layer 4
 
+fib_update_priority - INTEGER
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
index 06b218a2870f..6de1da68ae02 100644
--- a/net/ipv4/af_inet.c
+++ b/net/ipv4/af_inet.c
@@ -1801,6 +1801,7 @@ static __net_init int inet_init_net(struct net *net)
 	 * We set them here, in case sysctl is not compiled.
 	 */
 	net->ipv4.sysctl_ip_default_ttl = IPDEFTTL;
+	net->ipv4.sysctl_ip_fwd_update_priority = true;
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
index d06247ba08b2..56277539b919 100644
--- a/net/ipv4/sysctl_net_ipv4.c
+++ b/net/ipv4/sysctl_net_ipv4.c
@@ -655,6 +655,15 @@ static struct ctl_table ipv4_net_table[] = {
 		.proc_handler	= proc_dointvec,
 	},
 	{
+		.procname	= "ip_forward_update_priority",
+		.data		= &init_net.ipv4.sysctl_ip_fwd_update_priority,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec_minmax,
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

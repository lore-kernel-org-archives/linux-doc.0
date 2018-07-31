Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2C1F27D085
	for <lwn-linux-doc@archive.lwn.net>; Tue, 31 Jul 2018 09:56:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731387AbeGaLfp (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 31 Jul 2018 07:35:45 -0400
Received: from mail-eopbgr30076.outbound.protection.outlook.com ([40.107.3.76]:2800
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729784AbeGaLfp (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 31 Jul 2018 07:35:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GnxTotn+YN8g2t6ttt7rTbxME9SOAlGIn5wyp1AGiMQ=;
 b=a2gCQ5kZrvCIcWOvBVF9rYDIos9z2uieqQWyvTFcWl6URt4YrDT/5/ViUEtinF8l1ibObEESnwA5VVruXUp4uCANn9tpPLQYmPQpTtMFTtAPQUA4Vbl2l9Of4bHt87wgCUhjhhgFEkFx11mkZKASU438dIaMJDJ9Ox6vIambN0U=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=petrm@mellanox.com; 
Received: from t540p (78.45.160.211) by
 AM6PR05MB4181.eurprd05.prod.outlook.com (2603:10a6:209:40::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1017.14; Tue, 31 Jul 2018 09:56:08 +0000
From:   Petr Machata <petrm@mellanox.com>
To:     netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Cc:     davem@davemloft.net, corbet@lwn.net, jiri@mellanox.com,
        idosch@mellanox.com, kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org,
        shuah@kernel.org, nikolay@cumulusnetworks.com, dsahern@gmail.com
Subject: [PATCH net-next 1/7] net: ipv4: Control SKB reprioritization after
 forwarding
In-Reply-To: <cover.1533030830.git.petrm@mellanox.com>
References: <cover.1533030830.git.petrm@mellanox.com>
Message-Id: <56e17ee7750b89ff350735ff7cbaf14c63864586.1533030830.git.petrm@mellanox.com>
Date:   Tue, 31 Jul 2018 11:56:03 +0200
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [78.45.160.211]
X-ClientProxiedBy: AM5PR0701CA0021.eurprd07.prod.outlook.com
 (2603:10a6:203:51::31) To AM6PR05MB4181.eurprd05.prod.outlook.com
 (2603:10a6:209:40::26)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5fe9f57-48f0-407a-e876-08d5f6cbd6d3
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM6PR05MB4181;
X-Microsoft-Exchange-Diagnostics: 1;AM6PR05MB4181;3:pZ0OjXxYzOR3jwnn4vAK/85hDMYYbulbZhzufTIR/ldot7IRMtkAZqMsszhSMClAVfyLd2IoyXibIjGw6dzWBeIlEB+Ltbf/XpzithFZt3ORth49/gtbGW7PjEfcu/NAyeUG7Bwifdt2731traaL3yuxX3bu4dt2FEqYAS2zWJ+3uigHbu9y0KZ8Ihu83mEtoYfZVYVWiGSvKy8aqhlykL1gQQdBykcJILrPV0Hpv+v9lps5FIKb9DXRCgvSFbRN;25:XBWLzXr5Pe/avlaaBHcR9baWBs0a+kqVGNwOdJIGsbP/7H0psxfQOVoWc/dzco4+0ZIgrPTcJGwPUY8WY/7n3ZL8fm3wQyz/SAQhIM44AUGfu05nRgLdfOOWE4jt2VePor2DDlswAjw2JLxJpwFURHhmROPBwcT0PTZTuE5ot1xNUoQau9fKtJlvIS/pk+onEGuIFsm1t0/nQQrUcCxu4H6RrDsSprm51X0ESFUFlywy8sYuswkup8LbyF34uJlzsOPTTSnCLVev0D8KwZijdSefUoAaZ6U/eBavBrtkrWsWt33pWKG4Q5040BuHbRRPhUsaYaR+ABNrkDxnpi2k3w==;31:tTGhqsQQ2iR8+P1G78FhUBm7nPh/zWd23FyVJoLdXx72J7eyMO2FCEXO+xY+S/W+/UyNohHeSpuzFahuqBnnveThHZfd45TxPxkrvOuDd673DxDcfkGe1RnmhvbvbhK3GufFvItOvbhRUnu4e6Jrl6eL/4D4r2ufAQQD0YRBiKtqAHbZUA/8gSsPcWfQi92V6VZYlKD+dDXu+cWyKSUAdupZhtk+J/WxBF2tRBtO71U=
X-MS-TrafficTypeDiagnostic: AM6PR05MB4181:
X-Microsoft-Exchange-Diagnostics: 1;AM6PR05MB4181;20:ACgZucd9uZ3mUI0xA8JI1SQOdPVQQ2r5BCr+TBNJOd+H52wDtHTIfy8hi/810iw4bD5nsqLA0OQL22xOTjAS8abzjTrrvIklYW9TExw+Bv11i49TzgRjqlcSGEcMLXfRItFMxZ+EY1fvFvZIabOdqX4CsWNMBLkFA01GU3MLL+CFfu5GnkRUTNcOrIzKQmyjxb3BEn9RT2ib242wLDDmc41s5U6vqiNEf7bgG97h2dnhF7y3+GmIdfWIJkIai1UDOS9GaqGhBsWPG7Rl0SlH3KynKdl39ENARVu+YEKbSqe3tHZUE7VEjLexdKVRvtJv8xifZnH7DckKezdtXWdHgUSmVRukuFbdGJXNZnHj6Ys9CT2lSIHDw0+O0rETCJAssLpn6MNBtnjCu3Igt2kpd5t4cvcMJcAd7+/xBigT643z1sDWxcVKE1vzhpiLS91aY2GZ5NyKdB7ws9gVilegwE7QsVuaq/iA8zmJVs1Doa0hc0fxoYAbmbQ0ic0fdwgT;4:2PVgViffXe9h8QsFPqWHcrdPqA3aSs9zhynpcXgPPEl2i+y+PbUeh42n67Gt4wm0wQYG9Zn+PPT9+V8HIQbjxHs5FNjQGG/jk5GvbK+EwC6Grq0hMxdcdR0Q6wKERj7f0EhHaDWiXuqDoDp0pmkqwqJjc2G8H4qnwVLIlDGUjJ4WoMQJon04Pph1aXRq2GSfWF07ea5y3sAD7p/AZ+JniPHxm9fn4snuSj+Wcc1S/MBh7my/qDDkZ3HDMlvfRRmg7yZAgbnvvdlA7EykypSC9A==
X-Microsoft-Antispam-PRVS: <AM6PR05MB4181B0F0B2A823C8BDE55375DB2E0@AM6PR05MB4181.eurprd05.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3231311)(944501410)(52105095)(3002001)(93006095)(93001095)(6055026)(149027)(150027)(6041310)(20161123562045)(20161123564045)(20161123560045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);SRVR:AM6PR05MB4181;BCL:0;PCL:0;RULEID:;SRVR:AM6PR05MB4181;
X-Forefront-PRVS: 0750463DC9
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(396003)(376002)(39860400002)(346002)(366004)(136003)(199004)(189003)(3846002)(8936002)(478600001)(6116002)(68736007)(81156014)(81166006)(8676002)(16586007)(58126008)(316002)(118296001)(97736004)(2906002)(305945005)(7736002)(25786009)(6486002)(39060400002)(7416002)(48376002)(4326008)(50466002)(6666003)(53936002)(5660300001)(14444005)(51416003)(106356001)(105586002)(52116002)(76176011)(66066001)(47776003)(11346002)(446003)(186003)(26005)(386003)(16526019)(36756003)(956004)(6496006)(476003)(486006)(2616005)(575784001)(86362001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR05MB4181;H:t540p;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;AM6PR05MB4181;23:0UCqS/ISBkWCj/cIABB1sMKmW/VjLWmrS9ZYmZRar?=
 =?us-ascii?Q?aZXFMck9rzSLDwq8CVMuA0LCvt3u8zJr57sXTOVlzACeTJH9X8VdjAAMbJO1?=
 =?us-ascii?Q?FUe64xKp7BAz6W9qsRjkCo0eFBq7CSx1mc65CKBBGkT1Zsm2jM2uuK3i3+gx?=
 =?us-ascii?Q?8dOtne7MRczAVDV5XIrH2ZhQMyOJv8q7vs4QWjZYEl1871LdVjMfKh1kg7Se?=
 =?us-ascii?Q?bukIoI7C5hugvfrAwH947MUMUIJ5rQRaTCbg1Q0lYU3/Aj9LHNGuhP/LY0w5?=
 =?us-ascii?Q?1kbLfhfSzIsPyzaxRT5TJcaUTEA6xHI2VRY0/Vi1NuTBDDpFP0m8iQm1qjBp?=
 =?us-ascii?Q?R0BBNcW0+SmGbPRCXGcdMWGVyvj1WuU6daPMweinaDuVljQ2QrkPeQ0AdToY?=
 =?us-ascii?Q?AQBnuE8xRTHAnq5G2PlXfEc+6C5AY38OG3eu+rTqTeNsPHbHohFOv4dVh0es?=
 =?us-ascii?Q?LgD+pvnC37+ygmW1u1wVtQioXJHFFmawiwFTazDAlM6kg4ooJZI9UBLXeEKK?=
 =?us-ascii?Q?j/A+Bl7zJi1lHPs/AEEWHWzzW4RLmfCIfpsGVvb78qrI9lQqHQVa3TR5QZj4?=
 =?us-ascii?Q?rui6H3JTeZ1sPnzbiQHaAgGRcOxoXTUiyyeVLRhxb4VRuKYYF/l2F9NnsWzi?=
 =?us-ascii?Q?BHyprRn3SGTkjswyNfrm/yu6n9fEA8/bPqCVJ5/pYns0Jp4A6+iWUwdvsShM?=
 =?us-ascii?Q?4cIfFXm26JsLSN5bCvUYrqv2M8N0tzqDA2akhTrKMQa6IbNhPBsXYI+MLWGo?=
 =?us-ascii?Q?QjPAWkqGR5k1fvjxA31KXUwQd18B/6deY1r0BAqtc7KYRt5PD4nOV8eaD6i/?=
 =?us-ascii?Q?+kfq/+8uqMIoJINCJQ2yCdyugLEyzFslp4N5kkDv4hYBIufce4sM1ZEOMHbd?=
 =?us-ascii?Q?/Nsaxkvc6JYvD5RGD5FoY7/HPUqCp+RAsw1jJmGrZvfty9f4lNsJdyzDfjr8?=
 =?us-ascii?Q?q5E3/JFM6A009wXBj3JblPPnc/eU2SMWo+IZk4/V8KDYzT9dzYT5AZwKh0t4?=
 =?us-ascii?Q?ATVYenQVZYxnyJYlI2Z+3rdhIaB4VXJ3XMsK3xuoZyV47EOAesvAN4l/xiLa?=
 =?us-ascii?Q?8+qweSeT2ZqteCWfNAu74N7Ur3JS8UWTpemZ7qki/w16hWvU1IScXky0KL0T?=
 =?us-ascii?Q?aKBN6o+gpab1U4nF6WGfOBiG2AQ3Jod3/5i08nHokEX2k/xWJFZXkPpZtEiY?=
 =?us-ascii?Q?ed4s1n5ojkc3nJ9mXQnI0xnnRvveQ8XRFobV2pXQc523SydndfqwDhftXqxO?=
 =?us-ascii?Q?88P95yZduhhd/az0Zg=3D?=
X-Microsoft-Antispam-Message-Info: iPK5c1ZWBP7vD8X6ev/qKF/al7DCjUHuOq+tEh8TRxWy6vcJSUdI1E+l0QT5s/6PKerqns12InH53lvU2+xK3QddjEEZR7nk5YNbfG0ACCV7VtzOLeh4thgrw6dsWE7FyJrvTfoLGXaLdzoDXjvf+vV8IaHgxL7WvlD9rynxxO23HFa/Ct11KIGASc61f5ff7U3sooFNVq44XcuD5fM4j1clhYiGXp5eEX/+rnKUvfZKip/SU88GzNW93ox4Mt41VRTxypVXG+nSa5lJDJCLPfNJssTbQCSGDJEbcnlQ3ISP6VSxaMgaTdu4XieqzzXF4SnMMZswaLarDzKNsGql5SY7nNk6iPktRgcEvBlZePQ=
X-Microsoft-Exchange-Diagnostics: 1;AM6PR05MB4181;6:2FJ00nSRR2Q8E2WsV6L55UNNp5uTBsKvz2burYFmeSRZF8GF+waApU+QMoN5w9hChVmO4ojWoUqD3NZjMA0phXdejssDRxQVEdO+Ayw7bsuqmEskVGvyfkv8E4MML3AnSrcmiU6GcuraU0OXOrFqrTq4/J74MBknEFvt063MAmUq0TteDipj5w8HK7q8xd884eOcntWoQRtLb0zjZnaoEwh0lmYkvDmGCHUbKOm7RoKRROek4vZy6v5BMljAjb7qxC/0rH3mvJkZMXZcW9AfudvI6J7QmJFczt3OeV7adD9xsbk8psm/3QL535+dRZprD2VUNKJGMX+8eGIr19y9nCcVaSHeYLACxdAKGTe48xrxTqCTCMJiSHk0ZvYyHuqXl5q2plCbLsBcDABjdS1PiyqIfCf+lcGVydVnlY2h7TJCvHjahEhkwx6eXLhE6TV7Qg4UTbYpCLpFe3v58u2giw==;5:lns9LxljILmxyxMBH4Yu9xbjNfdaBzgZdyo9dwmYtlt7TEsecF37TQ7jY4Cd/MdeO5Zc+02X2tm0+rMQOae7naJhaAJlHsBZiKy4q1dCbFucokCRydObi7h2P+hV8zJNB0clly3IqSRBWigo+B7WL48aunHcu+WEmg1JvjwOZP4=;7:OeVTtmfuYIq4z3bydGAgkOxnJuDaP3YEyrL3fIwOi9oNINtpycpQ7e5bo4aYJ7NqsJbIXYslD5WeY5TRMMFQbPGWAHGH+yJaQs+rrBZ9afBIjLRTHuvPdQWcrNZBlcLgoneDIwPchsXHvsMhkcjhe9OTvyfolrOnyHW1V1xeOP734G7CojbWNXHyVNdMDL6sr6VlDmg3wPavp4RgBLJfjY4ADTsdZrRukMxM4tLxmxyJjhd/8bm3xaeyJ/LR9PqV
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2018 09:56:08.0224
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5fe9f57-48f0-407a-e876-08d5f6cbd6d3
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB4181
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
index f2a0a3bab6b5..d3cfbd89ca3a 100644
--- a/net/ipv4/af_inet.c
+++ b/net/ipv4/af_inet.c
@@ -1802,6 +1802,7 @@ static __net_init int inet_init_net(struct net *net)
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

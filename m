Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B5C987D072
	for <lwn-linux-doc@archive.lwn.net>; Tue, 31 Jul 2018 09:56:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731638AbeGaLfw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 31 Jul 2018 07:35:52 -0400
Received: from mail-he1eur01on0045.outbound.protection.outlook.com ([104.47.0.45]:62304
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731500AbeGaLfv (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 31 Jul 2018 07:35:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efwbVaSQFR5ERFmo1RdtxQiWHzsNe1jz5NOKb1E4snA=;
 b=RYRjRW0p+iBmH+jA/QAkUkBySQgsBWCK56cybz/qN7alP9c88IwOMrTJLAHDo8b4G2n8oguyzy4OROsuqDxzQb60kd8F56VJ3/NhJeFsZRryE9K5nYzTcuSrQJ/ofiLyURdyIOjgUQUs4k3onM9/oPVO/uDFTVk77yvgFfbBwcg=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=petrm@mellanox.com; 
Received: from t540p (78.45.160.211) by
 AM0PR05MB4178.eurprd05.prod.outlook.com (2603:10a6:208:57::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.995.19; Tue, 31 Jul 2018 09:56:14 +0000
From:   Petr Machata <petrm@mellanox.com>
To:     netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Cc:     davem@davemloft.net, corbet@lwn.net, jiri@mellanox.com,
        idosch@mellanox.com, kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org,
        shuah@kernel.org, nikolay@cumulusnetworks.com, dsahern@gmail.com
Subject: [PATCH net-next 2/7] net: ipv4: Notify about changes to
 ip_forward_update_priority
In-Reply-To: <cover.1533030830.git.petrm@mellanox.com>
References: <cover.1533030830.git.petrm@mellanox.com>
Message-Id: <849e91253d822f6f37aee1688167de08418ce1b6.1533030830.git.petrm@mellanox.com>
Date:   Tue, 31 Jul 2018 11:56:08 +0200
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [78.45.160.211]
X-ClientProxiedBy: VI1PR08CA0132.eurprd08.prod.outlook.com
 (2603:10a6:800:d4::34) To AM0PR05MB4178.eurprd05.prod.outlook.com
 (2603:10a6:208:57::27)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90dd4098-ed8a-41ac-21a4-08d5f6cbda64
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR05MB4178;
X-Microsoft-Exchange-Diagnostics: 1;AM0PR05MB4178;3:/N8FCTQ+meChfYGDrhvAJqHSaoKct9Ob+6JuOCi4EaTXH6ClchQX5okB5kpzSZk403PXKd3ZyBuM55SGqx22gZpeO78dkmCXmF1OL9lP9P893gzOTPJin4oWTsoHcGPNJLcRQmBB0HF6zqzM7FkALMSLl+OKmFDEDRNUxJ0NH4ZAi5Alrn9JAcQMU3sfRwdQwZu5asbppiJp1PElFf/XvnNgvhLHbFKXlb6ghgcvde5wshNE0/Y7a6E89uZNPLQF;25:b7IiQvqPaxeDF3nkrb9fftQ4EN40NMRbkZeNS8ibtgTW7Mniuv/sIqWI5qZ+XkaFQNNkkwsGAVHk0Yk+5j51x0WpaMRlBG4k+rrQXyVEOYBuH6ti9SvWC9Nx6IRO0cKHr2Nrv0/FRuyLNQ+Wiw8ENeCGRyz7e6G6RaekMOFzTPELdwBhROMcDiZtbo+yfKPCd8GXiJU0ppPpXETsCEY2NQTa+L3DQ11e/vTxAi9HSqTH1j/bADmZ9VFB9UAQddxrUDM9VDXNJynTKabbLYBlCYvNhjedc/NNHhq/rY7xeBANqFRfrjRVDzaRsCruN+/b1/6mIGMrMVPqacf+Vu/CJA==;31:30SULn0J9bUmsXJRHHBzQxICvGo1PBcqoLVAjXuARkCTLegnWK2NUetxwRk2pRUkLsq9m9NJa0v+hRGrUPHmVEjCNx4zNlyofyFYgnTIltIBYIpNR/MJsrpkIMjm+Fb11jgukFPRjCbZgxjKWlEYjLk2PvfIP8B6zM7UfMp7dkk+NsnZgnt2fqfYKUIgNjASx8a651RSKezwbfrpRguSqxlOaMqJOR9HAzdlxs+uLec=
X-MS-TrafficTypeDiagnostic: AM0PR05MB4178:
X-Microsoft-Exchange-Diagnostics: 1;AM0PR05MB4178;20:Z3WKuCq/MgWy7y3YRu/FLkAQOd9qQFIuKhU7tbliNXztDdAdRgpYARqLvtiTMwjPBS0VyCn8rM0u7yaxUxAR0SBVju8gUbIPD8MQ5LMgAUU/VwaOXmx2Hj0LNZPW7W/kVsk/yY+Ik6gsSl428BooFMz0DL80s/nEWmke97ubfYAzX40VtKeLBw3Pyh1UWOdJP1zL248Z2zVJQ5pvGNpayTmVj+aDx+sAgmRlC1oWuBRFAS1nehGZs7v+2RwyZuE0gZneHzUv6pnL+cOI0ZmQSJaXCt5Tj6TPGo5Aa8ciRQ0Sm/i0ALJQ3oTKpWRY3Wqj7kj1fKyP4+Rzsk6gO4oNdNwos0Uz/G/6cdcHJn+ePMLyli2Ph6TZZChkx2jnWcmaefG8y3gH34RdnbfZGE35OmFZtZtj+68/JDysf0Aw1YRkKMZYQokZyYns+CJGHP5L51xOkL27Iqh91XrTPbHPlGdlBlewrrp7TVS0z3wUVqll7cnMyCd5TxCzVVsEpftm;4:DBVPwQ5YmnGIScepFUlUUkSC0RPLswEC/BYFkXjbcW7SEoRRqAqTVdgAzSBrIWmHqN5vvgXktOjSTkuMTuNUuc+SpDRUzaEEwImgsBw+NEL+QYBj3pSme9HvQvdLi7D0XVaRYdYuCik/mnu4BVu8mr42czqo5rWZP5d644BmV3XEUA6X4fflct/afjsDuIMTKVxhK96N6QmXVA9ROCRX7Zou0tZH1+WDMW3mPX8pVPM46oE233YfWYU/LLnW2bjTTtD3Tyq49Tg5nrUQ2D+DVg==
X-Microsoft-Antispam-PRVS: <AM0PR05MB417816BBBD16542A5C57B27DDB2E0@AM0PR05MB4178.eurprd05.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231311)(944501410)(52105095)(93006095)(93001095)(3002001)(10201501046)(6055026)(149027)(150027)(6041310)(20161123558120)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(6072148)(201708071742011)(7699016);SRVR:AM0PR05MB4178;BCL:0;PCL:0;RULEID:;SRVR:AM0PR05MB4178;
X-Forefront-PRVS: 0750463DC9
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(376002)(366004)(346002)(39860400002)(396003)(136003)(189003)(199004)(11346002)(39060400002)(106356001)(26005)(6486002)(25786009)(52116002)(5660300001)(7736002)(118296001)(305945005)(51416003)(316002)(76176011)(4326008)(97736004)(16586007)(6496006)(8936002)(105586002)(81156014)(81166006)(446003)(16526019)(186003)(3846002)(6116002)(58126008)(53936002)(478600001)(36756003)(68736007)(47776003)(7416002)(6666003)(8676002)(476003)(2616005)(14444005)(66066001)(50466002)(48376002)(956004)(86362001)(486006)(2906002)(386003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR05MB4178;H:t540p;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;AM0PR05MB4178;23:gxyjFkEpasDlrIdi4Ge7Y1qzsH+GeDRG9aGEzRlqX?=
 =?us-ascii?Q?uzvFGunE7eDsCk5XZdn3Z9vfOXz3mOZTh8AM+4SYco6HyqjqjYECVUndvYzy?=
 =?us-ascii?Q?XwR1d5Ww1TPIM3GJy1Ih4ogs3tuID8GTvzARli+XZQzRQMH37CPksO1txuKe?=
 =?us-ascii?Q?IYG4EeE7e8Ja4UzDTEsGZhizj9Sr9XbMOdRKRC7d9Ecg/zyO0bK88LGwseU8?=
 =?us-ascii?Q?d8rpM8ZrQUFiXnLneR+fNIJEe1kOVvjBj0Zx2pkgQhGIOn/PkVTauBW+HrGy?=
 =?us-ascii?Q?4L7V469Ik61KKIXAfnEnB4UcLnj1UoGFXjm4TTKEHSkhkjFBa3ET1uzR1211?=
 =?us-ascii?Q?eji2OZWbc7WkLJ0KTsIPhVVuS7+/YeW8LANOoBb8q1mNOT1c82UcY89ywLFv?=
 =?us-ascii?Q?/UErcZEz4dbadzFZwkjvozP9udsVe7QF2+cvFc3+bex7Moa1dui+89Ix/Xzc?=
 =?us-ascii?Q?kVB+TXzqBZl6o0OXVTcMDzOlRAHUUvD0dIKQrmKuMQaoQK5uTn5E8t4vps+r?=
 =?us-ascii?Q?rEoh0W8NSEA8IHp7OznNNY+d7kLpAm6yHZygGPX2MhUmkrHVWG+DILrS4QqY?=
 =?us-ascii?Q?GgFtlFjnDRL5t2unHwOXL45Ec+DC/m1y9pyp3KAgXjgpqcjGECP7kp4Bh9GF?=
 =?us-ascii?Q?PCR1Kuz0CrC1m+866IAN3CKGbT8sMT5yI2tDt1uE+f1w7w1fs5ML0FGNkx+w?=
 =?us-ascii?Q?tVxHA0h5BoEAc2evFP4UR01oJNADVw+I+g1GaR1O1Zwzlh1NW8ivqLlfLMzu?=
 =?us-ascii?Q?xZJ66tSw2FoY/aChk7HRWkzEsdfcxTLzUN5UTZ7Y2aamfo1LnGljGRtfQByd?=
 =?us-ascii?Q?mMDmcTDFu3u9Hm4oUCBVcYprz49Pd8nkqRNUFDIZmfvWPBTTzu4Oz6XF1QZX?=
 =?us-ascii?Q?daNw7YewFmy6fv+CRWrBUXlOG2bsiKzw1APUWi799f1A2WakThX6hXU5oDbC?=
 =?us-ascii?Q?X/20ioE8Jmy/h3VClP+Rci1PD03ezxvIt7eAtqXdsjRhWGFTl7WVFi2bVyL6?=
 =?us-ascii?Q?NhsgMvwabN9pY2TzbIR+0Jy0c2oya9qtImnRRQVlVBeBF6WKMbgrqECi1pPH?=
 =?us-ascii?Q?gCz0PzYJIzLFQ4sVZUJzAxAo2HrtNgwG2tbax5y5bCkX4N6+hu3vOZEg+I0O?=
 =?us-ascii?Q?QkeUL3USM/r+0qwzBQXAMwFnAv+92T9Lk1NFZeUxNyTkAk0RreeTgXP3xgzh?=
 =?us-ascii?Q?WxTFiu1C8xknB4rHcnFynineJqaWWMy9Avd?=
X-Microsoft-Antispam-Message-Info: bxLccb2ifrsWwvlDmL6buDRwF4dG5iWVfcbTEIFrbm68AtfJcH8vN79ktjicbhtEvHQmvMav8KvTbDBb8lTuGR8f6TOaWqbB5ZAOlemkigRRI8DrsCWttc7iq/SiYY1GSSyVSbafGfHTEu7vVBs+bpRXVV8PmURoBIb1HjKww5KWCBQq2pq/MVPYvnrj4WLYUwn8L6JFeu12xPn2SVISx3loVMS+ixaIDGamowlMPLqL828OCwCuwuYR4Zb1ULDp4wuNywhzQ/Xqg4JXtqwGqbdpcNoX8rmVmPu3g3SwFl/oKV8lUO299QUDSYLlsum4KM0rxe2xT8Uwaf8zPOWN7EPJ3x3US2feKEVXYM6h8Fs=
X-Microsoft-Exchange-Diagnostics: 1;AM0PR05MB4178;6:YNyWnYbx9HZMZSJjKoY34DWPQUfyWgq8DxmyrgN/3nz6fGrPcBbEveGpuG1Zck+ts5GTLveiWqQjSIeLf1R6hCL8jiCm71DonnqN8hAQeCGOKJHAl1sz75DCPb4V46rxNxyB/QezgfxnGlZxp58RfMKEKIbNCunHkb3+km/5cc/2BOAbUtF6jaM/MUmh0tMr0KC1dZ85Tn6wJ69st1b4WAwtywI7g9lBk0qLi1BmHnD7KN1e+9GwDNIXFHzHnPJUfTFCXHARqM8GBjIBn6RjE45yku47GnYqM/2B3BRg9QOmkE+bRVWFXkCneJpbuOEgNc1ya3kzN6ieo1Sh15FE4qmqUUjZnRs+9jlQ0S7sXmoYR2gQ85v2wbKM48StlS9+qCnz0Mda+07ti2xesENhr446acg+c017bJvEvy8MxeK5dMrPkT8Nbojc6ELdhdB2aONDlAFo7ugrYYvpRGyoJQ==;5:Pu0OOViatc/XG8u3nh6JQoo3IWU2i2ECQgHg6zMJPliPzqskmj80e/jkeBXW35e78RJTPd5ArgBDjwXyI6A22WU1HqG1HmnmNLc+fLQldI+gapUoTbfQM2mhIAOL1+76Wx6RQrTlBWDpL0v9l6UuM+X3MRH6KTLWBLUcXkk4Iik=;7:DbSidQsOFjW8smDXbpPbU6uwFb0WvyJKeUF4UMpAxxp+rwT4nxAM26QCaUq9WHukFNIJ2LqZaabLnYbQxiKriYYAED24mitLBS7Aq/iiW6fqBP6LYmvvbjUlNSEW0BdDbfddZD9NCYWO4ZN/FE3+eymmsZyNZkXqlwbHjgAmpKFe3XgYU/3vmScCZ40NLyL1maanqcYTit91MVg/tZG7hVLa3innxp+eD8onRbgy8vq+yds9ewMG3vbaKkiuDNNe
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2018 09:56:14.0178
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90dd4098-ed8a-41ac-21a4-08d5f6cbda64
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR05MB4178
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

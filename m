Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8B3787D072
	for <lwn-linux-doc@archive.lwn.net>; Tue, 31 Jul 2018 09:59:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729784AbeGaLim (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 31 Jul 2018 07:38:42 -0400
Received: from mail-eopbgr20052.outbound.protection.outlook.com ([40.107.2.52]:7414
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731500AbeGaLil (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 31 Jul 2018 07:38:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+7zDaDa4aZRUfreGtDNo0gTDvjJg+wUkyXctYmIpRg=;
 b=VQ9Cbi/5trFVoOJBD7AtH1Lm3lScA7AKR+UH91MiiR1fGy7HM6UG3klzBdLgKYgVWOwxi3qE2WsrlxunDLqw634Ww1mRSMAmTMbyzhKIOexcWGDevghbKJS5FCh3ymLECYQzG+86w4EAV4CjYte1Ff1ggfJoKu86A+zXrDvCvnE=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=petrm@mellanox.com; 
Received: from t540p (78.45.160.211) by
 VI1PR05MB4191.eurprd05.prod.outlook.com (2603:10a6:803:4e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.995.21; Tue, 31 Jul 2018 09:56:20 +0000
From:   Petr Machata <petrm@mellanox.com>
To:     netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Cc:     davem@davemloft.net, corbet@lwn.net, jiri@mellanox.com,
        idosch@mellanox.com, kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org,
        shuah@kernel.org, nikolay@cumulusnetworks.com, dsahern@gmail.com
Subject: [PATCH net-next 3/7] mlxsw: spectrum: Extract work-scheduling into a
 new function
In-Reply-To: <cover.1533030830.git.petrm@mellanox.com>
References: <cover.1533030830.git.petrm@mellanox.com>
Message-Id: <125dc1a81caedb1a705953602c625f0cef77328e.1533030830.git.petrm@mellanox.com>
Date:   Tue, 31 Jul 2018 11:56:14 +0200
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [78.45.160.211]
X-ClientProxiedBy: HE1PR0301CA0007.eurprd03.prod.outlook.com
 (2603:10a6:3:76::17) To VI1PR05MB4191.eurprd05.prod.outlook.com
 (2603:10a6:803:4e::17)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9300dae-5979-4515-061e-08d5f6cbdede
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:VI1PR05MB4191;
X-Microsoft-Exchange-Diagnostics: 1;VI1PR05MB4191;3:axswc8iKeqAIPl9Q24MGSCvxucEQBe063k3DOOB7vg+IN1olVUSjMCPJP+6EPIC99dI3u39ZbwLdq04N9jjFPJwcFl9idGF4iSCT5vGfitl3btZ8RNGdCcv/v0XH0Km07AQmeORHQSnseIJrnotswvtiBxMRHen5jdVi/+swEbsDEpbpL5kQIVDsvL5Qah4PL41JN86afnoAmuNMNZI+smExaEDQyW7eQl/EezOmh2fy3aLPsB94Vu05sl+Ur71W;25:4XC1eZns3u1P4cGu7HC0fgAVdIhhM1KBpkzon/bPDgi0IXXUnIsJBQa9kGme5avimfxPTcLz94nTBYEqraytjBT9D/yDRdyJm8S/Vog5XDLOi2CLHiM5vXVsOz2daMbMS4ES9yxCn9XavsMK4jW3tCHexo8XVROJasM34j1h83klKUG43sw5z77nslFYYUVA5xyWSviz/1uXDxqJupTAIVVL56rzoBo1FRSAsSYYiR0ie0pzPOGr0UK2mTb5i8h7JiIQxG8+KlaSAFeFK7g8p590riRzecrCa2zz+Nmn8TezCAPmh5jzNfhlo0DYTovs62QJ/xIvIZLxw0TS/+d+EA==;31:l+LSZGihBPZk+FAmvXpflSeDFfsfiTsVCSNGTcYAFwGRsY8b44p2v7asBSNpCTTPSy5BBbtLDnDnRfoxEni0JdV8OQILcDWrHCbgZQmzvjg9FoBl2O7j8R6au/EqSztofkmXcgoah+MAyqtzaD4cyVDTe6Vc85MFDaJMe6I5IGt/X1R2MTuCctG1LdOALaTFSg+UO/E/CIzchI3vVxShOIjifG/OcMdHHM1axqJshWs=
X-MS-TrafficTypeDiagnostic: VI1PR05MB4191:
X-Microsoft-Exchange-Diagnostics: 1;VI1PR05MB4191;20:bymF9uQbicvVfjfJgzK0c3Jbov5W25+ouwfk0nunGVGujAfm6qZQbNUsOHI8Xa0mH1CkD2BEXkmy/hAG+YKh75DkOoqTW01GYR8w7kYB9RnGXAs3d2t/Zi183+NOrAdj3EJ4b7RMLzPGLTfCpVL7r+3iFI82MBze/I51UwHuOt7dazriIGgffPhss9G5hL6ExrBZDO0xg5TTNo/a8d0ZWRD8ZS5YQMWZTxZW0Ifvu6jgnL4zkBejybvWWc7CmiMS92RRdwjG1YPB424IExol2Bs8vvyzSJ9jVJ5lVJuEXXUbUU8VreHZG0/Xv3o5c3qT2wducQ83Uz3uBHhVPUiSRauZhoryuabn9V3dj0sj5X6vBvY6/Dzp8r8aj1BG5lpwwTbRLjSpv1KOZLQxZyKkbnVuUJDL1rhtCRAZl+YtByw74Rk+IEcj8JZ/iQzzyVaOtTov9u19ZBYWv3ia2KbyT/JjwDyPPVFF648cBbtKHWUNEx5wSVeGKnoE75+Lgou7;4:0m7LhOSJB8gcOd05mG/5pexGWzkn4AmRIjh2RuKNDq/Ubm6XOAQKSvUqEoV/7pSDEs5Qfu9BWnetxG4XlLRKfMLAhZH7/NE8dxW+4ESg0pQqcEpbVwqF8JHiUJ05Sjct/V9BjCR2sr0+xOoLqrOo07mq2DQbRpmKALF6XOkC4yIauNORQLjhS4vcnkhLjDhy5/W4knn0uQNdVCJU52ey5F8glEc62n+w31jepH3aQ3shAzmreKl1CEminn1DCwo2UX1IjzTSEAsEA/6SN3weBA==
X-Microsoft-Antispam-PRVS: <VI1PR05MB419151B098BE1570D65E86C7DB2E0@VI1PR05MB4191.eurprd05.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(3231311)(944501410)(52105095)(93006095)(93001095)(6055026)(149027)(150027)(6041310)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);SRVR:VI1PR05MB4191;BCL:0;PCL:0;RULEID:;SRVR:VI1PR05MB4191;
X-Forefront-PRVS: 0750463DC9
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(39860400002)(396003)(366004)(346002)(376002)(136003)(199004)(189003)(26005)(58126008)(86362001)(47776003)(16526019)(3846002)(186003)(16586007)(6496006)(478600001)(52116002)(51416003)(386003)(105586002)(76176011)(316002)(106356001)(68736007)(97736004)(11346002)(6486002)(6116002)(7736002)(53936002)(305945005)(6666003)(39060400002)(8936002)(486006)(25786009)(4326008)(81166006)(66066001)(2906002)(956004)(476003)(8676002)(2616005)(81156014)(7416002)(446003)(36756003)(5660300001)(118296001)(48376002)(50466002)(14444005);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR05MB4191;H:t540p;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;VI1PR05MB4191;23:jrA+VcOyQzc2hn3oaTwWC7eHpAnXhkXFIcm9x9GcN?=
 =?us-ascii?Q?fFb+KP5j+gdI30b7q/9S7zvFJGbP9Zlao5CLwOR/aZLCypngmL8wd/UWu3+b?=
 =?us-ascii?Q?JiCxX6Dj1okzQ+C4YIPV3mPdVmu307fA0Vwn4KnzHE/isAWziZh8Tr85L05g?=
 =?us-ascii?Q?QAhnP0qcdYL3zEVadheJIEhFXmUx7mk2v2mxO2G4KI87ixafdTWAZh/aeKvw?=
 =?us-ascii?Q?qzLJtPKwTQSlGpwNSC2+H7MXfTnVDoW7p0rBp2kw++qbpROUjx0XYVTngEDE?=
 =?us-ascii?Q?zDF5Z61M5JtFmXhfagw0X+HgjKB95QSuxVjvCFe8ly8IXF5biNHiTqCev5rN?=
 =?us-ascii?Q?viq0D8pknMZzIae+5tg9ZKIhT1w80JTeG0vpCXkcc2MCg/3C+OncrCZPze3d?=
 =?us-ascii?Q?/eICeMZK6gcEw77X15lM/HM3wOTgD8OLAeXq21Ot6Ozu+f2H/8e67kyIpKoE?=
 =?us-ascii?Q?TiEcxJqsgvlIwA8Z0waB4QJwbD2vgU2jtqHjUpVJGd1lVBMehTR1I5yR8duI?=
 =?us-ascii?Q?DboF7HufJdMqjQX5CPa7o4bj2gyJNx9zvu82BGRiYOXieAPNSdFEvbVpipA+?=
 =?us-ascii?Q?HKJQHQWe1J7pQ8CqZ8S3aIz7KkSh6s2BDDCM2T6oeNKVkxSSQ236PERmfenL?=
 =?us-ascii?Q?C0af9qHjUxueajAfD6zP/jLFwZvuKV0+L4z9SIi6A0VWG/610Ng0n2HFjmPK?=
 =?us-ascii?Q?WDoW6l710tsYz97absjSaG5fpBcfkt8mqM7LQ7di9M/e2GD5xEkQ5J041qqD?=
 =?us-ascii?Q?Hdj6pVCzfgQdGUgGPbJtF2RXasw020eYVDLEngPlSXB1LZSSC4dRH5vSLDEU?=
 =?us-ascii?Q?h/P6o/x7W/UAQ2awAkvpEyy9pIQ/UYLItSz8c9fJgv+NliWimIdgrh6ugT4p?=
 =?us-ascii?Q?7+J9gxxsVOJtRBnjXe+yajsqNrwYD5pznOGJkIPVl4LpBjIC4KY7zcsP9u4D?=
 =?us-ascii?Q?bI3U/BulyzxZaBXpQZj6fHHXgL+0zHMOFbJ1PrGQsZQabxbQQdKOTQDn6J3i?=
 =?us-ascii?Q?gftWnxDEhUFvWNee0nAEdhdzwS3RXW+IaVCD8ZJlFsbMNTGkMhl7Ix69HGY0?=
 =?us-ascii?Q?YHqPQWz1kQM/mZR2cH8xkhrq9lYp+QDGmhhUlRUTOiKjAZEzf+DJkBEXYsjD?=
 =?us-ascii?Q?PDZW0wByAHvhnJVZVnuaigOLHMXmXpnuMHUOhQkDZDfJ+lit9cIeziNxNMwN?=
 =?us-ascii?Q?1/hw78jtb4hFOvELIhcllEaQrkWl1oPtKkD?=
X-Microsoft-Antispam-Message-Info: bktw57vrNJpn+9UhU5CAFIKD45x81NWc7q260Hz+rp9ARVNDl6GhCkTLhsOqTbguCKoJqdux/LMVWa6fy1UJMkZ3Tl/nVKyDaKJVhZpPRchYzz5sbaG6SeN3FUsmudlpAfWui1pijzA1qcdm8/SI8dsbZ+l2KJXFjGESnZsvn4/ceqJz30CSi15Bb4P+9z10FZp8mNaC2a76MWjIgaSz7dm5Zut2ft24N6JBdiA0+SVKF1+JunjqrpVXryAZCoVAxoKYoQbagJlOuzRYrkSxsClT/yT+C1D8Mp9I0DNBsqqwjeSLTIx7zDctPSuHoz+DhFcZSy7r7f5QULpEYA6gJdiAOaSqYAwhizyaOQ5b6y8=
X-Microsoft-Exchange-Diagnostics: 1;VI1PR05MB4191;6:NulpR08AhZod8JtsmklspzR6QJZFKlL7UCqtk3mZD1cLMoOHYBjiDPJyOpCjsTrEXyLR7+VudXccZ8JGCQ0Ihy0IyzpjTguvTOo45BYYpjBXhCTAQycg3m9t47nSEgN48ZdJeV199hAatt50BqF/jRgNHQDli9cCx6S9ZWT0bnIFpxKUM6CpoA5Tylckudg96snXl5/gluVb52cZ1QWI5BxBlldZdyqc6fXQkCYUpbb++jawgDn1wIBiOp5+QF8kNuyq942CzcxRacN4FofjsblwRUt/nQD7Sv+ASqP2YtUPXJ400LgqZ/Ob8Mycm8KOv51P0afMkB9OniVSW6Nrw7genx7pezFvp9ZZz4sM1LkfPgQcb6YM6SHTKuapKmUkrPrVDi5TcFrGJWOeFHM4whj3jL6/ESNmh5QKAVU01ben7wkUDqpMPtIZ9H1l291zjr3aL8g1hIbmNoCAGccVSw==;5:qHoWQf+ou5LVGSB0ev1TXl09xPmNqzG6Akwezib1DtJcQVW4VEmcUdPyYbe3A5xeJoSaDG943zzsQnJH01Rl1Cxoqlk6x0pCWI8+Kad1IDnaZtMnwM/4cHaScxalR2XzERKLfy1pFNrydScCNQ9UxGDXSFTz8B7mb9NpL4EuS2I=;7:d1lRqjfmTnQ/AefZaRvjc5hSwwnvGjPu7RVdCCeVDSveNXKzeE4vcRIFNvOUd01e5UaWy6nyG+6tknsM5D7670rvzgXe7uVx6nDrPmTg9MSju0PR8eLLkTXDAm8+ZLS3Tg3yDeDHTORMkzE2QBDPlPpEKRhqG4SylKsj+1U9NgW5Sppt1TlwOn8uA/xkjvZXNOGSMsgd6Nf86RZea27Sdzb5ugWJNzGZQ8G9XE/lPEgMP1mZfHm1crkPLc55De+a
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2018 09:56:20.6589
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9300dae-5979-4515-061e-08d5f6cbdede
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4191
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The boilerplate to schedule NETEVENT_IPV4_MPATH_HASH_UPDATE and
NETEVENT_IPV6_MPATH_HASH_UPDATE handling is almost equivalent to that of
NETEVENT_IPV4_FWD_UPDATE_PRIORITY_UPDATE that's coming in the next
patch. The only difference is which actual worker function should be
called. Extract this boilerplate into a named function in order to allow
reuse.

Signed-off-by: Petr Machata <petrm@mellanox.com>
Reviewed-by: Ido Schimmel <idosch@mellanox.com>
---
 .../net/ethernet/mellanox/mlxsw/spectrum_router.c  | 38 +++++++++++++---------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c
index 8d67f0123699..5ee927626567 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c
@@ -2436,17 +2436,36 @@ static void mlxsw_sp_router_mp_hash_event_work(struct work_struct *work)
 	kfree(net_work);
 }
 
+static int mlxsw_sp_router_schedule_work(struct net *net,
+					 struct notifier_block *nb,
+					 void (*cb)(struct work_struct *))
+{
+	struct mlxsw_sp_netevent_work *net_work;
+	struct mlxsw_sp_router *router;
+
+	if (!net_eq(net, &init_net))
+		return NOTIFY_DONE;
+
+	net_work = kzalloc(sizeof(*net_work), GFP_ATOMIC);
+	if (!net_work)
+		return NOTIFY_BAD;
+
+	router = container_of(nb, struct mlxsw_sp_router, netevent_nb);
+	INIT_WORK(&net_work->work, cb);
+	net_work->mlxsw_sp = router->mlxsw_sp;
+	mlxsw_core_schedule_work(&net_work->work);
+	return NOTIFY_DONE;
+}
+
 static int mlxsw_sp_router_netevent_event(struct notifier_block *nb,
 					  unsigned long event, void *ptr)
 {
 	struct mlxsw_sp_netevent_work *net_work;
 	struct mlxsw_sp_port *mlxsw_sp_port;
-	struct mlxsw_sp_router *router;
 	struct mlxsw_sp *mlxsw_sp;
 	unsigned long interval;
 	struct neigh_parms *p;
 	struct neighbour *n;
-	struct net *net;
 
 	switch (event) {
 	case NETEVENT_DELAY_PROBE_TIME_UPDATE:
@@ -2500,20 +2519,9 @@ static int mlxsw_sp_router_netevent_event(struct notifier_block *nb,
 		break;
 	case NETEVENT_IPV4_MPATH_HASH_UPDATE:
 	case NETEVENT_IPV6_MPATH_HASH_UPDATE:
-		net = ptr;
+		return mlxsw_sp_router_schedule_work(ptr, nb,
+				mlxsw_sp_router_mp_hash_event_work);
 
-		if (!net_eq(net, &init_net))
-			return NOTIFY_DONE;
-
-		net_work = kzalloc(sizeof(*net_work), GFP_ATOMIC);
-		if (!net_work)
-			return NOTIFY_BAD;
-
-		router = container_of(nb, struct mlxsw_sp_router, netevent_nb);
-		INIT_WORK(&net_work->work, mlxsw_sp_router_mp_hash_event_work);
-		net_work->mlxsw_sp = router->mlxsw_sp;
-		mlxsw_core_schedule_work(&net_work->work);
-		break;
 	}
 
 	return NOTIFY_DONE;
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

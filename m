Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C6B657D071
	for <lwn-linux-doc@archive.lwn.net>; Tue, 31 Jul 2018 22:38:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732649AbeHAAUi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 31 Jul 2018 20:20:38 -0400
Received: from mail-eopbgr20054.outbound.protection.outlook.com ([40.107.2.54]:2896
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732123AbeHAAUi (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 31 Jul 2018 20:20:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+7zDaDa4aZRUfreGtDNo0gTDvjJg+wUkyXctYmIpRg=;
 b=KEgL6hG4w4yr26oLhzpEb5673a/U59h61lRwGyVcjwIrqR4jUrSXpRM/M9Ptn3UBphBwkxOuBfzpNvJwW3USydN9Y1+YLgxwurOQU2yyj9vYyTVl45ARK3jvtZqACme2VeG7bJ0w5sBdayvz99jCFvRTygMFMCKoK/Y64fsbH4c=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=petrm@mellanox.com; 
Received: from t540p (89.176.83.59) by VI1PR05MB4191.eurprd05.prod.outlook.com
 (2603:10a6:803:4e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.995.21; Tue, 31 Jul
 2018 22:38:02 +0000
From:   Petr Machata <petrm@mellanox.com>
To:     netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Cc:     davem@davemloft.net, corbet@lwn.net, jiri@mellanox.com,
        idosch@mellanox.com, kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org,
        shuah@kernel.org, nikolay@cumulusnetworks.com, dsahern@gmail.com
Subject: [PATCH net-next v2 3/7] mlxsw: spectrum: Extract work-scheduling into
 a new function
In-Reply-To: <cover.1533076217.git.petrm@mellanox.com>
References: <cover.1533076217.git.petrm@mellanox.com>
Message-Id: <81de49a9f677be1d741076e7f4aabb90bbc441cf.1533076217.git.petrm@mellanox.com>
Date:   Wed, 01 Aug 2018 00:37:36 +0200
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [89.176.83.59]
X-ClientProxiedBy: AM4PR05CA0028.eurprd05.prod.outlook.com (2603:10a6:205::41)
 To VI1PR05MB4191.eurprd05.prod.outlook.com (2603:10a6:803:4e::17)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc1aa5e7-3166-41cd-31f4-08d5f73646b5
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:VI1PR05MB4191;
X-Microsoft-Exchange-Diagnostics: 1;VI1PR05MB4191;3:FLTG6pTwSORvhokK8N8DZT2iIUuoXvCdr4E8V5TIf0qGoDKCvAu2Di9o2Qb9GvxX4ah+k9dKV9g0/woiiJBvAhfUjMDJUrY/3docbSq5WaxfUWrxo0n+557J7Iy1sjtY0kbVwqh/QDvt789VSIsN9+UTpLKuS8nGNOdZds4BoAE1aqp7/KlO/dMnqS9WrdLQORlkC4p6KiU9lzxYVH/IlATyCpiNs2E77ALxCzKo9Qxa4WCoh09K37f/Tq+PSd8v;25:+scX64h2dVsAhfvDsfGS3yjkLFZXjJwtYjtI3pLzLTJBNVFMBzf6DlIb4A3BUIhvxdNrSk3IVOTdLh4sWZP2GLDtMLRggeMeuCMlcwzlfO+EG3vYav1dwA1ZjBcjIRA4a8ULOMywYQAYGXvfM+9IB6wzKwqmZMx2ECO1OJjpmHvOpLHIpMsr3mK8pFXuD3pqMuMCYcB0FfONuqecVJDmFshGqwlWJKzVuqfqQQ9+JYVVK+hoLTlHw3o9NU/C9DL0u2e5wqiCZr7jQ/OD4/KtIWh2Dub8+dGa1Q8fIrKJ4hNuQy/Gsc7SSuxV8NqSYDlVzDOg+kaYQCBwddGBAbrctg==;31:NHf2+DtkQPUMnxT9ujVTMD+tUMvXIFaY4ubmdSL+KfNo0vAUegyjKBnPvugYi2A5K5uwcRR7VLMwH4In6HpkH4khK96H6/agDJWeH8r+BCHDyZuRRzuJFj0vVGv57QCTG6yYVVgxomB++QQy84kiQI3oxeEehbjxge288uk2qG0sq3ovC0jZ5v3QCtW4nBP8RoaGctRBoxYJiFZp8dFQpqgfQ+R0ZcrcNyoili9uNhU=
X-MS-TrafficTypeDiagnostic: VI1PR05MB4191:
X-Microsoft-Exchange-Diagnostics: 1;VI1PR05MB4191;20:JG6HHkPx+VMdZhP0QWyJ799lQuDIyTP1Tk+4c3qZPfeQw/Yy7WYaPbeZe4Z9vhl3GHbu+KtLo5cd2Dh7d4r0qOtFzsejBH6UA6azTkeGltOnj3bMDGJ801nqcKlULlkSzZQVpqsxrlgQSso2zS8R9mlVmu8CvqG34YHnh3Qxhpjfs5rb47Ia4NVEihkyCoJW0U98Fzuo04yQkHtWgUKdNQiim28qUzkzRhqIIEjtu8A4OSyHiMMrrQNUodj53doDG2tzrwYyKUk267XHkGwcWNPGuuGdryjxNdqFmv3ey+/fv/rHagI2cg182cREvJGG/svE+mInqpi1oX75XRgHpxTcotd3l2Y6vuKi5to93P7vSrHkEd6VIGm7qavnNy1LB0EeWfZXPnEcFVRSnlrRUsm6lt1clExZ+0rHmiebeP4mFEeFwRilJAMs0FGZpO/DOdGUlGHR4llgbMFm+VYvgXC0tMn2nWwapmbwJSHZtD945AEEiQiXl3ncrUzJr9b1;4:k0mD891bF6o8X3lf5ueskaqak9HWi9CfV3HZnV6oAL1rEj1BBBT9ftLdROweIis4izpZ936cw9/soRF/WPzHubgzaVdZ8NCaH0LdzH74GdlFplMt2+DwYTIZXIvEz6EuYwKAqy44MEk1uKxZCQ74aZw/PYw5NsXCVJMQDbGdNNloWyRffy7HgB6ntrG/RmDvgvNposA7uCa6cuSqLmAnf40V8Z5FrTwQuq+1Zo5gJJYhzYTHIKAyo3HRJskZuwJCb9HApyEVa6DJ79efQQ/Wig==
X-Microsoft-Antispam-PRVS: <VI1PR05MB4191DD5797C460CE7D82C778DB2E0@VI1PR05MB4191.eurprd05.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(3231311)(944501410)(52105095)(3002001)(10201501046)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(6072148)(201708071742011)(7699016);SRVR:VI1PR05MB4191;BCL:0;PCL:0;RULEID:;SRVR:VI1PR05MB4191;
X-Forefront-PRVS: 0750463DC9
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(366004)(346002)(376002)(136003)(396003)(39860400002)(189003)(199004)(36756003)(2906002)(956004)(81166006)(486006)(81156014)(476003)(2616005)(8676002)(39060400002)(305945005)(8936002)(4326008)(6666003)(25786009)(50466002)(48376002)(118296001)(5660300001)(14444005)(7416002)(66066001)(446003)(52116002)(51416003)(478600001)(3846002)(16586007)(26005)(86362001)(6496006)(47776003)(52396003)(186003)(58126008)(6116002)(11346002)(6486002)(16526019)(53936002)(7736002)(76176011)(68736007)(105586002)(106356001)(97736004)(316002)(386003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR05MB4191;H:t540p;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;VI1PR05MB4191;23:hNb1EHG0gsku0K6qoTlAttLcyq1pkqQUwvhSCymZI?=
 =?us-ascii?Q?+qx4FnS3gKLNjAoNVZA2K0BqM+2eA8IoMzX6a/tB6UbKl+WSCk6JdMtn+T94?=
 =?us-ascii?Q?OcFGRF+snooHyH7X4yMa+eufD0idrNNAuPWKQUE6XHweAJ7k6OMBqsvlHp6c?=
 =?us-ascii?Q?CCTQQiGx7cDxMPopWXpl5UOJCGz6UwgjiD4NJLlQHNmVC3k/EkTZ71zoYGo5?=
 =?us-ascii?Q?BGwZU9v9r8HD9WbaR2tTd8HI+bGXYoCZCThxFVn36xsKQ3QjepeBkZsoVFos?=
 =?us-ascii?Q?9b+3mN3jlnvL7Z5EUSV2R818TQDhfL+1TEX0wE4mPF2NSLvubuCgx7IECG+c?=
 =?us-ascii?Q?0hG2fKEtfFO3/QC/l07iiSTHuu0faG2zPeS1s/s2JRSJ37BQVZ/UxlKT5AJy?=
 =?us-ascii?Q?0fncJhV1lHofQjRi6MLn1Xc+UVwmuGB89D1GsmoeieYuHQmnlz4IzxYoD9DK?=
 =?us-ascii?Q?XW8RUg3TxIXYbaefLxewO4EiKnPl1eTX0Wp98As8VX3hbGdohsWwfdP9/SMn?=
 =?us-ascii?Q?gi51NqOqFQR5FbHPP/INygMOffJ5WFkuEtBnz/BSf3zw5NWipNP8+VndTOrw?=
 =?us-ascii?Q?TkgImxT1futMy7dBlZocsf8dE7cWHZDVZrP17s9zDelKKECpgZkCR4eN1U4H?=
 =?us-ascii?Q?VUMSA7ovZhQOyGrzBiRAtX1iPQBRQMEWLp55zBZCrRfB/dJ8EoTgQDktnO66?=
 =?us-ascii?Q?6q+IiwLNcdvQxpRJdUtvWEAi8GW6GrabG4X1BD3KZ3xC48wR6u65jJdbAXGk?=
 =?us-ascii?Q?9KKvOdZ1CXnanEZmuIl+iFnnc9r6KtZBtMibZ4uhE6QSZZOdaXBudJrjb/91?=
 =?us-ascii?Q?Q1BmJNrwpXj7V9OzDiLNWoesFCx2kjBelUZMPQSPc1b7baVmwt6zJkjp359k?=
 =?us-ascii?Q?a0DFkWHd4az3xVWM16wtTTLLDDyd0ptw9cg8IoO3p1sarBAgp6AOlq4PTu5a?=
 =?us-ascii?Q?1Q/Y1/MJq8HuzM4uRyQ4Nn8uq2+j1rLqPUmSe7Fv/BaXC4Nl8RU19/kG25QB?=
 =?us-ascii?Q?Q18ml+pqmDYIDdrt/esZleFuI1m0KFD4D+6TYhZOs7FRD53Z4Q4E2QV4gBhw?=
 =?us-ascii?Q?4ZHVvELrntk1vbrlVctOxTWgf6YpEr9bR6gXEWWHQ0jgrVfqqoyK7XTSNY0+?=
 =?us-ascii?Q?gAoQDXLM3yPV+XhhrP+/H3gToNcyuY8pnzckhVk1n9IuJ0GM6ec0IgnTeDLQ?=
 =?us-ascii?Q?wFVu/YugohY2D+ZeL1PBb/E/H3rV7fFlt31vkKSMOBoTvkXDkODw2xeDw=3D?=
 =?us-ascii?Q?=3D?=
X-Microsoft-Antispam-Message-Info: sGt8NzZVxffXRZsonr3CgcDSXkAKpyuhhKkJ44Hr0G1/XKGutinTidoliOJH+uSLlX4C4UJkjCxKh5/oxE8Z9rmrFMjpzJtFNy04dsnA0JFjMI7LLju/1n/NbI12uT3cypyX6SvykfDUtXavBAPyaGdASu2h8fadvUOaxpW0NLao0AdvUmE+AW/HSCznsD+ijZmkHLGUr8sz9xVzD3/Dvge6CpRDH9WPZOyZnV6oBiT0zMGFRr/wNN1einLzVdwCGmbS+RY3CEScWYXECtAgTM1/dFSG5qBgIXe9gbDoeOUScMW54joTo8hFXnycSuPsOYCQUTo91dkEepMrhN38px0uf49OZB5mkvPem9ZPA/o=
X-Microsoft-Exchange-Diagnostics: 1;VI1PR05MB4191;6:z176vO97vyFcXUDMo0yu4rRuj+EpAQPIL2637ZYbAb8pXWeOfO0aq8Dc6MN4BYXwH79ou7lIF3C8YPPS9BagsEMOpj+NdIzxvGyQ6PB8EJu45dKY6vP4YBPGtDIjus2qaXmRproJYGaQiGY6JCt0DbAzZvTAuk7aKPaaj04T/gB4ror41cJRzjEL3RtfbUYsz1qXvloBtg7fBtYuiTiahE0JrUrxn8+zoL0e/jIGKMXYb2yUFRlK5+EM+7OZTJB6dzCQuPyqw06ygdT7Q/sh2SoDNJgF4O53ipiWyIr/6LzbKi8Zpt38nO5MwLXdOC58PIZtKH0D3eD7P5kqJbLzKtZ2++BOmhg5HovyyJLsLVgYhR3y0A+uenJEoU3xx8XpzNPuNZAsNWpDg3lR3on8CKYxSVUNQaKG18pLaf3lZCfP1bhwCeol8/hYuL2h6coKuVKLxOIYs89I1oFzqna8rg==;5:iOaVxplp03u+Q/0PJuWg71gfA+45CoThYoGNH4Q81uvARE9nPDOePgr7gVHOYPkPeB2u5N266DcNt8Ib9NKEGKvffXXd7PSiBMseOrB/zbAj4T+CDomj95J98vgzzKCcZEP4N9nMN2ewg6Z6tPHV3e9IDoI8FfWxsMMDge1+r7c=;7:q4wa7PODCAZpJoQFqSFwPR6BhhC8Dy1+xZojTQP/lTyN6WEW1zGBRTt9xE8Px27DK6JgxIc5GV9pNVX8SB0cANMLSLTOioBZgtV8H1wJroz5s/DoLJELp26PuVP8oPEwJ/z14oWMttgt9JL6VDDH2zlmx9/pYXe/DszlU96TF+GA2CcSbZv2azu+GEgf/lwQ1RI326S50h+b8dtQVKauo2KDoWae9Ul7LMUr+tSvUqXp6Xu37Avc5xks4TGSDcBL
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2018 22:38:02.0221
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc1aa5e7-3166-41cd-31f4-08d5f73646b5
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

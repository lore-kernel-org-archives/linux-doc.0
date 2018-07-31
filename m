Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 75A337D072
	for <lwn-linux-doc@archive.lwn.net>; Tue, 31 Jul 2018 09:56:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730149AbeGaLgF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 31 Jul 2018 07:36:05 -0400
Received: from mail-eopbgr80044.outbound.protection.outlook.com ([40.107.8.44]:37332
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731650AbeGaLgF (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 31 Jul 2018 07:36:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BUAValkslsveuy2LnnZP6kuENyQhpJiMyBOODMnZzc0=;
 b=vtDCIFds5HhJA0v5NnaIWWWXvawoWWy3XTUlaeEp15Rbkuc8rmAbNcLLxyJxHWLjdRFpi83EbVj7X+UoCLYkXjGfpYatoR97hKNVTQ9oSvU+eUbiveFdHKUVDwwKy5lKUv0AqGetXZVGT1BkfDnu7sUvx2XKSKvL+PR+/Fbo2Eg=
Received: from t540p (78.45.160.211) by
 AM0PR05MB4180.eurprd05.prod.outlook.com (2603:10a6:208:57::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.995.19; Tue, 31 Jul 2018 09:56:27 +0000
From:   Petr Machata <petrm@mellanox.com>
To:     netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Cc:     davem@davemloft.net, corbet@lwn.net, jiri@mellanox.com,
        idosch@mellanox.com, kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org,
        shuah@kernel.org, nikolay@cumulusnetworks.com, dsahern@gmail.com
Subject: [PATCH net-next 4/7] mlxsw: spectrum_router: Handle
 sysctl_ip_fwd_update_priority
In-Reply-To: <cover.1533030830.git.petrm@mellanox.com>
References: <cover.1533030830.git.petrm@mellanox.com>
Message-Id: <90eee3afe1efd213f07acd8461d981fd0b7bd343.1533030830.git.petrm@mellanox.com>
Date:   Tue, 31 Jul 2018 11:56:22 +0200
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [78.45.160.211]
X-ClientProxiedBy: AM0PR01CA0002.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:69::15) To AM0PR05MB4180.eurprd05.prod.outlook.com
 (2603:10a6:208:57::29)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a65f4b17-4921-4eb3-1071-08d5f6cbe256
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR05MB4180;
X-Microsoft-Exchange-Diagnostics: 1;AM0PR05MB4180;3:+uihfsEblMyKSlOGNHDFQrsEIpwUG3wjmijWKRePP6CZ+2nBy+t3836cgxnXw4smKj2AR7k3vd8R2J3DA2hhJdHZojR/0pr40qbF9QZky8aqBHKVxWyH92DoX0uLQvBM5IUnPK/dk+zPMdMaTprPwB69psodOjO/Eu81PpCakrPYqbyTAdueprxCLbMTUn3Yw2AoyR+Ca6QpfWD6xiWs1ZFtlm/CXJ4dVIi4OYuH4ZQw2MqpV3IC3Ivp4ARJJfxN;25:3LB3R3qvPED8MCwQJFH24jq8wBeHH64cGFORTN1N47065lzs7IFdbHcHm+UDUcDiWk1aT0/tBiFi3tZ2J8JbvuEdxbW2KWiZRqn5iMAJZAzQ7A8zy95vG3J2alfonqXAloD9E2YwhGdH3LHaj2a28lN8a/j9eGoi1qqvhaAWO+ONXom32whHhdiben6Y27rmEdvl17trZfczxpkWbzsfREx1dnIwjEhBPrQtxB8BOsF8C8NSqRzW4//iexMliXsE7r1jgpORgnPOqRslo8kIuyTuv4lDV2CjUr07dbBOgRhHKCSL2Z7+A6mY3Xp2qXeL/4lxnDk2L70Geej2/NFU1g==;31:OLd409fu8YBIHk0mHRO40vue40V13SQSwjXwArVEtEjwetvjbbOtVPliLeE8UCqhaKd6uxcL4OGkVzX/jn7yOswubcW1FSY6e4xVg3rx8Zj0+1cGHIngnH5D3kTUBJQtlKsRkzDkvyfdl0jQD4V5lfKIokViimH4X04ODQ56rZKEMD2LEYXOkvY0HMe7nqCc6SvFpScb2WT/CY+RDQClWkBJOW/oW/A928I2Jo1dJ5o=
X-MS-TrafficTypeDiagnostic: AM0PR05MB4180:
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=petrm@mellanox.com; 
X-Microsoft-Exchange-Diagnostics: 1;AM0PR05MB4180;20:KqxTmIevJj/p1m/HyvV/Kvd7UdW2MdL4PA5reVVQMlaXUZ1rVc/UX4g+NjxkI3ro+PQ5UqwPMxXOX9f/WAdxPepRq4PRUXuv2QHHQzMq3rye348LL0jQ2c2+PFsDuh0JYSU5IDAoMF3hVIu0M7X99I8YU4Hz1x4YvQ+zKlPYMhZfC4iArW7UgxlXdD9nQAkGA9FllTEPjpuH4DYI4k+8m7tlIc1uJnT02K0BaKwJ9qaNyLHzMgZUWs7mDulkBwXEjyddvlp+whgO4e6rJbgL+PLjiNI9U0UC26b7NgAPKumGADIf/4wzNrOxoZYnjQ4T3xU6vVFdB9V4yLz/7/4C1Bxz/WQdOOF4J9TbqFInnHvQJ35ghVuGe/EBbRoX/gJdq19Kncze/mWoOS1TSEB2xw3qrhDTa4EgMpsA2/7k9q/Js7yWIqULxaLw93o9xNPRUNdeFM5FR/Kj7YLgbeD6vPahITPQYubRBaQO0wtN0Z7Yqf6zaxJrCx1AQrmKvG1c;4:mPdGfU+OWN/pAnSbsHMcRICBgOC39N1lb6OJa5fhSOkBkpwBsZefgT2VoPdFBTCTBFwmuTPR41kvf4AMqHJ1cxwIHtyApeE0baMo/G87+zyR8YciKf/BKew+lbbdOuicgojklvF+TpBEOYVdb9ARs6l5YHtljU+ebBdXYlnjO8HqlrgSkFxPqdvJO/lHJ5GWpw1RTcDwY7eIG6pPIjgoWxhSLl2dcJSoUFXHBLqFuoCKYTeUisZQy9+L3psVAhGt6cFdnFgpQZnbw/l+kRySmA==
X-Microsoft-Antispam-PRVS: <AM0PR05MB41807FF35E1E8D81CADF4327DB2E0@AM0PR05MB4180.eurprd05.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231311)(944501410)(52105095)(93006095)(93001095)(3002001)(10201501046)(6055026)(149027)(150027)(6041310)(20161123558120)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(6072148)(201708071742011)(7699016);SRVR:AM0PR05MB4180;BCL:0;PCL:0;RULEID:;SRVR:AM0PR05MB4180;
X-Forefront-PRVS: 0750463DC9
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(366004)(39860400002)(346002)(376002)(136003)(396003)(189003)(199004)(6666003)(6496006)(7416002)(11346002)(26005)(48376002)(47776003)(53936002)(316002)(50466002)(8936002)(186003)(81156014)(16526019)(446003)(68736007)(476003)(81166006)(2616005)(8676002)(486006)(6486002)(86362001)(305945005)(956004)(58126008)(7736002)(16586007)(97736004)(3846002)(105586002)(106356001)(6116002)(478600001)(76176011)(51416003)(2906002)(52116002)(66066001)(14444005)(25786009)(36756003)(39060400002)(4326008)(118296001)(386003)(5660300001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR05MB4180;H:t540p;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;AM0PR05MB4180;23:JWHk/WMN21d5x4FeMFEnqNG8DpiW2bi7lfpiFbvj8?=
 =?us-ascii?Q?GyYYD17Tm//1nXVJPwmfI8lTay7X8MfLGoGcVwTwgciMEjYvJgS+kmFSt/dg?=
 =?us-ascii?Q?2K0cjGVeHNkuucy3iw8o0VEgWjtMDdYFf24N3d9Zo9PheWJa0yOhO4CTNOb0?=
 =?us-ascii?Q?MIp5dkJTMHQelPGVllJC/7rZw5imZ00oqic5YgA7seJwlG/jm8JKP2R3x+wX?=
 =?us-ascii?Q?QQKq2cTTFbe8iO3hmF3IqcaALkmIEThGNJLchTSX3oCgRt7zP06SYFhDf0Ej?=
 =?us-ascii?Q?j6HRaD/dyHZue1QsypA5F1gjhsiut9EMgxWp6U9wclalGC42hTHXlu72AHFw?=
 =?us-ascii?Q?btyI24YmEBBCpPv3pRmZVWwVwtK9DmeiQFx54kHs9oLrPUhFnNItbwOZCB1U?=
 =?us-ascii?Q?ULqd2l3XMfClT0ILZKJnWMldrgX0uAPaSRhHi7EbXF80A0cLq2earhoTrZd3?=
 =?us-ascii?Q?drTdL6ijaqoh+uiVJ63mcXT+BWEapMLPfF45t7PjV2+6QxWTV8ENlhzxuXGv?=
 =?us-ascii?Q?5SLARHys0CXhGhDylYw2lnhS3bHzddrtDD7o7q/kom0jpWpAV0YthAt2dybP?=
 =?us-ascii?Q?20+QVUL1/JDbsm/FiTKa+aUV4TuzZ62JLegwzJ209mqPWJCA3kSxtFdrmrpK?=
 =?us-ascii?Q?2FSfRYwqoZR5fn/hrWsgc+wddpRMIEihnQwULugOSGsMW5t2Y/EoYumgjBrv?=
 =?us-ascii?Q?oA4nzj3rc5N74S2k5FRWrOpQjpQ/2V405KgvvnbhOvcOZ8YdROWPuZcKnBmt?=
 =?us-ascii?Q?e20BSMeshVLUitqla8MT8R9qkFEvLpoR/d3q57Yrbp7IZdZRqxZiRF1ykg2G?=
 =?us-ascii?Q?adbW9t70KyglRVB82y0ibEXPBYUU3N8Tu4ICTDLOwk7eXJcfj7LlrOQ173Tf?=
 =?us-ascii?Q?cR8UiaPu3uQUiOMhFQCudxBhia9lsAr4vBbfISsinwmUb8yYA1vvIqScgQt2?=
 =?us-ascii?Q?gL+mbX7eVkVWH75xJHyEb7Ui0ieYWHtHDkSQt25Sq4TE+VnTxdbOD7Wk7Biv?=
 =?us-ascii?Q?R5j4zPWXlKaCPp4oB0mQHG76ep/ZaMzicc746mfmqPZtPwhaW5I6Sv/bwa/e?=
 =?us-ascii?Q?anTakdY/OqHVfmoT66HSvcLP5/eMOGobsKqWuPUkhM2Uq88NxmaoE6SR80m1?=
 =?us-ascii?Q?dHscwGr0Jtd+VzOmMIKIzC6UinMizKv1i0WycZYhNqQGCykg+/xqMPnl2BAS?=
 =?us-ascii?Q?nLkoNxUlYLDWmDlVZGWb+y61Bxt60VmRIfS?=
X-Microsoft-Antispam-Message-Info: Gd5pYZocSOLvDrHurYO3cNkw//VyVAIDuFVR81dgDe1XobJM7bHvKKq0bN8eqYZH68eP3sslXAYu35eFy2XT4LQSgkV/wA3VKmmPZ5I9mMVc//DdcGotzVZhKhPeT+TE3LBnxEELNYX2VahIiFGpVdp2E8cmOPZDy5Ql5EXjW1qnMMMGBoOtqOX7zo0RCiqbU82+6Pj+/jIJviNlkG5a7ZDPgBsHIOQniBMVY5TnulIKWnbZm8tK3X+K5UOePapC8yc7L5DlcUvsdeEq9BoiJKtCxqCfQ6Rtdf4Kng0BAsJH5OajbmB5UOuXwvd6a47qncLD1fI3ou72yjvDpiweY+1BJUBoUYeqeTwNmg65CcQ=
X-Microsoft-Exchange-Diagnostics: 1;AM0PR05MB4180;6:OiHRL7Au2M3H71dz6vMtkLPUv68L8RREkn0wlJ2DqxoWukN/s0MgyMQwgwObogsIKSan4oY21bhnH08Zds9LGQDG6g+Y+vKyyF0O7kcXaoMfnq9qmtirPD0p+M9777HF1fHOACyvgZw2kX7Uu+1s6vcX1w+TYjs8NvhDNP/Ni7pPmO29Up8h9PtvPkHJHqCGmm9jsujBdBAilrc0nS8zsr0jVUHnKlsLkFAQqCzSC0g0e6K4aTfS6/kBeLCntaGT7I1wigv3YqZHRLPDysZh1epYXs1oZTXOCl9pPSzWC3ZBzwug//64lf5XKyb1n3DdptbsF9laYQZdr7deDTZb9SuqXB+Wm9ilqqEwvqRKNicuPRXB6RM2vu7+iVaHdwp9RZiTM5DLPOmO6MV+bVzquuJDyDpRAYniRJuGlkEx1WghzD3Jl2O6jQ7mwJZ9ZSBJ+2votjuUuDo2zSGC4ppy7A==;5:WdpIQ+DbQ9KDB4I/Tiy3SgQZDj+7gzRiK9wt7XJ14a8CI8VG8RLaqS6ZPy6aHFLXq3j9QrVI871fO0Fr3SnUenE3eAQnMp7fbk3KYPeVW9NiXzHa6hwhzW7pJdEg2HIu37HApaF86p00wrIbcPe+oLXRejq55vQLakV8K8ty2Es=;7:oFdwGl32yURNfX83PwIj+Kh9amtWkH0yUu0xzkjWtlZw8CRxeqAq12R4aM/B7PhiayXC3Nt5nUrLa835Ccp9kTPhDUMlXUP+p4csq3zvpSuIyJZPXNaYDsLgevQDggT/ChciOf0gZfyRRndlPemYaQEOWxhhB+8EG0fKGdjPWxoZvJGg6lbrUHxzi04BXNl6M67RZeeFlN6/S0JnFG6Ut+lbZcNUfSHfnrwhtelvSmJ/hc/zlt2EP7sPVCZk0xPr
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2018 09:56:27.3234 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a65f4b17-4921-4eb3-1071-08d5f6cbe256
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR05MB4180
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This sysctl setting controls whether packet priority should be updated
after forwarding. Configure RGCR.usp accordingly so that the device is
in sync with the kernel handling.

Note that RGCR doesn't allow changing arbitrary parameters
mid-operation, however "usp" is exempt and can be reconfigured.

Also react to NETEVENT_IPV4_FWD_UPDATE_PRIORITY_UPDATE notifications
that signify change in this configuration.

Signed-off-by: Petr Machata <petrm@mellanox.com>
Reviewed-by: Ido Schimmel <idosch@mellanox.com>
---
 drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c
index 5ee927626567..eec7166fad62 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c
@@ -2436,6 +2436,18 @@ static void mlxsw_sp_router_mp_hash_event_work(struct work_struct *work)
 	kfree(net_work);
 }
 
+static int __mlxsw_sp_router_init(struct mlxsw_sp *mlxsw_sp);
+
+static void mlxsw_sp_router_update_priority_work(struct work_struct *work)
+{
+	struct mlxsw_sp_netevent_work *net_work =
+		container_of(work, struct mlxsw_sp_netevent_work, work);
+	struct mlxsw_sp *mlxsw_sp = net_work->mlxsw_sp;
+
+	__mlxsw_sp_router_init(mlxsw_sp);
+	kfree(net_work);
+}
+
 static int mlxsw_sp_router_schedule_work(struct net *net,
 					 struct notifier_block *nb,
 					 void (*cb)(struct work_struct *))
@@ -2522,6 +2534,9 @@ static int mlxsw_sp_router_netevent_event(struct notifier_block *nb,
 		return mlxsw_sp_router_schedule_work(ptr, nb,
 				mlxsw_sp_router_mp_hash_event_work);
 
+	case NETEVENT_IPV4_FWD_UPDATE_PRIORITY_UPDATE:
+		return mlxsw_sp_router_schedule_work(ptr, nb,
+				mlxsw_sp_router_update_priority_work);
 	}
 
 	return NOTIFY_DONE;
@@ -7390,6 +7405,7 @@ static int mlxsw_sp_dscp_init(struct mlxsw_sp *mlxsw_sp)
 
 static int __mlxsw_sp_router_init(struct mlxsw_sp *mlxsw_sp)
 {
+	bool usp = init_net.ipv4.sysctl_ip_fwd_update_priority;
 	char rgcr_pl[MLXSW_REG_RGCR_LEN];
 	u64 max_rifs;
 	int err;
@@ -7400,7 +7416,7 @@ static int __mlxsw_sp_router_init(struct mlxsw_sp *mlxsw_sp)
 
 	mlxsw_reg_rgcr_pack(rgcr_pl, true, true);
 	mlxsw_reg_rgcr_max_router_interfaces_set(rgcr_pl, max_rifs);
-	mlxsw_reg_rgcr_usp_set(rgcr_pl, true);
+	mlxsw_reg_rgcr_usp_set(rgcr_pl, usp);
 	err = mlxsw_reg_write(mlxsw_sp->core, MLXSW_REG(rgcr), rgcr_pl);
 	if (err)
 		return err;
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

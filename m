Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9FEBC7D071
	for <lwn-linux-doc@archive.lwn.net>; Tue, 31 Jul 2018 22:39:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732644AbeHAAVf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 31 Jul 2018 20:21:35 -0400
Received: from mail-eopbgr20044.outbound.protection.outlook.com ([40.107.2.44]:54942
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732123AbeHAAVf (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 31 Jul 2018 20:21:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BUAValkslsveuy2LnnZP6kuENyQhpJiMyBOODMnZzc0=;
 b=aGOFggM/jufFQ2X686skvCaw5hCQgoR9d7N64vTuxbm1TjEA2gZ9JDkbaKqKkR03iYpzSyK3bAjLwARyPd/IbQfGt/SvhuseFtv/vesAWgV6UHmdmiuRBm7j1vOhH6E+rpN+7wRW/QeIY3SKtLmGcePLZIIMhWBPa+Zv23fBW+E=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=petrm@mellanox.com; 
Received: from t540p (89.176.83.59) by VI1PR05MB4191.eurprd05.prod.outlook.com
 (2603:10a6:803:4e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.995.21; Tue, 31 Jul
 2018 22:38:57 +0000
From:   Petr Machata <petrm@mellanox.com>
To:     netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Cc:     davem@davemloft.net, corbet@lwn.net, jiri@mellanox.com,
        idosch@mellanox.com, kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org,
        shuah@kernel.org, nikolay@cumulusnetworks.com, dsahern@gmail.com
Subject: [PATCH net-next v2 4/7] mlxsw: spectrum_router: Handle
 sysctl_ip_fwd_update_priority
In-Reply-To: <cover.1533076217.git.petrm@mellanox.com>
References: <cover.1533076217.git.petrm@mellanox.com>
Message-Id: <612b9ef595e1cec62711aade431dfbf721499147.1533076217.git.petrm@mellanox.com>
Date:   Wed, 01 Aug 2018 00:38:03 +0200
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [89.176.83.59]
X-ClientProxiedBy: HE1PR06CA0160.eurprd06.prod.outlook.com
 (2603:10a6:7:16::47) To VI1PR05MB4191.eurprd05.prod.outlook.com
 (2603:10a6:803:4e::17)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cca586d4-239e-4f2e-2da6-08d5f73667f6
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:VI1PR05MB4191;
X-Microsoft-Exchange-Diagnostics: 1;VI1PR05MB4191;3:P4qpHZ0hSLrWOHKknk29YOncxZv2S1LYvGEgjhTrr4QxFIFKE/UfwI0bmNBXYQS/TBbjW+3sLN4YMrUHSGe/2fmagAwamojg3f2QoBubQ0bv14H3+DRvEa27Slh0d74IhEwjO2NVDBh0xiUR4AGSsC2ypIKjfX/hwd0puJLvi8YUsPBE543Bh4hPRqkcUjlABrfKrYkwIkyL8KCZRDz8CPQ5BQULgF18dkmKkE6ZPCV+wbf9Buny0xe3OQ2/2V7a;25:sXH+PJ5oMTt2dWT683VMVe3MVx2kdlMcpGJMxblF6PWBWRhffkRaZ7R/q6TA5jMauA9KLeoa2ZyqYAcFxJBGaRucMcxy7m9v2SGT3sNCUCSsMFAzG6yP8ygDH9lH8Dy9x0jab9hIkbxvfpZaWmlSkGt3CEFcgzZvsfTZMf4PtUVl2V2IbeHtDcHPpfTDFdV8Y84lsPptdyAkPBnr4wEAgCngNNlf9naFcKVj56smsXFlO8yyVXIFODD0Bxd5yRnw5Lj8ydgnqbt6X2+tc8NO6UtC5cEvuVjXH2bN2r19RDUBUxS75V6sGjFqFWeyEfJSR//naT2cWQP3r2zU4VXzLA==;31:vB3kjl+jTNEFlKPcV8y+VR89yk4pWWHeVn+ov1gNYoMQdgIJojbW36BKzonPSP2M/p9Ef+G9g9UBchiyoHEnhD20RPRn2XF8/52KMD7FWnuRxZJQnnHDv9A8sLvwP8Zml/UPFAcyU5oqIodaLpBNBBYVB0fgqag6PFOa7PZLoBTIC3blgKD6VwEyoUYNmDaundzrTx24rj7UQgkOnnPpK5EavZygFyMkiHF0erRmn0M=
X-MS-TrafficTypeDiagnostic: VI1PR05MB4191:
X-Microsoft-Exchange-Diagnostics: 1;VI1PR05MB4191;20:7+ceev/slm5qzaQrzX7wj8iln7k44rpNr/ZCphqctq8ZzhNc+EawvJhx84prWHun28kOkriJ7hvBcXqKa0DZZdWk6lzmfVM+amZzfPDjHJ5RYYh58U5iaGekKfy5LBUg+mYUCW87a9RusTqRqlMu7CD6OUdCmcvDC6AIO8+RnbphsT/7hiDldhbvO5EMhZnO7In/TAtyDm4Q4XQp/Ifii+aW+U+Bt93zLA2+d6KafWKofOUyjRYb4vLrfbXD+IOz1cx6ypKbXSeZTw3BFNGvC97F6Y9kGvxvGjAEqa7I8kL6CDP3B20ny+zpKEurZ58F3B3xp4Z3iTs7r80K2pfIMFwwVKAPnWb55NuWMhVRbX5SuluaftZTE3VG5qwYqIbpqVXZTZWToOYW6BJnw4i4tOg1QB3aYB6uG1qvpr7jEHnughOc64Bo8BJYo7/AK1i/hfkEELxDT6h483WpAO7AnkUoAM7AF+ERJ9yzP7JuQ7914SYIpjJdaltYby5ujTI2;4:CEtW4/WTFHj1/MQm6hYJ9Md3Xb1VdilIyJ0gPGzU2snBz290K+fPfXymM2elBQDdo42z+RVTIFcF2QgAtHDNAj5K6TjEf0giPELgzQ/Dnd47FWbTiEmPBP+ac1Ajtjl8P4H6KTNlSkf/0J3aKk/YNjkZkMvZa2XFo7+6OAeRLi4d3ofyuiXzcvEJVJJS+jp7mIqMm28yAvimubctCK2y795u9ODoiTiX7ccN7vw52ujzTj0gRo4d+AqcK1GUAcAtpsbYbydQ2cmqvhF4isguOg==
X-Microsoft-Antispam-PRVS: <VI1PR05MB41917A23DEB1E78FD3A38F08DB2E0@VI1PR05MB4191.eurprd05.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(3231311)(944501410)(52105095)(3002001)(10201501046)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(6072148)(201708071742011)(7699016);SRVR:VI1PR05MB4191;BCL:0;PCL:0;RULEID:;SRVR:VI1PR05MB4191;
X-Forefront-PRVS: 0750463DC9
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(366004)(346002)(376002)(136003)(396003)(39860400002)(189003)(199004)(36756003)(2906002)(956004)(81166006)(486006)(81156014)(476003)(2616005)(8676002)(39060400002)(305945005)(8936002)(4326008)(6666003)(25786009)(50466002)(48376002)(118296001)(5660300001)(14444005)(7416002)(66066001)(446003)(52116002)(51416003)(478600001)(3846002)(16586007)(26005)(86362001)(6496006)(47776003)(52396003)(186003)(58126008)(6116002)(11346002)(6486002)(16526019)(53936002)(7736002)(76176011)(68736007)(105586002)(106356001)(97736004)(316002)(386003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR05MB4191;H:t540p;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;VI1PR05MB4191;23:IB7gVhws5va18p2fTNhr3DOR4YflRKLwsQK2YcnAp?=
 =?us-ascii?Q?MREqFOLzKFzmCkiohqeDuGYop1JBT48LNqYzgqeCGnRPnpCZs5YgUIWUS23e?=
 =?us-ascii?Q?PxRLAmSPYHsviVWAv95tCrUUtgMs9wpO5HDis6eknmB3sZ9/8mlLTpU/oe/O?=
 =?us-ascii?Q?rfRGSo0uQYyZ+OMFdOu/zvDj0X5Y+2CTOFxxmDgFAypji+GeWOYF1fXNQgH9?=
 =?us-ascii?Q?aQPpRTR4o50epfqivoTJPI/GJt2K0Ktjlxe7Fe+Mb5JfBNR9Q4ogDglwkpkN?=
 =?us-ascii?Q?uOBQ1gj2P5Atoic02Qcc65VnMG9qn7yAHR3jVLWby9XmQaeb/tSJQ4crSo/G?=
 =?us-ascii?Q?nZTPwUbnWAnp1cgDnsQ80NKcdot10VMzUfpLdCYBkMjlMEAt+vhFc4v0hT+k?=
 =?us-ascii?Q?X8E+itBOXgSDjS24ZyYhEuQfr5Mjx0QYNfXRLZWMtPQS/AzW96bJSZ6UtYiw?=
 =?us-ascii?Q?8XZ1Hip5qNaNmIJNPgbULYHO9fryLs8kfUJi/+NWrDc1G3YnHkmZ4ZrDoXZ3?=
 =?us-ascii?Q?oIqLTGbvJFkxa4rB4yjYckgmn6Yg7F2VUOKs+54Kh1rYr1a9rvKPHXP+RYJv?=
 =?us-ascii?Q?Txq4Uu+0iLXQIWgvQr/CF+BlLZmvtwPROEO7BC893WhN1yd2Tesz5lb5BVm6?=
 =?us-ascii?Q?3yy7oVfKLJCgunFtFPunbNbyEyeZohQvVdMKwJPtqC4ECPRbObrQ1aa2YuFf?=
 =?us-ascii?Q?R3R0U7eh8soGysoxiP6ZBYJzBXXIFqlhIcDEh5rFJmxsF4cuvstxDXrWkJj2?=
 =?us-ascii?Q?ivPgqvepPIWAU9//WH4vMGLDO+lf+7IOJzhnhLLHoeDapz3CSVE3hbTMglkc?=
 =?us-ascii?Q?NDThqwAQ6hIm/XllBt2SPWED9MF3Wtk2E2IYOevZyvqWYCLg4/jhU4IgzU/H?=
 =?us-ascii?Q?Q6e6bTSse4wXpgFGE0UT/56OUsGyGCmTEGu4Qw89pTN7Jh1+O1O3GsZYatx9?=
 =?us-ascii?Q?V1B+2mS1dKkzwhRopGn8S0iIUlL0m+sP9gMDdtQgJfWQSBPlpFVSUaOodzyg?=
 =?us-ascii?Q?oWzKUKbIAKrJpaD68LDSEhK1sNT2KjETWI2AgT5D9IIWT+j/drR52lXRP1L+?=
 =?us-ascii?Q?NETzsWx07igXp7XrHhNKcgL160rFQnDHd42lnJ0sOr5rIbcMxJdbAYF9T1JX?=
 =?us-ascii?Q?xSfQG4C2XGFhC5gru+UkXs9nSgiF8prrMw639mHhX1evmbXmRDvUxkg6vGm0?=
 =?us-ascii?Q?R9SSUfQkbz+ZRd8jOPldJRgeB3sNo9a9/LDQ3ssPHqkKSoVrxZE+CDKqg=3D?=
 =?us-ascii?Q?=3D?=
X-Microsoft-Antispam-Message-Info: N8Zr3Ua8v1Hs6sMJk+8ThRq5AjhxRQHQNpQVG+PvMUVVH1oHZ0zOJjSrcqbewttsTmdJPeSVosM2mEu0XamqKltMas00mdMSHM8nVAycl35nVnHZXWhWeUd11Rw3ie3tXCXB7h9eyeIptBr8ujobZfQQLAhhcrCdnHhjL8ZA/bJcVgpFraQnP6STD8ZVANZcsPXrFikvpS8x0o0Cgi7NRlo1P0z2pwRiXd0Fq1qnXJv3sjkGe7FNhxfRJDnHFFsB/j5Jjwuj8jUcf5nR0MbG3f7w4nT9U3W75/gAT5juByokciQetAd7y+19SFnzPZClrONrHQuD4Jsxx38luoJM6xPF86KUezHWPt3A9zQt59k=
X-Microsoft-Exchange-Diagnostics: 1;VI1PR05MB4191;6:f8JB+St86oAzvpAAUpCiP8rPK5vWBm3DVucPSI7+AucwrGF2y/VejT6wK8968FdKhgdl0jhx85YB76hAfZ+66PRwwSHgZi/EkEaYXTniKQckZnmiuBAhBzIqZMMetNlMcYv9r1jeGyAxbmL6A77wuycRpjmizca99eCYFxlauLmH83NjpecC8r1J8DgIzrPZl9EvyfsFFPCUcAUebYvwNZqDXiSDvNOKHUzToI5YBthD6vY12KcMsGEvSrmvMVlzOBKdlVXl7J+SyvtY7LhHRD/XG99gIDRC16Y7i1hb1fV+b2Z7W0enKWa+0VTE99NWv0am1UymCqtifRuxnavT1kLVx+qap+XCPAQlkOpobo4IAFTalBnW3QxJpeAXt1GcH2Qlo0ay6HZ8+36XSgvBxnPzI/RZgxlzo9onjYnHORHOylJ+FwWv8bb6FzgcmXbGkIchu3IG7AG+inoCg0/jZA==;5:KLSGYE46IkZ3TrOzNjl71FbF8R22k4VDss1WL1hAJ++GYflOMJDXLuaPqmLukzW4tAsvSkXDnoyFmLZ+SBIKyj5U1TlgUmUOkgOfZk69oopXcILlmAKtiEkjDdZg/jlfERXKqdC9j2M1CwCd8mnWdWyMxrbHq3ruSGxhNs83X28=;7:drclrz6eMhFNROsztAz9UBBFXUex7Qq69RV3Y4728PIqC0hgVkKYhUGdM2F443YXGvlwd5IAzOFx+E4GZcnwHTGEYQuUM3zR/6QQEYTGoQc6srijf1SFXMqzM0TKjOV64o2Bu+IgXTArjMt3z1otF2B3WdNvfu2vmMvivd6rmwy3ms3lKJdeeDSxyhvFux6M1Mwyft7fAfGxYazYFmIVTTXWN5RsiPXTAxybLknsCUTzeHKQ1aMvfnqa0OgWz15E
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2018 22:38:57.2054
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cca586d4-239e-4f2e-2da6-08d5f73667f6
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4191
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

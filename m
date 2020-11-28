Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF98C8301A
	for <linux-doc@archiver.kernel.org>; Sat, 28 Nov 2020 22:21:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB97B222EC
	for <linux-doc@archiver.kernel.org>; Sat, 28 Nov 2020 22:21:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=windriversystems.onmicrosoft.com header.i=@windriversystems.onmicrosoft.com header.b="oY6BfMgX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730567AbgK1Vte (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 28 Nov 2020 16:49:34 -0500
Received: from mail-bn7nam10on2051.outbound.protection.outlook.com ([40.107.92.51]:43233
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729718AbgK1S2w (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 28 Nov 2020 13:28:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zqi8IPFf8RrtWSwLaCeUcLrkBOUMw3d9wERAd62OUm1j1MEUys0MSTqQ+KfIvb1wJNVVUXRC+7ix/GE5EKvMrjUyN5a3iHuUbY8TiK2VGX8SpNl5BVDWbgpE3F+CfLB62f/anUx0Y7Ipq1lhEqIkyNmi8bPIhinQrW8e0l1l5K0CQ9Po4Z1v0HltS6dJnG3cfc2GbCOWVe9jF/wly57P515eyKknKTbu2CcgxSaJjzM9b0MAZIf5Tuw7QKlf/oyXe1wkOT6P/SjY1LhtTiqPiSYoudCoj8/ZS2tsJ4HFf/ZXmGLBN6tQewQ/9xw8wM+v5sKL2CPfufZUE+qobNfHTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJTu6tLLq+pmbF9DOQvYhpEl+cyUevjsUgPwNzQcrEg=;
 b=AIx++rjntwZgeTcI2PlStVvtVS4UBsmAWK12JOrthbfYNSkqGT9IJ3IAtT5clvMYLNkEzDWDV71ogZD2zGXxNeBAL2/mrpjNurNyEl2dHrTz4MfoWOPj6+s1AYf9gaYok0Bsa40mYTZc3r9dWGZoNLcWBoQ7OP0OcJ/EHf6asv3uFcukgN6Puxqr9ZegAm7J/9qs+cxEHzi+Eq2PNKwbmTcXZWUD1TqspIKWfQeGgO4b3NwtICjlbGGIGL5rJ3+nU7NP4JIDvJCwnrBsUAT2SKQaZl9LCjGJVvEVQ0eFbuwY5SEJPoyiJc84gtgVc1dXgkos9PJ95iiHSo68PkkjeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJTu6tLLq+pmbF9DOQvYhpEl+cyUevjsUgPwNzQcrEg=;
 b=oY6BfMgXJZoQWEFb5HXdLvMxMEK/V/YjdUeG/Vn5LdTcDGclYmj0RwZe0OTxf+eT3cLXeaZe2fxh5R79PInxqbiqSF/0c4yY7Q7bo1lAavCGDt4odJctrxGBZVO1rDx0poGs8q1rddqfNhbxDkQg98FfI2T3qJv4Ipju0DSru/U=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB4545.namprd11.prod.outlook.com (2603:10b6:5:2ae::14)
 by DM6PR11MB4475.namprd11.prod.outlook.com (2603:10b6:5:14e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Sat, 28 Nov
 2020 14:55:55 +0000
Received: from DM6PR11MB4545.namprd11.prod.outlook.com
 ([fe80::4985:c74a:ffcb:6f40]) by DM6PR11MB4545.namprd11.prod.outlook.com
 ([fe80::4985:c74a:ffcb:6f40%4]) with mapi id 15.20.3611.025; Sat, 28 Nov 2020
 14:55:55 +0000
From:   Paul Gortmaker <paul.gortmaker@windriver.com>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     linux-doc@vger.kernel.org,
        Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH] docs: fix typo and drop dead link in RCU/checklist.txt
Date:   Sat, 28 Nov 2020 09:55:38 -0500
Message-Id: <20201128145538.69468-1-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::17) To DM6PR11MB4545.namprd11.prod.outlook.com
 (2603:10b6:5:2ae::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from sc2600cp.corp.ad.wrs.com (128.224.252.2) by YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend Transport; Sat, 28 Nov 2020 14:55:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8fc4cabc-c2dc-4df3-dd7c-08d893adb53a
X-MS-TrafficTypeDiagnostic: DM6PR11MB4475:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR11MB44750AB3DD97CE02667D961A83F70@DM6PR11MB4475.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bqo3mjZToO98OgD0p81cfu9/TP2g66Yxdw7k90TMwHZb0S9qrI64PiDORgFjWDffPY3P0UIZL8NmJEOA7Wj2hSQRJ4UQkv0UUsmMVDAEVru19yxpfreiYdgfY5dM6ltV3x1EXi+splZ3PBKjbfkWDdETUi28tVH8OUyjH/pgLVDSl2geoKTT3xH/8P4URLoEEe8JXhXcdQf1FP+rwII0eUocrFhtGUZoTFp8jzd9LxP7ifLHPmSPThiYbmN03CnMVBCy8duTjct7qd22cKDcn4MOIG560EDF6inXURCjvFVYvr+WoCF8m2srsa4FzBpE4PmmF/xxGbLP0fQeYRlUxWi1BBblB/UNrZNn086yMZWb2OeTzx3f8q4jUAt9JDVnAzRX528L0LhjOlbfXRxD7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4545.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(366004)(39840400004)(346002)(5660300002)(86362001)(6486002)(52116002)(316002)(6512007)(66556008)(66476007)(1076003)(6506007)(83380400001)(6666004)(107886003)(6916009)(66946007)(2906002)(966005)(8676002)(16526019)(186003)(26005)(8936002)(478600001)(36756003)(956004)(2616005)(44832011)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?GtzVC0ND2aLAEVm10tXDOSYN5Kz8gBLSTAaMy7l0jO0KfPZhWOFkSkYUz22q?=
 =?us-ascii?Q?byT7eKyimDvYi+S2CGEoOcHWcW41kxRMJZxEbmj3zyWGObSKlNyzv5axV+ou?=
 =?us-ascii?Q?jO+miG3Y0puqLF3qczQUWTbefDWTGYX7b0opKP/tHJLkUEAiVFW8yNk18dEk?=
 =?us-ascii?Q?gnxcqI1x3Q+fJBqLJZrosOHdm4ALR7RrRefUe3kmmPksQWhs3MshFS8udVVO?=
 =?us-ascii?Q?bC7mu0seNR+OqMVfYAvgXhP5ayS+h6KQNCZscoCZnb2JscCxCwNmy0pJItHx?=
 =?us-ascii?Q?L5U5vYtQ0ImZpwyI7x/iic1C8frR3M1unZZ3VZsw1rvdcdOo84g9+Q5J2fPy?=
 =?us-ascii?Q?dFNC43tY7zEZx8yTkpa6OHt1rzi7dgo6bODBMhSL1Aj+FCtZrRIdyrlmiD0V?=
 =?us-ascii?Q?gOTRklAJ+v+Pnt6ScQi4GGcCL8sCDOhjUIhNGsPpQsij2M+pwTTpMzUhxleX?=
 =?us-ascii?Q?IRmbhe52fwyr0zPSbUKgLEesP0X8N/uR9crvGzkB8r5+mJDYH40TWXrDzApk?=
 =?us-ascii?Q?1zzqadZBy0RofI0GLfX1XvdA1pqKbx9e64cA0AO0wV/Cj0KrjnzkuYsdTxys?=
 =?us-ascii?Q?Dsk9/BjhE7NpaUQ24Tsa2qt+DA5X70AsHSfGnoyi7idIPD6dJLaAABZDaDT4?=
 =?us-ascii?Q?yd4mQWwQG1cOacgXl+uCmGaokkpqGIAdl0NPYfxz47w5oIo3VA7Fxhkpg57u?=
 =?us-ascii?Q?DX9O8+A05SBYZ/9pdJ+bnhz8GnyVATluCeG5/SOUSrfQohvLkcoBdrIQ1Di0?=
 =?us-ascii?Q?Z632jC40K9ow/G9lM1SK7M0KLUL0yQUh2prRrddWutO9fWj5f80TJn4hSuSu?=
 =?us-ascii?Q?Slzivsu+jCjWl1uATx6NY/t549WZu4xSxiiDXfM15WPJrMSdCYFlwxzt4c9v?=
 =?us-ascii?Q?0zpYLkXrgfHy40+csSu4EtZ+A9x1W55utNLExaXQl0PPW+ue726flnpEuBoT?=
 =?us-ascii?Q?JoPXQGDINDVRK06FS7t+akrGPGM+f83bKHkQ7wFnaMyAB/tbpLvvKpztmw/8?=
 =?us-ascii?Q?R/ND?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc4cabc-c2dc-4df3-dd7c-08d893adb53a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4545.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2020 14:55:55.4065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v+IV0bu8FRiGz8Gz28EHJ5XyA2cQiIp7M0wYRoUpFZtnFvfm/N5cBu2j2vxtm8Q9SjBueTsebrmuyd5WL2hiZVL1/ioi0STef1Wffhytknc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4475
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

It appears the Compaq link moved to a machine at HP for a while:

  http://h71000.www7.hp.com/wizard/wiz_2637.html

after the merger of the two, but that doesn't work either.  A search
of HP for "wiz_2637" (w and w/o html suffix) comes up empty.

Since the reference isn't critical to the document - just remove it.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

diff --git a/Documentation/RCU/checklist.rst b/Documentation/RCU/checklist.rst
index bb7128eb322e..f560785ad581 100644
--- a/Documentation/RCU/checklist.rst
+++ b/Documentation/RCU/checklist.rst
@@ -70,7 +70,7 @@ over a rather long period of time, but improvements are always welcome!
 	is less readable and prevents lockdep from detecting locking issues.
 
 	Letting RCU-protected pointers "leak" out of an RCU read-side
-	critical section is every bid as bad as letting them leak out
+	critical section is every bit as bad as letting them leak out
 	from under a lock.  Unless, of course, you have arranged some
 	other means of protection, such as a lock or a reference count
 	-before- letting them out of the RCU read-side critical section.
@@ -129,9 +129,7 @@ over a rather long period of time, but improvements are always welcome!
 		accesses.  The rcu_dereference() primitive ensures that
 		the CPU picks up the pointer before it picks up the data
 		that the pointer points to.  This really is necessary
-		on Alpha CPUs.	If you don't believe me, see:
-
-			http://www.openvms.compaq.com/wizard/wiz_2637.html
+		on Alpha CPUs.
 
 		The rcu_dereference() primitive is also an excellent
 		documentation aid, letting the person reading the
-- 
2.17.1


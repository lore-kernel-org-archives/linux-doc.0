Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B58C4338F
	for <linux-doc@archiver.kernel.org>; Fri, 30 Jul 2021 16:02:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F33060C3F
	for <linux-doc@archiver.kernel.org>; Fri, 30 Jul 2021 16:02:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbhG3QCu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Jul 2021 12:02:50 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:62828 "EHLO
        mx0a-002c1b01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229510AbhG3QCu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Jul 2021 12:02:50 -0400
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
        by mx0a-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16UFvXG0021622;
        Fri, 30 Jul 2021 09:02:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=proofpoint20171006;
 bh=01CgtB2ZQYJGPn837/EzvHv5YSSswAg24Mfgt5V6I70=;
 b=DQdoNPVERCyn1Z44WRs/W2ngwC49l8YIvfPjDWIj9mndPoAckXttLhJKtZenDmxd5JPq
 zPEyDv+oUiotVSKpCjaaDE23NJx5JtpkBio4BjKvFogzVxqyTUA49ue7QO/sW5Ays89i
 tivhwEmb/hmfbXDj3oTvAOVdDb8Z7p8yHhueqPu0AY0Xc7coBDWzOwK+QDcncwBtnUVu
 G/LKy/kKzNNqhZOsldPQzPUpsgGQitpqJ42KXO4ErPOS6qy83f4hvMhXdbdaTPRLxX6G
 fkiPn0OIOnoArdx5hfKrhVMKib6ErD0j658UIUH/SmkgJ2NKoDAyv9CY4VDh0/BtQBKf iA== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
        by mx0a-002c1b01.pphosted.com with ESMTP id 3a4a6m18h5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 30 Jul 2021 09:02:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HG9/ioR5fOWf8hRXPhuLCjvx9E0VphhJIGWZYV4avlS7xOuBWuf7MBGCGcG5EvV0wUAOCEYomcWZicW2P+39dWql7YsCXmX+zwC5MaqLG3YNqsh1YTskf5UXXYX/t1jbnmx8o1M/uls84zLzAVMWFsZHpmPi+KXLlvidGPNNz/UjsOthZd/fhTT6xowLZtlX7rXXVNoacN7U85IzRM/AywQSzyhGoLf4le9EZPHTC/gfTMdlsMpQtV+wV/ysPLv5pApLyHJeKf8yNKq2GgdmNXIVcBJH2zsAb4Ind+eo6aIOY4MGqMoB2v7vI5wpbL6zjsL+U0iSTwqzf2fUAH58hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=01CgtB2ZQYJGPn837/EzvHv5YSSswAg24Mfgt5V6I70=;
 b=jAw7vnVoGPVIiG4RQuIqAhh5OaogBx5mKPUbR/Zek3aku7FGkT93Os+lRQzHDnvmPO33INofjI4UH3IiyF1sH7ErxbJHGnhINPb0A12hqHzNCKotzk5HyOsOB0S8tiTf8KZ8i1skISgXzwj+CQ2GS9ckMuMQAdvZj+Zm4Oj8UMw62bc/rLTKoebocn54xMO1+sEssjNRuVyUuhHZJZ29T2UGZWGd4WvL25BtFfv5WevzX4Uu9WjL3uTjNRqmvszBOyGkXhTr/lLyqOOXz7ycEgSN4eOUCINhOkhBddgHDoj35rYq8jwK8fk/jySJX0pas6rK4egQlppY7IWSetXTxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Authentication-Results: lwn.net; dkim=none (message not signed)
 header.d=none;lwn.net; dmarc=none action=none header.from=nutanix.com;
Received: from DM6PR02MB5578.namprd02.prod.outlook.com (2603:10b6:5:79::13) by
 DM6PR02MB6155.namprd02.prod.outlook.com (2603:10b6:5:1fb::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.25; Fri, 30 Jul 2021 16:02:41 +0000
Received: from DM6PR02MB5578.namprd02.prod.outlook.com
 ([fe80::159:22bc:800a:52b8]) by DM6PR02MB5578.namprd02.prod.outlook.com
 ([fe80::159:22bc:800a:52b8%6]) with mapi id 15.20.4373.022; Fri, 30 Jul 2021
 16:02:41 +0000
From:   Tiberiu A Georgescu <tiberiu.georgescu@nutanix.com>
To:     corbet@lwn.net, linux-doc@vger.kernel.org
Cc:     ivan.teterevkov@nutanix.com, florian.schmidt@nutanix.com,
        carl.waldspurger@nutanix.com, jonathan.davies@nutanix.com,
        Tiberiu A Georgescu <tiberiu.georgescu@nutanix.com>
Subject: [PATCH] Documentation: update pagemap with SOFT_DIRTY & UFFD_WP shmem issue
Date:   Fri, 30 Jul 2021 16:02:27 +0000
Message-Id: <20210730160227.63017-1-tiberiu.georgescu@nutanix.com>
X-Mailer: git-send-email 2.32.0.380.geb27b338a3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0153.namprd03.prod.outlook.com
 (2603:10b6:a03:338::8) To DM6PR02MB5578.namprd02.prod.outlook.com
 (2603:10b6:5:79::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from tiberiu-georgescu.ubvm.nutanix.com (192.146.154.243) by SJ0PR03CA0153.namprd03.prod.outlook.com (2603:10b6:a03:338::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend Transport; Fri, 30 Jul 2021 16:02:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f53cadeb-6eed-47fb-baa6-08d9537375c4
X-MS-TrafficTypeDiagnostic: DM6PR02MB6155:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR02MB61551DB6CDFB3ADDEC334C73E6EC9@DM6PR02MB6155.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ehq/Fju6hrMD8CHLZ6QISF7WMkrVoLodZ40Mev9Hy35Apw/LzdRLgcS3ZB1zBB1iEiM/UO3TS4cqzh/Z8j5BJ63tqnaE1Rm1brF9KfNt00WxFmW5EzV8eXptnsVI8O0SyJnD9urG71NEL3d8h2G95rBEvAmF8Z3sjONbAnGITUpsULpHAlBYtjRlD20AkxmrRY76YEtgPxk+FvwpR9jKlSCiZc8q7yKeCEdNLlcEkffGHEl3F/J7AhUHwzwEQ7XCoZgV8Lj6nLYhscJ9qqa4Oc550fizibdKncq75QupwkxdDwSK6eJpziMS6j5V57SMBz4m8Muua8wE8yB6sZV3zfNhuJuTQrvY/2NaJCJdGjMesw7TTYxaLD2OSjBjbh/pqFlPPlqtPyKe5/d84jbhdAi+P+tpJv3Fr1Yg+/Q45Ax2IGtV5ZQhflsq5jQX91PhbXaijdW3ngI3XfL/8aBZPFMSa5/QXLd5p8HCHdgofa+gFa0/BC3xyePnwkttmYrtaxEtr/NJYPCBCyz1zigCDXpLHujRXaHIYaPGGOLoneWkBxFQT9mrkxFrkk6xRIUIc6Rl5d956K6Vgd3t1kVuFpqc9FC/UpX4JPKIn8qXWFh/D8VGt7I/ioYFnWueV9vyFL+cM7QjE3jpQJOfVQ9e/eYF33OpuQkZ2GnSx4LBauTMYHx9GcYQIH3bFsuEkfWBlmpToRVCv/lV6nvvb2wQ+ONNs+oQfZH6r8qrxCL+I/0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR02MB5578.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(376002)(396003)(366004)(136003)(346002)(6666004)(1076003)(36756003)(478600001)(2906002)(83380400001)(5660300002)(86362001)(107886003)(186003)(6486002)(66946007)(66476007)(66556008)(8676002)(8936002)(956004)(4326008)(52116002)(38100700002)(38350700002)(316002)(26005)(7696005)(2616005)(14143004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RxQFn9UJ4aeYuHcNjdj98uPmh7xIV9ZfBLGNTWN3s3s0IkMJ5NCiX1Kz26x/?=
 =?us-ascii?Q?/sDMdovzvUhc0p4aQuRgpJQqc+0j1Oc3M6t2Dy2fD52Wfzx1VT6kbRnCG0LT?=
 =?us-ascii?Q?KqJOdJSXwKmWQZCMGVM/NoAJ7ZKqbUR00eHe2IHP/UkNu24E+PaoDQLSNYFy?=
 =?us-ascii?Q?lXSN1KgrPH8I8GYoxog0ZKk8cwMjJWN4zPbF33zFs1SJk/w3IbONbxLXRzZZ?=
 =?us-ascii?Q?ilDidXH1C3dYRkY5Fy0HyZZQfCH33/ZpWvF2tnaaVztmL+p4p8D07bgla797?=
 =?us-ascii?Q?pupiO1iH8g32YX1nd0SKmf94qsNrPMO+tV3s190Ar6d3fQCO8oCyK0wUJxf5?=
 =?us-ascii?Q?o4LuEEZbchABDjlgc8M1u0ok6TD12VyGnD0aO9JjmkX42c2mm2lXxrBeW3ff?=
 =?us-ascii?Q?EXUh8A/88uVJcEqP/DPN3sO+ETxmSXM4BRII9NscQAjsud4WqL6uokp6WXzf?=
 =?us-ascii?Q?ajVBurafkiTbinr+P2SSVA5vyzWT7HtB0kj5LIq/dIBKdwXo3hyGQ9xoXj2r?=
 =?us-ascii?Q?1NynxkcyQQLab6DcBZAdMmtVuRhbbd5OXg4mkh9PIVQHSeoyQcdwYcchhvtz?=
 =?us-ascii?Q?oeUFrtMYyS17fO8wf8K+waB9Cc8jKB2GHXHllCHr8cFYQ1DApuyRCLHdimfg?=
 =?us-ascii?Q?hqNGYAdWRr7BmF8D1PKsisuaIvyK49Aze57bldc+ARmmZ2emKe5mSGF2UQiL?=
 =?us-ascii?Q?2pHQNeiVIUGk8O1i/gZFQkOIEusYmtWZkDKf/rsvw6f4hg3bC+uwpCV9Lcw6?=
 =?us-ascii?Q?WJv/UILddsnRfxD5DmqUwyZ6BAHbpyDpfClFOUzZPxr3gNir+bIqUWZUeb8g?=
 =?us-ascii?Q?fmMku5jtu8lBmXIPAAZn05varKyganIo/WwOaVyXuS2BgdP8bzSnJgs5+JKu?=
 =?us-ascii?Q?Yy4AXri+rC/3ig4QVZqY788Wc1hB9DDyv756k7BJZZQPKkF5iBKwF24E/1JT?=
 =?us-ascii?Q?7S4V0yxUTgLOng0aO4mlmrlMlP+rtJJbI1VJ/NY3RetfBm2qBAQbVsqQ7GVu?=
 =?us-ascii?Q?Sk5q4oJInWhkGcoU+2OC2uN04zdJh+NIoVUX101zXzSVcWL72/8n0UgDbSD4?=
 =?us-ascii?Q?DQ85h7ZCwqDQgPL61tTO88q7uSdYlM29arSlZPBCwlXnosdRm5zGWMU4yjBL?=
 =?us-ascii?Q?pQjVgCN1gw85IOijsRLUlY3fd6xubXjjc3CZLSOdm7VjFxXDGaLo9yRNPmy/?=
 =?us-ascii?Q?On88+slPMY4Ltb2C2J7L8sveSHe8wzNlvz0RA+yCxLVSIHAFsaJ0xziCv1tP?=
 =?us-ascii?Q?ERRYEp9Wep+zQOpGuJ6voa1KGEU/Lxx8evjpvWY/hW6JRdCmJVIJbYEb7Z9y?=
 =?us-ascii?Q?mxXqJJmPzKwvwrlV2W0o0tGZ?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f53cadeb-6eed-47fb-baa6-08d9537375c4
X-MS-Exchange-CrossTenant-AuthSource: DM6PR02MB5578.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2021 16:02:41.3756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bVgKVr88cwJ6vlnPl3KC41RriwAjMfVeOJaJEb/WQVItmx4DuK37ECqQ69B9z+W+RsvPG2fQXzsC+NSscKw6ura9FfvJzdZuqNeIdVeS3+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6155
X-Proofpoint-ORIG-GUID: c-OrAx73dnuGXUNMz36ssjzIsF4H3nIm
X-Proofpoint-GUID: c-OrAx73dnuGXUNMz36ssjzIsF4H3nIm
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-30_11:2021-07-30,2021-07-30 signatures=0
X-Proofpoint-Spam-Reason: safe
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Mentioning the current missing functionality of the pagemap, in case
someone stumbles upon unexpected behaviour.

Signed-off-by: Tiberiu A Georgescu <tiberiu.georgescu@nutanix.com>
Reviewed-by: Ivan Teterevkov <ivan.teterevkov@nutanix.com>
Reviewed-by: Florian Schmidt <florian.schmidt@nutanix.com>
Reviewed-by: Carl Waldspurger <carl.waldspurger@nutanix.com>
Reviewed-by: Jonathan Davies <jonathan.davies@nutanix.com>
---
 Documentation/admin-guide/mm/pagemap.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/admin-guide/mm/pagemap.rst b/Documentation/admin-guide/mm/pagemap.rst
index fb578fbbb76c..627f3832b3a2 100644
--- a/Documentation/admin-guide/mm/pagemap.rst
+++ b/Documentation/admin-guide/mm/pagemap.rst
@@ -207,3 +207,9 @@ Before Linux 3.11 pagemap bits 55-60 were used for "page-shift" (which is
 always 12 at most architectures). Since Linux 3.11 their meaning changes
 after first clear of soft-dirty bits. Since Linux 4.2 they are used for
 flags unconditionally.
+
+Note that the page table entries for swappable and non-syncable pages are
+cleared when those pages are zapped or swapped out. This makes information
+about the page disappear from the pagemap.  The location of the swapped
+page can still be retrieved from the page cache, but flags like SOFT_DIRTY
+and UFFD_WP are lost irretrievably.
-- 
2.32.0.380.geb27b338a3


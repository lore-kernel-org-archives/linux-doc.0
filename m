Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7A5337D08B
	for <lwn-linux-doc@archive.lwn.net>; Wed, 16 May 2018 08:24:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752823AbeEPIXv (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 16 May 2018 04:23:51 -0400
Received: from mail-sn1nam02on0070.outbound.protection.outlook.com ([104.47.36.70]:57117
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752239AbeEPIXn (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 16 May 2018 04:23:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=CAVIUMNETWORKS.onmicrosoft.com; s=selector1-cavium-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9z/xbcScPTdvjZ9VDquJhcE+PIXGFhhKP8ekJ2uVLRg=;
 b=DF8Ra14CxgztU2RuMKtRUoxWbR/9R8ZeNWF3JmlfDxysbzpbHQgfr+x4D2EDiOW+5LjM4iMM9eBd1vJ7ViBaGZWq4HVxNoM3gNj3sCk0YltMn1b1y4vY0fbJJz6DdnXc3As3wLVBJPkwwz5Zi7If3rRZ3J5a4Ez95bvItbd120w=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yuri.Norov@cavium.com; 
Received: from localhost (176.59.36.13) by
 SN6PR07MB4383.namprd07.prod.outlook.com (2603:10b6:805:58::14) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.755.16; Wed, 16
 May 2018 08:23:40 +0000
From:   Yury Norov <ynorov@caviumnetworks.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-api@vger.kernel.org
Cc:     Yury Norov <ynorov@caviumnetworks.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Alexander Graf <agraf@suse.de>,
        Alexey Klimov <klimov.linux@gmail.com>,
        Andreas Schwab <schwab@suse.de>,
        Andrew Pinski <pinskia@gmail.com>,
        Bamvor Zhangjian <bamv2005@gmail.com>,
        Chris Metcalf <cmetcalf@mellanox.com>,
        Christoph Muellner <christoph.muellner@theobroma-systems.com>,
        Dave Martin <Dave.Martin@arm.com>,
        "David S . Miller" <davem@davemloft.net>,
        Florian Weimer <fweimer@redhat.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        James Hogan <james.hogan@imgtec.com>,
        James Morse <james.morse@arm.com>,
        Joseph Myers <joseph@codesourcery.com>,
        Lin Yongting <linyongting@huawei.com>,
        Manuel Montezelo <manuel.montezelo@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>,
        Nathan_Lynch <Nathan_Lynch@mentor.com>,
        Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
        Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
        Ramana Radhakrishnan <ramana.gcc@googlemail.com>,
        Steve Ellcey <sellcey@caviumnetworks.com>,
        Szabolcs Nagy <szabolcs.nagy@arm.com>,
        Andrew Pinski <apinski@cavium.com>,
        Andrew Pinski <Andrew.Pinski@caviumnetworks.com>
Subject: [PATCH 23/24] arm64:ilp32: add ARM64_ILP32 to Kconfig
Date:   Wed, 16 May 2018 11:19:08 +0300
Message-Id: <20180516081910.10067-24-ynorov@caviumnetworks.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180516081910.10067-1-ynorov@caviumnetworks.com>
References: <20180516081910.10067-1-ynorov@caviumnetworks.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [176.59.36.13]
X-ClientProxiedBy: VI1PR08CA0126.eurprd08.prod.outlook.com
 (2603:10a6:800:d4::28) To SN6PR07MB4383.namprd07.prod.outlook.com
 (2603:10b6:805:58::14)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(2017052603328)(7153060)(7193020);SRVR:SN6PR07MB4383;
X-Microsoft-Exchange-Diagnostics: 1;SN6PR07MB4383;3:vklxnesREWdhahI0VyEMGHPMFoNwrgFvuXNBvHodWclyN7yMPtkw0Hik7kGolfq/3XrjAR3NUUDrbxfEfcKo48fmtmFDmNx/q6i1IiV2YsmcMPJMr4ApqblrtEwYtFFlw7nlBREdfUdkFlK4Kzivd/A6Kmbx8U5i70irmB3MkFzZZTBTWuLrWKUWS/JEwY/3ac+NKDA4JoDx899gOmthtXEoV8/0UeZ3G1UN4zs41uuMi75R/njHdym8W6hcAVja;25:eCGrSIIJhL59PqA5v7VrYOGDIzbNTNe3e5CEjkaxbDabPZUH22e3W+rd1o8+sbiHRSuO2Q6I/lP7iwSqJ9BGWaRDj9z7zKMuMOH8Ifbbrir1VO5bCUcQAoiiuaW/5ycB8gWTibGteqYB9d1u//PZrRn25raDXPuILy6yhQ1enjPcIUPQVyaYx9LzDnk3EatPdfEF9kTOVux3PQ2YzAipesUFhrlkBYPH3bu1Ym6NnVQao4FyTFn0B6yE2NrkjvfQKeUMS3v3VWRM77H78zT+4DOB0w8Bo7NyaXzrLwD3CuTWvrya15pbZHxP0cqXncPWnPTyylXrJF/W4cdVACD+xQ==;31:iDLtIwNXXII6w5jlbWKfVoWWi0aWbyEmS6cMLa81aaBjjA9H2eERnf54vTEu+rbJcjOp3v7CvUMG0QhSk9L0kOek+7zrb17SJtTQEfI4vdrKlBe3SFJaqHKIyuT0q/a3U7QBUUc8H7r8dARVtX0gt3Sll8/i2sXYLDhax5kCN2XD9PoKTuO2slviM0UYrOQZTHB/kYf+ZteE78mQ6jwucrj3sfnFZsJJtyS/meqJkvs=
X-MS-TrafficTypeDiagnostic: SN6PR07MB4383:
X-Microsoft-Exchange-Diagnostics: 1;SN6PR07MB4383;20:wpz+c0d5VRVYQA415VK0jzdOZWyRFG1qIzUGRKjVlcf2McrMqzrJAQuW4CPRuSRr0wGZPfiesTehvhKOHH/5bJIPzmfg82fplcPMOVVe9UNxCLyg1bKYzejBfuTKn/9+VTugPmyX72vMiLjXsqB/d93GcpAjF2OJjWSJMFMpd80vdSPcNJcndcQ5fmlZjyl+l5dN4UI6vO+2rUsT3wIo12J7ukuKbeWoz0FXQkQaWIScmpeV2lcoTJhJGlA8/fj+mPlDV9+GndTa5X3+X26HedA2IE6VAfiQGePiI9Of8WVZy3gFLRHKvdOvc5fwH/j7SwAn9TvpYxcaIoxOon1jNGjHrA+QH06xAWcFrOlt5ETWGI9sC8jKJmGq8NbrmFAAVLQSWcMuhBQi2R/FI48tRud8snOwcTT9JVH4zPnHewkgrFHPMxw1765MU6ZFn8NmXJdtSV9Mw8FIJXHs3ew8A8dpHRNvT+1RC93teZYX/t+y8fVvj6z0l8d5renoFyTCkoeWMKAywJtLQrgi9cNbtMAS8cHgZ2bNfjihr3LoMtgWlX2wWunKtTIeP6Gtv3Oqb1kyu6NqeqDeXZYaxrlb57ncfvJOq6CHT4atExqDd1Q=;4:dPGTfed35g8qtLgcsweat7z2E/zi+UQUZSCzcnjXxk+aeFjn0YP/dGDXKpkhD3QqhHdH1rwkQ/ykP3Y7WDufMrLdGB4dKQ3w3B6dV/uG3A9zYnd0yLvn3fR0bHH03jOWy6wqaeNyLSeoLsAYDb8abJ/fSOgspOrwPzTSGviqlpAINUo8hJ3+zYdTnubWI1EmpNJTQVYJHxSK4Vc0zS97KBzc97ztVojARBTRhfQggiJEsuAeq+AV6hxM/pfssD+Pd1X+BGkNPoZBmF6qKOzrnWnKkZbwOT17/HpWuYJO4r2zjB7fK+r9H65tgddrkS//
X-Microsoft-Antispam-PRVS: <SN6PR07MB438351A5AF8A2DE5D2174B26E3920@SN6PR07MB4383.namprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(278428928389397);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231254)(944501410)(52105095)(93006095)(3002001)(10201501046)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(20161123564045)(20161123562045)(6072148)(201708071742011);SRVR:SN6PR07MB4383;BCL:0;PCL:0;RULEID:;SRVR:SN6PR07MB4383;
X-Forefront-PRVS: 0674DC6DD3
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(6069001)(346002)(376002)(39860400002)(366004)(396003)(39380400002)(189003)(199004)(6496006)(72206003)(478600001)(446003)(39060400002)(2906002)(11346002)(486006)(3846002)(4326008)(956004)(2616005)(25786009)(6116002)(1076002)(42882007)(53936002)(50466002)(476003)(107886003)(48376002)(50226002)(66066001)(6666003)(47776003)(16586007)(36756003)(68736007)(110136005)(54906003)(8676002)(76506005)(81156014)(81166006)(106356001)(386003)(7416002)(8936002)(76176011)(305945005)(59450400001)(7736002)(5660300001)(97736004)(7406005)(26005)(16526019)(186003)(316002)(105586002)(6486002)(51416003)(52116002);DIR:OUT;SFP:1101;SCL:1;SRVR:SN6PR07MB4383;H:localhost;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: cavium.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;SN6PR07MB4383;23:KQwuG6L7oLAfKuwShUyCd6/graU3odcPifqhVqbW4?=
 =?us-ascii?Q?vBmwmP0ePCFe/B3yjMFCh+p7ibKUIiAqOkZZONbsQBZNkn3qqu8SRR7QhPd7?=
 =?us-ascii?Q?j55uQT1HkQZbNBYtxLBY3WpG+GBE09uNFG6n8Ihi72S97xiHr+2gwwZSy4rf?=
 =?us-ascii?Q?2wLfXKzQTGNRrijLJHvKZ3/bdu5e2HszvjHdjsX69rCwMWg4jux+LCtYsU/o?=
 =?us-ascii?Q?kB7ugPARSYn+cDnpEYodaZddpHnFLLBUBvogvSGJL9SuSeKDjjMrZNVox9BE?=
 =?us-ascii?Q?DltHDzL7os5JKYINU/qIN/tya0NPaGAC6EZAihJsiVDn4DedKB18Z9PcZm79?=
 =?us-ascii?Q?noLKB6+NbtXxxbmFI5/Be9ylBbocl1invshsQC796r+bIC3iuNskxYDb37Ny?=
 =?us-ascii?Q?ADuSrR1Qo1/mWW1jtc9BWSlhVyiqwx5fNb9PQzOBdTBrW4NOftsOTImW0n1M?=
 =?us-ascii?Q?JlfzhvpSUV9E0Uyptrx6PnrHgcILn6E2yrRXtMAOw4NusiZP1DtPoGHGkKr4?=
 =?us-ascii?Q?ofISmk0mXT7JW/xl1x+x9xEOWR5/YM0QvIx2nY92ond9Lf8tZPbWhmGRX1Gd?=
 =?us-ascii?Q?m9mQkGjAdFkP07Gp9imI6dJm8gvehkz4oYBjfPnCF+CBarc+iy6zTr5CtSnr?=
 =?us-ascii?Q?VXYVdUz5E5Fa0tRh020uik44pJbWUilh2V/WDXZlC4lxS8vblcmuDjNV+sEN?=
 =?us-ascii?Q?0RoZEf8edqW3m9lfx642YpG+SalmPYRXe/ke0zdXv9TelSz+A4sDNALjjeDC?=
 =?us-ascii?Q?Jd4dfcry9y4p47k/yht3aR7UhuDzTzPZJgjs0qbrgHaYwW3U2Muol01ePxYt?=
 =?us-ascii?Q?prd7T+j+FsllazB7F1yyi/sO8Dump2rI+g7HQPvC4h9zDjpFUjt+b24gGcIZ?=
 =?us-ascii?Q?rB8qTK4nI0D5qiGSwenX15SSB4FYPpLeREAe21c4MctI0k3nKpwYHYVJARHJ?=
 =?us-ascii?Q?bZwn7nNhs5F2/BwNpyyBvvZy/lx4RuZ0NoiVLvMgJ/qAAJVJcCry1t8UsZaz?=
 =?us-ascii?Q?Zooqm044BADxeZaSsh3jXRk10qQbfSrhNxF71Cz9V9OUen6Myilv5k1QeXIe?=
 =?us-ascii?Q?2Ao4nInYi6jTRLmypWJgT68hr1UFPRs++4wU6X/9jc2U6J55Op8D4aWOmlGs?=
 =?us-ascii?Q?+m8gwJwgnILo+bhcoXEkqTjcyoAjONHko/5p42QKSFZ61cD/WOpAJ2yBri4P?=
 =?us-ascii?Q?uZp2Nb36VsKEMbBrrtMxRf6twGlc7lF7EXEmf7raURN7H7GOUXLC0tNF6vhC?=
 =?us-ascii?Q?WHzwJPXS2RU+FSZi4+8bf20hCCp+1kCwSFVi/iGWThY1J3jwSqhg5SKC6b3E?=
 =?us-ascii?Q?rgl4Y8r+5EzLOE1g0pYgYiClspIAZzo8eLM7Ffbfok6ePGf/xWzfsDUPGy5v?=
 =?us-ascii?Q?emV739MCskHLMFxLYKiR0oc650=3D?=
X-Microsoft-Antispam-Message-Info: g3ZE4DUaU8oxXVbomyijTm0s0UwiUhhrIrA0QxZshDvJf/afYHpvn4NoxVDuQoO86y0MNi5LxVk1T9lzIZDtcFwCCmKZAJLocDygRWsPXcI+N+3QCAw4BnkjcA8m2jNQqfpKY4KQQwoiEaXTEVCcottsvuelLiy1WUr7V2iFbvn9vS6kPZ2C8Rr41F0vV67F
X-Microsoft-Exchange-Diagnostics: 1;SN6PR07MB4383;6:jhvQq/r1W6xq8YhhiVN7bSou6uX1ffbxiEs9YD6yXKBNfkQkSGZsN0CqBAStU6jRhM9pi7IIWxtpoBE5JXChD0tBxcGIi04InqZEQWWaxoOrIFgiNyw8ZE67u7mBaqXOo5bKVQCoJQLJflUXhpf1uBlhrQm2LVuNAy2X9xLqfM7ftuqfGsyBwvg3tR7uGEP+ecfB7g06m03JR83JtVXAy2gB5xyGgIFq5pzaXVOJofVXDiQfrmK9Ax5LE4b4Z9iN9IJw+M44exPp7M4wHMHk4x6KjAyPVvMu/WVJ/te/+Hqw8ejj8PQKJZnWWHRymkCMlqCaW80qKq9DOXKqeYE71MFmdzZaZTgg2YIiZlml2FaPO7A6diNCdY1+R3JnIFJ5rBknI9iBC8FuNPn+OKiqM2j5TA5Xqcu2qZJ+YvfFRPARnsYdJ8SwqvxTUqrtStV0wJkSdGWjIH0Uz/vDD9jslw==;5:CpYDwIuS++ciSb9Ed30LVqvjIRJJfhchqLz4KbCNnuHBaIvE2tcaSMjTvygKYvbdrlTTYZ2vWbhkRe6VoKEhal6GuPJolpsaoOO1Xo9hg1JQLBdpkoa2TD6xg5AI3LqtQgITuGqjXyizdhCarhT0EmHEQrg94Qu4899KLiMRm4E=;24:F+KHwcsymeYaf5TVQP0cVs+r1EQeSX06j7Rk+2f91P+Y9dWNu7TS+KlSB1DjPERic1xAPMPEG6ScIUg6G8QY37MJqDU42gooLO4R0J1wOTQ=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1;SN6PR07MB4383;7:ar4lAM8UE9pQup7taC4D7LIXU3Y1dkrDGtr/Jzrb9vz8ADC9Uu4p3zKXpj9zcYjxozMRVOeHwzudJ0lCgHOjj9+GebN3+yHSBZW00nVWaT1maKZ7KhxT5PuGXYA8YPOJ1L7Lv/biCPzCYR6CSMP7gBaeRzAlKMWfqn8liEyr+lqshuOnVm34eEWuDrjmYSNHyvN/oA4sOtQZ+geyZ2Jh5BeZMWKGgYWAfRocBHEFgTR+tfnAuE1OhO4lstFCkx/G
X-MS-Office365-Filtering-Correlation-Id: 68da309a-4acf-4bfc-777b-08d5bb0654b3
X-OriginatorOrg: caviumnetworks.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2018 08:23:40.2882 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68da309a-4acf-4bfc-777b-08d5bb0654b3
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 711e4ccf-2e9b-4bcf-a551-4094005b6194
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR07MB4383
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Andrew Pinski <apinski@cavium.com>

This patch adds the config option for ILP32.

Signed-off-by: Andrew Pinski <Andrew.Pinski@caviumnetworks.com>
Signed-off-by: Philipp Tomsich <philipp.tomsich@theobroma-systems.com>
Signed-off-by: Christoph Muellner <christoph.muellner@theobroma-systems.com>
Signed-off-by: Yury Norov <ynorov@caviumnetworks.com>
Reviewed-by: David Daney <ddaney@caviumnetworks.com>
---
 arch/arm64/Kconfig | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 0685754a9f7b..a3134b8e3123 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1226,7 +1226,7 @@ source "fs/Kconfig.binfmt"
 
 config COMPAT
 	def_bool y
-	depends on AARCH32_EL0
+	depends on AARCH32_EL0 || ARM64_ILP32
 
 config AARCH32_EL0
 	bool "Kernel support for 32-bit EL0"
@@ -1247,6 +1247,13 @@ config AARCH32_EL0
 
 	  If you want to execute 32-bit userspace applications, say Y.
 
+config ARM64_ILP32
+	bool "Kernel support for ILP32"
+	help
+	  This option enables support for AArch64 ILP32 user space.  ILP32
+	  is an ABI where long and pointers are 32bits but it uses the AARCH64
+	  instruction set.
+
 config SYSVIPC_COMPAT
 	def_bool y
 	depends on COMPAT && SYSVIPC
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

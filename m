Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6A8957D043
	for <lwn-linux-doc@archive.lwn.net>; Wed, 16 May 2018 08:24:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752483AbeEPIYB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 16 May 2018 04:24:01 -0400
Received: from mail-bl2nam02on0069.outbound.protection.outlook.com ([104.47.38.69]:19782
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752007AbeEPIXy (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 16 May 2018 04:23:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=CAVIUMNETWORKS.onmicrosoft.com; s=selector1-cavium-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kVL8oiL7R5aXK/2DmtfKkzryPiH2ZYR5424ChJNB1Dg=;
 b=ZoNxgtj2uARUJsAqsPCFOBweJ4xXb0auRpguiIKW1gDyY8soPAM89XxaIybt1tMjBNQZRLTqDhPPDHZ9zKmlNHGun9zNEjlzzCSuEpqACERt6218gWg5M3oEsneOLrjj00Ers/pm+BSNc7nne4Hhfv3uHTziiM2+oMVvucPjn3s=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yuri.Norov@cavium.com; 
Received: from localhost (176.59.36.13) by
 SN6PR07MB4383.namprd07.prod.outlook.com (2603:10b6:805:58::14) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.755.16; Wed, 16
 May 2018 08:23:50 +0000
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
        Szabolcs Nagy <szabolcs.nagy@arm.com>
Subject: [PATCH 24/24] arm64: ilp32: Make the Kconfig option default y
Date:   Wed, 16 May 2018 11:19:09 +0300
Message-Id: <20180516081910.10067-25-ynorov@caviumnetworks.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180516081910.10067-1-ynorov@caviumnetworks.com>
References: <20180516081910.10067-1-ynorov@caviumnetworks.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [176.59.36.13]
X-ClientProxiedBy: VI1PR08CA0112.eurprd08.prod.outlook.com
 (2603:10a6:800:d4::14) To SN6PR07MB4383.namprd07.prod.outlook.com
 (2603:10b6:805:58::14)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(2017052603328)(7153060)(7193020);SRVR:SN6PR07MB4383;
X-Microsoft-Exchange-Diagnostics: 1;SN6PR07MB4383;3:zrIJyAbrPfzDDY+Th45+NW4MuFQF5UoPB5DsDC7oREYP1GkyTs1sIl8a6JshZYHfh2cFxzyD/6ApL0fZpL0HWswpnSMt2ebiroWp0Ji9jOpks0wt3sohptAHfnSQ/aQyNuAK/4q2eh5o9mctzCmkrTX99aVmEZz3Ukw3R3F3Z5xTFU7+OG4w3N/EZKsTrzx6EgdzT+nybdwn0IIOZrPUfJQegVEbcBuNCpkfjfJyagQq+EoBDsv/rT2002Sk+alt;25:ceLon6GtKiB8HH7c0aM8gEleJDdjFJSGuNH7rb/o+tbbI+qZMfEi5dQIqRZVhJIXzbAoRBk0AQDyGSwO+l+RnK5dXqgNx9T4sWHPOy5ZC8MXW+ihgNtBy8Vqb55WVPqo1ci7jPc7jPy4nhEXsWcLuQ1hNxeBSTl0805Jaf0s4jBhmSMwdpKl/kLu+X+3tnAU3nCo3sfVt6mxuFEK1peJ4FOjG5T/P/imB8AljWGPSYqcScbMr7DwW4qfKHCPujIU2+ls6mameL7SWH6l0fWGVoe3kY7jqtKEyV19meFRRmw+Anh9fN0dcbSdCWBEgEoyHeCCKrGmN7X6cVk3qr2Adw==;31:twglFgpqNcFMisxfMLtU94ztsm1nDASN3dQMvvPv4kIPuxfalxnd8UASsgzBxFMS+Ph82Jbrdh0oZsCnXILgvX3kUNNf9EPGLqLARX+SDlgg7wQzFtTeEJRGb44//Ix5fsiHCy8yuPNWNPPSFlDRh5ujjYSR3X0AG0SQUQBPd5nVZ9vdA8TBknWTLa9TJd5V+URn5VM55qAw5WRPBNQHBcskuNLiyoz7/1io02EKuw4=
X-MS-TrafficTypeDiagnostic: SN6PR07MB4383:
X-Microsoft-Exchange-Diagnostics: 1;SN6PR07MB4383;20:/J2GjyIrH8FfVXo8fr2tdfPGXb6nooDJ6N7M5PEbFDTMUfsF7TYlyFVc9VwVgjBz/3jn/plaXKWU0Vz8oCtTRzEOJSxfbTzj8/EF7xjxBo1FKLAHmum7sOYTv1arrSL86eVTDWs1GWMoPwiSohlKS5Sg9ddSH8WqWzs6Rtmb4oGPgIyrby8IFCyupX9OWvWPZFMI16dUGanu+drgeVwF7uP4Ftv4KXzCyfx4TOofX3dUU+03reudDiNGUDJhaaWhJM/vaU7A/ewm1+GZUsooiFTbec94n1hrNsV4ISEx4wipIghIAudEkugvF7xDXBBojjruhjEeRgXqdHJyGrMm4g6S5hmpKn3usNqZIbPZdZdpXjuPy3zUMGx57jQmkEOmy6a/r7v8kp3p+U69O1nb/YWSQzmAPp+Ji9XZZ9aZzEBpiFV/sX/36EWgWKFwS9W+a2Qat1e1II3hRpxJO3vA3xfRyj8xv83BREA6hQTxr5ZHbGZVcGy624qM8pQ7inO+G5gkqWB04Zs/T9Jx3qbhBbc2bK3txrDfX0hRCtv5pKxEje5IkU6S0PHV95WBGlwXDl344HPOcuyd4qDAiq8ucCFpfHL+dOuP5C92rIFarCg=;4:Q1tYUippVCwb/hTU2JTRIdKa+rDHn9n6t7/qftgq6SeuMqcLyW8eHfvkXAOld6qiMO3SVzpEitcW1yj7rqXCUkCbsSJJyi+6jxV0FarkQIhuag4ZbuGvSq8YchSOgYEOgvmWvIl/p+gfmho1ooy3IXu4W258ImdkRQixmrM1E3I91b8J4Z3OLXBYPiR5eL8ZISqVeCxhhTl4eClTmq88DgV+Y0pVLpxgvpTUMeOLs64QUL7RATqtzfDDXq6+zfmGIx9oDJ2TIThCQyKy3/c3wvBelISoHssqiauFytJzN6yAyskBQYmlJl+NvjESYto6
X-Microsoft-Antispam-PRVS: <SN6PR07MB4383A3A8E4EE78D4D98EE786E3920@SN6PR07MB4383.namprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(180628864354917);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231254)(944501410)(52105095)(93006095)(3002001)(10201501046)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(20161123564045)(20161123562045)(6072148)(201708071742011);SRVR:SN6PR07MB4383;BCL:0;PCL:0;RULEID:;SRVR:SN6PR07MB4383;
X-Forefront-PRVS: 0674DC6DD3
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(6069001)(346002)(376002)(39860400002)(366004)(396003)(39380400002)(189003)(199004)(6496006)(72206003)(478600001)(446003)(39060400002)(2906002)(11346002)(486006)(3846002)(4326008)(956004)(2616005)(25786009)(6116002)(1076002)(42882007)(53936002)(50466002)(476003)(48376002)(50226002)(66066001)(6666003)(47776003)(16586007)(36756003)(68736007)(110136005)(54906003)(8676002)(76506005)(81156014)(81166006)(106356001)(386003)(7416002)(8936002)(76176011)(305945005)(7736002)(5660300001)(97736004)(7406005)(26005)(16526019)(186003)(316002)(105586002)(6486002)(51416003)(52116002)(129723003);DIR:OUT;SFP:1101;SCL:1;SRVR:SN6PR07MB4383;H:localhost;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: cavium.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;SN6PR07MB4383;23:lwaAb4TZWVSVOJsi9kLOTbPfgYzhAgZ53FeoABrwP?=
 =?us-ascii?Q?nLq8pBQHPAwHqI2ani9Azp/w+jd3fW08AzuOcIHyXCvApnS+jdSqTcOQKrk+?=
 =?us-ascii?Q?5GUsZsNcaT6uuygAAQvH9f3ibb5e1iq/FkvzEvmhlhtOG0t96NAfwhLPDrvi?=
 =?us-ascii?Q?PJQFA+Wazv810V8ykkbEOg323Wk8FYgD/eQAX8xOlhyg8skNCfb1AVmsYe0M?=
 =?us-ascii?Q?kZdVYG8sYsEpr67adeoX0+77VhNHdOEB2WMhzk7X5GwJvZiX7DpXTi4zMsgR?=
 =?us-ascii?Q?QI3i8ba62xKxMhV62wiMSxdwwNyuSz06oKxeOoLg1fGnDIjruYFl/Px3wXuh?=
 =?us-ascii?Q?U6Hv22YYW3ewWkj/sgz+LaBpeP0KUKCxUHNa3JMDVxuxtSCCRvnAEGYbLOsT?=
 =?us-ascii?Q?uslplBWjLmHCimaTp0U/UoWICff5nERqZQN7ifaDraoJaYtnZ4ZqIYL9lGc5?=
 =?us-ascii?Q?hZDpqFXJKCnSI+c78mpNvfTOcaz9MnRXB8dXQDlIvqq76H7amIfdbj5XOhJN?=
 =?us-ascii?Q?7d3Te4xWKmEiDdDk2nL/vSXqMVzDkgaI6a8t4juTiXQ4L8YF8RmM+2FPcDXq?=
 =?us-ascii?Q?2KYNUd89E3kHExG4E8n3zd/XRyfG7Vy/37FUcJI8merxxza4xiJDgvfM/Uxr?=
 =?us-ascii?Q?odlLeyJpA6qR27sCDewOCCnOS8i0g6JKnGchhZz4Pcy5hF6lFzHTK6OJoOws?=
 =?us-ascii?Q?vZBBpK4BhqbarHnFklZ0Mj8w46AKASt813SfE5rS+ZtBothTm451YwgILGCP?=
 =?us-ascii?Q?ImM+VxNqOtj0CDf9G8dEbWj6iwuzm5d1FjrGaqr4bEOBsCREwaCnwcunocqY?=
 =?us-ascii?Q?EXgYEKikX3wybNPLZWpJK2rqrjaOHmNuFUrmQBSRNvlhucWyIX5DrB4rvH8v?=
 =?us-ascii?Q?9VHWI07L58t2IgW5Dkhp6/duFZvHWR4oBf0bnxQ4cT0fBCn86wD1AAOrESu8?=
 =?us-ascii?Q?bbSYCPTdAaUWhMDCojf3Wg3Ty0KGXdgwd9eaBMGzDAPwI5EZMeQV5Lvo6p0F?=
 =?us-ascii?Q?VF3PpetVVBMqsA0Rv5IWl4psAuSxUmSMWt++tm6Xrcnfn15esviX/yS0GUbC?=
 =?us-ascii?Q?So8YJEKo1hDRqgq5ZrzGYRmMFWdMzFt2q37oKibBNOp3FOx1CkZe7MnEmlhL?=
 =?us-ascii?Q?WXl4PoMo7zMlWV00FHsLbgV4etzFacUcz4X0UnegT+OWz6yST8MFjODZmdKo?=
 =?us-ascii?Q?hu/hgaKGJTuc9woQIlW715hOwoLRzwxUnifxIvF+jHk7av5QZ/dM9hGHUTrG?=
 =?us-ascii?Q?rFFrCpL29aUS8GBTRSKfNV/6gar2gnNMqbPm1Xw/KOaBdlAF6dOgp8vXBOAZ?=
 =?us-ascii?Q?lwnWuk9D+TWldJufIlMc3XXM+xtlw6ioegOmv/dN4b0v4viibXcFHZBF07nb?=
 =?us-ascii?Q?FA6AQ=3D=3D?=
X-Microsoft-Antispam-Message-Info: MEZRS/mkiPsiSkih184xf4ceIzj2LWiSSETGWC6iwjoh7DJEjGAhHF27chiOGJ7i8wJ/OOXYKfshTnkIm0/tcezx8Emw/KJJA9tb/oYSqwNo9dkpmTkaC5cbXf9apPDw+B8AYSckUWCX5s58rPdC//3uIg9dbVR7WlmlpoNPT9cn8coxq9dqSY6JaENGa7Zq
X-Microsoft-Exchange-Diagnostics: 1;SN6PR07MB4383;6:3OADtAsOdb9M5GoxHU2hauAS1a9h444+dnRAgzcZ6nQ1IkF7MJrLbCxCyuDb2kYpoKW/+KnJ7SRW3WvwCeBO0vCeY6D1xBWKIxOqc6PBWN++zt5MQxgkJ7AwTCZtgs1L+bNYBzPnCAweXqHiY3Gxn1ySfuAkOmQ9k9Socznz7EIxl8raKVJv96PKaZ2VtbfDYbaoDP1pIR0F8q2Bwmwj25QAs8QJPAMWrbn3vmMSRRn7+UuIWfOlvyg+8v4sX/L6rfqsTWr0BK4Cyk9JrSuAIGTtZ7n/NTi5FpY1MoDvuz5G9B0bKKa/+ODXDv85KHOhlblhZyhP+h9l8+vGVxpZrLKyjfG+8HGM5BJbEkjsWoKI/SCxk+U49zpf09vvyFPc9gRJ7o9UwFhwajcP1i5nPIRpCiXRYvM3y1CxGdwzZf3ILE3FkxbJR/kOz/dRTjtNYR70pdk2pET4Ah3po7DSPA==;5:HSz93eapkGOYJ/+Z3nH792ZC88nvCgI5kxgRVIJcuHbcQQ/AIJz6L5V7huiNeE21F0COaXd0Nh+Is6gD95lPJO5r1CeHu30kFHLWeOzv7haGUy9MgH96VUuueqHslyItmMdWRPN60tXqRi5SmPe663r+PT8UrurfPCcyl6fLAzo=;24:mNE9rO2tpNzIRDScCyMxg0aK65wFDO3rxs8JZ6ZTzfHfABblUa8X9IbZQbYjjnh935wKVhOHPWgi00W654ZF+/tiBokBNJWxwr1imwIXft0=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1;SN6PR07MB4383;7:BKw91MCc3GNHltmeK5juFUexSfb0lLcPprhVU/vHftK0iAqlo7orD5EeOHGGFsE+q9tEtlVcilVK6gLNWOZ0Bv2ibiUc/BDfljDaqHRgxp0u//Qgl/K1cd4j0GFex6Ml9c+MdSeoyV1Wmh6QcjVDv1nejlOFMmYNntsKgO/SBkXyyzug1GoruziFIKjKU9+XMXuYVE3iTjumTECi9Vk0IPLDn3RERx//K3zrSQQ10OIFK9S385wYvoDLhNWRTmE+
X-MS-Office365-Filtering-Correlation-Id: cd4fcafa-ba62-484d-d34f-08d5bb065abe
X-OriginatorOrg: caviumnetworks.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2018 08:23:50.3821 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd4fcafa-ba62-484d-d34f-08d5bb065abe
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 711e4ccf-2e9b-4bcf-a551-4094005b6194
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR07MB4383
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Catalin Marinas <catalin.marinas@arm.com>

The intention of the ILP32 branches is to enable ILP32 by default. This
default is to be revisited for upstream merging.

Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Yury Norov <ynorov@caviumnetworks.com>
---
 arch/arm64/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index a3134b8e3123..3551990a2726 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1249,6 +1249,7 @@ config AARCH32_EL0
 
 config ARM64_ILP32
 	bool "Kernel support for ILP32"
+	default y
 	help
 	  This option enables support for AArch64 ILP32 user space.  ILP32
 	  is an ABI where long and pointers are 32bits but it uses the AARCH64
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

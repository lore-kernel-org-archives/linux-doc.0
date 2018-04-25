Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DDE8F7DD32
	for <lwn-linux-doc@archive.lwn.net>; Wed, 25 Apr 2018 21:33:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751334AbeDYVdI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 25 Apr 2018 17:33:08 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:34392 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751231AbeDYVdH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Apr 2018 17:33:07 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w3PLT9kO007189
        for <linux-doc@vger.kernel.org>; Wed, 25 Apr 2018 17:33:07 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2hjy8xdhd9-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Wed, 25 Apr 2018 17:33:07 -0400
Received: from localhost
        by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <bryantly@linux.vnet.ibm.com>;
        Wed, 25 Apr 2018 17:33:06 -0400
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
        by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Wed, 25 Apr 2018 17:33:01 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com [9.57.199.109])
        by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w3PLX05S2490676;
        Wed, 25 Apr 2018 21:33:00 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A5E76112051;
        Wed, 25 Apr 2018 17:32:36 -0400 (EDT)
Received: from bryants-mbp-4.rchland.ibm.com (unknown [9.10.79.118])
        by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id BAF8311204B;
        Wed, 25 Apr 2018 17:32:35 -0400 (EDT)
From:   "Bryant G. Ly" <bryantly@linux.vnet.ibm.com>
To:     benh@kernel.crashing.org, mpe@ellerman.id.au,
        gregkh@linuxfoundation.org, arnd@arndb.de
Cc:     corbet@lwn.net, seroyer@linux.vnet.ibm.com,
        mrochs@linux.vnet.ibm.com, adreznec@linux.vnet.ibm.com,
        fbarrat@linux.vnet.ibm.com, davem@davemloft.net,
        linus.walleij@linaro.org, akpm@linux-foundation.org,
        rdunlap@infradead.org, mikey@neuling.org, pombredanne@nexb.com,
        tlfalcon@linux.vnet.ibm.com, msuchanek@suse.de,
        linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        tomburks@linux.vnet.ibm.com,
        "Bryant G. Ly" <bryantly@linux.vnet.ibm.com>
Subject: [PATCH v2 0/1] misc: IBM Virtual Management Channel Driver (VMC)
Date:   Wed, 25 Apr 2018 16:32:56 -0500
X-Mailer: git-send-email 2.7.2
X-TM-AS-GCONF: 00
x-cbid: 18042521-0040-0000-0000-00000422271F
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008921; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000257; SDB=6.01023227; UDB=6.00522336; IPR=6.00802462;
 MB=3.00020782; MTD=3.00000008; XFM=3.00000015; UTC=2018-04-25 21:33:05
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18042521-0041-0000-0000-000008282759
Message-Id: <1524691977-1456-1-git-send-email-bryantly@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-04-25_06:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1804250196
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Steven Royer had previously attempted to upstream this
driver two years ago, but never got the chance to address
the concerns from Greg Kroah-Hartman.

The thread with the initial upstream is:
https://lkml.org/lkml/2016/2/16/918

I have addressed the following:

Version 1:
- Documentation
- Use of dev_dbg instead of pr_dbg
- Change to misc class
- Fixed memory barrier usages
- Addressed styling, checkpatch, renaming of functions
- General fixes to the driver to make it more inline with
  existing upstream drivers.

Version 2:
- Changed Documentation from .rst to .txt and addressed
  small changes in documentation per request from Randy.
- Clarified Documentation based upon Linus Walleij's
  comments
- Fixed kbuild warning in regards to unititialized use of
  rc

Bryant G. Ly (1):
  misc: IBM Virtual Management Channel Driver (VMC)

 Documentation/ioctl/ioctl-number.txt  |    1 +
 Documentation/misc-devices/ibmvmc.rst |  226 +++
 MAINTAINERS                           |    6 +
 arch/powerpc/include/asm/hvcall.h     |    1 +
 drivers/misc/Kconfig                  |   14 +
 drivers/misc/Makefile                 |    1 +
 drivers/misc/ibmvmc.c                 | 2418 +++++++++++++++++++++++++++++++++
 drivers/misc/ibmvmc.h                 |  209 +++
 8 files changed, 2876 insertions(+)
 create mode 100644 Documentation/misc-devices/ibmvmc.rst
 create mode 100644 drivers/misc/ibmvmc.c
 create mode 100644 drivers/misc/ibmvmc.h

-- 
2.7.2

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

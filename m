Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7074A7E677
	for <lwn-linux-doc@archive.lwn.net>; Mon, 23 Apr 2018 14:47:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755367AbeDWOrF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 23 Apr 2018 10:47:05 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51808 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1755264AbeDWOrE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 23 Apr 2018 10:47:04 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w3NEiTtp128144
        for <linux-doc@vger.kernel.org>; Mon, 23 Apr 2018 10:47:03 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2hhgxa24um-1
        (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Mon, 23 Apr 2018 10:47:03 -0400
Received: from localhost
        by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <bryantly@linux.vnet.ibm.com>;
        Mon, 23 Apr 2018 10:47:02 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
        by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Mon, 23 Apr 2018 10:46:57 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
        by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w3NEkvCJ55836898;
        Mon, 23 Apr 2018 14:46:57 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 6163AAC03F;
        Mon, 23 Apr 2018 10:48:24 -0400 (EDT)
Received: from bryants-mbp-4.rchland.ibm.com (unknown [9.10.79.118])
        by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id 7D8B3AC041;
        Mon, 23 Apr 2018 10:48:23 -0400 (EDT)
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
        "Bryant G. Ly" <bryantly@linux.vnet.ibm.com>
Subject: [PATCH v1 0/1] misc: IBM Virtual Management Channel Driver
Date:   Mon, 23 Apr 2018 09:46:51 -0500
X-Mailer: git-send-email 2.7.2
X-TM-AS-GCONF: 00
x-cbid: 18042314-0056-0000-0000-00000443A740
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008906; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000257; SDB=6.01022133; UDB=6.00521681; IPR=6.00801368;
 MB=3.00020727; MTD=3.00000008; XFM=3.00000015; UTC=2018-04-23 14:47:01
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18042314-0057-0000-0000-00000887B0E8
Message-Id: <1524494812-60150-1-git-send-email-bryantly@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-04-23_05:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1804230148
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
- Documentation
- Use of dev_dbg instead of pr_dbg
- Change to misc class
- Fixed memory barrier usages
- Addressed styling, checkpatch, renaming of functions
- General fixes to the driver to make it more inline with
  existing upstream drivers.

Bryant G. Ly (1):
  misc: IBM Virtual Management Channel Driver

 Documentation/ioctl/ioctl-number.txt  |    1 +
 Documentation/misc-devices/ibmvmc.txt |  161 +++
 MAINTAINERS                           |    6 +
 arch/powerpc/include/asm/hvcall.h     |    1 +
 drivers/misc/Kconfig                  |    9 +
 drivers/misc/Makefile                 |    1 +
 drivers/misc/ibmvmc.c                 | 2413 +++++++++++++++++++++++++++++++++
 drivers/misc/ibmvmc.h                 |  215 +++
 8 files changed, 2807 insertions(+)
 create mode 100644 Documentation/misc-devices/ibmvmc.txt
 create mode 100644 drivers/misc/ibmvmc.c
 create mode 100644 drivers/misc/ibmvmc.h

-- 
2.7.2

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

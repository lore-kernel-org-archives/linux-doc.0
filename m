Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id ABE077DE79
	for <lwn-linux-doc@archive.lwn.net>; Wed,  9 May 2018 05:35:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933748AbeEIFf5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 9 May 2018 01:35:57 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:37272 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S933674AbeEIFfx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 May 2018 01:35:53 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w495XvDK016357
        for <linux-doc@vger.kernel.org>; Wed, 9 May 2018 01:35:53 -0400
Received: from e06smtp11.uk.ibm.com (e06smtp11.uk.ibm.com [195.75.94.107])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2hus4dkwj3-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Wed, 09 May 2018 01:35:53 -0400
Received: from localhost
        by e06smtp11.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <alastair@au1.ibm.com>;
        Wed, 9 May 2018 06:35:50 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
        by e06smtp11.uk.ibm.com (192.168.101.141) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Wed, 9 May 2018 06:35:47 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w495ZlWh48693428;
        Wed, 9 May 2018 05:35:47 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 10446A4040;
        Wed,  9 May 2018 06:27:27 +0100 (BST)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B0F9FA404D;
        Wed,  9 May 2018 06:27:26 +0100 (BST)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Wed,  9 May 2018 06:27:26 +0100 (BST)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 1A038A026B;
        Wed,  9 May 2018 15:35:45 +1000 (AEST)
From:   "Alastair D'Silva" <alastair@au1.ibm.com>
To:     linuxppc-dev@lists.ozlabs.org
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        mikey@neuling.org, vaibhav@linux.vnet.ibm.com,
        aneesh.kumar@linux.vnet.ibm.com, malat@debian.org,
        felix@linux.vnet.ibm.com, pombredanne@nexb.com,
        sukadev@linux.vnet.ibm.com, npiggin@gmail.com,
        gregkh@linuxfoundation.org, arnd@arndb.de,
        andrew.donnellan@au1.ibm.com, fbarrat@linux.vnet.ibm.com,
        corbet@lwn.net, "Alastair D'Silva" <alastair@d-silva.org>
Subject: [PATCH v4 0/7] ocxl: Implement Power9 as_notify/wait for OpenCAPI
Date:   Wed,  9 May 2018 15:34:59 +1000
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180509004212.4506-1-alastair@au1.ibm.com>
References: <20180509004212.4506-1-alastair@au1.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18050905-0040-0000-0000-0000045791A3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18050905-0041-0000-0000-000020FB9AD6
Message-Id: <20180509053506.9754-1-alastair@au1.ibm.com>
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-05-09_01:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805090056
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Alastair D'Silva <alastair@d-silva.org>

The Power 9 as_notify/wait feature provides a lower latency way to
signal a thread that work is complete. This series enables the use of
this feature from OpenCAPI adapters, as well as addressing a potential
starvation issue when allocating thread IDs.

Changelog:
v4:
  Remove the "unique" statement from the set_thread_tidr function and
    move the text explaining why it is safe from the commit message
    to the function description
v3:
  Fix references to POWER9
  Remove stray whitespace edit from docs
  Add more details to commit message for "use task_pid_nr()"
  Retitle patch 6 to indicate OCXL rather than CPU features
v2:
  Rename get_platform IOCTL to get_features
  Move stray edit from patch 1 to patch 3

Alastair D'Silva (7):
  powerpc: Add TIDR CPU feature for POWER9
  powerpc: Use TIDR CPU feature to control TIDR allocation
  powerpc: use task_pid_nr() for TID allocation
  ocxl: Rename pnv_ocxl_spa_remove_pe to clarify it's action
  ocxl: Expose the thread_id needed for wait on POWER9
  ocxl: Add an IOCTL so userspace knows what OCXL features are available
  ocxl: Document new OCXL IOCTLs

 Documentation/accelerators/ocxl.rst   |  11 ++++
 arch/powerpc/include/asm/cputable.h   |   3 +-
 arch/powerpc/include/asm/pnv-ocxl.h   |   2 +-
 arch/powerpc/include/asm/switch_to.h  |   1 -
 arch/powerpc/kernel/dt_cpu_ftrs.c     |   1 +
 arch/powerpc/kernel/process.c         | 101 +---------------------------------
 arch/powerpc/platforms/powernv/ocxl.c |   4 +-
 drivers/misc/ocxl/context.c           |   5 +-
 drivers/misc/ocxl/file.c              |  78 ++++++++++++++++++++++++++
 drivers/misc/ocxl/link.c              |  38 ++++++++++++-
 drivers/misc/ocxl/ocxl_internal.h     |   1 +
 include/misc/ocxl.h                   |   9 +++
 include/uapi/misc/ocxl.h              |  14 +++++
 13 files changed, 163 insertions(+), 105 deletions(-)

-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

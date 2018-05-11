Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 72E837E688
	for <lwn-linux-doc@archive.lwn.net>; Fri, 11 May 2018 06:29:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752357AbeEKGPE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 11 May 2018 02:15:04 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:54566 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752272AbeEKGPC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 May 2018 02:15:02 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w4B69DJZ021933
        for <linux-doc@vger.kernel.org>; Fri, 11 May 2018 02:15:02 -0400
Received: from e06smtp12.uk.ibm.com (e06smtp12.uk.ibm.com [195.75.94.108])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2hw17jhqc5-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Fri, 11 May 2018 02:15:02 -0400
Received: from localhost
        by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <alastair@au1.ibm.com>;
        Fri, 11 May 2018 07:14:59 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
        by e06smtp12.uk.ibm.com (192.168.101.142) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Fri, 11 May 2018 07:14:56 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w4B6EtS950397292
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 11 May 2018 06:14:55 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0837152047;
        Fri, 11 May 2018 06:05:11 +0100 (BST)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id A97055203F;
        Fri, 11 May 2018 06:05:10 +0100 (BST)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ozlabs.au.ibm.com (Postfix) with ESMTPSA id ED54FA038E;
        Fri, 11 May 2018 16:14:51 +1000 (AEST)
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
Subject: [PATCH v5 6/7] ocxl: Add an IOCTL so userspace knows what OCXL features are available
Date:   Fri, 11 May 2018 16:13:02 +1000
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180511061303.10728-1-alastair@au1.ibm.com>
References: <20180511061303.10728-1-alastair@au1.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18051106-0008-0000-0000-000004F56B90
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18051106-0009-0000-0000-00001E89BB60
Message-Id: <20180511061303.10728-7-alastair@au1.ibm.com>
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-05-11_03:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805110057
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Alastair D'Silva <alastair@d-silva.org>

In order for a userspace AFU driver to call the POWER9 specific
OCXL_IOCTL_ENABLE_P9_WAIT, it needs to verify that it can actually
make that call.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 drivers/misc/ocxl/file.c | 25 +++++++++++++++++++++++++
 include/uapi/misc/ocxl.h |  6 ++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/misc/ocxl/file.c b/drivers/misc/ocxl/file.c
index eb409a469f21..33ae46ce0a8a 100644
--- a/drivers/misc/ocxl/file.c
+++ b/drivers/misc/ocxl/file.c
@@ -168,12 +168,32 @@ static long afu_ioctl_enable_p9_wait(struct ocxl_context *ctx,
 }
 #endif
 
+
+static long afu_ioctl_get_features(struct ocxl_context *ctx,
+		struct ocxl_ioctl_features __user *uarg)
+{
+	struct ocxl_ioctl_features arg;
+
+	memset(&arg, 0, sizeof(arg));
+
+#ifdef CONFIG_PPC64
+	if (cpu_has_feature(CPU_FTR_P9_TIDR))
+		arg.flags[0] |= OCXL_IOCTL_FEATURES_FLAGS0_P9_WAIT;
+#endif
+
+	if (copy_to_user(uarg, &arg, sizeof(arg)))
+		return -EFAULT;
+
+	return 0;
+}
+
 #define CMD_STR(x) (x == OCXL_IOCTL_ATTACH ? "ATTACH" :			\
 			x == OCXL_IOCTL_IRQ_ALLOC ? "IRQ_ALLOC" :	\
 			x == OCXL_IOCTL_IRQ_FREE ? "IRQ_FREE" :		\
 			x == OCXL_IOCTL_IRQ_SET_FD ? "IRQ_SET_FD" :	\
 			x == OCXL_IOCTL_GET_METADATA ? "GET_METADATA" :	\
 			x == OCXL_IOCTL_ENABLE_P9_WAIT ? "ENABLE_P9_WAIT" :	\
+			x == OCXL_IOCTL_GET_FEATURES ? "GET_FEATURES" :	\
 			"UNKNOWN")
 
 static long afu_ioctl(struct file *file, unsigned int cmd,
@@ -239,6 +259,11 @@ static long afu_ioctl(struct file *file, unsigned int cmd,
 		break;
 #endif
 
+	case OCXL_IOCTL_GET_FEATURES:
+		rc = afu_ioctl_get_features(ctx,
+				(struct ocxl_ioctl_features __user *) args);
+		break;
+
 	default:
 		rc = -EINVAL;
 	}
diff --git a/include/uapi/misc/ocxl.h b/include/uapi/misc/ocxl.h
index 561e6f0dfcb7..97937cfa3baa 100644
--- a/include/uapi/misc/ocxl.h
+++ b/include/uapi/misc/ocxl.h
@@ -55,6 +55,11 @@ struct ocxl_ioctl_p9_wait {
 	__u64 reserved3[3];
 };
 
+#define OCXL_IOCTL_FEATURES_FLAGS0_P9_WAIT	0x01
+struct ocxl_ioctl_features {
+	__u64 flags[4];
+};
+
 struct ocxl_ioctl_irq_fd {
 	__u64 irq_offset;
 	__s32 eventfd;
@@ -70,5 +75,6 @@ struct ocxl_ioctl_irq_fd {
 #define OCXL_IOCTL_IRQ_SET_FD	_IOW(OCXL_MAGIC, 0x13, struct ocxl_ioctl_irq_fd)
 #define OCXL_IOCTL_GET_METADATA _IOR(OCXL_MAGIC, 0x14, struct ocxl_ioctl_metadata)
 #define OCXL_IOCTL_ENABLE_P9_WAIT	_IOR(OCXL_MAGIC, 0x15, struct ocxl_ioctl_p9_wait)
+#define OCXL_IOCTL_GET_FEATURES _IOR(OCXL_MAGIC, 0x16, struct ocxl_ioctl_features)
 
 #endif /* _UAPI_MISC_OCXL_H */
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

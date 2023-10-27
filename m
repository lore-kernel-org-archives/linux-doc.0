Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75F513FFE
	for <linux-doc@vger.kernel.org>; Fri, 27 Oct 2023 08:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IqYb4tSs"
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 093C21715;
	Fri, 27 Oct 2023 01:19:25 -0700 (PDT)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39R5jE8b007095;
	Fri, 27 Oct 2023 08:19:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2023-03-30;
 bh=l2Ve0RbGhs4TQpF+YaCkmro1guzF3Tr3hOAoJy3n7Ow=;
 b=IqYb4tSsvfPIyfvDqcOu2UMkZPCa27H3dhNLiNTxvJ5h2FFAv2MbIUi/Uxi1I42TJ/Zk
 5zc8q5wlAshf4NFQ+DBtNF7NBfa3xEJiACFZL9XaVDGzQ0crVauXlRGyixFdjgvDtslU
 7q62GZNSJCU2yoVQxB38UYePLLKT85TaSz3GMgNCuhATrlttHuVLVV4us2ndZ12zXrQw
 T1m0MNDj2haHXrSnpcQWzcQCWLe6nvCSpQS830O8EAWW0K/v+BieOHakd8PUxpqdfQDl
 3zuCq/48nRCT0NZlB/D5JyR0LME+luW/xBlJDTsJEyP3bSRZ34FJPkeWwex+OujxHPpV Kw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3tywtt0yn3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Oct 2023 08:19:21 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 39R6F1X2009189;
	Fri, 27 Oct 2023 08:19:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3tywqjebeb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Oct 2023 08:19:06 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39R8Ig9Z028975;
	Fri, 27 Oct 2023 08:19:05 GMT
Received: from t460-2.nl.oracle.com (dhcp-10-175-63-126.vpn.oracle.com [10.175.63.126])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 3tywqjeb1g-9;
	Fri, 27 Oct 2023 08:19:05 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jani Nikula <jani.nikula@intel.com>, linux-kernel@vger.kernel.org,
        Vegard Nossum <vegard.nossum@oracle.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Julien Panis <jpanis@baylibre.com>
Subject: [PATCH RFC 08/11] doc: misc-device: properly format ToC heading
Date: Fri, 27 Oct 2023 10:18:27 +0200
Message-Id: <20231027081830.195056-9-vegard.nossum@oracle.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231027081830.195056-1-vegard.nossum@oracle.com>
References: <20231027081830.195056-1-vegard.nossum@oracle.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-27_06,2023-10-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310240000
 definitions=main-2310270071
X-Proofpoint-GUID: FNcKRM6DNqO1Ow8JFJXL0xe-LzKCc-aS
X-Proofpoint-ORIG-GUID: FNcKRM6DNqO1Ow8JFJXL0xe-LzKCc-aS

"class:: toc-title" was a workaround for older Sphinx versions that are
no longer supported.

The canonical way to add a heading to the ToC is to use :caption:.
Do that.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Julien Panis <jpanis@baylibre.com>
Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 Documentation/misc-devices/index.rst | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/misc-devices/index.rst b/Documentation/misc-devices/index.rst
index ecc40fbbcfb8..1fc89d664830 100644
--- a/Documentation/misc-devices/index.rst
+++ b/Documentation/misc-devices/index.rst
@@ -7,11 +7,8 @@ Assorted Miscellaneous Devices Documentation
 This documentation contains information for assorted devices that do not
 fit into other categories.
 
-.. class:: toc-title
-
-	   Table of contents
-
 .. toctree::
+   :caption: Table of contents
    :maxdepth: 2
 
    ad525x_dpot
-- 
2.34.1


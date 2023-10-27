Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6AC13AF3
	for <linux-doc@vger.kernel.org>; Fri, 27 Oct 2023 08:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="4RIEmFU/"
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61F7A10D0;
	Fri, 27 Oct 2023 01:19:12 -0700 (PDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39R5iCdd020786;
	Fri, 27 Oct 2023 08:18:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2023-03-30;
 bh=LAEaozT4QqgZE84FVGuX7tOgFZQKNBd0vZkJmsXPoh8=;
 b=4RIEmFU/cPmAlSyiC+tXdGDRKDI0s67Eehi9tm+dQhgqnGLkbLQBHzY5WPs+d1XnoeV0
 vGKRZWxGjFsztublzUTs+i/RWvACnKLKW1I20HdZX1ON2CclHOY0Yx7JQIETtBPsic74
 wo/TM12beTAalTTYb6NbCEv6+3puXdR3mVlUBLZA1BoRUaL8bEargdgTThbU6gc1hhDm
 Wv/Jy7J8tSpTWvoEWSOmaA3TWkOpLMkvMZV5f0ncb72DwuO92OqDbfLytuQTUTsEvFe+
 Q9Nmfp+G6vrA+HW66gQRNfAdSOpJq4A0Lb/Z7tDrll3zltu3UX48uN+Mfc2mP9b9j3JS 1Q== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3tyx4tgx04-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Oct 2023 08:18:48 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 39R62lNv009264;
	Fri, 27 Oct 2023 08:18:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3tywqjeb7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Oct 2023 08:18:48 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39R8Ig9N028975;
	Fri, 27 Oct 2023 08:18:47 GMT
Received: from t460-2.nl.oracle.com (dhcp-10-175-63-126.vpn.oracle.com [10.175.63.126])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 3tywqjeb1g-3;
	Fri, 27 Oct 2023 08:18:47 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jani Nikula <jani.nikula@intel.com>, linux-kernel@vger.kernel.org,
        Vegard Nossum <vegard.nossum@oracle.com>, Rui Li <me@lirui.org>,
        Yanteng Si <siyanteng@loongson.cn>, Wu XiangCheng <bobwxc@email.cn>
Subject: [PATCH RFC 02/11] doc: userspace-api: properly format ToC headings
Date: Fri, 27 Oct 2023 10:18:21 +0200
Message-Id: <20231027081830.195056-3-vegard.nossum@oracle.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231027081830.195056-1-vegard.nossum@oracle.com>
References: <20231027081830.195056-1-vegard.nossum@oracle.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-27_06,2023-10-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=664 mlxscore=0
 spamscore=0 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310240000
 definitions=main-2310270071
X-Proofpoint-GUID: ZsdjRiu4E0N0YFVQjp1yEforhYRYX6RD
X-Proofpoint-ORIG-GUID: ZsdjRiu4E0N0YFVQjp1yEforhYRYX6RD

"class:: toc-title" was a workaround for older Sphinx versions that are
no longer supported.

The canonical way to add a heading to the ToC is to use :caption:.
Do that.

Cc: Rui Li <me@lirui.org>
Cc: Yanteng Si <siyanteng@loongson.cn>
Cc: Wu XiangCheng <bobwxc@email.cn>
Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 Documentation/translations/zh_CN/userspace-api/index.rst | 5 +----
 Documentation/userspace-api/index.rst                    | 5 +----
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/Documentation/translations/zh_CN/userspace-api/index.rst b/Documentation/translations/zh_CN/userspace-api/index.rst
index 5dc0f2e69c17..5b14721c8264 100644
--- a/Documentation/translations/zh_CN/userspace-api/index.rst
+++ b/Documentation/translations/zh_CN/userspace-api/index.rst
@@ -17,11 +17,8 @@ Linux 内核用户空间API指南
 在代码树中仍然可以找到有关用户空间的部分信息。这个手册意在成为这些信息
 聚集的地方。
 
-.. class:: toc-title
-
-	   目录
-
 .. toctree::
+   :caption: 目录
    :maxdepth: 2
 
    no_new_privs
diff --git a/Documentation/userspace-api/index.rst b/Documentation/userspace-api/index.rst
index 72a65db0c498..5b32a461c2dd 100644
--- a/Documentation/userspace-api/index.rst
+++ b/Documentation/userspace-api/index.rst
@@ -9,11 +9,8 @@ While much of the kernel's user-space API is documented elsewhere
 also be found in the kernel tree itself.  This manual is intended to be the
 place where this information is gathered.
 
-.. class:: toc-title
-
-	   Table of contents
-
 .. toctree::
+   :caption: Table of contents
    :maxdepth: 2
 
    no_new_privs
-- 
2.34.1


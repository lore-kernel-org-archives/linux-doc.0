Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7587213ACF
	for <linux-doc@vger.kernel.org>; Fri, 27 Oct 2023 08:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Yas+hTB6"
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24E141AA;
	Fri, 27 Oct 2023 01:18:55 -0700 (PDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39R5iCdc020786;
	Fri, 27 Oct 2023 08:18:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2023-03-30;
 bh=XiYBzT666XUrJBEenylzauji4KGI2RRUgvA0UHv3h4o=;
 b=Yas+hTB6dx4N568I6QVS8R1FAu0ig/u0ZNN/EIJsAzpJTg3i4OSHjEsc0hRKfDXh+a1y
 C2KATGg/ojZBkNwWYXp3oZuqOR89oWqYbmjHTPYnMkEtZrbm9g6cL6/ra00M8klFlyLr
 Al2D7T0EtZCi5to4CZnjqEB1182OHWTK4TODiQJtrZ0agDVLxtymtK2v5/M+aNzVAsr5
 ynIYwmQZ6ab3OQIuUZme7YWkGh1/SEDkGaXoXFATpEKmR89F1We2C3JnlMa3ILtVyAKA
 +R8Ifr5ZhO+ur74kpeP1CeIlPHWTTJyYKHiH1YuwZO4Tx6n8zP8LDMysP9fr1MGlgDsg Qg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3tyx4tgx01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Oct 2023 08:18:45 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 39R6Bkhg009253;
	Fri, 27 Oct 2023 08:18:45 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3tywqjeb6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Oct 2023 08:18:45 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39R8Ig9L028975;
	Fri, 27 Oct 2023 08:18:44 GMT
Received: from t460-2.nl.oracle.com (dhcp-10-175-63-126.vpn.oracle.com [10.175.63.126])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 3tywqjeb1g-2;
	Fri, 27 Oct 2023 08:18:44 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jani Nikula <jani.nikula@intel.com>, linux-kernel@vger.kernel.org,
        Vegard Nossum <vegard.nossum@oracle.com>
Subject: [PATCH RFC 01/11] docs: style toctree captions as headings
Date: Fri, 27 Oct 2023 10:18:20 +0200
Message-Id: <20231027081830.195056-2-vegard.nossum@oracle.com>
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
X-Proofpoint-GUID: QAlaJOtZyHK1XoTMy3SD0PnWrVYs97TY
X-Proofpoint-ORIG-GUID: QAlaJOtZyHK1XoTMy3SD0PnWrVYs97TY

The rtd theme already styles toctree captions as headings, but the
alabaster theme doesn't. Add this in.

Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 Documentation/sphinx-static/custom.css | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index 084a884f6fb7..c7439349dda6 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -8,6 +8,9 @@ div.body h1 { font-size: 180%; }
 div.body h2 { font-size: 150%; }
 div.body h3 { font-size: 130%; }
 
+/* toctree captions are styled like h2 */
+div.toctree-wrapper p.caption[role=heading] { font-size: 150%; }
+
 /* Tighten up the layout slightly */
 div.body { padding: 0 15px 0 10px; }
 div.sphinxsidebarwrapper { padding: 1em 0.4em; }
-- 
2.34.1


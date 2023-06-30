Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7E4DEB64DD
	for <linux-doc@archiver.kernel.org>; Fri, 30 Jun 2023 07:20:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232240AbjF3HUv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Jun 2023 03:20:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231979AbjF3HUv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Jun 2023 03:20:51 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0C3E10EC;
        Fri, 30 Jun 2023 00:20:49 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35U3dYwD007863;
        Fri, 30 Jun 2023 07:20:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=j+11ZVorPPMQW3+7fsK9veT9qpQLADFNDkaBhW+l4PM=;
 b=DEBTrPQ2VFtFrrwG/phyZ16KK6WYPoZ8PC/rFX/+27VdcWFxiMM8ia//wJNJMLEttw8E
 2CoCcqYhL/zcMn+1cIWPlrqJul0jimCpaRd0TKkVqF29JQuQ0lFuFPjUfMRMrNZEcV9L
 KLezs/eqxZTmH0clbX4XGzDkCcZvFKDlwPhuXivUBk6fqRGOW2fkpKM4lNZnaIQQIFpD
 81nOjcglB/NLZ6ZeqNOl5cWYu7PvAUOLiB1LD8toxezV+hEES9h5p3ktzp+Q3MyvQ293
 R31sKPZYwlijtoVfzQxVxSoWj+wGHMI765rxlEW7/7HANF8i6UNAOht8RTUFL5qBa4U8 Vw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rh7aetdj6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 30 Jun 2023 07:20:41 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35U7KeXe025907
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 30 Jun 2023 07:20:40 GMT
Received: from subashab-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.7; Fri, 30 Jun 2023 00:20:39 -0700
From:   Subash Abhinov Kasiviswanathan <quic_subashab@quicinc.com>
To:     <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <netdev@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <corbet@lwn.net>,
        <quic_jhugo@quicinc.com>, <dnlplm@gmail.com>
CC:     Subash Abhinov Kasiviswanathan <quic_subashab@quicinc.com>
Subject: [PATCH net] Documentation: ABI: sysfs-class-net-qmi: pass_through contact update
Date:   Fri, 30 Jun 2023 01:20:20 -0600
Message-ID: <1688109620-23833-1-git-send-email-quic_subashab@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SpQ8BI12-ULABDrXcu5AZTshNNkDFh8I
X-Proofpoint-ORIG-GUID: SpQ8BI12-ULABDrXcu5AZTshNNkDFh8I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-30_04,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1011 suspectscore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306300061
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Switch to the quicinc.com id.

Fixes: bd1af6b5fffd ("Documentation: ABI: sysfs-class-net-qmi: document pass-through file")
Signed-off-by: Subash Abhinov Kasiviswanathan <quic_subashab@quicinc.com>
---
 Documentation/ABI/testing/sysfs-class-net-qmi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-class-net-qmi b/Documentation/ABI/testing/sysfs-class-net-qmi
index 47e6b97..b028f5b 100644
--- a/Documentation/ABI/testing/sysfs-class-net-qmi
+++ b/Documentation/ABI/testing/sysfs-class-net-qmi
@@ -62,7 +62,7 @@ Description:
 What:		/sys/class/net/<iface>/qmi/pass_through
 Date:		January 2021
 KernelVersion:	5.12
-Contact:	Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>
+Contact:	Subash Abhinov Kasiviswanathan <quic_subashab@quicinc.com>
 Description:
 		Boolean.  Default: 'N'
 
-- 
2.7.4


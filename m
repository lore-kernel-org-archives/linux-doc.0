Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A3727448
	for <linux-doc@vger.kernel.org>; Tue, 31 Oct 2023 22:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E91AD107;
	Tue, 31 Oct 2023 15:40:50 -0700 (PDT)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39VM9GJE004517;
	Tue, 31 Oct 2023 18:40:36 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3u38jds73p-925
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Oct 2023 18:40:36 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 39VIMLDO034712
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 31 Oct 2023 14:22:21 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Tue, 31 Oct
 2023 14:22:20 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 31 Oct 2023 14:22:20 -0400
Received: from daniel-Precision-5530.ad.analog.com ([10.48.65.198])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 39VIM1d5022309;
	Tue, 31 Oct 2023 14:22:14 -0400
From: Daniel Matyas <daniel.matyas@analog.com>
To: 
CC: Daniel Matyas <daniel.matyas@analog.com>,
        Jean Delvare
	<jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet
	<corbet@lwn.net>, <linux-hwmon@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 4/5] hwmon: max31827: Return closest value in update_interval
Date: Tue, 31 Oct 2023 20:21:56 +0200
Message-ID: <20231031182158.124608-4-daniel.matyas@analog.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231031182158.124608-1-daniel.matyas@analog.com>
References: <20231031182158.124608-1-daniel.matyas@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: _fSsahaF-pzgaOHeyfgC5Qpb6ZYBvaiw
X-Proofpoint-ORIG-GUID: _fSsahaF-pzgaOHeyfgC5Qpb6ZYBvaiw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-31_09,2023-10-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=924
 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0
 phishscore=0 malwarescore=0 clxscore=1015 mlxscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2310240000
 definitions=main-2310310186

When user writes a value to update_interval which does not match the
possible values, instead of returning invalid error, return the closest
value.

Signed-off-by: Daniel Matyas <daniel.matyas@analog.com>
---

v6: Added patch.

 drivers/hwmon/max31827.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/max31827.c b/drivers/hwmon/max31827.c
index 41e4f716605a..13ebe691475a 100644
--- a/drivers/hwmon/max31827.c
+++ b/drivers/hwmon/max31827.c
@@ -360,9 +360,8 @@ static int max31827_write(struct device *dev, enum hwmon_sensor_types type,
 			       val < max31827_conversions[res])
 				res++;
 
-			if (res == ARRAY_SIZE(max31827_conversions) ||
-			    val != max31827_conversions[res])
-				return -EINVAL;
+			if (res == ARRAY_SIZE(max31827_conversions))
+				res = ARRAY_SIZE(max31827_conversions) - 1;
 
 			res = FIELD_PREP(MAX31827_CONFIGURATION_CNV_RATE_MASK,
 					 res);
-- 
2.34.1


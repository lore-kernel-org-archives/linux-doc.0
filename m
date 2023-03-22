Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26A2DC6FD1F
	for <linux-doc@archiver.kernel.org>; Wed, 22 Mar 2023 22:04:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbjCVWEc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Mar 2023 18:04:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229871AbjCVWEa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Mar 2023 18:04:30 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEF3510413
        for <linux-doc@vger.kernel.org>; Wed, 22 Mar 2023 15:04:29 -0700 (PDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32MLt2XV003406
        for <linux-doc@vger.kernel.org>; Wed, 22 Mar 2023 22:04:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : references : to : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=1e7xSsLbQplYJGkDFpxrlHRXdlKoqX1vhxiMrXvLSgQ=;
 b=ri+NYSIjb0G1MMVO+D599PEqjxnQwIpn4dOCEGfoaLvqVmvbxJxdt6d+Maxwp5LOKpPU
 i6eF1vsCcI67Ul2xokRWtdGb2dx8P0z2hatBQ+hWVQQdIiF7glZobY62JcxG/2i7cCRG
 8+d9dYDu9qpW8JFaUajQeTlGT8gwdqbCB0BvQE79tukVcj9QYUp9jnRUV0fx3tuRrylG
 RIfQZOpcWxfTM/Vdwd/WG9CKuVsJOsKOsypj97XC+/lR5l5AuRMQ9wLBb73AcDfSFN9k
 bRWui2xX0oGPRZtA6B6UN0he8sdgOxJ3nXW9p4B5603fwndyDrUskRxe9MOupoh08Msr vw== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pga0w05tp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Wed, 22 Mar 2023 22:04:29 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
        by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32MJWuNl011975
        for <linux-doc@vger.kernel.org>; Wed, 22 Mar 2023 22:04:28 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
        by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3pd4x72j71-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Wed, 22 Mar 2023 22:04:28 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
        by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32MM4RFU27787820
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <linux-doc@vger.kernel.org>; Wed, 22 Mar 2023 22:04:27 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 4719C5805D
        for <linux-doc@vger.kernel.org>; Wed, 22 Mar 2023 22:04:27 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0FF9B58053
        for <linux-doc@vger.kernel.org>; Wed, 22 Mar 2023 22:04:27 +0000 (GMT)
Received: from [9.160.167.235] (unknown [9.160.167.235])
        by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP
        for <linux-doc@vger.kernel.org>; Wed, 22 Mar 2023 22:04:26 +0000 (GMT)
Message-ID: <a3289dfb-da44-47ce-9f3b-1f5c9dec900c@linux.ibm.com>
Date:   Wed, 22 Mar 2023 18:04:26 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Fwd: Documentation on IMA for Linux Kernel Documentation
Content-Language: en-US
References: <60ac4c41-65b8-3c3d-7e31-1a580e728ca5@infradead.org>
To:     linux-doc@vger.kernel.org
From:   Ken Goldman <kgold@linux.ibm.com>
In-Reply-To: <60ac4c41-65b8-3c3d-7e31-1a580e728ca5@infradead.org>
X-Forwarded-Message-Id: <60ac4c41-65b8-3c3d-7e31-1a580e728ca5@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: KLVOH7yU2nXPwYJHLxsZXXZBeH2OJ33K
X-Proofpoint-GUID: KLVOH7yU2nXPwYJHLxsZXXZBeH2OJ33K
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_18,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 clxscore=1011 spamscore=0 mlxlogscore=496 suspectscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303220158
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

I'm writing documentation on IMA targeting users (not kernel 
developers).  It includes concepts, details on writing policies, the IMA 
event log format, utilities, and more.  It aggregates existing scattered 
documentation, but adds much more.  It's maybe 1/2 done.

Questions:

1. Are there people who could look at it and see if I'm on the right path?

It's a lot of work.  I'd like to know that it has some chance of acceptance.

2. What is the process for getting a block of documentation added to 
https://www.kernel.org/doc/html?



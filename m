Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC42C6FD1C
	for <linux-doc@archiver.kernel.org>; Fri, 24 Mar 2023 21:30:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231924AbjCXVax (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 24 Mar 2023 17:30:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231864AbjCXVav (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Mar 2023 17:30:51 -0400
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 007D519F2F
        for <linux-doc@vger.kernel.org>; Fri, 24 Mar 2023 14:30:48 -0700 (PDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32OK1s7O023157
        for <linux-doc@vger.kernel.org>; Fri, 24 Mar 2023 21:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date : to :
 from : subject : content-type : content-transfer-encoding : mime-version;
 s=pp1; bh=31YoTRDV29vrbxHR92ConsN1QShr+CnS36IdwmGEaPE=;
 b=ldnhjIyYDxMa3VzGP/df1pCmqs94ufqHP8I5NPD+fjy2tsIG9p6FyY2lP07Na7KtCAkm
 HsG1cAEUfZjqhDrHjsY/g5res4VcnA4tLCY8dolCj2aqMjzwpfc71Y7X5tgwcCaNtxep
 qTj0tGAXs0W1xpibs70I0N8CpYAiVolmL+tTslBEas0ZUNQin1YsO9M1HGzHue+VFw4G
 hueqFyNBKVXfBxWpVvKMCA4/vLfkn/aINtn5dMh9pH14roa/JylcliY0R79HvKQSEl4t
 Yf40w8fqfq84sNEMc+ct/g8AJ5+davwWUHLSCTBmR2TKNiwjRgv9k0NYhfyQ/vrCz4E+ oQ== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3phjhua8sy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Fri, 24 Mar 2023 21:30:48 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
        by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32OL5rNo002401
        for <linux-doc@vger.kernel.org>; Fri, 24 Mar 2023 21:30:47 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([9.208.129.114])
        by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3pgy3tf4ve-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Fri, 24 Mar 2023 21:30:47 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
        by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32OLUjcu51642832
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <linux-doc@vger.kernel.org>; Fri, 24 Mar 2023 21:30:46 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E59F358053
        for <linux-doc@vger.kernel.org>; Fri, 24 Mar 2023 21:30:45 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id AF92A58043
        for <linux-doc@vger.kernel.org>; Fri, 24 Mar 2023 21:30:45 +0000 (GMT)
Received: from [9.160.56.143] (unknown [9.160.56.143])
        by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP
        for <linux-doc@vger.kernel.org>; Fri, 24 Mar 2023 21:30:45 +0000 (GMT)
Message-ID: <e747b0ba-7992-36c7-f931-08aac46385f1@linux.ibm.com>
Date:   Fri, 24 Mar 2023 17:30:44 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To:     linux-doc@vger.kernel.org
Content-Language: en-US
From:   Ken Goldman <kgold@linux.ibm.com>
Subject: sphinx - proper method for linking
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: r5xZ5mkV3pVMwOBQ1bLdyLjm-rPqAc0_
X-Proofpoint-GUID: r5xZ5mkV3pVMwOBQ1bLdyLjm-rPqAc0_
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=451 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303240160
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

1. What is the recommended way to link to documents outside my tree.

Should I be doing that, or is it fragile / not recommended?

Are links to other documents stable?

How about sections within the page?

I found that this .rst works.

See 
https://www.kernel.org/doc/html/latest/security/keys/trusted-encrypted.html

Is that OK, or is there a better way?

Is that link (doc/html/latest) correct.

2. Are my pages and headings to be treated as stable, like an API? I.e., 
once I release documentation, are all the pages and headings frozen so 
they will not break links?




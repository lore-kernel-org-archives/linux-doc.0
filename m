Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B7A527D90F
	for <lwn-linux-doc@archive.lwn.net>; Thu, 18 Jul 2019 11:18:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727655AbfGRLSG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 18 Jul 2019 07:18:06 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:40304 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726495AbfGRLSE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Jul 2019 07:18:04 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x6IB2f9f022835
        for <linux-doc@vger.kernel.org>; Thu, 18 Jul 2019 07:18:02 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2ttnu3n251-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Thu, 18 Jul 2019 07:18:02 -0400
Received: from localhost
        by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.ibm.com>;
        Thu, 18 Jul 2019 12:18:00 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
        by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Thu, 18 Jul 2019 12:17:58 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x6IBHv9559179204
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 18 Jul 2019 11:17:58 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D51E1A4051;
        Thu, 18 Jul 2019 11:17:57 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 767EEA4059;
        Thu, 18 Jul 2019 11:17:57 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.8.168])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Thu, 18 Jul 2019 11:17:57 +0000 (GMT)
Date:   Thu, 18 Jul 2019 14:17:55 +0300
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Jeremy Cline <jcline@redhat.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/vm: transhuge: fix typo in madvise reference
References: <20190716144908.25843-1-jcline@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190716144908.25843-1-jcline@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 19071811-0016-0000-0000-00000293FDE1
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071811-0017-0000-0000-000032F1D99E
Message-Id: <20190718111755.GF20726@rapoport-lnx>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-07-18_05:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907180122
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jul 16, 2019 at 10:49:08AM -0400, Jeremy Cline wrote:
> Fix an off-by-one typo in the transparent huge pages admin
> documentation.
> 
> Signed-off-by: Jeremy Cline <jcline@redhat.com>

Acked-by: Mike Rapoport <rppt@linux.ibm.com>

> ---
>  Documentation/admin-guide/mm/transhuge.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
> index 7ab93a8404b9..bd5714547cee 100644
> --- a/Documentation/admin-guide/mm/transhuge.rst
> +++ b/Documentation/admin-guide/mm/transhuge.rst
> @@ -53,7 +53,7 @@ disabled, there is ``khugepaged`` daemon that scans memory and
>  collapses sequences of basic pages into huge pages.
> 
>  The THP behaviour is controlled via :ref:`sysfs <thp_sysfs>`
> -interface and using madivse(2) and prctl(2) system calls.
> +interface and using madvise(2) and prctl(2) system calls.
> 
>  Transparent Hugepage Support maximizes the usefulness of free memory
>  if compared to the reservation approach of hugetlbfs by allowing all
> -- 
> 2.21.0
> 

-- 
Sincerely yours,
Mike.


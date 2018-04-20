Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 01DDB7E279
	for <lwn-linux-doc@archive.lwn.net>; Fri, 20 Apr 2018 22:55:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753057AbeDTWzG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 20 Apr 2018 18:55:06 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:36028 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753051AbeDTWzF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 Apr 2018 18:55:05 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.22/8.16.0.22) with SMTP id w3KMkMfB094613;
        Fri, 20 Apr 2018 22:54:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2017-10-26;
 bh=F7Uy/7mPImc/OiZ3IgKngE7VP8A8ggYEke/8WNPK0LU=;
 b=MXyCW+3ZXmkTaP3iLUdh7+1lOrgMVMgisaT1XNMS3xq+NcjTX9V36doQnsGrnIxKSY8S
 b6W30/O+wbHTDOm1mDnJGNv909wKpDi2WJvZds/4Udp8xyOZfHHG7L3iwA2riq8xHDqe
 qWwffnZnAZz8tESNd/EsQ0ga0k7s9ojF9SW8+7EnBtJyQHYVVI8rYyOj8+Cipg8y3F0j
 lmbd7Ppo76OP+YAxZnsbuxRS37JDfNa81MdSXBWIjnFdViewqKAJhzJmOLP1sIuf7S4g
 83QyjeGWA1Pvqs55Wg+RMmR5RlGsvPdc3cBoUs9IWrLZ79ADToXjHsD6cu1vXcpK/9YF Jw== 
Received: from userv0022.oracle.com (userv0022.oracle.com [156.151.31.74])
        by aserp2130.oracle.com with ESMTP id 2hf7amv067-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 20 Apr 2018 22:54:39 +0000
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userv0022.oracle.com (8.14.4/8.14.4) with ESMTP id w3KMscO8026240
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 20 Apr 2018 22:54:38 GMT
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id w3KMsbFP030281;
        Fri, 20 Apr 2018 22:54:37 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 20 Apr 2018 22:54:37 +0000
To:     Randy Dunlap <rd.dunlab@gmail.com>
Cc:     "Nicholas A. Bellinger" <nab@linux-iscsi.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
        linux-doc@vger.kernel.org,
        "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: target: clean up kernel-doc and add driver-api document
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20180414175106.13760-1-rd.dunlab@gmail.com>
Date:   Fri, 20 Apr 2018 18:54:34 -0400
In-Reply-To: <20180414175106.13760-1-rd.dunlab@gmail.com> (Randy Dunlap's
        message of "Sat, 14 Apr 2018 10:51:02 -0700")
Message-ID: <yq1tvs5h4k5.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=8869 signatures=668698
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=266
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1711220000 definitions=main-1804200227
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Randy,

> This patch series fixes kernel-doc warnings in drivers/target/ and its
> header files, then adds a Documentation driver-api chapter for target
> driver interfaces.

Applied to 4.18/scsi-queue. Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

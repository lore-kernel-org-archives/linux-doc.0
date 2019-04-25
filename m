Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 538D47D08A
	for <lwn-linux-doc@archive.lwn.net>; Thu, 25 Apr 2019 23:32:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728268AbfDYXcJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 25 Apr 2019 19:32:09 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:41096 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726781AbfDYXcJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Apr 2019 19:32:09 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3PNOXWd035390;
        Thu, 25 Apr 2019 23:31:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=waTWw+kcL/HdEyMs/PKQkW1VcQyCyLTnQ9LBeYK9jt4=;
 b=k7VDx2RJxkZAkqeAQLCPZfzvvuX8twqxU6YpvjoeGrU6R3y6jiKkQ4HiwaMdKGnnO1Qg
 GO8jq2j0mMWElpFgZMSV9WGF3qVJoUbvdJxSdbadS6VwGAN5QXz9qTC2bUTWMXSceS96
 oiaauaMsjTxNTEiUT5oQuEeagzUw7mxc8CDFaWCLkiaaMgDOqYk5mijfzXaTp4vj3RqH
 zwBXmPkGsuI9vqGIW0xOVqMEyu/bcMwjXBeQjVD+wUsWbWYc1T1ICjZDICR9u9c/Klrq
 Nzi04BXB9HyETu8xOWl02jsCxd4eEgeSAT6saXYa/t3pQ9ztKohvzO/xzeowyRbLpzai 5w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 2rytutb835-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 25 Apr 2019 23:31:45 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3PNUWRB168756;
        Thu, 25 Apr 2019 23:31:44 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 2s0fv4f7rv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 25 Apr 2019 23:31:44 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x3PNVgff025335;
        Thu, 25 Apr 2019 23:31:43 GMT
Received: from [192.168.1.222] (/71.63.128.209)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 25 Apr 2019 16:31:42 -0700
Subject: Re: [PATCH] docs/vm: Minor editorial changes in the THP and hugetlbfs
 documentation.
To:     rcampbell@nvidia.com, linux-mm@kvack.org
Cc:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>
References: <20190425190426.10051-1-rcampbell@nvidia.com>
From:   Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <0551948d-1aa7-273b-46ef-ff66f9ba64d4@oracle.com>
Date:   Thu, 25 Apr 2019 16:31:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190425190426.10051-1-rcampbell@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9238 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1904250144
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9238 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1904250144
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 4/25/19 12:04 PM, rcampbell@nvidia.com wrote:
> From: Ralph Campbell <rcampbell@nvidia.com>
> 
> Some minor wording changes and typo corrections.
> 
> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Mike Rapoport <rppt@linux.vnet.ibm.com>
> Cc: Mike Kravetz <mike.kravetz@oracle.com>

hugetlbfs_reserv.rst changes,
Acked-by: Mike Kravetz <mike.kravetz@oracle.com>

Thanks for cleaning this up!
-- 
Mike Kravetz

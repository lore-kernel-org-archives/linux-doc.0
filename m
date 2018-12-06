Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DAA2B7D089
	for <lwn-linux-doc@archive.lwn.net>; Thu,  6 Dec 2018 07:33:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728953AbeLFHdB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 6 Dec 2018 02:33:01 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:56672 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727620AbeLFHdB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Dec 2018 02:33:01 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wB67OPQU134196
        for <linux-doc@vger.kernel.org>; Thu, 6 Dec 2018 02:33:00 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2p6txdtanf-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Thu, 06 Dec 2018 02:33:00 -0500
Received: from localhost
        by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.ibm.com>;
        Thu, 6 Dec 2018 07:32:57 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
        by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Thu, 6 Dec 2018 07:32:54 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id wB67Wr6E4522278
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 6 Dec 2018 07:32:53 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B6E57A4057;
        Thu,  6 Dec 2018 07:32:53 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id EF771A405B;
        Thu,  6 Dec 2018 07:32:52 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.206.89])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Thu,  6 Dec 2018 07:32:52 +0000 (GMT)
Date:   Thu, 6 Dec 2018 09:32:51 +0200
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Wei Yang <richard.weiyang@gmail.com>
Cc:     david@redhat.com, mhocko@suse.com, osalvador@suse.de,
        akpm@linux-foundation.org, linux-doc@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH v2 2/2] core-api/memory-hotplug.rst: divide Locking
 Internal section by different locks
References: <20181205023426.24029-1-richard.weiyang@gmail.com>
 <20181206002622.30675-1-richard.weiyang@gmail.com>
 <20181206002622.30675-2-richard.weiyang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181206002622.30675-2-richard.weiyang@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 18120607-4275-0000-0000-000002ECD798
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18120607-4276-0000-0000-000037F9E630
Message-Id: <20181206073250.GI19181@rapoport-lnx>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-12-06_01:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=786 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1812060068
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Dec 06, 2018 at 08:26:22AM +0800, Wei Yang wrote:
> Currently locking for memory hotplug is a little complicated.
> 
> Generally speaking, we leverage the two global lock:
> 
>   * device_hotplug_lock
>   * mem_hotplug_lock
> 
> to serialise the process.
> 
> While for the long term, we are willing to have more fine-grained lock
> to provide higher scalability.
> 
> This patch divides Locking Internal section based on these two global
> locks to help readers to understand it. Also it adds some new finding to
> enrich it.
> 
> [David: words arrangement]
> 
> Signed-off-by: Wei Yang <richard.weiyang@gmail.com>

Reviewd-by: Mike Rapoport <rppt@linux.ibm.com>

> ---
> v2: adjustment based on David and Mike comment
> ---
>  Documentation/core-api/memory-hotplug.rst | 27 ++++++++++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/core-api/memory-hotplug.rst b/Documentation/core-api/memory-hotplug.rst
> index de7467e48067..51d477ad4b80 100644
> --- a/Documentation/core-api/memory-hotplug.rst
> +++ b/Documentation/core-api/memory-hotplug.rst
> @@ -89,6 +89,20 @@ NOTIFY_STOP stops further processing of the notification queue.
>  Locking Internals
>  =================
>  
> +In addition to fine grained locks like pgdat_resize_lock, there are three locks
> +involved
> +
> +- device_hotplug_lock
> +- mem_hotplug_lock
> +- device_lock
> +
> +Currently, they are twisted together for all kinds of reasons. The following
> +part is divided into device_hotplug_lock and mem_hotplug_lock parts
> +respectively to describe those tricky situations.
> +
> +device_hotplug_lock
> +---------------------
> +
>  When adding/removing memory that uses memory block devices (i.e. ordinary RAM),
>  the device_hotplug_lock should be held to:
>  
> @@ -111,13 +125,20 @@ As the device is visible to user space before taking the device_lock(), this
>  can result in a lock inversion.
>  
>  onlining/offlining of memory should be done via device_online()/
> -device_offline() - to make sure it is properly synchronized to actions
> -via sysfs. Holding device_hotplug_lock is advised (to e.g. protect online_type)
> +device_offline() - to make sure it is properly synchronized to actions via
> +sysfs. Even if mem_hotplug_lock is used to protect the process, because of the
> +lock inversion described above, holding device_hotplug_lock is still advised
> +(to e.g. protect online_type)
> +
> +mem_hotplug_lock
> +---------------------
>  
>  When adding/removing/onlining/offlining memory or adding/removing
>  heterogeneous/device memory, we should always hold the mem_hotplug_lock in
>  write mode to serialise memory hotplug (e.g. access to global/zone
> -variables).
> +variables). Currently, we take advantage of this to serialise sparsemem's
> +mem_section handling in sparse_add_one_section() and
> +sparse_remove_one_section().
>  
>  In addition, mem_hotplug_lock (in contrast to device_hotplug_lock) in read
>  mode allows for a quite efficient get_online_mems/put_online_mems
> -- 
> 2.15.1
> 

-- 
Sincerely yours,
Mike.


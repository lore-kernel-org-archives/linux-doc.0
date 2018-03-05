Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 67B5B7E654
	for <lwn-linux-doc@archive.lwn.net>; Mon,  5 Mar 2018 21:44:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933085AbeCEVoK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 5 Mar 2018 16:44:10 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:48386 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932084AbeCEVoG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Mar 2018 16:44:06 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.22/8.16.0.22) with SMTP id w25LbSJE073806;
        Mon, 5 Mar 2018 21:42:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2017-10-26;
 bh=zkbCMJDLPLQoDizzaJ4h33qsF4WO/bPfUGNByg+HeWs=;
 b=go1AewbW1anFtFnCkXL0w1tlekiR9ykNftY9HxlaxNvr3Se9ED41cur6WG5QzUfPCzDj
 3Z5emZioYGdo+BcI6wb6TjmKsiRiu/HnbZCmgbXdRLX+DG7ptz+ddTNHE/RUhV8/jJbg
 kGIg3d58LsvQOK/ig6CPJS1hSPDtU+ZH9JC4HZ51St8g8GFzHwNmCx0QdImAyqKGpRwJ
 MGBBQT5xtB8d83blsqt8CZ1L/CB6m946wgkPbGKZc6vUTU2iKfRAH26O2tadsEChgL/i
 3VHJHKLPsMYQcb19EkY3fKGmwohjR1zLRHnqkOrldMkHx4jEOJPOovczh/ZDqWVy09/Y CA== 
Received: from userv0021.oracle.com (userv0021.oracle.com [156.151.31.71])
        by userp2130.oracle.com with ESMTP id 2ghdxf81av-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 05 Mar 2018 21:42:29 +0000
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userv0021.oracle.com (8.14.4/8.14.4) with ESMTP id w25LbSTw020736
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 5 Mar 2018 21:37:28 GMT
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id w25LbRtU001993;
        Mon, 5 Mar 2018 21:37:27 GMT
Received: from [192.168.1.16] (/24.9.64.241)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 05 Mar 2018 13:37:26 -0800
Subject: Re: [PATCH v12 10/11] sparc64: Add support for ADI (Application Data
 Integrity)
To:     Dave Hansen <dave.hansen@linux.intel.com>, davem@davemloft.net,
        akpm@linux-foundation.org
Cc:     corbet@lwn.net, bob.picco@oracle.com, steven.sistare@oracle.com,
        pasha.tatashin@oracle.com, mike.kravetz@oracle.com,
        rob.gardner@oracle.com, mingo@kernel.org, nitin.m.gupta@oracle.com,
        anthony.yznaga@oracle.com, kirill.shutemov@linux.intel.com,
        tom.hromatka@oracle.com, allen.pais@oracle.com,
        tklauser@distanz.ch, shannon.nelson@oracle.com,
        vijay.ac.kumar@oracle.com, mhocko@suse.com, jack@suse.cz,
        punit.agrawal@arm.com, hughd@google.com, thomas.tai@oracle.com,
        ross.zwisler@linux.intel.com, dave.jiang@intel.com,
        willy@infradead.org, minchan@kernel.org,
        imbrenda@linux.vnet.ibm.com, aarcange@redhat.com,
        kstewart@linuxfoundation.org, pombredanne@nexb.com,
        tglx@linutronix.de, gregkh@linuxfoundation.org,
        nagarathnam.muthusamy@oracle.com, linux@roeck-us.net,
        jane.chu@oracle.com, dan.j.williams@intel.com, jglisse@redhat.com,
        ktkhai@virtuozzo.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        sparclinux@vger.kernel.org, Khalid Aziz <khalid@gonehiking.org>
References: <cover.1519227112.git.khalid.aziz@oracle.com>
 <d8602e35e65c8bf6df1a85166bf181536a6f3664.1519227112.git.khalid.aziz@oracle.com>
 <08ef65c1-16b3-44e7-5cc3-7b6bde7bd5a4@linux.intel.com>
From:   Khalid Aziz <khalid.aziz@oracle.com>
Organization: Oracle Corp
Message-ID: <b241c894-7751-bd01-2658-4cb6b89f7454@oracle.com>
Date:   Mon, 5 Mar 2018 14:37:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <08ef65c1-16b3-44e7-5cc3-7b6bde7bd5a4@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=8823 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1711220000 definitions=main-1803050248
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 03/05/2018 02:26 PM, Dave Hansen wrote:
> On 02/21/2018 09:15 AM, Khalid Aziz wrote:
>> +tag_storage_desc_t *alloc_tag_store(struct mm_struct *mm,
>> +				    struct vm_area_struct *vma,
>> +				    unsigned long addr)
> ...
>> +	tags = kzalloc(size, GFP_NOWAIT|__GFP_NOWARN);
>> +	if (tags == NULL) {
>> +		tag_desc->tag_users = 0;
>> +		tag_desc = NULL;
>> +		goto out;
>> +	}
>> +	tag_desc->start = addr;
>> +	tag_desc->tags = tags;
>> +	tag_desc->end = end_addr;
>> +
>> +out:
>> +	spin_unlock_irqrestore(&mm->context.tag_lock, flags);
>> +	return tag_desc;
>> +}
> 
> OK, sorry, I missed this.  I do see that you now have per-ADI-block tag
> storage and it is not per-page.
> 
> How big can this storage get, btw?  Superficially it seems like it might
> be able to be gigantic for a large, sparse VMA.
> 

Tags are stored only for the pages being swapped out, not for the pages 
in entire vma. Each tag storage page can hold tags for 128 pages (each 
page has 128 4-bit tags, hence 64 bytes are needed to store tags for an 
entire page allowing each page to store tags for 128 pages). Sparse VMA 
does not cause any problems since holes do not have corresponding pages 
that will be swapped out. Tag storage pages are freed once all the pages 
they store tags for have been swapped back in, except for a small number 
of pages (maximum of 8) marked for emergency tag storage.

--
Khalid
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

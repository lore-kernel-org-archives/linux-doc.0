Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B78077E653
	for <lwn-linux-doc@archive.lwn.net>; Mon,  5 Mar 2018 22:57:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932417AbeCEW5G (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 5 Mar 2018 17:57:06 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:42678 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932084AbeCEW5E (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Mar 2018 17:57:04 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.22/8.16.0.22) with SMTP id w25MpeVk129315;
        Mon, 5 Mar 2018 22:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2017-10-26;
 bh=Ln22tMs8xb8ENpuiVbMbmg77nceMSQboGN5t913OGPo=;
 b=dLyOWoJKF85U5bnB1QEfa1PsVTx816GvOT6PoesVJYKab4y7ZyQU6D4ywzyyGBhNjJ13
 HDDL8VGnZE4uEU4+PvF9MwU+9ZvyFjCzulKJpr7jVAWIHQHk0Ifxgocu3l6m0WMddxGn
 nu4mDfBt2a90KYXWMEQpOMiwevvzq94fQp/1miVlExf0OC+0AMgKfQcq61TzxlUDAGfA
 5yQXfrNDQFJN9ZyhJBSh0PQRdSGJ0Q3NBkkJKzmXex/ovGibr5pEULjqHYVnmsOgH6N5
 DaVUmP1iCnYWYCpb4pdDixW0yzf5CGGr+uaPBUf+wubeW6PL+dyqXnFwXdQd4he/p0R+ aw== 
Received: from userv0021.oracle.com (userv0021.oracle.com [156.151.31.71])
        by userp2130.oracle.com with ESMTP id 2ghdxf8ahs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 05 Mar 2018 22:55:31 +0000
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userv0021.oracle.com (8.14.4/8.14.4) with ESMTP id w25MtT5G007035
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 5 Mar 2018 22:55:29 GMT
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id w25MtQLE023253;
        Mon, 5 Mar 2018 22:55:26 GMT
Received: from [192.168.1.16] (/24.9.64.241)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 05 Mar 2018 14:55:26 -0800
Subject: Re: [PATCH v12 10/11] sparc64: Add support for ADI (Application Data
 Integrity)
To:     Dave Hansen <dave.hansen@linux.intel.com>, davem@davemloft.net,
        akpm@linux-foundation.org
Cc:     corbet@lwn.net, steven.sistare@oracle.com,
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
 <a59ece97-ba1f-dfb1-bfc8-b44ffd8edbca@linux.intel.com>
 <84931753-9a84-8624-adb8-95bd05d87d56@oracle.com>
 <8b0edd2e-3e9b-1148-6309-38b61307a523@linux.intel.com>
From:   Khalid Aziz <khalid.aziz@oracle.com>
Organization: Oracle Corp
Message-ID: <fabf221c-02e2-f968-d107-b028701dd837@oracle.com>
Date:   Mon, 5 Mar 2018 15:55:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <8b0edd2e-3e9b-1148-6309-38b61307a523@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=8823 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1711220000 definitions=main-1803050260
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 03/05/2018 02:31 PM, Dave Hansen wrote:
> On 03/05/2018 01:14 PM, Khalid Aziz wrote:
>> Are you suggesting that vma returned by find_vma() could be split or
>> merged underneath me if I do not hold mmap_sem and thus make the flag
>> check invalid? If so, that is a good point.
> 
> This part does make me think that this code hasn't been tested very
> thoroughly.  Could you describe the testing that you have done?  For MPX
> and protection keys, I added something to tools/testing/selftests/x86,
> for instance.

This code was tested by a QA team and I ran a number of tests myself. I 
wrote tests to exercise all of the API, induce exceptions for 
invalid/illegal accesses and swapping was tested by allocating memory 
2-4 times of the system RAM available across 4-8 threads and 
reading/writing to this memory with ADI enabled. QA team wrote unit 
tests to test each API with valid and invalid combinations of arguments 
to the API. Stress tests that allocate and free ADI tagged memory were 
also run. A version of database server was created that uses ADI tagged 
memory for in-memory copy of database to test database workload. 100's 
of hours of tests were run across these tests over the last 1+ year 
these patches have been under review for. Cover letter includes 
description of most of these tests. This code has held up through all of 
these tests. It is entirely feasible some race conditions have not been 
uncovered yet, just like any other piece of software. Pulling this code 
into mainline kernel and having lot more people exercise this code will 
help shake out any remaining issues.

Thanks,
Khalid
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

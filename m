Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9C4F57E66E
	for <lwn-linux-doc@archive.lwn.net>; Fri, 16 Mar 2018 08:54:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753155AbeCPIyy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 16 Mar 2018 04:54:54 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:37840 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751548AbeCPIyx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Mar 2018 04:54:53 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w2G8rrcQ060030
        for <linux-doc@vger.kernel.org>; Fri, 16 Mar 2018 04:54:52 -0400
Received: from e06smtp15.uk.ibm.com (e06smtp15.uk.ibm.com [195.75.94.111])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2gr9tkad2j-1
        (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Fri, 16 Mar 2018 04:54:52 -0400
Received: from localhost
        by e06smtp15.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <ravi.bangoria@linux.vnet.ibm.com>;
        Fri, 16 Mar 2018 08:54:50 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
        by e06smtp15.uk.ibm.com (192.168.101.145) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Fri, 16 Mar 2018 08:54:42 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w2G8sfZJ54788284;
        Fri, 16 Mar 2018 08:54:41 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 9505DA404D;
        Fri, 16 Mar 2018 08:47:29 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D8A0FA4057;
        Fri, 16 Mar 2018 08:47:19 +0000 (GMT)
Received: from [9.79.219.128] (unknown [9.79.219.128])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Fri, 16 Mar 2018 08:47:19 +0000 (GMT)
Subject: Re: [PATCH 3/8] Uprobe: Rename map_info to uprobe_map_info
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     mhiramat@kernel.org, oleg@redhat.com, peterz@infradead.org,
        srikar@linux.vnet.ibm.com, acme@kernel.org,
        ananth@linux.vnet.ibm.com, akpm@linux-foundation.org,
        alexander.shishkin@linux.intel.com, alexis.berlemont@gmail.com,
        corbet@lwn.net, dan.j.williams@intel.com,
        gregkh@linuxfoundation.org, huawei.libin@huawei.com,
        hughd@google.com, jack@suse.cz, jglisse@redhat.com,
        jolsa@redhat.com, kan.liang@intel.com,
        kirill.shutemov@linux.intel.com, kjlx@templeofstupid.com,
        kstewart@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, mhocko@suse.com,
        milian.wolff@kdab.com, mingo@redhat.com, namhyung@kernel.org,
        naveen.n.rao@linux.vnet.ibm.com, pc@us.ibm.com,
        pombredanne@nexb.com, tglx@linutronix.de,
        tmricht@linux.vnet.ibm.com, willy@infradead.org,
        yao.jin@linux.intel.com, fengguang.wu@intel.com,
        Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>
References: <20180313125603.19819-1-ravi.bangoria@linux.vnet.ibm.com>
 <20180313125603.19819-4-ravi.bangoria@linux.vnet.ibm.com>
 <20180315124449.7d92c06b@vmware.local.home>
From:   Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>
Date:   Fri, 16 Mar 2018 14:26:58 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180315124449.7d92c06b@vmware.local.home>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18031608-0020-0000-0000-00000405D970
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18031608-0021-0000-0000-00004299E4F1
Message-Id: <e8d9fc29-62b2-95eb-d868-42df26c3212e@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:,, definitions=2018-03-16_04:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803160110
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 03/15/2018 10:14 PM, Steven Rostedt wrote:
> On Tue, 13 Mar 2018 18:25:58 +0530
> Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com> wrote:
>> -static inline struct map_info *free_map_info(struct map_info *info)
>> +static inline struct uprobe_map_info *
>> +uprobe_free_map_info(struct uprobe_map_info *info)
>>  {
>> -	struct map_info *next = info->next;
>> +	struct uprobe_map_info *next = info->next;
>>  	kfree(info);
>>  	return next;
>>  }
>>  
>> -static struct map_info *
>> -build_map_info(struct address_space *mapping, loff_t offset, bool is_register)
>> +static struct uprobe_map_info *
>> +uprobe_build_map_info(struct address_space *mapping, loff_t offset,
> Also, as these functions have side effects (like you need to perform a
> mmput(info->mm), you need to add kerneldoc type comments to these
> functions, explaining how to use them.
>
> When you upgrade a function from static to use cases outside the file,
> it requires documenting that function for future users.

Sure, will add a comment here.

Thanks for the review,
Ravi

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

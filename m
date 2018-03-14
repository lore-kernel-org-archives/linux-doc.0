Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5EBE77E6BC
	for <lwn-linux-doc@archive.lwn.net>; Wed, 14 Mar 2018 15:10:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751348AbeCNPKl (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 14 Mar 2018 11:10:41 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:59856 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751649AbeCNPK0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Mar 2018 11:10:26 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w2EF9Sq1070813
        for <linux-doc@vger.kernel.org>; Wed, 14 Mar 2018 11:10:26 -0400
Received: from e06smtp12.uk.ibm.com (e06smtp12.uk.ibm.com [195.75.94.108])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2gq5b82kf2-1
        (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Wed, 14 Mar 2018 11:10:24 -0400
Received: from localhost
        by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <ravi.bangoria@linux.vnet.ibm.com>;
        Wed, 14 Mar 2018 15:10:21 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
        by e06smtp12.uk.ibm.com (192.168.101.142) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Wed, 14 Mar 2018 15:10:12 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w2EFAC0954395102;
        Wed, 14 Mar 2018 15:10:12 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B11725204B;
        Wed, 14 Mar 2018 14:01:42 +0000 (GMT)
Received: from [9.77.194.179] (unknown [9.77.194.179])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 78B055203F;
        Wed, 14 Mar 2018 14:01:30 +0000 (GMT)
Subject: Re: [PATCH 5/8] trace_uprobe: Support SDT markers having reference
 count (semaphore)
To:     Masami Hiramatsu <mhiramat@kernel.org>
Cc:     oleg@redhat.com, peterz@infradead.org, srikar@linux.vnet.ibm.com,
        acme@kernel.org, ananth@linux.vnet.ibm.com,
        akpm@linux-foundation.org, alexander.shishkin@linux.intel.com,
        alexis.berlemont@gmail.com, corbet@lwn.net,
        dan.j.williams@intel.com, gregkh@linuxfoundation.org,
        huawei.libin@huawei.com, hughd@google.com, jack@suse.cz,
        jglisse@redhat.com, jolsa@redhat.com, kan.liang@intel.com,
        kirill.shutemov@linux.intel.com, kjlx@templeofstupid.com,
        kstewart@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, mhocko@suse.com,
        milian.wolff@kdab.com, mingo@redhat.com, namhyung@kernel.org,
        naveen.n.rao@linux.vnet.ibm.com, pc@us.ibm.com,
        pombredanne@nexb.com, rostedt@goodmis.org, tglx@linutronix.de,
        tmricht@linux.vnet.ibm.com, willy@infradead.org,
        yao.jin@linux.intel.com, fengguang.wu@intel.com,
        Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>
References: <20180313125603.19819-1-ravi.bangoria@linux.vnet.ibm.com>
 <20180313125603.19819-6-ravi.bangoria@linux.vnet.ibm.com>
 <20180314224809.5ee4c8834bb366faa398e342@kernel.org>
From:   Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>
Date:   Wed, 14 Mar 2018 20:42:24 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180314224809.5ee4c8834bb366faa398e342@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18031415-0008-0000-0000-000004DD6B61
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18031415-0009-0000-0000-00001E70707E
Message-Id: <fabfad9d-a75e-0b18-1558-ce738b46e538@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:,, definitions=2018-03-14_07:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803140171
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Masami,

On 03/14/2018 07:18 PM, Masami Hiramatsu wrote:
> Hi Ravi,
>
> On Tue, 13 Mar 2018 18:26:00 +0530
> Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com> wrote:
>
>> Userspace Statically Defined Tracepoints[1] are dtrace style markers
>> inside userspace applications. These markers are added by developer at
>> important places in the code. Each marker source expands to a single
>> nop instruction in the compiled code but there may be additional
>> overhead for computing the marker arguments which expands to couple of
>> instructions. In case the overhead is more, execution of it can be
>> ommited by runtime if() condition when no one is tracing on the marker:
>>
>>     if (reference_counter > 0) {
>>         Execute marker instructions;
>>     }
>>
>> Default value of reference counter is 0. Tracer has to increment the
>> reference counter before tracing on a marker and decrement it when
>> done with the tracing.
>>
>> Implement the reference counter logic in trace_uprobe, leaving core
>> uprobe infrastructure as is, except one new callback from uprobe_mmap()
>> to trace_uprobe.
>>
>> trace_uprobe definition with reference counter will now be:
>>
>>   <path>:<offset>[(ref_ctr_offset)]
> Would you mean 
> <path>:<offset>(<ref_ctr_offset>)
> ?
>
> or use "[]" for delimiter?

[] indicates optional field.

> Since,
>
>> @@ -454,6 +458,26 @@ static int create_trace_uprobe(int argc, char **argv)
>>  		goto fail_address_parse;
>>  	}
>>  
>> +	/* Parse reference counter offset if specified. */
>> +	rctr = strchr(arg, '(');
> This seems you choose "()" for delimiter.

Correct.

>> +	if (rctr) {
>> +		rctr_end = strchr(arg, ')');
> 		rctr_end = strchr(rctr, ')');
>
> ? since we are sure rctr != NULL.

Yes. we can use rctr instead of arg.

>> +		if (rctr > rctr_end || *(rctr_end + 1) != 0) {
>> +			ret = -EINVAL;
>> +			pr_info("Invalid reference counter offset.\n");
>> +			goto fail_address_parse;
>> +		}
>
> Also
>
>> +
>> +		*rctr++ = 0;
>> +		*rctr_end = 0;
> Please consider to use '\0' for nul;

Sure. Will change it.

Thanks for the review :)
Ravi

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

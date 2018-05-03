Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5CC8F7E27B
	for <lwn-linux-doc@archive.lwn.net>; Thu,  3 May 2018 08:32:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751132AbeECIcT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 3 May 2018 04:32:19 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:60558 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750773AbeECIcR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 May 2018 04:32:17 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w438Vqin035824
        for <linux-doc@vger.kernel.org>; Thu, 3 May 2018 04:32:17 -0400
Received: from e06smtp15.uk.ibm.com (e06smtp15.uk.ibm.com [195.75.94.111])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2hqxwjg8fa-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Thu, 03 May 2018 04:32:16 -0400
Received: from localhost
        by e06smtp15.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <ravi.bangoria@linux.ibm.com>;
        Thu, 3 May 2018 09:32:13 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
        by e06smtp15.uk.ibm.com (192.168.101.145) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Thu, 3 May 2018 09:32:06 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w438W51C42467510;
        Thu, 3 May 2018 08:32:05 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 64DDA4C04A;
        Thu,  3 May 2018 09:24:14 +0100 (BST)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D497B4C046;
        Thu,  3 May 2018 09:24:09 +0100 (BST)
Received: from [9.124.31.122] (unknown [9.124.31.122])
        by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Thu,  3 May 2018 09:24:09 +0100 (BST)
Subject: Re: [PATCH v3 0/9] trace_uprobe: Support SDT markers having reference
 count (semaphore)
To:     mhiramat@kernel.org, oleg@redhat.com
Cc:     Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>,
        peterz@infradead.org, srikar@linux.vnet.ibm.com,
        rostedt@goodmis.org, acme@kernel.org, ananth@linux.vnet.ibm.com,
        akpm@linux-foundation.org, alexander.shishkin@linux.intel.com,
        alexis.berlemont@gmail.com, corbet@lwn.net,
        dan.j.williams@intel.com, jolsa@redhat.com, kan.liang@intel.com,
        kjlx@templeofstupid.com, kstewart@linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, milian.wolff@kdab.com, mingo@redhat.com,
        namhyung@kernel.org, naveen.n.rao@linux.vnet.ibm.com,
        pc@us.ibm.com, tglx@linutronix.de, yao.jin@linux.intel.com,
        fengguang.wu@intel.com, jglisse@redhat.com
References: <20180417043244.7501-1-ravi.bangoria@linux.vnet.ibm.com>
From:   Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Date:   Thu, 3 May 2018 14:02:00 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180417043244.7501-1-ravi.bangoria@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18050308-0020-0000-0000-0000041872DA
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18050308-0021-0000-0000-000042AD934F
Message-Id: <f77789c0-9277-23bf-9abb-92f3f36c4baa@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-05-03_04:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805030081
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 04/17/2018 10:02 AM, Ravi Bangoria wrote:
> Userspace Statically Defined Tracepoints[1] are dtrace style markers
> inside userspace applications. Applications like PostgreSQL, MySQL,
> Pthread, Perl, Python, Java, Ruby, Node.js, libvirt, QEMU, glib etc
> have these markers embedded in them. These markers are added by developer
> at important places in the code. Each marker source expands to a single
> nop instruction in the compiled code but there may be additional
> overhead for computing the marker arguments which expands to couple of
> instructions. In case the overhead is more, execution of it can be
> omitted by runtime if() condition when no one is tracing on the marker:
>
>     if (reference_counter > 0) {
>         Execute marker instructions;
>     }   
>
> Default value of reference counter is 0. Tracer has to increment the 
> reference counter before tracing on a marker and decrement it when
> done with the tracing.

Hi Oleg, Masami,

Can you please review this :) ?

Thanks.

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

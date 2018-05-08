Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A37E17DE74
	for <lwn-linux-doc@archive.lwn.net>; Tue,  8 May 2018 09:46:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754774AbeEHJq6 convert rfc822-to-8bit (ORCPT
        <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 8 May 2018 05:46:58 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60316 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1754729AbeEHJq4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 May 2018 05:46:56 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w489hxhx064970
        for <linux-doc@vger.kernel.org>; Tue, 8 May 2018 05:46:56 -0400
Received: from e06smtp12.uk.ibm.com (e06smtp12.uk.ibm.com [195.75.94.108])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2hu6kx0e03-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Tue, 08 May 2018 05:46:56 -0400
Received: from localhost
        by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <naveen.n.rao@linux.vnet.ibm.com>;
        Tue, 8 May 2018 10:46:54 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
        by e06smtp12.uk.ibm.com (192.168.101.142) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Tue, 8 May 2018 10:46:47 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w489klPv6881762;
        Tue, 8 May 2018 09:46:47 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 76EF142047;
        Tue,  8 May 2018 10:37:50 +0100 (BST)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 439A742045;
        Tue,  8 May 2018 10:37:50 +0100 (BST)
Received: from localhost (unknown [9.124.35.77])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Tue,  8 May 2018 10:37:50 +0100 (BST)
Date:   Tue, 08 May 2018 15:16:43 +0530
From:   "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v3 6/9] trace_uprobe: Support SDT markers having reference
 count (semaphore)
To:     Masami Hiramatsu <mhiramat@kernel.org>,
        Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Cc:     acme@kernel.org, akpm@linux-foundation.org,
        alexander.shishkin@linux.intel.com, alexis.berlemont@gmail.com,
        ananth@linux.vnet.ibm.com, corbet@lwn.net,
        dan.j.williams@intel.com, fengguang.wu@intel.com,
        jglisse@redhat.com, jolsa@redhat.com, kan.liang@intel.com,
        kjlx@templeofstupid.com, kstewart@linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, milian.wolff@kdab.com, mingo@redhat.com,
        namhyung@kernel.org, oleg@redhat.com, pc@us.ibm.com,
        peterz@infradead.org, rostedt@goodmis.org,
        srikar@linux.vnet.ibm.com, tglx@linutronix.de,
        yao.jin@linux.intel.com
References: <20180417043244.7501-1-ravi.bangoria@linux.vnet.ibm.com>
        <20180417043244.7501-7-ravi.bangoria@linux.vnet.ibm.com>
        <20180504134816.8633a157dd036489d9b0f1db@kernel.org>
        <206e4a16-ae21-7da3-f752-853dc2f51947@linux.ibm.com>
        <f3d066d2-a85a-bd21-d4f9-fc27e59135df@linux.ibm.com>
        <20180508005651.45553d3cf72521481d16b801@kernel.org>
In-Reply-To: <20180508005651.45553d3cf72521481d16b801@kernel.org>
User-Agent: astroid/0.11.1 (https://github.com/astroidmail/astroid)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT
X-TM-AS-GCONF: 00
x-cbid: 18050809-0008-0000-0000-000004F449E8
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18050809-0009-0000-0000-00001E888A7A
Message-Id: <1525772725.o3tzigt8c3.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-05-08_04:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805080095
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Masami Hiramatsu wrote:
> On Mon, 7 May 2018 13:51:21 +0530
> Ravi Bangoria <ravi.bangoria@linux.ibm.com> wrote:
> 
>> BTW, same issue exists for normal uprobe. If uprobe_mmap() fails,
>> there is no feedback to trace_uprobe and no warnigns in dmesg as
>> well !! There was a patch by Naveen to warn such failures in dmesg
>> but that didn't go in: https://lkml.org/lkml/2017/9/22/155
> 
> Oops, that's a real bug. It seems the ball is in Naveen's hand.
> Naveen, could you update it according to Oleg's comment, and resend it?

Yes, I've had to put that series on the backburner. I will try and get 
to it soon. Thanks for the reminder.

- Naveen


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

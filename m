Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5709C6FD1D
	for <linux-doc@archiver.kernel.org>; Thu, 23 Mar 2023 12:49:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231903AbjCWMtw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Mar 2023 08:49:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231965AbjCWMtt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Mar 2023 08:49:49 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C28A42916A
        for <linux-doc@vger.kernel.org>; Thu, 23 Mar 2023 05:49:48 -0700 (PDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32NBBsXF028556;
        Thu, 23 Mar 2023 12:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=3jzvtm0xjvfN19ztbHPMlLoYBGYFXUzJo9QYvMJQiYk=;
 b=VUizJaaOlvpQY7wdCTWtVhuvUhMWiq+kEi99D5CP011EWDw3C7YA5cDSzl0FlVEhsDTs
 PvI72kRcRC1r61Cs65SPQ8VNfivKP4ZSOAsso/FXxBdISOFwXl735nbhPkMCuhQWR5//
 Amx4ddikyAYjFzQ/OcB3bGzj7woJ9gb1BnMDjyGvYaIpdYtDRcQoTPK41CRNNkXgxYlo
 HKthjGQae2PL90xKLnCBPi8i8m/sgcUqP5cG+qggXB7XQP91mGlEhMlGjJcQsgYsHvIY
 Yy93jVypV2SKZCNOH86iKaqVqy7DC9zkor4vnCW9jYCIHQU2OlzTxlP6wYNpOlRLAbTm zQ== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pghqsrd5r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 23 Mar 2023 12:49:41 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
        by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32NC8X2L023444;
        Thu, 23 Mar 2023 12:49:40 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([9.208.129.118])
        by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3pd4x7n7mn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 23 Mar 2023 12:49:40 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
        by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32NCndMt11272714
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 23 Mar 2023 12:49:39 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 698A658053;
        Thu, 23 Mar 2023 12:49:39 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 1D43C58059;
        Thu, 23 Mar 2023 12:49:39 +0000 (GMT)
Received: from [9.160.39.9] (unknown [9.160.39.9])
        by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
        Thu, 23 Mar 2023 12:49:38 +0000 (GMT)
Message-ID: <437443de-b9cf-d09b-1f9b-23dfd47f3e6b@linux.ibm.com>
Date:   Thu, 23 Mar 2023 08:49:37 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: Fwd: Documentation on IMA for Linux Kernel Documentation
Content-Language: en-US
To:     Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
References: <60ac4c41-65b8-3c3d-7e31-1a580e728ca5@infradead.org>
 <a3289dfb-da44-47ce-9f3b-1f5c9dec900c@linux.ibm.com>
 <369843bb-3a7a-78d0-40ac-0df51b0cc58d@infradead.org>
From:   Ken Goldman <kgold@linux.ibm.com>
In-Reply-To: <369843bb-3a7a-78d0-40ac-0df51b0cc58d@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 72RUU1jkMSnbe_vqNT2oHrbHuLLkGqIm
X-Proofpoint-ORIG-GUID: 72RUU1jkMSnbe_vqNT2oHrbHuLLkGqIm
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_21,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1011
 mlxscore=0 impostorscore=0 spamscore=0 bulkscore=0 mlxlogscore=906
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303230094
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 3/22/2023 6:58 PM, Randy Dunlap wrote:
> On 3/22/23 15:04, Ken Goldman wrote:
>> I'm writing documentation on IMA targeting users (not kernel developers).  It includes concepts, details on writing policies, the IMA event log format, utilities, and more.  It aggregates existing scattered documentation, but adds much more.  It's maybe 1/2 done.
>>
>> Questions:
>>
>> 1. Are there people who could look at it and see if I'm on the right path?
>>
>> It's a lot of work.  I'd like to know that it has some chance of acceptance.
> Review in terms of IMA-specific content?  or in terms of ReST usage?
> or in general terms to see if it is appropriate for kernel tree documentation?
>
> I think that you should Cc: linux-integrity@vger.kernel.org for their input
> as well as linux-doc@vger.kernel.org. Several of us here can look at it for
> general review feedback.

Not the accuracy - I have IMA experts looking at that.

I want to know if it'll be accepted, and if the structure is OK.

> 2. What is the process for getting a block of documentation added to 
> https://www.kernel.org/doc/html?
>  From last week's email:
>
>>>> It should be added to the kernel tree in the Documentation/userspace-api/ subdirectory
>>>> or Documentation/security/ subdirectory.  The kernel.org/doc/ web pages are generated
>>>> from what is in the Linux kernel tree.
> although if you don't think that it is appropriate for either of those subdirectories,
> just explain and justify that and it might be possible to put it somewhere else.

"Where" comes later.  I just want to know if it'll be accepted at all.


Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0942C76188
	for <linux-doc@archiver.kernel.org>; Mon,  3 Apr 2023 15:33:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231958AbjDCPdf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 3 Apr 2023 11:33:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232870AbjDCPdd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Apr 2023 11:33:33 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C15D610F9
        for <linux-doc@vger.kernel.org>; Mon,  3 Apr 2023 08:33:30 -0700 (PDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 333EvdPQ030399
        for <linux-doc@vger.kernel.org>; Mon, 3 Apr 2023 15:33:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=ojZWGcfh8K/83i0uw17HgyAO/4FUqGcU0YN5pk+rCCk=;
 b=Mn/8RgqRCfobXnPtLdvHpuy3DvdkrdIMmkVdhP/SUKqn04IkU+1bOpNYJVrNZ1a8s8Kn
 81A1kRJzq/bP534uWVXj/ovbcCRGEGkOfbm79INUnugQ+8x8GTS/wnc5n6VVygO+WfS2
 JpCmpkd8dHvA5gqXMtJ9xHP3wIrqz+XUj8Lj2Adi9XomTb05DMbSR0c2MJ2/NgeuS0Er
 3jcDFWVR6MfpYrgXmVdT0M6sgYoSVLg0ogYKxaubuZ4hxBqBDZuhN0hofT9RHzyd9+mq
 qt1xkLb95kZ37AevZ+1efo8YHKlR2BLQ4NHY2XIvKy4a1BEDMG21eb2gaPmPEyTup2Eq Zg== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pqygwvh8x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Mon, 03 Apr 2023 15:33:29 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
        by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 333F3ujP017779
        for <linux-doc@vger.kernel.org>; Mon, 3 Apr 2023 15:33:28 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([9.208.130.97])
        by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3ppc88q1d6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Mon, 03 Apr 2023 15:33:28 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
        by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 333FXRtc46400046
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <linux-doc@vger.kernel.org>; Mon, 3 Apr 2023 15:33:27 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 18D3A58052
        for <linux-doc@vger.kernel.org>; Mon,  3 Apr 2023 15:33:27 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E66D058064
        for <linux-doc@vger.kernel.org>; Mon,  3 Apr 2023 15:33:26 +0000 (GMT)
Received: from [9.160.16.30] (unknown [9.160.16.30])
        by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP
        for <linux-doc@vger.kernel.org>; Mon,  3 Apr 2023 15:33:26 +0000 (GMT)
Message-ID: <0f9137dd-eca0-5187-6464-067974ed2f0c@linux.ibm.com>
Date:   Mon, 3 Apr 2023 11:33:26 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: sphinx - proper method for linking
Content-Language: en-US
To:     linux-doc@vger.kernel.org
References: <e747b0ba-7992-36c7-f931-08aac46385f1@linux.ibm.com>
 <87v8ipzswd.fsf@meer.lwn.net>
From:   Ken Goldman <kgold@linux.ibm.com>
In-Reply-To: <87v8ipzswd.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ASy7AmAOxQXTF4Y_gGyTiZP-xVufBS5e
X-Proofpoint-GUID: ASy7AmAOxQXTF4Y_gGyTiZP-xVufBS5e
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_13,2023-04-03_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 mlxlogscore=769
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304030113
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Besides the below questions, here's another:

My current module has 6 .rst files.  Is that usual, or is it
recommended that the entire module be in one big file?

I know either works, but I want to follow the customary
pattern.

On 3/24/2023 6:28 PM, Jonathan Corbet wrote:
> Ken Goldman <kgold@linux.ibm.com> writes:
>
>> 1. What is the recommended way to link to documents outside my tree.
>>
>> Should I be doing that, or is it fragile / not recommended?
> If you need to link to something elsewhere, you can certainly do so;
> there are countless examples in the kernel documentation.
I know I can do it, but is it recommended or discouraged?
>> Are links to other documents stable?
>>
>> How about sections within the page?
> I don't understand those questions.

I can add a link to a .rst file.  If someone links to my doc, it implies 
that my filename cannot change.  Similarly, if I link to another doc, I 
depend on that filename not changing.

>> I found that this .rst works.
>>
>> See
>> https://www.kernel.org/doc/html/latest/security/keys/trusted-encrypted.html
>>
>> Is that OK, or is there a better way?
> You wouldn't link to the rendered kernel docs normally, you'd just say
> "See Documentation/security/keys/trusted-encrypted.rst".
>
> Look at the Sphinx cheatsheets on the net for the various other ways of
> making links if you need to link outside of the kernel docs.

That's an example.  If I link like that, and then the name changes to 
trusted-encryptedxxx.rst, I break.

>
>> Is that link (doc/html/latest) correct.
>>
>> 2. Are my pages and headings to be treated as stable, like an API? I.e.,
>> once I release documentation, are all the pages and headings frozen so
>> they will not break links?
> No, there is no such requirement.
Then don't links break?

Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69B2FC76196
	for <linux-doc@archiver.kernel.org>; Mon,  3 Apr 2023 15:37:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232935AbjDCPhy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 3 Apr 2023 11:37:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232884AbjDCPhx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Apr 2023 11:37:53 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBDEB10F9
        for <linux-doc@vger.kernel.org>; Mon,  3 Apr 2023 08:37:52 -0700 (PDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 333EEFqw031848
        for <linux-doc@vger.kernel.org>; Mon, 3 Apr 2023 15:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=l0j4OlK7K/zzSIiuvF4pXe+E49y6ez7Q+6Vk1V1sB4Q=;
 b=LNHlsV5WSWsA8OzngMpeUlMrd2LtoydezFPkW9pH92+aztAJVwerO7WoG3STuc8l0fJs
 NWXEZ7F5uDUae2hFtQuGYh5Tq6vkm8t0gWfQtr0uI04Cjp+0LZQ/Ll1XTVAuC8Vjhp/8
 c7gu0Qj0y4T9vGc285ZPD3PCZnrW7KyiBNBdO1IQSko+1CbDmaSYfOZRYrAbGr6S+P8M
 TXZAeJFKyjt7ZX7tcMNxkTTNSwHEReNypER5I1Dfk4SoYX+fyPc31Sf5Ew52JRfmU0oI
 fagznmZKnzdQPdcucDMq1yIvds85Y/ixsYh7Hm54KMmwMSKBoR7OThyywdw0wA0rYoHD mg== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
        by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pr0crteyf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Mon, 03 Apr 2023 15:37:51 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
        by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 333FHYrR016965
        for <linux-doc@vger.kernel.org>; Mon, 3 Apr 2023 15:37:51 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([9.208.130.100])
        by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3ppc88q23r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Mon, 03 Apr 2023 15:37:51 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
        by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 333Fbn8g6357714
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <linux-doc@vger.kernel.org>; Mon, 3 Apr 2023 15:37:49 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 923C45805E
        for <linux-doc@vger.kernel.org>; Mon,  3 Apr 2023 15:37:49 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 6C1F25805A
        for <linux-doc@vger.kernel.org>; Mon,  3 Apr 2023 15:37:49 +0000 (GMT)
Received: from [9.160.16.30] (unknown [9.160.16.30])
        by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP
        for <linux-doc@vger.kernel.org>; Mon,  3 Apr 2023 15:37:49 +0000 (GMT)
Message-ID: <bf615760-918c-f0d1-e70d-87071f847a04@linux.ibm.com>
Date:   Mon, 3 Apr 2023 11:37:49 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: sphinx - proper method for linking
Content-Language: en-US
To:     linux-doc@vger.kernel.org
References: <e747b0ba-7992-36c7-f931-08aac46385f1@linux.ibm.com>
 <87v8ipzswd.fsf@meer.lwn.net> <ZB5gPAGzTwqArQY4@debian.me>
From:   Ken Goldman <kgold@linux.ibm.com>
In-Reply-To: <ZB5gPAGzTwqArQY4@debian.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _XHafzQyJd171jIX0z1iorw7gLTeLIbD
X-Proofpoint-ORIG-GUID: _XHafzQyJd171jIX0z1iorw7gLTeLIbD
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_12,2023-04-03_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=2 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=2
 priorityscore=1501 mlxscore=2 mlxlogscore=159 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304030105
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The answers below explain __how__, which I already know.

My question is whether this is a good or bad idea.  What happens if I 
change labels?  Do I break people's links?  Must my labels be stable 
forever?

On 3/24/2023 10:45 PM, Bagas Sanjaya wrote:
> On Fri, Mar 24, 2023 at 04:28:02PM -0600, Jonathan Corbet wrote:
>>> Are links to other documents stable?
>>>
>>> How about sections within the page?
>> I don't understand those questions.
> You need to first add the label before desired section heading, like:
>
> ```
> ...
> .. _foo:
>
> Foo
> ===
>
> ...
> ```
>
> Then elsewhere use :ref: role and specify the target label, ideally also
> specifying anchor text:
>
> ```
> ...
> This assumes that you have knowledge on :ref:`foo <foo>`.
> ...
> ```

I know I can do that.

However, what happens if someone links to my :ref:, and then I change 
the label?

>>> I found that this .rst works.
>>>
>>> See
>>> https://www.kernel.org/doc/html/latest/security/keys/trusted-encrypted.html
>>>
>>> Is that OK, or is there a better way?
>> You wouldn't link to the rendered kernel docs normally, you'd just say
>> "See Documentation/security/keys/trusted-encrypted.rst".
>>
>> Look at the Sphinx cheatsheets on the net for the various other ways of
>> making links if you need to link outside of the kernel docs.
> As with internal linking, you can simply write out the link:
>
> ```
> ...
> Check out the documentation at https://foo.bar/baz for complete
> treatment on this topic.
> ...
>
> ```
>
> Or if you need anchor text:
>
> ```
> ...
> Check out `baz documentation <https://foo.bar/baz>`_ for complete
> treatment on this topic`.
> ...
> ```
>
> There is also :doc: directive if you need internal linking with anchor
> text. The target can be either relative to the doc or absolute in respect
> to documentation root (`Documentation/`). Do not specify filename
> suffix. For example:
>
> ```
> ...
> The general guide on :doc:`submitting patches
> </process/submitting-patches>` also applies to this subsystem.
> ...
>
> ```
>
> Thanks.
>

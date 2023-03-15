Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA17C6FD1D
	for <linux-doc@archiver.kernel.org>; Wed, 15 Mar 2023 16:07:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbjCOQHC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Mar 2023 12:07:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231673AbjCOQHB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Mar 2023 12:07:01 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E72179312A
        for <linux-doc@vger.kernel.org>; Wed, 15 Mar 2023 09:06:25 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id D61635C054B;
        Wed, 15 Mar 2023 12:05:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 15 Mar 2023 12:05:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=devkernel.io; h=
        cc:cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1678896333; x=1678982733; bh=bu
        AS022EMPBJulMjE8ii65afZRjcdOiGwqDLGmLBepM=; b=TPdaquaXbFUmgX2SKh
        l3KyLGQ+Jy7YFvWLALDZ+rZRKDObHYSDvAIL6M7VSYbH/WSM1Oy3hezGN0tklQl6
        EjPeFhCmTLkS+DUy+ZGcquLY3kQXElY3TE5gQfLX5vSU+tBHbXXgVwtukDHnN4Xk
        ykz9yZmms8mdlaEhihjAuclqIKgyes3CeHwQrKEIj4va9d2YDRoUO+QfwSYXopxn
        p9rdwYpfGVxGtIB0PY8oLiLdSLQ/iKhAuEXceZOjIIYY8g5Kgh+QS8482Whk2iFV
        5+/Kb3Hk8S25gsd5Z1M6gXca58+CE2hz9HCDzrJe6YYuukjFchDDCY8N7NxqN7Ni
        RoxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1678896333; x=1678982733; bh=buAS022EMPBJu
        lMjE8ii65afZRjcdOiGwqDLGmLBepM=; b=n+TmOaDUKuJL9yxVA53+6MFjoH4gH
        21apynJ/JQ5XeLjr7GmSrL8d5DzeHnTeU7zTSzh+w1umUmsC2VjUWXF349P3MibE
        z+/Kb9f1cgAq8vJYVlUSAZGWKo/1G+xnGU+c4jPQHnDJZ+eoBS4QzONMwmupYIsC
        5YZos8qJoB/0HErLY+wJCERF40Q64R3ztWO00Rp3Q76Qi8vYjPqUAX7vnbNJLudK
        z1MGNF8crcAry1e7F9h28m/rMH++fKNJ9EfVYoPLgnYwqt9lO2JWEpF6G/DxRCj6
        CouBYv4P7KCKmn792Y/IwkRf9xeqUfyzEqJO7eCQtFBAE8UlKCXwQJkRQ==
X-ME-Sender: <xms:zewRZEIPcB7YAYJXVRRNUGl_OqighDnCd91oWzWCvWh8voTq0XurIA>
    <xme:zewRZELnOTj61459dhn2ts_7KuCaJjLGZunPjQWz2WLOBJIcu6aP9CgzqNfziT_mz
    zRE8FuK-xL8iWCMy2Y>
X-ME-Received: <xmr:zewRZEsbpVpz3NrWKZy7fjImoh0-DPS5fYwfoHJwAPMx-wXXEQu_iANrWg0u0RggysIdvvvcAs-GfvtFSO6QFpQFsxaf2R__c2scE2jj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddvkedgkeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpehffgfhvfevufffjgfkgggtsehttd
    ertddtredtnecuhfhrohhmpefuthgvfhgrnhcutfhovghstghhuceoshhhrhesuggvvhhk
    vghrnhgvlhdrihhoqeenucggtffrrghtthgvrhhnpeevlefggffhheduiedtheejveehtd
    fhtedvhfeludetvdegieekgeeggfdugeeutdenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehshhhrseguvghvkhgvrhhnvghlrdhioh
X-ME-Proxy: <xmx:zewRZBZt2WZ0Bje7FsagAP1P_wCJMc8w-Rn6gBU_uaR3liIYO1poww>
    <xmx:zewRZLb6IAMWMNqnmEzyweFMcOmwAtisAWhiZgTf0QbLmVASF0bZdQ>
    <xmx:zewRZNDf-GoSXOM22W4gCngab610yan4MJ98pZ7VUnEmk-_7FiM_IQ>
    <xmx:zewRZP7F0zb3oLZrKVVELefWoaiQWgZFjkqtjdVF7ta_UuxqFQFMWQ>
Feedback-ID: i84614614:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Mar 2023 12:05:32 -0400 (EDT)
References: <20230314204557.3863923-1-shr@devkernel.io>
 <ZBFCud+I8mVAoh87@debian.me>
User-agent: mu4e 1.6.11; emacs 28.2.50
From:   Stefan Roesch <shr@devkernel.io>
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     kernel-team@fb.com, linux-mm@kvack.org, riel@surriel.com,
        mhocko@suse.com, david@redhat.com, linux-doc@vger.kernel.org,
        akpm@linux-foundation.org, hannes@cmpxchg.org
Subject: Re: [PATCH v1] docs/mm: extend ksm doc
Date:   Wed, 15 Mar 2023 08:59:25 -0700
In-reply-to: <ZBFCud+I8mVAoh87@debian.me>
Message-ID: <qvqwa60ec855.fsf@dev0134.prn3.facebook.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Bagas Sanjaya <bagasdotme@gmail.com> writes:

> [[PGP Signed Part:Undecided]]
> On Tue, Mar 14, 2023 at 01:45:57PM -0700, Stefan Roesch wrote:
>> +to cancel that advice and restore unshared pages: whereupon KSM
>> +unmerges whatever is merged for that process.  Note: this unmerging call
>> +may suddenly require more memory than is available - possibly failing
>> +with EAGAIN, but more probably arousing the Out-Of-Memory killer.
>

This follows the wording in the previous paragraph, do you also want to
change the previous paragraph?

> "... to disable KSM and let it unmerges ... . Note that this unmerging
> call may exhaust memory and triggers OOM killer."
>
>> +However, if the system is dedicated to running multiple jobs within the
>> +same security domain, there is a usecase where multiple instances of the
>> +same job are running inside a safe shared security domain and using the
>> +same sensitive data.
>
> "... it is possible for multiple instances ... and share the same
> sensitive data."
>

Something like this?

>> +However, if the system is dedicated to running multiple jobs within the
>> +same security domain, there is a usecase where multiple instances of the
>> +same job are running inside a safe shared security domain and share the
>> +same sensitive data.
>

The is possible I think is less clear.

 Thanks.

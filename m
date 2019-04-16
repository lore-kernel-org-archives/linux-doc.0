Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 564EC7D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 16 Apr 2019 20:06:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729158AbfDPUGX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 16 Apr 2019 16:06:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:57492 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727136AbfDPUGX (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 16 Apr 2019 16:06:23 -0400
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net [24.9.64.241])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C72A520821;
        Tue, 16 Apr 2019 20:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555445183;
        bh=cel9DeQxYYx7Zv9rO2+qbgf7GmFPVfofNaB2jcGL95Y=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ZLqDKr+G56ARCQow7k6TyIH8mfQBmfe21rX3OWHeKSQ6wrXZvSoJVzKxTzxt4Bz3e
         e2dUOEnuFxj8YAXHoNv+mKU6PpF4BzKUzP8jZ2UMHVsuVVRpZ+Z49DjMp6ED1yu4L1
         ayh0uqorOzrFcDwrWMiKlOCAtHIPUj1ZkVK7AP88=
Subject: Re: [PATCH] doc: kselftest: Fix KBUILD_OUTPUT usage instructions
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, shuah <shuah@kernel.org>
References: <20190416142651.7048-1-shuah@kernel.org>
 <20190416092610.78b462de@lwn.net>
 <90615fb4-ff56-af72-f4ea-f3dbc3db26df@kernel.org>
 <20190416135923.4e9d32e4@lwn.net>
From:   shuah <shuah@kernel.org>
Message-ID: <65a59c5a-f042-a77a-17ab-02e364b065a9@kernel.org>
Date:   Tue, 16 Apr 2019 14:05:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190416135923.4e9d32e4@lwn.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 4/16/19 1:59 PM, Jonathan Corbet wrote:
> On Tue, 16 Apr 2019 09:50:16 -0600
> shuah <shuah@kernel.org> wrote:
> 
>>>> +Build and run from KBUILD_OUTPUT directory (make KBUILD_OUTPUT=)::
>>>>    
>>>> -  $ make KBUILD_OUTPUT=/tmp/kselftest kselftest
>>>> +  $ export KBUILD_OUTPUT=/tmp/kselftest; make kselftest
>>>
>>> Is there a particular reason why this variable needs to be set in the
>>> environment rather than just in make?  More importantly, though, I don't
>>> think this would work if you run it from the KBUILD_OUTPUT directory.  What
>>> you're really doing is running with a separate output directory, right?
>>>    
>>
>> That is correct. I am matching the instructions in the main Makefile:
>>
>> # kbuild supports saving output files in a separate directory.
> 
> So my concern was right, then: this is not a way to "run from the
> KBUILD_OUTPUT" directory; that seems certain to confuse people.  I'll
> apply the patch so that the commands are right, but that could maybe use
> some tweaking.
> 

Yes. I can see it could confuse people.

I can tweak the wording to add that the working directory is the kernel
source dir, and that the command should be run from root of the kernel
source repo and send v2. The same changes probably need to be made for
the O= case if that isn't clear.

thanks,
-- Shuah




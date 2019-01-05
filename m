Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 940DE7D04D
	for <lwn-linux-doc@archive.lwn.net>; Sat,  5 Jan 2019 21:04:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbfAEVEf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 5 Jan 2019 16:04:35 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45909 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbfAEVEf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 5 Jan 2019 16:04:35 -0500
Received: by mail-pg1-f193.google.com with SMTP id y4so18952053pgc.12
        for <linux-doc@vger.kernel.org>; Sat, 05 Jan 2019 13:04:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qSz/F2fhfjwGgfK16CazoICHRST9jNqPoWyrCHEL4Ko=;
        b=ocOWfyj5NAPIgClSoMec3uXPtvihkbqEQi6KGMIydGVBJW9PUfQJ3HAmzSVb9Rr79s
         7GAYGm6EStEKTbq4lP04tDmXmZ7e8yLgGEUg0uC4qEBsIohGqaJVM2kfFeVNEhe9jfa4
         FpD7FNe2BsSaAJLtyUj2F35H/mzpxx6kv/+fVnrJcbS32inqPnxHb60c2PaYf0JAvebf
         zBKFq2tQuUDZ32H9y49fzrgHa6tYATB+ivHKC+qZCFnpTHQzSvd+OP8efqBAaWjTV/l9
         psgh3BFRckTTl5A2k+QP85nuWICDavj4QQuvUmwCyZZFvTYNNaYfhVAlPs2cF5UrtcS2
         v3eQ==
X-Gm-Message-State: AJcUukfPoEoToyXxMe5B7+hoxlm5Yni0Gc/BXBn+5SSHRXvaEXXeVCmF
        TMs1IJaHV+VDrzwLs6/IClI=
X-Google-Smtp-Source: AFSGD/WzQXx2vu1N7oWhNQcQm0IXHDY7O6uvL+tzowSsDeUtKKTb6TQTRm8B75L1ESX+w/qEgbH2Gw==
X-Received: by 2002:a62:4156:: with SMTP id o83mr57250691pfa.72.1546722273195;
        Sat, 05 Jan 2019 13:04:33 -0800 (PST)
Received: from asus.site (c-73-222-28-29.hsd1.ca.comcast.net. [73.222.28.29])
        by smtp.gmail.com with ESMTPSA id p2sm87357064pfp.125.2019.01.05.13.04.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 05 Jan 2019 13:04:32 -0800 (PST)
Subject: Re: [PATCH] Documentation/CodingStyle: Use directory-local variables
 for emacs
To:     Alison Chaiken <alison@she-devel.com>
Cc:     Federico Vaga <federico.vaga@vaga.pv.it>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Matthew Wilcox <willy@infradead.org>,
        "Geyslan G . Bem" <geyslan@gmail.com>,
        Tiago Natel de Moura <tiago4orion@gmail.com>,
        Joe Perches <joe@perches.com>, Li Yang <leo@zh-kernel.org>
References: <20190104210834.89231-1-bvanassche@acm.org>
 <1951386.HLNclI27qt@harkonnen> <1546641550.83374.8.camel@acm.org>
 <84ce7ee302856836b922cfe0ddf2a74e@she-devel.com>
From:   Bart Van Assche <bvanassche@acm.org>
Message-ID: <e8b69c8e-6d70-38b3-7b5d-06cc5b251999@acm.org>
Date:   Sat, 5 Jan 2019 13:04:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.3
MIME-Version: 1.0
In-Reply-To: <84ce7ee302856836b922cfe0ddf2a74e@she-devel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 1/5/19 11:58 AM, Alison Chaiken wrote:
> On 2019-01-04 14:39, Bart Van Assche wrote:
>>> As a general comment, I personally think that it worth to mention the 
>>> fact
>>> that the user can take this code (actually part of it) and put it in 
>>> a .dir-
>>> locals.el file in the top-level directory.
>>
>> I'm not sure we should recommend this. Settings in ~/.emacs are not 
>> affected
>> by git clean -f -x but .dir-locals.el is removed by that command.
> 
> Why not add the file to .gitignore, possibly in a separate patch?

Hi Alison,

I think that git clean -f -x also removes files specified in .gitignore. 
 From the git-clean man page:

   -x
      Don't use the standard ignore rules read from .gitignore (per
      directory) and $GIT_DIR/info/exclude, but do still use the ignore
      rules given with -e options. This allows removing all untracked
      files, including build products. This can be used (possibly in
      conjunction with git reset) to create a pristine working directory
      to test a clean build.

Bart.

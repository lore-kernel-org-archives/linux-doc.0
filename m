Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91226C433ED
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 06:18:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 56D7061370
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 06:18:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243329AbhDMGS0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Apr 2021 02:18:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240558AbhDMGS0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Apr 2021 02:18:26 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A983C061574
        for <linux-doc@vger.kernel.org>; Mon, 12 Apr 2021 23:18:07 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id y2so7640088plg.5
        for <linux-doc@vger.kernel.org>; Mon, 12 Apr 2021 23:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9KqIvsRYSSsVujtTMZSd9pe0xa3dgY26sQTVFmSpc34=;
        b=oabmfGkWdybIcn6MW/oD/ZPJhnXyX7dCKTVvID+ED2jdp8caIDyhc6TJQiy8Ol+diL
         SvY1MmOFMF4HjCuwxGofqVAoPBPs5TKpHFIfKdF1eb8PhbWiX+SQIgYO3lXhg6YN/C7d
         EwYqcJcTxnW4MSeqVuEDPEApet4AsOuYbXl0qg+3097vimXvlUZ2CDMRehRURZpXMKMw
         U10ZKidjXMiQjCEu7/MZQZX2USPdQbI/n3JVqlFgcCjvPL+QT3LSQuu2EFhhYBsR4bj8
         Je8cVcH0flN0yC5KTYW+/qGlB5Lpr2qKX8BQ92urBPhBh2GmwtEgmJ1vN6CWwU416DZo
         Fh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9KqIvsRYSSsVujtTMZSd9pe0xa3dgY26sQTVFmSpc34=;
        b=Ngq3+5uc1UVM8KkW6qTfvKfy8IXujXjxACHj9LVR99S+0eJ85FMlm0Cw0towi8XuuP
         mwxS2ka3jvcYd9fOQ4PDKpBMub4RCJi8UzXWaT3W1eob5TiPsnaPMEXOZSWv4hS8W3R0
         KhaYT9TOLftnYi9tUhfn7FKfj0qsgheDPcE9PlRs82gczgwdsgsO1+IioumLQxK012FZ
         e1WV2Gd5/1QPPjSkAZlw+nJ78jy8l1oIqGRxLmofDwozimDdL46PkcpzKlcxz+nLZ+/2
         6mXLgiCAbd1WGJVhRwPDmtTXLybHkCRzzKTg26+vVGgnq+RkcsqxpwW5gb9Kq5Lnsu4K
         RJUg==
X-Gm-Message-State: AOAM530RmsUbKlDLhSsvkDn/Lrbr5gsHtn6sLecR+NIEvI5etFpaxsyo
        o7W2xR/MY8n2IqEas3flmmj5/tLN/xg+Ww==
X-Google-Smtp-Source: ABdhPJymdX7RvcptXTR9fyayS+L/gQVlcervUpGnoFjqrSRgo3ubZyLBTkvSLX8bCqph9tXgLec+bQ==
X-Received: by 2002:a17:90b:1490:: with SMTP id js16mr3057528pjb.131.1618294686320;
        Mon, 12 Apr 2021 23:18:06 -0700 (PDT)
Received: from [192.168.2.225] (93.179.119.173.16clouds.com. [93.179.119.173])
        by smtp.gmail.com with ESMTPSA id x22sm11213681pfa.24.2021.04.12.23.18.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Apr 2021 23:18:05 -0700 (PDT)
Subject: Re: [PATCH v3 4/8] docs/zh_CN: Add translation
 zh_CN/doc-guide/parse-headers.rst
To:     "Wu X.C." <bobwxc@email.cn>, teng sterling <sterlingteng@gmail.com>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <cover.1617699755.git.bobwxc@email.cn>
 <ebccf009f3cf77b3340e39e9675f26d8d75ca3f6.1617699755.git.bobwxc@email.cn>
 <CAMU9jJpeyNBMg4a0GcyBZfPLtP2JheTD-JZ3e197VweyYhv-jg@mail.gmail.com>
 <20210413053407.GA19607@bobwxc.top>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <5b85da51-1862-7e13-33c3-93c28f4598a8@gmail.com>
Date:   Tue, 13 Apr 2021 14:18:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210413053407.GA19607@bobwxc.top>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 2021/4/13 下午1:34, Wu X.C. wrote:
> On Tue, Apr 13, 2021 at 12:12:32AM +0800, teng sterling wrote:
>> Wu XiangCheng <bobwxc@email.cn> 于2021年4月7日周三 下午3:51写道：
>>>
>>> Add new translation
>>>   Documentation/translations/zh_CN/doc-guide/parse-headers.rst
>>>
>>> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
>>> ---
>>>  .../zh_CN/doc-guide/parse-headers.rst         | 182 ++++++++++++++++++
>>>  1 file changed, 182 insertions(+)
>>>  create mode 100644 Documentation/translations/zh_CN/doc-guide/parse-headers.rst
>>>
>>> diff --git a/Documentation/translations/zh_CN/doc-guide/parse-headers.rst b/Documentation/translations/zh_CN/doc-guide/parse-headers.rst
>>> new file mode 100644
>>> index 000000000000..4f6fa083a3c5
>>> --- /dev/null
>>> +++ b/Documentation/translations/zh_CN/doc-guide/parse-headers.rst
>>> @@ -0,0 +1,182 @@
> [...]
>>> +
>>> +
>>> +说明
>>> +~~~~~
>>> +
>>> +
>>> +通过描述API的文档中的有交叉引用的解析后文本块，将C头文件或源文件（<C文件>）
> 
>> This line is difficult for me to understand, and it seems to say:
>> 通过解析C头文件或C文件中对API（一个函数原型）描述的文本块（以一定格式约定写的注释）……到ReStructureText。
>> I'm not sure.   ：）
>>
> 
> I thought again, maybe
> 
> 通过C头文件或源文件（<C文件>）中为描述API文档编写的
> 带交叉引用的 ..预格式化文本 块将其转换成ReStructureText。

ReStructuredText -> 重构文本(RST) ？

将‘其’ ， ‘其’ 容易引起误会， 换成‘将文件转换成重构文本‘ 怎么样？


> 
>>> +转换进ReStructureText。它接受一个可选的<例外文件>，其中描述了哪些元素将被忽略
>>> +或指向非默认引用。
>>> +
> [...]
>>> --
>>> 2.20.1
>>>
>>
>> Thanks！
>>
>> Yan teng
> 

Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF873C28D13
	for <linux-doc@archiver.kernel.org>; Thu, 25 Aug 2022 13:30:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242670AbiHYNaM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Aug 2022 09:30:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242673AbiHYNaC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Aug 2022 09:30:02 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 957EE74B8C
        for <linux-doc@vger.kernel.org>; Thu, 25 Aug 2022 06:29:57 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id p185so5305626pfb.13
        for <linux-doc@vger.kernel.org>; Thu, 25 Aug 2022 06:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=dTFw9x7UWEYWmcpi8QQ3ADKhSd2hLCnt4Nb7ZML9r2c=;
        b=pOJV7py+1gmdPby1+qgIJXeyyz4vq0Y6SLPWPk9C8wUZ3jbdpsjj+uYWZc4U5ah1p+
         yuDLAenPGiZt6i2y5O9Yjy3d+66C3b0XSxLsquozHv/qZWsspon/9kgcx0Slj2iTSp1k
         tf1pbn+dGkU5JKNE6CsKL0XkZsCaDBaP57N3oUk7avUm45JecCZgR0w917DxONm4foP9
         xOgSNwfIZVy54TaQXWB3pMJ3kszwkTpW+JZncbc3bnLEpumsNiR5JaB77HhsTQGz+MOu
         ozcglXwiMk+OTMLGHZ8euypblNhMuH8XJxn2qewzILgRw3UqQ1IkQCC86Z7Hg5aEY57Y
         POfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=dTFw9x7UWEYWmcpi8QQ3ADKhSd2hLCnt4Nb7ZML9r2c=;
        b=Mww2g6d/TZj4DyC9ADY0sy8ttb5B1/44voKOCVEk126azBgo5uI9JCVb1Ff8hrRgBr
         DvpkFwQzItDJVGnrmUJTen1Gxik2+N671P7PTOSAdHPPf+mDVCP/g3drWYKyb82jPvoK
         6uxQD0wMyPCX731AfU9tVm55jKE+12uHpisEupiERtrkIRslIDqEfFEJccvFXBbG0ABk
         m3QPSu/sTpL9J6x6AajCGK1ov8MrM19lvNTyZzANjK8evOmS19TMrvVQey69Jj9B2JJG
         IJHQYBDpz2ksmUksnDnGt9kfi8kQSXi7hL3mX6gbf6Se42yBoyuRsF3B3d7bYmVMwUAg
         +z4g==
X-Gm-Message-State: ACgBeo3JQhwCgBtC1eRn4wDAyHjFYMzNg4dVF1OiN2ARRqtPmtzS5KD7
        48AB1JOZDlhN+vWoXQTfZzlaxg==
X-Google-Smtp-Source: AA6agR49xMvUT/izcMy5D0EpEk6DPB8yIxNuV5ufRx18BJi72MgIWrhVUECm9Ioz1lXHqW96DaFZkw==
X-Received: by 2002:a65:6bca:0:b0:420:712f:ab98 with SMTP id e10-20020a656bca000000b00420712fab98mr3331215pgw.350.1661434196720;
        Thu, 25 Aug 2022 06:29:56 -0700 (PDT)
Received: from [10.254.35.15] ([139.177.225.252])
        by smtp.gmail.com with ESMTPSA id d17-20020a170902f15100b00172ef499c83sm7990449plb.32.2022.08.25.06.29.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 06:29:56 -0700 (PDT)
Message-ID: <5165abfc-9f42-93ea-a888-11eaa4ab3420@bytedance.com>
Date:   Thu, 25 Aug 2022 21:29:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH v3 10/10] sched/psi: per-cgroup PSI accounting
 disable/re-enable interface
Content-Language: en-US
To:     Johannes Weiner <hannes@cmpxchg.org>
Cc:     tj@kernel.org, mkoutny@suse.com, surenb@google.com,
        gregkh@linuxfoundation.org, corbet@lwn.net, mingo@redhat.com,
        peterz@infradead.org, songmuchun@bytedance.com,
        cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220824081829.33748-1-zhouchengming@bytedance.com>
 <20220824081829.33748-11-zhouchengming@bytedance.com>
 <YwX2jC2UQ/zeY2E8@cmpxchg.org>
 <324b1d0f-42e5-8947-68cb-a3d20135f2c6@bytedance.com>
 <Ywd3K1+5blotUEtU@cmpxchg.org>
From:   Chengming Zhou <zhouchengming@bytedance.com>
In-Reply-To: <Ywd3K1+5blotUEtU@cmpxchg.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2022/8/25 21:20, Johannes Weiner wrote:
> On Thu, Aug 25, 2022 at 08:28:39PM +0800, Chengming Zhou wrote:
>> On 2022/8/24 17:59, Johannes Weiner wrote:
>>> Hi Chengming,
>>>
>>> Thanks for incorporating all the feedback. I have a few nitpicks
>>> below, but with those considered, please add:
>>>
>>> Acked-by: Johannes Weiner <hannes@cmpxchg.org>
>>>
>>> On Wed, Aug 24, 2022 at 04:18:29PM +0800, Chengming Zhou wrote:
>>>> @@ -5171,12 +5220,19 @@ static struct cftype cgroup_base_files[] = {
>>>>  	{
>>>>  		.name = "irq.pressure",
>>>>  		.flags = CFTYPE_PRESSURE,
>>>> +		.file_offset = offsetof(struct cgroup, psi_files[PSI_IRQ]),
>>>>  		.seq_show = cgroup_irq_pressure_show,
>>>>  		.write = cgroup_irq_pressure_write,
>>>>  		.poll = cgroup_pressure_poll,
>>>>  		.release = cgroup_pressure_release,
>>>>  	},
>>>>  #endif
>>>> +	{
>>>> +		.name = "cgroup.pressure",
>>>> +		.flags = CFTYPE_PRESSURE,
>>>> +		.seq_show = cgroup_psi_show,
>>>> +		.write = cgroup_psi_write,
>>>
>>> To match the naming convention, these should be called
>>> cgroup_pressure_show() and cgroup_pressure_write().
>>
>> I just find cgroup_pressure_write() already exists, so I change the names
>> to cgroup_pressure_enable_show() and cgroup_pressure_enable_write(),
>> since this file name is simplified from "cgroup.pressure.enable".
> 
> That makes two outliers instead of one. It's probably better to steal
> cgroup_pressure_write for cgroup.pressure, and rename the currently
> misnamed helper. How about do_pressure_write()? pressure_write()?

Ok, I will change that helper to pressure_write().

Thanks.


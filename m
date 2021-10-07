Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E69B3C433EF
	for <linux-doc@archiver.kernel.org>; Thu,  7 Oct 2021 09:33:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BEABA611C3
	for <linux-doc@archiver.kernel.org>; Thu,  7 Oct 2021 09:33:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240592AbhJGJe6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 7 Oct 2021 05:34:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50370 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232700AbhJGJe6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Oct 2021 05:34:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633599184;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YLM20CrNDiSc8ANWHfJkU17zM0jd+LCsGgIfHq5T3Hk=;
        b=Qm9yhdhnvMrWWcj/IGjSK5TI7ChgiUfswj8ssOQmLEGXw74WR/s5H9ZbMUHQTOqO0nJHIt
        NPOS3kgZZHrh7HvqDdfrpIElX6HAVCtiI1Lky2X5kpbEGl8iKPNOm8xW0PNh6lMoSy946s
        8fTID3utYMAu7gsw7tqxDnwt4WmqCAg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-SGwr_uDqOmWd40JMLVn8RQ-1; Thu, 07 Oct 2021 05:33:03 -0400
X-MC-Unique: SGwr_uDqOmWd40JMLVn8RQ-1
Received: by mail-wr1-f69.google.com with SMTP id p12-20020adfc38c000000b00160d6a7e293so1708246wrf.18
        for <linux-doc@vger.kernel.org>; Thu, 07 Oct 2021 02:33:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=YLM20CrNDiSc8ANWHfJkU17zM0jd+LCsGgIfHq5T3Hk=;
        b=dH3CoLuagtcc/aaoWjcrZKllqBSwHCm/QR57YCMHdfzTH/T3CfaLQwiANFRMD6YG6W
         1y5iAgL5yb2h/7Inpl3RxaKOzMhCCIXc2IgRLJrXpn4pT4uFyEMhofnLBSRk+HmchdJP
         Zm0aGQprdMYKAGtzQungxD/66fEdzbObf2Yhrsj7XpTePkPHG5+PizSdZdhCxawfWO7h
         yvQ/rjZhTLCzUni4+O+bvDcSpeDRG/53BjxA/P+53vwJi08+E67FR0+AeKBobEIpzDu/
         XdwteTQATradCFwwsvtStoixWMIw6ZZ8tGmSVDxWsA1C4O1C2YBCdbWKXaYPzXiXt5e5
         AGFg==
X-Gm-Message-State: AOAM5337/mizXLMVY1edJeEc7GAWhoYIe38Oi09FTdX1j+A2xjD30xbc
        RnrZO2+L0pG9z4AFeKmp6Ok0UWI9iMN9s4967Em3f01rdoWL9fSOy/OaSekYuvoZeCA+zkCjthC
        jL4WRfE4v/YFhjkMYJ2Cq
X-Received: by 2002:adf:a118:: with SMTP id o24mr3898232wro.15.1633598859308;
        Thu, 07 Oct 2021 02:27:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTkTGQO7OWYf67tE5FRQkAoLSad774DWcZLIKG1RX8coeD4jn+lqAsFsAow6Xbu9zf7PRTow==
X-Received: by 2002:adf:a118:: with SMTP id o24mr3898207wro.15.1633598859138;
        Thu, 07 Oct 2021 02:27:39 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6886.dip0.t-ipconnect.de. [91.12.104.134])
        by smtp.gmail.com with ESMTPSA id l17sm23582725wrx.24.2021.10.07.02.27.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Oct 2021 02:27:38 -0700 (PDT)
Subject: Re: [PATCH v1 6/6] x86: remove memory hotplug support on X86_32
To:     Oscar Salvador <osalvador@suse.de>
Cc:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Shuah Khan <shuah@kernel.org>, Michal Hocko <mhocko@suse.com>,
        Mike Rapoport <rppt@kernel.org>, x86@kernel.org,
        linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
        linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        virtualization@lists.linux-foundation.org
References: <20210929143600.49379-1-david@redhat.com>
 <20210929143600.49379-7-david@redhat.com>
 <YV66zoLEP3niIHEu@localhost.localdomain>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <565bdc3e-04b2-8eff-181c-d4dcf82e0e40@redhat.com>
Date:   Thu, 7 Oct 2021 11:27:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YV66zoLEP3niIHEu@localhost.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 07.10.21 11:15, Oscar Salvador wrote:
> On Wed, Sep 29, 2021 at 04:36:00PM +0200, David Hildenbrand wrote:
>> CONFIG_MEMORY_HOTPLUG was marked BROKEN over one year and we just
>> restricted it to 64 bit. Let's remove the unused x86 32bit implementation
>> and simplify the Kconfig.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> Reviewed-by: Oscar Salvador <osalvador@suse.de>

Thanks for the review Oscar!

-- 
Thanks,

David / dhildenb


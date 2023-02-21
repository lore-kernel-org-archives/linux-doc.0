Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B63C2C64ED6
	for <linux-doc@archiver.kernel.org>; Tue, 21 Feb 2023 08:49:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233790AbjBUItO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 21 Feb 2023 03:49:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233781AbjBUItO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Feb 2023 03:49:14 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EC5A8A4C
        for <linux-doc@vger.kernel.org>; Tue, 21 Feb 2023 00:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676969306;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2wre1vj5fzLAyd/5IJIMuz7JfjlppXHl7jpGjVvaTF0=;
        b=FJYd1Ykv0mGOrVG3QKkRzAQDpLkDuWJxsZ08xIAfaRdZy5LuK1PJze/nCru7PNySbgIVsg
        2Ri5fWvteJxGXVgdQJWsleqhk6grGg7OwBzKlJQsGc9nrOX22T/hdyeX2DCHOIht4cs2bS
        BWYZjXv4LRx1L3BGtfxx8YNjV/dUOKE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-452-W6Pea6fnOfejcPkTyOdLTA-1; Tue, 21 Feb 2023 03:48:25 -0500
X-MC-Unique: W6Pea6fnOfejcPkTyOdLTA-1
Received: by mail-wm1-f70.google.com with SMTP id x18-20020a1c7c12000000b003e1e7d3cf9fso1803626wmc.3
        for <linux-doc@vger.kernel.org>; Tue, 21 Feb 2023 00:48:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2wre1vj5fzLAyd/5IJIMuz7JfjlppXHl7jpGjVvaTF0=;
        b=RHY5XXHmB1kx5ZiLIh7OruK78eV8vs3TqWPLU/7qW8nR9W/G1OvsffC4+95+xFpdOc
         FVwBZ30rYO5eBFLKDeemUeQgJUAIFiEOeI3r+d/RP7VWQBkueIuIBwG5Ebg+i/+ngvzV
         ST29afwNHdu89cObQFpZ14FmiBFJU6k3i/ksEjxsOCjsH2R7PxMHuIkMY7/Mn7aVQy+8
         cPDl15IaeKyNJUmZJvZMTWSP7pmRgLxndzgEvhEhZPBM5GAsix1cKM1ndyE1iXo/dsW1
         F2zKnUhfNn+ZgDMh+xpBf7uAnoiq9V6mEa5cNud1gqWI5IRmfXejJfB2FKhM2kKZHlx+
         fDPA==
X-Gm-Message-State: AO0yUKVkkLJP2NzWmUcaMSzXj6l+SQqn60XCvUuPRBNy/eHlX50hTY8W
        UjBQv+uTRHfqriXMl8pD/ioAg/muQM2Eam4X5hbNbWYtofQubaCS7AlCq6mSuU4Jv0UJrPW1Wbl
        NMqHO+KuTGsW09u8Y91IUSgkiRQ==
X-Received: by 2002:a1c:4c14:0:b0:3de:1d31:1042 with SMTP id z20-20020a1c4c14000000b003de1d311042mr2953123wmf.23.1676969304235;
        Tue, 21 Feb 2023 00:48:24 -0800 (PST)
X-Google-Smtp-Source: AK7set8y6ZGLraGaqCxBqf1wh9ujrFtZmVaM/aUNnRhTHeMZveYItWe6AvIKaGMKcmDIyF4S+3zDiA==
X-Received: by 2002:a1c:4c14:0:b0:3de:1d31:1042 with SMTP id z20-20020a1c4c14000000b003de1d311042mr2953071wmf.23.1676969303872;
        Tue, 21 Feb 2023 00:48:23 -0800 (PST)
Received: from ?IPV6:2003:cb:c707:4800:aecc:dadb:40a8:ce81? (p200300cbc7074800aeccdadb40a8ce81.dip0.t-ipconnect.de. [2003:cb:c707:4800:aecc:dadb:40a8:ce81])
        by smtp.gmail.com with ESMTPSA id p8-20020a05600c468800b003e2232d0960sm4815226wmo.23.2023.02.21.00.48.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 00:48:23 -0800 (PST)
Message-ID: <bed841c6-5b37-6c91-81c7-5c06788d38c4@redhat.com>
Date:   Tue, 21 Feb 2023 09:48:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To:     Rick Edgecombe <rick.p.edgecombe@intel.com>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@kernel.org>,
        Balbir Singh <bsingharora@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eugene Syromiatnikov <esyr@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H . J . Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Weijiang Yang <weijiang.yang@intel.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        John Allen <john.allen@amd.com>, kcc@google.com,
        eranian@google.com, rppt@kernel.org, jamorris@linux.microsoft.com,
        dethoma@microsoft.com, akpm@linux-foundation.org,
        Andrew.Cooper3@citrix.com, christina.schimpe@intel.com,
        debug@rivosinc.com
Cc:     Yu-cheng Yu <yu-cheng.yu@intel.com>
References: <20230218211433.26859-1-rick.p.edgecombe@intel.com>
 <20230218211433.26859-38-rick.p.edgecombe@intel.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v6 37/41] selftests/x86: Add shadow stack test
In-Reply-To: <20230218211433.26859-38-rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 18.02.23 22:14, Rick Edgecombe wrote:
> Add a simple selftest for exercising some shadow stack behavior:
>   - map_shadow_stack syscall and pivot
>   - Faulting in shadow stack memory
>   - Handling shadow stack violations
>   - GUP of shadow stack memory
>   - mprotect() of shadow stack memory
>   - Userfaultfd on shadow stack memory
> 
> Since this test exercises a recently added syscall manually, it needs
> to find the automatically created __NR_foo defines. Per the selftest
> documentation, KHDR_INCLUDES can be used to help the selftest Makefile's
> find the headers from the kernel source. This way the new selftest can
> be built inside the kernel source tree without installing the headers
> to the system. So also add KHDR_INCLUDES as described in the selftest
> docs, to facilitate this.
> 
> Tested-by: Pengfei Xu <pengfei.xu@intel.com>
> Tested-by: John Allen <john.allen@amd.com>
> Co-developed-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> 
> ---


[...]

> +bool gup_write(void *ptr)
> +{
> +	unsigned long val;
> +
> +	lseek(fd, (unsigned long)ptr, SEEK_SET);
> +	if (write(fd, &val, sizeof(val)) < 0)
> +		return 1;

/proc/self/mem is for debug/ptrace access (FOLL_FORCE). I think you 
might also want to add tests for ordinary GUP, checking that we fail to 
obtain a write pin -- and call these tests "gup_ptrace_read" / 
"gup_ptrace_write"

An simple approach would be to trigger a read()/write() on a file opened 
via O_DIRECT, using the shadow stack as buffer. While the write() 
[reading from the page] is expected to work, a read() [writing to the 
page] has to fail.


-- 
Thanks,

David / dhildenb


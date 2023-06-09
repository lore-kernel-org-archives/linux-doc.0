Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C809C87FDC
	for <linux-doc@archiver.kernel.org>; Fri,  9 Jun 2023 09:06:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240954AbjFIJFt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Jun 2023 05:05:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241089AbjFIJFj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Jun 2023 05:05:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAA5F2685
        for <linux-doc@vger.kernel.org>; Fri,  9 Jun 2023 02:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686301475;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TLk6gSKtsM+p9Rtgq5+IZGVTEjc3fvT8GmlHeUGj3wU=;
        b=ehUwn+5fAisgAEtAIMl5EIJdeclqSq8CTML5XxKV3vnBdSoKWM2gHwMxwSDWO0iw5VXJLh
        8SS/MgxwDJJJA3Tt6AO+Slri6c8ud7wu7sku5IGptOdbBlKOktrAg+YkIdnNEDgtpKVACA
        bxrEekcdTsq3Acc+35VY7WKEzTLjEFM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-hdSrLNgeMPCCJzXBEHOMbg-1; Fri, 09 Jun 2023 05:04:34 -0400
X-MC-Unique: hdSrLNgeMPCCJzXBEHOMbg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9715654ab36so150683766b.0
        for <linux-doc@vger.kernel.org>; Fri, 09 Jun 2023 02:04:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686301473; x=1688893473;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TLk6gSKtsM+p9Rtgq5+IZGVTEjc3fvT8GmlHeUGj3wU=;
        b=XxkH7iJf0PlVmricNtnJwtjNsOwMUh9mPRoi/7r2ARrjm/AhGdRbZorFMNrkcMPSqD
         UqAocdmDlXyayEINp7+A3Wb1Dy7w3AUe/Y5Cr1L9qVX7lNmxX1gkOZVHgjTnYCN7Xbev
         Oh9Zg+Q5bUibFmp0qTQcEOUzH2kPnDOL8IL5ug/RfgBSWVvbkkoB8QX/XoOd6iD0KUaX
         McrR/ngfQ6zeukCc9rDW2D4OUrCZMjfHGsBH9cDarYOeGxa3frzSk7JtG/AG/QmutqsR
         4zR6nSxTRsbjxeR30FV7Jcg8wkEN1yIq1x/2Aa0U+m0xXRNgZZ4G78h2HqDFGZObUnX5
         hxow==
X-Gm-Message-State: AC+VfDxiD6bEdVtvaOvHZM9zfmroz75ISRa/uTejhCC0U/YZ6dXy86Wp
        DVDbiw9NLBWwDBohGT9EeRB8g4v8wiRj+v9NfmN+oTGnT6wGgsvrhy0+8oSWL1y+zHOCOYdTsWt
        pRtLieeNUkAwWPwljgyD3
X-Received: by 2002:a17:907:c15:b0:94e:1764:b09b with SMTP id ga21-20020a1709070c1500b0094e1764b09bmr1027466ejc.45.1686301472980;
        Fri, 09 Jun 2023 02:04:32 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4KrasOi5l6sCNShc9kV8qfG1eq+fRbvkSLL3UxeHKWwdsKczbSQdc/+63BzxHLxAbWxA2H7A==
X-Received: by 2002:a17:907:c15:b0:94e:1764:b09b with SMTP id ga21-20020a1709070c1500b0094e1764b09bmr1027414ejc.45.1686301472616;
        Fri, 09 Jun 2023 02:04:32 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id v5-20020a170906858500b0096f72424e00sm1013932ejx.131.2023.06.09.02.04.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 02:04:32 -0700 (PDT)
Message-ID: <e948d02f-cd93-b6e2-72fd-123e483f66fe@redhat.com>
Date:   Fri, 9 Jun 2023 11:04:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH mm-unstable v2 01/10] mm/kvm: add
 mmu_notifier_ops->test_clear_young()
Content-Language: en-US
To:     Jason Gunthorpe <jgg@ziepe.ca>, Yu Zhao <yuzhao@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Alistair Popple <apopple@nvidia.com>,
        Anup Patel <anup@brainfault.org>,
        Ben Gardon <bgardon@google.com>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Chao Peng <chao.p.peng@linux.intel.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Fabiano Rosas <farosas@linux.ibm.com>,
        Gaosheng Cui <cuigaosheng1@huawei.com>,
        Gavin Shan <gshan@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        James Morse <james.morse@arm.com>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Marc Zyngier <maz@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michael Larabel <michael@michaellarabel.com>,
        Mike Rapoport <rppt@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Oliver Upton <oliver.upton@linux.dev>,
        Paul Mackerras <paulus@ozlabs.org>,
        Peter Xu <peterx@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Thomas Huth <thuth@redhat.com>, Will Deacon <will@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev,
        kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
        linux-trace-kernel@vger.kernel.org, x86@kernel.org,
        linux-mm@google.com
References: <20230526234435.662652-1-yuzhao@google.com>
 <20230526234435.662652-2-yuzhao@google.com> <ZHedMX470b7EMwbe@ziepe.ca>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <ZHedMX470b7EMwbe@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 5/31/23 21:17, Jason Gunthorpe wrote:
>> +	int (*test_clear_young)(struct mmu_notifier *mn, struct mm_struct *mm,
>> +				unsigned long start, unsigned long end,
>> +				bool clear, unsigned long *bitmap);
>> +
> Why leave clear_young behind? Just make a NULL bitmap mean
> clear_young?

It goes away in patch 2, together with:

@@ -437,7 +412,7 @@ static inline int mmu_notifier_clear_young(struct mm_struct *mm,
  					   unsigned long end)
  {
  	if (mm_has_notifiers(mm))
-		return __mmu_notifier_clear_young(mm, start, end);
+		return __mmu_notifier_test_clear_young(mm, start, end, true, NULL);
  	return 0;
  }
  
@@ -445,7 +420,7 @@ static inline int mmu_notifier_test_young(struct mm_struct *mm,
  					  unsigned long address)
  {
  	if (mm_has_notifiers(mm))
-		return __mmu_notifier_test_young(mm, address);
+		return __mmu_notifier_test_clear_young(mm, address, address + 1, false, NULL);
  	return 0;
  }
  

Paolo


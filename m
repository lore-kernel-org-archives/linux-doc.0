Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4865C05027
	for <linux-doc@archiver.kernel.org>; Fri, 10 Feb 2023 00:37:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231192AbjBJAh2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Feb 2023 19:37:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231166AbjBJAhH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Feb 2023 19:37:07 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 788C36E887
        for <linux-doc@vger.kernel.org>; Thu,  9 Feb 2023 16:36:37 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id f15-20020a17090ac28f00b00230a32f0c9eso3976979pjt.4
        for <linux-doc@vger.kernel.org>; Thu, 09 Feb 2023 16:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W7YPU86kRh43fh/B9xA9EKXQH40cZnkadx8AsjXbI3M=;
        b=n02O/fL0+7AmXTmeiZ+eZ9d5ZT/GiXiS4usm8YWkyYIOPv66XejcWTG/tLJzS4ejkM
         ovnmjNf+/V4WMPR5hJhke3vD4GplhYtvL9vEmYS6rKRFRInOWY36YmcSGRlRlXtIqk2x
         zyyYNZ5RPe7YC1b4z/lhTrlqaQI8TZd/6fcFdDffIo1BEQ/N3P7wZXdRNFCaaVDVEmaC
         k7EM7JL4YwRd8/j1fpMwi0Sv19KAavj/Z3Lox3YCddOW/BESEhsEfDKnGobVr1uu+fRI
         IcumcKWqHnYFfcFoEuc9ODLNMlqMcGwYmuqo7O/bx2Pw8Bf2iZVjEA7+bSDnR5xz4m5D
         EuCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W7YPU86kRh43fh/B9xA9EKXQH40cZnkadx8AsjXbI3M=;
        b=Jnc9G2+fvTfkW5t949Wlbhd36+ZuuI3HoXdcj3BUVFiGNs/QdTOLwGSbj14/szf0SC
         5Uj0EhYpcoag7PrnofVOEsZ9/lZB4Byly5h2R1HOr1V+N6seZzLyVmnl9B9M1Su6HkZ8
         Ifr3v4x8vs9oO/C8iHmkVQwzrSoGSOIqtFAw1j8bujgzUVP2szLlQL5TXVizEBfXzfwF
         tFH3afESQmJPgp26IERm+YAKcVH9BSRF9bO+j7wTQJXupotcVFmMvX97JQWU0ZfHoZBS
         c/zbw9WgIBjgAb7eP7f4vSNdztEbtooHV/mRt4vM/rzL2qjZG92aaTnaxnFcQOTVYoWt
         d1Iw==
X-Gm-Message-State: AO0yUKU9gZG4srNuc0tTH4bM59xGvO2hLhBrNu4AfuoIdZ0Ask6w6om/
        sz9514VOc87ElouSskaZXa3h3w==
X-Google-Smtp-Source: AK7set/11E4jpVghRlgOmElBR2Eplp/YT9s1l5QVxf/giHCfieVdfEaQkx8Mgi5PszE54dGY0TW/bw==
X-Received: by 2002:a17:902:e551:b0:19a:6cd2:a658 with SMTP id n17-20020a170902e55100b0019a6cd2a658mr34785plf.7.1675989335399;
        Thu, 09 Feb 2023 16:35:35 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id a11-20020a1709027e4b00b00189b2b8dbedsm2069302pln.228.2023.02.09.16.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 16:35:34 -0800 (PST)
Date:   Fri, 10 Feb 2023 00:35:30 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Isaku Yamahata <isaku.yamahata@gmail.com>
Cc:     Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
        qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Naoya Horiguchi <naoya.horiguchi@nec.com>,
        Miaohe Lin <linmiaohe@huawei.com>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
        Jeff Layton <jlayton@kernel.org>,
        "J . Bruce Fields" <bfields@fieldses.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Steven Price <steven.price@arm.com>,
        "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
        Vlastimil Babka <vbabka@suse.cz>,
        Vishal Annapurve <vannapurve@google.com>,
        Yu Zhang <yu.c.zhang@linux.intel.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
        ak@linux.intel.com, david@redhat.com, aarcange@redhat.com,
        ddutile@redhat.com, dhildenb@redhat.com,
        Quentin Perret <qperret@google.com>, tabba@google.com,
        Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
        wei.w.wang@intel.com
Subject: Re: [PATCH v10 2/9] KVM: Introduce per-page memory attributes
Message-ID: <Y+WRUriIoan/XChx@google.com>
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <20221202061347.1070246-3-chao.p.peng@linux.intel.com>
 <20230209072529.GB4175971@ls.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230209072529.GB4175971@ls.amr.corp.intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 08, 2023, Isaku Yamahata wrote:
> On Fri, Dec 02, 2022 at 02:13:40PM +0800,
> Chao Peng <chao.p.peng@linux.intel.com> wrote:
> 
> > +static int kvm_vm_ioctl_set_mem_attributes(struct kvm *kvm,
> > +					   struct kvm_memory_attributes *attrs)
> > +{
> > +	gfn_t start, end;
> > +	unsigned long i;
> > +	void *entry;
> > +	u64 supported_attrs = kvm_supported_mem_attributes(kvm);
> > +
> > +	/* flags is currently not used. */
> > +	if (attrs->flags)
> > +		return -EINVAL;
> > +	if (attrs->attributes & ~supported_attrs)
> > +		return -EINVAL;
> > +	if (attrs->size == 0 || attrs->address + attrs->size < attrs->address)
> > +		return -EINVAL;
> > +	if (!PAGE_ALIGNED(attrs->address) || !PAGE_ALIGNED(attrs->size))
> > +		return -EINVAL;
> > +
> > +	start = attrs->address >> PAGE_SHIFT;
> > +	end = (attrs->address + attrs->size - 1 + PAGE_SIZE) >> PAGE_SHIFT;
> > +
> > +	entry = attrs->attributes ? xa_mk_value(attrs->attributes) : NULL;
> > +
> > +	mutex_lock(&kvm->lock);
> > +	for (i = start; i < end; i++)
> > +		if (xa_err(xa_store(&kvm->mem_attr_array, i, entry,
> > +				    GFP_KERNEL_ACCOUNT)))
> > +			break;
> > +	mutex_unlock(&kvm->lock);
> > +
> > +	attrs->address = i << PAGE_SHIFT;
> > +	attrs->size = (end - i) << PAGE_SHIFT;
> > +
> > +	return 0;
> > +}
> > +#endif /* CONFIG_HAVE_KVM_MEMORY_ATTRIBUTES */
> > +
> 
> If memslot isn't private, it should return error if private attribute is set.

Why?  I'd rather keep the two things separate.  If we enforce this sort of thing
at KVM_SET_MEMORY_ATTRIBUTES, then we also have to enforce it at
KVM_SET_USER_MEMORY_REGION.

Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF8538BAB
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 15:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d51R1t+j"
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BC56112
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 08:12:39 -0700 (PDT)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1c9d140fcddso55408505ad.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 08:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697641959; x=1698246759; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=evf98vIg4TK2MPQBLVBmj385x0hMw4FlsTtUwU11DSI=;
        b=d51R1t+jYNyCrVgXhpOOE+dXe6Aovx8stHBG7TKoKEwls9axz0dTXnX4CDatWJDU+1
         hvtIf/d1v+DG36x6GiTkAdnYOBkOYqMfm/EadTzUqYKRsi8pnLrN0nfkC77DrztuY5U1
         hfG2E4dyIqMDIWCGEXjTNFNh+SDeDBP/WyfIhbHiXSSddfk6j2RRUpwCwA758UjJ6qMl
         ITjlHy3V+vtSFCZKF+dVtD/BEB291uf+sJ3+kZTBUnn7twKO2FvI3Q7Sq+EkNjFs+kv8
         q2YNnBUURURdeIED67nXUqWRObxPzaMLCo0z4jWPdKO4xYGwNR8BUj7wME172RUJQF9Q
         m9Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697641959; x=1698246759;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=evf98vIg4TK2MPQBLVBmj385x0hMw4FlsTtUwU11DSI=;
        b=TieuBbF1bko2HbpScHuUQ9+Z4CCktPLnSTo118JKEKf/pcWfz1HFolgBSIdNMEYzhW
         4QgupkvIfL+UxyOZIj3uxneLvgVbFi+WQWfu4SycsYMu00kCRcmL0hWRVKr3/BXcQhFV
         293r80+7Cs3WH7WBp9i9bwC3bcjoebl2zohqIohEACFdo4s+IFDAWkjumh8cCgkT6Y/B
         Oide9fTU2tmhQt6QpQNLliWwDEX5QYNV61TEv41+PJH5n5pmBIJlraHoXNQu+9NgfUvy
         /oTWGKoTJ7qeeyRZfa40Ua0iP4HJSeQrQpVOPeoGCNmmfYIMPAngK0ItS39aKvO1X30I
         puqQ==
X-Gm-Message-State: AOJu0YyEMbCYVe4Ln17W1k/JUTojU4YypfxKJlGgQIjUT2FczWKA2L9m
	zw3XXt2JGz5aAW3bPrZIKWB3NZIyQbU=
X-Google-Smtp-Source: AGHT+IGGj6YD1tNGtkylhZ2TMrFEwNGuXiRirTZJm64uFeGyC2oRhC4jwU5nYGby5n/F7k9IPGht2AGbZO4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:328a:b0:1b8:8c7:31e6 with SMTP id
 jh10-20020a170903328a00b001b808c731e6mr130834plb.1.1697641958822; Wed, 18 Oct
 2023 08:12:38 -0700 (PDT)
Date: Wed, 18 Oct 2023 08:12:37 -0700
In-Reply-To: <020adf4b-5fd9-4216-9dac-7dabe53617d5@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231013070037.512051-1-xiaoyao.li@intel.com> <ZS7ERnnRqs8Fl0ZF@google.com>
 <020adf4b-5fd9-4216-9dac-7dabe53617d5@intel.com>
Message-ID: <ZS_15SGIhtpzJ8Gr@google.com>
Subject: Re: [PATCH] KVM: x86: Use the correct size of struct
 kvm_vcpu_pv_apf_data and fix the documentation
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Wed, Oct 18, 2023, Xiaoyao Li wrote:
> On 10/18/2023 1:28 AM, Sean Christopherson wrote:
> > On Fri, Oct 13, 2023, Xiaoyao Li wrote:
> > > Fix the kvm_gfn_to_hva_cache_init() to use the correct size though KVM
> > > only touches fist 8 bytes.
> > 
> > This isn't a fix.  There's actually meaningful value in precisely initializing the
> > cache as it guards against KVM writing into the padding, e.g. this WARN would fire:
> > 
> > 	if (WARN_ON_ONCE(len + offset > ghc->len))
> > 		return -EINVAL;
> > 
> > So it's a bit odd, but I would prefer to keep the current behavior of mapping only
> > the first 8 bytes.
> > 
> > Here's what I'm thinking to clean up the enabled field (compile tested only,
> > haven't touched the docs other than the obvious removal):
> 
> It looks better.
> 
> Will you send out a formal patch yourself? or leave it to me?

Your call, I don't have a preference.  Just let me know which option you choose.

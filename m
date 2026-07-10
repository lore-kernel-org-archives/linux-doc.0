Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743583DE424
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 08:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783670533; cv=none; b=W4QdWi+xmyzQL1A+j77Q04SE5EqByHb2/oTsZkUEnp1B2Xbce/Nfd48M5mfDZ17wSLlv9sf7gAEsDG0S4T1gHG5v0YFsUxuAhg4o2T+s5iiuAjYze1hGULZ504/vbEVO3s1qpftORF9Z/7IfASaeddLRHciU78Pzd1LN4a+iV/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783670533; c=relaxed/simple;
	bh=s/wTkh6VxtbX/sDC0CijC4ncQbmEF5imof1tuQCO9bI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SWYJIExbDNT6D3Ro1U3PxYNL10s9+GjcZbZWMxX/EPyuhsnDR0hcEXmzG5/60YxxWrEUGsJOXMyKH3ZM8DXEEkDCNGbmXBGTjEbuLDwmTe754hRxrnViju8otqY2NW0zYLftCL6q2ZJ0V22bnyPllkQfkE3A+oFJxbT5sd+Lwt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H6y/9RHU; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PTWsO+UZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H6y/9RHU";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PTWsO+UZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783670530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s/wTkh6VxtbX/sDC0CijC4ncQbmEF5imof1tuQCO9bI=;
	b=H6y/9RHUayGNFj8XJpyIK1j/+37BGyvlLfsS9r57ZfzTFIyqP0UVSvh8vVBdzcFe4UGwID
	5WO/6VsiCxVijrngsWEaWR/A71I4/4OW4Dl5dINw0cHUyZWv3avgbEP12cZ+7Nrfkzv0PR
	WkRwlFlcB5hA4X/8zbLLbKrYpHMJu+E=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-394-p7KuIClzNJCGyZL79xIGqg-1; Fri, 10 Jul 2026 04:02:09 -0400
X-MC-Unique: p7KuIClzNJCGyZL79xIGqg-1
X-Mimecast-MFC-AGG-ID: p7KuIClzNJCGyZL79xIGqg_1783670528
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c15e555a164so72214766b.1
        for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 01:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783670528; x=1784275328; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=s/wTkh6VxtbX/sDC0CijC4ncQbmEF5imof1tuQCO9bI=;
        b=PTWsO+UZtBo/iKKtOh5LqDMRSB5xkCvtjgDbatwnzSTwYAPtyb9FSP2r/GXNaNHd3x
         Ubo7eyDqlp4DKZfdr130npFmmLHXZT3lz1vHi+BaB9ffPfMlO7YjfRtIrhq8cI9sWyHE
         IN74R6K5t2fEgOkB4xfheYVOCTFXSHrkeLQIlUnselYxd7SzmpFkhEidH1D8JAKOck4/
         pP55ZR+dzL4P82pQiG9fmBL2oyO2IiqV/FmjAetwJoLWxk90EP/aODpgQN1nWuHwXJdH
         t4Q4788ZUH1QNWutFPEMbZ+9Jt+p4IYJDlbpyALgmdRZ8VwIVoCxPXhWOWPfkgbZ3RaN
         VnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783670528; x=1784275328;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s/wTkh6VxtbX/sDC0CijC4ncQbmEF5imof1tuQCO9bI=;
        b=PewmD6EO60TtTf3tZINEawEgXUZhA4SL2IMJJkfx+Nlai0ZW9XjmLaaT/tvfmw4GYC
         OmPj7CKhleLqm+nDuaxSU7tJiMeRB6mLGYGqKxymmG9I7/moH55+an89zZIRkLxUwZey
         2OU1MCzlkh0w5Wncs14860taD6IrmRk5YX77He03gKesSEBeACDjNpBYoNXdXONzzocs
         in9Pq+t8sTiroZYGDe7BujGHdxshsjosX8wfd5pKEZvJsC3NSznbn+Q0wVTLaW+oiOiY
         RdJWQmzfSTR6qP5Wds5Co8j+54Xj3evFn2wEm6PjyPl7VnyLmMW+rX2VZMPImlF1YMuM
         g08Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrzljr2EzNF05anDF5Um9pDAOsSNfBD70n4AC0rWZwFa7R4pDGIGnY8dJMoOpYwfhSvCwj10qceatc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAHL7a0Lv8rUx7bQRXI6YDE9mtYl0bWdWti0Iu1kyHKYAtPkWA
	BFjUU2l5vpGx6YZ29t0wJDhkW7gTAVwGy7U8yKmAil/6M9wEviHNGy+bM0b7+oVdxS2P+vIW3XN
	yveNbFwZAxvue93yNY/cH+Wou4nQY1JYVMrwvz5N/CzhZjxj+tHQfnrNgS0rLMQ==
X-Gm-Gg: AfdE7cksiReG58cCMaHiOmcVgUyAFoxqMxEQUk3YryIybWkJJSbPzzB96d6YRGWKJRw
	aBO1iULfhCYCa/lF9z3JQ1phPoAvkYGhmVfxibYHOWi9eyjoxpOhoetJA8KO2P7GaV5x5qt37U3
	X7YzeiJbChb4xArFYE8kfjTiSDIEySNYdQOep6B611RD8eM2AHEnUhuN5Ik5X34ZQnnQroaRxZ2
	dfx6ymN4kssppYErx9TVCSRblV8JejdLw4rpgM+S5fLmibOIFQHaHEOqMy69EzptkDEIyLF9kUV
	eMT2nDIBCvfOiu3Myl0/mSvMSfxx69E7vc/OUgW+Qj5mXcstuphqZ5YZMim1+Yldw9fSt3s7fMi
	CRf9FIYEyHZquaXxyxC7xwg6CNVZbX2rhnx1E2Ww0IMBKcokKns/7PcETNNln
X-Received: by 2002:a17:907:d50c:b0:c15:d08a:2cb1 with SMTP id a640c23a62f3a-c15fe271f91mr103709666b.0.1783670527676;
        Fri, 10 Jul 2026 01:02:07 -0700 (PDT)
X-Received: by 2002:a17:907:d50c:b0:c15:d08a:2cb1 with SMTP id a640c23a62f3a-c15fe271f91mr103708166b.0.1783670527209;
        Fri, 10 Jul 2026 01:02:07 -0700 (PDT)
Received: from ?IPv6:2a01:41e1:62d2:1700:b0c7:4985:769b:d2d? ([2a01:41e1:62d2:1700:b0c7:4985:769b:d2d])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4ad4sm10624182a12.12.2026.07.10.01.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 01:02:06 -0700 (PDT)
Message-ID: <fcc4455b1272433bd04ea1f774b5ecd180823795.camel@redhat.com>
Subject: Re: [PATCH 0/4] KVM: x86: Document and enforce APIC base memory hole
From: Tim Wiederhake <twiederh@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>,  "H. Peter Anvin"	 <hpa@zytor.com>, Ingo
 Molnar <mingo@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,  Paolo Bonzini <pbonzini@redhat.com>, Shuah
 Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@kernel.org>, 
	x86@kernel.org
Date: Fri, 10 Jul 2026 10:02:06 +0200
In-Reply-To: <ak_cqiwZwNBEhRNj@google.com>
References: <20260706092021.3625908-2-twiederh@redhat.com>
	 <akwrncCjosItvAeO@google.com>
	 <bceedaf195adf713db70a1dba743055fe4f20bc0.camel@redhat.com>
	 <ak5TojZfR04SWWd-@google.com>
	 <8b35057f72cd281637cf9d4bcbe1d0d753a3710e.camel@redhat.com>
	 <ak_cqiwZwNBEhRNj@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-07-09 at 10:38 -0700, Sean Christopherson wrote:
> On Wed, Jul 08, 2026, Tim Wiederhake wrote:
> > On Wed, 2026-07-08 at 06:41 -0700, Sean Christopherson wrote:
> > > On Wed, Jul 08, 2026, Tim Wiederhake wrote:
> > > > On Mon, 2026-07-06 at 15:26 -0700, Sean Christopherson wrote:
> > > > > On Mon, Jul 06, 2026, Tim Wiederhake wrote:
> > > > > > When an in-kernel irqchip is enabled on x86, KVM installs a
> > > > > > private
> > > > > > memory slot at the default APIC base address (0xfee00000)
> > > > > > during vcpu
> > > > > > creation.=C2=A0 If user space has already mapped a memory regio=
n
> > > > > > covering
> > > > > > that address, vcpu creation fails with -EEXIST.=C2=A0 The same
> > > > > > happens in
> > > > > > reverse: mapping memory over the APIC base after vcpu
> > > > > > creation also
> > > > > > fails with -EEXIST.
> > > > > >=20
> > > > > > None of this is documented, and the error is reported far
> > > > > > from where
> > > > > > the actual conflict is introduced.=C2=A0 A VMM developer hittin=
g
> > > > > > this has
> > > > > > to trace through KVM internals to understand what went
> > > > > > wrong.
> > > > > I'm 100% in favor of documenting the behavior, but I'm not
> > > > > exactly
> > > > > excited about the enforcement.
>=20
> ...
>=20
> > > > FWIW, I did run into this exact issue myself and debugging it
> > > > was
> > >=20
> > > What were you doing (or trying to do?) when you ran afoul of
> > > this?=C2=A0 I ask
> > > because maybe there's a way to help developers without impacting
> > > KVM's
> > > uABI.
> >=20
> > Experimenting, mostly with pmode code.=20
>=20
> "pmode" being Protected Mode?=C2=A0 Or something else?
>=20
Yes, Protected Mode.

> > For simplicity, I use a single memory slot at 0x0. Due to an off-
> > by-one
> > error, I gave the VM only 2 GB instead of 4 GB as intended. When I
> > fixed
> > that, suddenly vcpu creation failed.
>=20
> Heh, fun.=C2=A0 I don't think there's a good answer here.=C2=A0 Or rather=
, I
> don't think
> there's an answer that you'll find satisfying.=C2=A0 "Unintentionally"
> creating a
> memslot that overlaps the PCI hole and the RESET vector is always
> going to end
> in tears unless VMM and the guest are doing very special things.=C2=A0
> I.e. not
> covering up the local APIC base is so foundational that trying to
> guard against
> it in KVM isn't worthwhile, because such a goof is just the tip of
> the iceberg.

I noticed :). And I learned a lot from the experience, which made it
worthwhile. But I'd love to make the experience less painful for the
next person, hence v2 that puts up some warning signs in the docs:
=20
https://lore.kernel.org/kvm/20260708133856.302151-1-twiederh@redhat.com/


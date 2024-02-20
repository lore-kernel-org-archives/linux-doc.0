Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFACF76C6E
	for <linux-doc@vger.kernel.org>; Tue, 20 Feb 2024 16:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708445720; cv=none; b=SQHrlkYDEqtBZEnznLUeltoScJIgGJOCqWgouAP7YlpWmJmBhjErnIcLJjNwHomW2Cz+IzJEiU/tmFeBja9wmcbv2aOJvldfPDqLl3olztijchjjzeQiOvPOJFzCS995ArtZ6lc3L9E42YWmVu9QTbIle8omV0ByMVto09ZFOaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708445720; c=relaxed/simple;
	bh=Ey6ErHBVbqQQFaARRSSxWyFZtNcBtj/qBDxHXsIykls=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=An7x7QNMyGNH2Gqlwi6dDbyCwCvjNSTut6jp3BVyisgll5sQfp76IViJ8so1qb8Am315DyDYaWsHqTCdnYrZiFHld/qrL0IDKd34IiLoLJKBpmKIXoxcV0/7Vo2owXYTit3pQTiPzYjaL/npmkJS9uSeuOObq+FZxCAmpBneMGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dTxSX285; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dTxSX285"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dc6b26783b4so4730050276.0
        for <linux-doc@vger.kernel.org>; Tue, 20 Feb 2024 08:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708445708; x=1709050508; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gGVaEpoRy83RsqKWj1BDNY8ZLAKIFU3H8chjcBdzZQ4=;
        b=dTxSX285wINLcioxkombr9MEQCvXPobFahkDQ2lvGX6ul7kYwAp1vItnlUC1ZVavMz
         BnG+UjuDNyIFZcTkCBpgeCa0S8Hipa7Q4//YuGIybW2fTdvlG4r6KM6uhcdqha+tTif6
         wNJhmMjpQ8Spt7jw1F+GRSAvETTnQHP7aFJmsxOZ07nCTm8Yh8ZgmqUiownXRHzPtiCL
         5p4X5vH0Y6va2UZEmkuXGAmiou5GMjN18X5MWNW1wjJLMKzvqqzfJqBPdV3kESleQ0vK
         C+Xj2iOzvjcmrqTMDb/TVaTMdk5nLYvQLMcnLl4AoesGBfvCy8J21iqCCXEO7SpipZ+8
         1KiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708445708; x=1709050508;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gGVaEpoRy83RsqKWj1BDNY8ZLAKIFU3H8chjcBdzZQ4=;
        b=eTzkLfnCJGUUAIX28fpG/DvtI/ZGh4p+D6InTM/ySeyJBteJnPaYx32FWB1QFrGFzs
         +AAschl6tESjuFJaVg4232Cvilz/slcSB2fPlKTphBWon0/D+slqZ5Ja89KYHgFeBT2A
         FuK5iovXmfdSRokdFCMo1g7aL5KJRJI7/i6FaoDYSnl4J+rmI82/JWHwGNdWOig6kHRN
         hsJR+j60RcE2Iu0tvnJ0LQS8w+k1W40Au0bBoHLlTRsHwizkou383rw7n5dxTmrt7OtJ
         GJp4fGIOG5ybIX4ZfKZXDaj1t+Ihwt29KmsFNWcAfxNCIjxLLWoFDJ0NMIg/Xo8lToqG
         4o7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUYRqSEcu3HJVQwJ3RqeSALzfUjNyBrxQK5gQYRkGZgPfTUy7W9TL3x6O5UJ1VuIfhjmLAH1IW9SHTvlBAUvQWPrRHh53UXPZ/r
X-Gm-Message-State: AOJu0YxQiwuNdcZM+qPCZkjJnxiUBPP5yH6XkCG9rrjdBgtJwg+c85yN
	POfbQWAGP1CALcD253NU36b9BjhwAqlMxtRnNNp4nvJe4RLIclZ7C/zmL7I0BRn1SnPZ+wr2zdI
	mgw==
X-Google-Smtp-Source: AGHT+IHOl1ZsAPNJTwpqdmUVaVuTbX0oezG+zWKz4lEs+PmYyLIBMZWVYtpKpRe+ZKQU8wz9tv5wxLQvY2M=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1547:b0:dc7:3189:4e75 with SMTP id
 r7-20020a056902154700b00dc731894e75mr587165ybu.3.1708445707962; Tue, 20 Feb
 2024 08:15:07 -0800 (PST)
Date: Tue, 20 Feb 2024 08:15:06 -0800
In-Reply-To: <05973da0-f68c-4c84-8806-bdba92f2ed6e@xen.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240215152916.1158-1-paul@xen.org> <170838297541.2281798.7838961694439257911.b4-ty@google.com>
 <05973da0-f68c-4c84-8806-bdba92f2ed6e@xen.org>
Message-ID: <ZdTQCuWor4ipxW6E@google.com>
Subject: Re: [PATCH v13 00/21] KVM: xen: update shared_info and vcpu_info handling
From: Sean Christopherson <seanjc@google.com>
To: paul@xen.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@redhat.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, David Woodhouse <dwmw2@infradead.org>, Shuah Khan <shuah@kernel.org>, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Feb 20, 2024, Paul Durrant wrote:
> On 20/02/2024 15:55, Sean Christopherson wrote:
> > On Thu, 15 Feb 2024 15:28:55 +0000, Paul Durrant wrote:
> > > From: Paul Durrant <pdurrant@amazon.com>
> > > 
> > > This series contains a new patch from Sean added since v12 [1]:
> > > 
> > > * KVM: s390: Refactor kvm_is_error_gpa() into kvm_is_gpa_in_memslot()
> > > 
> > > This frees up the function name kvm_is_error_gpa() such that it can then be
> > > re-defined in:
> > > 
> > > [...]
> > 
> > *sigh*
> > 
> > I forgot to hit "send" on this yesterday.  But lucky for me, that worked out in
> > my favor as I needed to rebase on top of kvm/kvm-uapi to avoid pointless conflicts
> > in the uapi headeres.
> > 
> > So....
> > 
> > Applied to kvm-x86 xen, minus 18 and 19 (trylock stuff) and 21 (locking cleanup
> > that we're doing elsewhere).
> > 
> 
> Looks like you meant 17 & 18?

Doh, yes.

> > Paul and David, please take (another) look at the end result to make sure you don't
> > object to any of my tweaks and that I didn't botch anything.
> > 
> 
> What was the issue with 17? It was reasonable clean-up and I'd like to keep
> it even without 18 being applied (and I totally understand your reasons for
> that).

I omitted it purely to avoid creating an unnecessary dependency for the trylock
patch.  That way the trylock patch (or whatever it morphs into) can be applied on
any branch (along with the cleanup), i.e. doesn't need to be taken through kvm-x86/xen.

Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9967543B6FD
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 23:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784674979; cv=none; b=Ca9ppHoNi2yOi0lN5yTyzojpmIuEqNYDQWRDaT/rEBoKoz+4jtw2Ft9mJHgwkVr0BZI3J3VMfTjoQPvlunvd3bx2hHsYUGsxBUgFs8yKagLgi/q80fInhXRPRZeVvM+PUHXSfToh/Er5pYqzAmBaPiloIk7UdTWwJXENbnfhoU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784674979; c=relaxed/simple;
	bh=RcvIeY5uIWgnuFkqgc6CgFGm4Q9bbYpIoUkmhII+nNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=siBvlugBd4JpEeGaazt5FyYX0EnH0DkjtRY3FRCmkXcwgFsuq65Ii0r0/JwyH9Cj7gskp9Gp6cKkHJTURAxJwPmYMZdLdMjhBkkyEG7lLsbTRX2yQQPCdG0SXu1lTni72lSy8uzOvIq/Xm6oVReRVhRPEyZm7Fe1+0NbGt66cxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iG8yIN+j; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iG8yIN+j"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ccdf36f63dso604565ad.0
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 16:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784674977; x=1785279777; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kK8bQTGCWBVYNgO28KRycMBgomSj7cEEqhXHP2aOvCg=;
        b=iG8yIN+jsG+yh9SKcvizikh7K8VKc/SRmkvzqHHe4mSfHNwlC/DiY/znrvcnPUA8sg
         hj8zs9mufmgWJYxwvSjC/dyzHL9OWI6vXeN0COD445/JhIeqiIalpBWqOEGy/06qviT1
         sorGTqnt3wCCfsLWOl9PBvxHeMXxuNTE/AeebdtJn/WMYBcMmw2Tc8ViU0lgSqnJqVVf
         7d6QZdd5R0GAyatjDflgl4lfDhqXeqbN8+raPS7Hp99RwD9IdSeE3odeInVCyN2uMUWH
         5RhVDQwJzt8ts2+gcClFoo5KFsQhVa0VjhyGOkti83IhNCQ3XkoU8cseg2x0QfWDFXWG
         c0uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784674977; x=1785279777;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kK8bQTGCWBVYNgO28KRycMBgomSj7cEEqhXHP2aOvCg=;
        b=AsWH1ZjpqqknhApdi8rpdmoTbE1XHW/kYeu+hdTfkWd4ZggGH6D6N8QdEUP0NrVE7F
         EHinOW5ZLXjs4mkIdlVrIzrifKcwQE4G9/wtiFZ03fNs7USCkUu1487VYYcDgBemnypL
         7ByleLHfvX66je21GzhDVAA2eHlDL97pHTLlpRfoHUohkBtteaLATT7XX+4n4w623hsc
         fxt4quAHhZkZIEVHWz4fpVz3uetNpzBn6kapdu0QPONtpEbhJT22oAOEaGAkun4iUDKb
         tDNhsxjesOrSeXX67TsTyxMZnGfyufJv6fJHbhSthbbkKSbBMcIk2SxXueosBxjOhvd5
         fjsw==
X-Forwarded-Encrypted: i=1; AHgh+RoF2kBNK9ED+BQHw7vIgCiSIxs5TPv+2cFXZeDf5QqOXpF3nLQNuOr0NJdgLroHenr1tZEbp7uJICY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsTHLu93rU5K8Kf1OihFc9g80O2oFkKXXjQanPc5I/efXGXGd+
	c7s907K5tSQ66DUd6Z07QjynT/lJa9ZdMW22Y2i+eJu90XlKGR+VrdDKMfNcjuYXOw==
X-Gm-Gg: AR+sD10QjsJsWDkZru3ILGGviU4CYloxyKQ2drrruUzR2U2YAu5pjyChILUFMnGxcMJ
	GG2FdSNZ88i/UwcxOW3uVAP37fxbioAj79bVrISKDEt2h8EbNDx76wbCzVMbHlHkzBKlGTPgDmC
	EON21shmhz6QGxERosKViyDgCQOhQ3jg5Hjuah5KeIc4zhVws17xuISeNp+KiDbRLaTwsm2tlyJ
	RdRH6KtKkySoGBJSwszS9ns5qRBllrRnFAdaZ1xZ8A3/hNTZdH8AJS2Aqx2gGf+cGxUxjJ/inIc
	ESs/J82xnVYZrozKpL5vrq3gxU3u7XXvtwY9a2itQXA6jsoMn1d2NUqB08WOtC1YcuMLRkV9heB
	5vonCXqFhE2oDM67jZHWL9IKYGNHhcglFuhQLevGYd9+9fPyDtqa4/y35zbje9C19CMitAFeQnH
	Dgt12G8scyFdRA6UjeZDubBiRr1/E+15slZe9CLSVcYXUSfK1WL/rVxPFbiJOtcLfQtSLR8vKu
X-Received: by 2002:a17:903:2409:b0:2c7:9e6a:1a8d with SMTP id d9443c01a7336-2cf8f3c3e69mr1002465ad.12.1784674976345;
        Tue, 21 Jul 2026 16:02:56 -0700 (PDT)
Received: from google.com (168.136.83.34.bc.googleusercontent.com. [34.83.136.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f18bb8dsm207669a12.19.2026.07.21.16.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 16:02:55 -0700 (PDT)
Date: Tue, 21 Jul 2026 23:02:52 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, kexec@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, Adithya Jayachandran <ajayachandra@nvidia.com>, 
	Alexander Graf <graf@amazon.com>, Alex Williamson <alex@shazbot.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Hilke <jrhilke@google.com>, Leon Romanovsky <leonro@nvidia.com>, 
	Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pranjal Shrivastava <praan@google.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v7 03/12] PCI: liveupdate: Track incoming preserved PCI
 devices
Message-ID: <al_3nOssZoa6RoCq@google.com>
References: <20260710212616.1351130-1-dmatlack@google.com>
 <20260710212616.1351130-4-dmatlack@google.com>
 <178432481253.189683.3297727348836286619.b4-review@b4>
 <CALzav=e1Gcu-9TD7F--41cYqKBrStKOE4VqQ4K3PKdNuYnNmcQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALzav=e1Gcu-9TD7F--41cYqKBrStKOE4VqQ4K3PKdNuYnNmcQ@mail.gmail.com>

On Mon, Jul 20, 2026 at 02:54:51PM -0700, David Matlack wrote:
>On Fri, Jul 17, 2026 at 2:47 PM Pasha Tatashin
><pasha.tatashin@soleen.com> wrote:
>>
>> On Fri, 10 Jul 2026 21:26:06 +0000, David Matlack <dmatlack@google.com> wrote:
>> > diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
>> > index 03075ce06ac9..df6a02240aa4 100644
>> > --- a/drivers/pci/liveupdate.c
>> > +++ b/drivers/pci/liveupdate.c
>> > @@ -298,6 +377,87 @@ void pci_liveupdate_unpreserve(struct pci_dev *dev)
>> > [ ... skip 76 lines ... ]
>> > +     /*
>> > +      * Hold the ref on the incoming FLB until pci_liveupdate_finish() so
>> > +      * that dev->liveupdate.incoming cannot get freed while the PCI core
>> > +      * has a pointer to it. It's better to leak the incoming FLB than do a
>> > +      * use-after-free if driver does not call pci_liveupdate_finish().
>> > +      */
>>
>> I am confused by this. Each preserved PCI device must have an associated
>> FD preserved with it via LUO. I.e., vfiofd would need to be preserved. If
>> the vfiofd was not reclaimed, and finish is not possible, that vfiofd
>> would still be owned by LUO, and therefore PCI FLB refcount would stay
>> positive.
>>
>> However, if finish is possible, and this is the last vfiofd that is
>> finished, FLB will be freed as soon as the reference count reaches zero,
>> which I would think is the expected behavior.
>>
>> What is the point of holding a reference here, instead of only for the
>> duration of FLB access, i.e. to make sure we are accessing a valid data?
>
>The duration of the access is from here until pci_liveupdate_finish()
>because that it when the pointer (dev->liveupdate.incoming) is
>cleared. So that is why the PCI core holds the reference from here
>until pci_liveupdate_finish().

I think LUO gives you guarantee that this pointer remains valid until
the FLB finish(), because all the vfiofd that were preserved have not
finished. And when all vfiofd have finished, LUO lets you know that the
pointer is becoming invalid so you can unset these in the finish()
callback from LUO?

If I understand this correctly, I think by keeping long references until
finish you are replicating the vfiofd bound lifecycle that LUO already
gives you.
>
>We could avoid this by deleteing dev->liveupdate.incoming and,
>instead, fetching the incoming FLB and doing the xarray lookup every
>atime the PCI core needs to access the device's incoming ser struct,
>but that would be inefficient.

Sami

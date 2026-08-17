Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16E8442B12
	for <linux-doc@vger.kernel.org>; Mon, 17 Aug 2026 15:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786979754; cv=none; b=XXVpQh+1KEypONA1ObQmXhGo5+VqYHOHfptjYZZ7AjBbWlcisxFwLdYkDFaZHdr/d+2WOAEUUM/bHDOPVsyBTiFktLBoTsjPhNqu5+CgkYlsrK/vSLGyBdNxIplFWvbVp99vhjq+x2LhbndbYjTB+hlWuh+bhhlnFcQ79NaKa/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786979754; c=relaxed/simple;
	bh=/9zL4j7bvEzNHZe+2GnRD64ks0ouO6ge/iHUhPBHSpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O17LmfllVPPv4LQfrd4kwONXYZ35jfw2xlxUJzUvbH/7MQMwa1DcTl8fcSaIkfdqHMNu9OU9xZZbxnLpVbQA9Cbb8htQWZ3q2RdyMMq03jKBXIFADAZJ6pVsprnFI46GGOM33ih2O3haWPE3RroE7Gx1kNekVzNDebzWdQKkw/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=nURkaZkS; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="nURkaZkS"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-92e99ef0902so171212585a.2
        for <linux-doc@vger.kernel.org>; Mon, 17 Aug 2026 08:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1786979752; x=1787584552; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LkIXCvEaOBZrdi7ChK3r5JFweXwKUKZFGDYp1HFtFrY=;
        b=nURkaZkSS1bFk0F9xKIrydT+A4Tbczk/jA4xGpqFU4pBJoP+aZ/Skuc1oMLRGSGl9r
         WO0OCIEPs5emafGVagWsIGAbiNCLo2cD1/eMeFIfqB8+t4q/zD/TDCoqsli6ywNXD7jk
         Y52TD7Gj5oOWKx70Rb/gd3KPYsGMVa5CvRyBZCrCOes71OqXN30YMfzRB/abf0M6fp0o
         RHAAh9MmrqRaY6+gNTqPp2RwexWzHoe5pzaLKR10S7s4rMlr+OwlMWDIEQTYtyNMIH5p
         WdjfJ4csOa+UWGleBQRIlc/r+l79t4gZDgnlScbxETCUATW9YHfV9bP5SHTRagD8YyFG
         m3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786979752; x=1787584552;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LkIXCvEaOBZrdi7ChK3r5JFweXwKUKZFGDYp1HFtFrY=;
        b=d7WPh+A8/JAxzo2vOMowjAMEoVnG0E86N5Tm8I/cb5pNpNTnRurL82pmW9fmxmB8Nk
         fzkjnYU5YE7Ex58ixnfyAyEY86jIQwggB+Y5afi5npGpkwu2tXkpcI2/Qyt94M/hsMhL
         NRESit90HiJp64bc58x6gNCmaKT83bMZlA2OD/IP1jDGlE6WDH5D7G/zxOoT2HNL2icc
         p6NXMXx1Ma1e0Zs2hc4hlUzAT0wFN/OkDwk6VFaH9CUphVi/njNQkRT750lO0x/LFkOt
         quPssdn8NW4K0vR4haqI3Qv/to2NbG4N2lc8/c5kC2nifAdut4Xit/J0IQDemQwRCUDj
         JVzA==
X-Forwarded-Encrypted: i=1; AHgh+RqJKUomdqpqz50O5IWrHB/4JZESCYqePxz2gAQgpuXviJoiOcov39JZwIwxFgoVMj0xenw2/C+S+zQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLYLYQQ6SqP9VxKDVHc2yG69nEdifVqrlYyAYC02f9zr2OVtq2
	zwXoZTgbT64/R1N5l96eyLnfFwOl/WCniFGBc+0a77w0P3SYz2OpVIJ8YcFntIO/IqU=
X-Gm-Gg: AR+sD11o3TjVN9j4RcIl20+6hNTEI2IsKvTDUy0IICRn8n9NUrKhQkiM81MWaqS8TML
	y5l3LWO1PtTxJj5IJ7ttzGqyk0ev7QySP7M9m7kXwQKnwMXK6uef987gOQUNM+wIfpF3NkLNAbb
	jSFxjQ26iz6x/Wg4XLUegywvdqswDM56h48XhIhGAGJTiziufCkJAETASTyrV1MyrBIUBQYwN3m
	fXtB8+eqtzQw2fCpIIDetLXFft7RcxGzMY5AbcBBG9yGjk2/fDIklD2UQ0SPO6jtQcEh5vuHsZQ
	DGmF7xNyv0hjWrpceDLbbcHX9985vDw5LHBFerpzXDHLdQFCmayd8uPuWlZAUmLvQau/v6qNlET
	COCTknzH1MQyApm0IPFaqGdkLL8UJ8087k2ZlcmGenulPBZczuH8JxtSMU1Af0x7Puq5ZvUwZeY
	FiJ4H0JACuJ6n8FTxvzV/4ieb+MmjZgLL6GJa5Z8ve9OlgCBeSF3lvNP2QKFbsCu5M+FqQ0vzjX
	L6unIJEjf6UUX8B7+2ljc6uOnzx3xVY4tHvBAL5UcyE
X-Received: by 2002:a05:620a:f06:b0:92e:7d53:8e8d with SMTP id af79cd13be357-93704b7d4dfmr142017785a.27.1786979751821;
        Mon, 17 Aug 2026 08:15:51 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-937033d2ccdsm67050085a.30.2026.08.17.08.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 08:15:51 -0700 (PDT)
Date: Mon, 17 Aug 2026 11:15:49 -0400
From: Gregory Price <gourry@gourry.net>
To: Rob Herring <robh@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Alexander Graf <graf@amazon.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Baoquan He <baoquan.he@linux.dev>, 
	x86@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kexec@lists.infradead.org, linux-mm@kvack.org, linux-efi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH 0/4] kho: rename "scratch" to "bootmem"
Message-ID: <aoMlXHFTvcpwOv8W@gourry-fedora-PF4VCD3F>
References: <20260811162642.3504565-1-pratyush@kernel.org>
 <aoMdJ7hpr1GonLz8@gourry-fedora-PF4VCD3F>
 <20260817145231.GA579285-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817145231.GA579285-robh@kernel.org>

On Mon, Aug 17, 2026 at 09:52:31AM -0500, Rob Herring wrote:
> On Mon, Aug 17, 2026 at 10:42:00AM -0400, Gregory Price wrote:
> > 
> > Is there a non-verbiage reason to justify these changes?  Living with
> > "scratch" seems better than potentially breaking folks.
> 
> I don't think these are the first breaking changes. And if the changes 
> are fine, then that means more breaking changes are fine, too. So why is 
> this upstream at all until the design is settled?
> 

Surely we should not break deployments for the sake of renaming
something that is very arguably already aptly named?

~Gregory

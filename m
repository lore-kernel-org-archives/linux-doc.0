Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A499B47607B
	for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 13:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787058003; cv=none; b=Kx+eJWAymW7YwXL351AcBK0ZZJ3VIaKoRu52ffmu27wUtsYc6UidlexwVbn1KzFz9hCuOkTh1Ypjh89zyAzUkky2KsDe7zKJCDwTo6UrbseDlUAr7QdkYjdcS17YlBPjSiPMYHZu9mVZhKaYRI+6WSfPOdJ9Pme6g0kS30pD7/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787058003; c=relaxed/simple;
	bh=LvNfSK8pg0K/+mDojw7aH+VyzTbWSAq378RBV3TsZO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uQxCnqjbc7ZZw+BHVcVTe5Py3gg8QLq3PrdOZuziFt2It5dQia60pCTJT+vE5wioXzP5lBkVB5U9axTlbbEL3y09x9KSQl7aMkDEiLC/0og5sczEg1AVBboUOWKLTKYtlccmSVCS8uibGwqUu9+iWCWOC6SbNvyd996p5/qfqWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=t2WLE4sO; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="t2WLE4sO"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-936c02e58dfso293800285a.3
        for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 06:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1787058000; x=1787662800; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wmgOUbj8BHDXCzIhBSspWfV30kk7RcENm70SlJA8E7U=;
        b=t2WLE4sOpoenct34gRpdtiZclR9xG30lSngO+niAHYZTDmgzsUo/WsJqcVMjLWypym
         cvbS0GxKG9XRzUTZPhVCK986KZs2poZE+oJOHrzReebYFZRwU42l7TKvDMg+64dsgEx/
         16b3JAiOIOWbmtVhDjUOpEJV80Ujr0oTA0a//OcGM04nuUuX9ckXxZD+QuJJbQGa0h9v
         d2ikHHRxatqfAtckPmvB9Jkxy5T2sjviMlLOiT/H0BcdamcHERMJonH+MiXrukYvpCbS
         N3h8ou++8cAHdaNSpmXK7r4p0lC71ImcBHoPZUvLbyYfJzNWs/OPxrArhTC6IWwAS7uw
         0+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787058000; x=1787662800;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wmgOUbj8BHDXCzIhBSspWfV30kk7RcENm70SlJA8E7U=;
        b=VEH5ERqhRXBKQsfZnSoXCJIqa9HdJ9dxyPq44tiIaLjM9fZjREMxzAjbC07yzLkRcm
         9ke7kCJKUi0R1dTehSBhN3AH4bNz52m+RFJXWnQAfJwjkumwEGjNzG/fdR6iPSUtNjnk
         Y/Rzg8qL120eEKWgJ+A/luw/jnn4eSgLTt2MSWQELxNxFQWhvlBQOlDhkIjqgY+p3UrE
         drBWFlaLyWeqPiIo2t1IwI6hB7J6QA94dh9Qwm3URPaM/0+kP2msRgq4whuW5ooGlONx
         jBvctIINoCzM57mvxoRH0YLd88zoYIsU7Dqti9NhblCfEzQrxWZNHHBKY0B30eeAFVk9
         y3og==
X-Forwarded-Encrypted: i=1; AHgh+RoH+xpgIkdMZ/M5uwTMeZ22iGtDMUfrzKNfhhj0aGIliqU+r2LhhpXzRnY0nKMXL2AnUVAYHl2g0CA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxst5K/DdzkNIsv1WvF9bBDEOjNF8rH3rkkeryw3uvToNjELYi3
	U8f1omL/11EKEoPq49ctxaJ2q5I0CVIJ8QB7UAcRQl2zhkgoIU1KosBwojhK+Z3RC5Q=
X-Gm-Gg: AR+sD11Ng9iqSJimczTiPRzwUD95+M2TcE516PYgqbJPjN7nhmbZuU8eB7X4OFDXEgW
	IfKhTuQy+o8IXVsddu817GLdkEKq9Pgetka+atvjEd3WpB2Js62Vbvjii4YndOeHIRi05YXN2Q5
	Ky9uc3kRkNCM/Rn+g4IG8wWq4JmeofZjG3sSlSBykcrbdlhOj/wOGK6mYUOvgzjtlTCAKwn+3X/
	XD0rFbbNQsLeOOT1b0aowIj8635HU6c7LB0AkAansgSgaIajMsOrqMVxQmkh99nbnAVvtqxhpWV
	17veWYH7Zd/jKAU1x3aET8XM/Ir+kmj0idxs0mggDWMZqW5hTeDa84EwlYLXCOCikmug6FejT1s
	LF7KLJqqsYzUr3XHmNBIVq5VPkPL2AkLw7SAUEyg20pf9NzkRLtgjVwNTqvKbUO05661U1Xc35K
	df+7Q4RlHwiePaipj52C8mh6Ll5Zuuc67I+e7fhJk1XkpNojryp9gLPloJ0ggtZ7DK3DXOYau36
	nViJldI05Bi4DHQyGfDO8kA/9/mdOnbD8L8VIOXabSvxhMiDt5k9VQ=
X-Received: by 2002:a05:620a:22e9:b0:92e:6637:d98 with SMTP id af79cd13be357-936d2286961mr2640903285a.18.1787058000487;
        Tue, 18 Aug 2026 06:00:00 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93703432242sm286024285a.46.2026.08.18.05.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 06:00:00 -0700 (PDT)
Date: Tue, 18 Aug 2026 08:59:58 -0400
From: Gregory Price <gourry@gourry.net>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
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
Message-ID: <aoRV7vF3v8DqGoyv@gourry-fedora-PF4VCD3F>
References: <20260811162642.3504565-1-pratyush@kernel.org>
 <aoMdJ7hpr1GonLz8@gourry-fedora-PF4VCD3F>
 <20260817145231.GA579285-robh@kernel.org>
 <2vxz4igr1yq8.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2vxz4igr1yq8.fsf@kernel.org>

On Tue, Aug 18, 2026 at 12:58:55PM +0200, Pratyush Yadav wrote:
> On Mon, Aug 17 2026, Rob Herring wrote:
> 
> For patch 3, I am honestly surprised at how large it ended up being. But
> I am in principle opposed to the idea that we should not do any
> housekeeping because it might cause "churn". So I think if the end
> result is better then churn shouldn't stop us.
>

Not really concerned about churn itself, just that I didn't fully see
the value in moving from Scratch to NoPreserve - these things sort of
read the same to me.  The additional context you've provided is
reasonable, thank you for helping me understand better.

> 
> I renamed the commandline option because similar things have been done
> in the past for other options too.
> 
> See commit c5bfece2d612 ("nohz: Switch from "extended nohz" to "full
> nohz" based naming") for example. It renamed "nohz_extended" to
> "nohz_full" because it is "a bit opaque and vague".
>

Also not opposed to the rename, just worth the question since it will
break existing users. I know boot args don't have ABI guarantees, but
some are used more than others :].

>
> That said, I am not opposed to keeping backwards compatibility if
> someone _does_ complain.
> 

I think you've made the case well enough here, I appreciate the help in
understanding.

~Gregory

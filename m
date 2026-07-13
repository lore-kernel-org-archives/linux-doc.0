Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95DA355F5C
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 20:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783976280; cv=none; b=SPhdxHD6AbuCvtNEFskf3dX4MJ9cvyBfTus39miadPFNcyeNGtPsH/aRvBk8yXI1tNDVwyHUgUMYF/v82GHBk6jS5HdxIVw7/Eoey03jrqGSaru7rGU9Qm2FMJp3YZvXjDeUTXILsQYN98jMtTGLjgvmVKVrBFS8iMy8VHtukbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783976280; c=relaxed/simple;
	bh=D3eahPIAIk1fvhyOZkYEJP6bQ6n0at+bhFjOvvkmzpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q9iQgXRnRSiUJgE30I9hcb6uYk3gNDUjpvy+MXuBHlki8C0VacYjUWJLQmWgcbFHeeao6rSgbqeDODr/GkhjAH/e+5L0uJrB6ZeHIu16zh7dpFZqPiLbGRFUYs5X5Yo+o2hUFZfJVBcht0atPdZdnNwhZ1G7+ZUZXQFW4BJ5sm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NgBrxDlp; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NgBrxDlp"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so249547a91.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 13:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783976279; x=1784581079; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oNqruOZIzwruIpGvkzB4DJORZxeTGWU0clCn+vXfCzI=;
        b=NgBrxDlpDoknd6Zv5Ca/Oeewg5yuANlXmHDRnnhqXDWhgDP2P44OrR0s0/MTMy34mZ
         n3zXMmcIfGoNR7Sd680LfEr1/geQl8EGetahP7W6fUt1MxIqIdI/L1VUVBggJAmQ51v0
         jXoSwvwvp/CrIoMSWg71PL3DRpm2hdJGate6aUcUOOKGl8xTstjSeqi6gEKS96UO7Zjd
         lb2a22B/uNSSHg5FZmQ48yi/TVkiA9sVtHA1/za6mSwdA5n6CL1pr/nmcJGtyJ1Z/Prh
         VUKEcE5b/3E9zbq5R57HBRuSsc33Y7ePwJV08k/0UBOriBpPl9MhiDN0KZiEmLww+N0n
         mgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783976279; x=1784581079;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oNqruOZIzwruIpGvkzB4DJORZxeTGWU0clCn+vXfCzI=;
        b=sWa75GYRuG6//GNBvSxFsDYjsVQSJl4HJg0KySSHYtGnz980RAeEGC3kr65jLhqi0k
         wYUSlW+JFLAky00mF5/cVriQ9SS0lEHkmygfHTNiecQWGKr4E31efV3aBy54f/roY3jl
         xZ83lsUHolawSmqH85J2uBCS2U+qBPIqnmaxBDqAWPGBad+z2nQCvgB9XYXk2ZiDVDrf
         cG/JcPaNxxl5sPMCpDfni5uMNNkPETC2EbKuZ4qLes7oAHVrUT2hi6eqSA7CYxsEkxEh
         Tq5jwrh8qjMoPo4rjdAM7wUdjNjrwUXdC6Z6IgSKClYX+/TD98227IliJmGwrf8prKrb
         Zb8w==
X-Forwarded-Encrypted: i=1; AHgh+Rq5j82tnO5pbmF8rd7wS7uylJA1Tj2b+463nxaUIIYIqYW7rkVZnVQrdep/+issFHEMKow0ymYyqr0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGvy/twQ9SUPrG/e9peUZ0dG4+gjtE3sz+yh0bP9JnilIzsH4p
	i8l0ff4qKmr7jAuk4gMfBnysdoUyWYq/vFKeBowRtKzbdeHEOxdxuMh6
X-Gm-Gg: AfdE7cm/BZNqeRSemIXw7xQEOU6fdbASEOSfOKhBgbVO26tX+T1ovlWwP6HzpCSrDq7
	q+NNXGbaKBTAU5rd0NsqnK91cIToE/Js6m+MDVYh6Tz0hmFwXZh2c2ik9n1iJNPDzyNGh2CULhq
	BkUnHN3WC8AkBayPEhWRnQWNHtZRi+mdOorMgPIWDt6IKg2mT3fRPjouf07HE/iaMEWLc2LvODj
	PvlZz/Wf21oMbKE8oPUWd+J0af/j3dWwAuu5klZSK16zNE0k245JVfo/gyZ9rGGVD+FRb2V4ye6
	DoGgA43zyZYkxf+kFaZKSyfaGXrCabnf3S8p5FBnENzz98WLw0FdWbMjrPEfbjICfuACOaoFOZH
	XDMoD32ocUr7Ng2B8bBYQYlV7yVm4yWktzZQ8Hwuodo5gc+JgiEmcmfReCtQDr40gjzzXjp5ZXy
	bSicznLWk08GE5TY3hw9qCpGbwwSWK3fOFgVlq2qgb2RuF8aKVfEI2hi8NkfnHnUeijg==
X-Received: by 2002:a17:90a:d88b:b0:381:528a:808c with SMTP id 98e67ed59e1d1-38dc75e3d4fmr9572711a91.12.1783976279067;
        Mon, 13 Jul 2026 13:57:59 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e172b6ce6sm403816a91.1.2026.07.13.13.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 13:57:58 -0700 (PDT)
Date: Mon, 13 Jul 2026 13:57:55 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: airlied@gmail.com, akhilesh@ee.iitb.ac.in, corbet@lwn.net,
	dakr@kernel.org, david@kernel.org, decui@microsoft.com,
	haiyangz@microsoft.com, jgg@ziepe.ca, kees@kernel.org,
	kys@microsoft.com, leon@kernel.org, liam@infradead.org,
	lizhi.hou@amd.com, ljs@kernel.org, longli@microsoft.com,
	lyude@redhat.com, maarten.lankhorst@linux.intel.com,
	mamin506@gmail.com, mhocko@suse.com, mripard@kernel.org,
	nouveau@lists.freedesktop.org, ogabbay@kernel.org, oleg@redhat.com,
	rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
	skhan@linuxfoundation.org, surenb@google.com, tzimmermann@suse.de,
	vbabka@kernel.org, wei.liu@kernel.org,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-rdma@vger.kernel.org
Subject: Re: [PATCH v8 0/8] mm/hmm: Add mmap lock-drop support for
 userfaultfd-backed mappings
Message-ID: <alVRU38lMfvmUFqJ@skinsburskii>
References: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
 <20260710151151.1e193eedd0cf2591ae392f76@linux-foundation.org>
 <alG2-RSitzPWClAX@skinsburskii>
 <20260710224950.53bcb43ce7e564f07a1f6a8c@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260710224950.53bcb43ce7e564f07a1f6a8c@linux-foundation.org>

On Fri, Jul 10, 2026 at 10:49:50PM -0700, Andrew Morton wrote:
> On Fri, 10 Jul 2026 20:22:33 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> 
> > On Fri, Jul 10, 2026 at 03:11:51PM -0700, Andrew Morton wrote:
> > > On Fri, 10 Jul 2026 14:26:20 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> > > 
> > > > This series extends the HMM framework to support userfaultfd-backed memory
> > > > by allowing the mmap read lock to be dropped during hmm_range_fault().
> > > 
> > > Thanks.  This seems fairly mature and mostly-reviewed so I'll give it a
> > > spin in mm.git's mm-new branch.
> > > 
> > > Unfortunately Sashiko wasn't able to apply this or v7.  I'm not sure
> > > what base you were using.  Hopefully there's a reason for a v9 so we
> > > can retry this.
> > > 
> > 
> > I rebased this series on top of mm-new right before sending it out.
> > Should I have used a different branch?
> 
> mm-new is good - Sashiko attempts that.  But it's changing rapidly at
> this point in the development cycle.
> 

I’d like to send another revision addressing a few comments and also
replace the `max/max_t` check with something simpler.

Which branch should I base it on so that Sashiko can apply it
successfully?

Or would it be better to send fixups against `mm-new`?

Thanks, Stanislav

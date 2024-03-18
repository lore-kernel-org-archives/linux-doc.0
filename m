Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4997E56774
	for <linux-doc@vger.kernel.org>; Mon, 18 Mar 2024 19:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710791216; cv=none; b=DKcKLgxQK0zQuywKtERUZTD1YHPIdTrGFgz+TslsWmRUvLcE7twoh2ZgcgwuZEBA4Zg8N3DjPFIY8b/qvIe0E15aiv12RNJ7D3GOE8r/ZBit7h155/tByClZwNFpnogOJQdzCFCdF4HUVT7gQsinbuSEOXZIUpSbEQJ1rJpeUkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710791216; c=relaxed/simple;
	bh=QXarlcQFTOfnZ8MEs/XI66pYRHSkWo47OU4szlh2gDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NbuVnAnwPUcTknauxzSbQN3QQW1vDImHUMls9jWub0o7tCvip+80uLlZCsKqL6i3LTwir4cdAvVDcvElYt94nBkh3jXCfOj9KJKOO8eGlQldF5B0NiAu3+N+L4Qtpin90MjGgGAoUuiAUdz1vmGK+1zOTIiviAqEF64r9W5zHOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=in18yMeQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="in18yMeQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710791213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2nkUErvEuzOzVX5oKqB7hmMh742gOJKbKSgp0CuYCT0=;
	b=in18yMeQmcL6DDroL3LF6eoBLLhAtQuLPbjS/HfkMGlE31z0/wEjqR0Vz5Y4xh3EyLOd1A
	UT4IyOKpIDMjnAgaKi/OwniVDwCx8EETplKg+NmBnqXYqEC0ZgxE8RlMQbxmLoQUmO0Vh9
	TmOUdEx+D3a2VnHBUZNHaWh5x+3TkB4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-2cNA6IdjPQmUfgTkizwVWA-1; Mon, 18 Mar 2024 15:46:51 -0400
X-MC-Unique: 2cNA6IdjPQmUfgTkizwVWA-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-789ffdbd375so223742785a.1
        for <linux-doc@vger.kernel.org>; Mon, 18 Mar 2024 12:46:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710791210; x=1711396010;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2nkUErvEuzOzVX5oKqB7hmMh742gOJKbKSgp0CuYCT0=;
        b=SJekErOcg9W7oMCJdkLp30oL2fpiCveRbaNuvQ8PrqhHxXZQsI1L/2mgGiZ4zCeVTL
         lJvgU5Q49B94sIYqaSyhOlSXPj4qjOuSTM/EAMiIXxRHVl2riDRIb1e/F5pA0K24XCoF
         ano9KemQ09tVjjpPfXJV9EU0Ub5YTxXUrQTwlMEvsqyV1npE/0Wm3CdZfyeMatiB+zRD
         exwkl3ifFXjfmDXiJc4LNVSdQ63AUy6PTDLnjsxfzQZ6nll4/44l03BHb6h/4yguMZJM
         RdQHpBse7f4lxhaqMoCKndp6LLMB/7yKoGl/yHgIllaOMhOKtVJZOCkNk6C5MAOlWw50
         YfVg==
X-Forwarded-Encrypted: i=1; AJvYcCXWixKBpir5ce37o+y12/FIoKuWaOIhS3Ehj1n/RSrQHn/0YyHh8jetdf7GLVQKp9+eC7P1DsvslhwUG0D+qlVvhP2gu5QPtF9P
X-Gm-Message-State: AOJu0YyZSryyrC2ZBuW+qtsDmo7QbgLQ/cVcc0QGkp7JiLmLE36lrzKB
	Uk5AFdjecJzHZS5flQpsy3uglBwoI3Rb2KSpggYVb5VvUPVDusgvEoNxFO3r7xeJXsjZXinNif+
	XWdb+BjAfQh21qcvipe0521pKZRqgpo3nP4+O5PiaJ8/VNUNS8XW1IbIHlzo8Yo9ukA==
X-Received: by 2002:a05:620a:11ae:b0:789:e954:f2c1 with SMTP id c14-20020a05620a11ae00b00789e954f2c1mr973798qkk.32.1710791210609;
        Mon, 18 Mar 2024 12:46:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCI4FKYiC0L/G0CbsDu9kbD0qr628UZy8bFbruDaWXIMqYx09zyG11dvzViYKjJKN/TgK9Tw==
X-Received: by 2002:a05:620a:11ae:b0:789:e954:f2c1 with SMTP id c14-20020a05620a11ae00b00789e954f2c1mr973775qkk.32.1710791210299;
        Mon, 18 Mar 2024 12:46:50 -0700 (PDT)
Received: from localhost (ip70-163-216-141.ph.ph.cox.net. [70.163.216.141])
        by smtp.gmail.com with ESMTPSA id m23-20020ae9f217000000b007886b695939sm4818943qkg.118.2024.03.18.12.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 12:46:49 -0700 (PDT)
Date: Mon, 18 Mar 2024 12:46:48 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Tom Zanussi <tom.zanussi@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] crypto: iaa: Fix some errors in IAA documentation
Message-ID: <cj6rfdhse7lcmj47ux5wba4kfpvjezx7wp5apc2k5gv5gd22ad@fvzpsmxs2ott>
References: <20240318064421.833348-1-jsnitsel@redhat.com>
 <jhpuhcengkgdpgyb7qsez4lugpa5nhjjn3zqehbcbrtr2xh5md@cc3vz7v2xzdu>
 <f6487dcb03a31c35c272225197af87795df2a409.camel@linux.intel.com>
 <hdb2l73guzxz2ck5qbkvpmpfiez646t33ocfqawdgxrnemwrpp@izvr4k6b2jft>
 <64229faa848b78d263a9383f664b0c269ffd65c3.camel@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <64229faa848b78d263a9383f664b0c269ffd65c3.camel@linux.intel.com>

On Mon, Mar 18, 2024 at 02:01:18PM -0500, Tom Zanussi wrote:
...
> > 
> > This is what I came up with last night for the kernel parameters when thinking about it:
> > 
> > 
> > > mode \ default enable | intel_iommu + /sm + | intel_iommu + / sm - | intel_iommu - / sm +  | intel_iommu - / sm - |
> > > -----------------------+---------------------+----------------------+-----------------------+----------------------|
> > > Scalable Mode         | nothing             | intel_iommu=sm_on    | intel_iommu=on        | intel_iommu=on,sm_on |
> > > Legacy Mode           | intel_iommu=sm_off  | nothing              | intel_iommu=on,sm_off | intel_iommu=on       |
> > > No IOMMU Mode         | intel_iommu=off     | intel_iommu=off      | nothing               | nothing              |
> > 
> 
> Very nice. I think it would need a little explanation on how to read
> the table and mention of how the defaults correspond to actual config
> options e.g. sm+ = CONFIG_INTEL_IOMMU_SCALABLE_MODE_DEFAULT_ON=y,
> etc...
> 
> Thanks,
> 
> Tom
>

Yes, if something like this were to go into the doc it would need more
explanation. This was me just trying to map out the different
combinations last night in an org-mode table in emacs.


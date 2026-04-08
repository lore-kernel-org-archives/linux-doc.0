Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF17F382F0E
	for <linux-doc@vger.kernel.org>; Wed,  8 Apr 2026 13:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775655170; cv=none; b=ApEkdB02NMEGSWOIfQyAt0Q1alpKwM/2z+SiP7x4oZm0XGr/kXhn/3FWQXsIudd8MhXRYlrFoyFlEYImVnCwmHfIPATSbrjR/jBgYt3TJG3/7kEHQy8w2Xw6i/Gt8yDdRvth0/qAXv8Mah7OA3QlnA9dESroHIisMV/AOh6AAM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775655170; c=relaxed/simple;
	bh=qbCVDMFCB0A2rJPhXIfHvPmlNhvJeiIkcyOQluSxdgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XsLQWVJZzi3ojMBxTOLPAGAcWggr/QOryhgPEZYka4kLwi0JBL37L1WmNgxdJh9AEwijvR8NRNXnJmcVVCV4/zGvFWETh/c88CZCm2KmcziblsN6LDlGnDLnud1wkr2JOFpJuCEEEGVci20w0tpaE8rDFPFreI1+vUmi12o0Tl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GHPCQ4l9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GHPCQ4l9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775655167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r/Y23Y6+TgboGn8/LfXnsCxsQVQLxcWtArX86YcRaOc=;
	b=GHPCQ4l9+lBmhtvAXfETKl7vLpn4xWXTvfs+LTefnm9fkDvEAaNTG9xBO/JivUcaQ3YKyZ
	rKB3Ne87be4QcQGlTkuratGaV7Z3TUYTKew1EKVTrv8pkYVNIk6rGWe89VY5O9VUamGPTw
	MB+nWn9Pz1hcMl4jzOy0wSAtODaCmkA=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-110-8zcQoo72Ov26oEExhcMakA-1; Wed,
 08 Apr 2026 09:32:43 -0400
X-MC-Unique: 8zcQoo72Ov26oEExhcMakA-1
X-Mimecast-MFC-AGG-ID: 8zcQoo72Ov26oEExhcMakA_1775655160
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 56753191DCC4;
	Wed,  8 Apr 2026 13:32:17 +0000 (UTC)
Received: from localhost (unknown [10.72.112.14])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ACEB3195E499;
	Wed,  8 Apr 2026 13:32:11 +0000 (UTC)
Date: Wed, 8 Apr 2026 21:32:04 +0800
From: Baoquan He <bhe@redhat.com>
To: Youling Tang <youling.tang@linux.dev>,
	Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>, Vivek Goyal <vgoyal@redhat.com>,
	Dave Young <dyoung@redhat.com>, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Youling Tang <tangyouling@kylinos.cn>
Subject: Re: [PATCH] crash: Support high memory reservation for range syntax
Message-ID: <adZYpnwOxgvFMLaT@MiWiFi-R3L-srv>
References: <20260404074103.506793-1-youling.tang@linux.dev>
 <d584d383-1862-417d-9251-153d9bcf5626@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d584d383-1862-417d-9251-153d9bcf5626@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 04/08/26 at 10:01am, Sourabh Jain wrote:
> Hello Youling,
> 
> On 04/04/26 13:11, Youling Tang wrote:
> > From: Youling Tang <tangyouling@kylinos.cn>
> > 
> > The crashkernel range syntax (range1:size1[,range2:size2,...]) allows
> > automatic size selection based on system RAM, but it always reserves
> > from low memory. When a large crashkernel is selected, this can
> > consume most of the low memory, causing subsequent hardware
> > hotplug or drivers requiring low memory to fail due to allocation
> > failures.
> 
> 
> Support for high crashkernel reservation has been added to
> address the above problem.
> 
> However, high crashkernel reservation is not supported with
> range-based crashkernel kernel command-line arguments.
> For example: crashkernel=0M-1G:100M,1G-4G:160M,4G-8G:192M
> 
> Many users, including some distributions, use range-based
> crashkernel configuration. So, adding support for high crashkernel
> reservation with range-based configuration would be useful.

Sorry for late response. And I have to say sorry because I have some
negative tendency on this change. 

We use crashkernel=xM|G and crashkernel=range1:size1[,range2:size2,...]
as default setting, so that people only need to set suggested amount
of memory. While crashkernel=,high|low is for advanced user to customize 
their crashkernel value. In that case, user knows what's high memory and
low memory, and how much is needed separately to achieve their goal, e.g
saving low memory, taking away more high memory.

To be honest, above grammers sounds simple, right? I believe both of you
know very well how complicated the current crashkernel code is. I would
suggest not letting them becomre more and more complicated by extending
the grammer further and further. Unless you meet unavoidable issue with
the existing grammer.

Here comes my question, do you meet unavoidable issue with the existing
grammer when you use crashkernel=range1:size1[,range2:size2,...] and
think it's not satisfactory, and at the same time crashkernel=,high|low
can't meet your demand either?

Thanks
Baoquan


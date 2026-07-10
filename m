Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7917E3358C4
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 16:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783700872; cv=none; b=b+D+6xO5yLQNXsqn9PTrUd7zVu/CiMA8z7T6Ht7f4qfF8oAD5QZZGIXMpSdwqUVA/mBflVymwc8RMdcNgLsNCUZEQWpQ3mBVFPa7BBnrzQb6HZKs3r7yJZAtji7Kyb0vB3/yH/G2q3IKbnUyarp70YeCR7VVlMVo1nIopH1E5gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783700872; c=relaxed/simple;
	bh=zFHfJ1sc06mEROvkctmUCy8ljGsoiIWpsgO49VU7hjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KmB+57aWwfzCMD74r0TrW0Jr/XlXAQYNRPnc+GMxNZddNNeaQiWAsdYNelJrHF0fweL16/kZN+X78d/4WdSXfgCy+Q4KcWVSSZzBHCh+cxj5G0JF+Si+F+1ti4cYMa3TPCeW+xTqQLYuzK1vuXYGGV/39y5C2lHex+y0Z1QQCZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=kzWtCM71; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="kzWtCM71"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8ee88fce476so11922726d6.0
        for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 09:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783700870; x=1784305670; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UNIXCm8Zus/z4nQ3xLBTLCwOawMM/+5sDMMsd2dm66E=;
        b=kzWtCM71+HYvSg5oE26kEeUnwihq3A/acXX4BVp3dJc4iGnjTsKQa4fnDYBQ6pBk5b
         29P7+Ypob7sR/qVJoC4xvQRlyVPCMjusy4b039Vp+MK0tL862RkeqyZhehuW4fn6jBFg
         BjxPS2nXse00VxL/pgQkm6gJ4jdEQwmI73lDyKnZGowzDZmOCSL17+P5Ktrf+fL6mmzf
         zxy6NhAvixXcWArIhMEK+//tQhuCNzrhiieoCnSaFt3Czfuu+cqU5kw81pvl3qkEYBbL
         S7JSGCUqPHUb7lYX8lvUJynDgusxrNxM7CH2DQtYQy3HkWF8djnbgx0z0K5075l4UiLM
         NK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783700870; x=1784305670;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UNIXCm8Zus/z4nQ3xLBTLCwOawMM/+5sDMMsd2dm66E=;
        b=HgJyDyNfXd/3+EqoWfSl/1PA1kLwE9BscUE/nIZEbxsr2eV4KXgbx4qciIvggPM7my
         zVIaLmThQEZkS2dy368wgEChIcR6eJ6AIMdODe16z8nG92rwXVg4B5Z70b0Aucf3h5sZ
         jl5DzmyecY7CL+GwEa/MTQIOee2gCRUhB52reckEOySMTCTUHYO8lnTuJSx5dTSTVhBe
         75ZxuyD3HDVuFVejf/zsNY2rZTjukyq9TPzasS0bSxJdB5erM85MZTt4UX6XUM6P8AHN
         g7m4zct8eG7qTALovBlyNqaDuWF9FB9u5y7kC5u6j2+oMf1T9euulNsG8ZO7tfwP+oF3
         28JA==
X-Forwarded-Encrypted: i=1; AHgh+RpAvhwXBpuxyq4L9/l/P0F8tKYonJllOLqWxK9kql8hSsqDzHpmKh6IEYyNWaG0KmL8YU6FemtTFEE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2sGckli/o1ixExcCWKR3pOEue4GKZvWbk6zfN/28VciWbgll2
	ONKymMdiYLpdNL3O5zBTnfyFsZ0B/V+09VerpSlFbEnOWsnE7FqG4B2V8QQjs2kFM0W432IPFkY
	iI10C
X-Gm-Gg: AfdE7ckv6DBTr36uHzARnDNo8eqoqDz1oWzf4i0omNI92A3IA8J+TXNcDBP7qiiMw16
	mz0tGTT45r0eWNAtNGOufkBBla5zmaph0g+DbORDqZAXaPlBlR4NY0+tSeHsx6Un+XXnhcn8C3w
	n83K9uaQH5NhnRfwfVzS1hQCGN5hQMbA2eG1jE0XyYBL+cQWpUW+67u6DQ8aIl8KMOYS0mwzspL
	L++llbarbC6YqEx+aFor5b7rMAsGctVb1JjlgApSjQDPDxd2hY+/qzQBI2bs/Judp5SsRcNhbwm
	1+W9rmBPDyx8goO7ra7b7eT0W3gcbEbnvhHlemW1V04cFLExB44NZ9wDj5lL0pKppiYF5bQijSs
	dFJgqJkYg2Of+Sa45pWAK4kmN/uWKW1f+OYX+5KehbH90cU98yU/2Ox8rfWuXDsiUSBppmKg=
X-Received: by 2002:a05:6214:2127:b0:8f5:eea1:6f04 with SMTP id 6a1803df08f44-8fec3522cffmr120531466d6.54.1783700870475;
        Fri, 10 Jul 2026 09:27:50 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd50e081dsm44781476d6.9.2026.07.10.09.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:27:49 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wiE4r-00000007XPF-1WDC;
	Fri, 10 Jul 2026 13:27:49 -0300
Date: Fri, 10 Jul 2026 13:27:49 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Cc: airlied@gmail.com, akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org,
	corbet@lwn.net, dakr@kernel.org, david@kernel.org,
	decui@microsoft.com, haiyangz@microsoft.com, kees@kernel.org,
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
Subject: Re: [PATCH v7 2/8] mm/hmm: add hmm_range_fault_unlocked_timeout()
 for mmap lock-drop support
Message-ID: <20260710162749.GP118978@ziepe.ca>
References: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
 <178345362182.660027.12809852179204464964.stgit@skinsburskii>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178345362182.660027.12809852179204464964.stgit@skinsburskii>

On Tue, Jul 07, 2026 at 12:47:01PM -0700, Stanislav Kinsburskii wrote:

> +int hmm_range_fault_unlocked_timeout(struct hmm_range *range,
> +				     unsigned long timeout)
> +{
> +	struct mm_struct *mm = range->notifier->mm;
> +	unsigned long deadline = 0;
> +	int locked, ret;
> +
> +	if (timeout)
> +		deadline = jiffies + timeout;
> +
> +	do {
> +		if (fatal_signal_pending(current))
> +			return -EINTR;
> +
> +		if (timeout && time_after(jiffies, deadline))
> +			return -EBUSY;

I really dislike there is a timeout here, HMM is supposed to be more
deterministic. GUP doesn't have a timeout, what is this about?

Jason

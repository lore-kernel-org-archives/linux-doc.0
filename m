Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795148367;
	b=1J+fIqxc/25OOLLRrCNmlJzDAj479HZC609EuRXBJk/uXnB/G8ZcTTzr3Tmmc+nxdB5G
	 qm4l5/RBnJSCRR0Dpcgj2iKpN8dsntwUF4ANU/M8ND0INwFFRkRXQwP8x8u0WUecqU9TF
	 kwmj1S36Gn5Z3qQp329Wp/j8SZgdEWYc/Bq6WPjblVuHorb/TLJbTbWmk7ZmBTe5BXnVS
	 7XTYCjxm9Nrm2EcPWOtftBLqRDxFEloZk5jid276PoozeeJ9lvrN2Ob3e/k7m/HtjivN1
	 emI6uFlBT2BTMnxBxz05xtqrRCYd9XLQwsZDQS2ZvuSpbssABs6FgEwDBgSK9dw8JjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795148367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=MU5DDe8WPNLGbF0itjuTQ81vCKFzjS+1XQz059WZL8I=;
	b=gqo4GpoUU1CjryNGvS7wYYmX1vJ+dW8CG8kQKYFG/zrVqxMLSuwgTmP38+STRgCP9pox
	 jWHj+6OjNVbpTDz/7kH98Ojt5310IZfRDfdgPXDER5uTHIKzTfnlMVBPsEYVfOxbMfET+
	 BMarqJx6oVM9f/+PtJq+kEixcrB2s1jCGM61QH7MdWmgrfKlmRpRQ7H4zlfq8KO0bQ5v0
	 5sf8EXBDrvaIEb+fBl/2O47P7hP035mDDVx+mHAkUpj49Jj1YEYM3r9Yu+1glzvWo7rQp
	 T+ghzPSr8Xjug8d4/qOeLq45Jo9xDOAPAUh/TfXg9uNm9xSyXOFhfUHJv71OiqfehFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=furiosa.ai;
	spf=none smtp.mailfrom=furiosa.ai;
	dkim=pass header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=aZXTfAqU;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C6F606A330
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 04:19:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28C6F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=aZXTfAqU
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-380b40319bdso571739eec.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 20:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1795148366; x=1795753166; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MU5DDe8WPNLGbF0itjuTQ81vCKFzjS+1XQz059WZL8I=;
        b=aZXTfAqU0L8p0w00l2jFW19n66QNVhWySfhA0SY7bf3a6UZRLlN68vzHGzolYo95cG
         HLIvYxsN8du7bkAAMWKrlwb/eYZ1IRjHQ8laCDLtwacn3CBOaTA5ahJP1q+Yv6UVeKQA
         rrtYcUHLXdSlhG+5v2fzUxjfXZjQ5GU1ceCQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795148366; x=1795753166;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MU5DDe8WPNLGbF0itjuTQ81vCKFzjS+1XQz059WZL8I=;
        b=oVJ5QSL31/QHlGv6lzpzeqCqF+wVeF9xvb9kNY54x/gKzdSCHflCWC24ztcx+A6G8k
         kv7qt4oGfJE6EsMj+pi1v+Kf/+DtedmwXRQkBTLzdcEibC/lEF+hUF4LOv4pL6AkNgz4
         1S1WYWfiEY5RpeNDDiBv79+C3IQLf2CXuLNVh0nGZyVx64VRPVnsTiicz7Fix0ToANwi
         fEs3kNHn3dz5YhXGAnoylYtUXgaSS9mhzNaYK78WN0FfWzqdO1BtIpWaCt4TpB19Avvn
         IbrdSa6MNu91kCGONmh7+ezoO1YxBDVHZht4PtMkmmNpFelNqPyNzdbPymu/tUMqQ28l
         pc/A==
X-Forwarded-Encrypted: i=1; AL+hErE5yhgM9ml7oe+EH3l3G2O+N5oWSQvIDp7pK0FcB7rrdwwn51OGkE8Vyf7AzPJQoVY3JnYrhRWkV60=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3F5V337SF3eqW9Q48Ck+Lo8X3xmG5o+zOEI+RRVjlVHK2D0Ha
	TWeHz8uWgin9y7E8M8SbxoMY+0PKLdV+rWIHlwVB6BD6yY7pLhF5VOesglejI+AoqLo=
X-Gm-Gg: AZFdTZcvnZmT06WPaTlrFC+CkhEf3asNGqVOwuE5sE6vLelNjOETBJ+TwRrk7g//AiQ
	x0eufefyI7HdfQj3YuVXJS+tO4wiVsHWrNGSLNbn6iM8e4Pj5TNCn7QgZcKyS+se05BPzcWeV+9
	vE4RTlmuXcCnKApMDvmGcdIEL+/e7aDYJmPJ8+vsyR63hB81yzv4tkinmQOH3qEOEJUcl+c9tuw
	yB6j5aMETh8Ys6Qk8zWzwd9dPaxiQObEoR0aTktDmVrOi/DecP5turw3YWpm25D68obMZWK8E9+
	YMfH5KqyRJFO/mC4AGZtofOFlKuWGMhY07MtQErHfqnaOIoviXcdYeNTQuYwFBCJ3FpD1d9b6yT
	+bbLcQ1RhOdqQnsfAim8xJNZvtvHSX2CubunNs0o5+4o48Sz2Q6Pf51Ys9mC/2mnGf91xALcUfv
	zVIVI86t32MEux86rwYoBbiyiASDPsBjAXu6Xy1FVGxwmdCNGDWZuEnpvYib0yMtPAnFV2qFRpN
	kDWOshjxy/w8V5IBAHs3u/0XDvs6egtu/owixO+534zoz04mPgt0XDQvnmLTN6H/KFiItxKYy0I
	c1Gm0u8lnNLRj3g6+4ZiYEcqngISNgBBWFxTpRVHm2PL7+hU6TBl62OJGP1BKSTCYVA8S0Y0zhB
	CL+5IEYzpT8Cr
X-Received: by 2002:a05:7300:50fa:b0:384:6487:b155 with SMTP id 5a478bee46e88-38570c359d3mr1744166eec.29.1795148365941;
        Thu, 19 Nov 2026 20:19:25 -0800 (PST)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm4107967eec.5.2026.11.19.20.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 20:19:25 -0800 (PST)
Date: Fri, 20 Nov 2026 13:19:07 +0900
From: Sidong Yang <sidong.yang@furiosa.ai>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
	Philipp Stanner <phasta@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Matthew Brost <matthew.brost@intel.com>, 
	Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	Heiko Stuebner <heiko@sntech.de>, Gyeyoung Baek <gye976@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] accel/rocket: Report NPU usage through fdinfo
Message-ID: <av_KNIsnvL4GXCGu@rock-5b-plus>
References: <20261112171144.3151554-1-sidong.yang@furiosa.ai>
 <20261112171144.3151554-3-sidong.yang@furiosa.ai>
 <3c5f7694-e6fe-477d-bfeb-a130c363f431@igalia.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3c5f7694-e6fe-477d-bfeb-a130c363f431@igalia.com>

On Thu, Nov 19, 2026 at 09:31:54AM -0300, Maíra Canal wrote:
> > + drm_printf(p, "drm-engine-capacity-npu:\t%u\n", rdev->max_cores);
>
> Does it make sense to expose the capacity of a core that it's not
> actually initialized and in use?

Thanks, you're right. I'll report rdev->num_cores, the cores that are
actually bound, in v6.

Thanks,
Sidong

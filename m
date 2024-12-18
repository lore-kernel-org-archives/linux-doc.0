Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC32A14A084
	for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 04:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734495093; cv=none; b=Wnj/Qp/FhoBL7kblee1i0Yw+hhaM4+IYxqTgwnxPbAZrcOxYzmzbcDFRgNbsW4zE/HJb3olSAGEYH/qwPvQ/LDTaaOm0A3taqEuG6UBtL71XoHn4SDV0rHmyfP92TcEbRZxSguyZEnjz9Esnxk8vyqubl+zwk/FsUkjBBJea000=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734495093; c=relaxed/simple;
	bh=YYhNaD2Yr+jchoTk8EiKLQl+e7xsWcAkGDWERN9QZc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nv2nvo/VlyZ4RbHU/0SVuv+6caLssrAoMjBO0uAekXyowNbrrNZgX9iE2VfsxGhBhGoJgR2B0Y6cp9f3PzI56YiQR+f3hv3w/aaZc3V2PBLWCKTV8Wv22gZDXGh4Lf+N4QJ3f5eCnr65EDOD4uqWXKAsspf88l0MOBlXuNTMxls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nVw2j0pH; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nVw2j0pH"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7292a83264eso2622849b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Dec 2024 20:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734495090; x=1735099890; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=anbuEbZW8yvbXFC35C2SRwfKrlOPlxSRe3Xsz2o+b10=;
        b=nVw2j0pHUy/oCN6CtZy6qD5plO9b1mbjkV2wGF+GOHEjkEsI9mkOJuE1V52uyi9zIb
         auCDyuWnVn/nd1YIElq6JbwI5mmJkRmq5rqq0H0yPDhZJRyrdbJUBDf5nWNzyGdgCl8N
         fCpW3jz6DLfUA1w1oLQ9mb3qAX7/llR3nekx+tDbXHGevKc03Z7i1c/fIVTQvHXv1tzO
         djtwdA2gtNetHonTBw+FZ8JVRkoHVRT7vNxuYRhy1Xr3TCzbkUGAjI3WbBA1zuO6POe+
         fhHGo5b9UhbjwK/V70OsvjCaNK8B0PyU4GJXJ2q/vHj/J/am8hjH+HRwr6lV9OKTdt2t
         i8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734495090; x=1735099890;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=anbuEbZW8yvbXFC35C2SRwfKrlOPlxSRe3Xsz2o+b10=;
        b=bM7wGgOMO7tKv13yOQLHUK0PGQhouLely6pIv5b7Lgygsv4xbDSojRrgZ/Ok9Ua43Z
         ppWBDoesIC62RcrHBMRD98N6bFAl6g9zU7PGq+WhwykMC/BGk5rLLxhoFPdyttCE2H6H
         DnHRcHxQC8lrWgDdq6n7TVx3feFwze/lPWXxE8XLKcSy6K7vEixrPiOX2T9POWe3mat0
         sheET50wZWYX9zqvdK9CL62shqC1wouH41V8ZvUmxcX1YUO5z/VeWLAAfBD12KkatKsZ
         GqQVskyz5iFh4KpYoLhfGv2CUE6ql8ST26egqriVSa2DZksIjEcAjviTYmwucAaiIRLT
         oU7w==
X-Forwarded-Encrypted: i=1; AJvYcCWxwNpHcgT2qvGMBsRFU9NjGPzXUPone3lE4f5AjjicPYcLpuK7EAQns5pQoyKPiXOCraD6nxpFY3k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/DLgo7ltpm/D7GG0MlHfPVSESZwpcxslE6tsan4ckCCa9cjz/
	xjXW8Ijqvgarw1C35/4op4JYnuAXftiAX2LDghBq+al+ESRbZN/x6ytmZU29rWI=
X-Gm-Gg: ASbGncuLaAe5HLjP40sDZ2Ibr8HoTFcL4Pc21ZlPZ67g+5cfM2yPcI5Bhj6NakSUIY2
	+pOtdeejfb7g0votDRpmORjeoUjNulHRp6U1/5fGZUhLNc++I7fhoLpSjA6zQw7VMdBAdgzvtAD
	TcfKYdTXthnbQUGzhGubrcNUugws8BuVq5WAlsIcCenKpuyawtVZpCnlAh7OmeqlweZpwhdOLfR
	wZ93y18aWt+H2tP0C05RPvTGrE8ozbLAvCOiBMd9xByfhg2TFKUKZtDnBM=
X-Google-Smtp-Source: AGHT+IG4sPsc/N7IOp43iXXeKOWo6JJJXd9zgTWOHLq4CFq7GSx+SKJhvF92c9uFAmfB0bNzPUQSSg==
X-Received: by 2002:a05:6a00:2191:b0:725:e5a7:fdac with SMTP id d2e1a72fcca58-72a8d2eedb6mr2614606b3a.26.1734495090289;
        Tue, 17 Dec 2024 20:11:30 -0800 (PST)
Received: from localhost ([122.172.83.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72a9d3e94f2sm76959b3a.199.2024.12.17.20.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 20:11:29 -0800 (PST)
Date: Wed, 18 Dec 2024 09:41:27 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Beata Michalska <beata.michalska@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, ionela.voinescu@arm.com,
	sudeep.holla@arm.com, will@kernel.org, catalin.marinas@arm.com,
	rafael@kernel.org, sumitg@nvidia.com, yang@os.amperecomputing.com,
	vanshikonda@os.amperecomputing.com, lihuisong@huawei.com,
	zhanjie9@hisilicon.com, Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, Phil Auld <pauld@redhat.com>,
	x86@kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v8 1/4] cpufreq: Introduce an optional cpuinfo_avg_freq
 sysfs entry
Message-ID: <20241218041127.khdwo3hzmywcwuh5@vireshk-i7>
References: <20241206135600.4083965-1-beata.michalska@arm.com>
 <20241206135600.4083965-2-beata.michalska@arm.com>
 <20241212065100.sjb7lrlmksbm2hdk@vireshk-i7>
 <Z2CmcelSy89NULtz@arm.com>
 <20241217042726.isllh5bulpnwql7i@vireshk-i7>
 <Z2Haw_o8gF-Ce1gx@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2Haw_o8gF-Ce1gx@arm.com>

On 17-12-24, 21:10, Beata Michalska wrote:
> On Tue, Dec 17, 2024 at 09:57:26AM +0530, Viresh Kumar wrote:
> > On 16-12-24, 23:15, Beata Michalska wrote:
> > > My bad as I must have misinterpreted that message. Although I am not entirely
> > > sure why this might be unacceptable as it is not such uncommon approach to use
> > > signed int space to cover both: expected positive value as well as potential
> > > error code case failure.
> > 
> > This part is fine. The problem is with handling frequency here. Signed int can
> > capture up to 2 GHz of freq, where as unsigned int can capture up to 4 GHz and
> > so we would really like to keep it at 4 GHz..
> Right, though the arch_freq_get_on_cpu operates on kHz values.

Hmm.. Missed that.

If you still want to keep it, make that change in a separate patch and
the new sysfs entry in a different one, so related people can easily
review.

-- 
viresh

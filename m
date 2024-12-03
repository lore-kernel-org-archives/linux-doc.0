Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E4A20A5C8
	for <linux-doc@vger.kernel.org>; Tue,  3 Dec 2024 23:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733269428; cv=none; b=sHoN8WD8vBTq1AXrZOd5m8U5S1x/sWQS8v2f96hd//hEqK/0bkrJl/AAmwAHiWyPvh77+fgQIFeC7TT6fR8nl/CyT7FgNsbuBg5jge2tJTPw3q27so2ZuJFDdQyrCG9fFLsxWYhjQONmBHQBmGKL4l6dTtMTTmyIJmR2HMJcvqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733269428; c=relaxed/simple;
	bh=CgfkE9ZMiNTqFfMldGWs3WMrKUI+2eSx4fz+V4++VO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=roWQKULsUtdq5U8B9zH1TW11ZobXJWI70ZSCYf2YMe2qbHJHjzzH/y/ulL7E27J0T8l9y6zMplSpY7A3SMvSyafgg7AbwXwFWFp/7QYsOdxMy6PjWCDIaDkYVLYKRt9xCHvY8IfgNRLI5wKPV4Z07cljsmz2T1JW/dXrlR7DFtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mb694BkN; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mb694BkN"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ffa97d99d6so64437781fa.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Dec 2024 15:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733269425; x=1733874225; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=paiXFVPVWPRPDu6nA3C0qg4bqDQAprC3oW4RjPZivj8=;
        b=Mb694BkNg3B68uVi4FG2n98I6hQF7P7Iu7wEMOubwlnHbKGt7cmRSsqC1n5qoAmzuz
         d1vuYqvEZsOcbiKb1us7LmzmW1fqtDoH2OHUEkp2u9H3Wkp9ln4+4j4zSx9kH8WYp7mi
         0hkQTm9lqnBVIv4VZ/WpivTHKur109SUdObd5mW17MRsDCqawYXsJzXF+/AlydMC4Rut
         m6FIqs9uFzpb9syu7spdmaN0xcLjmq4cT2l9ygAzY9cwfEnDMBYsP2HLyZRmfQ19UXfD
         DLYduyLElR15NiyiOApFb+X0DEZgTwKeClpFp4GoE1ay/6Uiso8w7EPrspMnnvzhuwKI
         8bfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733269425; x=1733874225;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=paiXFVPVWPRPDu6nA3C0qg4bqDQAprC3oW4RjPZivj8=;
        b=LLL9CxQG4W9d96zkeY1KsPRr/YPY1nisbhSHzSr69om7/Ck0KtU3chHT8rxEl5i0jy
         ociglSt0Ppm+KxPpxUiCcoMuT7gMOk3zH2budMXEFRZxS7hGwJIqS+j9IHDcUGb3ZbA7
         dPPYVgYixeeYA2NbsKTH8tLkrx2yNochbNJqQy3daWmX5BJrwemfxz836UO9ANKYkhDW
         /MRoYu7JCnRnYbQuyaT/q9pDU4245it0WK/NWJozhcRw29s0vsCAwAY2z34xLdOZEo/f
         lkn9QA7UzqLyy2vnTMd+r3ft+cJXetd9stOgvsVy0AbbehwcRu5T25pxcQC2M+V5iCJX
         38nA==
X-Forwarded-Encrypted: i=1; AJvYcCVdah8uN0sZ1ttnRRezvvAo0D0WvCNP8FcNm+F17K3FTvHCj7pvY/9QEKDeHFdqiw1E9rSjp4bKInE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw88la5SwvAHKjQWVgTn4Uweug3zd+L4KGxOtFN+UnZk2Pns3PF
	0C0ZHborNv6DWM0l/IWQxYGKHjQMRXvEbPGo4g3YYE/ZTS1inR3zFXlGEbsxRHk=
X-Gm-Gg: ASbGncsIH6gVCLwoBFb95wtnX7n/D+Dw4pRvKSSOcKlqxuNlkgF/6zx8rkPZWT2JK8Z
	mfh0pgxkNaFYFT27MuoYKs6PPnjCoC6YWXSGMIqI6y4WHTS6IRBkQ5vkw+SiRBWQJnennPpGkM9
	umwGjgLs8/UIgY5QQ7ZB/4TYgdkEceA4N3P7I8BP44OGLvo5Ry626KAvxMnlYZQzhZ07ZFfS3R8
	aKjwe4fPXA/lTdBtrZsg+A1a9pERl1GjgVHeZvpQUCoR8yOLmbalXithvkGbn2Xl1WVEqk0fLER
	0SkSs1gev5iU/bq5T29g0/CsFR/amw==
X-Google-Smtp-Source: AGHT+IFDGrQkvLlyXqBklk96Y14J26ba8zuOIKYwTXl6pLPFPM98U/mamBI+7HHZilK1jeWt/fSX4g==
X-Received: by 2002:a05:6512:6c9:b0:53d:e52d:3373 with SMTP id 2adb3069b0e04-53e12a2c9c4mr2062386e87.41.1733269424835;
        Tue, 03 Dec 2024 15:43:44 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df646f2a2sm1986127e87.167.2024.12.03.15.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 15:43:43 -0800 (PST)
Date: Wed, 4 Dec 2024 01:43:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Cc: Trilok Soni <quic_tsoni@quicinc.com>, 
	Jens Wiklander <jens.wiklander@linaro.org>, Sumit Garg <sumit.garg@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 00/10] Trusted Execution Environment (TEE) driver for
 Qualcomm TEE (QTEE)
Message-ID: <gtfm7paylpcobucmwmapgdxva2wnvn5skkakaalzpx4ip7x2h2@lphbinkzaw7k>
References: <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-0-f502ef01e016@quicinc.com>
 <518ee3f1-b871-4349-ba85-3b3fc835a4ca@quicinc.com>
 <0df58435-94e7-4b81-b688-ec0e1c49c0e0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0df58435-94e7-4b81-b688-ec0e1c49c0e0@quicinc.com>

On Wed, Dec 04, 2024 at 09:13:43AM +1100, Amirreza Zarrabi wrote:
> Based on our discussions, we implemented significant changes. We essentially
> rewrote most of the files and altered the overall direction, except for a
> couple of files. The changelog entry would have been extensive.

At least some changelog should be provided, even if tells "reworked to
use TEE framework, made it jump over the head and tie the shoelaces".

Also please don't top-post, this style is frowned upon in the mailing
list discussions, it breaks the logic of reading.

> 
> - Amir
> 
> On 12/3/2024 5:06 PM, Trilok Soni wrote:
> > On 12/2/2024 8:19 PM, Amirreza Zarrabi wrote:
> >> This patch series introduces a Trusted Execution Environment (TEE)
> >> driver for Qualcomm TEE (QTEE). QTEE enables Trusted Applications (TAs)
> >> and services to run securely. It uses an object-based interface, where
> >> each service is an object with sets of operations. Clients can invoke
> >> these operations on objects, which can generate results, including other
> >> objects. For example, an object can load a TA and return another object
> >> that represents the loaded TA, allowing access to its services.
> > 
> > The first patch series was RFC and now you had removed the RFC. Can you please
> > provide the reasons?
> > 
> > https://lwn.net/ml/all/20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com/
> > 
> > I understand that you have now changed to tee framework but I want to check
> > if we should continue with the version and increment here or start from [00]?
> > 

-- 
With best wishes
Dmitry

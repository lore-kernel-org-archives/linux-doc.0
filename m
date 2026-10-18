Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3CB3DAAB3
	for <linux-doc@vger.kernel.org>; Sun, 18 Oct 2026 23:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792367621; cv=pass; b=dsYxzqqBfxzQHqy0pQKwXpycVzHqml+KtUUUxsbk5OfWqjKYjRfvKUlNzNfCi3uIMZaZJPlNA68niTWAm8NvmzivzQk4DjhI4SzFzy7DaokCPxx46C36oPlIzhz6/5Ka5Pi9OKZoCTt9WeEYtR+QgjiiZB1OMJrJ+n5+9b9GeBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792367621; c=relaxed/simple;
	bh=ikcStFONhfs5hokFZ9u0J5DwZzPFduPyuFeHVqSmKog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pful3PwyDJZ67DSsFUNXjDR3auRM52vkqHc58eQe3UdypUYksg3c7Z2t+kbUWj/ZZ23A709GvMYkbNDzz2Dd3EDTOVCxG80pRIyQ11sreuoF2fkUvugl3wm4IqVQ3fd8BQezLMdsnmXKtSXkqTbthU2NSNokSAe7eShQmhNsl/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZDgA8XP; arc=pass smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZDgA8XP"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8a0673d9bd2so297113b3a.3
        for <linux-doc@vger.kernel.org>; Sun, 18 Oct 2026 16:53:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792367620; cv=none;
        d=google.com; s=arc-20260327;
        b=daD0HZNUY1xRB9m57exr98AC1zvNgPA0zo3VhvdeP0Soakg/u+Xqh3u/Velwe/1RZ5
         cmXMpuajKzucIE9q43Fz0dWFlGsY5KrhZxGtki8ycBQlEwUMXAtd9SJ7wgO9GEiUMN2e
         sNHwummdNuwAF0k9BifJx20qR6z5jJGqeYl4jx1ZENripn+BRSbq6Yfi9rPRaqdCHalO
         4g1UKnheG1OnRR+GJL4Pe7zAZk3UuOPTC5Ous4j55Bc0SCw90lKALBrd+2UWuyXe7EIG
         qTd45qwFW4uYN/2gabhpmcLzDkU0QfHNsuyi5YUvji7hZE9VwulAWvNRjSqy8apxHIv0
         r3dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ikcStFONhfs5hokFZ9u0J5DwZzPFduPyuFeHVqSmKog=;
        fh=lXsDFaeOENkutiZlXjGo1kP3/bTdcMF0yz/iZyy4PpI=;
        b=o7li3KeJVdKrdjr7OOCV1/4RwsJlum+d+F3/zpjf7c8iGSZFHaq05rQ5QccV/8t8UX
         pWXlUCv/hznUzoBYPedzTHt8kWPZ6qYlozq9m5n84mH2r8k2LQMLWA2m9Bh/IeqH4FWn
         EIHzJNoi+rj0esjzzUEuseM7/V+IuGMRTVBwsVx9xABqjnCde9K36D3RaQWrWqsthejv
         yjJe0RMP73G47ZeORy64c1JJfo7D0LndkQcV27A/66J1UW6lMLC9SgWRYyofz9RUduWV
         Ir/aItcPTIPYBWL/XlGo1f8YZha0MKLLIqMXsqeEGuOTw1SS19/PZeA6S0IFO6cDkqLs
         2Reg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792367620; x=1792972420; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ikcStFONhfs5hokFZ9u0J5DwZzPFduPyuFeHVqSmKog=;
        b=IZDgA8XPxtSh5SmNztAw9myhG61BrYOUczUp3QyZ3U4M+b/31OnoF0hdpSfL5a9W5k
         SpPaQA4NCvjY+GWzDVkjQV69DzntUDS4Ha/r+7fZn86vIwu+VmFE45/Ck7dzcO+W0JVn
         x/My9Pz7dv+WqOzz/StA6xrhvATJoLdO01IcgioEpSnVnJWn8Ogdya6qJUpGNhte2N+Q
         GBJYQQYzLlELK87jq34hmdd7p69WK4c2g3UfEFkmE/G5EmOvx3d/9U2LaVcqjo1YUb9j
         XX4j1xByvqrIP//XQuoJ6Uby3mYfgTjlMF2qCNt9T/2+eRhh6IqYmuOcrMis2cTt/Bhr
         8w6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792367620; x=1792972420;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ikcStFONhfs5hokFZ9u0J5DwZzPFduPyuFeHVqSmKog=;
        b=cOtcf53AnPm/4N0BcvzblnpMY9oiek2O5SGALD0BnHdcbB2h6b3JNTSNOl8VEqCJ5y
         7Gw2kU57Ni6Fq0nST9CxJ+NfPapDt352L4Hk37on/BMUFkn9nYatJAzAO7OE/rvnV55n
         17iFYwM/14f6CvYhT7Xy+BOnnSZVGeBrXSkwH6zSRUbbGIlx4CuOBKW3gNjIP6dPBzbb
         fENegiNwdJJzghuu76TIAhidJYQLcutIxhpz3ZqsJflQmNEKfINcabcA3FBf4/NNcmDI
         z9H4f/u/gK+aHZDwf0OfNf/1syXG7W4EmpwAsu57TwrQWP2r5VaV6hqeYxCjyEvkKNh5
         fCWg==
X-Forwarded-Encrypted: i=1; AKwUvBz0z7uLQBc4TSLIeGdoVNu1KSO+aImS2GNWKzPl1bJ/Rmo3qmZDWTU88jJc+Xf2nkP1Peo18FYF4lU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKg9z0c4lV8jwHdHLMxkarNvtGFHcB75IBsEXCvthhnDgy8xhmu
	Wv6n7Eg5iCH3bs4WQRlxgEuOg31D3q8g45if5SPqYvQbz+8lGTb1cH++chg4IyBzAyGKgYnYAk8
	1PiOtVH5YNG9+dMWuaggZZ3fYkkcZqeY=
X-Gm-Gg: AYBFou3fNjOscCZY0govBP96tOv2t+TJjxl72WQqvKWlnBb5hEgoQ/t26g1Uy2YCVqQ
	5q/5eK6tWz9rE9iITk6+iVpL0PB5NzbBNt/2qaDCVmv738X7WlNCtYZmGbN27q9ymJ6yArEpwDf
	AlvZLisMA6QZxtIIN4rmEl54zWiXhPBntPXhQlbji3jAOQLg3UB+I0LaYhipTTeUK7UyjoVMOyW
	Q+CkQ+iP54+njTX2TmQAheBvHMbnQtrwU5Ks5TnbjkRvefOFD4htkj6oPBXbF8MfzbM6Qn1cP8g
	mIZl9oWbJpN0i2cPtGfaP8PFAqjwgWHw4jTHUcLdal1H3Lh24f6Swh/zNkSEWznV12PilvPHZnx
	WMBazaI+t03TnvwM2Pg==
X-Received: by 2002:a05:6a00:1806:b0:892:597f:37d8 with SMTP id
 d2e1a72fcca58-8a04ba18454mr4779902b3a.15.1792367619719; Sun, 18 Oct 2026
 16:53:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015145053.3664509-1-jiri@resnulli.us> <20261016234354.GA664420@nvidia.com>
 <CANwfdvXFLJpC4Bc1PwRoUUP20fu2K8b+FHZ1JLLFXAikC-cBaw@mail.gmail.com>
 <20261017203407.GM13920@nvidia.com> <atPgqROZZxnihYfC@kernel.org> <20261017231007.GP13920@nvidia.com>
In-Reply-To: <20261017231007.GP13920@nvidia.com>
From: Dionna Glaze <drdeeglaze@gmail.com>
Date: Sun, 18 Oct 2026 16:53:28 -0700
X-Gm-Features: AclHuK9GuI1sFp98b1K0khmGUju9GL5ycOOU8Mt4euoyLz8UHj6wifrtGgAMHK0
Message-ID: <CANwfdvVJRv6++MJ8OCUnHSR_5nVD8Yv6eTmYxxqfzxEk0sNfpA@mail.gmail.com>
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX support
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Jiri Pirko <jiri@resnulli.us>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, x86@kernel.org, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, david.quigley@intel.com, 
	lukas@wunner.de, ksinyuk@kernel.org, rodrigo.vivi@intel.com, 
	cedric.xing@intel.com, sameo@meta.com, James.Bottomley@hansenpartnership.com, 
	aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, pgonda@google.com, 
	jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Content-Type: text/plain; charset="UTF-8"

> On Sat, Oct 17, 2026 at 11:55:05PM +0300, Jarkko Sakkinen wrote:
> > I wish I had a better picture what is going on.

Me too. I've spent my Sunday with Claude trying to build some
understanding of all this stuff, and put together a static site about
this series.

https://deeglaze.github.io/scratch/ctlv-site/index.html

It includes a review that I've personally walked through to ensure it
wasn't off base, but of course we're all fallible here.
I haven't decided to email the review comments to the list yet because
it's pretty thorough for something posted here as an RFC.

I think something to be really careful about with this series is how
it's managing kernel memory.

* https://deeglaze.github.io/scratch/ctlv-site/review-02.html#reply-7
* https://deeglaze.github.io/scratch/ctlv-site/review-04.html#reply-27
* https://deeglaze.github.io/scratch/ctlv-site/review-07.html#reply-7
* https://deeglaze.github.io/scratch/ctlv-site/review-11.html#reply-8
* https://deeglaze.github.io/scratch/ctlv-site/review-16.html#reply-30
* https://deeglaze.github.io/scratch/ctlv-site/review-18.html#reply-19

Something I and some others dislike about IMA is the unbounded log. I
don't know how many stalled proposals there have been so far to permit
some model of "snapshot/endorse and truncate" to allow a remote
attestation verification service to store existing logs in object
storage, measure the reference and/or trusted signature that the log
was "good", and then drop everything in the log prior to the
pointer/endorsement event, but we have a chance to start with the
right model here. I liked Tushar's talk in 2024
https://www.youtube.com/watch?v=5cXDrIx8Qgo
IMA carries its log through kexec and this log doesn't, which is a
hazard to later attestations that don't have some other out of band
protocol to associate its boot instance with some off-box cache of the
rest of the log.

>
> Currently we don't have an intention to flow TPM command packets
> through this. Anything would be a high level operation like 'extend'
>

If you're not intercepting all extends through other interfaces to the
registers (e.g., /dev/tpmrm0), then it needs to be clearer in the
documentation that users not using the interface will break users of
the interface when they both target overlapping sets of registers.

Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688F914F9F7
	for <linux-doc@vger.kernel.org>; Fri,  7 Feb 2025 05:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738905172; cv=none; b=QHHikwXaN455KYvAsUKxA+VGtLNg4G0IZ9twea7nLO/vsuxul878FEUuWcJJCOmSEhS20GhNfjYZ7HOV0QG9t6Bii1WNtErv3kfxxw7MTHCdYfjEZ/PfLz26bp9/EKLgAS6up6Ta12mUn66ETn9rIY7Zv1gx/OdU90P45cz9RUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738905172; c=relaxed/simple;
	bh=FzAGaPlLaweajGoIIj+Xr9VB8vTpfZqyn2PkFUSCgyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mARFEE8+I2nHBCnx+TsCUb2+sgjVXbbDqk6EPMYnBczvBDt/RNsIOdPoA+8+i8wPrthjy4G8LAUfPLE8LczjiStr9lHA4qmCqvFfisV0eKS9oWJ/W2ae2h6rYrOTOIl3Y82pl5rsmmiSnIlJKJqrabHfPSysSUZ+uG8wMRTo1BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s/4MIITE; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s/4MIITE"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4ba82f2bdd9so330398137.3
        for <linux-doc@vger.kernel.org>; Thu, 06 Feb 2025 21:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738905168; x=1739509968; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jAqxiqpAkCMvKRS8aIsBMQxfvImPXVu+azXD9hvL8PY=;
        b=s/4MIITEdXx0HKAw0WKPJ6NGYKpZVyoEzyTn5BgdeKxHo3HpjGZAjdFjlFrWVejL6g
         fK5ViNxqvOCk3pzXfosTm5lyDiVoox2sEITBmwHZxIQyP4Ra9t2dS18UYSCmT/8rxrGI
         a2XRjB9MvmQZTEjvz5AHJpWTivbfwMfGdV8E5z0GNsbGKBzYXM9yKj+TwB1qBJaT+USn
         ER2Chjl/vpDVhKCLr2+dffEpRev903rCPUycxPXGF968C8Njv4DNQeybAPYICvzOSIXR
         mVOiGnj2ehtfc42BFRGIfQmPSRabBZQK/gTTu5SBx8DK+kZRvyrwn2TIrTq3dGiEoUdn
         za/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738905168; x=1739509968;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jAqxiqpAkCMvKRS8aIsBMQxfvImPXVu+azXD9hvL8PY=;
        b=locwbvdGYGh0p+r5HisgwNmwmOmke6GB1RgkrczNcZtOYEhanaDcXrpV4Ey/T9/EYI
         SnAs++ZN6IlbLo6IcdCpqNDk6crTWzx910mCZ+8WYhO/1D1OqPqApxotDQb9WPnAaSUH
         HlKda8L04148BTj1ZZ5u7Gnb6yT7B+3hyYgez/A7NJtBQrAxSo9Ljt+srVN9UvWSdNLL
         3crvgXBN54L+6mVqmiR9jWQ0QS3HipepYPpvuYOP+E0Vj3GHdJQmE5qA00ruBWJR/vSo
         q/k4aUB7cwkJFc36A36m9CaNLS8jZieGSbhWtnxyDQu/frD7LgTxigCZI58AVYX/Iuzf
         D0LQ==
X-Forwarded-Encrypted: i=1; AJvYcCXK0u5+LgU80GHrVEPiMYn4+Kwzkwazk7QO87ZyJw2ofhsURncyi1XEjikUAOP8jm979LXT8SegTzY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv0Qgy/1r3bTGqu93/DdCrs16Iz6uKNmncyK59Wsl+R5/j2ImL
	TFxT2yF5JU7IzsX43VhOsVMClX1L4LVGWQKy686kXpNZh3c2s6C1XCGhGPZHh+MnEEbJUcoRxaY
	nRjhVdR4ExoSq1yd2N86aO9Qo3FTU0Uk/Kt1AHQ==
X-Gm-Gg: ASbGnctcTrp36I8HNXA25vNkBViscgmCVEdJPSzA/125k+74nzCDJRWdWvHTkus0OGY
	5ehtx+f4IzwN9/k/Q36gk3MuAGWwMwgcrbdhjZbMvWqNJ3yp1p2ien5vrM8nUF1kTiFrolRaWRz
	4=
X-Google-Smtp-Source: AGHT+IE38JWQ2LCgjBYwmT3N3ol5clUSl4tITr+DYbzBN4LacIyJ/8n+15f0JggCZmLkGY8UfJDe2aSTD/beIrAwTp0=
X-Received: by 2002:a05:6102:4b1b:b0:4b4:6988:b12b with SMTP id
 ada2fe7eead31-4ba85f83342mr1232055137.23.1738905168219; Thu, 06 Feb 2025
 21:12:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-0-297eacd0d34f@quicinc.com>
 <CAFA6WYNGH_LP-R4hQx-+XMY3zFN74ij-JngwnuKOsz8=r_-bsQ@mail.gmail.com> <f3b30e00-d6cd-44ee-88a5-e5a523563bb3@quicinc.com>
In-Reply-To: <f3b30e00-d6cd-44ee-88a5-e5a523563bb3@quicinc.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 7 Feb 2025 10:42:37 +0530
X-Gm-Features: AWEUYZkJm1RihC28R4o1haiyj5l-eJg1q_e1aaNfSATrdDF3p0v_A4C4GrMIZlI
Message-ID: <CAFA6WYMhyDLmFaZMWd3TFfNTnujAN8ZuzguPgzjJXfhZf2ZnKA@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] Trusted Execution Environment (TEE) driver for
 Qualcomm TEE (QTEE)
To: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Feb 2025 at 01:25, Amirreza Zarrabi <quic_azarrabi@quicinc.com> wrote:
>
>
>
> On 2/5/2025 4:38 PM, Sumit Garg wrote:
> > Hi Amirreza,
> >
> > On Mon, 3 Feb 2025 at 08:14, Amirreza Zarrabi <quic_azarrabi@quicinc.com> wrote:
> >>
> >> This patch series introduces a Trusted Execution Environment (TEE)
> >> driver for Qualcomm TEE (QTEE). QTEE enables Trusted Applications (TAs)
> >> and services to run securely. It uses an object-based interface, where
> >> each service is an object with sets of operations. Clients can invoke
> >> these operations on objects, which can generate results, including other
> >> objects. For example, an object can load a TA and return another object
> >> that represents the loaded TA, allowing access to its services.
> >>
> >> Kernel and userspace services are also available to QTEE through a
> >> similar approach. QTEE makes callback requests that are converted into
> >> object invocations. These objects can represent services within the
> >> kernel or userspace process.
> >>
> >> Note: This patch series focuses on QTEE objects and userspace services.
> >>
> >> Linux already provides a TEE subsystem, which is described in [1]. The
> >> tee subsystem provides a generic ioctl interface, TEE_IOC_INVOKE, which
> >> can be used by userspace to talk to a TEE backend driver. We extend the
> >> Linux TEE subsystem to understand object parameters and an ioctl call so
> >> client can invoke objects in QTEE:
> >>
> >>   - TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_*
> >>   - TEE_IOC_OBJECT_INVOKE
> >>
> >> The existing ioctl calls TEE_IOC_SUPPL_RECV and TEE_IOC_SUPPL_SEND are
> >> used for invoking services in the userspace process by QTEE.
> >>
> >> The TEE backend driver uses the QTEE Transport Message to communicate
> >> with QTEE. Interactions through the object INVOKE interface are
> >> translated into QTEE messages. Likewise, object invocations from QTEE
> >> for userspace objects are converted into SEND/RECV ioctl calls to
> >> supplicants.
> >>
> >> The details of QTEE Transport Message to communicate with QTEE is
> >> available in [PATCH 10/10] Documentation: tee: Add Qualcomm TEE driver.
> >>
> >> You can run basic tests with following steps:
> >> git clone https://github.com/quic/quic-teec.git
> >> cd quic-teec
> >> mkdir build
> >> cmake .. -DCMAKE_TOOLCHAIN_FILE=CMakeToolchain.txt -DBUILD_UNITTEST=ON
> >>
> >> https://github.com/quic/quic-teec/blob/main/README.md lists dependancies
> >> needed to build the above.
> >>
> >> This series has been tested for basic QTEE object invocations and
> >> callback requests, including loading a TA and requesting services form
> >> the TA.
> >
> > Thanks for sharing these test user-space applications/libraries. Can I
> > know which platforms are currently supported by this QTEE driver? I
> > would like to run and understand the overall stack on a real device. I
> > do have rb3, rb5 and db410c on my desk to test with.
> >
> > Also, platform support is important information you should put in the
> > cover letter as well as the QTEE documentation.
> >
> > -Sumit
> >
>
> I have tested it with sm8650-mtp. But would expect it to work with any platform.

Good to know that I will try to test it by next week on one of the
available platforms on my desk.

> I'll update the cover letter with the details :).

Also, put it in QTEE documentation too such that people are aware
about supported platforms.

-Sumit

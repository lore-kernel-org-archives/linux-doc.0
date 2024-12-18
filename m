Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB737224F6
	for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 14:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734531971; cv=none; b=tUGQxb5ZUUvUQZzjMKeYXCxxRW3+Zzn7ltjyFi4j1qfsopWp1xYjudWXl0ufHezKXCxOJbsp37zcLb4sxMP9rZ9ykjugjyJ37iEChkdc679qxSRIICsg7HR9wsqzFx5lYEA9rtrsh2njis9oJ184QZbuyGB8/83fPgjYAO1Ly80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734531971; c=relaxed/simple;
	bh=oQJlOO10JOYWC6Lqu2aCp43hXfw4dXZVHbxIFY+FHmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VikHVE51fHXi3+2BzqI8lVsTxg4JirtwcBwxLS6JZbrNOKxZKHqw+P2wRHxmm5oqo7+8fKGBPwY2qdT64jo2wRfiReDAs7l+Z037BOajCm3X24AKrGVpaleQeTLPgPGIRO0sqUyVMqVi2MtzYsMkgrrpze/w7yNl8imldsLMiqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JNgQx+Xw; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JNgQx+Xw"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4aff620b232so1921045137.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 06:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734531968; x=1735136768; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V5Wt61ODIx6B1h8kD4uZvow1+HXs8Ji77hcMjnjVf2M=;
        b=JNgQx+Xwi30ipHNRO0o/3sy8m/P40ilWdgY6MPQq8SGphEOxSYVXkpjf4FaFeDIMqf
         O+iH5r9GEH98cJ/aerepJ7667pa0EnQMjEz2Gi1714wXmJk96mL9ESE3Ca+Vwu0ziOLV
         m6yY0d6c2w4D0STGR/2QNRmThTLEOeTrpAZKKbQI+D8FYscg+phaSjUmclaRMhNjMbxP
         LDNNlx6MTBWeq7gQdDA6G6m1pUQjt4488q8k4OcXIfssdJp5i08bUQkE5DDMvQKyO1IR
         tzwzGbK8LgekjdjGi9c97fmdxVQmuFfsiHwez4V8fk28tKF2FOm0ODFrOPGSMbFSKDdw
         BZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734531968; x=1735136768;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V5Wt61ODIx6B1h8kD4uZvow1+HXs8Ji77hcMjnjVf2M=;
        b=pDOfJOt5j7ANS3om1Cnnp4cjOtH+nCBpWyOdslVLaCFkVqJRCefZnF9EG2bwBTMGDT
         MChF7e9T01LU1wDJYaifRzBztYJ+9t+rLiUu82IMgtZ3fJjZgnPIh3kw/6Dxk63F+3+S
         vtCudRh1BHn+w+/+u5XB+qap43Ozdyn5MjqdTDY54VE7uVBAenHsqB2dtPpKo4TM/zVG
         fhEn1pUICy84zPgm/VuivCPVh49fKdbuIX4ECL3IDUmshjyR+NZA3W8EiqZ/GG8SVVrp
         h8FtMD/TI+VJqKDrgbd8/cIpKBQXOGG3Ag/kCtMQWCkzsUfCjyUkxrtqtWFs28Y8xYhS
         6r8w==
X-Forwarded-Encrypted: i=1; AJvYcCWSrAdHe9dW/FLda/9rjgajazfHR4VhtluFATZjzQklbdi1uu8w5P4iN93Xynj/Xybd5FQeo998DiY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0bJL5B/RF48gNz6W9BC+qYzZx680CWEG9tDQDux2yER/kT8Lv
	6mSqN7YrqWgVTzIegrgU2dhT4rlhWy+tLrvIOKNzv9RtTZt1HdzSHQeNUE6WpnKEGj3Ix2ZvZeM
	tzJ4+ihb1RdSttFo7ekKFSm4TWIAmC9oXloF3Kg==
X-Gm-Gg: ASbGncvKEM++pysEzjhvTvKyTs++ekuidzHy4yhgxul1v2fop3KrnDu9PtjKvcHy55M
	CcYHmV29PWrdIPnLzWCOFoimKE97g4fdKYZpjPZU=
X-Google-Smtp-Source: AGHT+IHhXmp1oLpn05T1jwNDGZudSP2TrdWjhIpZLR5npDAeXO5zpJZTGOUCB/SClyyeCwmKQYes1CtcAvHgcT0VH0A=
X-Received: by 2002:a05:6102:8001:b0:4b0:4d6:bff1 with SMTP id
 ada2fe7eead31-4b2ae7824ecmr2291144137.14.1734531966256; Wed, 18 Dec 2024
 06:26:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-0-f502ef01e016@quicinc.com>
In-Reply-To: <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-0-f502ef01e016@quicinc.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 18 Dec 2024 19:55:55 +0530
Message-ID: <CAFA6WYMbDExfCD4PAPQCF1HKKxjDH5FcLpnnBBrwayCiY0SkTg@mail.gmail.com>
Subject: Re: [PATCH 00/10] Trusted Execution Environment (TEE) driver for
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

Hi Amirreza,

On Tue, 3 Dec 2024 at 09:50, Amirreza Zarrabi <quic_azarrabi@quicinc.com> wrote:
>
> This patch series introduces a Trusted Execution Environment (TEE)
> driver for Qualcomm TEE (QTEE). QTEE enables Trusted Applications (TAs)
> and services to run securely. It uses an object-based interface, where
> each service is an object with sets of operations. Clients can invoke
> these operations on objects, which can generate results, including other
> objects. For example, an object can load a TA and return another object
> that represents the loaded TA, allowing access to its services.
>
> Kernel and userspace services are also available to QTEE through a
> similar approach. QTEE makes callback requests that are converted into
> object invocations. These objects can represent services within the
> kernel or userspace process.
>
> Note: This patch series focuses on QTEE objects and userspace services.
>
> Linux already provides a TEE subsystem, which is described in [1]. The
> tee subsystem provides a generic ioctl interface, TEE_IOC_INVOKE, which
> can be used by userspace to talk to a TEE backend driver. We extend the
> Linux TEE subsystem to understand object parameters and an ioctl call so
> client can invoke objects in QTEE:
>
>   - TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_*
>   - TEE_IOC_OBJECT_INVOKE
>

Thanks for proposing to extend the TEE subsystem. However, I couldn't
see any user-space library or test application(s) to test this new
IOCTL. Say for example how will someone with a board based on sm8650
will be able to test the QTEE interface? IIRC, last time we agreed off
list that you will be pushing that alongside this patch-set.

-Sumit

> The existing ioctl calls TEE_IOC_SUPPL_RECV and TEE_IOC_SUPPL_SEND are
> used for invoking services in the userspace process by QTEE.
>
> The TEE backend driver uses the QTEE Transport Message to communicate
> with QTEE. Interactions through the object INVOKE interface are
> translated into QTEE messages. Likewise, object invocations from QTEE
> for userspace objects are converted into SEND/RECV ioctl calls to
> supplicants.
>
> The details of QTEE Transport Message to communicate with QTEE is
> available in [PATCH 10/10] Documentation: tee: Add Qualcomm TEE driver.
>
> This patch series has been tested for basic QTEE object invocations and
> callback requests, including loading a TA and requesting services form
> the TA. However, the test platform is currently being prepared for
> upstream availability and will soon be accessible to the community for
> further validation. I will share updates as the platform become
> available.
>
> [1] https://www.kernel.org/doc/Documentation/tee.txt
>
> Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
> ---
> Amirreza Zarrabi (10):
>       tee: allow a driver to allocate a tee_device without a pool
>       tee: add TEE_IOCTL_PARAM_ATTR_TYPE_MEMBUF
>       tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
>       firmware: qcom: scm: add support for object invocation
>       qcomtee: implement object invoke support
>       qcomtee: add primordial object
>       dt-bindings: arm: qcomtee: add QTEE driver devicetree binding for TEE subsystem
>       tee: add Qualcomm TEE driver
>       arm64: dts: qcom: sm8650: add support for QTEE
>       Documentation: tee: Add Qualcomm TEE driver
>
>  .../devicetree/bindings/arm/firmware/qcom,tee.yaml |  34 +
>  Documentation/tee/index.rst                        |   1 +
>  Documentation/tee/qtee.rst                         | 143 ++++
>  arch/arm64/boot/dts/qcom/sm8650.dtsi               |   4 +
>  drivers/firmware/qcom/qcom_scm.c                   |  60 ++
>  drivers/firmware/qcom/qcom_scm.h                   |   7 +
>  drivers/tee/Kconfig                                |   1 +
>  drivers/tee/Makefile                               |   1 +
>  drivers/tee/qcomtee/Kconfig                        |  10 +
>  drivers/tee/qcomtee/Makefile                       |   9 +
>  drivers/tee/qcomtee/async.c                        | 153 ++++
>  drivers/tee/qcomtee/call.c                         | 707 ++++++++++++++++
>  drivers/tee/qcomtee/core.c                         | 942 +++++++++++++++++++++
>  drivers/tee/qcomtee/primordial_obj.c               |  63 ++
>  drivers/tee/qcomtee/qcom_scm.c                     |  36 +
>  drivers/tee/qcomtee/qcomtee_msg.h                  | 217 +++++
>  drivers/tee/qcomtee/qcomtee_private.h              | 218 +++++
>  drivers/tee/qcomtee/release.c                      |  66 ++
>  drivers/tee/qcomtee/user_obj.c                     | 625 ++++++++++++++
>  drivers/tee/tee_core.c                             | 113 ++-
>  include/linux/firmware/qcom/qcom_scm.h             |   9 +
>  include/linux/firmware/qcom/qcom_tee.h             | 284 +++++++
>  include/linux/tee_core.h                           |   4 +
>  include/linux/tee_drv.h                            |  12 +
>  include/uapi/linux/tee.h                           |  54 +-
>  25 files changed, 3765 insertions(+), 8 deletions(-)
> ---
> base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02
> change-id: 20241202-qcom-tee-using-tee-ss-without-mem-obj-362c66340527
>
> Best regards,
> --
> Amirreza Zarrabi <quic_azarrabi@quicinc.com>
>

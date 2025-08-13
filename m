Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEBC2DEA7D
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 07:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755071383; cv=none; b=VIYe5Ud9clY6scC7CdRyV3pIGM6Y2WpAWtxo6jfnFGP5YhqmDOioC3NhOKkkDBRJLdpOxfbNJ/wcG8SinjB8ikTmO/Zx7GSWg7huV2CNyC/L9LInpjOtJOAuLTTqxW2BH2jjnFQtXtP/KA9S/RD7zUtjZ4D4+wuc4E4UXU3rJwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755071383; c=relaxed/simple;
	bh=wfeJn6OXLOSd2GklhvEK2KXBF/te/QhNlLJRLLpT6NU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MdYOQegietpMfZcXwVr5Db4GeCPDxartOWbL++pE2LvOkyqbNqF/d9BjGRWQYnZt/FTWN1jWN92K+XJH0TCHqS+7lrDD+BDI5/0dW5jFbfeZxA1oq0DPcgOXDdTK4x0MEc76WeHPYP16S9HL7FkTMRWxFxsju3n+5FJqsP8Ssvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XLyuCYqE; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XLyuCYqE"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-61b7e44f8b3so722739eaf.0
        for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 00:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755071379; x=1755676179; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wfeJn6OXLOSd2GklhvEK2KXBF/te/QhNlLJRLLpT6NU=;
        b=XLyuCYqEnk9yF8JdXGunyN+ujw1Fymw1txYThuFHVO2alhysN1K4UCef6XGGbyw5it
         2w0IztDtFaXf65o16a9X5/C6QcWHc/D94mgHCUwA34dngIcBBdYYDnV54lk3yrY6Si7x
         gIewLX3Vp/4GbAGHr/ZjpbHAauw2rtEsgLo7/PNdYPphtnLTjL1YCQiJFlIzHn6ofNsW
         nD76UpLQUHYCKuBeJiR8PSOAuOchc/t5lZ7/SIK75NQw5Fir5TTIkgblpdxglIh/dcZm
         i19+M2atTq0+VCm9ibcrVebj29D6Bute5K5CHRYwwqLlty+2MyY5WNCJ0vWDrPpSnkAv
         mkkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755071379; x=1755676179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wfeJn6OXLOSd2GklhvEK2KXBF/te/QhNlLJRLLpT6NU=;
        b=UU/5P3BppuM/LzeKR20frwTWIAbuj/rsCYzCLWBsNMu+V1f1kFAClKdnuHNi047W31
         2Fx8ZPK7zFy5M8EJXbn0pGWJgfEWTzumR1W3tJY2vfGP9Kgdo1DnPuqfaw6xRnV50HRW
         dDf1Nob7Nb2kcJXeSvpvHPP+VwxrtcTRfXxJg17HSHJiweK0h+dVUTu8xRKvAzixGnCd
         EzI6MYIOcuSBpvNOFYgekbJmlhVZAqzZ11WVbR66A2hGtjwN/nfm7wTTknYc5g9q0dJm
         SMgxS2cbbCSSQPEWemYvKK33RsUHstoz5Xd8FQKxrBe1nJ3C6tQqJJ3EWuiV3m+w2G3N
         b/ng==
X-Forwarded-Encrypted: i=1; AJvYcCX7+kWgtL6SB4nYNfXEQzx03TFbeIT48KLnr3Vd78Z1cS+2xWCKPlB5RJAnNLSC1RXjLeZ1ZRXSMHI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfcPJ915Lv76aX7wFsnuu6NxS8RDJ8NVNCBnPduwZn96cqp9VH
	EU3cAqaebdwDu/hkA5j5ueZKbBhxbrjbU/wE/KkKgcX7XvoBcG9z2+Mbl3CeOS9wRbLnMWXEvm6
	Hkhfmtlj7lPyVsh2nzQz2Vwyr+QMaBuSHV7eCgoYJmA==
X-Gm-Gg: ASbGncs6adE/up3KaxYxqfJpb001FpY6VZqfJ1QKUr5DDItkrDjm6Ab+ryh7Emnc2ws
	KHYdPTLA5wZzsE1qTIUCxlySYqBm2rX8DlfjXa10an291NvVBM3jbXnUq3eiN0RiyZSx2K/uGI0
	Dwz/9v/hpH3MpQ9qeLFlCb3BqzFxyr2gUBKf8B9i1lRqUw2NVBISIvdC8KLfNVbX3PlwYlU8pXR
	pdedfw1pKUjozVWeu8=
X-Google-Smtp-Source: AGHT+IFAfPPXVnV/fIsv8KnI8b8Bl+IOsf+U5t0pmvRJM0gZ8xG3AukFt3DXdXVb9aF/gWZVqDSUuTyRuSP2uDtgU3s=
X-Received: by 2002:a05:6820:1ac1:b0:619:a6c0:b4b with SMTP id
 006d021491bc7-61bc758538amr1013523eaf.5.1755071379266; Wed, 13 Aug 2025
 00:49:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
In-Reply-To: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 13 Aug 2025 09:49:27 +0200
X-Gm-Features: Ac12FXyfvHrDtrackOzZC99WcBb71C_WC3_DT2d5Ppi_3YWKQtwtthH808vWulI
Message-ID: <CAHUa44FJ9iRMyDHffRBwgxxX27vTwsAwNiCCEGQ8fMQPZS_D+g@mail.gmail.com>
Subject: Re: [PATCH v7 00/11] Trusted Execution Environment (TEE) driver for
 Qualcomm TEE (QTEE)
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Sumit Garg <sumit.garg@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Apurupa Pattapu <quic_apurupa@quicinc.com>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Amir,

On Wed, Aug 13, 2025 at 2:37=E2=80=AFAM Amirreza Zarrabi
<amirreza.zarrabi@oss.qualcomm.com> wrote:
>
> This patch series introduces a Trusted Execution Environment (TEE)
> driver for Qualcomm TEE (QTEE). QTEE enables Trusted Applications (TAs)
> and services to run securely. It uses an object-based interface, where
> each service is an object with sets of operations. Clients can invoke
> these operations on objects, which can generate results, including other
> objects. For example, an object can load a TA and return another object
> that represents the loaded TA, allowing access to its services.
>

There are some build errors/warnings for arm and x86_64, see
https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/jens/plans/31DmCOn1pF=
2JGVDk3otBOXOL6kV

Thanks,
Jens

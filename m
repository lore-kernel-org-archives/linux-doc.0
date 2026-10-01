Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E4226982C
	for <linux-doc@vger.kernel.org>; Thu,  1 Oct 2026 07:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790840083; cv=none; b=Ap/wlzACV7piCjP4BNM1KfvMoYbM/5ngr9oQKzodWSIHNCykfSqHFaekO6SCB3gLnx1x/DgctAs6M4wF4NUFMn+Xtmui1MpC0G+p4msUez6P2XdCJLSk7lBnlQvQbZU2BNd8w07sbdv7Xmj5VFYys117EGLIsTamzGfvJvk0j9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790840083; c=relaxed/simple;
	bh=kuV33l73kgCfxMXZpX+G6jMpAhtpEBO72ZuYilyuWkY=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U37GlI0VpNRyGx5c8IMGlDr3Os4yjJQEaViVg2GogUH0X9OmPndcWU+a19bGP+MLT1xH6zOGV3TCyFKRyYpPdfxjWR30bwWkFKX5seuj08nB7TmABZwKb4Dcr7I9nncn345bmcDWordl1yjfIKFcYVTjfmP2wegiqEqu8duTwJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QfyM4xSR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QfyM4xSR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EBD21F008A1
	for <linux-doc@vger.kernel.org>; Thu,  1 Oct 2026 07:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790840082;
	bh=kuV33l73kgCfxMXZpX+G6jMpAhtpEBO72ZuYilyuWkY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=QfyM4xSRlKStaeo/bShD69v/jI3OoLIt9RIlKAxFj08Dl+wLGEQBSqAvQhCoRjKGk
	 LoKxGHq+CxrS9V2uPd4C5LVxuMTeyD/4DL9PTaaXXBcaF2qhNh1u33Mb0Tmft89/y4
	 JK540dc3kMHcoBdpmpzys4aF4Nkaa0kf2vhA6a8+g5l0P2qVUnQsbNT5YoHFfupbRo
	 3LUkl77zt0THmf0rxul77MMD9Mzv5USAhLR7J4SHkujvTjrVFs1pOrtS9bS9hk3jHW
	 gyZ/cyJI1HqruFwWPwC6FAOzyMxVeGrl5UkQeiFG5RTWufhU4paN7KN7JEuBJimpfG
	 4GtqckmA4KRMQ==
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a652b710a5so60913441fa.3
        for <linux-doc@vger.kernel.org>; Thu, 01 Oct 2026 00:34:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxYILdQVZL7SAC/JWirSQAYTHyDR+CmaATqScqAYhPr62Wq3bcJjf7JNjhi/6g3PUtl/lCJFNugDA4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcnb1i7DqqD9sEWBa4QCin26k3hTBoubiOAjjY1Kwnqncdvhl9
	buqXO3Pa6uB/j7eXYTqEc8Bjx0+ocKKfKDmHvB100oGg/xozHcYcJNtBLo+QeWgSsaYnAtlNc8N
	zDgbo3uYbOWo373cPDwdZIwP4BPTWYthPdXXkJkJZyw==
X-Received: by 2002:a2e:b8ce:0:b0:3a6:6aad:be45 with SMTP id
 38308e7fff4ca-3a779206b12mr11576161fa.10.1790840081040; Thu, 01 Oct 2026
 00:34:41 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 1 Oct 2026 10:34:39 +0300
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 1 Oct 2026 10:34:39 +0300
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260723-qcom-qce-cmd-descr-v24-1-4f87bb4d9938@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com> <20260723-qcom-qce-cmd-descr-v24-1-4f87bb4d9938@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 10:34:39 +0300
X-Gmail-Original-Message-ID: <CAMRc=Mc9O-wgeWGNgEW45p5YumdkBwKf7_Zkrgw1=r3Pn8QTPQ@mail.gmail.com>
X-Gm-Features: AclHuK9Cfoeox9K-SbC3OnT5eZecFWUtZX-vzEsZcBWrrPHwk34664gyCfLJNQY
Message-ID: <CAMRc=Mc9O-wgeWGNgEW45p5YumdkBwKf7_Zkrgw1=r3Pn8QTPQ@mail.gmail.com>
Subject: Re: [PATCH v24 01/14] dmaengine: constify struct dma_descriptor_metadata_ops
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Vinod Koul <vkoul@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Thara Gopinath <thara.gopinath@gmail.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Udit Tiwari <quic_utiwari@quicinc.com>, Md Sadre Alam <mdalam@qti.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Peter Ujfalusi <peter.ujfalusi@gmail.com>, Michal Simek <michal.simek@amd.com>, 
	Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@codeaurora.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Jul 2026 19:09:07 +0200, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> said:
> There's no reason for the instances of this struct to be modifiable.
> Constify the pointer in struct dma_async_tx_descriptor and all drivers
> currently using it.
>
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Vinod: this patch is independent from the rest of the series and the BAM DMA
rework. Could youtake it for v7.4 as I won't respin the rest of the series
before we get the QCE fixes in anyway?

Bart

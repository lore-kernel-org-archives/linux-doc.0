Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566773F7ABD
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 13:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774357557; cv=none; b=cwkFXb6mu4sr3CeKGSpxpbWZHVHV09anCQmIT2gUnnlKO5OoU0jZXRiaf/c5mo7im48W4h6ET/U0ZJw17gaxQdxCzaELw9ckKVyr4Udqt9GrTOa+WQFjLUTCUHaPDchUGAj5gYWXF55uTCGg9caFTi42yHcIGmfyeDKrbhVKEsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774357557; c=relaxed/simple;
	bh=cw7XrKGnbZgtS8pgMWwXTOKSgj52ibjy+qLdH1G/JKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OgbGkWE+vd9buTlBB167VswRr0JtSkFXbe0QmLkAhEEZ/HADSaJBFti5CZAUPPX6wwUtlBi2QHHP6MwknNV+KnAIohrESDKux6QAgnq4qtD5frVcSl1a53XcjU/ZxETjQmCDL979klsLQNR9qd7zCZodb8aFKFYwRp3uX/2uR2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=bVuM8NHo; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="bVuM8NHo"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439c6fc2910so992822f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 06:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1774357555; x=1774962355; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cw7XrKGnbZgtS8pgMWwXTOKSgj52ibjy+qLdH1G/JKw=;
        b=bVuM8NHoZV50ZFj9OagRUGXJyS3nVAzC6XcpeTbnAFals5IF/fB70YMGhn4GnfnS7d
         1WeL2D0NskAabQ/EKXp8kHU9Ic1H2QASEdVcN3aU/w8SfEylfztJLnWs1WRjFGTyBHC/
         3LO+Aqqh65k/Jq7xqGmHzdZXWm8BsP5z8MrgCB72Ie92T+fZ8re8xFEPHxz1Y7twTxoA
         HUybpoztHaIP50ikrUpcXd128Wi2MOwoNibcUYvaNaGPBe02qvCicW12NDhksSNxH1ud
         mqPIX0YwEtEI4QwX+Y7L9jGjcx84zNpWM2rfvc/pz3KMEfGwV1bDDrrv26WsnR/vxxEi
         dS3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774357555; x=1774962355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cw7XrKGnbZgtS8pgMWwXTOKSgj52ibjy+qLdH1G/JKw=;
        b=fzFE5IZzlrTNkDbj3/qqNiPlFiAtnNvLEn2QKkOAEfiTQqfOIKHR6tVF/YCvY+Zp5l
         iho/CivqZc3w37GecWw1aw+YDfZJVSyAMJapZgO2sur2JjH6mZP45vzYcxF+NWBX17+M
         BYBoNdSUjS7rGeTyWVAmVcf6CeXtBSgbUAZFC5PCkdurRaOfYGH8AqxBJkdznuCmjGUZ
         Rx3jPzx6cN2ebf5/nBcFbpLe2qYqI4MjMzziCTxtDLuT46Q0I4jz5/jLxXSzgPZrVpbM
         KFQUbDdf/B56nT8hpVkhHYAmwVcJxBwqcM2QT4GvuvGwc4WIonIbMUV+hp/dac4TaiZ+
         CDvA==
X-Forwarded-Encrypted: i=1; AJvYcCVa2dh9hFHmVlYj/+gffow4e4rUBt0iSZJPeGE123IDGsx/AmralEhjjhLkCaus4xcUWAjqF5gqa6A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOCTwMzz1zLlAIO1GYL+dWiiMynpEKhQ81wkAjxjgHEQp+VEbK
	gQlLpxLKv7v5IoEKDxbYJNmlQ8Ue7txrgsVMPzH2t6HS1SdOW3wGWwhZSS4J51S7CTM=
X-Gm-Gg: ATEYQzzwMCEumJCDr9erAIxlch0mVqET8Yof3seAh7YEOrIFEtFmOhMGddvMivp7l15
	/xIXFRo/sAKi4HUB4mYIhjASDKRhExm7sydmGYX23gbsIYYKE4n0SiQwbOYYWnFUJvbzQpT82uN
	XgOqutWUwcBeD8PdSXln7yxQkC3ztfRoCu2fjQeJjB9Fm2oS9YP5T4SRhS393dRjqNb4gH83chk
	ZxaYHQlYh4a5tjYlqMWhTbzdQYrBDB7o2LX29d8DDWGaReNyk5V3m+DFDTw7vQf25/J6ldUHDUY
	xBlof2bOBAODA71dnDUWwyMHxsHzBC3AD137Z70pPxx5pBDPVzuLjYA/MBgn/HSZn9aKL2H+k35
	K/vJiXk7IBXmfYJRhaav1mZv3msf8nJFs/RtOiHrmDmZVJJNsDNWNknRyTjJxis7cKa3a1o55Yx
	KRl213MWpfmRVUpAJ098cXUf3VWaj06iu9L2qnK1IZZOmngA==
X-Received: by 2002:a05:6000:26d2:b0:43b:3d4f:e18d with SMTP id ffacd0b85a97d-43b64287044mr25237105f8f.39.1774357554406;
        Tue, 24 Mar 2026 06:05:54 -0700 (PDT)
Received: from FV6GYCPJ69 ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470f902sm39989765f8f.28.2026.03.24.06.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:05:54 -0700 (PDT)
Date: Tue, 24 Mar 2026 14:05:51 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Tariq Toukan <tariqt@nvidia.com>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Donald Hunter <donald.hunter@gmail.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>, 
	Chuck Lever <chuck.lever@oracle.com>, "Matthieu Baerts (NGI0)" <matttbe@kernel.org>, 
	Cosmin Ratiu <cratiu@nvidia.com>, Carolina Jubran <cjubran@nvidia.com>, 
	Daniel Zahka <daniel.zahka@gmail.com>, Shay Drory <shayd@nvidia.com>, Kees Cook <kees@kernel.org>, 
	Daniel Jurgens <danielj@nvidia.com>, Moshe Shemesh <moshe@nvidia.com>, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Willem de Bruijn <willemb@google.com>, 
	David Wei <dw@davidwei.uk>, Petr Machata <petrm@nvidia.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-kselftest@vger.kernel.org, Gal Pressman <gal@nvidia.com>, 
	Jiri Pirko <jiri@nvidia.com>
Subject: Re: [PATCH net-next V8 01/14] devlink: Update nested instance
 locking comment
Message-ID: <owfpttw4n7ft5gisy4gvmd7z22hcafjlcr5i3e4t22j4w3rgz5@drxvpqqmiuen>
References: <20260324122848.36731-1-tariqt@nvidia.com>
 <20260324122848.36731-2-tariqt@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324122848.36731-2-tariqt@nvidia.com>

Tue, Mar 24, 2026 at 01:28:35PM +0100, tariqt@nvidia.com wrote:
>From: Cosmin Ratiu <cratiu@nvidia.com>
>
>In commit [1] a comment about nested instance locking was updated. But
>there's another place where this is mentioned, so update that as well.
>
>[1] commit 0061b5199d7c ("devlink: Reverse locking order for nested
>instances")
>
>Signed-off-by: Cosmin Ratiu <cratiu@nvidia.com>
>Reviewed-by: Carolina Jubran <cjubran@nvidia.com>
>Signed-off-by: Tariq Toukan <tariqt@nvidia.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>

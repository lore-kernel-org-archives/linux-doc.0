Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253C47C0AB
	for <linux-doc@vger.kernel.org>; Mon,  8 Apr 2024 12:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712580252; cv=none; b=dn3RldjaMuWAqnKcZvauppUtodlP669qLjxOFDSRCV+oJnDQItoVlCBNtOiEakvkaTZ07dEzh0tPVY7TPAOovIMXTLaH2STSfJRLwZvFkzbo0ncbqp9qO+T+sF0oMxcfx2oZJIvB2nnMQKgjxjvfudqdcpO9O0JBqe2Ir9FQh2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712580252; c=relaxed/simple;
	bh=Zr+1C6AMrdIdosUk3eIJmCBfHO6COi5oAT0Uj5E0hjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YlTot+8IWs/d5W584fQHeM2az8O+utaPbMIu8G8xNyVQLiHvT3c8AnNhMex1HcCNDmpsfALzBONch1GjO7vP8X4jowTU0JyfD5jQn8fvoOkvfxEJnX3FJKq1T7xJBRgGMjU0r1OMmw/mLPGWQaLekuxqs4sL2Xw4smYOMrNDXWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=XK9zbzRN; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="XK9zbzRN"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4166d6dab3dso6480195e9.0
        for <linux-doc@vger.kernel.org>; Mon, 08 Apr 2024 05:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1712580248; x=1713185048; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zr+1C6AMrdIdosUk3eIJmCBfHO6COi5oAT0Uj5E0hjA=;
        b=XK9zbzRNwU56eqUuNS4GVi5MqnTbKrL+/uUiO/N830DiA2Izzm9OHB1kZKdLiuCYub
         WjvAILRuxnUE1f3WwlylOxOjUpdNfEHVX/SrpwVpxJrbx+QK6uUQbUKO9EATMYXuSru2
         9onpWbGHatDtZJchycDemEDi7akLO+AFeXRcim4kv1dDbEL08TGimQ3mbSPuZ1kKKEIr
         zH/kv8il0Gk2G4vIRF3/p0dmnOlqruvB022Z8lVxZz9PKgjGxomjxI+zNeAIux1+ejAn
         QIO27jUabXt+n0YeNafoGAPMpnX0IpL509oeOg3M1wlAtCIHLrt3bKcnk4EKjdz6Oo9L
         G8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712580248; x=1713185048;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zr+1C6AMrdIdosUk3eIJmCBfHO6COi5oAT0Uj5E0hjA=;
        b=ib8XnsE6LWovxFB7gh0KX6/U/ZDy3hs4bdFeIuE/69pmQYtJ8m1/8+HfuQNiReoapD
         eJ1P1IM8/rRnfJgNqMDv1knTIBqYWUO3ttuNlP/M9OL35kxFHT9I6TaHUE20pwREmlB9
         X26w2n8TYmci/M6ePU+d/V6E4swtwOmU3gD7aRe6hcnyCgv4wAUr/O3GZ1uHpKJVHc3X
         0IfiXlySHCUCRMjdQiA4mTjN0QywJP1fEa933nl7diEQVRerhDP2qICrK0YdW3gmgwdu
         OPaD4D6RADF+oyUsStfJwEZsOMUPkO82NrOs49ICku6/7Y10yO+IhO56T8kvGU1pE16Y
         4z7g==
X-Forwarded-Encrypted: i=1; AJvYcCX+aMaxMy38dKBGAasSdzRUdXYLrdEcgMHN8OxIX3IIKYwhifsc6IVviCImX+uv8KsctlvDFi/Ng9PoT2h7LGLghgrWiR9r11jE
X-Gm-Message-State: AOJu0Yw+HbZUNiwXzhfuepuz83nzA6mmB6MnCtlTBKnpMDuwuhO1wk0l
	tDlBx9jK2kawNBDnt1fgSofGed9diPbfzrKvJyXw2AZnLDfyYa5TGzVa2XzmElo=
X-Google-Smtp-Source: AGHT+IGT3I51sbHihk12YlzaY/nd+QTgAV3yBeDem8Fp22k5JGBZfOnoWf+LgfjLwQxeK39XA4/fWw==
X-Received: by 2002:a05:600c:a42:b0:416:1d6d:dc6d with SMTP id c2-20020a05600c0a4200b004161d6ddc6dmr6057461wmq.40.1712580248295;
        Mon, 08 Apr 2024 05:44:08 -0700 (PDT)
Received: from localhost ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id u10-20020adff88a000000b00343e01d3f6dsm8882182wrp.3.2024.04.08.05.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 05:44:07 -0700 (PDT)
Date: Mon, 8 Apr 2024 14:44:04 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Parav Pandit <parav@nvidia.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, corbet@lwn.net, dw@davidwei.uk,
	kalesh-anakkur.purayil@broadcom.com, saeedm@nvidia.com,
	leon@kernel.org, shayd@nvidia.com, danielj@nvidia.com,
	dchumak@nvidia.com, linux-doc@vger.kernel.org,
	linux-rdma@vger.kernel.org
Subject: Re: [net-next v4 2/2] mlx5/core: Support max_io_eqs for a function
Message-ID: <ZhPmlL_ptzw9PJ9z@nanopsycho>
References: <20240406010538.220167-1-parav@nvidia.com>
 <20240406010538.220167-3-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240406010538.220167-3-parav@nvidia.com>

Sat, Apr 06, 2024 at 03:05:38AM CEST, parav@nvidia.com wrote:
>Implement get and set for the maximum IO event queues for SF and VF.
>This enables administrator on the hypervisor to control the maximum
>IO event queues which are typically used to derive the maximum and
>default number of net device channels or rdma device completion vectors.
>
>Reviewed-by: Shay Drory <shayd@nvidia.com>
>Signed-off-by: Parav Pandit <parav@nvidia.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>

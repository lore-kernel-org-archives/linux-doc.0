Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141FF35BDC7
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 12:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784030553; cv=none; b=kzmQ7JrtHSz3EAWeUOhs8VEQr7DtN4IaCf6nXyq5azPRIMxGNzOXhAl2E4Hfbb1B2Zl3fenMjPlL6ILMRSJFkgvYx2m28LS+d0s+L5t/ROI/eOjuBu6zydXzofT2roNsMNWEHrDsu58cuzNsx9KQSk31UExNewsdyPqJP29H0rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784030553; c=relaxed/simple;
	bh=MxGbzJ1EXIdULAavSutQBPVkV2UhDVudqdZG1CWBmp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q9rAdlyxlBy5BbRMLgUSRxLRpXy6DlZtHw2f1WUQWdf3L51Fu9Tg9vnkXLqpIlJ8hPxYFsRbaFqzKgYReeWwTD+YYcMpHZOsP7nXDuKdcyYL6YiK25kvsGdebmE9fpFVbRQGxxl7G4aIm0Ypjw7jwMTD86B97AjmFmKtdcQXOlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=xloPNrV3; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="xloPNrV3"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493f75f7172so27833015e9.1
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 05:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1784030549; x=1784635349; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MxGbzJ1EXIdULAavSutQBPVkV2UhDVudqdZG1CWBmp8=;
        b=xloPNrV3q0dsouuiGc5bUzJJ6bnxilhSIXwGOplClvayzzm6Ah2r3bsykgU0U2Os+e
         wOWh+yiGW8fcuU5rky5Evy6iXTIQKcCkSFXY8KZImeB1J8C08m2oKYln9lIIznjY1Zct
         DJX0fzJ6KIV/CB93zTxcQbxy5cryxF3hXYiE/Li2nG8xF4M4cWevWZ1KIRG6WJpccxlI
         wfj9ddFB7N8Z4YP/NXHbxO3jvLO2x3sFRT5C/kD7Gl/jWquGXSRwOWmBIekE8R82irLb
         mvwtasVMxsK6/qlM5kwsHk9QiM+vbfmJsl5eDdtTO9E2m77O18rBN/wyfvOu+wigyu/q
         3tlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784030549; x=1784635349;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MxGbzJ1EXIdULAavSutQBPVkV2UhDVudqdZG1CWBmp8=;
        b=Ap0l/SFCFRks1HQvSjnb8ei7mUg4dAVkXMvUn78b6YSVb2s04LhgnNRLFh8XIAZR8N
         CiMcCy9woNCHlPEWY7+lVthOVI17lWunJTb9Ft4NLrMuEPm/0qcrf5ueYkdqE0B7CPBj
         ZUM5bz25tmqTU9rIpxfa7FqRpL2p4q6cqQIGDIAlCi73zIWBNzy11NuyTT2cTOZXY4ro
         1fcX4Kh8ldwfgx6TjYsg1AeWFplvlJCC85EWyzSsNxvv8Ne9duYbj+wqXBkJ+iH7x8I4
         aQKmt6D5b0gaZwLffK6inKGUJ/FlnsUpHZz8AYDaTi+2Jz8SKjlwWWuVmB+gWK33ziqU
         1jWA==
X-Forwarded-Encrypted: i=1; AHgh+RpXonuPiXdrroTB9ktxFMHVufOuxwRbRbAiRLuZWD0qGtDBbWcvv5o5QiECvbLimAvcmrvDbh+2KqQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTxpnbmBDT0hoBVoE9sX5N5KwWhkIXrYJxaO4t+kS2DrHu+/u0
	q8DrJBjYq82rs9rxMJcOofMhrhp10+IWwf22zDMBDgL8AcN0lvDzYCOmq+NcEgj36ts=
X-Gm-Gg: AfdE7cl/0YPgeGCT3s//wrMg9Z0nibHEISyLBoTbfoipGZMNB7yjKqebZw9ocm4Aaii
	Qlb2LYycrWrPc4JNUB+1eGyeU0D5ieQGyBY0nM4J+NeWTMYCnhEQahtqfFQg8WmtnT9DDvMVEQB
	Optuo+hmPlxhFTyRZokq8zK47EiuiiAxlz553+EVqzyBm7mnM21PAC4nWJ8pJzAjIQUt4yf+9+M
	koFAzpKtDJi9l/WdY4St7A+iP0+Mpa/6PUU4YTSlxaI+M6HUAv0rVDPI4Disxpcd9rGFZNDmeFR
	BUsw+TQnPFIExJtNhFMLBABbNq9FqSYft1NWdPsR2SwDcSkHfL1Hf4mUp5pLYWKNLctN/fWfKhc
	3U4ZVSm9eOD5rD7PQGkmJ6zUPMbaFjsXqw5mQyCdiRwpt8R1zol+IMWrwa/erqwxDiSy0aGE4Hy
	K5fX1I3SXpRXkIrsEal/rFGA==
X-Received: by 2002:a05:600c:6b17:b0:492:4a56:690b with SMTP id 5b1f17b1804b1-493f8834e5emr94066915e9.35.1784030548728;
        Tue, 14 Jul 2026 05:02:28 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635ac2esm7854172f8f.13.2026.07.14.05.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:02:28 -0700 (PDT)
Date: Tue, 14 Jul 2026 14:02:24 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Mark Bloch <mbloch@nvidia.com>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
	Tariq Toukan <tariqt@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, netdev@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next V6 4/4] devlink: Apply eswitch mode boot defaults
Message-ID: <alYkm08MpcIXnFl9@FV6GYCPJ69>
References: <20260714061731.531849-1-mbloch@nvidia.com>
 <20260714061731.531849-5-mbloch@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714061731.531849-5-mbloch@nvidia.com>

Tue, Jul 14, 2026 at 08:17:30AM +0200, mbloch@nvidia.com wrote:
>Apply parsed devlink_eswitch_mode= defaults after devlink registration
>and after successful reload.
>
>Mark the default mode as pending when a devlink instance is allocated.
>Before devl_unlock() releases the instance lock, apply a pending default
>when the instance is registered.
>
>Clear the pending state before calling into the driver so the boot
>default remains a one-shot operation even if the mode change fails.
>
>For successful reloads that performed DRIVER_REINIT, devlink_reload()
>already holds the devlink instance lock and the driver has completed
>reload_up(). Clear the pending state and apply the default directly from
>the reload path.
>
>Treat an explicit user eswitch mode request as consuming the pending
>default mode.
>

Looks fine to me now. One nit below:


[..]

>+void devlink_default_esw_mode_instance_init(struct devlink *devlink)


Forgotten "instance" here. With this fixed, feel free to add my
Reviewed-by: Jiri Pirko <jiri@nvidia.com>

[..]

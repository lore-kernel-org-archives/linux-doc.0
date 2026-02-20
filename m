Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA5E1946DA;
	Fri, 20 Feb 2026 05:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771565935; cv=none; b=Po34vzKW/U/XPU3+G2EISVsXWP29x5Kr0M0sV3JOthi/6s8aVfN8bUof52py9UyRDr6u3U9uVPFqv2kwzvKXtyU9OhuPWLV+eA4LKj6ehPDt+wgqx2pjeILRw93xgv1LMV3pVAF6w4m3A3+is0JPN8oLh3Let92PXYUL0kZwtP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771565935; c=relaxed/simple;
	bh=MgkXVoyfifdow5dWdFn7Cmv3BIbV02PItic8VTIrQRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=iCzJ9kTzoeg3sy1r00UaHb0bTSIjKSuHJI9XR60kslSMM5t4yQD9o60pDgElJT2SJS3kFbdhiRb9BdBH0LM5KKxwi1OnZwg1R2LcTzC5R/GhLMZbMFqLyZi1ekUbdH7731w65iYlxwavIhCcYfN5HmdQl/7jH8lFEFsjMHPl0is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mvel37h3; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mvel37h3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771565932;
	bh=MgkXVoyfifdow5dWdFn7Cmv3BIbV02PItic8VTIrQRc=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=mvel37h3e1h2Z9PCx2xLzs5t7XkpzO++DRs6r8eISiz3VKaO+UeBMAt1srv+IpR+4
	 iJis5AgiuJI0jzacLOwcZnd0ev+8TRxZ1aMoofA0reNznVLn01McO8tMJuqsSbmMsT
	 3cvivr4T6Gvu4HHJ02H78LQE2PRkHN2Sv6bdiQcnTOUJRN8wwqxv5sMTDCjtgBbZqO
	 lFLsf59t5jsyVcvfJeG+MVBHcidB+AokU0a0dL5/zkR0IU1C53qgMtQHVFzXhDVVtv
	 pksw7MFy0BfNe0v6/krjxkfAhr3MghUkx5iCceD7pzodwhiihZkBt/nuLUVcIRhPZ1
	 ttcjNXSUfWZXA==
Received: from [192.168.50.190] (unknown [171.76.81.30])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EB65F17E0D4D;
	Fri, 20 Feb 2026 06:38:48 +0100 (CET)
Message-ID: <b7f86ada-a74d-4fb2-83d2-5b4ef18e00c4@collabora.com>
Date: Fri, 20 Feb 2026 11:08:45 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/doc: recommend forking drm/kernel rather than
 uploading a distinct copy
To: Eric Engestrom <eric@engestrom.ch>,
 Helen Koike <helen.fornazier@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260219135645.261192-1-eric@engestrom.ch>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <20260219135645.261192-1-eric@engestrom.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Eric,

On 19/02/26 19:26, Eric Engestrom wrote:
> Signed-off-by: Eric Engestrom <eric@engestrom.ch>
> ---
>   Documentation/gpu/automated_testing.rst | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git ./Documentation/gpu/automated_testing.rst ./Documentation/gpu/automated_testing.rst
> index 62aa3ede02a5df3f590b..8a7328aef10ef39ee329 100644
> --- ./Documentation/gpu/automated_testing.rst
> +++ ./Documentation/gpu/automated_testing.rst
> @@ -99,7 +99,8 @@ How to enable automated testing on your tree
>   ============================================
>   
>   1. Create a Linux tree in https://gitlab.freedesktop.org/ if you don't have one
> -yet
> +yet, by forking https://gitlab.freedesktop.org/drm/kernel (this allows GitLab
> +to internally track that these are the same git objects).

Reviewed-by: Vignesh Raman <vignesh.raman@collabora.com>

Regards,
Vignesh

>   
>   2. In your kernel repo's configuration (eg.
>   https://gitlab.freedesktop.org/janedoe/linux/-/settings/ci_cd), change the


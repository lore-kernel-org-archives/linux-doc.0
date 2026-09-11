Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00714486433
	for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 22:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789164571; cv=none; b=J/7Y4W95x4MU77bu9FJB4rQg44z65JuCP0c4VFdU7ltldN7SBtsRlzYLH1pgUu33/bzVEiTH7yI8fsOE687LoNX0LIHszLGpFs671+1xMQxZndGJSvyhS9sbX049wz/Ra/8MxjFFghb2fizTbi4zixmhgMxHeqB1ozqZpP7rR6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789164571; c=relaxed/simple;
	bh=/R8G2rUpeGdvgZtyaJUbEvh1Zo+WC84WR+inH5thUNk=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=TCkic20O6X027D7i4Yk7Ig4AzUgWNtrEZB6CLF/P69JyuhSRCW29oiXBql/6LjeMQXvURi3PL+ms6MCcidnoIstMeIjjJ3q3xMWqgnenJ1p4cUdaXn/wo+9DRY/HOCPmjJCe0Zeoci9aPnrzerQMZl1RfbFo0VkA8NzmIpSPOQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=U9n2bPzD; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="U9n2bPzD"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5300bdf61d9so18921911cf.3
        for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 15:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1789164569; x=1789769369; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=REcGNRrG3IgyeW+W01iwNpi3SPP7pS0X2/2+s4p9Ep8=;
        b=U9n2bPzDNh3hi3J9W0QQ2UNGVEKLaQ/ZwtFwa55+fQNvrZB85ePcVdljoFKIJD5HiG
         XqSjDGbbbQpWzyNtG+BfW/6ChTV64Gg6+M+aovfGzCHDzSa9Ts7WhnSkMY47ChKaX690
         9XHhmKXw+xGf9wZK+vMlmbOkpBWcCVJBjLidyM36XBVySGz49RHGzjZP+7MKF4mjDlb9
         j2fx8w0oVdojWBYygC7GnGpJ89Kmj1HJyKzahe2QtH5KDaMc6hEr1t0h8EJ2tjKtXgNz
         lP/ZP8jkS1Mw1wVadm1lCe0Nu3bxRrtJGJ6Uwm04S/0lXj52vgmByya1AzxeF0GkMh1S
         uegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164569; x=1789769369;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=REcGNRrG3IgyeW+W01iwNpi3SPP7pS0X2/2+s4p9Ep8=;
        b=JjIL0aOrcTGJvePXZRdhacBfODwoZkvgRxww9sXiCL6nQNH1RIdMzXcN8g57VHWq7L
         5hX3pHFoWa5q4N9O4tiPWAGpmR/0FLuN+afidbMoL+14pjoHaZWY+yv2Nwb6o6XGZurH
         WuvSQDrvlp69fpf1GGMTEmJ62zSTQdqvJZiRxWsfu3/1FcX+SyH9lSUFuy79noWpRASk
         frwiwdU72xKeag8EF1wHXI/2WT0+K3qTx+CjGqnLv+QbNUblW/RLbc0SM2abHZJaG5yr
         cx6Dsx9x2UnbKK9sbkt9LNI+JtO/kBjgtiH3kMU5v/bTa7x+HPauZ5jfo40mMhFIns8z
         QTiA==
X-Forwarded-Encrypted: i=1; AKwUvBx7U/kIyPGeUQxu2r+amaszes0titb4L4VJntxG8gRof3uf+sfNvdY+7+VV6C7WPQ01Ww97hLmqZNQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nG0IeekINwvx015tpDRBSsGeYeGgT1PGsI2r1FeT+wImdjsHKZ
	r1guMxHrgZtHwA3KPQ2IkisWpEt8Ac06yOlbwM/CM6pBJ0dNf3Iq6rmY2F6S4FXRfg==
X-Gm-Gg: AYBFou0qBaAt9HioWfpBYzjKfylOryfJFoR0zwW3GxTLYKJpL9uWk/24tyKC4BGheG9
	kAxlxmviXvAFA+JEF8J4jt/aImtNneKJOzmT+EJQiPwxIMB+J9XE658rE4CqkTc27EkGrzi/yT2
	UmhQfxbBGFvAM9wkhaq/E2wIAuUwghHuYEkDSFrsdHNBqyhNDu/KR6eUo4x7sYyv2K3/XpoPQ3H
	FHF3IpFSBz70yCbeoH6vHgErGQI3ayU93raqgWBhVjiYaDCybL23zqe5vvAkxiifJXHpvtchcX3
	wE32aGHWsRK9LzXMfyojCo2Cpd+F7rp8QRPOUG3bSm+cCGD/OeHkNbwbaFmf3AW/XQT6VqgWjiU
	ZRP+PQyuOCm5eLCSvJYba/z0xTMDJXHxTJ5Eg38FViWF35fwU4RJeIYC3LxcwT+6NiWZvw8z0YO
	Bz3JGNYbn1YLdpmwyczDJDLVwp5O+TmF+pcl8loyzLGlFnG/l6MTOm5nGnNtZzeqTXQ4Zpos60Q
	VRKbVThs6/Ya1p2sCyK8DNMfpdZo7BTN0H+BAfLIsaB6ECJlabsr0MmpxtH+EeXChA4IcTX0F+F
X-Received: by 2002:a05:622a:588a:b0:516:dda7:51e0 with SMTP id d75a77b69052e-530c854284emr105918091cf.17.1789164568783;
        Fri, 11 Sep 2026 15:09:28 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca4b9c54sm29928441cf.20.2026.09.11.15.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:09:27 -0700 (PDT)
Date: Fri, 11 Sep 2026 18:09:26 -0400
Message-ID: <7af3da1c32e9b388771aa7406dd42098@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20260911_1254/pstg-lib:20260910_1848/pstg-pwork:20260911_1254
From: Paul Moore <paul@paul-moore.com>
To: Lincoln Wallace <locnnil0@gmail.com>, corbet@lwn.net
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, penguin-kernel@I-love.SAKURA.ne.jp, rdunlap@infradead.org, Lincoln Wallace <locnnil0@gmail.com>
Subject: Re: [PATCH 2/2] doc: LSM: fix module ordering description for  /sys/kernel/security/lsm
References: <20260714013832.977443-3-locnnil0@gmail.com>
In-Reply-To: <20260714013832.977443-3-locnnil0@gmail.com>

On Jul 13, 2026 Lincoln Wallace <locnnil0@gmail.com> wrote:
> 
> The LSM usage document states that the capability module will always
> be first in /sys/kernel/security/lsm, followed by any "minor" modules
> and then the one "major" module.
> 
> This does not match the current LSM infrastructure:
> 
>  - When CONFIG_SECURITY_LOCKDOWN_LSM_EARLY is enabled, lockdown is
>    initialized as an early LSM, before all other modules including
>    capability, and appears first in the list.
> 
>  - The integrity modules (e.g. IMA and EVM) register with
>    LSM_ORDER_LAST and are always placed at the end of the list,
>    regardless of the position of the major module.
> 
>  - The relative order of the remaining modules is not fixed by the
>    framework; it follows CONFIG_LSM or the "lsm=" kernel command
>    line parameter.
> 
> Rewrite the paragraph to describe the actual ordering: lockdown
> first when early lockdown is enabled, capability otherwise,
> integrity modules at the end, and the remaining modules in the
> configured order.
> 
> Signed-off-by: Lincoln Wallace <locnnil0@gmail.com>
> ---
>  Documentation/admin-guide/LSM/index.rst | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)

Merged into lsm/dev, thanks!

--
paul-moore.com
